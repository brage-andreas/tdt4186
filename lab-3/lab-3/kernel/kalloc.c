// Physical memory allocator, for user processes,
// kernel stacks, page-table pages,
// and pipe buffers. Allocates whole 4096-byte pages.

#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "riscv.h"
#include "defs.h"

uint64 MAX_PAGES = 0;
uint64 FREE_PAGES = 0;

uint8 page_ref_count[(PHYSTOP - KERNBASE) / PGSIZE];

void freerange(void *pa_start, void *pa_end);

extern char end[]; // first address after kernel.
                   // defined by kernel.ld.

struct run
{
    struct run *next;
};

struct
{
    struct spinlock lock;
    struct run *freelist;
} kmem;

void kinit()
{
    initlock(&kmem.lock, "kmem");
    freerange(end, (void *)PHYSTOP);
    
    memset(page_ref_count, 0, sizeof(page_ref_count));

    MAX_PAGES = FREE_PAGES;
}

void freerange(void *pa_start, void *pa_end)
{
    char *p;
    p = (char *)PGROUNDUP((uint64)pa_start);
    for (; p + PGSIZE <= (char *)pa_end; p += PGSIZE)
    {
        kfree(p);
    }
}

uint64 kshm_acquire(void *pa)
{
    return page_ref_count[PA2PGRI((uint64)pa)];
}

void kshm_refincr(void *pa)
{
    page_ref_count[PA2PGRI((uint64)pa)]++;
}

void kshm_refdecr(void *pa)
{
    if (kshm_acquire(pa) > 0)
        page_ref_count[PA2PGRI((uint64)pa)]--;

    if (kshm_acquire(pa) != 0) return;
        kshm_free(pa);
}

void kshm_free(void *pa)
{
    // Fill with junk to catch dangling refs.
    memset(pa, 1, PGSIZE);

    struct run *r = (struct run *)pa;

    acquire(&kmem.lock);
    r->next = kmem.freelist;
    kmem.freelist = r;
    FREE_PAGES++;
    release(&kmem.lock);
}

// Free the page of physical memory pointed at by pa,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void kfree(void *pa)
{
    if (MAX_PAGES != 0)
        assert(FREE_PAGES < MAX_PAGES);

    if (((uint64)pa % PGSIZE) != 0 || (char *)pa < end || (uint64)pa >= PHYSTOP)
        panic("kfree");

    kshm_refdecr(pa);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    assert(FREE_PAGES > 0);
    struct run *r;

    acquire(&kmem.lock);
    r = kmem.freelist;
    if (r)
        kmem.freelist = r->next;
    release(&kmem.lock);

    if (r)
    {
        // in case uninitialized memory is used
        memset((char *)r, 5, PGSIZE);
        kshm_refincr((void *)r);
    }
    
    FREE_PAGES--;

    return (void *)r;
}
