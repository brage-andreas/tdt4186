
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	8a813103          	ld	sp,-1880(sp) # 8000b8a8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
#ifndef __ASSEMBLER__

// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

// Physical Memory Protection
static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  return x;
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd9a97>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	60878793          	addi	a5,a5,1544 # 80001802 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	24078793          	addi	a5,a5,576 # f4240 <_entry-0x7ff0bdc0>
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8 # 200bff8 <_entry-0x7dff4008>
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00013717          	auipc	a4,0x13
    800002e8:	60c70713          	addi	a4,a4,1548 # 800138f0 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24 # 2004018 <_entry-0x7dffbfe8>
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	00008797          	auipc	a5,0x8
    8000032c:	51878793          	addi	a5,a5,1304 # 80008840 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf(), and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	ab6080e7          	jalr	-1354(ra) # 80000e4a <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aaa080e7          	jalr	-1366(ra) # 80000e4a <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	aa0080e7          	jalr	-1376(ra) # 80000e4a <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a90080e7          	jalr	-1392(ra) # 80000e4a <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00003097          	auipc	ra,0x3
    8000040a:	29a080e7          	jalr	666(ra) # 800036a0 <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70963          	beq	a4,a5,80000446 <consolewrite+0x7a>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	96c080e7          	jalr	-1684(ra) # 80000d8c <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42783          	lw	a5,-20(s0)
    80000436:	873e                	mv	a4,a5
    80000438:	fd842783          	lw	a5,-40(s0)
    8000043c:	2701                	sext.w	a4,a4
    8000043e:	2781                	sext.w	a5,a5
    80000440:	faf746e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000444:	a011                	j	80000448 <consolewrite+0x7c>
      break;
    80000446:	0001                	nop
  }

  return i;
    80000448:	fec42783          	lw	a5,-20(s0)
}
    8000044c:	853e                	mv	a0,a5
    8000044e:	70a2                	ld	ra,40(sp)
    80000450:	7402                	ld	s0,32(sp)
    80000452:	6145                	addi	sp,sp,48
    80000454:	8082                	ret

0000000080000456 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000456:	7179                	addi	sp,sp,-48
    80000458:	f406                	sd	ra,40(sp)
    8000045a:	f022                	sd	s0,32(sp)
    8000045c:	1800                	addi	s0,sp,48
    8000045e:	87aa                	mv	a5,a0
    80000460:	fcb43823          	sd	a1,-48(s0)
    80000464:	8732                	mv	a4,a2
    80000466:	fcf42e23          	sw	a5,-36(s0)
    8000046a:	87ba                	mv	a5,a4
    8000046c:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    80000470:	fd842783          	lw	a5,-40(s0)
    80000474:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000478:	00013517          	auipc	a0,0x13
    8000047c:	5b850513          	addi	a0,a0,1464 # 80013a30 <cons>
    80000480:	00001097          	auipc	ra,0x1
    80000484:	df8080e7          	jalr	-520(ra) # 80001278 <acquire>
  while(n > 0){
    80000488:	a23d                	j	800005b6 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    8000048a:	00002097          	auipc	ra,0x2
    8000048e:	3b6080e7          	jalr	950(ra) # 80002840 <myproc>
    80000492:	87aa                	mv	a5,a0
    80000494:	853e                	mv	a0,a5
    80000496:	00003097          	auipc	ra,0x3
    8000049a:	156080e7          	jalr	342(ra) # 800035ec <killed>
    8000049e:	87aa                	mv	a5,a0
    800004a0:	cb99                	beqz	a5,800004b6 <consoleread+0x60>
        release(&cons.lock);
    800004a2:	00013517          	auipc	a0,0x13
    800004a6:	58e50513          	addi	a0,a0,1422 # 80013a30 <cons>
    800004aa:	00001097          	auipc	ra,0x1
    800004ae:	e32080e7          	jalr	-462(ra) # 800012dc <release>
        return -1;
    800004b2:	57fd                	li	a5,-1
    800004b4:	aa25                	j	800005ec <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b6:	00013597          	auipc	a1,0x13
    800004ba:	57a58593          	addi	a1,a1,1402 # 80013a30 <cons>
    800004be:	00013517          	auipc	a0,0x13
    800004c2:	60a50513          	addi	a0,a0,1546 # 80013ac8 <cons+0x98>
    800004c6:	00003097          	auipc	ra,0x3
    800004ca:	f3c080e7          	jalr	-196(ra) # 80003402 <sleep>
    while(cons.r == cons.w){
    800004ce:	00013797          	auipc	a5,0x13
    800004d2:	56278793          	addi	a5,a5,1378 # 80013a30 <cons>
    800004d6:	0987a703          	lw	a4,152(a5)
    800004da:	00013797          	auipc	a5,0x13
    800004de:	55678793          	addi	a5,a5,1366 # 80013a30 <cons>
    800004e2:	09c7a783          	lw	a5,156(a5)
    800004e6:	faf702e3          	beq	a4,a5,8000048a <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004ea:	00013797          	auipc	a5,0x13
    800004ee:	54678793          	addi	a5,a5,1350 # 80013a30 <cons>
    800004f2:	0987a783          	lw	a5,152(a5)
    800004f6:	2781                	sext.w	a5,a5
    800004f8:	0017871b          	addiw	a4,a5,1
    800004fc:	0007069b          	sext.w	a3,a4
    80000500:	00013717          	auipc	a4,0x13
    80000504:	53070713          	addi	a4,a4,1328 # 80013a30 <cons>
    80000508:	08d72c23          	sw	a3,152(a4)
    8000050c:	07f7f793          	andi	a5,a5,127
    80000510:	2781                	sext.w	a5,a5
    80000512:	00013717          	auipc	a4,0x13
    80000516:	51e70713          	addi	a4,a4,1310 # 80013a30 <cons>
    8000051a:	1782                	slli	a5,a5,0x20
    8000051c:	9381                	srli	a5,a5,0x20
    8000051e:	97ba                	add	a5,a5,a4
    80000520:	0187c783          	lbu	a5,24(a5)
    80000524:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    80000528:	fe842783          	lw	a5,-24(s0)
    8000052c:	0007871b          	sext.w	a4,a5
    80000530:	4791                	li	a5,4
    80000532:	02f71963          	bne	a4,a5,80000564 <consoleread+0x10e>
      if(n < target){
    80000536:	fd842703          	lw	a4,-40(s0)
    8000053a:	fec42783          	lw	a5,-20(s0)
    8000053e:	2781                	sext.w	a5,a5
    80000540:	08f77163          	bgeu	a4,a5,800005c2 <consoleread+0x16c>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000544:	00013797          	auipc	a5,0x13
    80000548:	4ec78793          	addi	a5,a5,1260 # 80013a30 <cons>
    8000054c:	0987a783          	lw	a5,152(a5)
    80000550:	37fd                	addiw	a5,a5,-1
    80000552:	0007871b          	sext.w	a4,a5
    80000556:	00013797          	auipc	a5,0x13
    8000055a:	4da78793          	addi	a5,a5,1242 # 80013a30 <cons>
    8000055e:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000562:	a085                	j	800005c2 <consoleread+0x16c>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000564:	fe842783          	lw	a5,-24(s0)
    80000568:	0ff7f793          	zext.b	a5,a5
    8000056c:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000570:	fe740713          	addi	a4,s0,-25
    80000574:	fdc42783          	lw	a5,-36(s0)
    80000578:	4685                	li	a3,1
    8000057a:	863a                	mv	a2,a4
    8000057c:	fd043583          	ld	a1,-48(s0)
    80000580:	853e                	mv	a0,a5
    80000582:	00003097          	auipc	ra,0x3
    80000586:	0aa080e7          	jalr	170(ra) # 8000362c <either_copyout>
    8000058a:	87aa                	mv	a5,a0
    8000058c:	873e                	mv	a4,a5
    8000058e:	57fd                	li	a5,-1
    80000590:	02f70b63          	beq	a4,a5,800005c6 <consoleread+0x170>
      break;

    dst++;
    80000594:	fd043783          	ld	a5,-48(s0)
    80000598:	0785                	addi	a5,a5,1
    8000059a:	fcf43823          	sd	a5,-48(s0)
    --n;
    8000059e:	fd842783          	lw	a5,-40(s0)
    800005a2:	37fd                	addiw	a5,a5,-1
    800005a4:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    800005a8:	fe842783          	lw	a5,-24(s0)
    800005ac:	0007871b          	sext.w	a4,a5
    800005b0:	47a9                	li	a5,10
    800005b2:	00f70c63          	beq	a4,a5,800005ca <consoleread+0x174>
  while(n > 0){
    800005b6:	fd842783          	lw	a5,-40(s0)
    800005ba:	2781                	sext.w	a5,a5
    800005bc:	f0f049e3          	bgtz	a5,800004ce <consoleread+0x78>
    800005c0:	a031                	j	800005cc <consoleread+0x176>
      break;
    800005c2:	0001                	nop
    800005c4:	a021                	j	800005cc <consoleread+0x176>
      break;
    800005c6:	0001                	nop
    800005c8:	a011                	j	800005cc <consoleread+0x176>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005ca:	0001                	nop
    }
  }
  release(&cons.lock);
    800005cc:	00013517          	auipc	a0,0x13
    800005d0:	46450513          	addi	a0,a0,1124 # 80013a30 <cons>
    800005d4:	00001097          	auipc	ra,0x1
    800005d8:	d08080e7          	jalr	-760(ra) # 800012dc <release>

  return target - n;
    800005dc:	fd842783          	lw	a5,-40(s0)
    800005e0:	fec42703          	lw	a4,-20(s0)
    800005e4:	40f707bb          	subw	a5,a4,a5
    800005e8:	2781                	sext.w	a5,a5
    800005ea:	2781                	sext.w	a5,a5
}
    800005ec:	853e                	mv	a0,a5
    800005ee:	70a2                	ld	ra,40(sp)
    800005f0:	7402                	ld	s0,32(sp)
    800005f2:	6145                	addi	sp,sp,48
    800005f4:	8082                	ret

00000000800005f6 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005f6:	1101                	addi	sp,sp,-32
    800005f8:	ec06                	sd	ra,24(sp)
    800005fa:	e822                	sd	s0,16(sp)
    800005fc:	1000                	addi	s0,sp,32
    800005fe:	87aa                	mv	a5,a0
    80000600:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000604:	00013517          	auipc	a0,0x13
    80000608:	42c50513          	addi	a0,a0,1068 # 80013a30 <cons>
    8000060c:	00001097          	auipc	ra,0x1
    80000610:	c6c080e7          	jalr	-916(ra) # 80001278 <acquire>

  switch(c){
    80000614:	fec42783          	lw	a5,-20(s0)
    80000618:	0007871b          	sext.w	a4,a5
    8000061c:	07f00793          	li	a5,127
    80000620:	0cf70763          	beq	a4,a5,800006ee <consoleintr+0xf8>
    80000624:	fec42783          	lw	a5,-20(s0)
    80000628:	0007871b          	sext.w	a4,a5
    8000062c:	07f00793          	li	a5,127
    80000630:	10e7c363          	blt	a5,a4,80000736 <consoleintr+0x140>
    80000634:	fec42783          	lw	a5,-20(s0)
    80000638:	0007871b          	sext.w	a4,a5
    8000063c:	47d5                	li	a5,21
    8000063e:	06f70163          	beq	a4,a5,800006a0 <consoleintr+0xaa>
    80000642:	fec42783          	lw	a5,-20(s0)
    80000646:	0007871b          	sext.w	a4,a5
    8000064a:	47d5                	li	a5,21
    8000064c:	0ee7c563          	blt	a5,a4,80000736 <consoleintr+0x140>
    80000650:	fec42783          	lw	a5,-20(s0)
    80000654:	0007871b          	sext.w	a4,a5
    80000658:	47a1                	li	a5,8
    8000065a:	08f70a63          	beq	a4,a5,800006ee <consoleintr+0xf8>
    8000065e:	fec42783          	lw	a5,-20(s0)
    80000662:	0007871b          	sext.w	a4,a5
    80000666:	47c1                	li	a5,16
    80000668:	0cf71763          	bne	a4,a5,80000736 <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    8000066c:	00003097          	auipc	ra,0x3
    80000670:	0a8080e7          	jalr	168(ra) # 80003714 <procdump>
    break;
    80000674:	aad9                	j	8000084a <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000676:	00013797          	auipc	a5,0x13
    8000067a:	3ba78793          	addi	a5,a5,954 # 80013a30 <cons>
    8000067e:	0a07a783          	lw	a5,160(a5)
    80000682:	37fd                	addiw	a5,a5,-1
    80000684:	0007871b          	sext.w	a4,a5
    80000688:	00013797          	auipc	a5,0x13
    8000068c:	3a878793          	addi	a5,a5,936 # 80013a30 <cons>
    80000690:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000694:	10000513          	li	a0,256
    80000698:	00000097          	auipc	ra,0x0
    8000069c:	cdc080e7          	jalr	-804(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    800006a0:	00013797          	auipc	a5,0x13
    800006a4:	39078793          	addi	a5,a5,912 # 80013a30 <cons>
    800006a8:	0a07a703          	lw	a4,160(a5)
    800006ac:	00013797          	auipc	a5,0x13
    800006b0:	38478793          	addi	a5,a5,900 # 80013a30 <cons>
    800006b4:	09c7a783          	lw	a5,156(a5)
    800006b8:	18f70463          	beq	a4,a5,80000840 <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006bc:	00013797          	auipc	a5,0x13
    800006c0:	37478793          	addi	a5,a5,884 # 80013a30 <cons>
    800006c4:	0a07a783          	lw	a5,160(a5)
    800006c8:	37fd                	addiw	a5,a5,-1
    800006ca:	2781                	sext.w	a5,a5
    800006cc:	07f7f793          	andi	a5,a5,127
    800006d0:	2781                	sext.w	a5,a5
    800006d2:	00013717          	auipc	a4,0x13
    800006d6:	35e70713          	addi	a4,a4,862 # 80013a30 <cons>
    800006da:	1782                	slli	a5,a5,0x20
    800006dc:	9381                	srli	a5,a5,0x20
    800006de:	97ba                	add	a5,a5,a4
    800006e0:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006e4:	873e                	mv	a4,a5
    800006e6:	47a9                	li	a5,10
    800006e8:	f8f717e3          	bne	a4,a5,80000676 <consoleintr+0x80>
    }
    break;
    800006ec:	aa91                	j	80000840 <consoleintr+0x24a>
  case C('H'): // Backspace
  case '\x7f': // Delete key
    if(cons.e != cons.w){
    800006ee:	00013797          	auipc	a5,0x13
    800006f2:	34278793          	addi	a5,a5,834 # 80013a30 <cons>
    800006f6:	0a07a703          	lw	a4,160(a5)
    800006fa:	00013797          	auipc	a5,0x13
    800006fe:	33678793          	addi	a5,a5,822 # 80013a30 <cons>
    80000702:	09c7a783          	lw	a5,156(a5)
    80000706:	12f70f63          	beq	a4,a5,80000844 <consoleintr+0x24e>
      cons.e--;
    8000070a:	00013797          	auipc	a5,0x13
    8000070e:	32678793          	addi	a5,a5,806 # 80013a30 <cons>
    80000712:	0a07a783          	lw	a5,160(a5)
    80000716:	37fd                	addiw	a5,a5,-1
    80000718:	0007871b          	sext.w	a4,a5
    8000071c:	00013797          	auipc	a5,0x13
    80000720:	31478793          	addi	a5,a5,788 # 80013a30 <cons>
    80000724:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000728:	10000513          	li	a0,256
    8000072c:	00000097          	auipc	ra,0x0
    80000730:	c48080e7          	jalr	-952(ra) # 80000374 <consputc>
    }
    break;
    80000734:	aa01                	j	80000844 <consoleintr+0x24e>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF_SIZE){
    80000736:	fec42783          	lw	a5,-20(s0)
    8000073a:	2781                	sext.w	a5,a5
    8000073c:	10078663          	beqz	a5,80000848 <consoleintr+0x252>
    80000740:	00013797          	auipc	a5,0x13
    80000744:	2f078793          	addi	a5,a5,752 # 80013a30 <cons>
    80000748:	0a07a703          	lw	a4,160(a5)
    8000074c:	00013797          	auipc	a5,0x13
    80000750:	2e478793          	addi	a5,a5,740 # 80013a30 <cons>
    80000754:	0987a783          	lw	a5,152(a5)
    80000758:	40f707bb          	subw	a5,a4,a5
    8000075c:	2781                	sext.w	a5,a5
    8000075e:	873e                	mv	a4,a5
    80000760:	07f00793          	li	a5,127
    80000764:	0ee7e263          	bltu	a5,a4,80000848 <consoleintr+0x252>
      c = (c == '\r') ? '\n' : c;
    80000768:	fec42783          	lw	a5,-20(s0)
    8000076c:	0007871b          	sext.w	a4,a5
    80000770:	47b5                	li	a5,13
    80000772:	00f70563          	beq	a4,a5,8000077c <consoleintr+0x186>
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	a011                	j	8000077e <consoleintr+0x188>
    8000077c:	47a9                	li	a5,10
    8000077e:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000782:	fec42783          	lw	a5,-20(s0)
    80000786:	853e                	mv	a0,a5
    80000788:	00000097          	auipc	ra,0x0
    8000078c:	bec080e7          	jalr	-1044(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
    80000790:	00013797          	auipc	a5,0x13
    80000794:	2a078793          	addi	a5,a5,672 # 80013a30 <cons>
    80000798:	0a07a783          	lw	a5,160(a5)
    8000079c:	2781                	sext.w	a5,a5
    8000079e:	0017871b          	addiw	a4,a5,1
    800007a2:	0007069b          	sext.w	a3,a4
    800007a6:	00013717          	auipc	a4,0x13
    800007aa:	28a70713          	addi	a4,a4,650 # 80013a30 <cons>
    800007ae:	0ad72023          	sw	a3,160(a4)
    800007b2:	07f7f793          	andi	a5,a5,127
    800007b6:	2781                	sext.w	a5,a5
    800007b8:	fec42703          	lw	a4,-20(s0)
    800007bc:	0ff77713          	zext.b	a4,a4
    800007c0:	00013697          	auipc	a3,0x13
    800007c4:	27068693          	addi	a3,a3,624 # 80013a30 <cons>
    800007c8:	1782                	slli	a5,a5,0x20
    800007ca:	9381                	srli	a5,a5,0x20
    800007cc:	97b6                	add	a5,a5,a3
    800007ce:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e-cons.r == INPUT_BUF_SIZE){
    800007d2:	fec42783          	lw	a5,-20(s0)
    800007d6:	0007871b          	sext.w	a4,a5
    800007da:	47a9                	li	a5,10
    800007dc:	02f70d63          	beq	a4,a5,80000816 <consoleintr+0x220>
    800007e0:	fec42783          	lw	a5,-20(s0)
    800007e4:	0007871b          	sext.w	a4,a5
    800007e8:	4791                	li	a5,4
    800007ea:	02f70663          	beq	a4,a5,80000816 <consoleintr+0x220>
    800007ee:	00013797          	auipc	a5,0x13
    800007f2:	24278793          	addi	a5,a5,578 # 80013a30 <cons>
    800007f6:	0a07a703          	lw	a4,160(a5)
    800007fa:	00013797          	auipc	a5,0x13
    800007fe:	23678793          	addi	a5,a5,566 # 80013a30 <cons>
    80000802:	0987a783          	lw	a5,152(a5)
    80000806:	40f707bb          	subw	a5,a4,a5
    8000080a:	2781                	sext.w	a5,a5
    8000080c:	873e                	mv	a4,a5
    8000080e:	08000793          	li	a5,128
    80000812:	02f71b63          	bne	a4,a5,80000848 <consoleintr+0x252>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000816:	00013797          	auipc	a5,0x13
    8000081a:	21a78793          	addi	a5,a5,538 # 80013a30 <cons>
    8000081e:	0a07a703          	lw	a4,160(a5)
    80000822:	00013797          	auipc	a5,0x13
    80000826:	20e78793          	addi	a5,a5,526 # 80013a30 <cons>
    8000082a:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082e:	00013517          	auipc	a0,0x13
    80000832:	29a50513          	addi	a0,a0,666 # 80013ac8 <cons+0x98>
    80000836:	00003097          	auipc	ra,0x3
    8000083a:	c48080e7          	jalr	-952(ra) # 8000347e <wakeup>
      }
    }
    break;
    8000083e:	a029                	j	80000848 <consoleintr+0x252>
    break;
    80000840:	0001                	nop
    80000842:	a021                	j	8000084a <consoleintr+0x254>
    break;
    80000844:	0001                	nop
    80000846:	a011                	j	8000084a <consoleintr+0x254>
    break;
    80000848:	0001                	nop
  }
  
  release(&cons.lock);
    8000084a:	00013517          	auipc	a0,0x13
    8000084e:	1e650513          	addi	a0,a0,486 # 80013a30 <cons>
    80000852:	00001097          	auipc	ra,0x1
    80000856:	a8a080e7          	jalr	-1398(ra) # 800012dc <release>
}
    8000085a:	0001                	nop
    8000085c:	60e2                	ld	ra,24(sp)
    8000085e:	6442                	ld	s0,16(sp)
    80000860:	6105                	addi	sp,sp,32
    80000862:	8082                	ret

0000000080000864 <consoleinit>:

void
consoleinit(void)
{
    80000864:	1141                	addi	sp,sp,-16
    80000866:	e406                	sd	ra,8(sp)
    80000868:	e022                	sd	s0,0(sp)
    8000086a:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000086c:	0000a597          	auipc	a1,0xa
    80000870:	79458593          	addi	a1,a1,1940 # 8000b000 <etext>
    80000874:	00013517          	auipc	a0,0x13
    80000878:	1bc50513          	addi	a0,a0,444 # 80013a30 <cons>
    8000087c:	00001097          	auipc	ra,0x1
    80000880:	9cc080e7          	jalr	-1588(ra) # 80001248 <initlock>

  uartinit();
    80000884:	00000097          	auipc	ra,0x0
    80000888:	48e080e7          	jalr	1166(ra) # 80000d12 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000088c:	00023797          	auipc	a5,0x23
    80000890:	34478793          	addi	a5,a5,836 # 80023bd0 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	bc270713          	addi	a4,a4,-1086 # 80000456 <consoleread>
    8000089c:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089e:	00023797          	auipc	a5,0x23
    800008a2:	33278793          	addi	a5,a5,818 # 80023bd0 <devsw>
    800008a6:	00000717          	auipc	a4,0x0
    800008aa:	b2670713          	addi	a4,a4,-1242 # 800003cc <consolewrite>
    800008ae:	ef98                	sd	a4,24(a5)
}
    800008b0:	0001                	nop
    800008b2:	60a2                	ld	ra,8(sp)
    800008b4:	6402                	ld	s0,0(sp)
    800008b6:	0141                	addi	sp,sp,16
    800008b8:	8082                	ret

00000000800008ba <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008ba:	7139                	addi	sp,sp,-64
    800008bc:	fc06                	sd	ra,56(sp)
    800008be:	f822                	sd	s0,48(sp)
    800008c0:	0080                	addi	s0,sp,64
    800008c2:	87aa                	mv	a5,a0
    800008c4:	86ae                	mv	a3,a1
    800008c6:	8732                	mv	a4,a2
    800008c8:	fcf42623          	sw	a5,-52(s0)
    800008cc:	87b6                	mv	a5,a3
    800008ce:	fcf42423          	sw	a5,-56(s0)
    800008d2:	87ba                	mv	a5,a4
    800008d4:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008d8:	fc442783          	lw	a5,-60(s0)
    800008dc:	2781                	sext.w	a5,a5
    800008de:	c78d                	beqz	a5,80000908 <printint+0x4e>
    800008e0:	fcc42783          	lw	a5,-52(s0)
    800008e4:	01f7d79b          	srliw	a5,a5,0x1f
    800008e8:	0ff7f793          	zext.b	a5,a5
    800008ec:	fcf42223          	sw	a5,-60(s0)
    800008f0:	fc442783          	lw	a5,-60(s0)
    800008f4:	2781                	sext.w	a5,a5
    800008f6:	cb89                	beqz	a5,80000908 <printint+0x4e>
    x = -xx;
    800008f8:	fcc42783          	lw	a5,-52(s0)
    800008fc:	40f007bb          	negw	a5,a5
    80000900:	2781                	sext.w	a5,a5
    80000902:	fef42423          	sw	a5,-24(s0)
    80000906:	a029                	j	80000910 <printint+0x56>
  else
    x = xx;
    80000908:	fcc42783          	lw	a5,-52(s0)
    8000090c:	fef42423          	sw	a5,-24(s0)

  i = 0;
    80000910:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000914:	fc842783          	lw	a5,-56(s0)
    80000918:	fe842703          	lw	a4,-24(s0)
    8000091c:	02f777bb          	remuw	a5,a4,a5
    80000920:	0007861b          	sext.w	a2,a5
    80000924:	fec42783          	lw	a5,-20(s0)
    80000928:	0017871b          	addiw	a4,a5,1
    8000092c:	fee42623          	sw	a4,-20(s0)
    80000930:	0000b697          	auipc	a3,0xb
    80000934:	e4068693          	addi	a3,a3,-448 # 8000b770 <digits>
    80000938:	02061713          	slli	a4,a2,0x20
    8000093c:	9301                	srli	a4,a4,0x20
    8000093e:	9736                	add	a4,a4,a3
    80000940:	00074703          	lbu	a4,0(a4)
    80000944:	17c1                	addi	a5,a5,-16
    80000946:	97a2                	add	a5,a5,s0
    80000948:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000094c:	fc842783          	lw	a5,-56(s0)
    80000950:	fe842703          	lw	a4,-24(s0)
    80000954:	02f757bb          	divuw	a5,a4,a5
    80000958:	fef42423          	sw	a5,-24(s0)
    8000095c:	fe842783          	lw	a5,-24(s0)
    80000960:	2781                	sext.w	a5,a5
    80000962:	fbcd                	bnez	a5,80000914 <printint+0x5a>

  if(sign)
    80000964:	fc442783          	lw	a5,-60(s0)
    80000968:	2781                	sext.w	a5,a5
    8000096a:	cb95                	beqz	a5,8000099e <printint+0xe4>
    buf[i++] = '-';
    8000096c:	fec42783          	lw	a5,-20(s0)
    80000970:	0017871b          	addiw	a4,a5,1
    80000974:	fee42623          	sw	a4,-20(s0)
    80000978:	17c1                	addi	a5,a5,-16
    8000097a:	97a2                	add	a5,a5,s0
    8000097c:	02d00713          	li	a4,45
    80000980:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000984:	a829                	j	8000099e <printint+0xe4>
    consputc(buf[i]);
    80000986:	fec42783          	lw	a5,-20(s0)
    8000098a:	17c1                	addi	a5,a5,-16
    8000098c:	97a2                	add	a5,a5,s0
    8000098e:	fe87c783          	lbu	a5,-24(a5)
    80000992:	2781                	sext.w	a5,a5
    80000994:	853e                	mv	a0,a5
    80000996:	00000097          	auipc	ra,0x0
    8000099a:	9de080e7          	jalr	-1570(ra) # 80000374 <consputc>
  while(--i >= 0)
    8000099e:	fec42783          	lw	a5,-20(s0)
    800009a2:	37fd                	addiw	a5,a5,-1
    800009a4:	fef42623          	sw	a5,-20(s0)
    800009a8:	fec42783          	lw	a5,-20(s0)
    800009ac:	2781                	sext.w	a5,a5
    800009ae:	fc07dce3          	bgez	a5,80000986 <printint+0xcc>
}
    800009b2:	0001                	nop
    800009b4:	0001                	nop
    800009b6:	70e2                	ld	ra,56(sp)
    800009b8:	7442                	ld	s0,48(sp)
    800009ba:	6121                	addi	sp,sp,64
    800009bc:	8082                	ret

00000000800009be <printptr>:

static void
printptr(uint64 x)
{
    800009be:	7179                	addi	sp,sp,-48
    800009c0:	f406                	sd	ra,40(sp)
    800009c2:	f022                	sd	s0,32(sp)
    800009c4:	1800                	addi	s0,sp,48
    800009c6:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009ca:	03000513          	li	a0,48
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  consputc('x');
    800009d6:	07800513          	li	a0,120
    800009da:	00000097          	auipc	ra,0x0
    800009de:	99a080e7          	jalr	-1638(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009e2:	fe042623          	sw	zero,-20(s0)
    800009e6:	a81d                	j	80000a1c <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009e8:	fd843783          	ld	a5,-40(s0)
    800009ec:	93f1                	srli	a5,a5,0x3c
    800009ee:	0000b717          	auipc	a4,0xb
    800009f2:	d8270713          	addi	a4,a4,-638 # 8000b770 <digits>
    800009f6:	97ba                	add	a5,a5,a4
    800009f8:	0007c783          	lbu	a5,0(a5)
    800009fc:	2781                	sext.w	a5,a5
    800009fe:	853e                	mv	a0,a5
    80000a00:	00000097          	auipc	ra,0x0
    80000a04:	974080e7          	jalr	-1676(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80000a08:	fec42783          	lw	a5,-20(s0)
    80000a0c:	2785                	addiw	a5,a5,1
    80000a0e:	fef42623          	sw	a5,-20(s0)
    80000a12:	fd843783          	ld	a5,-40(s0)
    80000a16:	0792                	slli	a5,a5,0x4
    80000a18:	fcf43c23          	sd	a5,-40(s0)
    80000a1c:	fec42783          	lw	a5,-20(s0)
    80000a20:	873e                	mv	a4,a5
    80000a22:	47bd                	li	a5,15
    80000a24:	fce7f2e3          	bgeu	a5,a4,800009e8 <printptr+0x2a>
}
    80000a28:	0001                	nop
    80000a2a:	0001                	nop
    80000a2c:	70a2                	ld	ra,40(sp)
    80000a2e:	7402                	ld	s0,32(sp)
    80000a30:	6145                	addi	sp,sp,48
    80000a32:	8082                	ret

0000000080000a34 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a34:	7119                	addi	sp,sp,-128
    80000a36:	fc06                	sd	ra,56(sp)
    80000a38:	f822                	sd	s0,48(sp)
    80000a3a:	0080                	addi	s0,sp,64
    80000a3c:	fca43423          	sd	a0,-56(s0)
    80000a40:	e40c                	sd	a1,8(s0)
    80000a42:	e810                	sd	a2,16(s0)
    80000a44:	ec14                	sd	a3,24(s0)
    80000a46:	f018                	sd	a4,32(s0)
    80000a48:	f41c                	sd	a5,40(s0)
    80000a4a:	03043823          	sd	a6,48(s0)
    80000a4e:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a52:	00013797          	auipc	a5,0x13
    80000a56:	08678793          	addi	a5,a5,134 # 80013ad8 <pr>
    80000a5a:	4f9c                	lw	a5,24(a5)
    80000a5c:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a60:	fdc42783          	lw	a5,-36(s0)
    80000a64:	2781                	sext.w	a5,a5
    80000a66:	cb89                	beqz	a5,80000a78 <printf+0x44>
    acquire(&pr.lock);
    80000a68:	00013517          	auipc	a0,0x13
    80000a6c:	07050513          	addi	a0,a0,112 # 80013ad8 <pr>
    80000a70:	00001097          	auipc	ra,0x1
    80000a74:	808080e7          	jalr	-2040(ra) # 80001278 <acquire>

  if (fmt == 0)
    80000a78:	fc843783          	ld	a5,-56(s0)
    80000a7c:	eb89                	bnez	a5,80000a8e <printf+0x5a>
    panic("null fmt");
    80000a7e:	0000a517          	auipc	a0,0xa
    80000a82:	58a50513          	addi	a0,a0,1418 # 8000b008 <etext+0x8>
    80000a86:	00000097          	auipc	ra,0x0
    80000a8a:	204080e7          	jalr	516(ra) # 80000c8a <panic>

  va_start(ap, fmt);
    80000a8e:	04040793          	addi	a5,s0,64
    80000a92:	fcf43023          	sd	a5,-64(s0)
    80000a96:	fc043783          	ld	a5,-64(s0)
    80000a9a:	fc878793          	addi	a5,a5,-56
    80000a9e:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000aa2:	fe042623          	sw	zero,-20(s0)
    80000aa6:	a24d                	j	80000c48 <printf+0x214>
    if(c != '%'){
    80000aa8:	fd842783          	lw	a5,-40(s0)
    80000aac:	0007871b          	sext.w	a4,a5
    80000ab0:	02500793          	li	a5,37
    80000ab4:	00f70a63          	beq	a4,a5,80000ac8 <printf+0x94>
      consputc(c);
    80000ab8:	fd842783          	lw	a5,-40(s0)
    80000abc:	853e                	mv	a0,a5
    80000abe:	00000097          	auipc	ra,0x0
    80000ac2:	8b6080e7          	jalr	-1866(ra) # 80000374 <consputc>
      continue;
    80000ac6:	aaa5                	j	80000c3e <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000ac8:	fec42783          	lw	a5,-20(s0)
    80000acc:	2785                	addiw	a5,a5,1
    80000ace:	fef42623          	sw	a5,-20(s0)
    80000ad2:	fec42783          	lw	a5,-20(s0)
    80000ad6:	fc843703          	ld	a4,-56(s0)
    80000ada:	97ba                	add	a5,a5,a4
    80000adc:	0007c783          	lbu	a5,0(a5)
    80000ae0:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ae4:	fd842783          	lw	a5,-40(s0)
    80000ae8:	2781                	sext.w	a5,a5
    80000aea:	16078e63          	beqz	a5,80000c66 <printf+0x232>
      break;
    switch(c){
    80000aee:	fd842783          	lw	a5,-40(s0)
    80000af2:	0007871b          	sext.w	a4,a5
    80000af6:	07800793          	li	a5,120
    80000afa:	08f70963          	beq	a4,a5,80000b8c <printf+0x158>
    80000afe:	fd842783          	lw	a5,-40(s0)
    80000b02:	0007871b          	sext.w	a4,a5
    80000b06:	07800793          	li	a5,120
    80000b0a:	10e7cc63          	blt	a5,a4,80000c22 <printf+0x1ee>
    80000b0e:	fd842783          	lw	a5,-40(s0)
    80000b12:	0007871b          	sext.w	a4,a5
    80000b16:	07300793          	li	a5,115
    80000b1a:	0af70563          	beq	a4,a5,80000bc4 <printf+0x190>
    80000b1e:	fd842783          	lw	a5,-40(s0)
    80000b22:	0007871b          	sext.w	a4,a5
    80000b26:	07300793          	li	a5,115
    80000b2a:	0ee7cc63          	blt	a5,a4,80000c22 <printf+0x1ee>
    80000b2e:	fd842783          	lw	a5,-40(s0)
    80000b32:	0007871b          	sext.w	a4,a5
    80000b36:	07000793          	li	a5,112
    80000b3a:	06f70863          	beq	a4,a5,80000baa <printf+0x176>
    80000b3e:	fd842783          	lw	a5,-40(s0)
    80000b42:	0007871b          	sext.w	a4,a5
    80000b46:	07000793          	li	a5,112
    80000b4a:	0ce7cc63          	blt	a5,a4,80000c22 <printf+0x1ee>
    80000b4e:	fd842783          	lw	a5,-40(s0)
    80000b52:	0007871b          	sext.w	a4,a5
    80000b56:	02500793          	li	a5,37
    80000b5a:	0af70d63          	beq	a4,a5,80000c14 <printf+0x1e0>
    80000b5e:	fd842783          	lw	a5,-40(s0)
    80000b62:	0007871b          	sext.w	a4,a5
    80000b66:	06400793          	li	a5,100
    80000b6a:	0af71c63          	bne	a4,a5,80000c22 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b6e:	fd043783          	ld	a5,-48(s0)
    80000b72:	00878713          	addi	a4,a5,8
    80000b76:	fce43823          	sd	a4,-48(s0)
    80000b7a:	439c                	lw	a5,0(a5)
    80000b7c:	4605                	li	a2,1
    80000b7e:	45a9                	li	a1,10
    80000b80:	853e                	mv	a0,a5
    80000b82:	00000097          	auipc	ra,0x0
    80000b86:	d38080e7          	jalr	-712(ra) # 800008ba <printint>
      break;
    80000b8a:	a855                	j	80000c3e <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b8c:	fd043783          	ld	a5,-48(s0)
    80000b90:	00878713          	addi	a4,a5,8
    80000b94:	fce43823          	sd	a4,-48(s0)
    80000b98:	439c                	lw	a5,0(a5)
    80000b9a:	4605                	li	a2,1
    80000b9c:	45c1                	li	a1,16
    80000b9e:	853e                	mv	a0,a5
    80000ba0:	00000097          	auipc	ra,0x0
    80000ba4:	d1a080e7          	jalr	-742(ra) # 800008ba <printint>
      break;
    80000ba8:	a859                	j	80000c3e <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000baa:	fd043783          	ld	a5,-48(s0)
    80000bae:	00878713          	addi	a4,a5,8
    80000bb2:	fce43823          	sd	a4,-48(s0)
    80000bb6:	639c                	ld	a5,0(a5)
    80000bb8:	853e                	mv	a0,a5
    80000bba:	00000097          	auipc	ra,0x0
    80000bbe:	e04080e7          	jalr	-508(ra) # 800009be <printptr>
      break;
    80000bc2:	a8b5                	j	80000c3e <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bc4:	fd043783          	ld	a5,-48(s0)
    80000bc8:	00878713          	addi	a4,a5,8
    80000bcc:	fce43823          	sd	a4,-48(s0)
    80000bd0:	639c                	ld	a5,0(a5)
    80000bd2:	fef43023          	sd	a5,-32(s0)
    80000bd6:	fe043783          	ld	a5,-32(s0)
    80000bda:	e79d                	bnez	a5,80000c08 <printf+0x1d4>
        s = "(null)";
    80000bdc:	0000a797          	auipc	a5,0xa
    80000be0:	43c78793          	addi	a5,a5,1084 # 8000b018 <etext+0x18>
    80000be4:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000be8:	a005                	j	80000c08 <printf+0x1d4>
        consputc(*s);
    80000bea:	fe043783          	ld	a5,-32(s0)
    80000bee:	0007c783          	lbu	a5,0(a5)
    80000bf2:	2781                	sext.w	a5,a5
    80000bf4:	853e                	mv	a0,a5
    80000bf6:	fffff097          	auipc	ra,0xfffff
    80000bfa:	77e080e7          	jalr	1918(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bfe:	fe043783          	ld	a5,-32(s0)
    80000c02:	0785                	addi	a5,a5,1
    80000c04:	fef43023          	sd	a5,-32(s0)
    80000c08:	fe043783          	ld	a5,-32(s0)
    80000c0c:	0007c783          	lbu	a5,0(a5)
    80000c10:	ffe9                	bnez	a5,80000bea <printf+0x1b6>
      break;
    80000c12:	a035                	j	80000c3e <printf+0x20a>
    case '%':
      consputc('%');
    80000c14:	02500513          	li	a0,37
    80000c18:	fffff097          	auipc	ra,0xfffff
    80000c1c:	75c080e7          	jalr	1884(ra) # 80000374 <consputc>
      break;
    80000c20:	a839                	j	80000c3e <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c22:	02500513          	li	a0,37
    80000c26:	fffff097          	auipc	ra,0xfffff
    80000c2a:	74e080e7          	jalr	1870(ra) # 80000374 <consputc>
      consputc(c);
    80000c2e:	fd842783          	lw	a5,-40(s0)
    80000c32:	853e                	mv	a0,a5
    80000c34:	fffff097          	auipc	ra,0xfffff
    80000c38:	740080e7          	jalr	1856(ra) # 80000374 <consputc>
      break;
    80000c3c:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c3e:	fec42783          	lw	a5,-20(s0)
    80000c42:	2785                	addiw	a5,a5,1
    80000c44:	fef42623          	sw	a5,-20(s0)
    80000c48:	fec42783          	lw	a5,-20(s0)
    80000c4c:	fc843703          	ld	a4,-56(s0)
    80000c50:	97ba                	add	a5,a5,a4
    80000c52:	0007c783          	lbu	a5,0(a5)
    80000c56:	fcf42c23          	sw	a5,-40(s0)
    80000c5a:	fd842783          	lw	a5,-40(s0)
    80000c5e:	2781                	sext.w	a5,a5
    80000c60:	e40794e3          	bnez	a5,80000aa8 <printf+0x74>
    80000c64:	a011                	j	80000c68 <printf+0x234>
      break;
    80000c66:	0001                	nop
    }
  }
  va_end(ap);

  if(locking)
    80000c68:	fdc42783          	lw	a5,-36(s0)
    80000c6c:	2781                	sext.w	a5,a5
    80000c6e:	cb89                	beqz	a5,80000c80 <printf+0x24c>
    release(&pr.lock);
    80000c70:	00013517          	auipc	a0,0x13
    80000c74:	e6850513          	addi	a0,a0,-408 # 80013ad8 <pr>
    80000c78:	00000097          	auipc	ra,0x0
    80000c7c:	664080e7          	jalr	1636(ra) # 800012dc <release>
}
    80000c80:	0001                	nop
    80000c82:	70e2                	ld	ra,56(sp)
    80000c84:	7442                	ld	s0,48(sp)
    80000c86:	6109                	addi	sp,sp,128
    80000c88:	8082                	ret

0000000080000c8a <panic>:

void
panic(char *s)
{
    80000c8a:	1101                	addi	sp,sp,-32
    80000c8c:	ec06                	sd	ra,24(sp)
    80000c8e:	e822                	sd	s0,16(sp)
    80000c90:	1000                	addi	s0,sp,32
    80000c92:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c96:	00013797          	auipc	a5,0x13
    80000c9a:	e4278793          	addi	a5,a5,-446 # 80013ad8 <pr>
    80000c9e:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000ca2:	0000a517          	auipc	a0,0xa
    80000ca6:	37e50513          	addi	a0,a0,894 # 8000b020 <etext+0x20>
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d8a080e7          	jalr	-630(ra) # 80000a34 <printf>
  printf(s);
    80000cb2:	fe843503          	ld	a0,-24(s0)
    80000cb6:	00000097          	auipc	ra,0x0
    80000cba:	d7e080e7          	jalr	-642(ra) # 80000a34 <printf>
  printf("\n");
    80000cbe:	0000a517          	auipc	a0,0xa
    80000cc2:	36a50513          	addi	a0,a0,874 # 8000b028 <etext+0x28>
    80000cc6:	00000097          	auipc	ra,0x0
    80000cca:	d6e080e7          	jalr	-658(ra) # 80000a34 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cce:	0000b797          	auipc	a5,0xb
    80000cd2:	bf278793          	addi	a5,a5,-1038 # 8000b8c0 <panicked>
    80000cd6:	4705                	li	a4,1
    80000cd8:	c398                	sw	a4,0(a5)
  for(;;)
    80000cda:	a001                	j	80000cda <panic+0x50>

0000000080000cdc <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cdc:	1141                	addi	sp,sp,-16
    80000cde:	e406                	sd	ra,8(sp)
    80000ce0:	e022                	sd	s0,0(sp)
    80000ce2:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000ce4:	0000a597          	auipc	a1,0xa
    80000ce8:	34c58593          	addi	a1,a1,844 # 8000b030 <etext+0x30>
    80000cec:	00013517          	auipc	a0,0x13
    80000cf0:	dec50513          	addi	a0,a0,-532 # 80013ad8 <pr>
    80000cf4:	00000097          	auipc	ra,0x0
    80000cf8:	554080e7          	jalr	1364(ra) # 80001248 <initlock>
  pr.locking = 1;
    80000cfc:	00013797          	auipc	a5,0x13
    80000d00:	ddc78793          	addi	a5,a5,-548 # 80013ad8 <pr>
    80000d04:	4705                	li	a4,1
    80000d06:	cf98                	sw	a4,24(a5)
}
    80000d08:	0001                	nop
    80000d0a:	60a2                	ld	ra,8(sp)
    80000d0c:	6402                	ld	s0,0(sp)
    80000d0e:	0141                	addi	sp,sp,16
    80000d10:	8082                	ret

0000000080000d12 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d12:	1141                	addi	sp,sp,-16
    80000d14:	e406                	sd	ra,8(sp)
    80000d16:	e022                	sd	s0,0(sp)
    80000d18:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d1a:	100007b7          	lui	a5,0x10000
    80000d1e:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d20:	00078023          	sb	zero,0(a5)

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d24:	100007b7          	lui	a5,0x10000
    80000d28:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000d2a:	f8000713          	li	a4,-128
    80000d2e:	00e78023          	sb	a4,0(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d32:	100007b7          	lui	a5,0x10000
    80000d36:	470d                	li	a4,3
    80000d38:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d3c:	100007b7          	lui	a5,0x10000
    80000d40:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d42:	00078023          	sb	zero,0(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000d4c:	470d                	li	a4,3
    80000d4e:	00e78023          	sb	a4,0(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0789                	addi	a5,a5,2 # 10000002 <_entry-0x6ffffffe>
    80000d58:	471d                	li	a4,7
    80000d5a:	00e78023          	sb	a4,0(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d5e:	100007b7          	lui	a5,0x10000
    80000d62:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000d64:	470d                	li	a4,3
    80000d66:	00e78023          	sb	a4,0(a5)

  initlock(&uart_tx_lock, "uart");
    80000d6a:	0000a597          	auipc	a1,0xa
    80000d6e:	2ce58593          	addi	a1,a1,718 # 8000b038 <etext+0x38>
    80000d72:	00013517          	auipc	a0,0x13
    80000d76:	d8650513          	addi	a0,a0,-634 # 80013af8 <uart_tx_lock>
    80000d7a:	00000097          	auipc	ra,0x0
    80000d7e:	4ce080e7          	jalr	1230(ra) # 80001248 <initlock>
}
    80000d82:	0001                	nop
    80000d84:	60a2                	ld	ra,8(sp)
    80000d86:	6402                	ld	s0,0(sp)
    80000d88:	0141                	addi	sp,sp,16
    80000d8a:	8082                	ret

0000000080000d8c <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d8c:	1101                	addi	sp,sp,-32
    80000d8e:	ec06                	sd	ra,24(sp)
    80000d90:	e822                	sd	s0,16(sp)
    80000d92:	1000                	addi	s0,sp,32
    80000d94:	87aa                	mv	a5,a0
    80000d96:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d9a:	00013517          	auipc	a0,0x13
    80000d9e:	d5e50513          	addi	a0,a0,-674 # 80013af8 <uart_tx_lock>
    80000da2:	00000097          	auipc	ra,0x0
    80000da6:	4d6080e7          	jalr	1238(ra) # 80001278 <acquire>

  if(panicked){
    80000daa:	0000b797          	auipc	a5,0xb
    80000dae:	b1678793          	addi	a5,a5,-1258 # 8000b8c0 <panicked>
    80000db2:	439c                	lw	a5,0(a5)
    80000db4:	2781                	sext.w	a5,a5
    80000db6:	cf91                	beqz	a5,80000dd2 <uartputc+0x46>
    for(;;)
    80000db8:	a001                	j	80000db8 <uartputc+0x2c>
      ;
  }
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    // buffer is full.
    // wait for uartstart() to open up space in the buffer.
    sleep(&uart_tx_r, &uart_tx_lock);
    80000dba:	00013597          	auipc	a1,0x13
    80000dbe:	d3e58593          	addi	a1,a1,-706 # 80013af8 <uart_tx_lock>
    80000dc2:	0000b517          	auipc	a0,0xb
    80000dc6:	b0e50513          	addi	a0,a0,-1266 # 8000b8d0 <uart_tx_r>
    80000dca:	00002097          	auipc	ra,0x2
    80000dce:	638080e7          	jalr	1592(ra) # 80003402 <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dd2:	0000b797          	auipc	a5,0xb
    80000dd6:	afe78793          	addi	a5,a5,-1282 # 8000b8d0 <uart_tx_r>
    80000dda:	639c                	ld	a5,0(a5)
    80000ddc:	02078713          	addi	a4,a5,32
    80000de0:	0000b797          	auipc	a5,0xb
    80000de4:	ae878793          	addi	a5,a5,-1304 # 8000b8c8 <uart_tx_w>
    80000de8:	639c                	ld	a5,0(a5)
    80000dea:	fcf708e3          	beq	a4,a5,80000dba <uartputc+0x2e>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000dee:	0000b797          	auipc	a5,0xb
    80000df2:	ada78793          	addi	a5,a5,-1318 # 8000b8c8 <uart_tx_w>
    80000df6:	639c                	ld	a5,0(a5)
    80000df8:	8bfd                	andi	a5,a5,31
    80000dfa:	fec42703          	lw	a4,-20(s0)
    80000dfe:	0ff77713          	zext.b	a4,a4
    80000e02:	00013697          	auipc	a3,0x13
    80000e06:	d0e68693          	addi	a3,a3,-754 # 80013b10 <uart_tx_buf>
    80000e0a:	97b6                	add	a5,a5,a3
    80000e0c:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000e10:	0000b797          	auipc	a5,0xb
    80000e14:	ab878793          	addi	a5,a5,-1352 # 8000b8c8 <uart_tx_w>
    80000e18:	639c                	ld	a5,0(a5)
    80000e1a:	00178713          	addi	a4,a5,1
    80000e1e:	0000b797          	auipc	a5,0xb
    80000e22:	aaa78793          	addi	a5,a5,-1366 # 8000b8c8 <uart_tx_w>
    80000e26:	e398                	sd	a4,0(a5)
  uartstart();
    80000e28:	00000097          	auipc	ra,0x0
    80000e2c:	084080e7          	jalr	132(ra) # 80000eac <uartstart>
  release(&uart_tx_lock);
    80000e30:	00013517          	auipc	a0,0x13
    80000e34:	cc850513          	addi	a0,a0,-824 # 80013af8 <uart_tx_lock>
    80000e38:	00000097          	auipc	ra,0x0
    80000e3c:	4a4080e7          	jalr	1188(ra) # 800012dc <release>
}
    80000e40:	0001                	nop
    80000e42:	60e2                	ld	ra,24(sp)
    80000e44:	6442                	ld	s0,16(sp)
    80000e46:	6105                	addi	sp,sp,32
    80000e48:	8082                	ret

0000000080000e4a <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e4a:	1101                	addi	sp,sp,-32
    80000e4c:	ec06                	sd	ra,24(sp)
    80000e4e:	e822                	sd	s0,16(sp)
    80000e50:	1000                	addi	s0,sp,32
    80000e52:	87aa                	mv	a5,a0
    80000e54:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e58:	00000097          	auipc	ra,0x0
    80000e5c:	51e080e7          	jalr	1310(ra) # 80001376 <push_off>

  if(panicked){
    80000e60:	0000b797          	auipc	a5,0xb
    80000e64:	a6078793          	addi	a5,a5,-1440 # 8000b8c0 <panicked>
    80000e68:	439c                	lw	a5,0(a5)
    80000e6a:	2781                	sext.w	a5,a5
    80000e6c:	c391                	beqz	a5,80000e70 <uartputc_sync+0x26>
    for(;;)
    80000e6e:	a001                	j	80000e6e <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e70:	0001                	nop
    80000e72:	100007b7          	lui	a5,0x10000
    80000e76:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000e78:	0007c783          	lbu	a5,0(a5)
    80000e7c:	0ff7f793          	zext.b	a5,a5
    80000e80:	2781                	sext.w	a5,a5
    80000e82:	0207f793          	andi	a5,a5,32
    80000e86:	2781                	sext.w	a5,a5
    80000e88:	d7ed                	beqz	a5,80000e72 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e8a:	100007b7          	lui	a5,0x10000
    80000e8e:	fec42703          	lw	a4,-20(s0)
    80000e92:	0ff77713          	zext.b	a4,a4
    80000e96:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e9a:	00000097          	auipc	ra,0x0
    80000e9e:	534080e7          	jalr	1332(ra) # 800013ce <pop_off>
}
    80000ea2:	0001                	nop
    80000ea4:	60e2                	ld	ra,24(sp)
    80000ea6:	6442                	ld	s0,16(sp)
    80000ea8:	6105                	addi	sp,sp,32
    80000eaa:	8082                	ret

0000000080000eac <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000eac:	1101                	addi	sp,sp,-32
    80000eae:	ec06                	sd	ra,24(sp)
    80000eb0:	e822                	sd	s0,16(sp)
    80000eb2:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eb4:	0000b797          	auipc	a5,0xb
    80000eb8:	a1478793          	addi	a5,a5,-1516 # 8000b8c8 <uart_tx_w>
    80000ebc:	6398                	ld	a4,0(a5)
    80000ebe:	0000b797          	auipc	a5,0xb
    80000ec2:	a1278793          	addi	a5,a5,-1518 # 8000b8d0 <uart_tx_r>
    80000ec6:	639c                	ld	a5,0(a5)
    80000ec8:	06f70a63          	beq	a4,a5,80000f3c <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ecc:	100007b7          	lui	a5,0x10000
    80000ed0:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000ed2:	0007c783          	lbu	a5,0(a5)
    80000ed6:	0ff7f793          	zext.b	a5,a5
    80000eda:	2781                	sext.w	a5,a5
    80000edc:	0207f793          	andi	a5,a5,32
    80000ee0:	2781                	sext.w	a5,a5
    80000ee2:	cfb9                	beqz	a5,80000f40 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000ee4:	0000b797          	auipc	a5,0xb
    80000ee8:	9ec78793          	addi	a5,a5,-1556 # 8000b8d0 <uart_tx_r>
    80000eec:	639c                	ld	a5,0(a5)
    80000eee:	8bfd                	andi	a5,a5,31
    80000ef0:	00013717          	auipc	a4,0x13
    80000ef4:	c2070713          	addi	a4,a4,-992 # 80013b10 <uart_tx_buf>
    80000ef8:	97ba                	add	a5,a5,a4
    80000efa:	0007c783          	lbu	a5,0(a5)
    80000efe:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000f02:	0000b797          	auipc	a5,0xb
    80000f06:	9ce78793          	addi	a5,a5,-1586 # 8000b8d0 <uart_tx_r>
    80000f0a:	639c                	ld	a5,0(a5)
    80000f0c:	00178713          	addi	a4,a5,1
    80000f10:	0000b797          	auipc	a5,0xb
    80000f14:	9c078793          	addi	a5,a5,-1600 # 8000b8d0 <uart_tx_r>
    80000f18:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f1a:	0000b517          	auipc	a0,0xb
    80000f1e:	9b650513          	addi	a0,a0,-1610 # 8000b8d0 <uart_tx_r>
    80000f22:	00002097          	auipc	ra,0x2
    80000f26:	55c080e7          	jalr	1372(ra) # 8000347e <wakeup>
    
    WriteReg(THR, c);
    80000f2a:	100007b7          	lui	a5,0x10000
    80000f2e:	fec42703          	lw	a4,-20(s0)
    80000f32:	0ff77713          	zext.b	a4,a4
    80000f36:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f3a:	bfad                	j	80000eb4 <uartstart+0x8>
      return;
    80000f3c:	0001                	nop
    80000f3e:	a011                	j	80000f42 <uartstart+0x96>
      return;
    80000f40:	0001                	nop
  }
}
    80000f42:	60e2                	ld	ra,24(sp)
    80000f44:	6442                	ld	s0,16(sp)
    80000f46:	6105                	addi	sp,sp,32
    80000f48:	8082                	ret

0000000080000f4a <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f4a:	1141                	addi	sp,sp,-16
    80000f4c:	e422                	sd	s0,8(sp)
    80000f4e:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f50:	100007b7          	lui	a5,0x10000
    80000f54:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000f56:	0007c783          	lbu	a5,0(a5)
    80000f5a:	0ff7f793          	zext.b	a5,a5
    80000f5e:	2781                	sext.w	a5,a5
    80000f60:	8b85                	andi	a5,a5,1
    80000f62:	2781                	sext.w	a5,a5
    80000f64:	cb89                	beqz	a5,80000f76 <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f66:	100007b7          	lui	a5,0x10000
    80000f6a:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f6e:	0ff7f793          	zext.b	a5,a5
    80000f72:	2781                	sext.w	a5,a5
    80000f74:	a011                	j	80000f78 <uartgetc+0x2e>
  } else {
    return -1;
    80000f76:	57fd                	li	a5,-1
  }
}
    80000f78:	853e                	mv	a0,a5
    80000f7a:	6422                	ld	s0,8(sp)
    80000f7c:	0141                	addi	sp,sp,16
    80000f7e:	8082                	ret

0000000080000f80 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from devintr().
void
uartintr(void)
{
    80000f80:	1101                	addi	sp,sp,-32
    80000f82:	ec06                	sd	ra,24(sp)
    80000f84:	e822                	sd	s0,16(sp)
    80000f86:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f88:	00000097          	auipc	ra,0x0
    80000f8c:	fc2080e7          	jalr	-62(ra) # 80000f4a <uartgetc>
    80000f90:	87aa                	mv	a5,a0
    80000f92:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f96:	fec42783          	lw	a5,-20(s0)
    80000f9a:	0007871b          	sext.w	a4,a5
    80000f9e:	57fd                	li	a5,-1
    80000fa0:	00f70a63          	beq	a4,a5,80000fb4 <uartintr+0x34>
      break;
    consoleintr(c);
    80000fa4:	fec42783          	lw	a5,-20(s0)
    80000fa8:	853e                	mv	a0,a5
    80000faa:	fffff097          	auipc	ra,0xfffff
    80000fae:	64c080e7          	jalr	1612(ra) # 800005f6 <consoleintr>
  while(1){
    80000fb2:	bfd9                	j	80000f88 <uartintr+0x8>
      break;
    80000fb4:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fb6:	00013517          	auipc	a0,0x13
    80000fba:	b4250513          	addi	a0,a0,-1214 # 80013af8 <uart_tx_lock>
    80000fbe:	00000097          	auipc	ra,0x0
    80000fc2:	2ba080e7          	jalr	698(ra) # 80001278 <acquire>
  uartstart();
    80000fc6:	00000097          	auipc	ra,0x0
    80000fca:	ee6080e7          	jalr	-282(ra) # 80000eac <uartstart>
  release(&uart_tx_lock);
    80000fce:	00013517          	auipc	a0,0x13
    80000fd2:	b2a50513          	addi	a0,a0,-1238 # 80013af8 <uart_tx_lock>
    80000fd6:	00000097          	auipc	ra,0x0
    80000fda:	306080e7          	jalr	774(ra) # 800012dc <release>
}
    80000fde:	0001                	nop
    80000fe0:	60e2                	ld	ra,24(sp)
    80000fe2:	6442                	ld	s0,16(sp)
    80000fe4:	6105                	addi	sp,sp,32
    80000fe6:	8082                	ret

0000000080000fe8 <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fe8:	1141                	addi	sp,sp,-16
    80000fea:	e406                	sd	ra,8(sp)
    80000fec:	e022                	sd	s0,0(sp)
    80000fee:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000ff0:	0000a597          	auipc	a1,0xa
    80000ff4:	05058593          	addi	a1,a1,80 # 8000b040 <etext+0x40>
    80000ff8:	00013517          	auipc	a0,0x13
    80000ffc:	b3850513          	addi	a0,a0,-1224 # 80013b30 <kmem>
    80001000:	00000097          	auipc	ra,0x0
    80001004:	248080e7          	jalr	584(ra) # 80001248 <initlock>
  freerange(end, (void*)PHYSTOP);
    80001008:	47c5                	li	a5,17
    8000100a:	01b79593          	slli	a1,a5,0x1b
    8000100e:	00024517          	auipc	a0,0x24
    80001012:	d5a50513          	addi	a0,a0,-678 # 80024d68 <end>
    80001016:	00000097          	auipc	ra,0x0
    8000101a:	012080e7          	jalr	18(ra) # 80001028 <freerange>
}
    8000101e:	0001                	nop
    80001020:	60a2                	ld	ra,8(sp)
    80001022:	6402                	ld	s0,0(sp)
    80001024:	0141                	addi	sp,sp,16
    80001026:	8082                	ret

0000000080001028 <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    80001028:	7179                	addi	sp,sp,-48
    8000102a:	f406                	sd	ra,40(sp)
    8000102c:	f022                	sd	s0,32(sp)
    8000102e:	1800                	addi	s0,sp,48
    80001030:	fca43c23          	sd	a0,-40(s0)
    80001034:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    80001038:	fd843703          	ld	a4,-40(s0)
    8000103c:	6785                	lui	a5,0x1
    8000103e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001040:	973e                	add	a4,a4,a5
    80001042:	77fd                	lui	a5,0xfffff
    80001044:	8ff9                	and	a5,a5,a4
    80001046:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104a:	a829                	j	80001064 <freerange+0x3c>
    kfree(p);
    8000104c:	fe843503          	ld	a0,-24(s0)
    80001050:	00000097          	auipc	ra,0x0
    80001054:	030080e7          	jalr	48(ra) # 80001080 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001058:	fe843703          	ld	a4,-24(s0)
    8000105c:	6785                	lui	a5,0x1
    8000105e:	97ba                	add	a5,a5,a4
    80001060:	fef43423          	sd	a5,-24(s0)
    80001064:	fe843703          	ld	a4,-24(s0)
    80001068:	6785                	lui	a5,0x1
    8000106a:	97ba                	add	a5,a5,a4
    8000106c:	fd043703          	ld	a4,-48(s0)
    80001070:	fcf77ee3          	bgeu	a4,a5,8000104c <freerange+0x24>
}
    80001074:	0001                	nop
    80001076:	0001                	nop
    80001078:	70a2                	ld	ra,40(sp)
    8000107a:	7402                	ld	s0,32(sp)
    8000107c:	6145                	addi	sp,sp,48
    8000107e:	8082                	ret

0000000080001080 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001080:	7179                	addi	sp,sp,-48
    80001082:	f406                	sd	ra,40(sp)
    80001084:	f022                	sd	s0,32(sp)
    80001086:	1800                	addi	s0,sp,48
    80001088:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    8000108c:	fd843703          	ld	a4,-40(s0)
    80001090:	6785                	lui	a5,0x1
    80001092:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001094:	8ff9                	and	a5,a5,a4
    80001096:	ef99                	bnez	a5,800010b4 <kfree+0x34>
    80001098:	fd843703          	ld	a4,-40(s0)
    8000109c:	00024797          	auipc	a5,0x24
    800010a0:	ccc78793          	addi	a5,a5,-820 # 80024d68 <end>
    800010a4:	00f76863          	bltu	a4,a5,800010b4 <kfree+0x34>
    800010a8:	fd843703          	ld	a4,-40(s0)
    800010ac:	47c5                	li	a5,17
    800010ae:	07ee                	slli	a5,a5,0x1b
    800010b0:	00f76a63          	bltu	a4,a5,800010c4 <kfree+0x44>
    panic("kfree");
    800010b4:	0000a517          	auipc	a0,0xa
    800010b8:	f9450513          	addi	a0,a0,-108 # 8000b048 <etext+0x48>
    800010bc:	00000097          	auipc	ra,0x0
    800010c0:	bce080e7          	jalr	-1074(ra) # 80000c8a <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010c4:	6605                	lui	a2,0x1
    800010c6:	4585                	li	a1,1
    800010c8:	fd843503          	ld	a0,-40(s0)
    800010cc:	00000097          	auipc	ra,0x0
    800010d0:	380080e7          	jalr	896(ra) # 8000144c <memset>

  r = (struct run*)pa;
    800010d4:	fd843783          	ld	a5,-40(s0)
    800010d8:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010dc:	00013517          	auipc	a0,0x13
    800010e0:	a5450513          	addi	a0,a0,-1452 # 80013b30 <kmem>
    800010e4:	00000097          	auipc	ra,0x0
    800010e8:	194080e7          	jalr	404(ra) # 80001278 <acquire>
  r->next = kmem.freelist;
    800010ec:	00013797          	auipc	a5,0x13
    800010f0:	a4478793          	addi	a5,a5,-1468 # 80013b30 <kmem>
    800010f4:	6f98                	ld	a4,24(a5)
    800010f6:	fe843783          	ld	a5,-24(s0)
    800010fa:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010fc:	00013797          	auipc	a5,0x13
    80001100:	a3478793          	addi	a5,a5,-1484 # 80013b30 <kmem>
    80001104:	fe843703          	ld	a4,-24(s0)
    80001108:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    8000110a:	00013517          	auipc	a0,0x13
    8000110e:	a2650513          	addi	a0,a0,-1498 # 80013b30 <kmem>
    80001112:	00000097          	auipc	ra,0x0
    80001116:	1ca080e7          	jalr	458(ra) # 800012dc <release>
}
    8000111a:	0001                	nop
    8000111c:	70a2                	ld	ra,40(sp)
    8000111e:	7402                	ld	s0,32(sp)
    80001120:	6145                	addi	sp,sp,48
    80001122:	8082                	ret

0000000080001124 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80001124:	1101                	addi	sp,sp,-32
    80001126:	ec06                	sd	ra,24(sp)
    80001128:	e822                	sd	s0,16(sp)
    8000112a:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    8000112c:	00013517          	auipc	a0,0x13
    80001130:	a0450513          	addi	a0,a0,-1532 # 80013b30 <kmem>
    80001134:	00000097          	auipc	ra,0x0
    80001138:	144080e7          	jalr	324(ra) # 80001278 <acquire>
  r = kmem.freelist;
    8000113c:	00013797          	auipc	a5,0x13
    80001140:	9f478793          	addi	a5,a5,-1548 # 80013b30 <kmem>
    80001144:	6f9c                	ld	a5,24(a5)
    80001146:	fef43423          	sd	a5,-24(s0)
  if(r)
    8000114a:	fe843783          	ld	a5,-24(s0)
    8000114e:	cb89                	beqz	a5,80001160 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001150:	fe843783          	ld	a5,-24(s0)
    80001154:	6398                	ld	a4,0(a5)
    80001156:	00013797          	auipc	a5,0x13
    8000115a:	9da78793          	addi	a5,a5,-1574 # 80013b30 <kmem>
    8000115e:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001160:	00013517          	auipc	a0,0x13
    80001164:	9d050513          	addi	a0,a0,-1584 # 80013b30 <kmem>
    80001168:	00000097          	auipc	ra,0x0
    8000116c:	174080e7          	jalr	372(ra) # 800012dc <release>

  if(r)
    80001170:	fe843783          	ld	a5,-24(s0)
    80001174:	cb89                	beqz	a5,80001186 <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    80001176:	6605                	lui	a2,0x1
    80001178:	4595                	li	a1,5
    8000117a:	fe843503          	ld	a0,-24(s0)
    8000117e:	00000097          	auipc	ra,0x0
    80001182:	2ce080e7          	jalr	718(ra) # 8000144c <memset>
  return (void*)r;
    80001186:	fe843783          	ld	a5,-24(s0)
}
    8000118a:	853e                	mv	a0,a5
    8000118c:	60e2                	ld	ra,24(sp)
    8000118e:	6442                	ld	s0,16(sp)
    80001190:	6105                	addi	sp,sp,32
    80001192:	8082                	ret

0000000080001194 <r_sstatus>:
{
    80001194:	1101                	addi	sp,sp,-32
    80001196:	ec22                	sd	s0,24(sp)
    80001198:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000119a:	100027f3          	csrr	a5,sstatus
    8000119e:	fef43423          	sd	a5,-24(s0)
  return x;
    800011a2:	fe843783          	ld	a5,-24(s0)
}
    800011a6:	853e                	mv	a0,a5
    800011a8:	6462                	ld	s0,24(sp)
    800011aa:	6105                	addi	sp,sp,32
    800011ac:	8082                	ret

00000000800011ae <w_sstatus>:
{
    800011ae:	1101                	addi	sp,sp,-32
    800011b0:	ec22                	sd	s0,24(sp)
    800011b2:	1000                	addi	s0,sp,32
    800011b4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011b8:	fe843783          	ld	a5,-24(s0)
    800011bc:	10079073          	csrw	sstatus,a5
}
    800011c0:	0001                	nop
    800011c2:	6462                	ld	s0,24(sp)
    800011c4:	6105                	addi	sp,sp,32
    800011c6:	8082                	ret

00000000800011c8 <intr_on>:
{
    800011c8:	1141                	addi	sp,sp,-16
    800011ca:	e406                	sd	ra,8(sp)
    800011cc:	e022                	sd	s0,0(sp)
    800011ce:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011d0:	00000097          	auipc	ra,0x0
    800011d4:	fc4080e7          	jalr	-60(ra) # 80001194 <r_sstatus>
    800011d8:	87aa                	mv	a5,a0
    800011da:	0027e793          	ori	a5,a5,2
    800011de:	853e                	mv	a0,a5
    800011e0:	00000097          	auipc	ra,0x0
    800011e4:	fce080e7          	jalr	-50(ra) # 800011ae <w_sstatus>
}
    800011e8:	0001                	nop
    800011ea:	60a2                	ld	ra,8(sp)
    800011ec:	6402                	ld	s0,0(sp)
    800011ee:	0141                	addi	sp,sp,16
    800011f0:	8082                	ret

00000000800011f2 <intr_off>:
{
    800011f2:	1141                	addi	sp,sp,-16
    800011f4:	e406                	sd	ra,8(sp)
    800011f6:	e022                	sd	s0,0(sp)
    800011f8:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011fa:	00000097          	auipc	ra,0x0
    800011fe:	f9a080e7          	jalr	-102(ra) # 80001194 <r_sstatus>
    80001202:	87aa                	mv	a5,a0
    80001204:	9bf5                	andi	a5,a5,-3
    80001206:	853e                	mv	a0,a5
    80001208:	00000097          	auipc	ra,0x0
    8000120c:	fa6080e7          	jalr	-90(ra) # 800011ae <w_sstatus>
}
    80001210:	0001                	nop
    80001212:	60a2                	ld	ra,8(sp)
    80001214:	6402                	ld	s0,0(sp)
    80001216:	0141                	addi	sp,sp,16
    80001218:	8082                	ret

000000008000121a <intr_get>:
{
    8000121a:	1101                	addi	sp,sp,-32
    8000121c:	ec06                	sd	ra,24(sp)
    8000121e:	e822                	sd	s0,16(sp)
    80001220:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001222:	00000097          	auipc	ra,0x0
    80001226:	f72080e7          	jalr	-142(ra) # 80001194 <r_sstatus>
    8000122a:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    8000122e:	fe843783          	ld	a5,-24(s0)
    80001232:	8b89                	andi	a5,a5,2
    80001234:	00f037b3          	snez	a5,a5
    80001238:	0ff7f793          	zext.b	a5,a5
    8000123c:	2781                	sext.w	a5,a5
}
    8000123e:	853e                	mv	a0,a5
    80001240:	60e2                	ld	ra,24(sp)
    80001242:	6442                	ld	s0,16(sp)
    80001244:	6105                	addi	sp,sp,32
    80001246:	8082                	ret

0000000080001248 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80001248:	1101                	addi	sp,sp,-32
    8000124a:	ec22                	sd	s0,24(sp)
    8000124c:	1000                	addi	s0,sp,32
    8000124e:	fea43423          	sd	a0,-24(s0)
    80001252:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	fe043703          	ld	a4,-32(s0)
    8000125e:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001260:	fe843783          	ld	a5,-24(s0)
    80001264:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    80001268:	fe843783          	ld	a5,-24(s0)
    8000126c:	0007b823          	sd	zero,16(a5)
}
    80001270:	0001                	nop
    80001272:	6462                	ld	s0,24(sp)
    80001274:	6105                	addi	sp,sp,32
    80001276:	8082                	ret

0000000080001278 <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    80001278:	1101                	addi	sp,sp,-32
    8000127a:	ec06                	sd	ra,24(sp)
    8000127c:	e822                	sd	s0,16(sp)
    8000127e:	1000                	addi	s0,sp,32
    80001280:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    80001284:	00000097          	auipc	ra,0x0
    80001288:	0f2080e7          	jalr	242(ra) # 80001376 <push_off>
  if(holding(lk))
    8000128c:	fe843503          	ld	a0,-24(s0)
    80001290:	00000097          	auipc	ra,0x0
    80001294:	0a2080e7          	jalr	162(ra) # 80001332 <holding>
    80001298:	87aa                	mv	a5,a0
    8000129a:	cb89                	beqz	a5,800012ac <acquire+0x34>
    panic("acquire");
    8000129c:	0000a517          	auipc	a0,0xa
    800012a0:	db450513          	addi	a0,a0,-588 # 8000b050 <etext+0x50>
    800012a4:	00000097          	auipc	ra,0x0
    800012a8:	9e6080e7          	jalr	-1562(ra) # 80000c8a <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012ac:	0001                	nop
    800012ae:	fe843783          	ld	a5,-24(s0)
    800012b2:	4705                	li	a4,1
    800012b4:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012b8:	0007079b          	sext.w	a5,a4
    800012bc:	fbed                	bnez	a5,800012ae <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012be:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012c2:	00001097          	auipc	ra,0x1
    800012c6:	544080e7          	jalr	1348(ra) # 80002806 <mycpu>
    800012ca:	872a                	mv	a4,a0
    800012cc:	fe843783          	ld	a5,-24(s0)
    800012d0:	eb98                	sd	a4,16(a5)
}
    800012d2:	0001                	nop
    800012d4:	60e2                	ld	ra,24(sp)
    800012d6:	6442                	ld	s0,16(sp)
    800012d8:	6105                	addi	sp,sp,32
    800012da:	8082                	ret

00000000800012dc <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012dc:	1101                	addi	sp,sp,-32
    800012de:	ec06                	sd	ra,24(sp)
    800012e0:	e822                	sd	s0,16(sp)
    800012e2:	1000                	addi	s0,sp,32
    800012e4:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012e8:	fe843503          	ld	a0,-24(s0)
    800012ec:	00000097          	auipc	ra,0x0
    800012f0:	046080e7          	jalr	70(ra) # 80001332 <holding>
    800012f4:	87aa                	mv	a5,a0
    800012f6:	eb89                	bnez	a5,80001308 <release+0x2c>
    panic("release");
    800012f8:	0000a517          	auipc	a0,0xa
    800012fc:	d6050513          	addi	a0,a0,-672 # 8000b058 <etext+0x58>
    80001300:	00000097          	auipc	ra,0x0
    80001304:	98a080e7          	jalr	-1654(ra) # 80000c8a <panic>

  lk->cpu = 0;
    80001308:	fe843783          	ld	a5,-24(s0)
    8000130c:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001310:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    80001314:	fe843783          	ld	a5,-24(s0)
    80001318:	0f50000f          	fence	iorw,ow
    8000131c:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001320:	00000097          	auipc	ra,0x0
    80001324:	0ae080e7          	jalr	174(ra) # 800013ce <pop_off>
}
    80001328:	0001                	nop
    8000132a:	60e2                	ld	ra,24(sp)
    8000132c:	6442                	ld	s0,16(sp)
    8000132e:	6105                	addi	sp,sp,32
    80001330:	8082                	ret

0000000080001332 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001332:	7139                	addi	sp,sp,-64
    80001334:	fc06                	sd	ra,56(sp)
    80001336:	f822                	sd	s0,48(sp)
    80001338:	f426                	sd	s1,40(sp)
    8000133a:	0080                	addi	s0,sp,64
    8000133c:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001340:	fc843783          	ld	a5,-56(s0)
    80001344:	439c                	lw	a5,0(a5)
    80001346:	cf89                	beqz	a5,80001360 <holding+0x2e>
    80001348:	fc843783          	ld	a5,-56(s0)
    8000134c:	6b84                	ld	s1,16(a5)
    8000134e:	00001097          	auipc	ra,0x1
    80001352:	4b8080e7          	jalr	1208(ra) # 80002806 <mycpu>
    80001356:	87aa                	mv	a5,a0
    80001358:	00f49463          	bne	s1,a5,80001360 <holding+0x2e>
    8000135c:	4785                	li	a5,1
    8000135e:	a011                	j	80001362 <holding+0x30>
    80001360:	4781                	li	a5,0
    80001362:	fcf42e23          	sw	a5,-36(s0)
  return r;
    80001366:	fdc42783          	lw	a5,-36(s0)
}
    8000136a:	853e                	mv	a0,a5
    8000136c:	70e2                	ld	ra,56(sp)
    8000136e:	7442                	ld	s0,48(sp)
    80001370:	74a2                	ld	s1,40(sp)
    80001372:	6121                	addi	sp,sp,64
    80001374:	8082                	ret

0000000080001376 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80001376:	1101                	addi	sp,sp,-32
    80001378:	ec06                	sd	ra,24(sp)
    8000137a:	e822                	sd	s0,16(sp)
    8000137c:	1000                	addi	s0,sp,32
  int old = intr_get();
    8000137e:	00000097          	auipc	ra,0x0
    80001382:	e9c080e7          	jalr	-356(ra) # 8000121a <intr_get>
    80001386:	87aa                	mv	a5,a0
    80001388:	fef42623          	sw	a5,-20(s0)

  intr_off();
    8000138c:	00000097          	auipc	ra,0x0
    80001390:	e66080e7          	jalr	-410(ra) # 800011f2 <intr_off>
  if(mycpu()->noff == 0)
    80001394:	00001097          	auipc	ra,0x1
    80001398:	472080e7          	jalr	1138(ra) # 80002806 <mycpu>
    8000139c:	87aa                	mv	a5,a0
    8000139e:	5fbc                	lw	a5,120(a5)
    800013a0:	eb89                	bnez	a5,800013b2 <push_off+0x3c>
    mycpu()->intena = old;
    800013a2:	00001097          	auipc	ra,0x1
    800013a6:	464080e7          	jalr	1124(ra) # 80002806 <mycpu>
    800013aa:	872a                	mv	a4,a0
    800013ac:	fec42783          	lw	a5,-20(s0)
    800013b0:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013b2:	00001097          	auipc	ra,0x1
    800013b6:	454080e7          	jalr	1108(ra) # 80002806 <mycpu>
    800013ba:	87aa                	mv	a5,a0
    800013bc:	5fb8                	lw	a4,120(a5)
    800013be:	2705                	addiw	a4,a4,1
    800013c0:	2701                	sext.w	a4,a4
    800013c2:	dfb8                	sw	a4,120(a5)
}
    800013c4:	0001                	nop
    800013c6:	60e2                	ld	ra,24(sp)
    800013c8:	6442                	ld	s0,16(sp)
    800013ca:	6105                	addi	sp,sp,32
    800013cc:	8082                	ret

00000000800013ce <pop_off>:

void
pop_off(void)
{
    800013ce:	1101                	addi	sp,sp,-32
    800013d0:	ec06                	sd	ra,24(sp)
    800013d2:	e822                	sd	s0,16(sp)
    800013d4:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013d6:	00001097          	auipc	ra,0x1
    800013da:	430080e7          	jalr	1072(ra) # 80002806 <mycpu>
    800013de:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013e2:	00000097          	auipc	ra,0x0
    800013e6:	e38080e7          	jalr	-456(ra) # 8000121a <intr_get>
    800013ea:	87aa                	mv	a5,a0
    800013ec:	cb89                	beqz	a5,800013fe <pop_off+0x30>
    panic("pop_off - interruptible");
    800013ee:	0000a517          	auipc	a0,0xa
    800013f2:	c7250513          	addi	a0,a0,-910 # 8000b060 <etext+0x60>
    800013f6:	00000097          	auipc	ra,0x0
    800013fa:	894080e7          	jalr	-1900(ra) # 80000c8a <panic>
  if(c->noff < 1)
    800013fe:	fe843783          	ld	a5,-24(s0)
    80001402:	5fbc                	lw	a5,120(a5)
    80001404:	00f04a63          	bgtz	a5,80001418 <pop_off+0x4a>
    panic("pop_off");
    80001408:	0000a517          	auipc	a0,0xa
    8000140c:	c7050513          	addi	a0,a0,-912 # 8000b078 <etext+0x78>
    80001410:	00000097          	auipc	ra,0x0
    80001414:	87a080e7          	jalr	-1926(ra) # 80000c8a <panic>
  c->noff -= 1;
    80001418:	fe843783          	ld	a5,-24(s0)
    8000141c:	5fbc                	lw	a5,120(a5)
    8000141e:	37fd                	addiw	a5,a5,-1
    80001420:	0007871b          	sext.w	a4,a5
    80001424:	fe843783          	ld	a5,-24(s0)
    80001428:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    8000142a:	fe843783          	ld	a5,-24(s0)
    8000142e:	5fbc                	lw	a5,120(a5)
    80001430:	eb89                	bnez	a5,80001442 <pop_off+0x74>
    80001432:	fe843783          	ld	a5,-24(s0)
    80001436:	5ffc                	lw	a5,124(a5)
    80001438:	c789                	beqz	a5,80001442 <pop_off+0x74>
    intr_on();
    8000143a:	00000097          	auipc	ra,0x0
    8000143e:	d8e080e7          	jalr	-626(ra) # 800011c8 <intr_on>
}
    80001442:	0001                	nop
    80001444:	60e2                	ld	ra,24(sp)
    80001446:	6442                	ld	s0,16(sp)
    80001448:	6105                	addi	sp,sp,32
    8000144a:	8082                	ret

000000008000144c <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    8000144c:	7179                	addi	sp,sp,-48
    8000144e:	f422                	sd	s0,40(sp)
    80001450:	1800                	addi	s0,sp,48
    80001452:	fca43c23          	sd	a0,-40(s0)
    80001456:	87ae                	mv	a5,a1
    80001458:	8732                	mv	a4,a2
    8000145a:	fcf42a23          	sw	a5,-44(s0)
    8000145e:	87ba                	mv	a5,a4
    80001460:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    80001464:	fd843783          	ld	a5,-40(s0)
    80001468:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    8000146c:	fe042623          	sw	zero,-20(s0)
    80001470:	a00d                	j	80001492 <memset+0x46>
    cdst[i] = c;
    80001472:	fec42783          	lw	a5,-20(s0)
    80001476:	fe043703          	ld	a4,-32(s0)
    8000147a:	97ba                	add	a5,a5,a4
    8000147c:	fd442703          	lw	a4,-44(s0)
    80001480:	0ff77713          	zext.b	a4,a4
    80001484:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    80001488:	fec42783          	lw	a5,-20(s0)
    8000148c:	2785                	addiw	a5,a5,1
    8000148e:	fef42623          	sw	a5,-20(s0)
    80001492:	fec42703          	lw	a4,-20(s0)
    80001496:	fd042783          	lw	a5,-48(s0)
    8000149a:	2781                	sext.w	a5,a5
    8000149c:	fcf76be3          	bltu	a4,a5,80001472 <memset+0x26>
  }
  return dst;
    800014a0:	fd843783          	ld	a5,-40(s0)
}
    800014a4:	853e                	mv	a0,a5
    800014a6:	7422                	ld	s0,40(sp)
    800014a8:	6145                	addi	sp,sp,48
    800014aa:	8082                	ret

00000000800014ac <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014ac:	7139                	addi	sp,sp,-64
    800014ae:	fc22                	sd	s0,56(sp)
    800014b0:	0080                	addi	s0,sp,64
    800014b2:	fca43c23          	sd	a0,-40(s0)
    800014b6:	fcb43823          	sd	a1,-48(s0)
    800014ba:	87b2                	mv	a5,a2
    800014bc:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014c0:	fd843783          	ld	a5,-40(s0)
    800014c4:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014c8:	fd043783          	ld	a5,-48(s0)
    800014cc:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014d0:	a0a1                	j	80001518 <memcmp+0x6c>
    if(*s1 != *s2)
    800014d2:	fe843783          	ld	a5,-24(s0)
    800014d6:	0007c703          	lbu	a4,0(a5)
    800014da:	fe043783          	ld	a5,-32(s0)
    800014de:	0007c783          	lbu	a5,0(a5)
    800014e2:	02f70163          	beq	a4,a5,80001504 <memcmp+0x58>
      return *s1 - *s2;
    800014e6:	fe843783          	ld	a5,-24(s0)
    800014ea:	0007c783          	lbu	a5,0(a5)
    800014ee:	0007871b          	sext.w	a4,a5
    800014f2:	fe043783          	ld	a5,-32(s0)
    800014f6:	0007c783          	lbu	a5,0(a5)
    800014fa:	2781                	sext.w	a5,a5
    800014fc:	40f707bb          	subw	a5,a4,a5
    80001500:	2781                	sext.w	a5,a5
    80001502:	a01d                	j	80001528 <memcmp+0x7c>
    s1++, s2++;
    80001504:	fe843783          	ld	a5,-24(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43423          	sd	a5,-24(s0)
    8000150e:	fe043783          	ld	a5,-32(s0)
    80001512:	0785                	addi	a5,a5,1
    80001514:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001518:	fcc42783          	lw	a5,-52(s0)
    8000151c:	fff7871b          	addiw	a4,a5,-1
    80001520:	fce42623          	sw	a4,-52(s0)
    80001524:	f7dd                	bnez	a5,800014d2 <memcmp+0x26>
  }

  return 0;
    80001526:	4781                	li	a5,0
}
    80001528:	853e                	mv	a0,a5
    8000152a:	7462                	ld	s0,56(sp)
    8000152c:	6121                	addi	sp,sp,64
    8000152e:	8082                	ret

0000000080001530 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001530:	7139                	addi	sp,sp,-64
    80001532:	fc22                	sd	s0,56(sp)
    80001534:	0080                	addi	s0,sp,64
    80001536:	fca43c23          	sd	a0,-40(s0)
    8000153a:	fcb43823          	sd	a1,-48(s0)
    8000153e:	87b2                	mv	a5,a2
    80001540:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    80001544:	fcc42783          	lw	a5,-52(s0)
    80001548:	2781                	sext.w	a5,a5
    8000154a:	e781                	bnez	a5,80001552 <memmove+0x22>
    return dst;
    8000154c:	fd843783          	ld	a5,-40(s0)
    80001550:	a855                	j	80001604 <memmove+0xd4>
  
  s = src;
    80001552:	fd043783          	ld	a5,-48(s0)
    80001556:	fef43423          	sd	a5,-24(s0)
  d = dst;
    8000155a:	fd843783          	ld	a5,-40(s0)
    8000155e:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001562:	fe843703          	ld	a4,-24(s0)
    80001566:	fe043783          	ld	a5,-32(s0)
    8000156a:	08f77463          	bgeu	a4,a5,800015f2 <memmove+0xc2>
    8000156e:	fcc46783          	lwu	a5,-52(s0)
    80001572:	fe843703          	ld	a4,-24(s0)
    80001576:	97ba                	add	a5,a5,a4
    80001578:	fe043703          	ld	a4,-32(s0)
    8000157c:	06f77b63          	bgeu	a4,a5,800015f2 <memmove+0xc2>
    s += n;
    80001580:	fcc46783          	lwu	a5,-52(s0)
    80001584:	fe843703          	ld	a4,-24(s0)
    80001588:	97ba                	add	a5,a5,a4
    8000158a:	fef43423          	sd	a5,-24(s0)
    d += n;
    8000158e:	fcc46783          	lwu	a5,-52(s0)
    80001592:	fe043703          	ld	a4,-32(s0)
    80001596:	97ba                	add	a5,a5,a4
    80001598:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    8000159c:	a01d                	j	800015c2 <memmove+0x92>
      *--d = *--s;
    8000159e:	fe843783          	ld	a5,-24(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43423          	sd	a5,-24(s0)
    800015a8:	fe043783          	ld	a5,-32(s0)
    800015ac:	17fd                	addi	a5,a5,-1
    800015ae:	fef43023          	sd	a5,-32(s0)
    800015b2:	fe843783          	ld	a5,-24(s0)
    800015b6:	0007c703          	lbu	a4,0(a5)
    800015ba:	fe043783          	ld	a5,-32(s0)
    800015be:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015c2:	fcc42783          	lw	a5,-52(s0)
    800015c6:	fff7871b          	addiw	a4,a5,-1
    800015ca:	fce42623          	sw	a4,-52(s0)
    800015ce:	fbe1                	bnez	a5,8000159e <memmove+0x6e>
  if(s < d && s + n > d){
    800015d0:	a805                	j	80001600 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015d2:	fe843703          	ld	a4,-24(s0)
    800015d6:	00170793          	addi	a5,a4,1
    800015da:	fef43423          	sd	a5,-24(s0)
    800015de:	fe043783          	ld	a5,-32(s0)
    800015e2:	00178693          	addi	a3,a5,1
    800015e6:	fed43023          	sd	a3,-32(s0)
    800015ea:	00074703          	lbu	a4,0(a4)
    800015ee:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015f2:	fcc42783          	lw	a5,-52(s0)
    800015f6:	fff7871b          	addiw	a4,a5,-1
    800015fa:	fce42623          	sw	a4,-52(s0)
    800015fe:	fbf1                	bnez	a5,800015d2 <memmove+0xa2>

  return dst;
    80001600:	fd843783          	ld	a5,-40(s0)
}
    80001604:	853e                	mv	a0,a5
    80001606:	7462                	ld	s0,56(sp)
    80001608:	6121                	addi	sp,sp,64
    8000160a:	8082                	ret

000000008000160c <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    8000160c:	7179                	addi	sp,sp,-48
    8000160e:	f406                	sd	ra,40(sp)
    80001610:	f022                	sd	s0,32(sp)
    80001612:	1800                	addi	s0,sp,48
    80001614:	fea43423          	sd	a0,-24(s0)
    80001618:	feb43023          	sd	a1,-32(s0)
    8000161c:	87b2                	mv	a5,a2
    8000161e:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001622:	fdc42783          	lw	a5,-36(s0)
    80001626:	863e                	mv	a2,a5
    80001628:	fe043583          	ld	a1,-32(s0)
    8000162c:	fe843503          	ld	a0,-24(s0)
    80001630:	00000097          	auipc	ra,0x0
    80001634:	f00080e7          	jalr	-256(ra) # 80001530 <memmove>
    80001638:	87aa                	mv	a5,a0
}
    8000163a:	853e                	mv	a0,a5
    8000163c:	70a2                	ld	ra,40(sp)
    8000163e:	7402                	ld	s0,32(sp)
    80001640:	6145                	addi	sp,sp,48
    80001642:	8082                	ret

0000000080001644 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80001644:	7179                	addi	sp,sp,-48
    80001646:	f422                	sd	s0,40(sp)
    80001648:	1800                	addi	s0,sp,48
    8000164a:	fea43423          	sd	a0,-24(s0)
    8000164e:	feb43023          	sd	a1,-32(s0)
    80001652:	87b2                	mv	a5,a2
    80001654:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    80001658:	a005                	j	80001678 <strncmp+0x34>
    n--, p++, q++;
    8000165a:	fdc42783          	lw	a5,-36(s0)
    8000165e:	37fd                	addiw	a5,a5,-1
    80001660:	fcf42e23          	sw	a5,-36(s0)
    80001664:	fe843783          	ld	a5,-24(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43423          	sd	a5,-24(s0)
    8000166e:	fe043783          	ld	a5,-32(s0)
    80001672:	0785                	addi	a5,a5,1
    80001674:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    80001678:	fdc42783          	lw	a5,-36(s0)
    8000167c:	2781                	sext.w	a5,a5
    8000167e:	c385                	beqz	a5,8000169e <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c783          	lbu	a5,0(a5)
    80001688:	cb99                	beqz	a5,8000169e <strncmp+0x5a>
    8000168a:	fe843783          	ld	a5,-24(s0)
    8000168e:	0007c703          	lbu	a4,0(a5)
    80001692:	fe043783          	ld	a5,-32(s0)
    80001696:	0007c783          	lbu	a5,0(a5)
    8000169a:	fcf700e3          	beq	a4,a5,8000165a <strncmp+0x16>
  if(n == 0)
    8000169e:	fdc42783          	lw	a5,-36(s0)
    800016a2:	2781                	sext.w	a5,a5
    800016a4:	e399                	bnez	a5,800016aa <strncmp+0x66>
    return 0;
    800016a6:	4781                	li	a5,0
    800016a8:	a839                	j	800016c6 <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016aa:	fe843783          	ld	a5,-24(s0)
    800016ae:	0007c783          	lbu	a5,0(a5)
    800016b2:	0007871b          	sext.w	a4,a5
    800016b6:	fe043783          	ld	a5,-32(s0)
    800016ba:	0007c783          	lbu	a5,0(a5)
    800016be:	2781                	sext.w	a5,a5
    800016c0:	40f707bb          	subw	a5,a4,a5
    800016c4:	2781                	sext.w	a5,a5
}
    800016c6:	853e                	mv	a0,a5
    800016c8:	7422                	ld	s0,40(sp)
    800016ca:	6145                	addi	sp,sp,48
    800016cc:	8082                	ret

00000000800016ce <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016ce:	7139                	addi	sp,sp,-64
    800016d0:	fc22                	sd	s0,56(sp)
    800016d2:	0080                	addi	s0,sp,64
    800016d4:	fca43c23          	sd	a0,-40(s0)
    800016d8:	fcb43823          	sd	a1,-48(s0)
    800016dc:	87b2                	mv	a5,a2
    800016de:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016e2:	fd843783          	ld	a5,-40(s0)
    800016e6:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016ea:	0001                	nop
    800016ec:	fcc42783          	lw	a5,-52(s0)
    800016f0:	fff7871b          	addiw	a4,a5,-1
    800016f4:	fce42623          	sw	a4,-52(s0)
    800016f8:	02f05e63          	blez	a5,80001734 <strncpy+0x66>
    800016fc:	fd043703          	ld	a4,-48(s0)
    80001700:	00170793          	addi	a5,a4,1
    80001704:	fcf43823          	sd	a5,-48(s0)
    80001708:	fd843783          	ld	a5,-40(s0)
    8000170c:	00178693          	addi	a3,a5,1
    80001710:	fcd43c23          	sd	a3,-40(s0)
    80001714:	00074703          	lbu	a4,0(a4)
    80001718:	00e78023          	sb	a4,0(a5)
    8000171c:	0007c783          	lbu	a5,0(a5)
    80001720:	f7f1                	bnez	a5,800016ec <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001722:	a809                	j	80001734 <strncpy+0x66>
    *s++ = 0;
    80001724:	fd843783          	ld	a5,-40(s0)
    80001728:	00178713          	addi	a4,a5,1
    8000172c:	fce43c23          	sd	a4,-40(s0)
    80001730:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    80001734:	fcc42783          	lw	a5,-52(s0)
    80001738:	fff7871b          	addiw	a4,a5,-1
    8000173c:	fce42623          	sw	a4,-52(s0)
    80001740:	fef042e3          	bgtz	a5,80001724 <strncpy+0x56>
  return os;
    80001744:	fe843783          	ld	a5,-24(s0)
}
    80001748:	853e                	mv	a0,a5
    8000174a:	7462                	ld	s0,56(sp)
    8000174c:	6121                	addi	sp,sp,64
    8000174e:	8082                	ret

0000000080001750 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001750:	7139                	addi	sp,sp,-64
    80001752:	fc22                	sd	s0,56(sp)
    80001754:	0080                	addi	s0,sp,64
    80001756:	fca43c23          	sd	a0,-40(s0)
    8000175a:	fcb43823          	sd	a1,-48(s0)
    8000175e:	87b2                	mv	a5,a2
    80001760:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001764:	fd843783          	ld	a5,-40(s0)
    80001768:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    8000176c:	fcc42783          	lw	a5,-52(s0)
    80001770:	2781                	sext.w	a5,a5
    80001772:	00f04563          	bgtz	a5,8000177c <safestrcpy+0x2c>
    return os;
    80001776:	fe843783          	ld	a5,-24(s0)
    8000177a:	a0a9                	j	800017c4 <safestrcpy+0x74>
  while(--n > 0 && (*s++ = *t++) != 0)
    8000177c:	0001                	nop
    8000177e:	fcc42783          	lw	a5,-52(s0)
    80001782:	37fd                	addiw	a5,a5,-1
    80001784:	fcf42623          	sw	a5,-52(s0)
    80001788:	fcc42783          	lw	a5,-52(s0)
    8000178c:	2781                	sext.w	a5,a5
    8000178e:	02f05563          	blez	a5,800017b8 <safestrcpy+0x68>
    80001792:	fd043703          	ld	a4,-48(s0)
    80001796:	00170793          	addi	a5,a4,1
    8000179a:	fcf43823          	sd	a5,-48(s0)
    8000179e:	fd843783          	ld	a5,-40(s0)
    800017a2:	00178693          	addi	a3,a5,1
    800017a6:	fcd43c23          	sd	a3,-40(s0)
    800017aa:	00074703          	lbu	a4,0(a4)
    800017ae:	00e78023          	sb	a4,0(a5)
    800017b2:	0007c783          	lbu	a5,0(a5)
    800017b6:	f7e1                	bnez	a5,8000177e <safestrcpy+0x2e>
    ;
  *s = 0;
    800017b8:	fd843783          	ld	a5,-40(s0)
    800017bc:	00078023          	sb	zero,0(a5)
  return os;
    800017c0:	fe843783          	ld	a5,-24(s0)
}
    800017c4:	853e                	mv	a0,a5
    800017c6:	7462                	ld	s0,56(sp)
    800017c8:	6121                	addi	sp,sp,64
    800017ca:	8082                	ret

00000000800017cc <strlen>:

int
strlen(const char *s)
{
    800017cc:	7179                	addi	sp,sp,-48
    800017ce:	f422                	sd	s0,40(sp)
    800017d0:	1800                	addi	s0,sp,48
    800017d2:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017d6:	fe042623          	sw	zero,-20(s0)
    800017da:	a031                	j	800017e6 <strlen+0x1a>
    800017dc:	fec42783          	lw	a5,-20(s0)
    800017e0:	2785                	addiw	a5,a5,1
    800017e2:	fef42623          	sw	a5,-20(s0)
    800017e6:	fec42783          	lw	a5,-20(s0)
    800017ea:	fd843703          	ld	a4,-40(s0)
    800017ee:	97ba                	add	a5,a5,a4
    800017f0:	0007c783          	lbu	a5,0(a5)
    800017f4:	f7e5                	bnez	a5,800017dc <strlen+0x10>
    ;
  return n;
    800017f6:	fec42783          	lw	a5,-20(s0)
}
    800017fa:	853e                	mv	a0,a5
    800017fc:	7422                	ld	s0,40(sp)
    800017fe:	6145                	addi	sp,sp,48
    80001800:	8082                	ret

0000000080001802 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    80001802:	1141                	addi	sp,sp,-16
    80001804:	e406                	sd	ra,8(sp)
    80001806:	e022                	sd	s0,0(sp)
    80001808:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    8000180a:	00001097          	auipc	ra,0x1
    8000180e:	fd8080e7          	jalr	-40(ra) # 800027e2 <cpuid>
    80001812:	87aa                	mv	a5,a0
    80001814:	efd5                	bnez	a5,800018d0 <main+0xce>
    consoleinit();
    80001816:	fffff097          	auipc	ra,0xfffff
    8000181a:	04e080e7          	jalr	78(ra) # 80000864 <consoleinit>
    printfinit();
    8000181e:	fffff097          	auipc	ra,0xfffff
    80001822:	4be080e7          	jalr	1214(ra) # 80000cdc <printfinit>
    printf("\n");
    80001826:	0000a517          	auipc	a0,0xa
    8000182a:	85a50513          	addi	a0,a0,-1958 # 8000b080 <etext+0x80>
    8000182e:	fffff097          	auipc	ra,0xfffff
    80001832:	206080e7          	jalr	518(ra) # 80000a34 <printf>
    printf("xv6 kernel is booting\n");
    80001836:	0000a517          	auipc	a0,0xa
    8000183a:	85250513          	addi	a0,a0,-1966 # 8000b088 <etext+0x88>
    8000183e:	fffff097          	auipc	ra,0xfffff
    80001842:	1f6080e7          	jalr	502(ra) # 80000a34 <printf>
    printf("\n");
    80001846:	0000a517          	auipc	a0,0xa
    8000184a:	83a50513          	addi	a0,a0,-1990 # 8000b080 <etext+0x80>
    8000184e:	fffff097          	auipc	ra,0xfffff
    80001852:	1e6080e7          	jalr	486(ra) # 80000a34 <printf>
    kinit();         // physical page allocator
    80001856:	fffff097          	auipc	ra,0xfffff
    8000185a:	792080e7          	jalr	1938(ra) # 80000fe8 <kinit>
    kvminit();       // create kernel page table
    8000185e:	00000097          	auipc	ra,0x0
    80001862:	1f4080e7          	jalr	500(ra) # 80001a52 <kvminit>
    kvminithart();   // turn on paging
    80001866:	00000097          	auipc	ra,0x0
    8000186a:	212080e7          	jalr	530(ra) # 80001a78 <kvminithart>
    procinit();      // process table
    8000186e:	00001097          	auipc	ra,0x1
    80001872:	ea6080e7          	jalr	-346(ra) # 80002714 <procinit>
    trapinit();      // trap vectors
    80001876:	00002097          	auipc	ra,0x2
    8000187a:	186080e7          	jalr	390(ra) # 800039fc <trapinit>
    trapinithart();  // install kernel trap vector
    8000187e:	00002097          	auipc	ra,0x2
    80001882:	1a8080e7          	jalr	424(ra) # 80003a26 <trapinithart>
    plicinit();      // set up interrupt controller
    80001886:	00007097          	auipc	ra,0x7
    8000188a:	fe4080e7          	jalr	-28(ra) # 8000886a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000188e:	00007097          	auipc	ra,0x7
    80001892:	000080e7          	jalr	ra # 8000888e <plicinithart>
    binit();         // buffer cache
    80001896:	00003097          	auipc	ra,0x3
    8000189a:	b84080e7          	jalr	-1148(ra) # 8000441a <binit>
    iinit();         // inode table
    8000189e:	00003097          	auipc	ra,0x3
    800018a2:	3ba080e7          	jalr	954(ra) # 80004c58 <iinit>
    fileinit();      // file table
    800018a6:	00005097          	auipc	ra,0x5
    800018aa:	d9c080e7          	jalr	-612(ra) # 80006642 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018ae:	00007097          	auipc	ra,0x7
    800018b2:	0b4080e7          	jalr	180(ra) # 80008962 <virtio_disk_init>
    userinit();      // first user process
    800018b6:	00001097          	auipc	ra,0x1
    800018ba:	30a080e7          	jalr	778(ra) # 80002bc0 <userinit>
    __sync_synchronize();
    800018be:	0ff0000f          	fence
    started = 1;
    800018c2:	00012797          	auipc	a5,0x12
    800018c6:	28e78793          	addi	a5,a5,654 # 80013b50 <started>
    800018ca:	4705                	li	a4,1
    800018cc:	c398                	sw	a4,0(a5)
    800018ce:	a0a9                	j	80001918 <main+0x116>
  } else {
    while(started == 0)
    800018d0:	0001                	nop
    800018d2:	00012797          	auipc	a5,0x12
    800018d6:	27e78793          	addi	a5,a5,638 # 80013b50 <started>
    800018da:	439c                	lw	a5,0(a5)
    800018dc:	2781                	sext.w	a5,a5
    800018de:	dbf5                	beqz	a5,800018d2 <main+0xd0>
      ;
    __sync_synchronize();
    800018e0:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018e4:	00001097          	auipc	ra,0x1
    800018e8:	efe080e7          	jalr	-258(ra) # 800027e2 <cpuid>
    800018ec:	87aa                	mv	a5,a0
    800018ee:	85be                	mv	a1,a5
    800018f0:	00009517          	auipc	a0,0x9
    800018f4:	7b050513          	addi	a0,a0,1968 # 8000b0a0 <etext+0xa0>
    800018f8:	fffff097          	auipc	ra,0xfffff
    800018fc:	13c080e7          	jalr	316(ra) # 80000a34 <printf>
    kvminithart();    // turn on paging
    80001900:	00000097          	auipc	ra,0x0
    80001904:	178080e7          	jalr	376(ra) # 80001a78 <kvminithart>
    trapinithart();   // install kernel trap vector
    80001908:	00002097          	auipc	ra,0x2
    8000190c:	11e080e7          	jalr	286(ra) # 80003a26 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001910:	00007097          	auipc	ra,0x7
    80001914:	f7e080e7          	jalr	-130(ra) # 8000888e <plicinithart>
  }

  scheduler();        
    80001918:	00002097          	auipc	ra,0x2
    8000191c:	8be080e7          	jalr	-1858(ra) # 800031d6 <scheduler>

0000000080001920 <w_satp>:
{
    80001920:	1101                	addi	sp,sp,-32
    80001922:	ec22                	sd	s0,24(sp)
    80001924:	1000                	addi	s0,sp,32
    80001926:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000192a:	fe843783          	ld	a5,-24(s0)
    8000192e:	18079073          	csrw	satp,a5
}
    80001932:	0001                	nop
    80001934:	6462                	ld	s0,24(sp)
    80001936:	6105                	addi	sp,sp,32
    80001938:	8082                	ret

000000008000193a <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000193a:	1141                	addi	sp,sp,-16
    8000193c:	e422                	sd	s0,8(sp)
    8000193e:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001940:	12000073          	sfence.vma
}
    80001944:	0001                	nop
    80001946:	6422                	ld	s0,8(sp)
    80001948:	0141                	addi	sp,sp,16
    8000194a:	8082                	ret

000000008000194c <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    8000194c:	1101                	addi	sp,sp,-32
    8000194e:	ec06                	sd	ra,24(sp)
    80001950:	e822                	sd	s0,16(sp)
    80001952:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001954:	fffff097          	auipc	ra,0xfffff
    80001958:	7d0080e7          	jalr	2000(ra) # 80001124 <kalloc>
    8000195c:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001960:	6605                	lui	a2,0x1
    80001962:	4581                	li	a1,0
    80001964:	fe843503          	ld	a0,-24(s0)
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	ae4080e7          	jalr	-1308(ra) # 8000144c <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001970:	4719                	li	a4,6
    80001972:	6685                	lui	a3,0x1
    80001974:	10000637          	lui	a2,0x10000
    80001978:	100005b7          	lui	a1,0x10000
    8000197c:	fe843503          	ld	a0,-24(s0)
    80001980:	00000097          	auipc	ra,0x0
    80001984:	2a2080e7          	jalr	674(ra) # 80001c22 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001988:	4719                	li	a4,6
    8000198a:	6685                	lui	a3,0x1
    8000198c:	10001637          	lui	a2,0x10001
    80001990:	100015b7          	lui	a1,0x10001
    80001994:	fe843503          	ld	a0,-24(s0)
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	28a080e7          	jalr	650(ra) # 80001c22 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    800019a0:	4719                	li	a4,6
    800019a2:	004006b7          	lui	a3,0x400
    800019a6:	0c000637          	lui	a2,0xc000
    800019aa:	0c0005b7          	lui	a1,0xc000
    800019ae:	fe843503          	ld	a0,-24(s0)
    800019b2:	00000097          	auipc	ra,0x0
    800019b6:	270080e7          	jalr	624(ra) # 80001c22 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ba:	00009717          	auipc	a4,0x9
    800019be:	64670713          	addi	a4,a4,1606 # 8000b000 <etext>
    800019c2:	800007b7          	lui	a5,0x80000
    800019c6:	97ba                	add	a5,a5,a4
    800019c8:	4729                	li	a4,10
    800019ca:	86be                	mv	a3,a5
    800019cc:	4785                	li	a5,1
    800019ce:	01f79613          	slli	a2,a5,0x1f
    800019d2:	4785                	li	a5,1
    800019d4:	01f79593          	slli	a1,a5,0x1f
    800019d8:	fe843503          	ld	a0,-24(s0)
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	246080e7          	jalr	582(ra) # 80001c22 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019e4:	00009597          	auipc	a1,0x9
    800019e8:	61c58593          	addi	a1,a1,1564 # 8000b000 <etext>
    800019ec:	00009617          	auipc	a2,0x9
    800019f0:	61460613          	addi	a2,a2,1556 # 8000b000 <etext>
    800019f4:	00009797          	auipc	a5,0x9
    800019f8:	60c78793          	addi	a5,a5,1548 # 8000b000 <etext>
    800019fc:	4745                	li	a4,17
    800019fe:	076e                	slli	a4,a4,0x1b
    80001a00:	40f707b3          	sub	a5,a4,a5
    80001a04:	4719                	li	a4,6
    80001a06:	86be                	mv	a3,a5
    80001a08:	fe843503          	ld	a0,-24(s0)
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	216080e7          	jalr	534(ra) # 80001c22 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a14:	00008797          	auipc	a5,0x8
    80001a18:	5ec78793          	addi	a5,a5,1516 # 8000a000 <_trampoline>
    80001a1c:	4729                	li	a4,10
    80001a1e:	6685                	lui	a3,0x1
    80001a20:	863e                	mv	a2,a5
    80001a22:	040007b7          	lui	a5,0x4000
    80001a26:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80001a28:	00c79593          	slli	a1,a5,0xc
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	1f2080e7          	jalr	498(ra) # 80001c22 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001a38:	fe843503          	ld	a0,-24(s0)
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	c1c080e7          	jalr	-996(ra) # 80002658 <proc_mapstacks>
  
  return kpgtbl;
    80001a44:	fe843783          	ld	a5,-24(s0)
}
    80001a48:	853e                	mv	a0,a5
    80001a4a:	60e2                	ld	ra,24(sp)
    80001a4c:	6442                	ld	s0,16(sp)
    80001a4e:	6105                	addi	sp,sp,32
    80001a50:	8082                	ret

0000000080001a52 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a52:	1141                	addi	sp,sp,-16
    80001a54:	e406                	sd	ra,8(sp)
    80001a56:	e022                	sd	s0,0(sp)
    80001a58:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a5a:	00000097          	auipc	ra,0x0
    80001a5e:	ef2080e7          	jalr	-270(ra) # 8000194c <kvmmake>
    80001a62:	872a                	mv	a4,a0
    80001a64:	0000a797          	auipc	a5,0xa
    80001a68:	e7478793          	addi	a5,a5,-396 # 8000b8d8 <kernel_pagetable>
    80001a6c:	e398                	sd	a4,0(a5)
}
    80001a6e:	0001                	nop
    80001a70:	60a2                	ld	ra,8(sp)
    80001a72:	6402                	ld	s0,0(sp)
    80001a74:	0141                	addi	sp,sp,16
    80001a76:	8082                	ret

0000000080001a78 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a78:	1141                	addi	sp,sp,-16
    80001a7a:	e406                	sd	ra,8(sp)
    80001a7c:	e022                	sd	s0,0(sp)
    80001a7e:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	eba080e7          	jalr	-326(ra) # 8000193a <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001a88:	0000a797          	auipc	a5,0xa
    80001a8c:	e5078793          	addi	a5,a5,-432 # 8000b8d8 <kernel_pagetable>
    80001a90:	639c                	ld	a5,0(a5)
    80001a92:	00c7d713          	srli	a4,a5,0xc
    80001a96:	57fd                	li	a5,-1
    80001a98:	17fe                	slli	a5,a5,0x3f
    80001a9a:	8fd9                	or	a5,a5,a4
    80001a9c:	853e                	mv	a0,a5
    80001a9e:	00000097          	auipc	ra,0x0
    80001aa2:	e82080e7          	jalr	-382(ra) # 80001920 <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001aa6:	00000097          	auipc	ra,0x0
    80001aaa:	e94080e7          	jalr	-364(ra) # 8000193a <sfence_vma>
}
    80001aae:	0001                	nop
    80001ab0:	60a2                	ld	ra,8(sp)
    80001ab2:	6402                	ld	s0,0(sp)
    80001ab4:	0141                	addi	sp,sp,16
    80001ab6:	8082                	ret

0000000080001ab8 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001ab8:	7139                	addi	sp,sp,-64
    80001aba:	fc06                	sd	ra,56(sp)
    80001abc:	f822                	sd	s0,48(sp)
    80001abe:	0080                	addi	s0,sp,64
    80001ac0:	fca43c23          	sd	a0,-40(s0)
    80001ac4:	fcb43823          	sd	a1,-48(s0)
    80001ac8:	87b2                	mv	a5,a2
    80001aca:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001ace:	fd043703          	ld	a4,-48(s0)
    80001ad2:	57fd                	li	a5,-1
    80001ad4:	83e9                	srli	a5,a5,0x1a
    80001ad6:	00e7fa63          	bgeu	a5,a4,80001aea <walk+0x32>
    panic("walk");
    80001ada:	00009517          	auipc	a0,0x9
    80001ade:	5de50513          	addi	a0,a0,1502 # 8000b0b8 <etext+0xb8>
    80001ae2:	fffff097          	auipc	ra,0xfffff
    80001ae6:	1a8080e7          	jalr	424(ra) # 80000c8a <panic>

  for(int level = 2; level > 0; level--) {
    80001aea:	4789                	li	a5,2
    80001aec:	fef42623          	sw	a5,-20(s0)
    80001af0:	a851                	j	80001b84 <walk+0xcc>
    pte_t *pte = &pagetable[PX(level, va)];
    80001af2:	fec42783          	lw	a5,-20(s0)
    80001af6:	873e                	mv	a4,a5
    80001af8:	87ba                	mv	a5,a4
    80001afa:	0037979b          	slliw	a5,a5,0x3
    80001afe:	9fb9                	addw	a5,a5,a4
    80001b00:	2781                	sext.w	a5,a5
    80001b02:	27b1                	addiw	a5,a5,12
    80001b04:	2781                	sext.w	a5,a5
    80001b06:	873e                	mv	a4,a5
    80001b08:	fd043783          	ld	a5,-48(s0)
    80001b0c:	00e7d7b3          	srl	a5,a5,a4
    80001b10:	1ff7f793          	andi	a5,a5,511
    80001b14:	078e                	slli	a5,a5,0x3
    80001b16:	fd843703          	ld	a4,-40(s0)
    80001b1a:	97ba                	add	a5,a5,a4
    80001b1c:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b20:	fe043783          	ld	a5,-32(s0)
    80001b24:	639c                	ld	a5,0(a5)
    80001b26:	8b85                	andi	a5,a5,1
    80001b28:	cb89                	beqz	a5,80001b3a <walk+0x82>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b2a:	fe043783          	ld	a5,-32(s0)
    80001b2e:	639c                	ld	a5,0(a5)
    80001b30:	83a9                	srli	a5,a5,0xa
    80001b32:	07b2                	slli	a5,a5,0xc
    80001b34:	fcf43c23          	sd	a5,-40(s0)
    80001b38:	a089                	j	80001b7a <walk+0xc2>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b3a:	fcc42783          	lw	a5,-52(s0)
    80001b3e:	2781                	sext.w	a5,a5
    80001b40:	cb91                	beqz	a5,80001b54 <walk+0x9c>
    80001b42:	fffff097          	auipc	ra,0xfffff
    80001b46:	5e2080e7          	jalr	1506(ra) # 80001124 <kalloc>
    80001b4a:	fca43c23          	sd	a0,-40(s0)
    80001b4e:	fd843783          	ld	a5,-40(s0)
    80001b52:	e399                	bnez	a5,80001b58 <walk+0xa0>
        return 0;
    80001b54:	4781                	li	a5,0
    80001b56:	a0a9                	j	80001ba0 <walk+0xe8>
      memset(pagetable, 0, PGSIZE);
    80001b58:	6605                	lui	a2,0x1
    80001b5a:	4581                	li	a1,0
    80001b5c:	fd843503          	ld	a0,-40(s0)
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	8ec080e7          	jalr	-1812(ra) # 8000144c <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b68:	fd843783          	ld	a5,-40(s0)
    80001b6c:	83b1                	srli	a5,a5,0xc
    80001b6e:	07aa                	slli	a5,a5,0xa
    80001b70:	0017e713          	ori	a4,a5,1
    80001b74:	fe043783          	ld	a5,-32(s0)
    80001b78:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b7a:	fec42783          	lw	a5,-20(s0)
    80001b7e:	37fd                	addiw	a5,a5,-1
    80001b80:	fef42623          	sw	a5,-20(s0)
    80001b84:	fec42783          	lw	a5,-20(s0)
    80001b88:	2781                	sext.w	a5,a5
    80001b8a:	f6f044e3          	bgtz	a5,80001af2 <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b8e:	fd043783          	ld	a5,-48(s0)
    80001b92:	83b1                	srli	a5,a5,0xc
    80001b94:	1ff7f793          	andi	a5,a5,511
    80001b98:	078e                	slli	a5,a5,0x3
    80001b9a:	fd843703          	ld	a4,-40(s0)
    80001b9e:	97ba                	add	a5,a5,a4
}
    80001ba0:	853e                	mv	a0,a5
    80001ba2:	70e2                	ld	ra,56(sp)
    80001ba4:	7442                	ld	s0,48(sp)
    80001ba6:	6121                	addi	sp,sp,64
    80001ba8:	8082                	ret

0000000080001baa <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001baa:	7179                	addi	sp,sp,-48
    80001bac:	f406                	sd	ra,40(sp)
    80001bae:	f022                	sd	s0,32(sp)
    80001bb0:	1800                	addi	s0,sp,48
    80001bb2:	fca43c23          	sd	a0,-40(s0)
    80001bb6:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001bba:	fd043703          	ld	a4,-48(s0)
    80001bbe:	57fd                	li	a5,-1
    80001bc0:	83e9                	srli	a5,a5,0x1a
    80001bc2:	00e7f463          	bgeu	a5,a4,80001bca <walkaddr+0x20>
    return 0;
    80001bc6:	4781                	li	a5,0
    80001bc8:	a881                	j	80001c18 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bca:	4601                	li	a2,0
    80001bcc:	fd043583          	ld	a1,-48(s0)
    80001bd0:	fd843503          	ld	a0,-40(s0)
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	ee4080e7          	jalr	-284(ra) # 80001ab8 <walk>
    80001bdc:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001be0:	fe843783          	ld	a5,-24(s0)
    80001be4:	e399                	bnez	a5,80001bea <walkaddr+0x40>
    return 0;
    80001be6:	4781                	li	a5,0
    80001be8:	a805                	j	80001c18 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bea:	fe843783          	ld	a5,-24(s0)
    80001bee:	639c                	ld	a5,0(a5)
    80001bf0:	8b85                	andi	a5,a5,1
    80001bf2:	e399                	bnez	a5,80001bf8 <walkaddr+0x4e>
    return 0;
    80001bf4:	4781                	li	a5,0
    80001bf6:	a00d                	j	80001c18 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001bf8:	fe843783          	ld	a5,-24(s0)
    80001bfc:	639c                	ld	a5,0(a5)
    80001bfe:	8bc1                	andi	a5,a5,16
    80001c00:	e399                	bnez	a5,80001c06 <walkaddr+0x5c>
    return 0;
    80001c02:	4781                	li	a5,0
    80001c04:	a811                	j	80001c18 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001c06:	fe843783          	ld	a5,-24(s0)
    80001c0a:	639c                	ld	a5,0(a5)
    80001c0c:	83a9                	srli	a5,a5,0xa
    80001c0e:	07b2                	slli	a5,a5,0xc
    80001c10:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001c14:	fe043783          	ld	a5,-32(s0)
}
    80001c18:	853e                	mv	a0,a5
    80001c1a:	70a2                	ld	ra,40(sp)
    80001c1c:	7402                	ld	s0,32(sp)
    80001c1e:	6145                	addi	sp,sp,48
    80001c20:	8082                	ret

0000000080001c22 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c22:	7139                	addi	sp,sp,-64
    80001c24:	fc06                	sd	ra,56(sp)
    80001c26:	f822                	sd	s0,48(sp)
    80001c28:	0080                	addi	s0,sp,64
    80001c2a:	fea43423          	sd	a0,-24(s0)
    80001c2e:	feb43023          	sd	a1,-32(s0)
    80001c32:	fcc43c23          	sd	a2,-40(s0)
    80001c36:	fcd43823          	sd	a3,-48(s0)
    80001c3a:	87ba                	mv	a5,a4
    80001c3c:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c40:	fcc42783          	lw	a5,-52(s0)
    80001c44:	873e                	mv	a4,a5
    80001c46:	fd843683          	ld	a3,-40(s0)
    80001c4a:	fd043603          	ld	a2,-48(s0)
    80001c4e:	fe043583          	ld	a1,-32(s0)
    80001c52:	fe843503          	ld	a0,-24(s0)
    80001c56:	00000097          	auipc	ra,0x0
    80001c5a:	026080e7          	jalr	38(ra) # 80001c7c <mappages>
    80001c5e:	87aa                	mv	a5,a0
    80001c60:	cb89                	beqz	a5,80001c72 <kvmmap+0x50>
    panic("kvmmap");
    80001c62:	00009517          	auipc	a0,0x9
    80001c66:	45e50513          	addi	a0,a0,1118 # 8000b0c0 <etext+0xc0>
    80001c6a:	fffff097          	auipc	ra,0xfffff
    80001c6e:	020080e7          	jalr	32(ra) # 80000c8a <panic>
}
    80001c72:	0001                	nop
    80001c74:	70e2                	ld	ra,56(sp)
    80001c76:	7442                	ld	s0,48(sp)
    80001c78:	6121                	addi	sp,sp,64
    80001c7a:	8082                	ret

0000000080001c7c <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c7c:	711d                	addi	sp,sp,-96
    80001c7e:	ec86                	sd	ra,88(sp)
    80001c80:	e8a2                	sd	s0,80(sp)
    80001c82:	1080                	addi	s0,sp,96
    80001c84:	fca43423          	sd	a0,-56(s0)
    80001c88:	fcb43023          	sd	a1,-64(s0)
    80001c8c:	fac43c23          	sd	a2,-72(s0)
    80001c90:	fad43823          	sd	a3,-80(s0)
    80001c94:	87ba                	mv	a5,a4
    80001c96:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c9a:	fb843783          	ld	a5,-72(s0)
    80001c9e:	eb89                	bnez	a5,80001cb0 <mappages+0x34>
    panic("mappages: size");
    80001ca0:	00009517          	auipc	a0,0x9
    80001ca4:	42850513          	addi	a0,a0,1064 # 8000b0c8 <etext+0xc8>
    80001ca8:	fffff097          	auipc	ra,0xfffff
    80001cac:	fe2080e7          	jalr	-30(ra) # 80000c8a <panic>
  
  a = PGROUNDDOWN(va);
    80001cb0:	fc043703          	ld	a4,-64(s0)
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001cbc:	fc043703          	ld	a4,-64(s0)
    80001cc0:	fb843783          	ld	a5,-72(s0)
    80001cc4:	97ba                	add	a5,a5,a4
    80001cc6:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffda297>
    80001cca:	77fd                	lui	a5,0xfffff
    80001ccc:	8ff9                	and	a5,a5,a4
    80001cce:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cd2:	4605                	li	a2,1
    80001cd4:	fe843583          	ld	a1,-24(s0)
    80001cd8:	fc843503          	ld	a0,-56(s0)
    80001cdc:	00000097          	auipc	ra,0x0
    80001ce0:	ddc080e7          	jalr	-548(ra) # 80001ab8 <walk>
    80001ce4:	fca43c23          	sd	a0,-40(s0)
    80001ce8:	fd843783          	ld	a5,-40(s0)
    80001cec:	e399                	bnez	a5,80001cf2 <mappages+0x76>
      return -1;
    80001cee:	57fd                	li	a5,-1
    80001cf0:	a085                	j	80001d50 <mappages+0xd4>
    if(*pte & PTE_V)
    80001cf2:	fd843783          	ld	a5,-40(s0)
    80001cf6:	639c                	ld	a5,0(a5)
    80001cf8:	8b85                	andi	a5,a5,1
    80001cfa:	cb89                	beqz	a5,80001d0c <mappages+0x90>
      panic("mappages: remap");
    80001cfc:	00009517          	auipc	a0,0x9
    80001d00:	3dc50513          	addi	a0,a0,988 # 8000b0d8 <etext+0xd8>
    80001d04:	fffff097          	auipc	ra,0xfffff
    80001d08:	f86080e7          	jalr	-122(ra) # 80000c8a <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001d0c:	fb043783          	ld	a5,-80(s0)
    80001d10:	83b1                	srli	a5,a5,0xc
    80001d12:	00a79713          	slli	a4,a5,0xa
    80001d16:	fac42783          	lw	a5,-84(s0)
    80001d1a:	8fd9                	or	a5,a5,a4
    80001d1c:	0017e713          	ori	a4,a5,1
    80001d20:	fd843783          	ld	a5,-40(s0)
    80001d24:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d26:	fe843703          	ld	a4,-24(s0)
    80001d2a:	fe043783          	ld	a5,-32(s0)
    80001d2e:	00f70f63          	beq	a4,a5,80001d4c <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d32:	fe843703          	ld	a4,-24(s0)
    80001d36:	6785                	lui	a5,0x1
    80001d38:	97ba                	add	a5,a5,a4
    80001d3a:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d3e:	fb043703          	ld	a4,-80(s0)
    80001d42:	6785                	lui	a5,0x1
    80001d44:	97ba                	add	a5,a5,a4
    80001d46:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d4a:	b761                	j	80001cd2 <mappages+0x56>
      break;
    80001d4c:	0001                	nop
  }
  return 0;
    80001d4e:	4781                	li	a5,0
}
    80001d50:	853e                	mv	a0,a5
    80001d52:	60e6                	ld	ra,88(sp)
    80001d54:	6446                	ld	s0,80(sp)
    80001d56:	6125                	addi	sp,sp,96
    80001d58:	8082                	ret

0000000080001d5a <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d5a:	715d                	addi	sp,sp,-80
    80001d5c:	e486                	sd	ra,72(sp)
    80001d5e:	e0a2                	sd	s0,64(sp)
    80001d60:	0880                	addi	s0,sp,80
    80001d62:	fca43423          	sd	a0,-56(s0)
    80001d66:	fcb43023          	sd	a1,-64(s0)
    80001d6a:	fac43c23          	sd	a2,-72(s0)
    80001d6e:	87b6                	mv	a5,a3
    80001d70:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d74:	fc043703          	ld	a4,-64(s0)
    80001d78:	6785                	lui	a5,0x1
    80001d7a:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001d7c:	8ff9                	and	a5,a5,a4
    80001d7e:	cb89                	beqz	a5,80001d90 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d80:	00009517          	auipc	a0,0x9
    80001d84:	36850513          	addi	a0,a0,872 # 8000b0e8 <etext+0xe8>
    80001d88:	fffff097          	auipc	ra,0xfffff
    80001d8c:	f02080e7          	jalr	-254(ra) # 80000c8a <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d90:	fc043783          	ld	a5,-64(s0)
    80001d94:	fef43423          	sd	a5,-24(s0)
    80001d98:	a045                	j	80001e38 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d9a:	4601                	li	a2,0
    80001d9c:	fe843583          	ld	a1,-24(s0)
    80001da0:	fc843503          	ld	a0,-56(s0)
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	d14080e7          	jalr	-748(ra) # 80001ab8 <walk>
    80001dac:	fea43023          	sd	a0,-32(s0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	eb89                	bnez	a5,80001dc6 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001db6:	00009517          	auipc	a0,0x9
    80001dba:	34a50513          	addi	a0,a0,842 # 8000b100 <etext+0x100>
    80001dbe:	fffff097          	auipc	ra,0xfffff
    80001dc2:	ecc080e7          	jalr	-308(ra) # 80000c8a <panic>
    if((*pte & PTE_V) == 0)
    80001dc6:	fe043783          	ld	a5,-32(s0)
    80001dca:	639c                	ld	a5,0(a5)
    80001dcc:	8b85                	andi	a5,a5,1
    80001dce:	eb89                	bnez	a5,80001de0 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dd0:	00009517          	auipc	a0,0x9
    80001dd4:	34050513          	addi	a0,a0,832 # 8000b110 <etext+0x110>
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	eb2080e7          	jalr	-334(ra) # 80000c8a <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001de0:	fe043783          	ld	a5,-32(s0)
    80001de4:	639c                	ld	a5,0(a5)
    80001de6:	3ff7f713          	andi	a4,a5,1023
    80001dea:	4785                	li	a5,1
    80001dec:	00f71a63          	bne	a4,a5,80001e00 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001df0:	00009517          	auipc	a0,0x9
    80001df4:	33850513          	addi	a0,a0,824 # 8000b128 <etext+0x128>
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	e92080e7          	jalr	-366(ra) # 80000c8a <panic>
    if(do_free){
    80001e00:	fb442783          	lw	a5,-76(s0)
    80001e04:	2781                	sext.w	a5,a5
    80001e06:	cf99                	beqz	a5,80001e24 <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001e08:	fe043783          	ld	a5,-32(s0)
    80001e0c:	639c                	ld	a5,0(a5)
    80001e0e:	83a9                	srli	a5,a5,0xa
    80001e10:	07b2                	slli	a5,a5,0xc
    80001e12:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e16:	fd843783          	ld	a5,-40(s0)
    80001e1a:	853e                	mv	a0,a5
    80001e1c:	fffff097          	auipc	ra,0xfffff
    80001e20:	264080e7          	jalr	612(ra) # 80001080 <kfree>
    }
    *pte = 0;
    80001e24:	fe043783          	ld	a5,-32(s0)
    80001e28:	0007b023          	sd	zero,0(a5)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e2c:	fe843703          	ld	a4,-24(s0)
    80001e30:	6785                	lui	a5,0x1
    80001e32:	97ba                	add	a5,a5,a4
    80001e34:	fef43423          	sd	a5,-24(s0)
    80001e38:	fb843783          	ld	a5,-72(s0)
    80001e3c:	00c79713          	slli	a4,a5,0xc
    80001e40:	fc043783          	ld	a5,-64(s0)
    80001e44:	97ba                	add	a5,a5,a4
    80001e46:	fe843703          	ld	a4,-24(s0)
    80001e4a:	f4f768e3          	bltu	a4,a5,80001d9a <uvmunmap+0x40>
  }
}
    80001e4e:	0001                	nop
    80001e50:	0001                	nop
    80001e52:	60a6                	ld	ra,72(sp)
    80001e54:	6406                	ld	s0,64(sp)
    80001e56:	6161                	addi	sp,sp,80
    80001e58:	8082                	ret

0000000080001e5a <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e5a:	1101                	addi	sp,sp,-32
    80001e5c:	ec06                	sd	ra,24(sp)
    80001e5e:	e822                	sd	s0,16(sp)
    80001e60:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e62:	fffff097          	auipc	ra,0xfffff
    80001e66:	2c2080e7          	jalr	706(ra) # 80001124 <kalloc>
    80001e6a:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e6e:	fe843783          	ld	a5,-24(s0)
    80001e72:	e399                	bnez	a5,80001e78 <uvmcreate+0x1e>
    return 0;
    80001e74:	4781                	li	a5,0
    80001e76:	a819                	j	80001e8c <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e78:	6605                	lui	a2,0x1
    80001e7a:	4581                	li	a1,0
    80001e7c:	fe843503          	ld	a0,-24(s0)
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	5cc080e7          	jalr	1484(ra) # 8000144c <memset>
  return pagetable;
    80001e88:	fe843783          	ld	a5,-24(s0)
}
    80001e8c:	853e                	mv	a0,a5
    80001e8e:	60e2                	ld	ra,24(sp)
    80001e90:	6442                	ld	s0,16(sp)
    80001e92:	6105                	addi	sp,sp,32
    80001e94:	8082                	ret

0000000080001e96 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e96:	7139                	addi	sp,sp,-64
    80001e98:	fc06                	sd	ra,56(sp)
    80001e9a:	f822                	sd	s0,48(sp)
    80001e9c:	0080                	addi	s0,sp,64
    80001e9e:	fca43c23          	sd	a0,-40(s0)
    80001ea2:	fcb43823          	sd	a1,-48(s0)
    80001ea6:	87b2                	mv	a5,a2
    80001ea8:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001eac:	fcc42783          	lw	a5,-52(s0)
    80001eb0:	0007871b          	sext.w	a4,a5
    80001eb4:	6785                	lui	a5,0x1
    80001eb6:	00f76a63          	bltu	a4,a5,80001eca <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80001eba:	00009517          	auipc	a0,0x9
    80001ebe:	28650513          	addi	a0,a0,646 # 8000b140 <etext+0x140>
    80001ec2:	fffff097          	auipc	ra,0xfffff
    80001ec6:	dc8080e7          	jalr	-568(ra) # 80000c8a <panic>
  mem = kalloc();
    80001eca:	fffff097          	auipc	ra,0xfffff
    80001ece:	25a080e7          	jalr	602(ra) # 80001124 <kalloc>
    80001ed2:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ed6:	6605                	lui	a2,0x1
    80001ed8:	4581                	li	a1,0
    80001eda:	fe843503          	ld	a0,-24(s0)
    80001ede:	fffff097          	auipc	ra,0xfffff
    80001ee2:	56e080e7          	jalr	1390(ra) # 8000144c <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ee6:	fe843783          	ld	a5,-24(s0)
    80001eea:	4779                	li	a4,30
    80001eec:	86be                	mv	a3,a5
    80001eee:	6605                	lui	a2,0x1
    80001ef0:	4581                	li	a1,0
    80001ef2:	fd843503          	ld	a0,-40(s0)
    80001ef6:	00000097          	auipc	ra,0x0
    80001efa:	d86080e7          	jalr	-634(ra) # 80001c7c <mappages>
  memmove(mem, src, sz);
    80001efe:	fcc42783          	lw	a5,-52(s0)
    80001f02:	863e                	mv	a2,a5
    80001f04:	fd043583          	ld	a1,-48(s0)
    80001f08:	fe843503          	ld	a0,-24(s0)
    80001f0c:	fffff097          	auipc	ra,0xfffff
    80001f10:	624080e7          	jalr	1572(ra) # 80001530 <memmove>
}
    80001f14:	0001                	nop
    80001f16:	70e2                	ld	ra,56(sp)
    80001f18:	7442                	ld	s0,48(sp)
    80001f1a:	6121                	addi	sp,sp,64
    80001f1c:	8082                	ret

0000000080001f1e <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    80001f1e:	7139                	addi	sp,sp,-64
    80001f20:	fc06                	sd	ra,56(sp)
    80001f22:	f822                	sd	s0,48(sp)
    80001f24:	0080                	addi	s0,sp,64
    80001f26:	fca43c23          	sd	a0,-40(s0)
    80001f2a:	fcb43823          	sd	a1,-48(s0)
    80001f2e:	fcc43423          	sd	a2,-56(s0)
    80001f32:	87b6                	mv	a5,a3
    80001f34:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f38:	fc843703          	ld	a4,-56(s0)
    80001f3c:	fd043783          	ld	a5,-48(s0)
    80001f40:	00f77563          	bgeu	a4,a5,80001f4a <uvmalloc+0x2c>
    return oldsz;
    80001f44:	fd043783          	ld	a5,-48(s0)
    80001f48:	a87d                	j	80002006 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80001f4a:	fd043703          	ld	a4,-48(s0)
    80001f4e:	6785                	lui	a5,0x1
    80001f50:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001f52:	973e                	add	a4,a4,a5
    80001f54:	77fd                	lui	a5,0xfffff
    80001f56:	8ff9                	and	a5,a5,a4
    80001f58:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f5c:	fd043783          	ld	a5,-48(s0)
    80001f60:	fef43423          	sd	a5,-24(s0)
    80001f64:	a849                	j	80001ff6 <uvmalloc+0xd8>
    mem = kalloc();
    80001f66:	fffff097          	auipc	ra,0xfffff
    80001f6a:	1be080e7          	jalr	446(ra) # 80001124 <kalloc>
    80001f6e:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f72:	fe043783          	ld	a5,-32(s0)
    80001f76:	ef89                	bnez	a5,80001f90 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    80001f78:	fd043603          	ld	a2,-48(s0)
    80001f7c:	fe843583          	ld	a1,-24(s0)
    80001f80:	fd843503          	ld	a0,-40(s0)
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	08c080e7          	jalr	140(ra) # 80002010 <uvmdealloc>
      return 0;
    80001f8c:	4781                	li	a5,0
    80001f8e:	a8a5                	j	80002006 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80001f90:	6605                	lui	a2,0x1
    80001f92:	4581                	li	a1,0
    80001f94:	fe043503          	ld	a0,-32(s0)
    80001f98:	fffff097          	auipc	ra,0xfffff
    80001f9c:	4b4080e7          	jalr	1204(ra) # 8000144c <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80001fa0:	fe043783          	ld	a5,-32(s0)
    80001fa4:	fc442703          	lw	a4,-60(s0)
    80001fa8:	01276713          	ori	a4,a4,18
    80001fac:	2701                	sext.w	a4,a4
    80001fae:	86be                	mv	a3,a5
    80001fb0:	6605                	lui	a2,0x1
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	cc2080e7          	jalr	-830(ra) # 80001c7c <mappages>
    80001fc2:	87aa                	mv	a5,a0
    80001fc4:	c39d                	beqz	a5,80001fea <uvmalloc+0xcc>
      kfree(mem);
    80001fc6:	fe043503          	ld	a0,-32(s0)
    80001fca:	fffff097          	auipc	ra,0xfffff
    80001fce:	0b6080e7          	jalr	182(ra) # 80001080 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fd2:	fd043603          	ld	a2,-48(s0)
    80001fd6:	fe843583          	ld	a1,-24(s0)
    80001fda:	fd843503          	ld	a0,-40(s0)
    80001fde:	00000097          	auipc	ra,0x0
    80001fe2:	032080e7          	jalr	50(ra) # 80002010 <uvmdealloc>
      return 0;
    80001fe6:	4781                	li	a5,0
    80001fe8:	a839                	j	80002006 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fea:	fe843703          	ld	a4,-24(s0)
    80001fee:	6785                	lui	a5,0x1
    80001ff0:	97ba                	add	a5,a5,a4
    80001ff2:	fef43423          	sd	a5,-24(s0)
    80001ff6:	fe843703          	ld	a4,-24(s0)
    80001ffa:	fc843783          	ld	a5,-56(s0)
    80001ffe:	f6f764e3          	bltu	a4,a5,80001f66 <uvmalloc+0x48>
    }
  }
  return newsz;
    80002002:	fc843783          	ld	a5,-56(s0)
}
    80002006:	853e                	mv	a0,a5
    80002008:	70e2                	ld	ra,56(sp)
    8000200a:	7442                	ld	s0,48(sp)
    8000200c:	6121                	addi	sp,sp,64
    8000200e:	8082                	ret

0000000080002010 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80002010:	7139                	addi	sp,sp,-64
    80002012:	fc06                	sd	ra,56(sp)
    80002014:	f822                	sd	s0,48(sp)
    80002016:	0080                	addi	s0,sp,64
    80002018:	fca43c23          	sd	a0,-40(s0)
    8000201c:	fcb43823          	sd	a1,-48(s0)
    80002020:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002024:	fc843703          	ld	a4,-56(s0)
    80002028:	fd043783          	ld	a5,-48(s0)
    8000202c:	00f76563          	bltu	a4,a5,80002036 <uvmdealloc+0x26>
    return oldsz;
    80002030:	fd043783          	ld	a5,-48(s0)
    80002034:	a885                	j	800020a4 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002036:	fc843703          	ld	a4,-56(s0)
    8000203a:	6785                	lui	a5,0x1
    8000203c:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000203e:	973e                	add	a4,a4,a5
    80002040:	77fd                	lui	a5,0xfffff
    80002042:	8f7d                	and	a4,a4,a5
    80002044:	fd043683          	ld	a3,-48(s0)
    80002048:	6785                	lui	a5,0x1
    8000204a:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000204c:	96be                	add	a3,a3,a5
    8000204e:	77fd                	lui	a5,0xfffff
    80002050:	8ff5                	and	a5,a5,a3
    80002052:	04f77763          	bgeu	a4,a5,800020a0 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002056:	fd043703          	ld	a4,-48(s0)
    8000205a:	6785                	lui	a5,0x1
    8000205c:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000205e:	973e                	add	a4,a4,a5
    80002060:	77fd                	lui	a5,0xfffff
    80002062:	8f7d                	and	a4,a4,a5
    80002064:	fc843683          	ld	a3,-56(s0)
    80002068:	6785                	lui	a5,0x1
    8000206a:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000206c:	96be                	add	a3,a3,a5
    8000206e:	77fd                	lui	a5,0xfffff
    80002070:	8ff5                	and	a5,a5,a3
    80002072:	40f707b3          	sub	a5,a4,a5
    80002076:	83b1                	srli	a5,a5,0xc
    80002078:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8000207c:	fc843703          	ld	a4,-56(s0)
    80002080:	6785                	lui	a5,0x1
    80002082:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002084:	973e                	add	a4,a4,a5
    80002086:	77fd                	lui	a5,0xfffff
    80002088:	8ff9                	and	a5,a5,a4
    8000208a:	fec42703          	lw	a4,-20(s0)
    8000208e:	4685                	li	a3,1
    80002090:	863a                	mv	a2,a4
    80002092:	85be                	mv	a1,a5
    80002094:	fd843503          	ld	a0,-40(s0)
    80002098:	00000097          	auipc	ra,0x0
    8000209c:	cc2080e7          	jalr	-830(ra) # 80001d5a <uvmunmap>
  }

  return newsz;
    800020a0:	fc843783          	ld	a5,-56(s0)
}
    800020a4:	853e                	mv	a0,a5
    800020a6:	70e2                	ld	ra,56(sp)
    800020a8:	7442                	ld	s0,48(sp)
    800020aa:	6121                	addi	sp,sp,64
    800020ac:	8082                	ret

00000000800020ae <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    800020ae:	7139                	addi	sp,sp,-64
    800020b0:	fc06                	sd	ra,56(sp)
    800020b2:	f822                	sd	s0,48(sp)
    800020b4:	0080                	addi	s0,sp,64
    800020b6:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    800020ba:	fe042623          	sw	zero,-20(s0)
    800020be:	a88d                	j	80002130 <freewalk+0x82>
    pte_t pte = pagetable[i];
    800020c0:	fec42783          	lw	a5,-20(s0)
    800020c4:	078e                	slli	a5,a5,0x3
    800020c6:	fc843703          	ld	a4,-56(s0)
    800020ca:	97ba                	add	a5,a5,a4
    800020cc:	639c                	ld	a5,0(a5)
    800020ce:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020d2:	fe043783          	ld	a5,-32(s0)
    800020d6:	8b85                	andi	a5,a5,1
    800020d8:	cb9d                	beqz	a5,8000210e <freewalk+0x60>
    800020da:	fe043783          	ld	a5,-32(s0)
    800020de:	8bb9                	andi	a5,a5,14
    800020e0:	e79d                	bnez	a5,8000210e <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020e2:	fe043783          	ld	a5,-32(s0)
    800020e6:	83a9                	srli	a5,a5,0xa
    800020e8:	07b2                	slli	a5,a5,0xc
    800020ea:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ee:	fd843783          	ld	a5,-40(s0)
    800020f2:	853e                	mv	a0,a5
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	fba080e7          	jalr	-70(ra) # 800020ae <freewalk>
      pagetable[i] = 0;
    800020fc:	fec42783          	lw	a5,-20(s0)
    80002100:	078e                	slli	a5,a5,0x3
    80002102:	fc843703          	ld	a4,-56(s0)
    80002106:	97ba                	add	a5,a5,a4
    80002108:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffda298>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000210c:	a829                	j	80002126 <freewalk+0x78>
    } else if(pte & PTE_V){
    8000210e:	fe043783          	ld	a5,-32(s0)
    80002112:	8b85                	andi	a5,a5,1
    80002114:	cb89                	beqz	a5,80002126 <freewalk+0x78>
      panic("freewalk: leaf");
    80002116:	00009517          	auipc	a0,0x9
    8000211a:	04a50513          	addi	a0,a0,74 # 8000b160 <etext+0x160>
    8000211e:	fffff097          	auipc	ra,0xfffff
    80002122:	b6c080e7          	jalr	-1172(ra) # 80000c8a <panic>
  for(int i = 0; i < 512; i++){
    80002126:	fec42783          	lw	a5,-20(s0)
    8000212a:	2785                	addiw	a5,a5,1
    8000212c:	fef42623          	sw	a5,-20(s0)
    80002130:	fec42783          	lw	a5,-20(s0)
    80002134:	0007871b          	sext.w	a4,a5
    80002138:	1ff00793          	li	a5,511
    8000213c:	f8e7d2e3          	bge	a5,a4,800020c0 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    80002140:	fc843503          	ld	a0,-56(s0)
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	f3c080e7          	jalr	-196(ra) # 80001080 <kfree>
}
    8000214c:	0001                	nop
    8000214e:	70e2                	ld	ra,56(sp)
    80002150:	7442                	ld	s0,48(sp)
    80002152:	6121                	addi	sp,sp,64
    80002154:	8082                	ret

0000000080002156 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002156:	1101                	addi	sp,sp,-32
    80002158:	ec06                	sd	ra,24(sp)
    8000215a:	e822                	sd	s0,16(sp)
    8000215c:	1000                	addi	s0,sp,32
    8000215e:	fea43423          	sd	a0,-24(s0)
    80002162:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002166:	fe043783          	ld	a5,-32(s0)
    8000216a:	c385                	beqz	a5,8000218a <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8000216c:	fe043703          	ld	a4,-32(s0)
    80002170:	6785                	lui	a5,0x1
    80002172:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002174:	97ba                	add	a5,a5,a4
    80002176:	83b1                	srli	a5,a5,0xc
    80002178:	4685                	li	a3,1
    8000217a:	863e                	mv	a2,a5
    8000217c:	4581                	li	a1,0
    8000217e:	fe843503          	ld	a0,-24(s0)
    80002182:	00000097          	auipc	ra,0x0
    80002186:	bd8080e7          	jalr	-1064(ra) # 80001d5a <uvmunmap>
  freewalk(pagetable);
    8000218a:	fe843503          	ld	a0,-24(s0)
    8000218e:	00000097          	auipc	ra,0x0
    80002192:	f20080e7          	jalr	-224(ra) # 800020ae <freewalk>
}
    80002196:	0001                	nop
    80002198:	60e2                	ld	ra,24(sp)
    8000219a:	6442                	ld	s0,16(sp)
    8000219c:	6105                	addi	sp,sp,32
    8000219e:	8082                	ret

00000000800021a0 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    800021a0:	711d                	addi	sp,sp,-96
    800021a2:	ec86                	sd	ra,88(sp)
    800021a4:	e8a2                	sd	s0,80(sp)
    800021a6:	1080                	addi	s0,sp,96
    800021a8:	faa43c23          	sd	a0,-72(s0)
    800021ac:	fab43823          	sd	a1,-80(s0)
    800021b0:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    800021b4:	fe043423          	sd	zero,-24(s0)
    800021b8:	a0d9                	j	8000227e <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    800021ba:	4601                	li	a2,0
    800021bc:	fe843583          	ld	a1,-24(s0)
    800021c0:	fb843503          	ld	a0,-72(s0)
    800021c4:	00000097          	auipc	ra,0x0
    800021c8:	8f4080e7          	jalr	-1804(ra) # 80001ab8 <walk>
    800021cc:	fea43023          	sd	a0,-32(s0)
    800021d0:	fe043783          	ld	a5,-32(s0)
    800021d4:	eb89                	bnez	a5,800021e6 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021d6:	00009517          	auipc	a0,0x9
    800021da:	f9a50513          	addi	a0,a0,-102 # 8000b170 <etext+0x170>
    800021de:	fffff097          	auipc	ra,0xfffff
    800021e2:	aac080e7          	jalr	-1364(ra) # 80000c8a <panic>
    if((*pte & PTE_V) == 0)
    800021e6:	fe043783          	ld	a5,-32(s0)
    800021ea:	639c                	ld	a5,0(a5)
    800021ec:	8b85                	andi	a5,a5,1
    800021ee:	eb89                	bnez	a5,80002200 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021f0:	00009517          	auipc	a0,0x9
    800021f4:	fa050513          	addi	a0,a0,-96 # 8000b190 <etext+0x190>
    800021f8:	fffff097          	auipc	ra,0xfffff
    800021fc:	a92080e7          	jalr	-1390(ra) # 80000c8a <panic>
    pa = PTE2PA(*pte);
    80002200:	fe043783          	ld	a5,-32(s0)
    80002204:	639c                	ld	a5,0(a5)
    80002206:	83a9                	srli	a5,a5,0xa
    80002208:	07b2                	slli	a5,a5,0xc
    8000220a:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    8000220e:	fe043783          	ld	a5,-32(s0)
    80002212:	639c                	ld	a5,0(a5)
    80002214:	2781                	sext.w	a5,a5
    80002216:	3ff7f793          	andi	a5,a5,1023
    8000221a:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    8000221e:	fffff097          	auipc	ra,0xfffff
    80002222:	f06080e7          	jalr	-250(ra) # 80001124 <kalloc>
    80002226:	fca43423          	sd	a0,-56(s0)
    8000222a:	fc843783          	ld	a5,-56(s0)
    8000222e:	c3a5                	beqz	a5,8000228e <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    80002230:	fd843783          	ld	a5,-40(s0)
    80002234:	6605                	lui	a2,0x1
    80002236:	85be                	mv	a1,a5
    80002238:	fc843503          	ld	a0,-56(s0)
    8000223c:	fffff097          	auipc	ra,0xfffff
    80002240:	2f4080e7          	jalr	756(ra) # 80001530 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002244:	fc843783          	ld	a5,-56(s0)
    80002248:	fd442703          	lw	a4,-44(s0)
    8000224c:	86be                	mv	a3,a5
    8000224e:	6605                	lui	a2,0x1
    80002250:	fe843583          	ld	a1,-24(s0)
    80002254:	fb043503          	ld	a0,-80(s0)
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	a24080e7          	jalr	-1500(ra) # 80001c7c <mappages>
    80002260:	87aa                	mv	a5,a0
    80002262:	cb81                	beqz	a5,80002272 <uvmcopy+0xd2>
      kfree(mem);
    80002264:	fc843503          	ld	a0,-56(s0)
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	e18080e7          	jalr	-488(ra) # 80001080 <kfree>
      goto err;
    80002270:	a005                	j	80002290 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    80002272:	fe843703          	ld	a4,-24(s0)
    80002276:	6785                	lui	a5,0x1
    80002278:	97ba                	add	a5,a5,a4
    8000227a:	fef43423          	sd	a5,-24(s0)
    8000227e:	fe843703          	ld	a4,-24(s0)
    80002282:	fa843783          	ld	a5,-88(s0)
    80002286:	f2f76ae3          	bltu	a4,a5,800021ba <uvmcopy+0x1a>
    }
  }
  return 0;
    8000228a:	4781                	li	a5,0
    8000228c:	a839                	j	800022aa <uvmcopy+0x10a>
      goto err;
    8000228e:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002290:	fe843783          	ld	a5,-24(s0)
    80002294:	83b1                	srli	a5,a5,0xc
    80002296:	4685                	li	a3,1
    80002298:	863e                	mv	a2,a5
    8000229a:	4581                	li	a1,0
    8000229c:	fb043503          	ld	a0,-80(s0)
    800022a0:	00000097          	auipc	ra,0x0
    800022a4:	aba080e7          	jalr	-1350(ra) # 80001d5a <uvmunmap>
  return -1;
    800022a8:	57fd                	li	a5,-1
}
    800022aa:	853e                	mv	a0,a5
    800022ac:	60e6                	ld	ra,88(sp)
    800022ae:	6446                	ld	s0,80(sp)
    800022b0:	6125                	addi	sp,sp,96
    800022b2:	8082                	ret

00000000800022b4 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    800022b4:	7179                	addi	sp,sp,-48
    800022b6:	f406                	sd	ra,40(sp)
    800022b8:	f022                	sd	s0,32(sp)
    800022ba:	1800                	addi	s0,sp,48
    800022bc:	fca43c23          	sd	a0,-40(s0)
    800022c0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022c4:	4601                	li	a2,0
    800022c6:	fd043583          	ld	a1,-48(s0)
    800022ca:	fd843503          	ld	a0,-40(s0)
    800022ce:	fffff097          	auipc	ra,0xfffff
    800022d2:	7ea080e7          	jalr	2026(ra) # 80001ab8 <walk>
    800022d6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022da:	fe843783          	ld	a5,-24(s0)
    800022de:	eb89                	bnez	a5,800022f0 <uvmclear+0x3c>
    panic("uvmclear");
    800022e0:	00009517          	auipc	a0,0x9
    800022e4:	ed050513          	addi	a0,a0,-304 # 8000b1b0 <etext+0x1b0>
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	9a2080e7          	jalr	-1630(ra) # 80000c8a <panic>
  *pte &= ~PTE_U;
    800022f0:	fe843783          	ld	a5,-24(s0)
    800022f4:	639c                	ld	a5,0(a5)
    800022f6:	fef7f713          	andi	a4,a5,-17
    800022fa:	fe843783          	ld	a5,-24(s0)
    800022fe:	e398                	sd	a4,0(a5)
}
    80002300:	0001                	nop
    80002302:	70a2                	ld	ra,40(sp)
    80002304:	7402                	ld	s0,32(sp)
    80002306:	6145                	addi	sp,sp,48
    80002308:	8082                	ret

000000008000230a <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    8000230a:	715d                	addi	sp,sp,-80
    8000230c:	e486                	sd	ra,72(sp)
    8000230e:	e0a2                	sd	s0,64(sp)
    80002310:	0880                	addi	s0,sp,80
    80002312:	fca43423          	sd	a0,-56(s0)
    80002316:	fcb43023          	sd	a1,-64(s0)
    8000231a:	fac43c23          	sd	a2,-72(s0)
    8000231e:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002322:	a055                	j	800023c6 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002324:	fc043703          	ld	a4,-64(s0)
    80002328:	77fd                	lui	a5,0xfffff
    8000232a:	8ff9                	and	a5,a5,a4
    8000232c:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002330:	fe043583          	ld	a1,-32(s0)
    80002334:	fc843503          	ld	a0,-56(s0)
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	872080e7          	jalr	-1934(ra) # 80001baa <walkaddr>
    80002340:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002344:	fd843783          	ld	a5,-40(s0)
    80002348:	e399                	bnez	a5,8000234e <copyout+0x44>
      return -1;
    8000234a:	57fd                	li	a5,-1
    8000234c:	a049                	j	800023ce <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000234e:	fe043703          	ld	a4,-32(s0)
    80002352:	fc043783          	ld	a5,-64(s0)
    80002356:	8f1d                	sub	a4,a4,a5
    80002358:	6785                	lui	a5,0x1
    8000235a:	97ba                	add	a5,a5,a4
    8000235c:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002360:	fe843703          	ld	a4,-24(s0)
    80002364:	fb043783          	ld	a5,-80(s0)
    80002368:	00e7f663          	bgeu	a5,a4,80002374 <copyout+0x6a>
      n = len;
    8000236c:	fb043783          	ld	a5,-80(s0)
    80002370:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002374:	fc043703          	ld	a4,-64(s0)
    80002378:	fe043783          	ld	a5,-32(s0)
    8000237c:	8f1d                	sub	a4,a4,a5
    8000237e:	fd843783          	ld	a5,-40(s0)
    80002382:	97ba                	add	a5,a5,a4
    80002384:	873e                	mv	a4,a5
    80002386:	fe843783          	ld	a5,-24(s0)
    8000238a:	2781                	sext.w	a5,a5
    8000238c:	863e                	mv	a2,a5
    8000238e:	fb843583          	ld	a1,-72(s0)
    80002392:	853a                	mv	a0,a4
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	19c080e7          	jalr	412(ra) # 80001530 <memmove>

    len -= n;
    8000239c:	fb043703          	ld	a4,-80(s0)
    800023a0:	fe843783          	ld	a5,-24(s0)
    800023a4:	40f707b3          	sub	a5,a4,a5
    800023a8:	faf43823          	sd	a5,-80(s0)
    src += n;
    800023ac:	fb843703          	ld	a4,-72(s0)
    800023b0:	fe843783          	ld	a5,-24(s0)
    800023b4:	97ba                	add	a5,a5,a4
    800023b6:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    800023ba:	fe043703          	ld	a4,-32(s0)
    800023be:	6785                	lui	a5,0x1
    800023c0:	97ba                	add	a5,a5,a4
    800023c2:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023c6:	fb043783          	ld	a5,-80(s0)
    800023ca:	ffa9                	bnez	a5,80002324 <copyout+0x1a>
  }
  return 0;
    800023cc:	4781                	li	a5,0
}
    800023ce:	853e                	mv	a0,a5
    800023d0:	60a6                	ld	ra,72(sp)
    800023d2:	6406                	ld	s0,64(sp)
    800023d4:	6161                	addi	sp,sp,80
    800023d6:	8082                	ret

00000000800023d8 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023d8:	715d                	addi	sp,sp,-80
    800023da:	e486                	sd	ra,72(sp)
    800023dc:	e0a2                	sd	s0,64(sp)
    800023de:	0880                	addi	s0,sp,80
    800023e0:	fca43423          	sd	a0,-56(s0)
    800023e4:	fcb43023          	sd	a1,-64(s0)
    800023e8:	fac43c23          	sd	a2,-72(s0)
    800023ec:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023f0:	a055                	j	80002494 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023f2:	fb843703          	ld	a4,-72(s0)
    800023f6:	77fd                	lui	a5,0xfffff
    800023f8:	8ff9                	and	a5,a5,a4
    800023fa:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023fe:	fe043583          	ld	a1,-32(s0)
    80002402:	fc843503          	ld	a0,-56(s0)
    80002406:	fffff097          	auipc	ra,0xfffff
    8000240a:	7a4080e7          	jalr	1956(ra) # 80001baa <walkaddr>
    8000240e:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002412:	fd843783          	ld	a5,-40(s0)
    80002416:	e399                	bnez	a5,8000241c <copyin+0x44>
      return -1;
    80002418:	57fd                	li	a5,-1
    8000241a:	a049                	j	8000249c <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    8000241c:	fe043703          	ld	a4,-32(s0)
    80002420:	fb843783          	ld	a5,-72(s0)
    80002424:	8f1d                	sub	a4,a4,a5
    80002426:	6785                	lui	a5,0x1
    80002428:	97ba                	add	a5,a5,a4
    8000242a:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000242e:	fe843703          	ld	a4,-24(s0)
    80002432:	fb043783          	ld	a5,-80(s0)
    80002436:	00e7f663          	bgeu	a5,a4,80002442 <copyin+0x6a>
      n = len;
    8000243a:	fb043783          	ld	a5,-80(s0)
    8000243e:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002442:	fb843703          	ld	a4,-72(s0)
    80002446:	fe043783          	ld	a5,-32(s0)
    8000244a:	8f1d                	sub	a4,a4,a5
    8000244c:	fd843783          	ld	a5,-40(s0)
    80002450:	97ba                	add	a5,a5,a4
    80002452:	873e                	mv	a4,a5
    80002454:	fe843783          	ld	a5,-24(s0)
    80002458:	2781                	sext.w	a5,a5
    8000245a:	863e                	mv	a2,a5
    8000245c:	85ba                	mv	a1,a4
    8000245e:	fc043503          	ld	a0,-64(s0)
    80002462:	fffff097          	auipc	ra,0xfffff
    80002466:	0ce080e7          	jalr	206(ra) # 80001530 <memmove>

    len -= n;
    8000246a:	fb043703          	ld	a4,-80(s0)
    8000246e:	fe843783          	ld	a5,-24(s0)
    80002472:	40f707b3          	sub	a5,a4,a5
    80002476:	faf43823          	sd	a5,-80(s0)
    dst += n;
    8000247a:	fc043703          	ld	a4,-64(s0)
    8000247e:	fe843783          	ld	a5,-24(s0)
    80002482:	97ba                	add	a5,a5,a4
    80002484:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002488:	fe043703          	ld	a4,-32(s0)
    8000248c:	6785                	lui	a5,0x1
    8000248e:	97ba                	add	a5,a5,a4
    80002490:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002494:	fb043783          	ld	a5,-80(s0)
    80002498:	ffa9                	bnez	a5,800023f2 <copyin+0x1a>
  }
  return 0;
    8000249a:	4781                	li	a5,0
}
    8000249c:	853e                	mv	a0,a5
    8000249e:	60a6                	ld	ra,72(sp)
    800024a0:	6406                	ld	s0,64(sp)
    800024a2:	6161                	addi	sp,sp,80
    800024a4:	8082                	ret

00000000800024a6 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    800024a6:	711d                	addi	sp,sp,-96
    800024a8:	ec86                	sd	ra,88(sp)
    800024aa:	e8a2                	sd	s0,80(sp)
    800024ac:	1080                	addi	s0,sp,96
    800024ae:	faa43c23          	sd	a0,-72(s0)
    800024b2:	fab43823          	sd	a1,-80(s0)
    800024b6:	fac43423          	sd	a2,-88(s0)
    800024ba:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    800024be:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    800024c2:	a0f1                	j	8000258e <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024c4:	fa843703          	ld	a4,-88(s0)
    800024c8:	77fd                	lui	a5,0xfffff
    800024ca:	8ff9                	and	a5,a5,a4
    800024cc:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024d0:	fd043583          	ld	a1,-48(s0)
    800024d4:	fb843503          	ld	a0,-72(s0)
    800024d8:	fffff097          	auipc	ra,0xfffff
    800024dc:	6d2080e7          	jalr	1746(ra) # 80001baa <walkaddr>
    800024e0:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024e4:	fc843783          	ld	a5,-56(s0)
    800024e8:	e399                	bnez	a5,800024ee <copyinstr+0x48>
      return -1;
    800024ea:	57fd                	li	a5,-1
    800024ec:	a87d                	j	800025aa <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ee:	fd043703          	ld	a4,-48(s0)
    800024f2:	fa843783          	ld	a5,-88(s0)
    800024f6:	8f1d                	sub	a4,a4,a5
    800024f8:	6785                	lui	a5,0x1
    800024fa:	97ba                	add	a5,a5,a4
    800024fc:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002500:	fe843703          	ld	a4,-24(s0)
    80002504:	fa043783          	ld	a5,-96(s0)
    80002508:	00e7f663          	bgeu	a5,a4,80002514 <copyinstr+0x6e>
      n = max;
    8000250c:	fa043783          	ld	a5,-96(s0)
    80002510:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002514:	fa843703          	ld	a4,-88(s0)
    80002518:	fd043783          	ld	a5,-48(s0)
    8000251c:	8f1d                	sub	a4,a4,a5
    8000251e:	fc843783          	ld	a5,-56(s0)
    80002522:	97ba                	add	a5,a5,a4
    80002524:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002528:	a891                	j	8000257c <copyinstr+0xd6>
      if(*p == '\0'){
    8000252a:	fd843783          	ld	a5,-40(s0)
    8000252e:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002532:	eb89                	bnez	a5,80002544 <copyinstr+0x9e>
        *dst = '\0';
    80002534:	fb043783          	ld	a5,-80(s0)
    80002538:	00078023          	sb	zero,0(a5)
        got_null = 1;
    8000253c:	4785                	li	a5,1
    8000253e:	fef42223          	sw	a5,-28(s0)
        break;
    80002542:	a081                	j	80002582 <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0007c703          	lbu	a4,0(a5)
    8000254c:	fb043783          	ld	a5,-80(s0)
    80002550:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002554:	fe843783          	ld	a5,-24(s0)
    80002558:	17fd                	addi	a5,a5,-1
    8000255a:	fef43423          	sd	a5,-24(s0)
      --max;
    8000255e:	fa043783          	ld	a5,-96(s0)
    80002562:	17fd                	addi	a5,a5,-1
    80002564:	faf43023          	sd	a5,-96(s0)
      p++;
    80002568:	fd843783          	ld	a5,-40(s0)
    8000256c:	0785                	addi	a5,a5,1
    8000256e:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002572:	fb043783          	ld	a5,-80(s0)
    80002576:	0785                	addi	a5,a5,1
    80002578:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    8000257c:	fe843783          	ld	a5,-24(s0)
    80002580:	f7cd                	bnez	a5,8000252a <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002582:	fd043703          	ld	a4,-48(s0)
    80002586:	6785                	lui	a5,0x1
    80002588:	97ba                	add	a5,a5,a4
    8000258a:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000258e:	fe442783          	lw	a5,-28(s0)
    80002592:	2781                	sext.w	a5,a5
    80002594:	e781                	bnez	a5,8000259c <copyinstr+0xf6>
    80002596:	fa043783          	ld	a5,-96(s0)
    8000259a:	f78d                	bnez	a5,800024c4 <copyinstr+0x1e>
  }
  if(got_null){
    8000259c:	fe442783          	lw	a5,-28(s0)
    800025a0:	2781                	sext.w	a5,a5
    800025a2:	c399                	beqz	a5,800025a8 <copyinstr+0x102>
    return 0;
    800025a4:	4781                	li	a5,0
    800025a6:	a011                	j	800025aa <copyinstr+0x104>
  } else {
    return -1;
    800025a8:	57fd                	li	a5,-1
  }
}
    800025aa:	853e                	mv	a0,a5
    800025ac:	60e6                	ld	ra,88(sp)
    800025ae:	6446                	ld	s0,80(sp)
    800025b0:	6125                	addi	sp,sp,96
    800025b2:	8082                	ret

00000000800025b4 <r_sstatus>:
{
    800025b4:	1101                	addi	sp,sp,-32
    800025b6:	ec22                	sd	s0,24(sp)
    800025b8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800025ba:	100027f3          	csrr	a5,sstatus
    800025be:	fef43423          	sd	a5,-24(s0)
  return x;
    800025c2:	fe843783          	ld	a5,-24(s0)
}
    800025c6:	853e                	mv	a0,a5
    800025c8:	6462                	ld	s0,24(sp)
    800025ca:	6105                	addi	sp,sp,32
    800025cc:	8082                	ret

00000000800025ce <w_sstatus>:
{
    800025ce:	1101                	addi	sp,sp,-32
    800025d0:	ec22                	sd	s0,24(sp)
    800025d2:	1000                	addi	s0,sp,32
    800025d4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025d8:	fe843783          	ld	a5,-24(s0)
    800025dc:	10079073          	csrw	sstatus,a5
}
    800025e0:	0001                	nop
    800025e2:	6462                	ld	s0,24(sp)
    800025e4:	6105                	addi	sp,sp,32
    800025e6:	8082                	ret

00000000800025e8 <intr_on>:
{
    800025e8:	1141                	addi	sp,sp,-16
    800025ea:	e406                	sd	ra,8(sp)
    800025ec:	e022                	sd	s0,0(sp)
    800025ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025f0:	00000097          	auipc	ra,0x0
    800025f4:	fc4080e7          	jalr	-60(ra) # 800025b4 <r_sstatus>
    800025f8:	87aa                	mv	a5,a0
    800025fa:	0027e793          	ori	a5,a5,2
    800025fe:	853e                	mv	a0,a5
    80002600:	00000097          	auipc	ra,0x0
    80002604:	fce080e7          	jalr	-50(ra) # 800025ce <w_sstatus>
}
    80002608:	0001                	nop
    8000260a:	60a2                	ld	ra,8(sp)
    8000260c:	6402                	ld	s0,0(sp)
    8000260e:	0141                	addi	sp,sp,16
    80002610:	8082                	ret

0000000080002612 <intr_get>:
{
    80002612:	1101                	addi	sp,sp,-32
    80002614:	ec06                	sd	ra,24(sp)
    80002616:	e822                	sd	s0,16(sp)
    80002618:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    8000261a:	00000097          	auipc	ra,0x0
    8000261e:	f9a080e7          	jalr	-102(ra) # 800025b4 <r_sstatus>
    80002622:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002626:	fe843783          	ld	a5,-24(s0)
    8000262a:	8b89                	andi	a5,a5,2
    8000262c:	00f037b3          	snez	a5,a5
    80002630:	0ff7f793          	zext.b	a5,a5
    80002634:	2781                	sext.w	a5,a5
}
    80002636:	853e                	mv	a0,a5
    80002638:	60e2                	ld	ra,24(sp)
    8000263a:	6442                	ld	s0,16(sp)
    8000263c:	6105                	addi	sp,sp,32
    8000263e:	8082                	ret

0000000080002640 <r_tp>:
{
    80002640:	1101                	addi	sp,sp,-32
    80002642:	ec22                	sd	s0,24(sp)
    80002644:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002646:	8792                	mv	a5,tp
    80002648:	fef43423          	sd	a5,-24(s0)
  return x;
    8000264c:	fe843783          	ld	a5,-24(s0)
}
    80002650:	853e                	mv	a0,a5
    80002652:	6462                	ld	s0,24(sp)
    80002654:	6105                	addi	sp,sp,32
    80002656:	8082                	ret

0000000080002658 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002658:	7139                	addi	sp,sp,-64
    8000265a:	fc06                	sd	ra,56(sp)
    8000265c:	f822                	sd	s0,48(sp)
    8000265e:	0080                	addi	s0,sp,64
    80002660:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002664:	00012797          	auipc	a5,0x12
    80002668:	8f478793          	addi	a5,a5,-1804 # 80013f58 <proc>
    8000266c:	fef43423          	sd	a5,-24(s0)
    80002670:	a061                	j	800026f8 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002672:	fffff097          	auipc	ra,0xfffff
    80002676:	ab2080e7          	jalr	-1358(ra) # 80001124 <kalloc>
    8000267a:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000267e:	fe043783          	ld	a5,-32(s0)
    80002682:	eb89                	bnez	a5,80002694 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002684:	00009517          	auipc	a0,0x9
    80002688:	b3c50513          	addi	a0,a0,-1220 # 8000b1c0 <etext+0x1c0>
    8000268c:	ffffe097          	auipc	ra,0xffffe
    80002690:	5fe080e7          	jalr	1534(ra) # 80000c8a <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002694:	fe843703          	ld	a4,-24(s0)
    80002698:	00012797          	auipc	a5,0x12
    8000269c:	8c078793          	addi	a5,a5,-1856 # 80013f58 <proc>
    800026a0:	40f707b3          	sub	a5,a4,a5
    800026a4:	4037d713          	srai	a4,a5,0x3
    800026a8:	00009797          	auipc	a5,0x9
    800026ac:	c1078793          	addi	a5,a5,-1008 # 8000b2b8 <etext+0x2b8>
    800026b0:	639c                	ld	a5,0(a5)
    800026b2:	02f707b3          	mul	a5,a4,a5
    800026b6:	2781                	sext.w	a5,a5
    800026b8:	2785                	addiw	a5,a5,1
    800026ba:	2781                	sext.w	a5,a5
    800026bc:	00d7979b          	slliw	a5,a5,0xd
    800026c0:	2781                	sext.w	a5,a5
    800026c2:	873e                	mv	a4,a5
    800026c4:	040007b7          	lui	a5,0x4000
    800026c8:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    800026ca:	07b2                	slli	a5,a5,0xc
    800026cc:	8f99                	sub	a5,a5,a4
    800026ce:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026d2:	fe043783          	ld	a5,-32(s0)
    800026d6:	4719                	li	a4,6
    800026d8:	6685                	lui	a3,0x1
    800026da:	863e                	mv	a2,a5
    800026dc:	fd843583          	ld	a1,-40(s0)
    800026e0:	fc843503          	ld	a0,-56(s0)
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	53e080e7          	jalr	1342(ra) # 80001c22 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026ec:	fe843783          	ld	a5,-24(s0)
    800026f0:	16878793          	addi	a5,a5,360
    800026f4:	fef43423          	sd	a5,-24(s0)
    800026f8:	fe843703          	ld	a4,-24(s0)
    800026fc:	00017797          	auipc	a5,0x17
    80002700:	25c78793          	addi	a5,a5,604 # 80019958 <pid_lock>
    80002704:	f6f767e3          	bltu	a4,a5,80002672 <proc_mapstacks+0x1a>
  }
}
    80002708:	0001                	nop
    8000270a:	0001                	nop
    8000270c:	70e2                	ld	ra,56(sp)
    8000270e:	7442                	ld	s0,48(sp)
    80002710:	6121                	addi	sp,sp,64
    80002712:	8082                	ret

0000000080002714 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002714:	1101                	addi	sp,sp,-32
    80002716:	ec06                	sd	ra,24(sp)
    80002718:	e822                	sd	s0,16(sp)
    8000271a:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    8000271c:	00009597          	auipc	a1,0x9
    80002720:	aac58593          	addi	a1,a1,-1364 # 8000b1c8 <etext+0x1c8>
    80002724:	00017517          	auipc	a0,0x17
    80002728:	23450513          	addi	a0,a0,564 # 80019958 <pid_lock>
    8000272c:	fffff097          	auipc	ra,0xfffff
    80002730:	b1c080e7          	jalr	-1252(ra) # 80001248 <initlock>
  initlock(&wait_lock, "wait_lock");
    80002734:	00009597          	auipc	a1,0x9
    80002738:	a9c58593          	addi	a1,a1,-1380 # 8000b1d0 <etext+0x1d0>
    8000273c:	00017517          	auipc	a0,0x17
    80002740:	23450513          	addi	a0,a0,564 # 80019970 <wait_lock>
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	b04080e7          	jalr	-1276(ra) # 80001248 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    8000274c:	00012797          	auipc	a5,0x12
    80002750:	80c78793          	addi	a5,a5,-2036 # 80013f58 <proc>
    80002754:	fef43423          	sd	a5,-24(s0)
    80002758:	a0bd                	j	800027c6 <procinit+0xb2>
      initlock(&p->lock, "proc");
    8000275a:	fe843783          	ld	a5,-24(s0)
    8000275e:	00009597          	auipc	a1,0x9
    80002762:	a8258593          	addi	a1,a1,-1406 # 8000b1e0 <etext+0x1e0>
    80002766:	853e                	mv	a0,a5
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	ae0080e7          	jalr	-1312(ra) # 80001248 <initlock>
      p->state = UNUSED;
    80002770:	fe843783          	ld	a5,-24(s0)
    80002774:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002778:	fe843703          	ld	a4,-24(s0)
    8000277c:	00011797          	auipc	a5,0x11
    80002780:	7dc78793          	addi	a5,a5,2012 # 80013f58 <proc>
    80002784:	40f707b3          	sub	a5,a4,a5
    80002788:	4037d713          	srai	a4,a5,0x3
    8000278c:	00009797          	auipc	a5,0x9
    80002790:	b2c78793          	addi	a5,a5,-1236 # 8000b2b8 <etext+0x2b8>
    80002794:	639c                	ld	a5,0(a5)
    80002796:	02f707b3          	mul	a5,a4,a5
    8000279a:	2781                	sext.w	a5,a5
    8000279c:	2785                	addiw	a5,a5,1
    8000279e:	2781                	sext.w	a5,a5
    800027a0:	00d7979b          	slliw	a5,a5,0xd
    800027a4:	2781                	sext.w	a5,a5
    800027a6:	873e                	mv	a4,a5
    800027a8:	040007b7          	lui	a5,0x4000
    800027ac:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    800027ae:	07b2                	slli	a5,a5,0xc
    800027b0:	8f99                	sub	a5,a5,a4
    800027b2:	873e                	mv	a4,a5
    800027b4:	fe843783          	ld	a5,-24(s0)
    800027b8:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    800027ba:	fe843783          	ld	a5,-24(s0)
    800027be:	16878793          	addi	a5,a5,360
    800027c2:	fef43423          	sd	a5,-24(s0)
    800027c6:	fe843703          	ld	a4,-24(s0)
    800027ca:	00017797          	auipc	a5,0x17
    800027ce:	18e78793          	addi	a5,a5,398 # 80019958 <pid_lock>
    800027d2:	f8f764e3          	bltu	a4,a5,8000275a <procinit+0x46>
  }
}
    800027d6:	0001                	nop
    800027d8:	0001                	nop
    800027da:	60e2                	ld	ra,24(sp)
    800027dc:	6442                	ld	s0,16(sp)
    800027de:	6105                	addi	sp,sp,32
    800027e0:	8082                	ret

00000000800027e2 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027e2:	1101                	addi	sp,sp,-32
    800027e4:	ec06                	sd	ra,24(sp)
    800027e6:	e822                	sd	s0,16(sp)
    800027e8:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027ea:	00000097          	auipc	ra,0x0
    800027ee:	e56080e7          	jalr	-426(ra) # 80002640 <r_tp>
    800027f2:	87aa                	mv	a5,a0
    800027f4:	fef42623          	sw	a5,-20(s0)
  return id;
    800027f8:	fec42783          	lw	a5,-20(s0)
}
    800027fc:	853e                	mv	a0,a5
    800027fe:	60e2                	ld	ra,24(sp)
    80002800:	6442                	ld	s0,16(sp)
    80002802:	6105                	addi	sp,sp,32
    80002804:	8082                	ret

0000000080002806 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002806:	1101                	addi	sp,sp,-32
    80002808:	ec06                	sd	ra,24(sp)
    8000280a:	e822                	sd	s0,16(sp)
    8000280c:	1000                	addi	s0,sp,32
  int id = cpuid();
    8000280e:	00000097          	auipc	ra,0x0
    80002812:	fd4080e7          	jalr	-44(ra) # 800027e2 <cpuid>
    80002816:	87aa                	mv	a5,a0
    80002818:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    8000281c:	fec42783          	lw	a5,-20(s0)
    80002820:	00779713          	slli	a4,a5,0x7
    80002824:	00011797          	auipc	a5,0x11
    80002828:	33478793          	addi	a5,a5,820 # 80013b58 <cpus>
    8000282c:	97ba                	add	a5,a5,a4
    8000282e:	fef43023          	sd	a5,-32(s0)
  return c;
    80002832:	fe043783          	ld	a5,-32(s0)
}
    80002836:	853e                	mv	a0,a5
    80002838:	60e2                	ld	ra,24(sp)
    8000283a:	6442                	ld	s0,16(sp)
    8000283c:	6105                	addi	sp,sp,32
    8000283e:	8082                	ret

0000000080002840 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002840:	1101                	addi	sp,sp,-32
    80002842:	ec06                	sd	ra,24(sp)
    80002844:	e822                	sd	s0,16(sp)
    80002846:	1000                	addi	s0,sp,32
  push_off();
    80002848:	fffff097          	auipc	ra,0xfffff
    8000284c:	b2e080e7          	jalr	-1234(ra) # 80001376 <push_off>
  struct cpu *c = mycpu();
    80002850:	00000097          	auipc	ra,0x0
    80002854:	fb6080e7          	jalr	-74(ra) # 80002806 <mycpu>
    80002858:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    8000285c:	fe843783          	ld	a5,-24(s0)
    80002860:	639c                	ld	a5,0(a5)
    80002862:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002866:	fffff097          	auipc	ra,0xfffff
    8000286a:	b68080e7          	jalr	-1176(ra) # 800013ce <pop_off>
  return p;
    8000286e:	fe043783          	ld	a5,-32(s0)
}
    80002872:	853e                	mv	a0,a5
    80002874:	60e2                	ld	ra,24(sp)
    80002876:	6442                	ld	s0,16(sp)
    80002878:	6105                	addi	sp,sp,32
    8000287a:	8082                	ret

000000008000287c <allocpid>:

int
allocpid()
{
    8000287c:	1101                	addi	sp,sp,-32
    8000287e:	ec06                	sd	ra,24(sp)
    80002880:	e822                	sd	s0,16(sp)
    80002882:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002884:	00017517          	auipc	a0,0x17
    80002888:	0d450513          	addi	a0,a0,212 # 80019958 <pid_lock>
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	9ec080e7          	jalr	-1556(ra) # 80001278 <acquire>
  pid = nextpid;
    80002894:	00009797          	auipc	a5,0x9
    80002898:	ecc78793          	addi	a5,a5,-308 # 8000b760 <nextpid>
    8000289c:	439c                	lw	a5,0(a5)
    8000289e:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    800028a2:	00009797          	auipc	a5,0x9
    800028a6:	ebe78793          	addi	a5,a5,-322 # 8000b760 <nextpid>
    800028aa:	439c                	lw	a5,0(a5)
    800028ac:	2785                	addiw	a5,a5,1
    800028ae:	0007871b          	sext.w	a4,a5
    800028b2:	00009797          	auipc	a5,0x9
    800028b6:	eae78793          	addi	a5,a5,-338 # 8000b760 <nextpid>
    800028ba:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    800028bc:	00017517          	auipc	a0,0x17
    800028c0:	09c50513          	addi	a0,a0,156 # 80019958 <pid_lock>
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	a18080e7          	jalr	-1512(ra) # 800012dc <release>

  return pid;
    800028cc:	fec42783          	lw	a5,-20(s0)
}
    800028d0:	853e                	mv	a0,a5
    800028d2:	60e2                	ld	ra,24(sp)
    800028d4:	6442                	ld	s0,16(sp)
    800028d6:	6105                	addi	sp,sp,32
    800028d8:	8082                	ret

00000000800028da <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028da:	1101                	addi	sp,sp,-32
    800028dc:	ec06                	sd	ra,24(sp)
    800028de:	e822                	sd	s0,16(sp)
    800028e0:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028e2:	00011797          	auipc	a5,0x11
    800028e6:	67678793          	addi	a5,a5,1654 # 80013f58 <proc>
    800028ea:	fef43423          	sd	a5,-24(s0)
    800028ee:	a80d                	j	80002920 <allocproc+0x46>
    acquire(&p->lock);
    800028f0:	fe843783          	ld	a5,-24(s0)
    800028f4:	853e                	mv	a0,a5
    800028f6:	fffff097          	auipc	ra,0xfffff
    800028fa:	982080e7          	jalr	-1662(ra) # 80001278 <acquire>
    if(p->state == UNUSED) {
    800028fe:	fe843783          	ld	a5,-24(s0)
    80002902:	4f9c                	lw	a5,24(a5)
    80002904:	cb85                	beqz	a5,80002934 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002906:	fe843783          	ld	a5,-24(s0)
    8000290a:	853e                	mv	a0,a5
    8000290c:	fffff097          	auipc	ra,0xfffff
    80002910:	9d0080e7          	jalr	-1584(ra) # 800012dc <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002914:	fe843783          	ld	a5,-24(s0)
    80002918:	16878793          	addi	a5,a5,360
    8000291c:	fef43423          	sd	a5,-24(s0)
    80002920:	fe843703          	ld	a4,-24(s0)
    80002924:	00017797          	auipc	a5,0x17
    80002928:	03478793          	addi	a5,a5,52 # 80019958 <pid_lock>
    8000292c:	fcf762e3          	bltu	a4,a5,800028f0 <allocproc+0x16>
    }
  }
  return 0;
    80002930:	4781                	li	a5,0
    80002932:	a0e1                	j	800029fa <allocproc+0x120>
      goto found;
    80002934:	0001                	nop

found:
  p->pid = allocpid();
    80002936:	00000097          	auipc	ra,0x0
    8000293a:	f46080e7          	jalr	-186(ra) # 8000287c <allocpid>
    8000293e:	87aa                	mv	a5,a0
    80002940:	873e                	mv	a4,a5
    80002942:	fe843783          	ld	a5,-24(s0)
    80002946:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	4705                	li	a4,1
    8000294e:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002950:	ffffe097          	auipc	ra,0xffffe
    80002954:	7d4080e7          	jalr	2004(ra) # 80001124 <kalloc>
    80002958:	872a                	mv	a4,a0
    8000295a:	fe843783          	ld	a5,-24(s0)
    8000295e:	efb8                	sd	a4,88(a5)
    80002960:	fe843783          	ld	a5,-24(s0)
    80002964:	6fbc                	ld	a5,88(a5)
    80002966:	e385                	bnez	a5,80002986 <allocproc+0xac>
    freeproc(p);
    80002968:	fe843503          	ld	a0,-24(s0)
    8000296c:	00000097          	auipc	ra,0x0
    80002970:	098080e7          	jalr	152(ra) # 80002a04 <freeproc>
    release(&p->lock);
    80002974:	fe843783          	ld	a5,-24(s0)
    80002978:	853e                	mv	a0,a5
    8000297a:	fffff097          	auipc	ra,0xfffff
    8000297e:	962080e7          	jalr	-1694(ra) # 800012dc <release>
    return 0;
    80002982:	4781                	li	a5,0
    80002984:	a89d                	j	800029fa <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002986:	fe843503          	ld	a0,-24(s0)
    8000298a:	00000097          	auipc	ra,0x0
    8000298e:	118080e7          	jalr	280(ra) # 80002aa2 <proc_pagetable>
    80002992:	872a                	mv	a4,a0
    80002994:	fe843783          	ld	a5,-24(s0)
    80002998:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    8000299a:	fe843783          	ld	a5,-24(s0)
    8000299e:	6bbc                	ld	a5,80(a5)
    800029a0:	e385                	bnez	a5,800029c0 <allocproc+0xe6>
    freeproc(p);
    800029a2:	fe843503          	ld	a0,-24(s0)
    800029a6:	00000097          	auipc	ra,0x0
    800029aa:	05e080e7          	jalr	94(ra) # 80002a04 <freeproc>
    release(&p->lock);
    800029ae:	fe843783          	ld	a5,-24(s0)
    800029b2:	853e                	mv	a0,a5
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	928080e7          	jalr	-1752(ra) # 800012dc <release>
    return 0;
    800029bc:	4781                	li	a5,0
    800029be:	a835                	j	800029fa <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    800029c0:	fe843783          	ld	a5,-24(s0)
    800029c4:	06078793          	addi	a5,a5,96
    800029c8:	07000613          	li	a2,112
    800029cc:	4581                	li	a1,0
    800029ce:	853e                	mv	a0,a5
    800029d0:	fffff097          	auipc	ra,0xfffff
    800029d4:	a7c080e7          	jalr	-1412(ra) # 8000144c <memset>
  p->context.ra = (uint64)forkret;
    800029d8:	00001717          	auipc	a4,0x1
    800029dc:	9da70713          	addi	a4,a4,-1574 # 800033b2 <forkret>
    800029e0:	fe843783          	ld	a5,-24(s0)
    800029e4:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029e6:	fe843783          	ld	a5,-24(s0)
    800029ea:	63b8                	ld	a4,64(a5)
    800029ec:	6785                	lui	a5,0x1
    800029ee:	973e                	add	a4,a4,a5
    800029f0:	fe843783          	ld	a5,-24(s0)
    800029f4:	f7b8                	sd	a4,104(a5)

  return p;
    800029f6:	fe843783          	ld	a5,-24(s0)
}
    800029fa:	853e                	mv	a0,a5
    800029fc:	60e2                	ld	ra,24(sp)
    800029fe:	6442                	ld	s0,16(sp)
    80002a00:	6105                	addi	sp,sp,32
    80002a02:	8082                	ret

0000000080002a04 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002a04:	1101                	addi	sp,sp,-32
    80002a06:	ec06                	sd	ra,24(sp)
    80002a08:	e822                	sd	s0,16(sp)
    80002a0a:	1000                	addi	s0,sp,32
    80002a0c:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002a10:	fe843783          	ld	a5,-24(s0)
    80002a14:	6fbc                	ld	a5,88(a5)
    80002a16:	cb89                	beqz	a5,80002a28 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002a18:	fe843783          	ld	a5,-24(s0)
    80002a1c:	6fbc                	ld	a5,88(a5)
    80002a1e:	853e                	mv	a0,a5
    80002a20:	ffffe097          	auipc	ra,0xffffe
    80002a24:	660080e7          	jalr	1632(ra) # 80001080 <kfree>
  p->trapframe = 0;
    80002a28:	fe843783          	ld	a5,-24(s0)
    80002a2c:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002a30:	fe843783          	ld	a5,-24(s0)
    80002a34:	6bbc                	ld	a5,80(a5)
    80002a36:	cf89                	beqz	a5,80002a50 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a38:	fe843783          	ld	a5,-24(s0)
    80002a3c:	6bb8                	ld	a4,80(a5)
    80002a3e:	fe843783          	ld	a5,-24(s0)
    80002a42:	67bc                	ld	a5,72(a5)
    80002a44:	85be                	mv	a1,a5
    80002a46:	853a                	mv	a0,a4
    80002a48:	00000097          	auipc	ra,0x0
    80002a4c:	11a080e7          	jalr	282(ra) # 80002b62 <proc_freepagetable>
  p->pagetable = 0;
    80002a50:	fe843783          	ld	a5,-24(s0)
    80002a54:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002a58:	fe843783          	ld	a5,-24(s0)
    80002a5c:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002a60:	fe843783          	ld	a5,-24(s0)
    80002a64:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002a68:	fe843783          	ld	a5,-24(s0)
    80002a6c:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002a70:	fe843783          	ld	a5,-24(s0)
    80002a74:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002a78:	fe843783          	ld	a5,-24(s0)
    80002a7c:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002a80:	fe843783          	ld	a5,-24(s0)
    80002a84:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002a88:	fe843783          	ld	a5,-24(s0)
    80002a8c:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002a90:	fe843783          	ld	a5,-24(s0)
    80002a94:	0007ac23          	sw	zero,24(a5)
}
    80002a98:	0001                	nop
    80002a9a:	60e2                	ld	ra,24(sp)
    80002a9c:	6442                	ld	s0,16(sp)
    80002a9e:	6105                	addi	sp,sp,32
    80002aa0:	8082                	ret

0000000080002aa2 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002aa2:	7179                	addi	sp,sp,-48
    80002aa4:	f406                	sd	ra,40(sp)
    80002aa6:	f022                	sd	s0,32(sp)
    80002aa8:	1800                	addi	s0,sp,48
    80002aaa:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002aae:	fffff097          	auipc	ra,0xfffff
    80002ab2:	3ac080e7          	jalr	940(ra) # 80001e5a <uvmcreate>
    80002ab6:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002aba:	fe843783          	ld	a5,-24(s0)
    80002abe:	e399                	bnez	a5,80002ac4 <proc_pagetable+0x22>
    return 0;
    80002ac0:	4781                	li	a5,0
    80002ac2:	a859                	j	80002b58 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002ac4:	00007797          	auipc	a5,0x7
    80002ac8:	53c78793          	addi	a5,a5,1340 # 8000a000 <_trampoline>
    80002acc:	4729                	li	a4,10
    80002ace:	86be                	mv	a3,a5
    80002ad0:	6605                	lui	a2,0x1
    80002ad2:	040007b7          	lui	a5,0x4000
    80002ad6:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002ad8:	00c79593          	slli	a1,a5,0xc
    80002adc:	fe843503          	ld	a0,-24(s0)
    80002ae0:	fffff097          	auipc	ra,0xfffff
    80002ae4:	19c080e7          	jalr	412(ra) # 80001c7c <mappages>
    80002ae8:	87aa                	mv	a5,a0
    80002aea:	0007db63          	bgez	a5,80002b00 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002aee:	4581                	li	a1,0
    80002af0:	fe843503          	ld	a0,-24(s0)
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	662080e7          	jalr	1634(ra) # 80002156 <uvmfree>
    return 0;
    80002afc:	4781                	li	a5,0
    80002afe:	a8a9                	j	80002b58 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002b00:	fd843783          	ld	a5,-40(s0)
    80002b04:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002b06:	4719                	li	a4,6
    80002b08:	86be                	mv	a3,a5
    80002b0a:	6605                	lui	a2,0x1
    80002b0c:	020007b7          	lui	a5,0x2000
    80002b10:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002b12:	00d79593          	slli	a1,a5,0xd
    80002b16:	fe843503          	ld	a0,-24(s0)
    80002b1a:	fffff097          	auipc	ra,0xfffff
    80002b1e:	162080e7          	jalr	354(ra) # 80001c7c <mappages>
    80002b22:	87aa                	mv	a5,a0
    80002b24:	0207d863          	bgez	a5,80002b54 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b28:	4681                	li	a3,0
    80002b2a:	4605                	li	a2,1
    80002b2c:	040007b7          	lui	a5,0x4000
    80002b30:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002b32:	00c79593          	slli	a1,a5,0xc
    80002b36:	fe843503          	ld	a0,-24(s0)
    80002b3a:	fffff097          	auipc	ra,0xfffff
    80002b3e:	220080e7          	jalr	544(ra) # 80001d5a <uvmunmap>
    uvmfree(pagetable, 0);
    80002b42:	4581                	li	a1,0
    80002b44:	fe843503          	ld	a0,-24(s0)
    80002b48:	fffff097          	auipc	ra,0xfffff
    80002b4c:	60e080e7          	jalr	1550(ra) # 80002156 <uvmfree>
    return 0;
    80002b50:	4781                	li	a5,0
    80002b52:	a019                	j	80002b58 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b54:	fe843783          	ld	a5,-24(s0)
}
    80002b58:	853e                	mv	a0,a5
    80002b5a:	70a2                	ld	ra,40(sp)
    80002b5c:	7402                	ld	s0,32(sp)
    80002b5e:	6145                	addi	sp,sp,48
    80002b60:	8082                	ret

0000000080002b62 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b62:	1101                	addi	sp,sp,-32
    80002b64:	ec06                	sd	ra,24(sp)
    80002b66:	e822                	sd	s0,16(sp)
    80002b68:	1000                	addi	s0,sp,32
    80002b6a:	fea43423          	sd	a0,-24(s0)
    80002b6e:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b72:	4681                	li	a3,0
    80002b74:	4605                	li	a2,1
    80002b76:	040007b7          	lui	a5,0x4000
    80002b7a:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002b7c:	00c79593          	slli	a1,a5,0xc
    80002b80:	fe843503          	ld	a0,-24(s0)
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	1d6080e7          	jalr	470(ra) # 80001d5a <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b8c:	4681                	li	a3,0
    80002b8e:	4605                	li	a2,1
    80002b90:	020007b7          	lui	a5,0x2000
    80002b94:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002b96:	00d79593          	slli	a1,a5,0xd
    80002b9a:	fe843503          	ld	a0,-24(s0)
    80002b9e:	fffff097          	auipc	ra,0xfffff
    80002ba2:	1bc080e7          	jalr	444(ra) # 80001d5a <uvmunmap>
  uvmfree(pagetable, sz);
    80002ba6:	fe043583          	ld	a1,-32(s0)
    80002baa:	fe843503          	ld	a0,-24(s0)
    80002bae:	fffff097          	auipc	ra,0xfffff
    80002bb2:	5a8080e7          	jalr	1448(ra) # 80002156 <uvmfree>
}
    80002bb6:	0001                	nop
    80002bb8:	60e2                	ld	ra,24(sp)
    80002bba:	6442                	ld	s0,16(sp)
    80002bbc:	6105                	addi	sp,sp,32
    80002bbe:	8082                	ret

0000000080002bc0 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002bc0:	1101                	addi	sp,sp,-32
    80002bc2:	ec06                	sd	ra,24(sp)
    80002bc4:	e822                	sd	s0,16(sp)
    80002bc6:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002bc8:	00000097          	auipc	ra,0x0
    80002bcc:	d12080e7          	jalr	-750(ra) # 800028da <allocproc>
    80002bd0:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002bd4:	00009797          	auipc	a5,0x9
    80002bd8:	d0c78793          	addi	a5,a5,-756 # 8000b8e0 <initproc>
    80002bdc:	fe843703          	ld	a4,-24(s0)
    80002be0:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002be2:	fe843783          	ld	a5,-24(s0)
    80002be6:	6bbc                	ld	a5,80(a5)
    80002be8:	03400613          	li	a2,52
    80002bec:	00009597          	auipc	a1,0x9
    80002bf0:	b9c58593          	addi	a1,a1,-1124 # 8000b788 <initcode>
    80002bf4:	853e                	mv	a0,a5
    80002bf6:	fffff097          	auipc	ra,0xfffff
    80002bfa:	2a0080e7          	jalr	672(ra) # 80001e96 <uvmfirst>
  p->sz = PGSIZE;
    80002bfe:	fe843783          	ld	a5,-24(s0)
    80002c02:	6705                	lui	a4,0x1
    80002c04:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002c06:	fe843783          	ld	a5,-24(s0)
    80002c0a:	6fbc                	ld	a5,88(a5)
    80002c0c:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002c10:	fe843783          	ld	a5,-24(s0)
    80002c14:	6fbc                	ld	a5,88(a5)
    80002c16:	6705                	lui	a4,0x1
    80002c18:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002c1a:	fe843783          	ld	a5,-24(s0)
    80002c1e:	15878793          	addi	a5,a5,344
    80002c22:	4641                	li	a2,16
    80002c24:	00008597          	auipc	a1,0x8
    80002c28:	5c458593          	addi	a1,a1,1476 # 8000b1e8 <etext+0x1e8>
    80002c2c:	853e                	mv	a0,a5
    80002c2e:	fffff097          	auipc	ra,0xfffff
    80002c32:	b22080e7          	jalr	-1246(ra) # 80001750 <safestrcpy>
  p->cwd = namei("/");
    80002c36:	00008517          	auipc	a0,0x8
    80002c3a:	5c250513          	addi	a0,a0,1474 # 8000b1f8 <etext+0x1f8>
    80002c3e:	00003097          	auipc	ra,0x3
    80002c42:	11a080e7          	jalr	282(ra) # 80005d58 <namei>
    80002c46:	872a                	mv	a4,a0
    80002c48:	fe843783          	ld	a5,-24(s0)
    80002c4c:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002c50:	fe843783          	ld	a5,-24(s0)
    80002c54:	470d                	li	a4,3
    80002c56:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002c58:	fe843783          	ld	a5,-24(s0)
    80002c5c:	853e                	mv	a0,a5
    80002c5e:	ffffe097          	auipc	ra,0xffffe
    80002c62:	67e080e7          	jalr	1662(ra) # 800012dc <release>
}
    80002c66:	0001                	nop
    80002c68:	60e2                	ld	ra,24(sp)
    80002c6a:	6442                	ld	s0,16(sp)
    80002c6c:	6105                	addi	sp,sp,32
    80002c6e:	8082                	ret

0000000080002c70 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c70:	7179                	addi	sp,sp,-48
    80002c72:	f406                	sd	ra,40(sp)
    80002c74:	f022                	sd	s0,32(sp)
    80002c76:	1800                	addi	s0,sp,48
    80002c78:	87aa                	mv	a5,a0
    80002c7a:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002c7e:	00000097          	auipc	ra,0x0
    80002c82:	bc2080e7          	jalr	-1086(ra) # 80002840 <myproc>
    80002c86:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c8a:	fe043783          	ld	a5,-32(s0)
    80002c8e:	67bc                	ld	a5,72(a5)
    80002c90:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002c94:	fdc42783          	lw	a5,-36(s0)
    80002c98:	2781                	sext.w	a5,a5
    80002c9a:	02f05963          	blez	a5,80002ccc <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002c9e:	fe043783          	ld	a5,-32(s0)
    80002ca2:	6ba8                	ld	a0,80(a5)
    80002ca4:	fdc42703          	lw	a4,-36(s0)
    80002ca8:	fe843783          	ld	a5,-24(s0)
    80002cac:	97ba                	add	a5,a5,a4
    80002cae:	4691                	li	a3,4
    80002cb0:	863e                	mv	a2,a5
    80002cb2:	fe843583          	ld	a1,-24(s0)
    80002cb6:	fffff097          	auipc	ra,0xfffff
    80002cba:	268080e7          	jalr	616(ra) # 80001f1e <uvmalloc>
    80002cbe:	fea43423          	sd	a0,-24(s0)
    80002cc2:	fe843783          	ld	a5,-24(s0)
    80002cc6:	eb95                	bnez	a5,80002cfa <growproc+0x8a>
      return -1;
    80002cc8:	57fd                	li	a5,-1
    80002cca:	a835                	j	80002d06 <growproc+0x96>
    }
  } else if(n < 0){
    80002ccc:	fdc42783          	lw	a5,-36(s0)
    80002cd0:	2781                	sext.w	a5,a5
    80002cd2:	0207d463          	bgez	a5,80002cfa <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002cd6:	fe043783          	ld	a5,-32(s0)
    80002cda:	6bb4                	ld	a3,80(a5)
    80002cdc:	fdc42703          	lw	a4,-36(s0)
    80002ce0:	fe843783          	ld	a5,-24(s0)
    80002ce4:	97ba                	add	a5,a5,a4
    80002ce6:	863e                	mv	a2,a5
    80002ce8:	fe843583          	ld	a1,-24(s0)
    80002cec:	8536                	mv	a0,a3
    80002cee:	fffff097          	auipc	ra,0xfffff
    80002cf2:	322080e7          	jalr	802(ra) # 80002010 <uvmdealloc>
    80002cf6:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002cfa:	fe043783          	ld	a5,-32(s0)
    80002cfe:	fe843703          	ld	a4,-24(s0)
    80002d02:	e7b8                	sd	a4,72(a5)
  return 0;
    80002d04:	4781                	li	a5,0
}
    80002d06:	853e                	mv	a0,a5
    80002d08:	70a2                	ld	ra,40(sp)
    80002d0a:	7402                	ld	s0,32(sp)
    80002d0c:	6145                	addi	sp,sp,48
    80002d0e:	8082                	ret

0000000080002d10 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002d10:	7179                	addi	sp,sp,-48
    80002d12:	f406                	sd	ra,40(sp)
    80002d14:	f022                	sd	s0,32(sp)
    80002d16:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d18:	00000097          	auipc	ra,0x0
    80002d1c:	b28080e7          	jalr	-1240(ra) # 80002840 <myproc>
    80002d20:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	bb6080e7          	jalr	-1098(ra) # 800028da <allocproc>
    80002d2c:	fca43c23          	sd	a0,-40(s0)
    80002d30:	fd843783          	ld	a5,-40(s0)
    80002d34:	e399                	bnez	a5,80002d3a <fork+0x2a>
    return -1;
    80002d36:	57fd                	li	a5,-1
    80002d38:	aab5                	j	80002eb4 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002d3a:	fe043783          	ld	a5,-32(s0)
    80002d3e:	6bb8                	ld	a4,80(a5)
    80002d40:	fd843783          	ld	a5,-40(s0)
    80002d44:	6bb4                	ld	a3,80(a5)
    80002d46:	fe043783          	ld	a5,-32(s0)
    80002d4a:	67bc                	ld	a5,72(a5)
    80002d4c:	863e                	mv	a2,a5
    80002d4e:	85b6                	mv	a1,a3
    80002d50:	853a                	mv	a0,a4
    80002d52:	fffff097          	auipc	ra,0xfffff
    80002d56:	44e080e7          	jalr	1102(ra) # 800021a0 <uvmcopy>
    80002d5a:	87aa                	mv	a5,a0
    80002d5c:	0207d163          	bgez	a5,80002d7e <fork+0x6e>
    freeproc(np);
    80002d60:	fd843503          	ld	a0,-40(s0)
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	ca0080e7          	jalr	-864(ra) # 80002a04 <freeproc>
    release(&np->lock);
    80002d6c:	fd843783          	ld	a5,-40(s0)
    80002d70:	853e                	mv	a0,a5
    80002d72:	ffffe097          	auipc	ra,0xffffe
    80002d76:	56a080e7          	jalr	1386(ra) # 800012dc <release>
    return -1;
    80002d7a:	57fd                	li	a5,-1
    80002d7c:	aa25                	j	80002eb4 <fork+0x1a4>
  }
  np->sz = p->sz;
    80002d7e:	fe043783          	ld	a5,-32(s0)
    80002d82:	67b8                	ld	a4,72(a5)
    80002d84:	fd843783          	ld	a5,-40(s0)
    80002d88:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002d8a:	fe043783          	ld	a5,-32(s0)
    80002d8e:	6fb8                	ld	a4,88(a5)
    80002d90:	fd843783          	ld	a5,-40(s0)
    80002d94:	6fbc                	ld	a5,88(a5)
    80002d96:	86be                	mv	a3,a5
    80002d98:	12000793          	li	a5,288
    80002d9c:	863e                	mv	a2,a5
    80002d9e:	85ba                	mv	a1,a4
    80002da0:	8536                	mv	a0,a3
    80002da2:	fffff097          	auipc	ra,0xfffff
    80002da6:	86a080e7          	jalr	-1942(ra) # 8000160c <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002daa:	fd843783          	ld	a5,-40(s0)
    80002dae:	6fbc                	ld	a5,88(a5)
    80002db0:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002db4:	fe042623          	sw	zero,-20(s0)
    80002db8:	a0a9                	j	80002e02 <fork+0xf2>
    if(p->ofile[i])
    80002dba:	fe043703          	ld	a4,-32(s0)
    80002dbe:	fec42783          	lw	a5,-20(s0)
    80002dc2:	07e9                	addi	a5,a5,26
    80002dc4:	078e                	slli	a5,a5,0x3
    80002dc6:	97ba                	add	a5,a5,a4
    80002dc8:	639c                	ld	a5,0(a5)
    80002dca:	c79d                	beqz	a5,80002df8 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002dcc:	fe043703          	ld	a4,-32(s0)
    80002dd0:	fec42783          	lw	a5,-20(s0)
    80002dd4:	07e9                	addi	a5,a5,26
    80002dd6:	078e                	slli	a5,a5,0x3
    80002dd8:	97ba                	add	a5,a5,a4
    80002dda:	639c                	ld	a5,0(a5)
    80002ddc:	853e                	mv	a0,a5
    80002dde:	00004097          	auipc	ra,0x4
    80002de2:	912080e7          	jalr	-1774(ra) # 800066f0 <filedup>
    80002de6:	86aa                	mv	a3,a0
    80002de8:	fd843703          	ld	a4,-40(s0)
    80002dec:	fec42783          	lw	a5,-20(s0)
    80002df0:	07e9                	addi	a5,a5,26
    80002df2:	078e                	slli	a5,a5,0x3
    80002df4:	97ba                	add	a5,a5,a4
    80002df6:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002df8:	fec42783          	lw	a5,-20(s0)
    80002dfc:	2785                	addiw	a5,a5,1
    80002dfe:	fef42623          	sw	a5,-20(s0)
    80002e02:	fec42783          	lw	a5,-20(s0)
    80002e06:	0007871b          	sext.w	a4,a5
    80002e0a:	47bd                	li	a5,15
    80002e0c:	fae7d7e3          	bge	a5,a4,80002dba <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002e10:	fe043783          	ld	a5,-32(s0)
    80002e14:	1507b783          	ld	a5,336(a5)
    80002e18:	853e                	mv	a0,a5
    80002e1a:	00002097          	auipc	ra,0x2
    80002e1e:	1be080e7          	jalr	446(ra) # 80004fd8 <idup>
    80002e22:	872a                	mv	a4,a0
    80002e24:	fd843783          	ld	a5,-40(s0)
    80002e28:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002e2c:	fd843783          	ld	a5,-40(s0)
    80002e30:	15878713          	addi	a4,a5,344
    80002e34:	fe043783          	ld	a5,-32(s0)
    80002e38:	15878793          	addi	a5,a5,344
    80002e3c:	4641                	li	a2,16
    80002e3e:	85be                	mv	a1,a5
    80002e40:	853a                	mv	a0,a4
    80002e42:	fffff097          	auipc	ra,0xfffff
    80002e46:	90e080e7          	jalr	-1778(ra) # 80001750 <safestrcpy>

  pid = np->pid;
    80002e4a:	fd843783          	ld	a5,-40(s0)
    80002e4e:	5b9c                	lw	a5,48(a5)
    80002e50:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002e54:	fd843783          	ld	a5,-40(s0)
    80002e58:	853e                	mv	a0,a5
    80002e5a:	ffffe097          	auipc	ra,0xffffe
    80002e5e:	482080e7          	jalr	1154(ra) # 800012dc <release>

  acquire(&wait_lock);
    80002e62:	00017517          	auipc	a0,0x17
    80002e66:	b0e50513          	addi	a0,a0,-1266 # 80019970 <wait_lock>
    80002e6a:	ffffe097          	auipc	ra,0xffffe
    80002e6e:	40e080e7          	jalr	1038(ra) # 80001278 <acquire>
  np->parent = p;
    80002e72:	fd843783          	ld	a5,-40(s0)
    80002e76:	fe043703          	ld	a4,-32(s0)
    80002e7a:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002e7c:	00017517          	auipc	a0,0x17
    80002e80:	af450513          	addi	a0,a0,-1292 # 80019970 <wait_lock>
    80002e84:	ffffe097          	auipc	ra,0xffffe
    80002e88:	458080e7          	jalr	1112(ra) # 800012dc <release>

  acquire(&np->lock);
    80002e8c:	fd843783          	ld	a5,-40(s0)
    80002e90:	853e                	mv	a0,a5
    80002e92:	ffffe097          	auipc	ra,0xffffe
    80002e96:	3e6080e7          	jalr	998(ra) # 80001278 <acquire>
  np->state = RUNNABLE;
    80002e9a:	fd843783          	ld	a5,-40(s0)
    80002e9e:	470d                	li	a4,3
    80002ea0:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    80002ea2:	fd843783          	ld	a5,-40(s0)
    80002ea6:	853e                	mv	a0,a5
    80002ea8:	ffffe097          	auipc	ra,0xffffe
    80002eac:	434080e7          	jalr	1076(ra) # 800012dc <release>

  return pid;
    80002eb0:	fd442783          	lw	a5,-44(s0)
}
    80002eb4:	853e                	mv	a0,a5
    80002eb6:	70a2                	ld	ra,40(sp)
    80002eb8:	7402                	ld	s0,32(sp)
    80002eba:	6145                	addi	sp,sp,48
    80002ebc:	8082                	ret

0000000080002ebe <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002ebe:	7179                	addi	sp,sp,-48
    80002ec0:	f406                	sd	ra,40(sp)
    80002ec2:	f022                	sd	s0,32(sp)
    80002ec4:	1800                	addi	s0,sp,48
    80002ec6:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002eca:	00011797          	auipc	a5,0x11
    80002ece:	08e78793          	addi	a5,a5,142 # 80013f58 <proc>
    80002ed2:	fef43423          	sd	a5,-24(s0)
    80002ed6:	a081                	j	80002f16 <reparent+0x58>
    if(pp->parent == p){
    80002ed8:	fe843783          	ld	a5,-24(s0)
    80002edc:	7f9c                	ld	a5,56(a5)
    80002ede:	fd843703          	ld	a4,-40(s0)
    80002ee2:	02f71463          	bne	a4,a5,80002f0a <reparent+0x4c>
      pp->parent = initproc;
    80002ee6:	00009797          	auipc	a5,0x9
    80002eea:	9fa78793          	addi	a5,a5,-1542 # 8000b8e0 <initproc>
    80002eee:	6398                	ld	a4,0(a5)
    80002ef0:	fe843783          	ld	a5,-24(s0)
    80002ef4:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002ef6:	00009797          	auipc	a5,0x9
    80002efa:	9ea78793          	addi	a5,a5,-1558 # 8000b8e0 <initproc>
    80002efe:	639c                	ld	a5,0(a5)
    80002f00:	853e                	mv	a0,a5
    80002f02:	00000097          	auipc	ra,0x0
    80002f06:	57c080e7          	jalr	1404(ra) # 8000347e <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002f0a:	fe843783          	ld	a5,-24(s0)
    80002f0e:	16878793          	addi	a5,a5,360
    80002f12:	fef43423          	sd	a5,-24(s0)
    80002f16:	fe843703          	ld	a4,-24(s0)
    80002f1a:	00017797          	auipc	a5,0x17
    80002f1e:	a3e78793          	addi	a5,a5,-1474 # 80019958 <pid_lock>
    80002f22:	faf76be3          	bltu	a4,a5,80002ed8 <reparent+0x1a>
    }
  }
}
    80002f26:	0001                	nop
    80002f28:	0001                	nop
    80002f2a:	70a2                	ld	ra,40(sp)
    80002f2c:	7402                	ld	s0,32(sp)
    80002f2e:	6145                	addi	sp,sp,48
    80002f30:	8082                	ret

0000000080002f32 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002f32:	7139                	addi	sp,sp,-64
    80002f34:	fc06                	sd	ra,56(sp)
    80002f36:	f822                	sd	s0,48(sp)
    80002f38:	0080                	addi	s0,sp,64
    80002f3a:	87aa                	mv	a5,a0
    80002f3c:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002f40:	00000097          	auipc	ra,0x0
    80002f44:	900080e7          	jalr	-1792(ra) # 80002840 <myproc>
    80002f48:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002f4c:	00009797          	auipc	a5,0x9
    80002f50:	99478793          	addi	a5,a5,-1644 # 8000b8e0 <initproc>
    80002f54:	639c                	ld	a5,0(a5)
    80002f56:	fe043703          	ld	a4,-32(s0)
    80002f5a:	00f71a63          	bne	a4,a5,80002f6e <exit+0x3c>
    panic("init exiting");
    80002f5e:	00008517          	auipc	a0,0x8
    80002f62:	2a250513          	addi	a0,a0,674 # 8000b200 <etext+0x200>
    80002f66:	ffffe097          	auipc	ra,0xffffe
    80002f6a:	d24080e7          	jalr	-732(ra) # 80000c8a <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002f6e:	fe042623          	sw	zero,-20(s0)
    80002f72:	a881                	j	80002fc2 <exit+0x90>
    if(p->ofile[fd]){
    80002f74:	fe043703          	ld	a4,-32(s0)
    80002f78:	fec42783          	lw	a5,-20(s0)
    80002f7c:	07e9                	addi	a5,a5,26
    80002f7e:	078e                	slli	a5,a5,0x3
    80002f80:	97ba                	add	a5,a5,a4
    80002f82:	639c                	ld	a5,0(a5)
    80002f84:	cb95                	beqz	a5,80002fb8 <exit+0x86>
      struct file *f = p->ofile[fd];
    80002f86:	fe043703          	ld	a4,-32(s0)
    80002f8a:	fec42783          	lw	a5,-20(s0)
    80002f8e:	07e9                	addi	a5,a5,26
    80002f90:	078e                	slli	a5,a5,0x3
    80002f92:	97ba                	add	a5,a5,a4
    80002f94:	639c                	ld	a5,0(a5)
    80002f96:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80002f9a:	fd843503          	ld	a0,-40(s0)
    80002f9e:	00003097          	auipc	ra,0x3
    80002fa2:	7b8080e7          	jalr	1976(ra) # 80006756 <fileclose>
      p->ofile[fd] = 0;
    80002fa6:	fe043703          	ld	a4,-32(s0)
    80002faa:	fec42783          	lw	a5,-20(s0)
    80002fae:	07e9                	addi	a5,a5,26
    80002fb0:	078e                	slli	a5,a5,0x3
    80002fb2:	97ba                	add	a5,a5,a4
    80002fb4:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80002fb8:	fec42783          	lw	a5,-20(s0)
    80002fbc:	2785                	addiw	a5,a5,1
    80002fbe:	fef42623          	sw	a5,-20(s0)
    80002fc2:	fec42783          	lw	a5,-20(s0)
    80002fc6:	0007871b          	sext.w	a4,a5
    80002fca:	47bd                	li	a5,15
    80002fcc:	fae7d4e3          	bge	a5,a4,80002f74 <exit+0x42>
    }
  }

  begin_op();
    80002fd0:	00003097          	auipc	ra,0x3
    80002fd4:	0ec080e7          	jalr	236(ra) # 800060bc <begin_op>
  iput(p->cwd);
    80002fd8:	fe043783          	ld	a5,-32(s0)
    80002fdc:	1507b783          	ld	a5,336(a5)
    80002fe0:	853e                	mv	a0,a5
    80002fe2:	00002097          	auipc	ra,0x2
    80002fe6:	1d0080e7          	jalr	464(ra) # 800051b2 <iput>
  end_op();
    80002fea:	00003097          	auipc	ra,0x3
    80002fee:	194080e7          	jalr	404(ra) # 8000617e <end_op>
  p->cwd = 0;
    80002ff2:	fe043783          	ld	a5,-32(s0)
    80002ff6:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80002ffa:	00017517          	auipc	a0,0x17
    80002ffe:	97650513          	addi	a0,a0,-1674 # 80019970 <wait_lock>
    80003002:	ffffe097          	auipc	ra,0xffffe
    80003006:	276080e7          	jalr	630(ra) # 80001278 <acquire>

  // Give any children to init.
  reparent(p);
    8000300a:	fe043503          	ld	a0,-32(s0)
    8000300e:	00000097          	auipc	ra,0x0
    80003012:	eb0080e7          	jalr	-336(ra) # 80002ebe <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003016:	fe043783          	ld	a5,-32(s0)
    8000301a:	7f9c                	ld	a5,56(a5)
    8000301c:	853e                	mv	a0,a5
    8000301e:	00000097          	auipc	ra,0x0
    80003022:	460080e7          	jalr	1120(ra) # 8000347e <wakeup>
  
  acquire(&p->lock);
    80003026:	fe043783          	ld	a5,-32(s0)
    8000302a:	853e                	mv	a0,a5
    8000302c:	ffffe097          	auipc	ra,0xffffe
    80003030:	24c080e7          	jalr	588(ra) # 80001278 <acquire>

  p->xstate = status;
    80003034:	fe043783          	ld	a5,-32(s0)
    80003038:	fcc42703          	lw	a4,-52(s0)
    8000303c:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    8000303e:	fe043783          	ld	a5,-32(s0)
    80003042:	4715                	li	a4,5
    80003044:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003046:	00017517          	auipc	a0,0x17
    8000304a:	92a50513          	addi	a0,a0,-1750 # 80019970 <wait_lock>
    8000304e:	ffffe097          	auipc	ra,0xffffe
    80003052:	28e080e7          	jalr	654(ra) # 800012dc <release>

  // Jump into the scheduler, never to return.
  sched();
    80003056:	00000097          	auipc	ra,0x0
    8000305a:	230080e7          	jalr	560(ra) # 80003286 <sched>
  panic("zombie exit");
    8000305e:	00008517          	auipc	a0,0x8
    80003062:	1b250513          	addi	a0,a0,434 # 8000b210 <etext+0x210>
    80003066:	ffffe097          	auipc	ra,0xffffe
    8000306a:	c24080e7          	jalr	-988(ra) # 80000c8a <panic>

000000008000306e <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    8000306e:	7139                	addi	sp,sp,-64
    80003070:	fc06                	sd	ra,56(sp)
    80003072:	f822                	sd	s0,48(sp)
    80003074:	0080                	addi	s0,sp,64
    80003076:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    8000307a:	fffff097          	auipc	ra,0xfffff
    8000307e:	7c6080e7          	jalr	1990(ra) # 80002840 <myproc>
    80003082:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003086:	00017517          	auipc	a0,0x17
    8000308a:	8ea50513          	addi	a0,a0,-1814 # 80019970 <wait_lock>
    8000308e:	ffffe097          	auipc	ra,0xffffe
    80003092:	1ea080e7          	jalr	490(ra) # 80001278 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003096:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    8000309a:	00011797          	auipc	a5,0x11
    8000309e:	ebe78793          	addi	a5,a5,-322 # 80013f58 <proc>
    800030a2:	fef43423          	sd	a5,-24(s0)
    800030a6:	a8d1                	j	8000317a <wait+0x10c>
      if(pp->parent == p){
    800030a8:	fe843783          	ld	a5,-24(s0)
    800030ac:	7f9c                	ld	a5,56(a5)
    800030ae:	fd843703          	ld	a4,-40(s0)
    800030b2:	0af71e63          	bne	a4,a5,8000316e <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    800030b6:	fe843783          	ld	a5,-24(s0)
    800030ba:	853e                	mv	a0,a5
    800030bc:	ffffe097          	auipc	ra,0xffffe
    800030c0:	1bc080e7          	jalr	444(ra) # 80001278 <acquire>

        havekids = 1;
    800030c4:	4785                	li	a5,1
    800030c6:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    800030ca:	fe843783          	ld	a5,-24(s0)
    800030ce:	4f9c                	lw	a5,24(a5)
    800030d0:	873e                	mv	a4,a5
    800030d2:	4795                	li	a5,5
    800030d4:	08f71663          	bne	a4,a5,80003160 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    800030d8:	fe843783          	ld	a5,-24(s0)
    800030dc:	5b9c                	lw	a5,48(a5)
    800030de:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    800030e2:	fc843783          	ld	a5,-56(s0)
    800030e6:	c7a9                	beqz	a5,80003130 <wait+0xc2>
    800030e8:	fd843783          	ld	a5,-40(s0)
    800030ec:	6bb8                	ld	a4,80(a5)
    800030ee:	fe843783          	ld	a5,-24(s0)
    800030f2:	02c78793          	addi	a5,a5,44
    800030f6:	4691                	li	a3,4
    800030f8:	863e                	mv	a2,a5
    800030fa:	fc843583          	ld	a1,-56(s0)
    800030fe:	853a                	mv	a0,a4
    80003100:	fffff097          	auipc	ra,0xfffff
    80003104:	20a080e7          	jalr	522(ra) # 8000230a <copyout>
    80003108:	87aa                	mv	a5,a0
    8000310a:	0207d363          	bgez	a5,80003130 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    8000310e:	fe843783          	ld	a5,-24(s0)
    80003112:	853e                	mv	a0,a5
    80003114:	ffffe097          	auipc	ra,0xffffe
    80003118:	1c8080e7          	jalr	456(ra) # 800012dc <release>
            release(&wait_lock);
    8000311c:	00017517          	auipc	a0,0x17
    80003120:	85450513          	addi	a0,a0,-1964 # 80019970 <wait_lock>
    80003124:	ffffe097          	auipc	ra,0xffffe
    80003128:	1b8080e7          	jalr	440(ra) # 800012dc <release>
            return -1;
    8000312c:	57fd                	li	a5,-1
    8000312e:	a879                	j	800031cc <wait+0x15e>
          }
          freeproc(pp);
    80003130:	fe843503          	ld	a0,-24(s0)
    80003134:	00000097          	auipc	ra,0x0
    80003138:	8d0080e7          	jalr	-1840(ra) # 80002a04 <freeproc>
          release(&pp->lock);
    8000313c:	fe843783          	ld	a5,-24(s0)
    80003140:	853e                	mv	a0,a5
    80003142:	ffffe097          	auipc	ra,0xffffe
    80003146:	19a080e7          	jalr	410(ra) # 800012dc <release>
          release(&wait_lock);
    8000314a:	00017517          	auipc	a0,0x17
    8000314e:	82650513          	addi	a0,a0,-2010 # 80019970 <wait_lock>
    80003152:	ffffe097          	auipc	ra,0xffffe
    80003156:	18a080e7          	jalr	394(ra) # 800012dc <release>
          return pid;
    8000315a:	fd442783          	lw	a5,-44(s0)
    8000315e:	a0bd                	j	800031cc <wait+0x15e>
        }
        release(&pp->lock);
    80003160:	fe843783          	ld	a5,-24(s0)
    80003164:	853e                	mv	a0,a5
    80003166:	ffffe097          	auipc	ra,0xffffe
    8000316a:	176080e7          	jalr	374(ra) # 800012dc <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    8000316e:	fe843783          	ld	a5,-24(s0)
    80003172:	16878793          	addi	a5,a5,360
    80003176:	fef43423          	sd	a5,-24(s0)
    8000317a:	fe843703          	ld	a4,-24(s0)
    8000317e:	00016797          	auipc	a5,0x16
    80003182:	7da78793          	addi	a5,a5,2010 # 80019958 <pid_lock>
    80003186:	f2f761e3          	bltu	a4,a5,800030a8 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    8000318a:	fe442783          	lw	a5,-28(s0)
    8000318e:	2781                	sext.w	a5,a5
    80003190:	cb89                	beqz	a5,800031a2 <wait+0x134>
    80003192:	fd843503          	ld	a0,-40(s0)
    80003196:	00000097          	auipc	ra,0x0
    8000319a:	456080e7          	jalr	1110(ra) # 800035ec <killed>
    8000319e:	87aa                	mv	a5,a0
    800031a0:	cb99                	beqz	a5,800031b6 <wait+0x148>
      release(&wait_lock);
    800031a2:	00016517          	auipc	a0,0x16
    800031a6:	7ce50513          	addi	a0,a0,1998 # 80019970 <wait_lock>
    800031aa:	ffffe097          	auipc	ra,0xffffe
    800031ae:	132080e7          	jalr	306(ra) # 800012dc <release>
      return -1;
    800031b2:	57fd                	li	a5,-1
    800031b4:	a821                	j	800031cc <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800031b6:	00016597          	auipc	a1,0x16
    800031ba:	7ba58593          	addi	a1,a1,1978 # 80019970 <wait_lock>
    800031be:	fd843503          	ld	a0,-40(s0)
    800031c2:	00000097          	auipc	ra,0x0
    800031c6:	240080e7          	jalr	576(ra) # 80003402 <sleep>
    havekids = 0;
    800031ca:	b5f1                	j	80003096 <wait+0x28>
  }
}
    800031cc:	853e                	mv	a0,a5
    800031ce:	70e2                	ld	ra,56(sp)
    800031d0:	7442                	ld	s0,48(sp)
    800031d2:	6121                	addi	sp,sp,64
    800031d4:	8082                	ret

00000000800031d6 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    800031d6:	1101                	addi	sp,sp,-32
    800031d8:	ec06                	sd	ra,24(sp)
    800031da:	e822                	sd	s0,16(sp)
    800031dc:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    800031de:	fffff097          	auipc	ra,0xfffff
    800031e2:	628080e7          	jalr	1576(ra) # 80002806 <mycpu>
    800031e6:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    800031ea:	fe043783          	ld	a5,-32(s0)
    800031ee:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    800031f2:	fffff097          	auipc	ra,0xfffff
    800031f6:	3f6080e7          	jalr	1014(ra) # 800025e8 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    800031fa:	00011797          	auipc	a5,0x11
    800031fe:	d5e78793          	addi	a5,a5,-674 # 80013f58 <proc>
    80003202:	fef43423          	sd	a5,-24(s0)
    80003206:	a0bd                	j	80003274 <scheduler+0x9e>
      acquire(&p->lock);
    80003208:	fe843783          	ld	a5,-24(s0)
    8000320c:	853e                	mv	a0,a5
    8000320e:	ffffe097          	auipc	ra,0xffffe
    80003212:	06a080e7          	jalr	106(ra) # 80001278 <acquire>
      if(p->state == RUNNABLE) {
    80003216:	fe843783          	ld	a5,-24(s0)
    8000321a:	4f9c                	lw	a5,24(a5)
    8000321c:	873e                	mv	a4,a5
    8000321e:	478d                	li	a5,3
    80003220:	02f71d63          	bne	a4,a5,8000325a <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    80003224:	fe843783          	ld	a5,-24(s0)
    80003228:	4711                	li	a4,4
    8000322a:	cf98                	sw	a4,24(a5)
        c->proc = p;
    8000322c:	fe043783          	ld	a5,-32(s0)
    80003230:	fe843703          	ld	a4,-24(s0)
    80003234:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003236:	fe043783          	ld	a5,-32(s0)
    8000323a:	00878713          	addi	a4,a5,8
    8000323e:	fe843783          	ld	a5,-24(s0)
    80003242:	06078793          	addi	a5,a5,96
    80003246:	85be                	mv	a1,a5
    80003248:	853a                	mv	a0,a4
    8000324a:	00000097          	auipc	ra,0x0
    8000324e:	5ac080e7          	jalr	1452(ra) # 800037f6 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003252:	fe043783          	ld	a5,-32(s0)
    80003256:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    8000325a:	fe843783          	ld	a5,-24(s0)
    8000325e:	853e                	mv	a0,a5
    80003260:	ffffe097          	auipc	ra,0xffffe
    80003264:	07c080e7          	jalr	124(ra) # 800012dc <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80003268:	fe843783          	ld	a5,-24(s0)
    8000326c:	16878793          	addi	a5,a5,360
    80003270:	fef43423          	sd	a5,-24(s0)
    80003274:	fe843703          	ld	a4,-24(s0)
    80003278:	00016797          	auipc	a5,0x16
    8000327c:	6e078793          	addi	a5,a5,1760 # 80019958 <pid_lock>
    80003280:	f8f764e3          	bltu	a4,a5,80003208 <scheduler+0x32>
    intr_on();
    80003284:	b7bd                	j	800031f2 <scheduler+0x1c>

0000000080003286 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003286:	7179                	addi	sp,sp,-48
    80003288:	f406                	sd	ra,40(sp)
    8000328a:	f022                	sd	s0,32(sp)
    8000328c:	ec26                	sd	s1,24(sp)
    8000328e:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003290:	fffff097          	auipc	ra,0xfffff
    80003294:	5b0080e7          	jalr	1456(ra) # 80002840 <myproc>
    80003298:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    8000329c:	fd843783          	ld	a5,-40(s0)
    800032a0:	853e                	mv	a0,a5
    800032a2:	ffffe097          	auipc	ra,0xffffe
    800032a6:	090080e7          	jalr	144(ra) # 80001332 <holding>
    800032aa:	87aa                	mv	a5,a0
    800032ac:	eb89                	bnez	a5,800032be <sched+0x38>
    panic("sched p->lock");
    800032ae:	00008517          	auipc	a0,0x8
    800032b2:	f7250513          	addi	a0,a0,-142 # 8000b220 <etext+0x220>
    800032b6:	ffffe097          	auipc	ra,0xffffe
    800032ba:	9d4080e7          	jalr	-1580(ra) # 80000c8a <panic>
  if(mycpu()->noff != 1)
    800032be:	fffff097          	auipc	ra,0xfffff
    800032c2:	548080e7          	jalr	1352(ra) # 80002806 <mycpu>
    800032c6:	87aa                	mv	a5,a0
    800032c8:	5fbc                	lw	a5,120(a5)
    800032ca:	873e                	mv	a4,a5
    800032cc:	4785                	li	a5,1
    800032ce:	00f70a63          	beq	a4,a5,800032e2 <sched+0x5c>
    panic("sched locks");
    800032d2:	00008517          	auipc	a0,0x8
    800032d6:	f5e50513          	addi	a0,a0,-162 # 8000b230 <etext+0x230>
    800032da:	ffffe097          	auipc	ra,0xffffe
    800032de:	9b0080e7          	jalr	-1616(ra) # 80000c8a <panic>
  if(p->state == RUNNING)
    800032e2:	fd843783          	ld	a5,-40(s0)
    800032e6:	4f9c                	lw	a5,24(a5)
    800032e8:	873e                	mv	a4,a5
    800032ea:	4791                	li	a5,4
    800032ec:	00f71a63          	bne	a4,a5,80003300 <sched+0x7a>
    panic("sched running");
    800032f0:	00008517          	auipc	a0,0x8
    800032f4:	f5050513          	addi	a0,a0,-176 # 8000b240 <etext+0x240>
    800032f8:	ffffe097          	auipc	ra,0xffffe
    800032fc:	992080e7          	jalr	-1646(ra) # 80000c8a <panic>
  if(intr_get())
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	312080e7          	jalr	786(ra) # 80002612 <intr_get>
    80003308:	87aa                	mv	a5,a0
    8000330a:	cb89                	beqz	a5,8000331c <sched+0x96>
    panic("sched interruptible");
    8000330c:	00008517          	auipc	a0,0x8
    80003310:	f4450513          	addi	a0,a0,-188 # 8000b250 <etext+0x250>
    80003314:	ffffe097          	auipc	ra,0xffffe
    80003318:	976080e7          	jalr	-1674(ra) # 80000c8a <panic>

  intena = mycpu()->intena;
    8000331c:	fffff097          	auipc	ra,0xfffff
    80003320:	4ea080e7          	jalr	1258(ra) # 80002806 <mycpu>
    80003324:	87aa                	mv	a5,a0
    80003326:	5ffc                	lw	a5,124(a5)
    80003328:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    8000332c:	fd843783          	ld	a5,-40(s0)
    80003330:	06078493          	addi	s1,a5,96
    80003334:	fffff097          	auipc	ra,0xfffff
    80003338:	4d2080e7          	jalr	1234(ra) # 80002806 <mycpu>
    8000333c:	87aa                	mv	a5,a0
    8000333e:	07a1                	addi	a5,a5,8
    80003340:	85be                	mv	a1,a5
    80003342:	8526                	mv	a0,s1
    80003344:	00000097          	auipc	ra,0x0
    80003348:	4b2080e7          	jalr	1202(ra) # 800037f6 <swtch>
  mycpu()->intena = intena;
    8000334c:	fffff097          	auipc	ra,0xfffff
    80003350:	4ba080e7          	jalr	1210(ra) # 80002806 <mycpu>
    80003354:	872a                	mv	a4,a0
    80003356:	fd442783          	lw	a5,-44(s0)
    8000335a:	df7c                	sw	a5,124(a4)
}
    8000335c:	0001                	nop
    8000335e:	70a2                	ld	ra,40(sp)
    80003360:	7402                	ld	s0,32(sp)
    80003362:	64e2                	ld	s1,24(sp)
    80003364:	6145                	addi	sp,sp,48
    80003366:	8082                	ret

0000000080003368 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003368:	1101                	addi	sp,sp,-32
    8000336a:	ec06                	sd	ra,24(sp)
    8000336c:	e822                	sd	s0,16(sp)
    8000336e:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80003370:	fffff097          	auipc	ra,0xfffff
    80003374:	4d0080e7          	jalr	1232(ra) # 80002840 <myproc>
    80003378:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000337c:	fe843783          	ld	a5,-24(s0)
    80003380:	853e                	mv	a0,a5
    80003382:	ffffe097          	auipc	ra,0xffffe
    80003386:	ef6080e7          	jalr	-266(ra) # 80001278 <acquire>
  p->state = RUNNABLE;
    8000338a:	fe843783          	ld	a5,-24(s0)
    8000338e:	470d                	li	a4,3
    80003390:	cf98                	sw	a4,24(a5)
  sched();
    80003392:	00000097          	auipc	ra,0x0
    80003396:	ef4080e7          	jalr	-268(ra) # 80003286 <sched>
  release(&p->lock);
    8000339a:	fe843783          	ld	a5,-24(s0)
    8000339e:	853e                	mv	a0,a5
    800033a0:	ffffe097          	auipc	ra,0xffffe
    800033a4:	f3c080e7          	jalr	-196(ra) # 800012dc <release>
}
    800033a8:	0001                	nop
    800033aa:	60e2                	ld	ra,24(sp)
    800033ac:	6442                	ld	s0,16(sp)
    800033ae:	6105                	addi	sp,sp,32
    800033b0:	8082                	ret

00000000800033b2 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800033b2:	1141                	addi	sp,sp,-16
    800033b4:	e406                	sd	ra,8(sp)
    800033b6:	e022                	sd	s0,0(sp)
    800033b8:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800033ba:	fffff097          	auipc	ra,0xfffff
    800033be:	486080e7          	jalr	1158(ra) # 80002840 <myproc>
    800033c2:	87aa                	mv	a5,a0
    800033c4:	853e                	mv	a0,a5
    800033c6:	ffffe097          	auipc	ra,0xffffe
    800033ca:	f16080e7          	jalr	-234(ra) # 800012dc <release>

  if (first) {
    800033ce:	00008797          	auipc	a5,0x8
    800033d2:	39678793          	addi	a5,a5,918 # 8000b764 <first.1>
    800033d6:	439c                	lw	a5,0(a5)
    800033d8:	cf81                	beqz	a5,800033f0 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    800033da:	00008797          	auipc	a5,0x8
    800033de:	38a78793          	addi	a5,a5,906 # 8000b764 <first.1>
    800033e2:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    800033e6:	4505                	li	a0,1
    800033e8:	00001097          	auipc	ra,0x1
    800033ec:	4de080e7          	jalr	1246(ra) # 800048c6 <fsinit>
  }

  usertrapret();
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	7b8080e7          	jalr	1976(ra) # 80003ba8 <usertrapret>
}
    800033f8:	0001                	nop
    800033fa:	60a2                	ld	ra,8(sp)
    800033fc:	6402                	ld	s0,0(sp)
    800033fe:	0141                	addi	sp,sp,16
    80003400:	8082                	ret

0000000080003402 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003402:	7179                	addi	sp,sp,-48
    80003404:	f406                	sd	ra,40(sp)
    80003406:	f022                	sd	s0,32(sp)
    80003408:	1800                	addi	s0,sp,48
    8000340a:	fca43c23          	sd	a0,-40(s0)
    8000340e:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003412:	fffff097          	auipc	ra,0xfffff
    80003416:	42e080e7          	jalr	1070(ra) # 80002840 <myproc>
    8000341a:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    8000341e:	fe843783          	ld	a5,-24(s0)
    80003422:	853e                	mv	a0,a5
    80003424:	ffffe097          	auipc	ra,0xffffe
    80003428:	e54080e7          	jalr	-428(ra) # 80001278 <acquire>
  release(lk);
    8000342c:	fd043503          	ld	a0,-48(s0)
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	eac080e7          	jalr	-340(ra) # 800012dc <release>

  // Go to sleep.
  p->chan = chan;
    80003438:	fe843783          	ld	a5,-24(s0)
    8000343c:	fd843703          	ld	a4,-40(s0)
    80003440:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003442:	fe843783          	ld	a5,-24(s0)
    80003446:	4709                	li	a4,2
    80003448:	cf98                	sw	a4,24(a5)

  sched();
    8000344a:	00000097          	auipc	ra,0x0
    8000344e:	e3c080e7          	jalr	-452(ra) # 80003286 <sched>

  // Tidy up.
  p->chan = 0;
    80003452:	fe843783          	ld	a5,-24(s0)
    80003456:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    8000345a:	fe843783          	ld	a5,-24(s0)
    8000345e:	853e                	mv	a0,a5
    80003460:	ffffe097          	auipc	ra,0xffffe
    80003464:	e7c080e7          	jalr	-388(ra) # 800012dc <release>
  acquire(lk);
    80003468:	fd043503          	ld	a0,-48(s0)
    8000346c:	ffffe097          	auipc	ra,0xffffe
    80003470:	e0c080e7          	jalr	-500(ra) # 80001278 <acquire>
}
    80003474:	0001                	nop
    80003476:	70a2                	ld	ra,40(sp)
    80003478:	7402                	ld	s0,32(sp)
    8000347a:	6145                	addi	sp,sp,48
    8000347c:	8082                	ret

000000008000347e <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    8000347e:	7179                	addi	sp,sp,-48
    80003480:	f406                	sd	ra,40(sp)
    80003482:	f022                	sd	s0,32(sp)
    80003484:	1800                	addi	s0,sp,48
    80003486:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    8000348a:	00011797          	auipc	a5,0x11
    8000348e:	ace78793          	addi	a5,a5,-1330 # 80013f58 <proc>
    80003492:	fef43423          	sd	a5,-24(s0)
    80003496:	a085                	j	800034f6 <wakeup+0x78>
    if(p != myproc()){
    80003498:	fffff097          	auipc	ra,0xfffff
    8000349c:	3a8080e7          	jalr	936(ra) # 80002840 <myproc>
    800034a0:	872a                	mv	a4,a0
    800034a2:	fe843783          	ld	a5,-24(s0)
    800034a6:	04e78263          	beq	a5,a4,800034ea <wakeup+0x6c>
      acquire(&p->lock);
    800034aa:	fe843783          	ld	a5,-24(s0)
    800034ae:	853e                	mv	a0,a5
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	dc8080e7          	jalr	-568(ra) # 80001278 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    800034b8:	fe843783          	ld	a5,-24(s0)
    800034bc:	4f9c                	lw	a5,24(a5)
    800034be:	873e                	mv	a4,a5
    800034c0:	4789                	li	a5,2
    800034c2:	00f71d63          	bne	a4,a5,800034dc <wakeup+0x5e>
    800034c6:	fe843783          	ld	a5,-24(s0)
    800034ca:	739c                	ld	a5,32(a5)
    800034cc:	fd843703          	ld	a4,-40(s0)
    800034d0:	00f71663          	bne	a4,a5,800034dc <wakeup+0x5e>
        p->state = RUNNABLE;
    800034d4:	fe843783          	ld	a5,-24(s0)
    800034d8:	470d                	li	a4,3
    800034da:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800034dc:	fe843783          	ld	a5,-24(s0)
    800034e0:	853e                	mv	a0,a5
    800034e2:	ffffe097          	auipc	ra,0xffffe
    800034e6:	dfa080e7          	jalr	-518(ra) # 800012dc <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800034ea:	fe843783          	ld	a5,-24(s0)
    800034ee:	16878793          	addi	a5,a5,360
    800034f2:	fef43423          	sd	a5,-24(s0)
    800034f6:	fe843703          	ld	a4,-24(s0)
    800034fa:	00016797          	auipc	a5,0x16
    800034fe:	45e78793          	addi	a5,a5,1118 # 80019958 <pid_lock>
    80003502:	f8f76be3          	bltu	a4,a5,80003498 <wakeup+0x1a>
    }
  }
}
    80003506:	0001                	nop
    80003508:	0001                	nop
    8000350a:	70a2                	ld	ra,40(sp)
    8000350c:	7402                	ld	s0,32(sp)
    8000350e:	6145                	addi	sp,sp,48
    80003510:	8082                	ret

0000000080003512 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003512:	7179                	addi	sp,sp,-48
    80003514:	f406                	sd	ra,40(sp)
    80003516:	f022                	sd	s0,32(sp)
    80003518:	1800                	addi	s0,sp,48
    8000351a:	87aa                	mv	a5,a0
    8000351c:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003520:	00011797          	auipc	a5,0x11
    80003524:	a3878793          	addi	a5,a5,-1480 # 80013f58 <proc>
    80003528:	fef43423          	sd	a5,-24(s0)
    8000352c:	a0ad                	j	80003596 <kill+0x84>
    acquire(&p->lock);
    8000352e:	fe843783          	ld	a5,-24(s0)
    80003532:	853e                	mv	a0,a5
    80003534:	ffffe097          	auipc	ra,0xffffe
    80003538:	d44080e7          	jalr	-700(ra) # 80001278 <acquire>
    if(p->pid == pid){
    8000353c:	fe843783          	ld	a5,-24(s0)
    80003540:	5b98                	lw	a4,48(a5)
    80003542:	fdc42783          	lw	a5,-36(s0)
    80003546:	2781                	sext.w	a5,a5
    80003548:	02e79a63          	bne	a5,a4,8000357c <kill+0x6a>
      p->killed = 1;
    8000354c:	fe843783          	ld	a5,-24(s0)
    80003550:	4705                	li	a4,1
    80003552:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003554:	fe843783          	ld	a5,-24(s0)
    80003558:	4f9c                	lw	a5,24(a5)
    8000355a:	873e                	mv	a4,a5
    8000355c:	4789                	li	a5,2
    8000355e:	00f71663          	bne	a4,a5,8000356a <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003562:	fe843783          	ld	a5,-24(s0)
    80003566:	470d                	li	a4,3
    80003568:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000356a:	fe843783          	ld	a5,-24(s0)
    8000356e:	853e                	mv	a0,a5
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	d6c080e7          	jalr	-660(ra) # 800012dc <release>
      return 0;
    80003578:	4781                	li	a5,0
    8000357a:	a03d                	j	800035a8 <kill+0x96>
    }
    release(&p->lock);
    8000357c:	fe843783          	ld	a5,-24(s0)
    80003580:	853e                	mv	a0,a5
    80003582:	ffffe097          	auipc	ra,0xffffe
    80003586:	d5a080e7          	jalr	-678(ra) # 800012dc <release>
  for(p = proc; p < &proc[NPROC]; p++){
    8000358a:	fe843783          	ld	a5,-24(s0)
    8000358e:	16878793          	addi	a5,a5,360
    80003592:	fef43423          	sd	a5,-24(s0)
    80003596:	fe843703          	ld	a4,-24(s0)
    8000359a:	00016797          	auipc	a5,0x16
    8000359e:	3be78793          	addi	a5,a5,958 # 80019958 <pid_lock>
    800035a2:	f8f766e3          	bltu	a4,a5,8000352e <kill+0x1c>
  }
  return -1;
    800035a6:	57fd                	li	a5,-1
}
    800035a8:	853e                	mv	a0,a5
    800035aa:	70a2                	ld	ra,40(sp)
    800035ac:	7402                	ld	s0,32(sp)
    800035ae:	6145                	addi	sp,sp,48
    800035b0:	8082                	ret

00000000800035b2 <setkilled>:

void
setkilled(struct proc *p)
{
    800035b2:	1101                	addi	sp,sp,-32
    800035b4:	ec06                	sd	ra,24(sp)
    800035b6:	e822                	sd	s0,16(sp)
    800035b8:	1000                	addi	s0,sp,32
    800035ba:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800035be:	fe843783          	ld	a5,-24(s0)
    800035c2:	853e                	mv	a0,a5
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	cb4080e7          	jalr	-844(ra) # 80001278 <acquire>
  p->killed = 1;
    800035cc:	fe843783          	ld	a5,-24(s0)
    800035d0:	4705                	li	a4,1
    800035d2:	d798                	sw	a4,40(a5)
  release(&p->lock);
    800035d4:	fe843783          	ld	a5,-24(s0)
    800035d8:	853e                	mv	a0,a5
    800035da:	ffffe097          	auipc	ra,0xffffe
    800035de:	d02080e7          	jalr	-766(ra) # 800012dc <release>
}
    800035e2:	0001                	nop
    800035e4:	60e2                	ld	ra,24(sp)
    800035e6:	6442                	ld	s0,16(sp)
    800035e8:	6105                	addi	sp,sp,32
    800035ea:	8082                	ret

00000000800035ec <killed>:

int
killed(struct proc *p)
{
    800035ec:	7179                	addi	sp,sp,-48
    800035ee:	f406                	sd	ra,40(sp)
    800035f0:	f022                	sd	s0,32(sp)
    800035f2:	1800                	addi	s0,sp,48
    800035f4:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    800035f8:	fd843783          	ld	a5,-40(s0)
    800035fc:	853e                	mv	a0,a5
    800035fe:	ffffe097          	auipc	ra,0xffffe
    80003602:	c7a080e7          	jalr	-902(ra) # 80001278 <acquire>
  k = p->killed;
    80003606:	fd843783          	ld	a5,-40(s0)
    8000360a:	579c                	lw	a5,40(a5)
    8000360c:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003610:	fd843783          	ld	a5,-40(s0)
    80003614:	853e                	mv	a0,a5
    80003616:	ffffe097          	auipc	ra,0xffffe
    8000361a:	cc6080e7          	jalr	-826(ra) # 800012dc <release>
  return k;
    8000361e:	fec42783          	lw	a5,-20(s0)
}
    80003622:	853e                	mv	a0,a5
    80003624:	70a2                	ld	ra,40(sp)
    80003626:	7402                	ld	s0,32(sp)
    80003628:	6145                	addi	sp,sp,48
    8000362a:	8082                	ret

000000008000362c <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000362c:	7139                	addi	sp,sp,-64
    8000362e:	fc06                	sd	ra,56(sp)
    80003630:	f822                	sd	s0,48(sp)
    80003632:	0080                	addi	s0,sp,64
    80003634:	87aa                	mv	a5,a0
    80003636:	fcb43823          	sd	a1,-48(s0)
    8000363a:	fcc43423          	sd	a2,-56(s0)
    8000363e:	fcd43023          	sd	a3,-64(s0)
    80003642:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003646:	fffff097          	auipc	ra,0xfffff
    8000364a:	1fa080e7          	jalr	506(ra) # 80002840 <myproc>
    8000364e:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003652:	fdc42783          	lw	a5,-36(s0)
    80003656:	2781                	sext.w	a5,a5
    80003658:	c38d                	beqz	a5,8000367a <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    8000365a:	fe843783          	ld	a5,-24(s0)
    8000365e:	6bbc                	ld	a5,80(a5)
    80003660:	fc043683          	ld	a3,-64(s0)
    80003664:	fc843603          	ld	a2,-56(s0)
    80003668:	fd043583          	ld	a1,-48(s0)
    8000366c:	853e                	mv	a0,a5
    8000366e:	fffff097          	auipc	ra,0xfffff
    80003672:	c9c080e7          	jalr	-868(ra) # 8000230a <copyout>
    80003676:	87aa                	mv	a5,a0
    80003678:	a839                	j	80003696 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    8000367a:	fd043783          	ld	a5,-48(s0)
    8000367e:	fc043703          	ld	a4,-64(s0)
    80003682:	2701                	sext.w	a4,a4
    80003684:	863a                	mv	a2,a4
    80003686:	fc843583          	ld	a1,-56(s0)
    8000368a:	853e                	mv	a0,a5
    8000368c:	ffffe097          	auipc	ra,0xffffe
    80003690:	ea4080e7          	jalr	-348(ra) # 80001530 <memmove>
    return 0;
    80003694:	4781                	li	a5,0
  }
}
    80003696:	853e                	mv	a0,a5
    80003698:	70e2                	ld	ra,56(sp)
    8000369a:	7442                	ld	s0,48(sp)
    8000369c:	6121                	addi	sp,sp,64
    8000369e:	8082                	ret

00000000800036a0 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800036a0:	7139                	addi	sp,sp,-64
    800036a2:	fc06                	sd	ra,56(sp)
    800036a4:	f822                	sd	s0,48(sp)
    800036a6:	0080                	addi	s0,sp,64
    800036a8:	fca43c23          	sd	a0,-40(s0)
    800036ac:	87ae                	mv	a5,a1
    800036ae:	fcc43423          	sd	a2,-56(s0)
    800036b2:	fcd43023          	sd	a3,-64(s0)
    800036b6:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800036ba:	fffff097          	auipc	ra,0xfffff
    800036be:	186080e7          	jalr	390(ra) # 80002840 <myproc>
    800036c2:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800036c6:	fd442783          	lw	a5,-44(s0)
    800036ca:	2781                	sext.w	a5,a5
    800036cc:	c38d                	beqz	a5,800036ee <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800036ce:	fe843783          	ld	a5,-24(s0)
    800036d2:	6bbc                	ld	a5,80(a5)
    800036d4:	fc043683          	ld	a3,-64(s0)
    800036d8:	fc843603          	ld	a2,-56(s0)
    800036dc:	fd843583          	ld	a1,-40(s0)
    800036e0:	853e                	mv	a0,a5
    800036e2:	fffff097          	auipc	ra,0xfffff
    800036e6:	cf6080e7          	jalr	-778(ra) # 800023d8 <copyin>
    800036ea:	87aa                	mv	a5,a0
    800036ec:	a839                	j	8000370a <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800036ee:	fc843783          	ld	a5,-56(s0)
    800036f2:	fc043703          	ld	a4,-64(s0)
    800036f6:	2701                	sext.w	a4,a4
    800036f8:	863a                	mv	a2,a4
    800036fa:	85be                	mv	a1,a5
    800036fc:	fd843503          	ld	a0,-40(s0)
    80003700:	ffffe097          	auipc	ra,0xffffe
    80003704:	e30080e7          	jalr	-464(ra) # 80001530 <memmove>
    return 0;
    80003708:	4781                	li	a5,0
  }
}
    8000370a:	853e                	mv	a0,a5
    8000370c:	70e2                	ld	ra,56(sp)
    8000370e:	7442                	ld	s0,48(sp)
    80003710:	6121                	addi	sp,sp,64
    80003712:	8082                	ret

0000000080003714 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003714:	1101                	addi	sp,sp,-32
    80003716:	ec06                	sd	ra,24(sp)
    80003718:	e822                	sd	s0,16(sp)
    8000371a:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    8000371c:	00008517          	auipc	a0,0x8
    80003720:	b4c50513          	addi	a0,a0,-1204 # 8000b268 <etext+0x268>
    80003724:	ffffd097          	auipc	ra,0xffffd
    80003728:	310080e7          	jalr	784(ra) # 80000a34 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8000372c:	00011797          	auipc	a5,0x11
    80003730:	82c78793          	addi	a5,a5,-2004 # 80013f58 <proc>
    80003734:	fef43423          	sd	a5,-24(s0)
    80003738:	a04d                	j	800037da <procdump+0xc6>
    if(p->state == UNUSED)
    8000373a:	fe843783          	ld	a5,-24(s0)
    8000373e:	4f9c                	lw	a5,24(a5)
    80003740:	c7d1                	beqz	a5,800037cc <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003742:	fe843783          	ld	a5,-24(s0)
    80003746:	4f9c                	lw	a5,24(a5)
    80003748:	873e                	mv	a4,a5
    8000374a:	4795                	li	a5,5
    8000374c:	02e7ee63          	bltu	a5,a4,80003788 <procdump+0x74>
    80003750:	fe843783          	ld	a5,-24(s0)
    80003754:	4f9c                	lw	a5,24(a5)
    80003756:	00008717          	auipc	a4,0x8
    8000375a:	06a70713          	addi	a4,a4,106 # 8000b7c0 <states.0>
    8000375e:	1782                	slli	a5,a5,0x20
    80003760:	9381                	srli	a5,a5,0x20
    80003762:	078e                	slli	a5,a5,0x3
    80003764:	97ba                	add	a5,a5,a4
    80003766:	639c                	ld	a5,0(a5)
    80003768:	c385                	beqz	a5,80003788 <procdump+0x74>
      state = states[p->state];
    8000376a:	fe843783          	ld	a5,-24(s0)
    8000376e:	4f9c                	lw	a5,24(a5)
    80003770:	00008717          	auipc	a4,0x8
    80003774:	05070713          	addi	a4,a4,80 # 8000b7c0 <states.0>
    80003778:	1782                	slli	a5,a5,0x20
    8000377a:	9381                	srli	a5,a5,0x20
    8000377c:	078e                	slli	a5,a5,0x3
    8000377e:	97ba                	add	a5,a5,a4
    80003780:	639c                	ld	a5,0(a5)
    80003782:	fef43023          	sd	a5,-32(s0)
    80003786:	a039                	j	80003794 <procdump+0x80>
    else
      state = "???";
    80003788:	00008797          	auipc	a5,0x8
    8000378c:	ae878793          	addi	a5,a5,-1304 # 8000b270 <etext+0x270>
    80003790:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003794:	fe843783          	ld	a5,-24(s0)
    80003798:	5b98                	lw	a4,48(a5)
    8000379a:	fe843783          	ld	a5,-24(s0)
    8000379e:	15878793          	addi	a5,a5,344
    800037a2:	86be                	mv	a3,a5
    800037a4:	fe043603          	ld	a2,-32(s0)
    800037a8:	85ba                	mv	a1,a4
    800037aa:	00008517          	auipc	a0,0x8
    800037ae:	ace50513          	addi	a0,a0,-1330 # 8000b278 <etext+0x278>
    800037b2:	ffffd097          	auipc	ra,0xffffd
    800037b6:	282080e7          	jalr	642(ra) # 80000a34 <printf>
    printf("\n");
    800037ba:	00008517          	auipc	a0,0x8
    800037be:	aae50513          	addi	a0,a0,-1362 # 8000b268 <etext+0x268>
    800037c2:	ffffd097          	auipc	ra,0xffffd
    800037c6:	272080e7          	jalr	626(ra) # 80000a34 <printf>
    800037ca:	a011                	j	800037ce <procdump+0xba>
      continue;
    800037cc:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800037ce:	fe843783          	ld	a5,-24(s0)
    800037d2:	16878793          	addi	a5,a5,360
    800037d6:	fef43423          	sd	a5,-24(s0)
    800037da:	fe843703          	ld	a4,-24(s0)
    800037de:	00016797          	auipc	a5,0x16
    800037e2:	17a78793          	addi	a5,a5,378 # 80019958 <pid_lock>
    800037e6:	f4f76ae3          	bltu	a4,a5,8000373a <procdump+0x26>
  }
}
    800037ea:	0001                	nop
    800037ec:	0001                	nop
    800037ee:	60e2                	ld	ra,24(sp)
    800037f0:	6442                	ld	s0,16(sp)
    800037f2:	6105                	addi	sp,sp,32
    800037f4:	8082                	ret

00000000800037f6 <swtch>:
    800037f6:	00153023          	sd	ra,0(a0)
    800037fa:	00253423          	sd	sp,8(a0)
    800037fe:	e900                	sd	s0,16(a0)
    80003800:	ed04                	sd	s1,24(a0)
    80003802:	03253023          	sd	s2,32(a0)
    80003806:	03353423          	sd	s3,40(a0)
    8000380a:	03453823          	sd	s4,48(a0)
    8000380e:	03553c23          	sd	s5,56(a0)
    80003812:	05653023          	sd	s6,64(a0)
    80003816:	05753423          	sd	s7,72(a0)
    8000381a:	05853823          	sd	s8,80(a0)
    8000381e:	05953c23          	sd	s9,88(a0)
    80003822:	07a53023          	sd	s10,96(a0)
    80003826:	07b53423          	sd	s11,104(a0)
    8000382a:	0005b083          	ld	ra,0(a1)
    8000382e:	0085b103          	ld	sp,8(a1)
    80003832:	6980                	ld	s0,16(a1)
    80003834:	6d84                	ld	s1,24(a1)
    80003836:	0205b903          	ld	s2,32(a1)
    8000383a:	0285b983          	ld	s3,40(a1)
    8000383e:	0305ba03          	ld	s4,48(a1)
    80003842:	0385ba83          	ld	s5,56(a1)
    80003846:	0405bb03          	ld	s6,64(a1)
    8000384a:	0485bb83          	ld	s7,72(a1)
    8000384e:	0505bc03          	ld	s8,80(a1)
    80003852:	0585bc83          	ld	s9,88(a1)
    80003856:	0605bd03          	ld	s10,96(a1)
    8000385a:	0685bd83          	ld	s11,104(a1)
    8000385e:	8082                	ret

0000000080003860 <r_sstatus>:
{
    80003860:	1101                	addi	sp,sp,-32
    80003862:	ec22                	sd	s0,24(sp)
    80003864:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003866:	100027f3          	csrr	a5,sstatus
    8000386a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000386e:	fe843783          	ld	a5,-24(s0)
}
    80003872:	853e                	mv	a0,a5
    80003874:	6462                	ld	s0,24(sp)
    80003876:	6105                	addi	sp,sp,32
    80003878:	8082                	ret

000000008000387a <w_sstatus>:
{
    8000387a:	1101                	addi	sp,sp,-32
    8000387c:	ec22                	sd	s0,24(sp)
    8000387e:	1000                	addi	s0,sp,32
    80003880:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003884:	fe843783          	ld	a5,-24(s0)
    80003888:	10079073          	csrw	sstatus,a5
}
    8000388c:	0001                	nop
    8000388e:	6462                	ld	s0,24(sp)
    80003890:	6105                	addi	sp,sp,32
    80003892:	8082                	ret

0000000080003894 <r_sip>:
{
    80003894:	1101                	addi	sp,sp,-32
    80003896:	ec22                	sd	s0,24(sp)
    80003898:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    8000389a:	144027f3          	csrr	a5,sip
    8000389e:	fef43423          	sd	a5,-24(s0)
  return x;
    800038a2:	fe843783          	ld	a5,-24(s0)
}
    800038a6:	853e                	mv	a0,a5
    800038a8:	6462                	ld	s0,24(sp)
    800038aa:	6105                	addi	sp,sp,32
    800038ac:	8082                	ret

00000000800038ae <w_sip>:
{
    800038ae:	1101                	addi	sp,sp,-32
    800038b0:	ec22                	sd	s0,24(sp)
    800038b2:	1000                	addi	s0,sp,32
    800038b4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    800038b8:	fe843783          	ld	a5,-24(s0)
    800038bc:	14479073          	csrw	sip,a5
}
    800038c0:	0001                	nop
    800038c2:	6462                	ld	s0,24(sp)
    800038c4:	6105                	addi	sp,sp,32
    800038c6:	8082                	ret

00000000800038c8 <w_sepc>:
{
    800038c8:	1101                	addi	sp,sp,-32
    800038ca:	ec22                	sd	s0,24(sp)
    800038cc:	1000                	addi	s0,sp,32
    800038ce:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    800038d2:	fe843783          	ld	a5,-24(s0)
    800038d6:	14179073          	csrw	sepc,a5
}
    800038da:	0001                	nop
    800038dc:	6462                	ld	s0,24(sp)
    800038de:	6105                	addi	sp,sp,32
    800038e0:	8082                	ret

00000000800038e2 <r_sepc>:
{
    800038e2:	1101                	addi	sp,sp,-32
    800038e4:	ec22                	sd	s0,24(sp)
    800038e6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    800038e8:	141027f3          	csrr	a5,sepc
    800038ec:	fef43423          	sd	a5,-24(s0)
  return x;
    800038f0:	fe843783          	ld	a5,-24(s0)
}
    800038f4:	853e                	mv	a0,a5
    800038f6:	6462                	ld	s0,24(sp)
    800038f8:	6105                	addi	sp,sp,32
    800038fa:	8082                	ret

00000000800038fc <w_stvec>:
{
    800038fc:	1101                	addi	sp,sp,-32
    800038fe:	ec22                	sd	s0,24(sp)
    80003900:	1000                	addi	s0,sp,32
    80003902:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003906:	fe843783          	ld	a5,-24(s0)
    8000390a:	10579073          	csrw	stvec,a5
}
    8000390e:	0001                	nop
    80003910:	6462                	ld	s0,24(sp)
    80003912:	6105                	addi	sp,sp,32
    80003914:	8082                	ret

0000000080003916 <r_satp>:
{
    80003916:	1101                	addi	sp,sp,-32
    80003918:	ec22                	sd	s0,24(sp)
    8000391a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    8000391c:	180027f3          	csrr	a5,satp
    80003920:	fef43423          	sd	a5,-24(s0)
  return x;
    80003924:	fe843783          	ld	a5,-24(s0)
}
    80003928:	853e                	mv	a0,a5
    8000392a:	6462                	ld	s0,24(sp)
    8000392c:	6105                	addi	sp,sp,32
    8000392e:	8082                	ret

0000000080003930 <r_scause>:
{
    80003930:	1101                	addi	sp,sp,-32
    80003932:	ec22                	sd	s0,24(sp)
    80003934:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003936:	142027f3          	csrr	a5,scause
    8000393a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000393e:	fe843783          	ld	a5,-24(s0)
}
    80003942:	853e                	mv	a0,a5
    80003944:	6462                	ld	s0,24(sp)
    80003946:	6105                	addi	sp,sp,32
    80003948:	8082                	ret

000000008000394a <r_stval>:
{
    8000394a:	1101                	addi	sp,sp,-32
    8000394c:	ec22                	sd	s0,24(sp)
    8000394e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003950:	143027f3          	csrr	a5,stval
    80003954:	fef43423          	sd	a5,-24(s0)
  return x;
    80003958:	fe843783          	ld	a5,-24(s0)
}
    8000395c:	853e                	mv	a0,a5
    8000395e:	6462                	ld	s0,24(sp)
    80003960:	6105                	addi	sp,sp,32
    80003962:	8082                	ret

0000000080003964 <intr_on>:
{
    80003964:	1141                	addi	sp,sp,-16
    80003966:	e406                	sd	ra,8(sp)
    80003968:	e022                	sd	s0,0(sp)
    8000396a:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8000396c:	00000097          	auipc	ra,0x0
    80003970:	ef4080e7          	jalr	-268(ra) # 80003860 <r_sstatus>
    80003974:	87aa                	mv	a5,a0
    80003976:	0027e793          	ori	a5,a5,2
    8000397a:	853e                	mv	a0,a5
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	efe080e7          	jalr	-258(ra) # 8000387a <w_sstatus>
}
    80003984:	0001                	nop
    80003986:	60a2                	ld	ra,8(sp)
    80003988:	6402                	ld	s0,0(sp)
    8000398a:	0141                	addi	sp,sp,16
    8000398c:	8082                	ret

000000008000398e <intr_off>:
{
    8000398e:	1141                	addi	sp,sp,-16
    80003990:	e406                	sd	ra,8(sp)
    80003992:	e022                	sd	s0,0(sp)
    80003994:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003996:	00000097          	auipc	ra,0x0
    8000399a:	eca080e7          	jalr	-310(ra) # 80003860 <r_sstatus>
    8000399e:	87aa                	mv	a5,a0
    800039a0:	9bf5                	andi	a5,a5,-3
    800039a2:	853e                	mv	a0,a5
    800039a4:	00000097          	auipc	ra,0x0
    800039a8:	ed6080e7          	jalr	-298(ra) # 8000387a <w_sstatus>
}
    800039ac:	0001                	nop
    800039ae:	60a2                	ld	ra,8(sp)
    800039b0:	6402                	ld	s0,0(sp)
    800039b2:	0141                	addi	sp,sp,16
    800039b4:	8082                	ret

00000000800039b6 <intr_get>:
{
    800039b6:	1101                	addi	sp,sp,-32
    800039b8:	ec06                	sd	ra,24(sp)
    800039ba:	e822                	sd	s0,16(sp)
    800039bc:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800039be:	00000097          	auipc	ra,0x0
    800039c2:	ea2080e7          	jalr	-350(ra) # 80003860 <r_sstatus>
    800039c6:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800039ca:	fe843783          	ld	a5,-24(s0)
    800039ce:	8b89                	andi	a5,a5,2
    800039d0:	00f037b3          	snez	a5,a5
    800039d4:	0ff7f793          	zext.b	a5,a5
    800039d8:	2781                	sext.w	a5,a5
}
    800039da:	853e                	mv	a0,a5
    800039dc:	60e2                	ld	ra,24(sp)
    800039de:	6442                	ld	s0,16(sp)
    800039e0:	6105                	addi	sp,sp,32
    800039e2:	8082                	ret

00000000800039e4 <r_tp>:
{
    800039e4:	1101                	addi	sp,sp,-32
    800039e6:	ec22                	sd	s0,24(sp)
    800039e8:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800039ea:	8792                	mv	a5,tp
    800039ec:	fef43423          	sd	a5,-24(s0)
  return x;
    800039f0:	fe843783          	ld	a5,-24(s0)
}
    800039f4:	853e                	mv	a0,a5
    800039f6:	6462                	ld	s0,24(sp)
    800039f8:	6105                	addi	sp,sp,32
    800039fa:	8082                	ret

00000000800039fc <trapinit>:

extern int devintr();

void
trapinit(void)
{
    800039fc:	1141                	addi	sp,sp,-16
    800039fe:	e406                	sd	ra,8(sp)
    80003a00:	e022                	sd	s0,0(sp)
    80003a02:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003a04:	00008597          	auipc	a1,0x8
    80003a08:	8bc58593          	addi	a1,a1,-1860 # 8000b2c0 <etext+0x2c0>
    80003a0c:	00016517          	auipc	a0,0x16
    80003a10:	f7c50513          	addi	a0,a0,-132 # 80019988 <tickslock>
    80003a14:	ffffe097          	auipc	ra,0xffffe
    80003a18:	834080e7          	jalr	-1996(ra) # 80001248 <initlock>
}
    80003a1c:	0001                	nop
    80003a1e:	60a2                	ld	ra,8(sp)
    80003a20:	6402                	ld	s0,0(sp)
    80003a22:	0141                	addi	sp,sp,16
    80003a24:	8082                	ret

0000000080003a26 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003a26:	1141                	addi	sp,sp,-16
    80003a28:	e406                	sd	ra,8(sp)
    80003a2a:	e022                	sd	s0,0(sp)
    80003a2c:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003a2e:	00005797          	auipc	a5,0x5
    80003a32:	d8278793          	addi	a5,a5,-638 # 800087b0 <kernelvec>
    80003a36:	853e                	mv	a0,a5
    80003a38:	00000097          	auipc	ra,0x0
    80003a3c:	ec4080e7          	jalr	-316(ra) # 800038fc <w_stvec>
}
    80003a40:	0001                	nop
    80003a42:	60a2                	ld	ra,8(sp)
    80003a44:	6402                	ld	s0,0(sp)
    80003a46:	0141                	addi	sp,sp,16
    80003a48:	8082                	ret

0000000080003a4a <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003a4a:	7179                	addi	sp,sp,-48
    80003a4c:	f406                	sd	ra,40(sp)
    80003a4e:	f022                	sd	s0,32(sp)
    80003a50:	ec26                	sd	s1,24(sp)
    80003a52:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003a54:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003a58:	00000097          	auipc	ra,0x0
    80003a5c:	e08080e7          	jalr	-504(ra) # 80003860 <r_sstatus>
    80003a60:	87aa                	mv	a5,a0
    80003a62:	1007f793          	andi	a5,a5,256
    80003a66:	cb89                	beqz	a5,80003a78 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003a68:	00008517          	auipc	a0,0x8
    80003a6c:	86050513          	addi	a0,a0,-1952 # 8000b2c8 <etext+0x2c8>
    80003a70:	ffffd097          	auipc	ra,0xffffd
    80003a74:	21a080e7          	jalr	538(ra) # 80000c8a <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003a78:	00005797          	auipc	a5,0x5
    80003a7c:	d3878793          	addi	a5,a5,-712 # 800087b0 <kernelvec>
    80003a80:	853e                	mv	a0,a5
    80003a82:	00000097          	auipc	ra,0x0
    80003a86:	e7a080e7          	jalr	-390(ra) # 800038fc <w_stvec>

  struct proc *p = myproc();
    80003a8a:	fffff097          	auipc	ra,0xfffff
    80003a8e:	db6080e7          	jalr	-586(ra) # 80002840 <myproc>
    80003a92:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003a96:	fd043783          	ld	a5,-48(s0)
    80003a9a:	6fa4                	ld	s1,88(a5)
    80003a9c:	00000097          	auipc	ra,0x0
    80003aa0:	e46080e7          	jalr	-442(ra) # 800038e2 <r_sepc>
    80003aa4:	87aa                	mv	a5,a0
    80003aa6:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003aa8:	00000097          	auipc	ra,0x0
    80003aac:	e88080e7          	jalr	-376(ra) # 80003930 <r_scause>
    80003ab0:	872a                	mv	a4,a0
    80003ab2:	47a1                	li	a5,8
    80003ab4:	04f71163          	bne	a4,a5,80003af6 <usertrap+0xac>
    // system call

    if(killed(p))
    80003ab8:	fd043503          	ld	a0,-48(s0)
    80003abc:	00000097          	auipc	ra,0x0
    80003ac0:	b30080e7          	jalr	-1232(ra) # 800035ec <killed>
    80003ac4:	87aa                	mv	a5,a0
    80003ac6:	c791                	beqz	a5,80003ad2 <usertrap+0x88>
      exit(-1);
    80003ac8:	557d                	li	a0,-1
    80003aca:	fffff097          	auipc	ra,0xfffff
    80003ace:	468080e7          	jalr	1128(ra) # 80002f32 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003ad2:	fd043783          	ld	a5,-48(s0)
    80003ad6:	6fbc                	ld	a5,88(a5)
    80003ad8:	6f98                	ld	a4,24(a5)
    80003ada:	fd043783          	ld	a5,-48(s0)
    80003ade:	6fbc                	ld	a5,88(a5)
    80003ae0:	0711                	addi	a4,a4,4
    80003ae2:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003ae4:	00000097          	auipc	ra,0x0
    80003ae8:	e80080e7          	jalr	-384(ra) # 80003964 <intr_on>

    syscall();
    80003aec:	00000097          	auipc	ra,0x0
    80003af0:	66c080e7          	jalr	1644(ra) # 80004158 <syscall>
    80003af4:	a885                	j	80003b64 <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003af6:	00000097          	auipc	ra,0x0
    80003afa:	34e080e7          	jalr	846(ra) # 80003e44 <devintr>
    80003afe:	87aa                	mv	a5,a0
    80003b00:	fcf42e23          	sw	a5,-36(s0)
    80003b04:	fdc42783          	lw	a5,-36(s0)
    80003b08:	2781                	sext.w	a5,a5
    80003b0a:	efa9                	bnez	a5,80003b64 <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	e24080e7          	jalr	-476(ra) # 80003930 <r_scause>
    80003b14:	872a                	mv	a4,a0
    80003b16:	fd043783          	ld	a5,-48(s0)
    80003b1a:	5b9c                	lw	a5,48(a5)
    80003b1c:	863e                	mv	a2,a5
    80003b1e:	85ba                	mv	a1,a4
    80003b20:	00007517          	auipc	a0,0x7
    80003b24:	7c850513          	addi	a0,a0,1992 # 8000b2e8 <etext+0x2e8>
    80003b28:	ffffd097          	auipc	ra,0xffffd
    80003b2c:	f0c080e7          	jalr	-244(ra) # 80000a34 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003b30:	00000097          	auipc	ra,0x0
    80003b34:	db2080e7          	jalr	-590(ra) # 800038e2 <r_sepc>
    80003b38:	84aa                	mv	s1,a0
    80003b3a:	00000097          	auipc	ra,0x0
    80003b3e:	e10080e7          	jalr	-496(ra) # 8000394a <r_stval>
    80003b42:	87aa                	mv	a5,a0
    80003b44:	863e                	mv	a2,a5
    80003b46:	85a6                	mv	a1,s1
    80003b48:	00007517          	auipc	a0,0x7
    80003b4c:	7d050513          	addi	a0,a0,2000 # 8000b318 <etext+0x318>
    80003b50:	ffffd097          	auipc	ra,0xffffd
    80003b54:	ee4080e7          	jalr	-284(ra) # 80000a34 <printf>
    setkilled(p);
    80003b58:	fd043503          	ld	a0,-48(s0)
    80003b5c:	00000097          	auipc	ra,0x0
    80003b60:	a56080e7          	jalr	-1450(ra) # 800035b2 <setkilled>
  }

  if(killed(p))
    80003b64:	fd043503          	ld	a0,-48(s0)
    80003b68:	00000097          	auipc	ra,0x0
    80003b6c:	a84080e7          	jalr	-1404(ra) # 800035ec <killed>
    80003b70:	87aa                	mv	a5,a0
    80003b72:	c791                	beqz	a5,80003b7e <usertrap+0x134>
    exit(-1);
    80003b74:	557d                	li	a0,-1
    80003b76:	fffff097          	auipc	ra,0xfffff
    80003b7a:	3bc080e7          	jalr	956(ra) # 80002f32 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003b7e:	fdc42783          	lw	a5,-36(s0)
    80003b82:	0007871b          	sext.w	a4,a5
    80003b86:	4789                	li	a5,2
    80003b88:	00f71663          	bne	a4,a5,80003b94 <usertrap+0x14a>
    yield();
    80003b8c:	fffff097          	auipc	ra,0xfffff
    80003b90:	7dc080e7          	jalr	2012(ra) # 80003368 <yield>

  usertrapret();
    80003b94:	00000097          	auipc	ra,0x0
    80003b98:	014080e7          	jalr	20(ra) # 80003ba8 <usertrapret>
}
    80003b9c:	0001                	nop
    80003b9e:	70a2                	ld	ra,40(sp)
    80003ba0:	7402                	ld	s0,32(sp)
    80003ba2:	64e2                	ld	s1,24(sp)
    80003ba4:	6145                	addi	sp,sp,48
    80003ba6:	8082                	ret

0000000080003ba8 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003ba8:	715d                	addi	sp,sp,-80
    80003baa:	e486                	sd	ra,72(sp)
    80003bac:	e0a2                	sd	s0,64(sp)
    80003bae:	fc26                	sd	s1,56(sp)
    80003bb0:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003bb2:	fffff097          	auipc	ra,0xfffff
    80003bb6:	c8e080e7          	jalr	-882(ra) # 80002840 <myproc>
    80003bba:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003bbe:	00000097          	auipc	ra,0x0
    80003bc2:	dd0080e7          	jalr	-560(ra) # 8000398e <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003bc6:	00006717          	auipc	a4,0x6
    80003bca:	43a70713          	addi	a4,a4,1082 # 8000a000 <_trampoline>
    80003bce:	00006797          	auipc	a5,0x6
    80003bd2:	43278793          	addi	a5,a5,1074 # 8000a000 <_trampoline>
    80003bd6:	8f1d                	sub	a4,a4,a5
    80003bd8:	040007b7          	lui	a5,0x4000
    80003bdc:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003bde:	07b2                	slli	a5,a5,0xc
    80003be0:	97ba                	add	a5,a5,a4
    80003be2:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003be6:	fd043503          	ld	a0,-48(s0)
    80003bea:	00000097          	auipc	ra,0x0
    80003bee:	d12080e7          	jalr	-750(ra) # 800038fc <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003bf2:	fd843783          	ld	a5,-40(s0)
    80003bf6:	6fa4                	ld	s1,88(a5)
    80003bf8:	00000097          	auipc	ra,0x0
    80003bfc:	d1e080e7          	jalr	-738(ra) # 80003916 <r_satp>
    80003c00:	87aa                	mv	a5,a0
    80003c02:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003c04:	fd843783          	ld	a5,-40(s0)
    80003c08:	63b4                	ld	a3,64(a5)
    80003c0a:	fd843783          	ld	a5,-40(s0)
    80003c0e:	6fbc                	ld	a5,88(a5)
    80003c10:	6705                	lui	a4,0x1
    80003c12:	9736                	add	a4,a4,a3
    80003c14:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003c16:	fd843783          	ld	a5,-40(s0)
    80003c1a:	6fbc                	ld	a5,88(a5)
    80003c1c:	00000717          	auipc	a4,0x0
    80003c20:	e2e70713          	addi	a4,a4,-466 # 80003a4a <usertrap>
    80003c24:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003c26:	fd843783          	ld	a5,-40(s0)
    80003c2a:	6fa4                	ld	s1,88(a5)
    80003c2c:	00000097          	auipc	ra,0x0
    80003c30:	db8080e7          	jalr	-584(ra) # 800039e4 <r_tp>
    80003c34:	87aa                	mv	a5,a0
    80003c36:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003c38:	00000097          	auipc	ra,0x0
    80003c3c:	c28080e7          	jalr	-984(ra) # 80003860 <r_sstatus>
    80003c40:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003c44:	fc843783          	ld	a5,-56(s0)
    80003c48:	eff7f793          	andi	a5,a5,-257
    80003c4c:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003c50:	fc843783          	ld	a5,-56(s0)
    80003c54:	0207e793          	ori	a5,a5,32
    80003c58:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003c5c:	fc843503          	ld	a0,-56(s0)
    80003c60:	00000097          	auipc	ra,0x0
    80003c64:	c1a080e7          	jalr	-998(ra) # 8000387a <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003c68:	fd843783          	ld	a5,-40(s0)
    80003c6c:	6fbc                	ld	a5,88(a5)
    80003c6e:	6f9c                	ld	a5,24(a5)
    80003c70:	853e                	mv	a0,a5
    80003c72:	00000097          	auipc	ra,0x0
    80003c76:	c56080e7          	jalr	-938(ra) # 800038c8 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003c7a:	fd843783          	ld	a5,-40(s0)
    80003c7e:	6bbc                	ld	a5,80(a5)
    80003c80:	00c7d713          	srli	a4,a5,0xc
    80003c84:	57fd                	li	a5,-1
    80003c86:	17fe                	slli	a5,a5,0x3f
    80003c88:	8fd9                	or	a5,a5,a4
    80003c8a:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003c8e:	00006717          	auipc	a4,0x6
    80003c92:	40e70713          	addi	a4,a4,1038 # 8000a09c <userret>
    80003c96:	00006797          	auipc	a5,0x6
    80003c9a:	36a78793          	addi	a5,a5,874 # 8000a000 <_trampoline>
    80003c9e:	8f1d                	sub	a4,a4,a5
    80003ca0:	040007b7          	lui	a5,0x4000
    80003ca4:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003ca6:	07b2                	slli	a5,a5,0xc
    80003ca8:	97ba                	add	a5,a5,a4
    80003caa:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003cae:	fb843783          	ld	a5,-72(s0)
    80003cb2:	fc043503          	ld	a0,-64(s0)
    80003cb6:	9782                	jalr	a5
}
    80003cb8:	0001                	nop
    80003cba:	60a6                	ld	ra,72(sp)
    80003cbc:	6406                	ld	s0,64(sp)
    80003cbe:	74e2                	ld	s1,56(sp)
    80003cc0:	6161                	addi	sp,sp,80
    80003cc2:	8082                	ret

0000000080003cc4 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003cc4:	7139                	addi	sp,sp,-64
    80003cc6:	fc06                	sd	ra,56(sp)
    80003cc8:	f822                	sd	s0,48(sp)
    80003cca:	f426                	sd	s1,40(sp)
    80003ccc:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003cce:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003cd2:	00000097          	auipc	ra,0x0
    80003cd6:	c10080e7          	jalr	-1008(ra) # 800038e2 <r_sepc>
    80003cda:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003cde:	00000097          	auipc	ra,0x0
    80003ce2:	b82080e7          	jalr	-1150(ra) # 80003860 <r_sstatus>
    80003ce6:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003cea:	00000097          	auipc	ra,0x0
    80003cee:	c46080e7          	jalr	-954(ra) # 80003930 <r_scause>
    80003cf2:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003cf6:	fc843783          	ld	a5,-56(s0)
    80003cfa:	1007f793          	andi	a5,a5,256
    80003cfe:	eb89                	bnez	a5,80003d10 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003d00:	00007517          	auipc	a0,0x7
    80003d04:	63850513          	addi	a0,a0,1592 # 8000b338 <etext+0x338>
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	f82080e7          	jalr	-126(ra) # 80000c8a <panic>
  if(intr_get() != 0)
    80003d10:	00000097          	auipc	ra,0x0
    80003d14:	ca6080e7          	jalr	-858(ra) # 800039b6 <intr_get>
    80003d18:	87aa                	mv	a5,a0
    80003d1a:	cb89                	beqz	a5,80003d2c <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003d1c:	00007517          	auipc	a0,0x7
    80003d20:	64450513          	addi	a0,a0,1604 # 8000b360 <etext+0x360>
    80003d24:	ffffd097          	auipc	ra,0xffffd
    80003d28:	f66080e7          	jalr	-154(ra) # 80000c8a <panic>

  if((which_dev = devintr()) == 0){
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	118080e7          	jalr	280(ra) # 80003e44 <devintr>
    80003d34:	87aa                	mv	a5,a0
    80003d36:	fcf42e23          	sw	a5,-36(s0)
    80003d3a:	fdc42783          	lw	a5,-36(s0)
    80003d3e:	2781                	sext.w	a5,a5
    80003d40:	e7b9                	bnez	a5,80003d8e <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003d42:	fc043583          	ld	a1,-64(s0)
    80003d46:	00007517          	auipc	a0,0x7
    80003d4a:	63a50513          	addi	a0,a0,1594 # 8000b380 <etext+0x380>
    80003d4e:	ffffd097          	auipc	ra,0xffffd
    80003d52:	ce6080e7          	jalr	-794(ra) # 80000a34 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003d56:	00000097          	auipc	ra,0x0
    80003d5a:	b8c080e7          	jalr	-1140(ra) # 800038e2 <r_sepc>
    80003d5e:	84aa                	mv	s1,a0
    80003d60:	00000097          	auipc	ra,0x0
    80003d64:	bea080e7          	jalr	-1046(ra) # 8000394a <r_stval>
    80003d68:	87aa                	mv	a5,a0
    80003d6a:	863e                	mv	a2,a5
    80003d6c:	85a6                	mv	a1,s1
    80003d6e:	00007517          	auipc	a0,0x7
    80003d72:	62250513          	addi	a0,a0,1570 # 8000b390 <etext+0x390>
    80003d76:	ffffd097          	auipc	ra,0xffffd
    80003d7a:	cbe080e7          	jalr	-834(ra) # 80000a34 <printf>
    panic("kerneltrap");
    80003d7e:	00007517          	auipc	a0,0x7
    80003d82:	62a50513          	addi	a0,a0,1578 # 8000b3a8 <etext+0x3a8>
    80003d86:	ffffd097          	auipc	ra,0xffffd
    80003d8a:	f04080e7          	jalr	-252(ra) # 80000c8a <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003d8e:	fdc42783          	lw	a5,-36(s0)
    80003d92:	0007871b          	sext.w	a4,a5
    80003d96:	4789                	li	a5,2
    80003d98:	02f71663          	bne	a4,a5,80003dc4 <kerneltrap+0x100>
    80003d9c:	fffff097          	auipc	ra,0xfffff
    80003da0:	aa4080e7          	jalr	-1372(ra) # 80002840 <myproc>
    80003da4:	87aa                	mv	a5,a0
    80003da6:	cf99                	beqz	a5,80003dc4 <kerneltrap+0x100>
    80003da8:	fffff097          	auipc	ra,0xfffff
    80003dac:	a98080e7          	jalr	-1384(ra) # 80002840 <myproc>
    80003db0:	87aa                	mv	a5,a0
    80003db2:	4f9c                	lw	a5,24(a5)
    80003db4:	873e                	mv	a4,a5
    80003db6:	4791                	li	a5,4
    80003db8:	00f71663          	bne	a4,a5,80003dc4 <kerneltrap+0x100>
    yield();
    80003dbc:	fffff097          	auipc	ra,0xfffff
    80003dc0:	5ac080e7          	jalr	1452(ra) # 80003368 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003dc4:	fd043503          	ld	a0,-48(s0)
    80003dc8:	00000097          	auipc	ra,0x0
    80003dcc:	b00080e7          	jalr	-1280(ra) # 800038c8 <w_sepc>
  w_sstatus(sstatus);
    80003dd0:	fc843503          	ld	a0,-56(s0)
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	aa6080e7          	jalr	-1370(ra) # 8000387a <w_sstatus>
}
    80003ddc:	0001                	nop
    80003dde:	70e2                	ld	ra,56(sp)
    80003de0:	7442                	ld	s0,48(sp)
    80003de2:	74a2                	ld	s1,40(sp)
    80003de4:	6121                	addi	sp,sp,64
    80003de6:	8082                	ret

0000000080003de8 <clockintr>:

void
clockintr()
{
    80003de8:	1141                	addi	sp,sp,-16
    80003dea:	e406                	sd	ra,8(sp)
    80003dec:	e022                	sd	s0,0(sp)
    80003dee:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80003df0:	00016517          	auipc	a0,0x16
    80003df4:	b9850513          	addi	a0,a0,-1128 # 80019988 <tickslock>
    80003df8:	ffffd097          	auipc	ra,0xffffd
    80003dfc:	480080e7          	jalr	1152(ra) # 80001278 <acquire>
  ticks++;
    80003e00:	00008797          	auipc	a5,0x8
    80003e04:	ae878793          	addi	a5,a5,-1304 # 8000b8e8 <ticks>
    80003e08:	439c                	lw	a5,0(a5)
    80003e0a:	2785                	addiw	a5,a5,1
    80003e0c:	0007871b          	sext.w	a4,a5
    80003e10:	00008797          	auipc	a5,0x8
    80003e14:	ad878793          	addi	a5,a5,-1320 # 8000b8e8 <ticks>
    80003e18:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80003e1a:	00008517          	auipc	a0,0x8
    80003e1e:	ace50513          	addi	a0,a0,-1330 # 8000b8e8 <ticks>
    80003e22:	fffff097          	auipc	ra,0xfffff
    80003e26:	65c080e7          	jalr	1628(ra) # 8000347e <wakeup>
  release(&tickslock);
    80003e2a:	00016517          	auipc	a0,0x16
    80003e2e:	b5e50513          	addi	a0,a0,-1186 # 80019988 <tickslock>
    80003e32:	ffffd097          	auipc	ra,0xffffd
    80003e36:	4aa080e7          	jalr	1194(ra) # 800012dc <release>
}
    80003e3a:	0001                	nop
    80003e3c:	60a2                	ld	ra,8(sp)
    80003e3e:	6402                	ld	s0,0(sp)
    80003e40:	0141                	addi	sp,sp,16
    80003e42:	8082                	ret

0000000080003e44 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80003e44:	1101                	addi	sp,sp,-32
    80003e46:	ec06                	sd	ra,24(sp)
    80003e48:	e822                	sd	s0,16(sp)
    80003e4a:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80003e4c:	00000097          	auipc	ra,0x0
    80003e50:	ae4080e7          	jalr	-1308(ra) # 80003930 <r_scause>
    80003e54:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80003e58:	fe843783          	ld	a5,-24(s0)
    80003e5c:	0807d463          	bgez	a5,80003ee4 <devintr+0xa0>
     (scause & 0xff) == 9){
    80003e60:	fe843783          	ld	a5,-24(s0)
    80003e64:	0ff7f713          	zext.b	a4,a5
  if((scause & 0x8000000000000000L) &&
    80003e68:	47a5                	li	a5,9
    80003e6a:	06f71d63          	bne	a4,a5,80003ee4 <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80003e6e:	00005097          	auipc	ra,0x5
    80003e72:	a74080e7          	jalr	-1420(ra) # 800088e2 <plic_claim>
    80003e76:	87aa                	mv	a5,a0
    80003e78:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80003e7c:	fe442783          	lw	a5,-28(s0)
    80003e80:	0007871b          	sext.w	a4,a5
    80003e84:	47a9                	li	a5,10
    80003e86:	00f71763          	bne	a4,a5,80003e94 <devintr+0x50>
      uartintr();
    80003e8a:	ffffd097          	auipc	ra,0xffffd
    80003e8e:	0f6080e7          	jalr	246(ra) # 80000f80 <uartintr>
    80003e92:	a825                	j	80003eca <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    80003e94:	fe442783          	lw	a5,-28(s0)
    80003e98:	0007871b          	sext.w	a4,a5
    80003e9c:	4785                	li	a5,1
    80003e9e:	00f71763          	bne	a4,a5,80003eac <devintr+0x68>
      virtio_disk_intr();
    80003ea2:	00005097          	auipc	ra,0x5
    80003ea6:	402080e7          	jalr	1026(ra) # 800092a4 <virtio_disk_intr>
    80003eaa:	a005                	j	80003eca <devintr+0x86>
    } else if(irq){
    80003eac:	fe442783          	lw	a5,-28(s0)
    80003eb0:	2781                	sext.w	a5,a5
    80003eb2:	cf81                	beqz	a5,80003eca <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    80003eb4:	fe442783          	lw	a5,-28(s0)
    80003eb8:	85be                	mv	a1,a5
    80003eba:	00007517          	auipc	a0,0x7
    80003ebe:	4fe50513          	addi	a0,a0,1278 # 8000b3b8 <etext+0x3b8>
    80003ec2:	ffffd097          	auipc	ra,0xffffd
    80003ec6:	b72080e7          	jalr	-1166(ra) # 80000a34 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80003eca:	fe442783          	lw	a5,-28(s0)
    80003ece:	2781                	sext.w	a5,a5
    80003ed0:	cb81                	beqz	a5,80003ee0 <devintr+0x9c>
      plic_complete(irq);
    80003ed2:	fe442783          	lw	a5,-28(s0)
    80003ed6:	853e                	mv	a0,a5
    80003ed8:	00005097          	auipc	ra,0x5
    80003edc:	a48080e7          	jalr	-1464(ra) # 80008920 <plic_complete>

    return 1;
    80003ee0:	4785                	li	a5,1
    80003ee2:	a081                	j	80003f22 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    80003ee4:	fe843703          	ld	a4,-24(s0)
    80003ee8:	57fd                	li	a5,-1
    80003eea:	17fe                	slli	a5,a5,0x3f
    80003eec:	0785                	addi	a5,a5,1
    80003eee:	02f71963          	bne	a4,a5,80003f20 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80003ef2:	fffff097          	auipc	ra,0xfffff
    80003ef6:	8f0080e7          	jalr	-1808(ra) # 800027e2 <cpuid>
    80003efa:	87aa                	mv	a5,a0
    80003efc:	e789                	bnez	a5,80003f06 <devintr+0xc2>
      clockintr();
    80003efe:	00000097          	auipc	ra,0x0
    80003f02:	eea080e7          	jalr	-278(ra) # 80003de8 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80003f06:	00000097          	auipc	ra,0x0
    80003f0a:	98e080e7          	jalr	-1650(ra) # 80003894 <r_sip>
    80003f0e:	87aa                	mv	a5,a0
    80003f10:	9bf5                	andi	a5,a5,-3
    80003f12:	853e                	mv	a0,a5
    80003f14:	00000097          	auipc	ra,0x0
    80003f18:	99a080e7          	jalr	-1638(ra) # 800038ae <w_sip>

    return 2;
    80003f1c:	4789                	li	a5,2
    80003f1e:	a011                	j	80003f22 <devintr+0xde>
  } else {
    return 0;
    80003f20:	4781                	li	a5,0
  }
}
    80003f22:	853e                	mv	a0,a5
    80003f24:	60e2                	ld	ra,24(sp)
    80003f26:	6442                	ld	s0,16(sp)
    80003f28:	6105                	addi	sp,sp,32
    80003f2a:	8082                	ret

0000000080003f2c <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80003f2c:	7179                	addi	sp,sp,-48
    80003f2e:	f406                	sd	ra,40(sp)
    80003f30:	f022                	sd	s0,32(sp)
    80003f32:	1800                	addi	s0,sp,48
    80003f34:	fca43c23          	sd	a0,-40(s0)
    80003f38:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003f3c:	fffff097          	auipc	ra,0xfffff
    80003f40:	904080e7          	jalr	-1788(ra) # 80002840 <myproc>
    80003f44:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    80003f48:	fe843783          	ld	a5,-24(s0)
    80003f4c:	67bc                	ld	a5,72(a5)
    80003f4e:	fd843703          	ld	a4,-40(s0)
    80003f52:	00f77b63          	bgeu	a4,a5,80003f68 <fetchaddr+0x3c>
    80003f56:	fd843783          	ld	a5,-40(s0)
    80003f5a:	00878713          	addi	a4,a5,8
    80003f5e:	fe843783          	ld	a5,-24(s0)
    80003f62:	67bc                	ld	a5,72(a5)
    80003f64:	00e7f463          	bgeu	a5,a4,80003f6c <fetchaddr+0x40>
    return -1;
    80003f68:	57fd                	li	a5,-1
    80003f6a:	a01d                	j	80003f90 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80003f6c:	fe843783          	ld	a5,-24(s0)
    80003f70:	6bbc                	ld	a5,80(a5)
    80003f72:	46a1                	li	a3,8
    80003f74:	fd843603          	ld	a2,-40(s0)
    80003f78:	fd043583          	ld	a1,-48(s0)
    80003f7c:	853e                	mv	a0,a5
    80003f7e:	ffffe097          	auipc	ra,0xffffe
    80003f82:	45a080e7          	jalr	1114(ra) # 800023d8 <copyin>
    80003f86:	87aa                	mv	a5,a0
    80003f88:	c399                	beqz	a5,80003f8e <fetchaddr+0x62>
    return -1;
    80003f8a:	57fd                	li	a5,-1
    80003f8c:	a011                	j	80003f90 <fetchaddr+0x64>
  return 0;
    80003f8e:	4781                	li	a5,0
}
    80003f90:	853e                	mv	a0,a5
    80003f92:	70a2                	ld	ra,40(sp)
    80003f94:	7402                	ld	s0,32(sp)
    80003f96:	6145                	addi	sp,sp,48
    80003f98:	8082                	ret

0000000080003f9a <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80003f9a:	7139                	addi	sp,sp,-64
    80003f9c:	fc06                	sd	ra,56(sp)
    80003f9e:	f822                	sd	s0,48(sp)
    80003fa0:	0080                	addi	s0,sp,64
    80003fa2:	fca43c23          	sd	a0,-40(s0)
    80003fa6:	fcb43823          	sd	a1,-48(s0)
    80003faa:	87b2                	mv	a5,a2
    80003fac:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003fb0:	fffff097          	auipc	ra,0xfffff
    80003fb4:	890080e7          	jalr	-1904(ra) # 80002840 <myproc>
    80003fb8:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80003fbc:	fe843783          	ld	a5,-24(s0)
    80003fc0:	6bbc                	ld	a5,80(a5)
    80003fc2:	fcc42703          	lw	a4,-52(s0)
    80003fc6:	86ba                	mv	a3,a4
    80003fc8:	fd843603          	ld	a2,-40(s0)
    80003fcc:	fd043583          	ld	a1,-48(s0)
    80003fd0:	853e                	mv	a0,a5
    80003fd2:	ffffe097          	auipc	ra,0xffffe
    80003fd6:	4d4080e7          	jalr	1236(ra) # 800024a6 <copyinstr>
    80003fda:	87aa                	mv	a5,a0
    80003fdc:	0007d463          	bgez	a5,80003fe4 <fetchstr+0x4a>
    return -1;
    80003fe0:	57fd                	li	a5,-1
    80003fe2:	a801                	j	80003ff2 <fetchstr+0x58>
  return strlen(buf);
    80003fe4:	fd043503          	ld	a0,-48(s0)
    80003fe8:	ffffd097          	auipc	ra,0xffffd
    80003fec:	7e4080e7          	jalr	2020(ra) # 800017cc <strlen>
    80003ff0:	87aa                	mv	a5,a0
}
    80003ff2:	853e                	mv	a0,a5
    80003ff4:	70e2                	ld	ra,56(sp)
    80003ff6:	7442                	ld	s0,48(sp)
    80003ff8:	6121                	addi	sp,sp,64
    80003ffa:	8082                	ret

0000000080003ffc <argraw>:

static uint64
argraw(int n)
{
    80003ffc:	7179                	addi	sp,sp,-48
    80003ffe:	f406                	sd	ra,40(sp)
    80004000:	f022                	sd	s0,32(sp)
    80004002:	1800                	addi	s0,sp,48
    80004004:	87aa                	mv	a5,a0
    80004006:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000400a:	fffff097          	auipc	ra,0xfffff
    8000400e:	836080e7          	jalr	-1994(ra) # 80002840 <myproc>
    80004012:	fea43423          	sd	a0,-24(s0)
  switch (n) {
    80004016:	fdc42783          	lw	a5,-36(s0)
    8000401a:	0007871b          	sext.w	a4,a5
    8000401e:	4795                	li	a5,5
    80004020:	06e7e263          	bltu	a5,a4,80004084 <argraw+0x88>
    80004024:	fdc46783          	lwu	a5,-36(s0)
    80004028:	00279713          	slli	a4,a5,0x2
    8000402c:	00007797          	auipc	a5,0x7
    80004030:	3b478793          	addi	a5,a5,948 # 8000b3e0 <etext+0x3e0>
    80004034:	97ba                	add	a5,a5,a4
    80004036:	439c                	lw	a5,0(a5)
    80004038:	0007871b          	sext.w	a4,a5
    8000403c:	00007797          	auipc	a5,0x7
    80004040:	3a478793          	addi	a5,a5,932 # 8000b3e0 <etext+0x3e0>
    80004044:	97ba                	add	a5,a5,a4
    80004046:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80004048:	fe843783          	ld	a5,-24(s0)
    8000404c:	6fbc                	ld	a5,88(a5)
    8000404e:	7bbc                	ld	a5,112(a5)
    80004050:	a091                	j	80004094 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004052:	fe843783          	ld	a5,-24(s0)
    80004056:	6fbc                	ld	a5,88(a5)
    80004058:	7fbc                	ld	a5,120(a5)
    8000405a:	a82d                	j	80004094 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000405c:	fe843783          	ld	a5,-24(s0)
    80004060:	6fbc                	ld	a5,88(a5)
    80004062:	63dc                	ld	a5,128(a5)
    80004064:	a805                	j	80004094 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004066:	fe843783          	ld	a5,-24(s0)
    8000406a:	6fbc                	ld	a5,88(a5)
    8000406c:	67dc                	ld	a5,136(a5)
    8000406e:	a01d                	j	80004094 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004070:	fe843783          	ld	a5,-24(s0)
    80004074:	6fbc                	ld	a5,88(a5)
    80004076:	6bdc                	ld	a5,144(a5)
    80004078:	a831                	j	80004094 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000407a:	fe843783          	ld	a5,-24(s0)
    8000407e:	6fbc                	ld	a5,88(a5)
    80004080:	6fdc                	ld	a5,152(a5)
    80004082:	a809                	j	80004094 <argraw+0x98>
  }
  panic("argraw");
    80004084:	00007517          	auipc	a0,0x7
    80004088:	35450513          	addi	a0,a0,852 # 8000b3d8 <etext+0x3d8>
    8000408c:	ffffd097          	auipc	ra,0xffffd
    80004090:	bfe080e7          	jalr	-1026(ra) # 80000c8a <panic>
  return -1;
}
    80004094:	853e                	mv	a0,a5
    80004096:	70a2                	ld	ra,40(sp)
    80004098:	7402                	ld	s0,32(sp)
    8000409a:	6145                	addi	sp,sp,48
    8000409c:	8082                	ret

000000008000409e <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    8000409e:	1101                	addi	sp,sp,-32
    800040a0:	ec06                	sd	ra,24(sp)
    800040a2:	e822                	sd	s0,16(sp)
    800040a4:	1000                	addi	s0,sp,32
    800040a6:	87aa                	mv	a5,a0
    800040a8:	feb43023          	sd	a1,-32(s0)
    800040ac:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800040b0:	fec42783          	lw	a5,-20(s0)
    800040b4:	853e                	mv	a0,a5
    800040b6:	00000097          	auipc	ra,0x0
    800040ba:	f46080e7          	jalr	-186(ra) # 80003ffc <argraw>
    800040be:	87aa                	mv	a5,a0
    800040c0:	0007871b          	sext.w	a4,a5
    800040c4:	fe043783          	ld	a5,-32(s0)
    800040c8:	c398                	sw	a4,0(a5)
}
    800040ca:	0001                	nop
    800040cc:	60e2                	ld	ra,24(sp)
    800040ce:	6442                	ld	s0,16(sp)
    800040d0:	6105                	addi	sp,sp,32
    800040d2:	8082                	ret

00000000800040d4 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800040d4:	1101                	addi	sp,sp,-32
    800040d6:	ec06                	sd	ra,24(sp)
    800040d8:	e822                	sd	s0,16(sp)
    800040da:	1000                	addi	s0,sp,32
    800040dc:	87aa                	mv	a5,a0
    800040de:	feb43023          	sd	a1,-32(s0)
    800040e2:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800040e6:	fec42783          	lw	a5,-20(s0)
    800040ea:	853e                	mv	a0,a5
    800040ec:	00000097          	auipc	ra,0x0
    800040f0:	f10080e7          	jalr	-240(ra) # 80003ffc <argraw>
    800040f4:	872a                	mv	a4,a0
    800040f6:	fe043783          	ld	a5,-32(s0)
    800040fa:	e398                	sd	a4,0(a5)
}
    800040fc:	0001                	nop
    800040fe:	60e2                	ld	ra,24(sp)
    80004100:	6442                	ld	s0,16(sp)
    80004102:	6105                	addi	sp,sp,32
    80004104:	8082                	ret

0000000080004106 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    80004106:	7179                	addi	sp,sp,-48
    80004108:	f406                	sd	ra,40(sp)
    8000410a:	f022                	sd	s0,32(sp)
    8000410c:	1800                	addi	s0,sp,48
    8000410e:	87aa                	mv	a5,a0
    80004110:	fcb43823          	sd	a1,-48(s0)
    80004114:	8732                	mv	a4,a2
    80004116:	fcf42e23          	sw	a5,-36(s0)
    8000411a:	87ba                	mv	a5,a4
    8000411c:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004120:	fe840713          	addi	a4,s0,-24
    80004124:	fdc42783          	lw	a5,-36(s0)
    80004128:	85ba                	mv	a1,a4
    8000412a:	853e                	mv	a0,a5
    8000412c:	00000097          	auipc	ra,0x0
    80004130:	fa8080e7          	jalr	-88(ra) # 800040d4 <argaddr>
  return fetchstr(addr, buf, max);
    80004134:	fe843783          	ld	a5,-24(s0)
    80004138:	fd842703          	lw	a4,-40(s0)
    8000413c:	863a                	mv	a2,a4
    8000413e:	fd043583          	ld	a1,-48(s0)
    80004142:	853e                	mv	a0,a5
    80004144:	00000097          	auipc	ra,0x0
    80004148:	e56080e7          	jalr	-426(ra) # 80003f9a <fetchstr>
    8000414c:	87aa                	mv	a5,a0
}
    8000414e:	853e                	mv	a0,a5
    80004150:	70a2                	ld	ra,40(sp)
    80004152:	7402                	ld	s0,32(sp)
    80004154:	6145                	addi	sp,sp,48
    80004156:	8082                	ret

0000000080004158 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    80004158:	7179                	addi	sp,sp,-48
    8000415a:	f406                	sd	ra,40(sp)
    8000415c:	f022                	sd	s0,32(sp)
    8000415e:	ec26                	sd	s1,24(sp)
    80004160:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004162:	ffffe097          	auipc	ra,0xffffe
    80004166:	6de080e7          	jalr	1758(ra) # 80002840 <myproc>
    8000416a:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    8000416e:	fd843783          	ld	a5,-40(s0)
    80004172:	6fbc                	ld	a5,88(a5)
    80004174:	77dc                	ld	a5,168(a5)
    80004176:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000417a:	fd442783          	lw	a5,-44(s0)
    8000417e:	2781                	sext.w	a5,a5
    80004180:	04f05263          	blez	a5,800041c4 <syscall+0x6c>
    80004184:	fd442783          	lw	a5,-44(s0)
    80004188:	873e                	mv	a4,a5
    8000418a:	47d5                	li	a5,21
    8000418c:	02e7ec63          	bltu	a5,a4,800041c4 <syscall+0x6c>
    80004190:	00007717          	auipc	a4,0x7
    80004194:	66070713          	addi	a4,a4,1632 # 8000b7f0 <syscalls>
    80004198:	fd442783          	lw	a5,-44(s0)
    8000419c:	078e                	slli	a5,a5,0x3
    8000419e:	97ba                	add	a5,a5,a4
    800041a0:	639c                	ld	a5,0(a5)
    800041a2:	c38d                	beqz	a5,800041c4 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    800041a4:	00007717          	auipc	a4,0x7
    800041a8:	64c70713          	addi	a4,a4,1612 # 8000b7f0 <syscalls>
    800041ac:	fd442783          	lw	a5,-44(s0)
    800041b0:	078e                	slli	a5,a5,0x3
    800041b2:	97ba                	add	a5,a5,a4
    800041b4:	639c                	ld	a5,0(a5)
    800041b6:	fd843703          	ld	a4,-40(s0)
    800041ba:	6f24                	ld	s1,88(a4)
    800041bc:	9782                	jalr	a5
    800041be:	87aa                	mv	a5,a0
    800041c0:	f8bc                	sd	a5,112(s1)
    800041c2:	a815                	j	800041f6 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800041c4:	fd843783          	ld	a5,-40(s0)
    800041c8:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800041ca:	fd843783          	ld	a5,-40(s0)
    800041ce:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800041d2:	fd442683          	lw	a3,-44(s0)
    800041d6:	863e                	mv	a2,a5
    800041d8:	85ba                	mv	a1,a4
    800041da:	00007517          	auipc	a0,0x7
    800041de:	21e50513          	addi	a0,a0,542 # 8000b3f8 <etext+0x3f8>
    800041e2:	ffffd097          	auipc	ra,0xffffd
    800041e6:	852080e7          	jalr	-1966(ra) # 80000a34 <printf>
    p->trapframe->a0 = -1;
    800041ea:	fd843783          	ld	a5,-40(s0)
    800041ee:	6fbc                	ld	a5,88(a5)
    800041f0:	577d                	li	a4,-1
    800041f2:	fbb8                	sd	a4,112(a5)
  }
}
    800041f4:	0001                	nop
    800041f6:	0001                	nop
    800041f8:	70a2                	ld	ra,40(sp)
    800041fa:	7402                	ld	s0,32(sp)
    800041fc:	64e2                	ld	s1,24(sp)
    800041fe:	6145                	addi	sp,sp,48
    80004200:	8082                	ret

0000000080004202 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    80004202:	1101                	addi	sp,sp,-32
    80004204:	ec06                	sd	ra,24(sp)
    80004206:	e822                	sd	s0,16(sp)
    80004208:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    8000420a:	fec40793          	addi	a5,s0,-20
    8000420e:	85be                	mv	a1,a5
    80004210:	4501                	li	a0,0
    80004212:	00000097          	auipc	ra,0x0
    80004216:	e8c080e7          	jalr	-372(ra) # 8000409e <argint>
  exit(n);
    8000421a:	fec42783          	lw	a5,-20(s0)
    8000421e:	853e                	mv	a0,a5
    80004220:	fffff097          	auipc	ra,0xfffff
    80004224:	d12080e7          	jalr	-750(ra) # 80002f32 <exit>
  return 0;  // not reached
    80004228:	4781                	li	a5,0
}
    8000422a:	853e                	mv	a0,a5
    8000422c:	60e2                	ld	ra,24(sp)
    8000422e:	6442                	ld	s0,16(sp)
    80004230:	6105                	addi	sp,sp,32
    80004232:	8082                	ret

0000000080004234 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004234:	1141                	addi	sp,sp,-16
    80004236:	e406                	sd	ra,8(sp)
    80004238:	e022                	sd	s0,0(sp)
    8000423a:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8000423c:	ffffe097          	auipc	ra,0xffffe
    80004240:	604080e7          	jalr	1540(ra) # 80002840 <myproc>
    80004244:	87aa                	mv	a5,a0
    80004246:	5b9c                	lw	a5,48(a5)
}
    80004248:	853e                	mv	a0,a5
    8000424a:	60a2                	ld	ra,8(sp)
    8000424c:	6402                	ld	s0,0(sp)
    8000424e:	0141                	addi	sp,sp,16
    80004250:	8082                	ret

0000000080004252 <sys_fork>:

uint64
sys_fork(void)
{
    80004252:	1141                	addi	sp,sp,-16
    80004254:	e406                	sd	ra,8(sp)
    80004256:	e022                	sd	s0,0(sp)
    80004258:	0800                	addi	s0,sp,16
  return fork();
    8000425a:	fffff097          	auipc	ra,0xfffff
    8000425e:	ab6080e7          	jalr	-1354(ra) # 80002d10 <fork>
    80004262:	87aa                	mv	a5,a0
}
    80004264:	853e                	mv	a0,a5
    80004266:	60a2                	ld	ra,8(sp)
    80004268:	6402                	ld	s0,0(sp)
    8000426a:	0141                	addi	sp,sp,16
    8000426c:	8082                	ret

000000008000426e <sys_wait>:

uint64
sys_wait(void)
{
    8000426e:	1101                	addi	sp,sp,-32
    80004270:	ec06                	sd	ra,24(sp)
    80004272:	e822                	sd	s0,16(sp)
    80004274:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004276:	fe840793          	addi	a5,s0,-24
    8000427a:	85be                	mv	a1,a5
    8000427c:	4501                	li	a0,0
    8000427e:	00000097          	auipc	ra,0x0
    80004282:	e56080e7          	jalr	-426(ra) # 800040d4 <argaddr>
  return wait(p);
    80004286:	fe843783          	ld	a5,-24(s0)
    8000428a:	853e                	mv	a0,a5
    8000428c:	fffff097          	auipc	ra,0xfffff
    80004290:	de2080e7          	jalr	-542(ra) # 8000306e <wait>
    80004294:	87aa                	mv	a5,a0
}
    80004296:	853e                	mv	a0,a5
    80004298:	60e2                	ld	ra,24(sp)
    8000429a:	6442                	ld	s0,16(sp)
    8000429c:	6105                	addi	sp,sp,32
    8000429e:	8082                	ret

00000000800042a0 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800042a0:	1101                	addi	sp,sp,-32
    800042a2:	ec06                	sd	ra,24(sp)
    800042a4:	e822                	sd	s0,16(sp)
    800042a6:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    800042a8:	fe440793          	addi	a5,s0,-28
    800042ac:	85be                	mv	a1,a5
    800042ae:	4501                	li	a0,0
    800042b0:	00000097          	auipc	ra,0x0
    800042b4:	dee080e7          	jalr	-530(ra) # 8000409e <argint>
  addr = myproc()->sz;
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	588080e7          	jalr	1416(ra) # 80002840 <myproc>
    800042c0:	87aa                	mv	a5,a0
    800042c2:	67bc                	ld	a5,72(a5)
    800042c4:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    800042c8:	fe442783          	lw	a5,-28(s0)
    800042cc:	853e                	mv	a0,a5
    800042ce:	fffff097          	auipc	ra,0xfffff
    800042d2:	9a2080e7          	jalr	-1630(ra) # 80002c70 <growproc>
    800042d6:	87aa                	mv	a5,a0
    800042d8:	0007d463          	bgez	a5,800042e0 <sys_sbrk+0x40>
    return -1;
    800042dc:	57fd                	li	a5,-1
    800042de:	a019                	j	800042e4 <sys_sbrk+0x44>
  return addr;
    800042e0:	fe843783          	ld	a5,-24(s0)
}
    800042e4:	853e                	mv	a0,a5
    800042e6:	60e2                	ld	ra,24(sp)
    800042e8:	6442                	ld	s0,16(sp)
    800042ea:	6105                	addi	sp,sp,32
    800042ec:	8082                	ret

00000000800042ee <sys_sleep>:

uint64
sys_sleep(void)
{
    800042ee:	1101                	addi	sp,sp,-32
    800042f0:	ec06                	sd	ra,24(sp)
    800042f2:	e822                	sd	s0,16(sp)
    800042f4:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800042f6:	fe840793          	addi	a5,s0,-24
    800042fa:	85be                	mv	a1,a5
    800042fc:	4501                	li	a0,0
    800042fe:	00000097          	auipc	ra,0x0
    80004302:	da0080e7          	jalr	-608(ra) # 8000409e <argint>
  acquire(&tickslock);
    80004306:	00015517          	auipc	a0,0x15
    8000430a:	68250513          	addi	a0,a0,1666 # 80019988 <tickslock>
    8000430e:	ffffd097          	auipc	ra,0xffffd
    80004312:	f6a080e7          	jalr	-150(ra) # 80001278 <acquire>
  ticks0 = ticks;
    80004316:	00007797          	auipc	a5,0x7
    8000431a:	5d278793          	addi	a5,a5,1490 # 8000b8e8 <ticks>
    8000431e:	439c                	lw	a5,0(a5)
    80004320:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80004324:	a099                	j	8000436a <sys_sleep+0x7c>
    if(killed(myproc())){
    80004326:	ffffe097          	auipc	ra,0xffffe
    8000432a:	51a080e7          	jalr	1306(ra) # 80002840 <myproc>
    8000432e:	87aa                	mv	a5,a0
    80004330:	853e                	mv	a0,a5
    80004332:	fffff097          	auipc	ra,0xfffff
    80004336:	2ba080e7          	jalr	698(ra) # 800035ec <killed>
    8000433a:	87aa                	mv	a5,a0
    8000433c:	cb99                	beqz	a5,80004352 <sys_sleep+0x64>
      release(&tickslock);
    8000433e:	00015517          	auipc	a0,0x15
    80004342:	64a50513          	addi	a0,a0,1610 # 80019988 <tickslock>
    80004346:	ffffd097          	auipc	ra,0xffffd
    8000434a:	f96080e7          	jalr	-106(ra) # 800012dc <release>
      return -1;
    8000434e:	57fd                	li	a5,-1
    80004350:	a0a9                	j	8000439a <sys_sleep+0xac>
    }
    sleep(&ticks, &tickslock);
    80004352:	00015597          	auipc	a1,0x15
    80004356:	63658593          	addi	a1,a1,1590 # 80019988 <tickslock>
    8000435a:	00007517          	auipc	a0,0x7
    8000435e:	58e50513          	addi	a0,a0,1422 # 8000b8e8 <ticks>
    80004362:	fffff097          	auipc	ra,0xfffff
    80004366:	0a0080e7          	jalr	160(ra) # 80003402 <sleep>
  while(ticks - ticks0 < n){
    8000436a:	00007797          	auipc	a5,0x7
    8000436e:	57e78793          	addi	a5,a5,1406 # 8000b8e8 <ticks>
    80004372:	439c                	lw	a5,0(a5)
    80004374:	fec42703          	lw	a4,-20(s0)
    80004378:	9f99                	subw	a5,a5,a4
    8000437a:	0007871b          	sext.w	a4,a5
    8000437e:	fe842783          	lw	a5,-24(s0)
    80004382:	2781                	sext.w	a5,a5
    80004384:	faf761e3          	bltu	a4,a5,80004326 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004388:	00015517          	auipc	a0,0x15
    8000438c:	60050513          	addi	a0,a0,1536 # 80019988 <tickslock>
    80004390:	ffffd097          	auipc	ra,0xffffd
    80004394:	f4c080e7          	jalr	-180(ra) # 800012dc <release>
  return 0;
    80004398:	4781                	li	a5,0
}
    8000439a:	853e                	mv	a0,a5
    8000439c:	60e2                	ld	ra,24(sp)
    8000439e:	6442                	ld	s0,16(sp)
    800043a0:	6105                	addi	sp,sp,32
    800043a2:	8082                	ret

00000000800043a4 <sys_kill>:

uint64
sys_kill(void)
{
    800043a4:	1101                	addi	sp,sp,-32
    800043a6:	ec06                	sd	ra,24(sp)
    800043a8:	e822                	sd	s0,16(sp)
    800043aa:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    800043ac:	fec40793          	addi	a5,s0,-20
    800043b0:	85be                	mv	a1,a5
    800043b2:	4501                	li	a0,0
    800043b4:	00000097          	auipc	ra,0x0
    800043b8:	cea080e7          	jalr	-790(ra) # 8000409e <argint>
  return kill(pid);
    800043bc:	fec42783          	lw	a5,-20(s0)
    800043c0:	853e                	mv	a0,a5
    800043c2:	fffff097          	auipc	ra,0xfffff
    800043c6:	150080e7          	jalr	336(ra) # 80003512 <kill>
    800043ca:	87aa                	mv	a5,a0
}
    800043cc:	853e                	mv	a0,a5
    800043ce:	60e2                	ld	ra,24(sp)
    800043d0:	6442                	ld	s0,16(sp)
    800043d2:	6105                	addi	sp,sp,32
    800043d4:	8082                	ret

00000000800043d6 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800043d6:	1101                	addi	sp,sp,-32
    800043d8:	ec06                	sd	ra,24(sp)
    800043da:	e822                	sd	s0,16(sp)
    800043dc:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800043de:	00015517          	auipc	a0,0x15
    800043e2:	5aa50513          	addi	a0,a0,1450 # 80019988 <tickslock>
    800043e6:	ffffd097          	auipc	ra,0xffffd
    800043ea:	e92080e7          	jalr	-366(ra) # 80001278 <acquire>
  xticks = ticks;
    800043ee:	00007797          	auipc	a5,0x7
    800043f2:	4fa78793          	addi	a5,a5,1274 # 8000b8e8 <ticks>
    800043f6:	439c                	lw	a5,0(a5)
    800043f8:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800043fc:	00015517          	auipc	a0,0x15
    80004400:	58c50513          	addi	a0,a0,1420 # 80019988 <tickslock>
    80004404:	ffffd097          	auipc	ra,0xffffd
    80004408:	ed8080e7          	jalr	-296(ra) # 800012dc <release>
  return xticks;
    8000440c:	fec46783          	lwu	a5,-20(s0)
}
    80004410:	853e                	mv	a0,a5
    80004412:	60e2                	ld	ra,24(sp)
    80004414:	6442                	ld	s0,16(sp)
    80004416:	6105                	addi	sp,sp,32
    80004418:	8082                	ret

000000008000441a <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8000441a:	1101                	addi	sp,sp,-32
    8000441c:	ec06                	sd	ra,24(sp)
    8000441e:	e822                	sd	s0,16(sp)
    80004420:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004422:	00007597          	auipc	a1,0x7
    80004426:	ff658593          	addi	a1,a1,-10 # 8000b418 <etext+0x418>
    8000442a:	00015517          	auipc	a0,0x15
    8000442e:	57650513          	addi	a0,a0,1398 # 800199a0 <bcache>
    80004432:	ffffd097          	auipc	ra,0xffffd
    80004436:	e16080e7          	jalr	-490(ra) # 80001248 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8000443a:	00015717          	auipc	a4,0x15
    8000443e:	56670713          	addi	a4,a4,1382 # 800199a0 <bcache>
    80004442:	67a1                	lui	a5,0x8
    80004444:	97ba                	add	a5,a5,a4
    80004446:	0001d717          	auipc	a4,0x1d
    8000444a:	7c270713          	addi	a4,a4,1986 # 80021c08 <bcache+0x8268>
    8000444e:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004452:	00015717          	auipc	a4,0x15
    80004456:	54e70713          	addi	a4,a4,1358 # 800199a0 <bcache>
    8000445a:	67a1                	lui	a5,0x8
    8000445c:	97ba                	add	a5,a5,a4
    8000445e:	0001d717          	auipc	a4,0x1d
    80004462:	7aa70713          	addi	a4,a4,1962 # 80021c08 <bcache+0x8268>
    80004466:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000446a:	00015797          	auipc	a5,0x15
    8000446e:	54e78793          	addi	a5,a5,1358 # 800199b8 <bcache+0x18>
    80004472:	fef43423          	sd	a5,-24(s0)
    80004476:	a895                	j	800044ea <binit+0xd0>
    b->next = bcache.head.next;
    80004478:	00015717          	auipc	a4,0x15
    8000447c:	52870713          	addi	a4,a4,1320 # 800199a0 <bcache>
    80004480:	67a1                	lui	a5,0x8
    80004482:	97ba                	add	a5,a5,a4
    80004484:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004488:	fe843783          	ld	a5,-24(s0)
    8000448c:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000448e:	fe843783          	ld	a5,-24(s0)
    80004492:	0001d717          	auipc	a4,0x1d
    80004496:	77670713          	addi	a4,a4,1910 # 80021c08 <bcache+0x8268>
    8000449a:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    8000449c:	fe843783          	ld	a5,-24(s0)
    800044a0:	07c1                	addi	a5,a5,16
    800044a2:	00007597          	auipc	a1,0x7
    800044a6:	f7e58593          	addi	a1,a1,-130 # 8000b420 <etext+0x420>
    800044aa:	853e                	mv	a0,a5
    800044ac:	00002097          	auipc	ra,0x2
    800044b0:	022080e7          	jalr	34(ra) # 800064ce <initsleeplock>
    bcache.head.next->prev = b;
    800044b4:	00015717          	auipc	a4,0x15
    800044b8:	4ec70713          	addi	a4,a4,1260 # 800199a0 <bcache>
    800044bc:	67a1                	lui	a5,0x8
    800044be:	97ba                	add	a5,a5,a4
    800044c0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800044c4:	fe843703          	ld	a4,-24(s0)
    800044c8:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800044ca:	00015717          	auipc	a4,0x15
    800044ce:	4d670713          	addi	a4,a4,1238 # 800199a0 <bcache>
    800044d2:	67a1                	lui	a5,0x8
    800044d4:	97ba                	add	a5,a5,a4
    800044d6:	fe843703          	ld	a4,-24(s0)
    800044da:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800044de:	fe843783          	ld	a5,-24(s0)
    800044e2:	45878793          	addi	a5,a5,1112
    800044e6:	fef43423          	sd	a5,-24(s0)
    800044ea:	0001d797          	auipc	a5,0x1d
    800044ee:	71e78793          	addi	a5,a5,1822 # 80021c08 <bcache+0x8268>
    800044f2:	fe843703          	ld	a4,-24(s0)
    800044f6:	f8f761e3          	bltu	a4,a5,80004478 <binit+0x5e>
  }
}
    800044fa:	0001                	nop
    800044fc:	0001                	nop
    800044fe:	60e2                	ld	ra,24(sp)
    80004500:	6442                	ld	s0,16(sp)
    80004502:	6105                	addi	sp,sp,32
    80004504:	8082                	ret

0000000080004506 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004506:	7179                	addi	sp,sp,-48
    80004508:	f406                	sd	ra,40(sp)
    8000450a:	f022                	sd	s0,32(sp)
    8000450c:	1800                	addi	s0,sp,48
    8000450e:	87aa                	mv	a5,a0
    80004510:	872e                	mv	a4,a1
    80004512:	fcf42e23          	sw	a5,-36(s0)
    80004516:	87ba                	mv	a5,a4
    80004518:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    8000451c:	00015517          	auipc	a0,0x15
    80004520:	48450513          	addi	a0,a0,1156 # 800199a0 <bcache>
    80004524:	ffffd097          	auipc	ra,0xffffd
    80004528:	d54080e7          	jalr	-684(ra) # 80001278 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8000452c:	00015717          	auipc	a4,0x15
    80004530:	47470713          	addi	a4,a4,1140 # 800199a0 <bcache>
    80004534:	67a1                	lui	a5,0x8
    80004536:	97ba                	add	a5,a5,a4
    80004538:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000453c:	fef43423          	sd	a5,-24(s0)
    80004540:	a095                	j	800045a4 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004542:	fe843783          	ld	a5,-24(s0)
    80004546:	4798                	lw	a4,8(a5)
    80004548:	fdc42783          	lw	a5,-36(s0)
    8000454c:	2781                	sext.w	a5,a5
    8000454e:	04e79663          	bne	a5,a4,8000459a <bget+0x94>
    80004552:	fe843783          	ld	a5,-24(s0)
    80004556:	47d8                	lw	a4,12(a5)
    80004558:	fd842783          	lw	a5,-40(s0)
    8000455c:	2781                	sext.w	a5,a5
    8000455e:	02e79e63          	bne	a5,a4,8000459a <bget+0x94>
      b->refcnt++;
    80004562:	fe843783          	ld	a5,-24(s0)
    80004566:	43bc                	lw	a5,64(a5)
    80004568:	2785                	addiw	a5,a5,1
    8000456a:	0007871b          	sext.w	a4,a5
    8000456e:	fe843783          	ld	a5,-24(s0)
    80004572:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004574:	00015517          	auipc	a0,0x15
    80004578:	42c50513          	addi	a0,a0,1068 # 800199a0 <bcache>
    8000457c:	ffffd097          	auipc	ra,0xffffd
    80004580:	d60080e7          	jalr	-672(ra) # 800012dc <release>
      acquiresleep(&b->lock);
    80004584:	fe843783          	ld	a5,-24(s0)
    80004588:	07c1                	addi	a5,a5,16
    8000458a:	853e                	mv	a0,a5
    8000458c:	00002097          	auipc	ra,0x2
    80004590:	f8e080e7          	jalr	-114(ra) # 8000651a <acquiresleep>
      return b;
    80004594:	fe843783          	ld	a5,-24(s0)
    80004598:	a07d                	j	80004646 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8000459a:	fe843783          	ld	a5,-24(s0)
    8000459e:	6bbc                	ld	a5,80(a5)
    800045a0:	fef43423          	sd	a5,-24(s0)
    800045a4:	fe843703          	ld	a4,-24(s0)
    800045a8:	0001d797          	auipc	a5,0x1d
    800045ac:	66078793          	addi	a5,a5,1632 # 80021c08 <bcache+0x8268>
    800045b0:	f8f719e3          	bne	a4,a5,80004542 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800045b4:	00015717          	auipc	a4,0x15
    800045b8:	3ec70713          	addi	a4,a4,1004 # 800199a0 <bcache>
    800045bc:	67a1                	lui	a5,0x8
    800045be:	97ba                	add	a5,a5,a4
    800045c0:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800045c4:	fef43423          	sd	a5,-24(s0)
    800045c8:	a8b9                	j	80004626 <bget+0x120>
    if(b->refcnt == 0) {
    800045ca:	fe843783          	ld	a5,-24(s0)
    800045ce:	43bc                	lw	a5,64(a5)
    800045d0:	e7b1                	bnez	a5,8000461c <bget+0x116>
      b->dev = dev;
    800045d2:	fe843783          	ld	a5,-24(s0)
    800045d6:	fdc42703          	lw	a4,-36(s0)
    800045da:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    800045dc:	fe843783          	ld	a5,-24(s0)
    800045e0:	fd842703          	lw	a4,-40(s0)
    800045e4:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800045e6:	fe843783          	ld	a5,-24(s0)
    800045ea:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800045ee:	fe843783          	ld	a5,-24(s0)
    800045f2:	4705                	li	a4,1
    800045f4:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800045f6:	00015517          	auipc	a0,0x15
    800045fa:	3aa50513          	addi	a0,a0,938 # 800199a0 <bcache>
    800045fe:	ffffd097          	auipc	ra,0xffffd
    80004602:	cde080e7          	jalr	-802(ra) # 800012dc <release>
      acquiresleep(&b->lock);
    80004606:	fe843783          	ld	a5,-24(s0)
    8000460a:	07c1                	addi	a5,a5,16
    8000460c:	853e                	mv	a0,a5
    8000460e:	00002097          	auipc	ra,0x2
    80004612:	f0c080e7          	jalr	-244(ra) # 8000651a <acquiresleep>
      return b;
    80004616:	fe843783          	ld	a5,-24(s0)
    8000461a:	a035                	j	80004646 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000461c:	fe843783          	ld	a5,-24(s0)
    80004620:	67bc                	ld	a5,72(a5)
    80004622:	fef43423          	sd	a5,-24(s0)
    80004626:	fe843703          	ld	a4,-24(s0)
    8000462a:	0001d797          	auipc	a5,0x1d
    8000462e:	5de78793          	addi	a5,a5,1502 # 80021c08 <bcache+0x8268>
    80004632:	f8f71ce3          	bne	a4,a5,800045ca <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004636:	00007517          	auipc	a0,0x7
    8000463a:	df250513          	addi	a0,a0,-526 # 8000b428 <etext+0x428>
    8000463e:	ffffc097          	auipc	ra,0xffffc
    80004642:	64c080e7          	jalr	1612(ra) # 80000c8a <panic>
}
    80004646:	853e                	mv	a0,a5
    80004648:	70a2                	ld	ra,40(sp)
    8000464a:	7402                	ld	s0,32(sp)
    8000464c:	6145                	addi	sp,sp,48
    8000464e:	8082                	ret

0000000080004650 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004650:	7179                	addi	sp,sp,-48
    80004652:	f406                	sd	ra,40(sp)
    80004654:	f022                	sd	s0,32(sp)
    80004656:	1800                	addi	s0,sp,48
    80004658:	87aa                	mv	a5,a0
    8000465a:	872e                	mv	a4,a1
    8000465c:	fcf42e23          	sw	a5,-36(s0)
    80004660:	87ba                	mv	a5,a4
    80004662:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004666:	fd842703          	lw	a4,-40(s0)
    8000466a:	fdc42783          	lw	a5,-36(s0)
    8000466e:	85ba                	mv	a1,a4
    80004670:	853e                	mv	a0,a5
    80004672:	00000097          	auipc	ra,0x0
    80004676:	e94080e7          	jalr	-364(ra) # 80004506 <bget>
    8000467a:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    8000467e:	fe843783          	ld	a5,-24(s0)
    80004682:	439c                	lw	a5,0(a5)
    80004684:	ef81                	bnez	a5,8000469c <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004686:	4581                	li	a1,0
    80004688:	fe843503          	ld	a0,-24(s0)
    8000468c:	00005097          	auipc	ra,0x5
    80004690:	8d6080e7          	jalr	-1834(ra) # 80008f62 <virtio_disk_rw>
    b->valid = 1;
    80004694:	fe843783          	ld	a5,-24(s0)
    80004698:	4705                	li	a4,1
    8000469a:	c398                	sw	a4,0(a5)
  }
  return b;
    8000469c:	fe843783          	ld	a5,-24(s0)
}
    800046a0:	853e                	mv	a0,a5
    800046a2:	70a2                	ld	ra,40(sp)
    800046a4:	7402                	ld	s0,32(sp)
    800046a6:	6145                	addi	sp,sp,48
    800046a8:	8082                	ret

00000000800046aa <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    800046aa:	1101                	addi	sp,sp,-32
    800046ac:	ec06                	sd	ra,24(sp)
    800046ae:	e822                	sd	s0,16(sp)
    800046b0:	1000                	addi	s0,sp,32
    800046b2:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800046b6:	fe843783          	ld	a5,-24(s0)
    800046ba:	07c1                	addi	a5,a5,16
    800046bc:	853e                	mv	a0,a5
    800046be:	00002097          	auipc	ra,0x2
    800046c2:	f1c080e7          	jalr	-228(ra) # 800065da <holdingsleep>
    800046c6:	87aa                	mv	a5,a0
    800046c8:	eb89                	bnez	a5,800046da <bwrite+0x30>
    panic("bwrite");
    800046ca:	00007517          	auipc	a0,0x7
    800046ce:	d7650513          	addi	a0,a0,-650 # 8000b440 <etext+0x440>
    800046d2:	ffffc097          	auipc	ra,0xffffc
    800046d6:	5b8080e7          	jalr	1464(ra) # 80000c8a <panic>
  virtio_disk_rw(b, 1);
    800046da:	4585                	li	a1,1
    800046dc:	fe843503          	ld	a0,-24(s0)
    800046e0:	00005097          	auipc	ra,0x5
    800046e4:	882080e7          	jalr	-1918(ra) # 80008f62 <virtio_disk_rw>
}
    800046e8:	0001                	nop
    800046ea:	60e2                	ld	ra,24(sp)
    800046ec:	6442                	ld	s0,16(sp)
    800046ee:	6105                	addi	sp,sp,32
    800046f0:	8082                	ret

00000000800046f2 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800046f2:	1101                	addi	sp,sp,-32
    800046f4:	ec06                	sd	ra,24(sp)
    800046f6:	e822                	sd	s0,16(sp)
    800046f8:	1000                	addi	s0,sp,32
    800046fa:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800046fe:	fe843783          	ld	a5,-24(s0)
    80004702:	07c1                	addi	a5,a5,16
    80004704:	853e                	mv	a0,a5
    80004706:	00002097          	auipc	ra,0x2
    8000470a:	ed4080e7          	jalr	-300(ra) # 800065da <holdingsleep>
    8000470e:	87aa                	mv	a5,a0
    80004710:	eb89                	bnez	a5,80004722 <brelse+0x30>
    panic("brelse");
    80004712:	00007517          	auipc	a0,0x7
    80004716:	d3650513          	addi	a0,a0,-714 # 8000b448 <etext+0x448>
    8000471a:	ffffc097          	auipc	ra,0xffffc
    8000471e:	570080e7          	jalr	1392(ra) # 80000c8a <panic>

  releasesleep(&b->lock);
    80004722:	fe843783          	ld	a5,-24(s0)
    80004726:	07c1                	addi	a5,a5,16
    80004728:	853e                	mv	a0,a5
    8000472a:	00002097          	auipc	ra,0x2
    8000472e:	e5e080e7          	jalr	-418(ra) # 80006588 <releasesleep>

  acquire(&bcache.lock);
    80004732:	00015517          	auipc	a0,0x15
    80004736:	26e50513          	addi	a0,a0,622 # 800199a0 <bcache>
    8000473a:	ffffd097          	auipc	ra,0xffffd
    8000473e:	b3e080e7          	jalr	-1218(ra) # 80001278 <acquire>
  b->refcnt--;
    80004742:	fe843783          	ld	a5,-24(s0)
    80004746:	43bc                	lw	a5,64(a5)
    80004748:	37fd                	addiw	a5,a5,-1
    8000474a:	0007871b          	sext.w	a4,a5
    8000474e:	fe843783          	ld	a5,-24(s0)
    80004752:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004754:	fe843783          	ld	a5,-24(s0)
    80004758:	43bc                	lw	a5,64(a5)
    8000475a:	e7b5                	bnez	a5,800047c6 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8000475c:	fe843783          	ld	a5,-24(s0)
    80004760:	6bbc                	ld	a5,80(a5)
    80004762:	fe843703          	ld	a4,-24(s0)
    80004766:	6738                	ld	a4,72(a4)
    80004768:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    8000476a:	fe843783          	ld	a5,-24(s0)
    8000476e:	67bc                	ld	a5,72(a5)
    80004770:	fe843703          	ld	a4,-24(s0)
    80004774:	6b38                	ld	a4,80(a4)
    80004776:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004778:	00015717          	auipc	a4,0x15
    8000477c:	22870713          	addi	a4,a4,552 # 800199a0 <bcache>
    80004780:	67a1                	lui	a5,0x8
    80004782:	97ba                	add	a5,a5,a4
    80004784:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004788:	fe843783          	ld	a5,-24(s0)
    8000478c:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000478e:	fe843783          	ld	a5,-24(s0)
    80004792:	0001d717          	auipc	a4,0x1d
    80004796:	47670713          	addi	a4,a4,1142 # 80021c08 <bcache+0x8268>
    8000479a:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    8000479c:	00015717          	auipc	a4,0x15
    800047a0:	20470713          	addi	a4,a4,516 # 800199a0 <bcache>
    800047a4:	67a1                	lui	a5,0x8
    800047a6:	97ba                	add	a5,a5,a4
    800047a8:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047ac:	fe843703          	ld	a4,-24(s0)
    800047b0:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800047b2:	00015717          	auipc	a4,0x15
    800047b6:	1ee70713          	addi	a4,a4,494 # 800199a0 <bcache>
    800047ba:	67a1                	lui	a5,0x8
    800047bc:	97ba                	add	a5,a5,a4
    800047be:	fe843703          	ld	a4,-24(s0)
    800047c2:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    800047c6:	00015517          	auipc	a0,0x15
    800047ca:	1da50513          	addi	a0,a0,474 # 800199a0 <bcache>
    800047ce:	ffffd097          	auipc	ra,0xffffd
    800047d2:	b0e080e7          	jalr	-1266(ra) # 800012dc <release>
}
    800047d6:	0001                	nop
    800047d8:	60e2                	ld	ra,24(sp)
    800047da:	6442                	ld	s0,16(sp)
    800047dc:	6105                	addi	sp,sp,32
    800047de:	8082                	ret

00000000800047e0 <bpin>:

void
bpin(struct buf *b) {
    800047e0:	1101                	addi	sp,sp,-32
    800047e2:	ec06                	sd	ra,24(sp)
    800047e4:	e822                	sd	s0,16(sp)
    800047e6:	1000                	addi	s0,sp,32
    800047e8:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800047ec:	00015517          	auipc	a0,0x15
    800047f0:	1b450513          	addi	a0,a0,436 # 800199a0 <bcache>
    800047f4:	ffffd097          	auipc	ra,0xffffd
    800047f8:	a84080e7          	jalr	-1404(ra) # 80001278 <acquire>
  b->refcnt++;
    800047fc:	fe843783          	ld	a5,-24(s0)
    80004800:	43bc                	lw	a5,64(a5)
    80004802:	2785                	addiw	a5,a5,1
    80004804:	0007871b          	sext.w	a4,a5
    80004808:	fe843783          	ld	a5,-24(s0)
    8000480c:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    8000480e:	00015517          	auipc	a0,0x15
    80004812:	19250513          	addi	a0,a0,402 # 800199a0 <bcache>
    80004816:	ffffd097          	auipc	ra,0xffffd
    8000481a:	ac6080e7          	jalr	-1338(ra) # 800012dc <release>
}
    8000481e:	0001                	nop
    80004820:	60e2                	ld	ra,24(sp)
    80004822:	6442                	ld	s0,16(sp)
    80004824:	6105                	addi	sp,sp,32
    80004826:	8082                	ret

0000000080004828 <bunpin>:

void
bunpin(struct buf *b) {
    80004828:	1101                	addi	sp,sp,-32
    8000482a:	ec06                	sd	ra,24(sp)
    8000482c:	e822                	sd	s0,16(sp)
    8000482e:	1000                	addi	s0,sp,32
    80004830:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004834:	00015517          	auipc	a0,0x15
    80004838:	16c50513          	addi	a0,a0,364 # 800199a0 <bcache>
    8000483c:	ffffd097          	auipc	ra,0xffffd
    80004840:	a3c080e7          	jalr	-1476(ra) # 80001278 <acquire>
  b->refcnt--;
    80004844:	fe843783          	ld	a5,-24(s0)
    80004848:	43bc                	lw	a5,64(a5)
    8000484a:	37fd                	addiw	a5,a5,-1
    8000484c:	0007871b          	sext.w	a4,a5
    80004850:	fe843783          	ld	a5,-24(s0)
    80004854:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004856:	00015517          	auipc	a0,0x15
    8000485a:	14a50513          	addi	a0,a0,330 # 800199a0 <bcache>
    8000485e:	ffffd097          	auipc	ra,0xffffd
    80004862:	a7e080e7          	jalr	-1410(ra) # 800012dc <release>
}
    80004866:	0001                	nop
    80004868:	60e2                	ld	ra,24(sp)
    8000486a:	6442                	ld	s0,16(sp)
    8000486c:	6105                	addi	sp,sp,32
    8000486e:	8082                	ret

0000000080004870 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004870:	7179                	addi	sp,sp,-48
    80004872:	f406                	sd	ra,40(sp)
    80004874:	f022                	sd	s0,32(sp)
    80004876:	1800                	addi	s0,sp,48
    80004878:	87aa                	mv	a5,a0
    8000487a:	fcb43823          	sd	a1,-48(s0)
    8000487e:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004882:	fdc42783          	lw	a5,-36(s0)
    80004886:	4585                	li	a1,1
    80004888:	853e                	mv	a0,a5
    8000488a:	00000097          	auipc	ra,0x0
    8000488e:	dc6080e7          	jalr	-570(ra) # 80004650 <bread>
    80004892:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004896:	fe843783          	ld	a5,-24(s0)
    8000489a:	05878793          	addi	a5,a5,88
    8000489e:	02000613          	li	a2,32
    800048a2:	85be                	mv	a1,a5
    800048a4:	fd043503          	ld	a0,-48(s0)
    800048a8:	ffffd097          	auipc	ra,0xffffd
    800048ac:	c88080e7          	jalr	-888(ra) # 80001530 <memmove>
  brelse(bp);
    800048b0:	fe843503          	ld	a0,-24(s0)
    800048b4:	00000097          	auipc	ra,0x0
    800048b8:	e3e080e7          	jalr	-450(ra) # 800046f2 <brelse>
}
    800048bc:	0001                	nop
    800048be:	70a2                	ld	ra,40(sp)
    800048c0:	7402                	ld	s0,32(sp)
    800048c2:	6145                	addi	sp,sp,48
    800048c4:	8082                	ret

00000000800048c6 <fsinit>:

// Init fs
void
fsinit(int dev) {
    800048c6:	1101                	addi	sp,sp,-32
    800048c8:	ec06                	sd	ra,24(sp)
    800048ca:	e822                	sd	s0,16(sp)
    800048cc:	1000                	addi	s0,sp,32
    800048ce:	87aa                	mv	a5,a0
    800048d0:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    800048d4:	fec42783          	lw	a5,-20(s0)
    800048d8:	0001d597          	auipc	a1,0x1d
    800048dc:	78858593          	addi	a1,a1,1928 # 80022060 <sb>
    800048e0:	853e                	mv	a0,a5
    800048e2:	00000097          	auipc	ra,0x0
    800048e6:	f8e080e7          	jalr	-114(ra) # 80004870 <readsb>
  if(sb.magic != FSMAGIC)
    800048ea:	0001d797          	auipc	a5,0x1d
    800048ee:	77678793          	addi	a5,a5,1910 # 80022060 <sb>
    800048f2:	439c                	lw	a5,0(a5)
    800048f4:	873e                	mv	a4,a5
    800048f6:	102037b7          	lui	a5,0x10203
    800048fa:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    800048fe:	00f70a63          	beq	a4,a5,80004912 <fsinit+0x4c>
    panic("invalid file system");
    80004902:	00007517          	auipc	a0,0x7
    80004906:	b4e50513          	addi	a0,a0,-1202 # 8000b450 <etext+0x450>
    8000490a:	ffffc097          	auipc	ra,0xffffc
    8000490e:	380080e7          	jalr	896(ra) # 80000c8a <panic>
  initlog(dev, &sb);
    80004912:	fec42783          	lw	a5,-20(s0)
    80004916:	0001d597          	auipc	a1,0x1d
    8000491a:	74a58593          	addi	a1,a1,1866 # 80022060 <sb>
    8000491e:	853e                	mv	a0,a5
    80004920:	00001097          	auipc	ra,0x1
    80004924:	492080e7          	jalr	1170(ra) # 80005db2 <initlog>
}
    80004928:	0001                	nop
    8000492a:	60e2                	ld	ra,24(sp)
    8000492c:	6442                	ld	s0,16(sp)
    8000492e:	6105                	addi	sp,sp,32
    80004930:	8082                	ret

0000000080004932 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004932:	7179                	addi	sp,sp,-48
    80004934:	f406                	sd	ra,40(sp)
    80004936:	f022                	sd	s0,32(sp)
    80004938:	1800                	addi	s0,sp,48
    8000493a:	87aa                	mv	a5,a0
    8000493c:	872e                	mv	a4,a1
    8000493e:	fcf42e23          	sw	a5,-36(s0)
    80004942:	87ba                	mv	a5,a4
    80004944:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004948:	fdc42783          	lw	a5,-36(s0)
    8000494c:	fd842703          	lw	a4,-40(s0)
    80004950:	85ba                	mv	a1,a4
    80004952:	853e                	mv	a0,a5
    80004954:	00000097          	auipc	ra,0x0
    80004958:	cfc080e7          	jalr	-772(ra) # 80004650 <bread>
    8000495c:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004960:	fe843783          	ld	a5,-24(s0)
    80004964:	05878793          	addi	a5,a5,88
    80004968:	40000613          	li	a2,1024
    8000496c:	4581                	li	a1,0
    8000496e:	853e                	mv	a0,a5
    80004970:	ffffd097          	auipc	ra,0xffffd
    80004974:	adc080e7          	jalr	-1316(ra) # 8000144c <memset>
  log_write(bp);
    80004978:	fe843503          	ld	a0,-24(s0)
    8000497c:	00002097          	auipc	ra,0x2
    80004980:	a1e080e7          	jalr	-1506(ra) # 8000639a <log_write>
  brelse(bp);
    80004984:	fe843503          	ld	a0,-24(s0)
    80004988:	00000097          	auipc	ra,0x0
    8000498c:	d6a080e7          	jalr	-662(ra) # 800046f2 <brelse>
}
    80004990:	0001                	nop
    80004992:	70a2                	ld	ra,40(sp)
    80004994:	7402                	ld	s0,32(sp)
    80004996:	6145                	addi	sp,sp,48
    80004998:	8082                	ret

000000008000499a <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    8000499a:	7139                	addi	sp,sp,-64
    8000499c:	fc06                	sd	ra,56(sp)
    8000499e:	f822                	sd	s0,48(sp)
    800049a0:	0080                	addi	s0,sp,64
    800049a2:	87aa                	mv	a5,a0
    800049a4:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    800049a8:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    800049ac:	fe042623          	sw	zero,-20(s0)
    800049b0:	a295                	j	80004b14 <balloc+0x17a>
    bp = bread(dev, BBLOCK(b, sb));
    800049b2:	fec42783          	lw	a5,-20(s0)
    800049b6:	41f7d71b          	sraiw	a4,a5,0x1f
    800049ba:	0137571b          	srliw	a4,a4,0x13
    800049be:	9fb9                	addw	a5,a5,a4
    800049c0:	40d7d79b          	sraiw	a5,a5,0xd
    800049c4:	2781                	sext.w	a5,a5
    800049c6:	0007871b          	sext.w	a4,a5
    800049ca:	0001d797          	auipc	a5,0x1d
    800049ce:	69678793          	addi	a5,a5,1686 # 80022060 <sb>
    800049d2:	4fdc                	lw	a5,28(a5)
    800049d4:	9fb9                	addw	a5,a5,a4
    800049d6:	0007871b          	sext.w	a4,a5
    800049da:	fcc42783          	lw	a5,-52(s0)
    800049de:	85ba                	mv	a1,a4
    800049e0:	853e                	mv	a0,a5
    800049e2:	00000097          	auipc	ra,0x0
    800049e6:	c6e080e7          	jalr	-914(ra) # 80004650 <bread>
    800049ea:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800049ee:	fe042423          	sw	zero,-24(s0)
    800049f2:	a8e9                	j	80004acc <balloc+0x132>
      m = 1 << (bi % 8);
    800049f4:	fe842783          	lw	a5,-24(s0)
    800049f8:	8b9d                	andi	a5,a5,7
    800049fa:	2781                	sext.w	a5,a5
    800049fc:	4705                	li	a4,1
    800049fe:	00f717bb          	sllw	a5,a4,a5
    80004a02:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004a06:	fe842783          	lw	a5,-24(s0)
    80004a0a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004a0e:	01d7571b          	srliw	a4,a4,0x1d
    80004a12:	9fb9                	addw	a5,a5,a4
    80004a14:	4037d79b          	sraiw	a5,a5,0x3
    80004a18:	2781                	sext.w	a5,a5
    80004a1a:	fe043703          	ld	a4,-32(s0)
    80004a1e:	97ba                	add	a5,a5,a4
    80004a20:	0587c783          	lbu	a5,88(a5)
    80004a24:	2781                	sext.w	a5,a5
    80004a26:	fdc42703          	lw	a4,-36(s0)
    80004a2a:	8ff9                	and	a5,a5,a4
    80004a2c:	2781                	sext.w	a5,a5
    80004a2e:	ebd1                	bnez	a5,80004ac2 <balloc+0x128>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004a30:	fe842783          	lw	a5,-24(s0)
    80004a34:	41f7d71b          	sraiw	a4,a5,0x1f
    80004a38:	01d7571b          	srliw	a4,a4,0x1d
    80004a3c:	9fb9                	addw	a5,a5,a4
    80004a3e:	4037d79b          	sraiw	a5,a5,0x3
    80004a42:	2781                	sext.w	a5,a5
    80004a44:	fe043703          	ld	a4,-32(s0)
    80004a48:	973e                	add	a4,a4,a5
    80004a4a:	05874703          	lbu	a4,88(a4)
    80004a4e:	0187169b          	slliw	a3,a4,0x18
    80004a52:	4186d69b          	sraiw	a3,a3,0x18
    80004a56:	fdc42703          	lw	a4,-36(s0)
    80004a5a:	0187171b          	slliw	a4,a4,0x18
    80004a5e:	4187571b          	sraiw	a4,a4,0x18
    80004a62:	8f55                	or	a4,a4,a3
    80004a64:	0187171b          	slliw	a4,a4,0x18
    80004a68:	4187571b          	sraiw	a4,a4,0x18
    80004a6c:	0ff77713          	zext.b	a4,a4
    80004a70:	fe043683          	ld	a3,-32(s0)
    80004a74:	97b6                	add	a5,a5,a3
    80004a76:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004a7a:	fe043503          	ld	a0,-32(s0)
    80004a7e:	00002097          	auipc	ra,0x2
    80004a82:	91c080e7          	jalr	-1764(ra) # 8000639a <log_write>
        brelse(bp);
    80004a86:	fe043503          	ld	a0,-32(s0)
    80004a8a:	00000097          	auipc	ra,0x0
    80004a8e:	c68080e7          	jalr	-920(ra) # 800046f2 <brelse>
        bzero(dev, b + bi);
    80004a92:	fcc42783          	lw	a5,-52(s0)
    80004a96:	fec42703          	lw	a4,-20(s0)
    80004a9a:	86ba                	mv	a3,a4
    80004a9c:	fe842703          	lw	a4,-24(s0)
    80004aa0:	9f35                	addw	a4,a4,a3
    80004aa2:	2701                	sext.w	a4,a4
    80004aa4:	85ba                	mv	a1,a4
    80004aa6:	853e                	mv	a0,a5
    80004aa8:	00000097          	auipc	ra,0x0
    80004aac:	e8a080e7          	jalr	-374(ra) # 80004932 <bzero>
        return b + bi;
    80004ab0:	fec42783          	lw	a5,-20(s0)
    80004ab4:	873e                	mv	a4,a5
    80004ab6:	fe842783          	lw	a5,-24(s0)
    80004aba:	9fb9                	addw	a5,a5,a4
    80004abc:	2781                	sext.w	a5,a5
    80004abe:	2781                	sext.w	a5,a5
    80004ac0:	a8a5                	j	80004b38 <balloc+0x19e>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004ac2:	fe842783          	lw	a5,-24(s0)
    80004ac6:	2785                	addiw	a5,a5,1
    80004ac8:	fef42423          	sw	a5,-24(s0)
    80004acc:	fe842783          	lw	a5,-24(s0)
    80004ad0:	0007871b          	sext.w	a4,a5
    80004ad4:	6789                	lui	a5,0x2
    80004ad6:	02f75263          	bge	a4,a5,80004afa <balloc+0x160>
    80004ada:	fec42783          	lw	a5,-20(s0)
    80004ade:	873e                	mv	a4,a5
    80004ae0:	fe842783          	lw	a5,-24(s0)
    80004ae4:	9fb9                	addw	a5,a5,a4
    80004ae6:	2781                	sext.w	a5,a5
    80004ae8:	0007871b          	sext.w	a4,a5
    80004aec:	0001d797          	auipc	a5,0x1d
    80004af0:	57478793          	addi	a5,a5,1396 # 80022060 <sb>
    80004af4:	43dc                	lw	a5,4(a5)
    80004af6:	eef76fe3          	bltu	a4,a5,800049f4 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004afa:	fe043503          	ld	a0,-32(s0)
    80004afe:	00000097          	auipc	ra,0x0
    80004b02:	bf4080e7          	jalr	-1036(ra) # 800046f2 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004b06:	fec42783          	lw	a5,-20(s0)
    80004b0a:	873e                	mv	a4,a5
    80004b0c:	6789                	lui	a5,0x2
    80004b0e:	9fb9                	addw	a5,a5,a4
    80004b10:	fef42623          	sw	a5,-20(s0)
    80004b14:	0001d797          	auipc	a5,0x1d
    80004b18:	54c78793          	addi	a5,a5,1356 # 80022060 <sb>
    80004b1c:	43d8                	lw	a4,4(a5)
    80004b1e:	fec42783          	lw	a5,-20(s0)
    80004b22:	e8e7e8e3          	bltu	a5,a4,800049b2 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004b26:	00007517          	auipc	a0,0x7
    80004b2a:	94250513          	addi	a0,a0,-1726 # 8000b468 <etext+0x468>
    80004b2e:	ffffc097          	auipc	ra,0xffffc
    80004b32:	f06080e7          	jalr	-250(ra) # 80000a34 <printf>
  return 0;
    80004b36:	4781                	li	a5,0
}
    80004b38:	853e                	mv	a0,a5
    80004b3a:	70e2                	ld	ra,56(sp)
    80004b3c:	7442                	ld	s0,48(sp)
    80004b3e:	6121                	addi	sp,sp,64
    80004b40:	8082                	ret

0000000080004b42 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004b42:	7179                	addi	sp,sp,-48
    80004b44:	f406                	sd	ra,40(sp)
    80004b46:	f022                	sd	s0,32(sp)
    80004b48:	1800                	addi	s0,sp,48
    80004b4a:	87aa                	mv	a5,a0
    80004b4c:	872e                	mv	a4,a1
    80004b4e:	fcf42e23          	sw	a5,-36(s0)
    80004b52:	87ba                	mv	a5,a4
    80004b54:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004b58:	fdc42683          	lw	a3,-36(s0)
    80004b5c:	fd842783          	lw	a5,-40(s0)
    80004b60:	00d7d79b          	srliw	a5,a5,0xd
    80004b64:	0007871b          	sext.w	a4,a5
    80004b68:	0001d797          	auipc	a5,0x1d
    80004b6c:	4f878793          	addi	a5,a5,1272 # 80022060 <sb>
    80004b70:	4fdc                	lw	a5,28(a5)
    80004b72:	9fb9                	addw	a5,a5,a4
    80004b74:	2781                	sext.w	a5,a5
    80004b76:	85be                	mv	a1,a5
    80004b78:	8536                	mv	a0,a3
    80004b7a:	00000097          	auipc	ra,0x0
    80004b7e:	ad6080e7          	jalr	-1322(ra) # 80004650 <bread>
    80004b82:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004b86:	fd842703          	lw	a4,-40(s0)
    80004b8a:	6789                	lui	a5,0x2
    80004b8c:	17fd                	addi	a5,a5,-1 # 1fff <_entry-0x7fffe001>
    80004b8e:	8ff9                	and	a5,a5,a4
    80004b90:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004b94:	fe442783          	lw	a5,-28(s0)
    80004b98:	8b9d                	andi	a5,a5,7
    80004b9a:	2781                	sext.w	a5,a5
    80004b9c:	4705                	li	a4,1
    80004b9e:	00f717bb          	sllw	a5,a4,a5
    80004ba2:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004ba6:	fe442783          	lw	a5,-28(s0)
    80004baa:	41f7d71b          	sraiw	a4,a5,0x1f
    80004bae:	01d7571b          	srliw	a4,a4,0x1d
    80004bb2:	9fb9                	addw	a5,a5,a4
    80004bb4:	4037d79b          	sraiw	a5,a5,0x3
    80004bb8:	2781                	sext.w	a5,a5
    80004bba:	fe843703          	ld	a4,-24(s0)
    80004bbe:	97ba                	add	a5,a5,a4
    80004bc0:	0587c783          	lbu	a5,88(a5)
    80004bc4:	2781                	sext.w	a5,a5
    80004bc6:	fe042703          	lw	a4,-32(s0)
    80004bca:	8ff9                	and	a5,a5,a4
    80004bcc:	2781                	sext.w	a5,a5
    80004bce:	eb89                	bnez	a5,80004be0 <bfree+0x9e>
    panic("freeing free block");
    80004bd0:	00007517          	auipc	a0,0x7
    80004bd4:	8b050513          	addi	a0,a0,-1872 # 8000b480 <etext+0x480>
    80004bd8:	ffffc097          	auipc	ra,0xffffc
    80004bdc:	0b2080e7          	jalr	178(ra) # 80000c8a <panic>
  bp->data[bi/8] &= ~m;
    80004be0:	fe442783          	lw	a5,-28(s0)
    80004be4:	41f7d71b          	sraiw	a4,a5,0x1f
    80004be8:	01d7571b          	srliw	a4,a4,0x1d
    80004bec:	9fb9                	addw	a5,a5,a4
    80004bee:	4037d79b          	sraiw	a5,a5,0x3
    80004bf2:	2781                	sext.w	a5,a5
    80004bf4:	fe843703          	ld	a4,-24(s0)
    80004bf8:	973e                	add	a4,a4,a5
    80004bfa:	05874703          	lbu	a4,88(a4)
    80004bfe:	0187169b          	slliw	a3,a4,0x18
    80004c02:	4186d69b          	sraiw	a3,a3,0x18
    80004c06:	fe042703          	lw	a4,-32(s0)
    80004c0a:	0187171b          	slliw	a4,a4,0x18
    80004c0e:	4187571b          	sraiw	a4,a4,0x18
    80004c12:	fff74713          	not	a4,a4
    80004c16:	0187171b          	slliw	a4,a4,0x18
    80004c1a:	4187571b          	sraiw	a4,a4,0x18
    80004c1e:	8f75                	and	a4,a4,a3
    80004c20:	0187171b          	slliw	a4,a4,0x18
    80004c24:	4187571b          	sraiw	a4,a4,0x18
    80004c28:	0ff77713          	zext.b	a4,a4
    80004c2c:	fe843683          	ld	a3,-24(s0)
    80004c30:	97b6                	add	a5,a5,a3
    80004c32:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004c36:	fe843503          	ld	a0,-24(s0)
    80004c3a:	00001097          	auipc	ra,0x1
    80004c3e:	760080e7          	jalr	1888(ra) # 8000639a <log_write>
  brelse(bp);
    80004c42:	fe843503          	ld	a0,-24(s0)
    80004c46:	00000097          	auipc	ra,0x0
    80004c4a:	aac080e7          	jalr	-1364(ra) # 800046f2 <brelse>
}
    80004c4e:	0001                	nop
    80004c50:	70a2                	ld	ra,40(sp)
    80004c52:	7402                	ld	s0,32(sp)
    80004c54:	6145                	addi	sp,sp,48
    80004c56:	8082                	ret

0000000080004c58 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004c58:	1101                	addi	sp,sp,-32
    80004c5a:	ec06                	sd	ra,24(sp)
    80004c5c:	e822                	sd	s0,16(sp)
    80004c5e:	1000                	addi	s0,sp,32
  int i = 0;
    80004c60:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004c64:	00007597          	auipc	a1,0x7
    80004c68:	83458593          	addi	a1,a1,-1996 # 8000b498 <etext+0x498>
    80004c6c:	0001d517          	auipc	a0,0x1d
    80004c70:	41450513          	addi	a0,a0,1044 # 80022080 <itable>
    80004c74:	ffffc097          	auipc	ra,0xffffc
    80004c78:	5d4080e7          	jalr	1492(ra) # 80001248 <initlock>
  for(i = 0; i < NINODE; i++) {
    80004c7c:	fe042623          	sw	zero,-20(s0)
    80004c80:	a82d                	j	80004cba <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004c82:	fec42703          	lw	a4,-20(s0)
    80004c86:	87ba                	mv	a5,a4
    80004c88:	0792                	slli	a5,a5,0x4
    80004c8a:	97ba                	add	a5,a5,a4
    80004c8c:	078e                	slli	a5,a5,0x3
    80004c8e:	02078713          	addi	a4,a5,32
    80004c92:	0001d797          	auipc	a5,0x1d
    80004c96:	3ee78793          	addi	a5,a5,1006 # 80022080 <itable>
    80004c9a:	97ba                	add	a5,a5,a4
    80004c9c:	07a1                	addi	a5,a5,8
    80004c9e:	00007597          	auipc	a1,0x7
    80004ca2:	80258593          	addi	a1,a1,-2046 # 8000b4a0 <etext+0x4a0>
    80004ca6:	853e                	mv	a0,a5
    80004ca8:	00002097          	auipc	ra,0x2
    80004cac:	826080e7          	jalr	-2010(ra) # 800064ce <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004cb0:	fec42783          	lw	a5,-20(s0)
    80004cb4:	2785                	addiw	a5,a5,1
    80004cb6:	fef42623          	sw	a5,-20(s0)
    80004cba:	fec42783          	lw	a5,-20(s0)
    80004cbe:	0007871b          	sext.w	a4,a5
    80004cc2:	03100793          	li	a5,49
    80004cc6:	fae7dee3          	bge	a5,a4,80004c82 <iinit+0x2a>
  }
}
    80004cca:	0001                	nop
    80004ccc:	0001                	nop
    80004cce:	60e2                	ld	ra,24(sp)
    80004cd0:	6442                	ld	s0,16(sp)
    80004cd2:	6105                	addi	sp,sp,32
    80004cd4:	8082                	ret

0000000080004cd6 <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004cd6:	7139                	addi	sp,sp,-64
    80004cd8:	fc06                	sd	ra,56(sp)
    80004cda:	f822                	sd	s0,48(sp)
    80004cdc:	0080                	addi	s0,sp,64
    80004cde:	87aa                	mv	a5,a0
    80004ce0:	872e                	mv	a4,a1
    80004ce2:	fcf42623          	sw	a5,-52(s0)
    80004ce6:	87ba                	mv	a5,a4
    80004ce8:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004cec:	4785                	li	a5,1
    80004cee:	fef42623          	sw	a5,-20(s0)
    80004cf2:	a855                	j	80004da6 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004cf4:	fec42783          	lw	a5,-20(s0)
    80004cf8:	8391                	srli	a5,a5,0x4
    80004cfa:	0007871b          	sext.w	a4,a5
    80004cfe:	0001d797          	auipc	a5,0x1d
    80004d02:	36278793          	addi	a5,a5,866 # 80022060 <sb>
    80004d06:	4f9c                	lw	a5,24(a5)
    80004d08:	9fb9                	addw	a5,a5,a4
    80004d0a:	0007871b          	sext.w	a4,a5
    80004d0e:	fcc42783          	lw	a5,-52(s0)
    80004d12:	85ba                	mv	a1,a4
    80004d14:	853e                	mv	a0,a5
    80004d16:	00000097          	auipc	ra,0x0
    80004d1a:	93a080e7          	jalr	-1734(ra) # 80004650 <bread>
    80004d1e:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004d22:	fe043783          	ld	a5,-32(s0)
    80004d26:	05878713          	addi	a4,a5,88
    80004d2a:	fec42783          	lw	a5,-20(s0)
    80004d2e:	8bbd                	andi	a5,a5,15
    80004d30:	079a                	slli	a5,a5,0x6
    80004d32:	97ba                	add	a5,a5,a4
    80004d34:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004d38:	fd843783          	ld	a5,-40(s0)
    80004d3c:	00079783          	lh	a5,0(a5)
    80004d40:	eba1                	bnez	a5,80004d90 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004d42:	04000613          	li	a2,64
    80004d46:	4581                	li	a1,0
    80004d48:	fd843503          	ld	a0,-40(s0)
    80004d4c:	ffffc097          	auipc	ra,0xffffc
    80004d50:	700080e7          	jalr	1792(ra) # 8000144c <memset>
      dip->type = type;
    80004d54:	fd843783          	ld	a5,-40(s0)
    80004d58:	fca45703          	lhu	a4,-54(s0)
    80004d5c:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004d60:	fe043503          	ld	a0,-32(s0)
    80004d64:	00001097          	auipc	ra,0x1
    80004d68:	636080e7          	jalr	1590(ra) # 8000639a <log_write>
      brelse(bp);
    80004d6c:	fe043503          	ld	a0,-32(s0)
    80004d70:	00000097          	auipc	ra,0x0
    80004d74:	982080e7          	jalr	-1662(ra) # 800046f2 <brelse>
      return iget(dev, inum);
    80004d78:	fec42703          	lw	a4,-20(s0)
    80004d7c:	fcc42783          	lw	a5,-52(s0)
    80004d80:	85ba                	mv	a1,a4
    80004d82:	853e                	mv	a0,a5
    80004d84:	00000097          	auipc	ra,0x0
    80004d88:	138080e7          	jalr	312(ra) # 80004ebc <iget>
    80004d8c:	87aa                	mv	a5,a0
    80004d8e:	a835                	j	80004dca <ialloc+0xf4>
    }
    brelse(bp);
    80004d90:	fe043503          	ld	a0,-32(s0)
    80004d94:	00000097          	auipc	ra,0x0
    80004d98:	95e080e7          	jalr	-1698(ra) # 800046f2 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80004d9c:	fec42783          	lw	a5,-20(s0)
    80004da0:	2785                	addiw	a5,a5,1
    80004da2:	fef42623          	sw	a5,-20(s0)
    80004da6:	0001d797          	auipc	a5,0x1d
    80004daa:	2ba78793          	addi	a5,a5,698 # 80022060 <sb>
    80004dae:	47d8                	lw	a4,12(a5)
    80004db0:	fec42783          	lw	a5,-20(s0)
    80004db4:	f4e7e0e3          	bltu	a5,a4,80004cf4 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    80004db8:	00006517          	auipc	a0,0x6
    80004dbc:	6f050513          	addi	a0,a0,1776 # 8000b4a8 <etext+0x4a8>
    80004dc0:	ffffc097          	auipc	ra,0xffffc
    80004dc4:	c74080e7          	jalr	-908(ra) # 80000a34 <printf>
  return 0;
    80004dc8:	4781                	li	a5,0
}
    80004dca:	853e                	mv	a0,a5
    80004dcc:	70e2                	ld	ra,56(sp)
    80004dce:	7442                	ld	s0,48(sp)
    80004dd0:	6121                	addi	sp,sp,64
    80004dd2:	8082                	ret

0000000080004dd4 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80004dd4:	7179                	addi	sp,sp,-48
    80004dd6:	f406                	sd	ra,40(sp)
    80004dd8:	f022                	sd	s0,32(sp)
    80004dda:	1800                	addi	s0,sp,48
    80004ddc:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80004de0:	fd843783          	ld	a5,-40(s0)
    80004de4:	4394                	lw	a3,0(a5)
    80004de6:	fd843783          	ld	a5,-40(s0)
    80004dea:	43dc                	lw	a5,4(a5)
    80004dec:	0047d79b          	srliw	a5,a5,0x4
    80004df0:	0007871b          	sext.w	a4,a5
    80004df4:	0001d797          	auipc	a5,0x1d
    80004df8:	26c78793          	addi	a5,a5,620 # 80022060 <sb>
    80004dfc:	4f9c                	lw	a5,24(a5)
    80004dfe:	9fb9                	addw	a5,a5,a4
    80004e00:	2781                	sext.w	a5,a5
    80004e02:	85be                	mv	a1,a5
    80004e04:	8536                	mv	a0,a3
    80004e06:	00000097          	auipc	ra,0x0
    80004e0a:	84a080e7          	jalr	-1974(ra) # 80004650 <bread>
    80004e0e:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80004e12:	fe843783          	ld	a5,-24(s0)
    80004e16:	05878713          	addi	a4,a5,88
    80004e1a:	fd843783          	ld	a5,-40(s0)
    80004e1e:	43dc                	lw	a5,4(a5)
    80004e20:	1782                	slli	a5,a5,0x20
    80004e22:	9381                	srli	a5,a5,0x20
    80004e24:	8bbd                	andi	a5,a5,15
    80004e26:	079a                	slli	a5,a5,0x6
    80004e28:	97ba                	add	a5,a5,a4
    80004e2a:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80004e2e:	fd843783          	ld	a5,-40(s0)
    80004e32:	04479703          	lh	a4,68(a5)
    80004e36:	fe043783          	ld	a5,-32(s0)
    80004e3a:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80004e3e:	fd843783          	ld	a5,-40(s0)
    80004e42:	04679703          	lh	a4,70(a5)
    80004e46:	fe043783          	ld	a5,-32(s0)
    80004e4a:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80004e4e:	fd843783          	ld	a5,-40(s0)
    80004e52:	04879703          	lh	a4,72(a5)
    80004e56:	fe043783          	ld	a5,-32(s0)
    80004e5a:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80004e5e:	fd843783          	ld	a5,-40(s0)
    80004e62:	04a79703          	lh	a4,74(a5)
    80004e66:	fe043783          	ld	a5,-32(s0)
    80004e6a:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80004e6e:	fd843783          	ld	a5,-40(s0)
    80004e72:	47f8                	lw	a4,76(a5)
    80004e74:	fe043783          	ld	a5,-32(s0)
    80004e78:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80004e7a:	fe043783          	ld	a5,-32(s0)
    80004e7e:	00c78713          	addi	a4,a5,12
    80004e82:	fd843783          	ld	a5,-40(s0)
    80004e86:	05078793          	addi	a5,a5,80
    80004e8a:	03400613          	li	a2,52
    80004e8e:	85be                	mv	a1,a5
    80004e90:	853a                	mv	a0,a4
    80004e92:	ffffc097          	auipc	ra,0xffffc
    80004e96:	69e080e7          	jalr	1694(ra) # 80001530 <memmove>
  log_write(bp);
    80004e9a:	fe843503          	ld	a0,-24(s0)
    80004e9e:	00001097          	auipc	ra,0x1
    80004ea2:	4fc080e7          	jalr	1276(ra) # 8000639a <log_write>
  brelse(bp);
    80004ea6:	fe843503          	ld	a0,-24(s0)
    80004eaa:	00000097          	auipc	ra,0x0
    80004eae:	848080e7          	jalr	-1976(ra) # 800046f2 <brelse>
}
    80004eb2:	0001                	nop
    80004eb4:	70a2                	ld	ra,40(sp)
    80004eb6:	7402                	ld	s0,32(sp)
    80004eb8:	6145                	addi	sp,sp,48
    80004eba:	8082                	ret

0000000080004ebc <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80004ebc:	7179                	addi	sp,sp,-48
    80004ebe:	f406                	sd	ra,40(sp)
    80004ec0:	f022                	sd	s0,32(sp)
    80004ec2:	1800                	addi	s0,sp,48
    80004ec4:	87aa                	mv	a5,a0
    80004ec6:	872e                	mv	a4,a1
    80004ec8:	fcf42e23          	sw	a5,-36(s0)
    80004ecc:	87ba                	mv	a5,a4
    80004ece:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80004ed2:	0001d517          	auipc	a0,0x1d
    80004ed6:	1ae50513          	addi	a0,a0,430 # 80022080 <itable>
    80004eda:	ffffc097          	auipc	ra,0xffffc
    80004ede:	39e080e7          	jalr	926(ra) # 80001278 <acquire>

  // Is the inode already in the table?
  empty = 0;
    80004ee2:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80004ee6:	0001d797          	auipc	a5,0x1d
    80004eea:	1b278793          	addi	a5,a5,434 # 80022098 <itable+0x18>
    80004eee:	fef43423          	sd	a5,-24(s0)
    80004ef2:	a89d                	j	80004f68 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80004ef4:	fe843783          	ld	a5,-24(s0)
    80004ef8:	479c                	lw	a5,8(a5)
    80004efa:	04f05663          	blez	a5,80004f46 <iget+0x8a>
    80004efe:	fe843783          	ld	a5,-24(s0)
    80004f02:	4398                	lw	a4,0(a5)
    80004f04:	fdc42783          	lw	a5,-36(s0)
    80004f08:	2781                	sext.w	a5,a5
    80004f0a:	02e79e63          	bne	a5,a4,80004f46 <iget+0x8a>
    80004f0e:	fe843783          	ld	a5,-24(s0)
    80004f12:	43d8                	lw	a4,4(a5)
    80004f14:	fd842783          	lw	a5,-40(s0)
    80004f18:	2781                	sext.w	a5,a5
    80004f1a:	02e79663          	bne	a5,a4,80004f46 <iget+0x8a>
      ip->ref++;
    80004f1e:	fe843783          	ld	a5,-24(s0)
    80004f22:	479c                	lw	a5,8(a5)
    80004f24:	2785                	addiw	a5,a5,1
    80004f26:	0007871b          	sext.w	a4,a5
    80004f2a:	fe843783          	ld	a5,-24(s0)
    80004f2e:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80004f30:	0001d517          	auipc	a0,0x1d
    80004f34:	15050513          	addi	a0,a0,336 # 80022080 <itable>
    80004f38:	ffffc097          	auipc	ra,0xffffc
    80004f3c:	3a4080e7          	jalr	932(ra) # 800012dc <release>
      return ip;
    80004f40:	fe843783          	ld	a5,-24(s0)
    80004f44:	a069                	j	80004fce <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80004f46:	fe043783          	ld	a5,-32(s0)
    80004f4a:	eb89                	bnez	a5,80004f5c <iget+0xa0>
    80004f4c:	fe843783          	ld	a5,-24(s0)
    80004f50:	479c                	lw	a5,8(a5)
    80004f52:	e789                	bnez	a5,80004f5c <iget+0xa0>
      empty = ip;
    80004f54:	fe843783          	ld	a5,-24(s0)
    80004f58:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80004f5c:	fe843783          	ld	a5,-24(s0)
    80004f60:	08878793          	addi	a5,a5,136
    80004f64:	fef43423          	sd	a5,-24(s0)
    80004f68:	fe843703          	ld	a4,-24(s0)
    80004f6c:	0001f797          	auipc	a5,0x1f
    80004f70:	bbc78793          	addi	a5,a5,-1092 # 80023b28 <log>
    80004f74:	f8f760e3          	bltu	a4,a5,80004ef4 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80004f78:	fe043783          	ld	a5,-32(s0)
    80004f7c:	eb89                	bnez	a5,80004f8e <iget+0xd2>
    panic("iget: no inodes");
    80004f7e:	00006517          	auipc	a0,0x6
    80004f82:	54250513          	addi	a0,a0,1346 # 8000b4c0 <etext+0x4c0>
    80004f86:	ffffc097          	auipc	ra,0xffffc
    80004f8a:	d04080e7          	jalr	-764(ra) # 80000c8a <panic>

  ip = empty;
    80004f8e:	fe043783          	ld	a5,-32(s0)
    80004f92:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80004f96:	fe843783          	ld	a5,-24(s0)
    80004f9a:	fdc42703          	lw	a4,-36(s0)
    80004f9e:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80004fa0:	fe843783          	ld	a5,-24(s0)
    80004fa4:	fd842703          	lw	a4,-40(s0)
    80004fa8:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80004faa:	fe843783          	ld	a5,-24(s0)
    80004fae:	4705                	li	a4,1
    80004fb0:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80004fb2:	fe843783          	ld	a5,-24(s0)
    80004fb6:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80004fba:	0001d517          	auipc	a0,0x1d
    80004fbe:	0c650513          	addi	a0,a0,198 # 80022080 <itable>
    80004fc2:	ffffc097          	auipc	ra,0xffffc
    80004fc6:	31a080e7          	jalr	794(ra) # 800012dc <release>

  return ip;
    80004fca:	fe843783          	ld	a5,-24(s0)
}
    80004fce:	853e                	mv	a0,a5
    80004fd0:	70a2                	ld	ra,40(sp)
    80004fd2:	7402                	ld	s0,32(sp)
    80004fd4:	6145                	addi	sp,sp,48
    80004fd6:	8082                	ret

0000000080004fd8 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80004fd8:	1101                	addi	sp,sp,-32
    80004fda:	ec06                	sd	ra,24(sp)
    80004fdc:	e822                	sd	s0,16(sp)
    80004fde:	1000                	addi	s0,sp,32
    80004fe0:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80004fe4:	0001d517          	auipc	a0,0x1d
    80004fe8:	09c50513          	addi	a0,a0,156 # 80022080 <itable>
    80004fec:	ffffc097          	auipc	ra,0xffffc
    80004ff0:	28c080e7          	jalr	652(ra) # 80001278 <acquire>
  ip->ref++;
    80004ff4:	fe843783          	ld	a5,-24(s0)
    80004ff8:	479c                	lw	a5,8(a5)
    80004ffa:	2785                	addiw	a5,a5,1
    80004ffc:	0007871b          	sext.w	a4,a5
    80005000:	fe843783          	ld	a5,-24(s0)
    80005004:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005006:	0001d517          	auipc	a0,0x1d
    8000500a:	07a50513          	addi	a0,a0,122 # 80022080 <itable>
    8000500e:	ffffc097          	auipc	ra,0xffffc
    80005012:	2ce080e7          	jalr	718(ra) # 800012dc <release>
  return ip;
    80005016:	fe843783          	ld	a5,-24(s0)
}
    8000501a:	853e                	mv	a0,a5
    8000501c:	60e2                	ld	ra,24(sp)
    8000501e:	6442                	ld	s0,16(sp)
    80005020:	6105                	addi	sp,sp,32
    80005022:	8082                	ret

0000000080005024 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005024:	7179                	addi	sp,sp,-48
    80005026:	f406                	sd	ra,40(sp)
    80005028:	f022                	sd	s0,32(sp)
    8000502a:	1800                	addi	s0,sp,48
    8000502c:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005030:	fd843783          	ld	a5,-40(s0)
    80005034:	c791                	beqz	a5,80005040 <ilock+0x1c>
    80005036:	fd843783          	ld	a5,-40(s0)
    8000503a:	479c                	lw	a5,8(a5)
    8000503c:	00f04a63          	bgtz	a5,80005050 <ilock+0x2c>
    panic("ilock");
    80005040:	00006517          	auipc	a0,0x6
    80005044:	49050513          	addi	a0,a0,1168 # 8000b4d0 <etext+0x4d0>
    80005048:	ffffc097          	auipc	ra,0xffffc
    8000504c:	c42080e7          	jalr	-958(ra) # 80000c8a <panic>

  acquiresleep(&ip->lock);
    80005050:	fd843783          	ld	a5,-40(s0)
    80005054:	07c1                	addi	a5,a5,16
    80005056:	853e                	mv	a0,a5
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	4c2080e7          	jalr	1218(ra) # 8000651a <acquiresleep>

  if(ip->valid == 0){
    80005060:	fd843783          	ld	a5,-40(s0)
    80005064:	43bc                	lw	a5,64(a5)
    80005066:	e7e5                	bnez	a5,8000514e <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005068:	fd843783          	ld	a5,-40(s0)
    8000506c:	4394                	lw	a3,0(a5)
    8000506e:	fd843783          	ld	a5,-40(s0)
    80005072:	43dc                	lw	a5,4(a5)
    80005074:	0047d79b          	srliw	a5,a5,0x4
    80005078:	0007871b          	sext.w	a4,a5
    8000507c:	0001d797          	auipc	a5,0x1d
    80005080:	fe478793          	addi	a5,a5,-28 # 80022060 <sb>
    80005084:	4f9c                	lw	a5,24(a5)
    80005086:	9fb9                	addw	a5,a5,a4
    80005088:	2781                	sext.w	a5,a5
    8000508a:	85be                	mv	a1,a5
    8000508c:	8536                	mv	a0,a3
    8000508e:	fffff097          	auipc	ra,0xfffff
    80005092:	5c2080e7          	jalr	1474(ra) # 80004650 <bread>
    80005096:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000509a:	fe843783          	ld	a5,-24(s0)
    8000509e:	05878713          	addi	a4,a5,88
    800050a2:	fd843783          	ld	a5,-40(s0)
    800050a6:	43dc                	lw	a5,4(a5)
    800050a8:	1782                	slli	a5,a5,0x20
    800050aa:	9381                	srli	a5,a5,0x20
    800050ac:	8bbd                	andi	a5,a5,15
    800050ae:	079a                	slli	a5,a5,0x6
    800050b0:	97ba                	add	a5,a5,a4
    800050b2:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800050b6:	fe043783          	ld	a5,-32(s0)
    800050ba:	00079703          	lh	a4,0(a5)
    800050be:	fd843783          	ld	a5,-40(s0)
    800050c2:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800050c6:	fe043783          	ld	a5,-32(s0)
    800050ca:	00279703          	lh	a4,2(a5)
    800050ce:	fd843783          	ld	a5,-40(s0)
    800050d2:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800050d6:	fe043783          	ld	a5,-32(s0)
    800050da:	00479703          	lh	a4,4(a5)
    800050de:	fd843783          	ld	a5,-40(s0)
    800050e2:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800050e6:	fe043783          	ld	a5,-32(s0)
    800050ea:	00679703          	lh	a4,6(a5)
    800050ee:	fd843783          	ld	a5,-40(s0)
    800050f2:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800050f6:	fe043783          	ld	a5,-32(s0)
    800050fa:	4798                	lw	a4,8(a5)
    800050fc:	fd843783          	ld	a5,-40(s0)
    80005100:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005102:	fd843783          	ld	a5,-40(s0)
    80005106:	05078713          	addi	a4,a5,80
    8000510a:	fe043783          	ld	a5,-32(s0)
    8000510e:	07b1                	addi	a5,a5,12
    80005110:	03400613          	li	a2,52
    80005114:	85be                	mv	a1,a5
    80005116:	853a                	mv	a0,a4
    80005118:	ffffc097          	auipc	ra,0xffffc
    8000511c:	418080e7          	jalr	1048(ra) # 80001530 <memmove>
    brelse(bp);
    80005120:	fe843503          	ld	a0,-24(s0)
    80005124:	fffff097          	auipc	ra,0xfffff
    80005128:	5ce080e7          	jalr	1486(ra) # 800046f2 <brelse>
    ip->valid = 1;
    8000512c:	fd843783          	ld	a5,-40(s0)
    80005130:	4705                	li	a4,1
    80005132:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005134:	fd843783          	ld	a5,-40(s0)
    80005138:	04479783          	lh	a5,68(a5)
    8000513c:	eb89                	bnez	a5,8000514e <ilock+0x12a>
      panic("ilock: no type");
    8000513e:	00006517          	auipc	a0,0x6
    80005142:	39a50513          	addi	a0,a0,922 # 8000b4d8 <etext+0x4d8>
    80005146:	ffffc097          	auipc	ra,0xffffc
    8000514a:	b44080e7          	jalr	-1212(ra) # 80000c8a <panic>
  }
}
    8000514e:	0001                	nop
    80005150:	70a2                	ld	ra,40(sp)
    80005152:	7402                	ld	s0,32(sp)
    80005154:	6145                	addi	sp,sp,48
    80005156:	8082                	ret

0000000080005158 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005158:	1101                	addi	sp,sp,-32
    8000515a:	ec06                	sd	ra,24(sp)
    8000515c:	e822                	sd	s0,16(sp)
    8000515e:	1000                	addi	s0,sp,32
    80005160:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005164:	fe843783          	ld	a5,-24(s0)
    80005168:	c385                	beqz	a5,80005188 <iunlock+0x30>
    8000516a:	fe843783          	ld	a5,-24(s0)
    8000516e:	07c1                	addi	a5,a5,16
    80005170:	853e                	mv	a0,a5
    80005172:	00001097          	auipc	ra,0x1
    80005176:	468080e7          	jalr	1128(ra) # 800065da <holdingsleep>
    8000517a:	87aa                	mv	a5,a0
    8000517c:	c791                	beqz	a5,80005188 <iunlock+0x30>
    8000517e:	fe843783          	ld	a5,-24(s0)
    80005182:	479c                	lw	a5,8(a5)
    80005184:	00f04a63          	bgtz	a5,80005198 <iunlock+0x40>
    panic("iunlock");
    80005188:	00006517          	auipc	a0,0x6
    8000518c:	36050513          	addi	a0,a0,864 # 8000b4e8 <etext+0x4e8>
    80005190:	ffffc097          	auipc	ra,0xffffc
    80005194:	afa080e7          	jalr	-1286(ra) # 80000c8a <panic>

  releasesleep(&ip->lock);
    80005198:	fe843783          	ld	a5,-24(s0)
    8000519c:	07c1                	addi	a5,a5,16
    8000519e:	853e                	mv	a0,a5
    800051a0:	00001097          	auipc	ra,0x1
    800051a4:	3e8080e7          	jalr	1000(ra) # 80006588 <releasesleep>
}
    800051a8:	0001                	nop
    800051aa:	60e2                	ld	ra,24(sp)
    800051ac:	6442                	ld	s0,16(sp)
    800051ae:	6105                	addi	sp,sp,32
    800051b0:	8082                	ret

00000000800051b2 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800051b2:	1101                	addi	sp,sp,-32
    800051b4:	ec06                	sd	ra,24(sp)
    800051b6:	e822                	sd	s0,16(sp)
    800051b8:	1000                	addi	s0,sp,32
    800051ba:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800051be:	0001d517          	auipc	a0,0x1d
    800051c2:	ec250513          	addi	a0,a0,-318 # 80022080 <itable>
    800051c6:	ffffc097          	auipc	ra,0xffffc
    800051ca:	0b2080e7          	jalr	178(ra) # 80001278 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800051ce:	fe843783          	ld	a5,-24(s0)
    800051d2:	479c                	lw	a5,8(a5)
    800051d4:	873e                	mv	a4,a5
    800051d6:	4785                	li	a5,1
    800051d8:	06f71f63          	bne	a4,a5,80005256 <iput+0xa4>
    800051dc:	fe843783          	ld	a5,-24(s0)
    800051e0:	43bc                	lw	a5,64(a5)
    800051e2:	cbb5                	beqz	a5,80005256 <iput+0xa4>
    800051e4:	fe843783          	ld	a5,-24(s0)
    800051e8:	04a79783          	lh	a5,74(a5)
    800051ec:	e7ad                	bnez	a5,80005256 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800051ee:	fe843783          	ld	a5,-24(s0)
    800051f2:	07c1                	addi	a5,a5,16
    800051f4:	853e                	mv	a0,a5
    800051f6:	00001097          	auipc	ra,0x1
    800051fa:	324080e7          	jalr	804(ra) # 8000651a <acquiresleep>

    release(&itable.lock);
    800051fe:	0001d517          	auipc	a0,0x1d
    80005202:	e8250513          	addi	a0,a0,-382 # 80022080 <itable>
    80005206:	ffffc097          	auipc	ra,0xffffc
    8000520a:	0d6080e7          	jalr	214(ra) # 800012dc <release>

    itrunc(ip);
    8000520e:	fe843503          	ld	a0,-24(s0)
    80005212:	00000097          	auipc	ra,0x0
    80005216:	21a080e7          	jalr	538(ra) # 8000542c <itrunc>
    ip->type = 0;
    8000521a:	fe843783          	ld	a5,-24(s0)
    8000521e:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005222:	fe843503          	ld	a0,-24(s0)
    80005226:	00000097          	auipc	ra,0x0
    8000522a:	bae080e7          	jalr	-1106(ra) # 80004dd4 <iupdate>
    ip->valid = 0;
    8000522e:	fe843783          	ld	a5,-24(s0)
    80005232:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005236:	fe843783          	ld	a5,-24(s0)
    8000523a:	07c1                	addi	a5,a5,16
    8000523c:	853e                	mv	a0,a5
    8000523e:	00001097          	auipc	ra,0x1
    80005242:	34a080e7          	jalr	842(ra) # 80006588 <releasesleep>

    acquire(&itable.lock);
    80005246:	0001d517          	auipc	a0,0x1d
    8000524a:	e3a50513          	addi	a0,a0,-454 # 80022080 <itable>
    8000524e:	ffffc097          	auipc	ra,0xffffc
    80005252:	02a080e7          	jalr	42(ra) # 80001278 <acquire>
  }

  ip->ref--;
    80005256:	fe843783          	ld	a5,-24(s0)
    8000525a:	479c                	lw	a5,8(a5)
    8000525c:	37fd                	addiw	a5,a5,-1
    8000525e:	0007871b          	sext.w	a4,a5
    80005262:	fe843783          	ld	a5,-24(s0)
    80005266:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005268:	0001d517          	auipc	a0,0x1d
    8000526c:	e1850513          	addi	a0,a0,-488 # 80022080 <itable>
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	06c080e7          	jalr	108(ra) # 800012dc <release>
}
    80005278:	0001                	nop
    8000527a:	60e2                	ld	ra,24(sp)
    8000527c:	6442                	ld	s0,16(sp)
    8000527e:	6105                	addi	sp,sp,32
    80005280:	8082                	ret

0000000080005282 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005282:	1101                	addi	sp,sp,-32
    80005284:	ec06                	sd	ra,24(sp)
    80005286:	e822                	sd	s0,16(sp)
    80005288:	1000                	addi	s0,sp,32
    8000528a:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000528e:	fe843503          	ld	a0,-24(s0)
    80005292:	00000097          	auipc	ra,0x0
    80005296:	ec6080e7          	jalr	-314(ra) # 80005158 <iunlock>
  iput(ip);
    8000529a:	fe843503          	ld	a0,-24(s0)
    8000529e:	00000097          	auipc	ra,0x0
    800052a2:	f14080e7          	jalr	-236(ra) # 800051b2 <iput>
}
    800052a6:	0001                	nop
    800052a8:	60e2                	ld	ra,24(sp)
    800052aa:	6442                	ld	s0,16(sp)
    800052ac:	6105                	addi	sp,sp,32
    800052ae:	8082                	ret

00000000800052b0 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800052b0:	7139                	addi	sp,sp,-64
    800052b2:	fc06                	sd	ra,56(sp)
    800052b4:	f822                	sd	s0,48(sp)
    800052b6:	0080                	addi	s0,sp,64
    800052b8:	fca43423          	sd	a0,-56(s0)
    800052bc:	87ae                	mv	a5,a1
    800052be:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800052c2:	fc442783          	lw	a5,-60(s0)
    800052c6:	0007871b          	sext.w	a4,a5
    800052ca:	47ad                	li	a5,11
    800052cc:	04e7ee63          	bltu	a5,a4,80005328 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800052d0:	fc843703          	ld	a4,-56(s0)
    800052d4:	fc446783          	lwu	a5,-60(s0)
    800052d8:	07d1                	addi	a5,a5,20
    800052da:	078a                	slli	a5,a5,0x2
    800052dc:	97ba                	add	a5,a5,a4
    800052de:	439c                	lw	a5,0(a5)
    800052e0:	fef42623          	sw	a5,-20(s0)
    800052e4:	fec42783          	lw	a5,-20(s0)
    800052e8:	2781                	sext.w	a5,a5
    800052ea:	ef85                	bnez	a5,80005322 <bmap+0x72>
      addr = balloc(ip->dev);
    800052ec:	fc843783          	ld	a5,-56(s0)
    800052f0:	439c                	lw	a5,0(a5)
    800052f2:	853e                	mv	a0,a5
    800052f4:	fffff097          	auipc	ra,0xfffff
    800052f8:	6a6080e7          	jalr	1702(ra) # 8000499a <balloc>
    800052fc:	87aa                	mv	a5,a0
    800052fe:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005302:	fec42783          	lw	a5,-20(s0)
    80005306:	2781                	sext.w	a5,a5
    80005308:	e399                	bnez	a5,8000530e <bmap+0x5e>
        return 0;
    8000530a:	4781                	li	a5,0
    8000530c:	aa19                	j	80005422 <bmap+0x172>
      ip->addrs[bn] = addr;
    8000530e:	fc843703          	ld	a4,-56(s0)
    80005312:	fc446783          	lwu	a5,-60(s0)
    80005316:	07d1                	addi	a5,a5,20
    80005318:	078a                	slli	a5,a5,0x2
    8000531a:	97ba                	add	a5,a5,a4
    8000531c:	fec42703          	lw	a4,-20(s0)
    80005320:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005322:	fec42783          	lw	a5,-20(s0)
    80005326:	a8f5                	j	80005422 <bmap+0x172>
  }
  bn -= NDIRECT;
    80005328:	fc442783          	lw	a5,-60(s0)
    8000532c:	37d1                	addiw	a5,a5,-12
    8000532e:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005332:	fc442783          	lw	a5,-60(s0)
    80005336:	0007871b          	sext.w	a4,a5
    8000533a:	0ff00793          	li	a5,255
    8000533e:	0ce7ea63          	bltu	a5,a4,80005412 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005342:	fc843783          	ld	a5,-56(s0)
    80005346:	0807a783          	lw	a5,128(a5)
    8000534a:	fef42623          	sw	a5,-20(s0)
    8000534e:	fec42783          	lw	a5,-20(s0)
    80005352:	2781                	sext.w	a5,a5
    80005354:	eb85                	bnez	a5,80005384 <bmap+0xd4>
      addr = balloc(ip->dev);
    80005356:	fc843783          	ld	a5,-56(s0)
    8000535a:	439c                	lw	a5,0(a5)
    8000535c:	853e                	mv	a0,a5
    8000535e:	fffff097          	auipc	ra,0xfffff
    80005362:	63c080e7          	jalr	1596(ra) # 8000499a <balloc>
    80005366:	87aa                	mv	a5,a0
    80005368:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    8000536c:	fec42783          	lw	a5,-20(s0)
    80005370:	2781                	sext.w	a5,a5
    80005372:	e399                	bnez	a5,80005378 <bmap+0xc8>
        return 0;
    80005374:	4781                	li	a5,0
    80005376:	a075                	j	80005422 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005378:	fc843783          	ld	a5,-56(s0)
    8000537c:	fec42703          	lw	a4,-20(s0)
    80005380:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005384:	fc843783          	ld	a5,-56(s0)
    80005388:	439c                	lw	a5,0(a5)
    8000538a:	fec42703          	lw	a4,-20(s0)
    8000538e:	85ba                	mv	a1,a4
    80005390:	853e                	mv	a0,a5
    80005392:	fffff097          	auipc	ra,0xfffff
    80005396:	2be080e7          	jalr	702(ra) # 80004650 <bread>
    8000539a:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000539e:	fe043783          	ld	a5,-32(s0)
    800053a2:	05878793          	addi	a5,a5,88
    800053a6:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    800053aa:	fc446783          	lwu	a5,-60(s0)
    800053ae:	078a                	slli	a5,a5,0x2
    800053b0:	fd843703          	ld	a4,-40(s0)
    800053b4:	97ba                	add	a5,a5,a4
    800053b6:	439c                	lw	a5,0(a5)
    800053b8:	fef42623          	sw	a5,-20(s0)
    800053bc:	fec42783          	lw	a5,-20(s0)
    800053c0:	2781                	sext.w	a5,a5
    800053c2:	ef9d                	bnez	a5,80005400 <bmap+0x150>
      addr = balloc(ip->dev);
    800053c4:	fc843783          	ld	a5,-56(s0)
    800053c8:	439c                	lw	a5,0(a5)
    800053ca:	853e                	mv	a0,a5
    800053cc:	fffff097          	auipc	ra,0xfffff
    800053d0:	5ce080e7          	jalr	1486(ra) # 8000499a <balloc>
    800053d4:	87aa                	mv	a5,a0
    800053d6:	fef42623          	sw	a5,-20(s0)
      if(addr){
    800053da:	fec42783          	lw	a5,-20(s0)
    800053de:	2781                	sext.w	a5,a5
    800053e0:	c385                	beqz	a5,80005400 <bmap+0x150>
        a[bn] = addr;
    800053e2:	fc446783          	lwu	a5,-60(s0)
    800053e6:	078a                	slli	a5,a5,0x2
    800053e8:	fd843703          	ld	a4,-40(s0)
    800053ec:	97ba                	add	a5,a5,a4
    800053ee:	fec42703          	lw	a4,-20(s0)
    800053f2:	c398                	sw	a4,0(a5)
        log_write(bp);
    800053f4:	fe043503          	ld	a0,-32(s0)
    800053f8:	00001097          	auipc	ra,0x1
    800053fc:	fa2080e7          	jalr	-94(ra) # 8000639a <log_write>
      }
    }
    brelse(bp);
    80005400:	fe043503          	ld	a0,-32(s0)
    80005404:	fffff097          	auipc	ra,0xfffff
    80005408:	2ee080e7          	jalr	750(ra) # 800046f2 <brelse>
    return addr;
    8000540c:	fec42783          	lw	a5,-20(s0)
    80005410:	a809                	j	80005422 <bmap+0x172>
  }

  panic("bmap: out of range");
    80005412:	00006517          	auipc	a0,0x6
    80005416:	0de50513          	addi	a0,a0,222 # 8000b4f0 <etext+0x4f0>
    8000541a:	ffffc097          	auipc	ra,0xffffc
    8000541e:	870080e7          	jalr	-1936(ra) # 80000c8a <panic>
}
    80005422:	853e                	mv	a0,a5
    80005424:	70e2                	ld	ra,56(sp)
    80005426:	7442                	ld	s0,48(sp)
    80005428:	6121                	addi	sp,sp,64
    8000542a:	8082                	ret

000000008000542c <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    8000542c:	7139                	addi	sp,sp,-64
    8000542e:	fc06                	sd	ra,56(sp)
    80005430:	f822                	sd	s0,48(sp)
    80005432:	0080                	addi	s0,sp,64
    80005434:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005438:	fe042623          	sw	zero,-20(s0)
    8000543c:	a899                	j	80005492 <itrunc+0x66>
    if(ip->addrs[i]){
    8000543e:	fc843703          	ld	a4,-56(s0)
    80005442:	fec42783          	lw	a5,-20(s0)
    80005446:	07d1                	addi	a5,a5,20
    80005448:	078a                	slli	a5,a5,0x2
    8000544a:	97ba                	add	a5,a5,a4
    8000544c:	439c                	lw	a5,0(a5)
    8000544e:	cf8d                	beqz	a5,80005488 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005450:	fc843783          	ld	a5,-56(s0)
    80005454:	439c                	lw	a5,0(a5)
    80005456:	0007869b          	sext.w	a3,a5
    8000545a:	fc843703          	ld	a4,-56(s0)
    8000545e:	fec42783          	lw	a5,-20(s0)
    80005462:	07d1                	addi	a5,a5,20
    80005464:	078a                	slli	a5,a5,0x2
    80005466:	97ba                	add	a5,a5,a4
    80005468:	439c                	lw	a5,0(a5)
    8000546a:	85be                	mv	a1,a5
    8000546c:	8536                	mv	a0,a3
    8000546e:	fffff097          	auipc	ra,0xfffff
    80005472:	6d4080e7          	jalr	1748(ra) # 80004b42 <bfree>
      ip->addrs[i] = 0;
    80005476:	fc843703          	ld	a4,-56(s0)
    8000547a:	fec42783          	lw	a5,-20(s0)
    8000547e:	07d1                	addi	a5,a5,20
    80005480:	078a                	slli	a5,a5,0x2
    80005482:	97ba                	add	a5,a5,a4
    80005484:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005488:	fec42783          	lw	a5,-20(s0)
    8000548c:	2785                	addiw	a5,a5,1
    8000548e:	fef42623          	sw	a5,-20(s0)
    80005492:	fec42783          	lw	a5,-20(s0)
    80005496:	0007871b          	sext.w	a4,a5
    8000549a:	47ad                	li	a5,11
    8000549c:	fae7d1e3          	bge	a5,a4,8000543e <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800054a0:	fc843783          	ld	a5,-56(s0)
    800054a4:	0807a783          	lw	a5,128(a5)
    800054a8:	cbc5                	beqz	a5,80005558 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800054aa:	fc843783          	ld	a5,-56(s0)
    800054ae:	4398                	lw	a4,0(a5)
    800054b0:	fc843783          	ld	a5,-56(s0)
    800054b4:	0807a783          	lw	a5,128(a5)
    800054b8:	85be                	mv	a1,a5
    800054ba:	853a                	mv	a0,a4
    800054bc:	fffff097          	auipc	ra,0xfffff
    800054c0:	194080e7          	jalr	404(ra) # 80004650 <bread>
    800054c4:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800054c8:	fe043783          	ld	a5,-32(s0)
    800054cc:	05878793          	addi	a5,a5,88
    800054d0:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800054d4:	fe042423          	sw	zero,-24(s0)
    800054d8:	a081                	j	80005518 <itrunc+0xec>
      if(a[j])
    800054da:	fe842783          	lw	a5,-24(s0)
    800054de:	078a                	slli	a5,a5,0x2
    800054e0:	fd843703          	ld	a4,-40(s0)
    800054e4:	97ba                	add	a5,a5,a4
    800054e6:	439c                	lw	a5,0(a5)
    800054e8:	c39d                	beqz	a5,8000550e <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800054ea:	fc843783          	ld	a5,-56(s0)
    800054ee:	439c                	lw	a5,0(a5)
    800054f0:	0007869b          	sext.w	a3,a5
    800054f4:	fe842783          	lw	a5,-24(s0)
    800054f8:	078a                	slli	a5,a5,0x2
    800054fa:	fd843703          	ld	a4,-40(s0)
    800054fe:	97ba                	add	a5,a5,a4
    80005500:	439c                	lw	a5,0(a5)
    80005502:	85be                	mv	a1,a5
    80005504:	8536                	mv	a0,a3
    80005506:	fffff097          	auipc	ra,0xfffff
    8000550a:	63c080e7          	jalr	1596(ra) # 80004b42 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    8000550e:	fe842783          	lw	a5,-24(s0)
    80005512:	2785                	addiw	a5,a5,1
    80005514:	fef42423          	sw	a5,-24(s0)
    80005518:	fe842783          	lw	a5,-24(s0)
    8000551c:	873e                	mv	a4,a5
    8000551e:	0ff00793          	li	a5,255
    80005522:	fae7fce3          	bgeu	a5,a4,800054da <itrunc+0xae>
    }
    brelse(bp);
    80005526:	fe043503          	ld	a0,-32(s0)
    8000552a:	fffff097          	auipc	ra,0xfffff
    8000552e:	1c8080e7          	jalr	456(ra) # 800046f2 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005532:	fc843783          	ld	a5,-56(s0)
    80005536:	439c                	lw	a5,0(a5)
    80005538:	0007871b          	sext.w	a4,a5
    8000553c:	fc843783          	ld	a5,-56(s0)
    80005540:	0807a783          	lw	a5,128(a5)
    80005544:	85be                	mv	a1,a5
    80005546:	853a                	mv	a0,a4
    80005548:	fffff097          	auipc	ra,0xfffff
    8000554c:	5fa080e7          	jalr	1530(ra) # 80004b42 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005550:	fc843783          	ld	a5,-56(s0)
    80005554:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005558:	fc843783          	ld	a5,-56(s0)
    8000555c:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005560:	fc843503          	ld	a0,-56(s0)
    80005564:	00000097          	auipc	ra,0x0
    80005568:	870080e7          	jalr	-1936(ra) # 80004dd4 <iupdate>
}
    8000556c:	0001                	nop
    8000556e:	70e2                	ld	ra,56(sp)
    80005570:	7442                	ld	s0,48(sp)
    80005572:	6121                	addi	sp,sp,64
    80005574:	8082                	ret

0000000080005576 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005576:	1101                	addi	sp,sp,-32
    80005578:	ec22                	sd	s0,24(sp)
    8000557a:	1000                	addi	s0,sp,32
    8000557c:	fea43423          	sd	a0,-24(s0)
    80005580:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005584:	fe843783          	ld	a5,-24(s0)
    80005588:	439c                	lw	a5,0(a5)
    8000558a:	0007871b          	sext.w	a4,a5
    8000558e:	fe043783          	ld	a5,-32(s0)
    80005592:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005594:	fe843783          	ld	a5,-24(s0)
    80005598:	43d8                	lw	a4,4(a5)
    8000559a:	fe043783          	ld	a5,-32(s0)
    8000559e:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800055a0:	fe843783          	ld	a5,-24(s0)
    800055a4:	04479703          	lh	a4,68(a5)
    800055a8:	fe043783          	ld	a5,-32(s0)
    800055ac:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    800055b0:	fe843783          	ld	a5,-24(s0)
    800055b4:	04a79703          	lh	a4,74(a5)
    800055b8:	fe043783          	ld	a5,-32(s0)
    800055bc:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    800055c0:	fe843783          	ld	a5,-24(s0)
    800055c4:	47fc                	lw	a5,76(a5)
    800055c6:	02079713          	slli	a4,a5,0x20
    800055ca:	9301                	srli	a4,a4,0x20
    800055cc:	fe043783          	ld	a5,-32(s0)
    800055d0:	eb98                	sd	a4,16(a5)
}
    800055d2:	0001                	nop
    800055d4:	6462                	ld	s0,24(sp)
    800055d6:	6105                	addi	sp,sp,32
    800055d8:	8082                	ret

00000000800055da <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800055da:	715d                	addi	sp,sp,-80
    800055dc:	e486                	sd	ra,72(sp)
    800055de:	e0a2                	sd	s0,64(sp)
    800055e0:	0880                	addi	s0,sp,80
    800055e2:	fca43423          	sd	a0,-56(s0)
    800055e6:	87ae                	mv	a5,a1
    800055e8:	fac43c23          	sd	a2,-72(s0)
    800055ec:	fcf42223          	sw	a5,-60(s0)
    800055f0:	87b6                	mv	a5,a3
    800055f2:	fcf42023          	sw	a5,-64(s0)
    800055f6:	87ba                	mv	a5,a4
    800055f8:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800055fc:	fc843783          	ld	a5,-56(s0)
    80005600:	47f8                	lw	a4,76(a5)
    80005602:	fc042783          	lw	a5,-64(s0)
    80005606:	2781                	sext.w	a5,a5
    80005608:	00f76f63          	bltu	a4,a5,80005626 <readi+0x4c>
    8000560c:	fc042783          	lw	a5,-64(s0)
    80005610:	873e                	mv	a4,a5
    80005612:	fb442783          	lw	a5,-76(s0)
    80005616:	9fb9                	addw	a5,a5,a4
    80005618:	0007871b          	sext.w	a4,a5
    8000561c:	fc042783          	lw	a5,-64(s0)
    80005620:	2781                	sext.w	a5,a5
    80005622:	00f77463          	bgeu	a4,a5,8000562a <readi+0x50>
    return 0;
    80005626:	4781                	li	a5,0
    80005628:	a299                	j	8000576e <readi+0x194>
  if(off + n > ip->size)
    8000562a:	fc042783          	lw	a5,-64(s0)
    8000562e:	873e                	mv	a4,a5
    80005630:	fb442783          	lw	a5,-76(s0)
    80005634:	9fb9                	addw	a5,a5,a4
    80005636:	0007871b          	sext.w	a4,a5
    8000563a:	fc843783          	ld	a5,-56(s0)
    8000563e:	47fc                	lw	a5,76(a5)
    80005640:	00e7fa63          	bgeu	a5,a4,80005654 <readi+0x7a>
    n = ip->size - off;
    80005644:	fc843783          	ld	a5,-56(s0)
    80005648:	47fc                	lw	a5,76(a5)
    8000564a:	fc042703          	lw	a4,-64(s0)
    8000564e:	9f99                	subw	a5,a5,a4
    80005650:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005654:	fe042623          	sw	zero,-20(s0)
    80005658:	a8f5                	j	80005754 <readi+0x17a>
    uint addr = bmap(ip, off/BSIZE);
    8000565a:	fc042783          	lw	a5,-64(s0)
    8000565e:	00a7d79b          	srliw	a5,a5,0xa
    80005662:	2781                	sext.w	a5,a5
    80005664:	85be                	mv	a1,a5
    80005666:	fc843503          	ld	a0,-56(s0)
    8000566a:	00000097          	auipc	ra,0x0
    8000566e:	c46080e7          	jalr	-954(ra) # 800052b0 <bmap>
    80005672:	87aa                	mv	a5,a0
    80005674:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005678:	fe842783          	lw	a5,-24(s0)
    8000567c:	2781                	sext.w	a5,a5
    8000567e:	c7ed                	beqz	a5,80005768 <readi+0x18e>
      break;
    bp = bread(ip->dev, addr);
    80005680:	fc843783          	ld	a5,-56(s0)
    80005684:	439c                	lw	a5,0(a5)
    80005686:	fe842703          	lw	a4,-24(s0)
    8000568a:	85ba                	mv	a1,a4
    8000568c:	853e                	mv	a0,a5
    8000568e:	fffff097          	auipc	ra,0xfffff
    80005692:	fc2080e7          	jalr	-62(ra) # 80004650 <bread>
    80005696:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    8000569a:	fc042783          	lw	a5,-64(s0)
    8000569e:	3ff7f793          	andi	a5,a5,1023
    800056a2:	2781                	sext.w	a5,a5
    800056a4:	40000713          	li	a4,1024
    800056a8:	40f707bb          	subw	a5,a4,a5
    800056ac:	2781                	sext.w	a5,a5
    800056ae:	fb442703          	lw	a4,-76(s0)
    800056b2:	86ba                	mv	a3,a4
    800056b4:	fec42703          	lw	a4,-20(s0)
    800056b8:	40e6873b          	subw	a4,a3,a4
    800056bc:	2701                	sext.w	a4,a4
    800056be:	863a                	mv	a2,a4
    800056c0:	0007869b          	sext.w	a3,a5
    800056c4:	0006071b          	sext.w	a4,a2
    800056c8:	00d77363          	bgeu	a4,a3,800056ce <readi+0xf4>
    800056cc:	87b2                	mv	a5,a2
    800056ce:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800056d2:	fe043783          	ld	a5,-32(s0)
    800056d6:	05878713          	addi	a4,a5,88
    800056da:	fc046783          	lwu	a5,-64(s0)
    800056de:	3ff7f793          	andi	a5,a5,1023
    800056e2:	973e                	add	a4,a4,a5
    800056e4:	fdc46683          	lwu	a3,-36(s0)
    800056e8:	fc442783          	lw	a5,-60(s0)
    800056ec:	863a                	mv	a2,a4
    800056ee:	fb843583          	ld	a1,-72(s0)
    800056f2:	853e                	mv	a0,a5
    800056f4:	ffffe097          	auipc	ra,0xffffe
    800056f8:	f38080e7          	jalr	-200(ra) # 8000362c <either_copyout>
    800056fc:	87aa                	mv	a5,a0
    800056fe:	873e                	mv	a4,a5
    80005700:	57fd                	li	a5,-1
    80005702:	00f71c63          	bne	a4,a5,8000571a <readi+0x140>
      brelse(bp);
    80005706:	fe043503          	ld	a0,-32(s0)
    8000570a:	fffff097          	auipc	ra,0xfffff
    8000570e:	fe8080e7          	jalr	-24(ra) # 800046f2 <brelse>
      tot = -1;
    80005712:	57fd                	li	a5,-1
    80005714:	fef42623          	sw	a5,-20(s0)
      break;
    80005718:	a889                	j	8000576a <readi+0x190>
    }
    brelse(bp);
    8000571a:	fe043503          	ld	a0,-32(s0)
    8000571e:	fffff097          	auipc	ra,0xfffff
    80005722:	fd4080e7          	jalr	-44(ra) # 800046f2 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005726:	fec42783          	lw	a5,-20(s0)
    8000572a:	873e                	mv	a4,a5
    8000572c:	fdc42783          	lw	a5,-36(s0)
    80005730:	9fb9                	addw	a5,a5,a4
    80005732:	fef42623          	sw	a5,-20(s0)
    80005736:	fc042783          	lw	a5,-64(s0)
    8000573a:	873e                	mv	a4,a5
    8000573c:	fdc42783          	lw	a5,-36(s0)
    80005740:	9fb9                	addw	a5,a5,a4
    80005742:	fcf42023          	sw	a5,-64(s0)
    80005746:	fdc46783          	lwu	a5,-36(s0)
    8000574a:	fb843703          	ld	a4,-72(s0)
    8000574e:	97ba                	add	a5,a5,a4
    80005750:	faf43c23          	sd	a5,-72(s0)
    80005754:	fec42783          	lw	a5,-20(s0)
    80005758:	873e                	mv	a4,a5
    8000575a:	fb442783          	lw	a5,-76(s0)
    8000575e:	2701                	sext.w	a4,a4
    80005760:	2781                	sext.w	a5,a5
    80005762:	eef76ce3          	bltu	a4,a5,8000565a <readi+0x80>
    80005766:	a011                	j	8000576a <readi+0x190>
      break;
    80005768:	0001                	nop
  }
  return tot;
    8000576a:	fec42783          	lw	a5,-20(s0)
}
    8000576e:	853e                	mv	a0,a5
    80005770:	60a6                	ld	ra,72(sp)
    80005772:	6406                	ld	s0,64(sp)
    80005774:	6161                	addi	sp,sp,80
    80005776:	8082                	ret

0000000080005778 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005778:	715d                	addi	sp,sp,-80
    8000577a:	e486                	sd	ra,72(sp)
    8000577c:	e0a2                	sd	s0,64(sp)
    8000577e:	0880                	addi	s0,sp,80
    80005780:	fca43423          	sd	a0,-56(s0)
    80005784:	87ae                	mv	a5,a1
    80005786:	fac43c23          	sd	a2,-72(s0)
    8000578a:	fcf42223          	sw	a5,-60(s0)
    8000578e:	87b6                	mv	a5,a3
    80005790:	fcf42023          	sw	a5,-64(s0)
    80005794:	87ba                	mv	a5,a4
    80005796:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000579a:	fc843783          	ld	a5,-56(s0)
    8000579e:	47f8                	lw	a4,76(a5)
    800057a0:	fc042783          	lw	a5,-64(s0)
    800057a4:	2781                	sext.w	a5,a5
    800057a6:	00f76f63          	bltu	a4,a5,800057c4 <writei+0x4c>
    800057aa:	fc042783          	lw	a5,-64(s0)
    800057ae:	873e                	mv	a4,a5
    800057b0:	fb442783          	lw	a5,-76(s0)
    800057b4:	9fb9                	addw	a5,a5,a4
    800057b6:	0007871b          	sext.w	a4,a5
    800057ba:	fc042783          	lw	a5,-64(s0)
    800057be:	2781                	sext.w	a5,a5
    800057c0:	00f77463          	bgeu	a4,a5,800057c8 <writei+0x50>
    return -1;
    800057c4:	57fd                	li	a5,-1
    800057c6:	a295                	j	8000592a <writei+0x1b2>
  if(off + n > MAXFILE*BSIZE)
    800057c8:	fc042783          	lw	a5,-64(s0)
    800057cc:	873e                	mv	a4,a5
    800057ce:	fb442783          	lw	a5,-76(s0)
    800057d2:	9fb9                	addw	a5,a5,a4
    800057d4:	2781                	sext.w	a5,a5
    800057d6:	873e                	mv	a4,a5
    800057d8:	000437b7          	lui	a5,0x43
    800057dc:	00e7f463          	bgeu	a5,a4,800057e4 <writei+0x6c>
    return -1;
    800057e0:	57fd                	li	a5,-1
    800057e2:	a2a1                	j	8000592a <writei+0x1b2>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    800057e4:	fe042623          	sw	zero,-20(s0)
    800057e8:	a209                	j	800058ea <writei+0x172>
    uint addr = bmap(ip, off/BSIZE);
    800057ea:	fc042783          	lw	a5,-64(s0)
    800057ee:	00a7d79b          	srliw	a5,a5,0xa
    800057f2:	2781                	sext.w	a5,a5
    800057f4:	85be                	mv	a1,a5
    800057f6:	fc843503          	ld	a0,-56(s0)
    800057fa:	00000097          	auipc	ra,0x0
    800057fe:	ab6080e7          	jalr	-1354(ra) # 800052b0 <bmap>
    80005802:	87aa                	mv	a5,a0
    80005804:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005808:	fe842783          	lw	a5,-24(s0)
    8000580c:	2781                	sext.w	a5,a5
    8000580e:	cbe5                	beqz	a5,800058fe <writei+0x186>
      break;
    bp = bread(ip->dev, addr);
    80005810:	fc843783          	ld	a5,-56(s0)
    80005814:	439c                	lw	a5,0(a5)
    80005816:	fe842703          	lw	a4,-24(s0)
    8000581a:	85ba                	mv	a1,a4
    8000581c:	853e                	mv	a0,a5
    8000581e:	fffff097          	auipc	ra,0xfffff
    80005822:	e32080e7          	jalr	-462(ra) # 80004650 <bread>
    80005826:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    8000582a:	fc042783          	lw	a5,-64(s0)
    8000582e:	3ff7f793          	andi	a5,a5,1023
    80005832:	2781                	sext.w	a5,a5
    80005834:	40000713          	li	a4,1024
    80005838:	40f707bb          	subw	a5,a4,a5
    8000583c:	2781                	sext.w	a5,a5
    8000583e:	fb442703          	lw	a4,-76(s0)
    80005842:	86ba                	mv	a3,a4
    80005844:	fec42703          	lw	a4,-20(s0)
    80005848:	40e6873b          	subw	a4,a3,a4
    8000584c:	2701                	sext.w	a4,a4
    8000584e:	863a                	mv	a2,a4
    80005850:	0007869b          	sext.w	a3,a5
    80005854:	0006071b          	sext.w	a4,a2
    80005858:	00d77363          	bgeu	a4,a3,8000585e <writei+0xe6>
    8000585c:	87b2                	mv	a5,a2
    8000585e:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005862:	fe043783          	ld	a5,-32(s0)
    80005866:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    8000586a:	fc046783          	lwu	a5,-64(s0)
    8000586e:	3ff7f793          	andi	a5,a5,1023
    80005872:	97ba                	add	a5,a5,a4
    80005874:	fdc46683          	lwu	a3,-36(s0)
    80005878:	fc442703          	lw	a4,-60(s0)
    8000587c:	fb843603          	ld	a2,-72(s0)
    80005880:	85ba                	mv	a1,a4
    80005882:	853e                	mv	a0,a5
    80005884:	ffffe097          	auipc	ra,0xffffe
    80005888:	e1c080e7          	jalr	-484(ra) # 800036a0 <either_copyin>
    8000588c:	87aa                	mv	a5,a0
    8000588e:	873e                	mv	a4,a5
    80005890:	57fd                	li	a5,-1
    80005892:	00f71963          	bne	a4,a5,800058a4 <writei+0x12c>
      brelse(bp);
    80005896:	fe043503          	ld	a0,-32(s0)
    8000589a:	fffff097          	auipc	ra,0xfffff
    8000589e:	e58080e7          	jalr	-424(ra) # 800046f2 <brelse>
      break;
    800058a2:	a8b9                	j	80005900 <writei+0x188>
    }
    log_write(bp);
    800058a4:	fe043503          	ld	a0,-32(s0)
    800058a8:	00001097          	auipc	ra,0x1
    800058ac:	af2080e7          	jalr	-1294(ra) # 8000639a <log_write>
    brelse(bp);
    800058b0:	fe043503          	ld	a0,-32(s0)
    800058b4:	fffff097          	auipc	ra,0xfffff
    800058b8:	e3e080e7          	jalr	-450(ra) # 800046f2 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    800058bc:	fec42783          	lw	a5,-20(s0)
    800058c0:	873e                	mv	a4,a5
    800058c2:	fdc42783          	lw	a5,-36(s0)
    800058c6:	9fb9                	addw	a5,a5,a4
    800058c8:	fef42623          	sw	a5,-20(s0)
    800058cc:	fc042783          	lw	a5,-64(s0)
    800058d0:	873e                	mv	a4,a5
    800058d2:	fdc42783          	lw	a5,-36(s0)
    800058d6:	9fb9                	addw	a5,a5,a4
    800058d8:	fcf42023          	sw	a5,-64(s0)
    800058dc:	fdc46783          	lwu	a5,-36(s0)
    800058e0:	fb843703          	ld	a4,-72(s0)
    800058e4:	97ba                	add	a5,a5,a4
    800058e6:	faf43c23          	sd	a5,-72(s0)
    800058ea:	fec42783          	lw	a5,-20(s0)
    800058ee:	873e                	mv	a4,a5
    800058f0:	fb442783          	lw	a5,-76(s0)
    800058f4:	2701                	sext.w	a4,a4
    800058f6:	2781                	sext.w	a5,a5
    800058f8:	eef769e3          	bltu	a4,a5,800057ea <writei+0x72>
    800058fc:	a011                	j	80005900 <writei+0x188>
      break;
    800058fe:	0001                	nop
  }

  if(off > ip->size)
    80005900:	fc843783          	ld	a5,-56(s0)
    80005904:	47f8                	lw	a4,76(a5)
    80005906:	fc042783          	lw	a5,-64(s0)
    8000590a:	2781                	sext.w	a5,a5
    8000590c:	00f77763          	bgeu	a4,a5,8000591a <writei+0x1a2>
    ip->size = off;
    80005910:	fc843783          	ld	a5,-56(s0)
    80005914:	fc042703          	lw	a4,-64(s0)
    80005918:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    8000591a:	fc843503          	ld	a0,-56(s0)
    8000591e:	fffff097          	auipc	ra,0xfffff
    80005922:	4b6080e7          	jalr	1206(ra) # 80004dd4 <iupdate>

  return tot;
    80005926:	fec42783          	lw	a5,-20(s0)
}
    8000592a:	853e                	mv	a0,a5
    8000592c:	60a6                	ld	ra,72(sp)
    8000592e:	6406                	ld	s0,64(sp)
    80005930:	6161                	addi	sp,sp,80
    80005932:	8082                	ret

0000000080005934 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005934:	1101                	addi	sp,sp,-32
    80005936:	ec06                	sd	ra,24(sp)
    80005938:	e822                	sd	s0,16(sp)
    8000593a:	1000                	addi	s0,sp,32
    8000593c:	fea43423          	sd	a0,-24(s0)
    80005940:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005944:	4639                	li	a2,14
    80005946:	fe043583          	ld	a1,-32(s0)
    8000594a:	fe843503          	ld	a0,-24(s0)
    8000594e:	ffffc097          	auipc	ra,0xffffc
    80005952:	cf6080e7          	jalr	-778(ra) # 80001644 <strncmp>
    80005956:	87aa                	mv	a5,a0
}
    80005958:	853e                	mv	a0,a5
    8000595a:	60e2                	ld	ra,24(sp)
    8000595c:	6442                	ld	s0,16(sp)
    8000595e:	6105                	addi	sp,sp,32
    80005960:	8082                	ret

0000000080005962 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005962:	715d                	addi	sp,sp,-80
    80005964:	e486                	sd	ra,72(sp)
    80005966:	e0a2                	sd	s0,64(sp)
    80005968:	0880                	addi	s0,sp,80
    8000596a:	fca43423          	sd	a0,-56(s0)
    8000596e:	fcb43023          	sd	a1,-64(s0)
    80005972:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005976:	fc843783          	ld	a5,-56(s0)
    8000597a:	04479783          	lh	a5,68(a5)
    8000597e:	0007871b          	sext.w	a4,a5
    80005982:	4785                	li	a5,1
    80005984:	00f70a63          	beq	a4,a5,80005998 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005988:	00006517          	auipc	a0,0x6
    8000598c:	b8050513          	addi	a0,a0,-1152 # 8000b508 <etext+0x508>
    80005990:	ffffb097          	auipc	ra,0xffffb
    80005994:	2fa080e7          	jalr	762(ra) # 80000c8a <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005998:	fe042623          	sw	zero,-20(s0)
    8000599c:	a849                	j	80005a2e <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000599e:	fd840793          	addi	a5,s0,-40
    800059a2:	fec42683          	lw	a3,-20(s0)
    800059a6:	4741                	li	a4,16
    800059a8:	863e                	mv	a2,a5
    800059aa:	4581                	li	a1,0
    800059ac:	fc843503          	ld	a0,-56(s0)
    800059b0:	00000097          	auipc	ra,0x0
    800059b4:	c2a080e7          	jalr	-982(ra) # 800055da <readi>
    800059b8:	87aa                	mv	a5,a0
    800059ba:	873e                	mv	a4,a5
    800059bc:	47c1                	li	a5,16
    800059be:	00f70a63          	beq	a4,a5,800059d2 <dirlookup+0x70>
      panic("dirlookup read");
    800059c2:	00006517          	auipc	a0,0x6
    800059c6:	b5e50513          	addi	a0,a0,-1186 # 8000b520 <etext+0x520>
    800059ca:	ffffb097          	auipc	ra,0xffffb
    800059ce:	2c0080e7          	jalr	704(ra) # 80000c8a <panic>
    if(de.inum == 0)
    800059d2:	fd845783          	lhu	a5,-40(s0)
    800059d6:	c7b1                	beqz	a5,80005a22 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    800059d8:	fd840793          	addi	a5,s0,-40
    800059dc:	0789                	addi	a5,a5,2
    800059de:	85be                	mv	a1,a5
    800059e0:	fc043503          	ld	a0,-64(s0)
    800059e4:	00000097          	auipc	ra,0x0
    800059e8:	f50080e7          	jalr	-176(ra) # 80005934 <namecmp>
    800059ec:	87aa                	mv	a5,a0
    800059ee:	eb9d                	bnez	a5,80005a24 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    800059f0:	fb843783          	ld	a5,-72(s0)
    800059f4:	c791                	beqz	a5,80005a00 <dirlookup+0x9e>
        *poff = off;
    800059f6:	fb843783          	ld	a5,-72(s0)
    800059fa:	fec42703          	lw	a4,-20(s0)
    800059fe:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005a00:	fd845783          	lhu	a5,-40(s0)
    80005a04:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005a08:	fc843783          	ld	a5,-56(s0)
    80005a0c:	439c                	lw	a5,0(a5)
    80005a0e:	fe842703          	lw	a4,-24(s0)
    80005a12:	85ba                	mv	a1,a4
    80005a14:	853e                	mv	a0,a5
    80005a16:	fffff097          	auipc	ra,0xfffff
    80005a1a:	4a6080e7          	jalr	1190(ra) # 80004ebc <iget>
    80005a1e:	87aa                	mv	a5,a0
    80005a20:	a005                	j	80005a40 <dirlookup+0xde>
      continue;
    80005a22:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005a24:	fec42783          	lw	a5,-20(s0)
    80005a28:	27c1                	addiw	a5,a5,16
    80005a2a:	fef42623          	sw	a5,-20(s0)
    80005a2e:	fc843783          	ld	a5,-56(s0)
    80005a32:	47f8                	lw	a4,76(a5)
    80005a34:	fec42783          	lw	a5,-20(s0)
    80005a38:	2781                	sext.w	a5,a5
    80005a3a:	f6e7e2e3          	bltu	a5,a4,8000599e <dirlookup+0x3c>
    }
  }

  return 0;
    80005a3e:	4781                	li	a5,0
}
    80005a40:	853e                	mv	a0,a5
    80005a42:	60a6                	ld	ra,72(sp)
    80005a44:	6406                	ld	s0,64(sp)
    80005a46:	6161                	addi	sp,sp,80
    80005a48:	8082                	ret

0000000080005a4a <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005a4a:	715d                	addi	sp,sp,-80
    80005a4c:	e486                	sd	ra,72(sp)
    80005a4e:	e0a2                	sd	s0,64(sp)
    80005a50:	0880                	addi	s0,sp,80
    80005a52:	fca43423          	sd	a0,-56(s0)
    80005a56:	fcb43023          	sd	a1,-64(s0)
    80005a5a:	87b2                	mv	a5,a2
    80005a5c:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005a60:	4601                	li	a2,0
    80005a62:	fc043583          	ld	a1,-64(s0)
    80005a66:	fc843503          	ld	a0,-56(s0)
    80005a6a:	00000097          	auipc	ra,0x0
    80005a6e:	ef8080e7          	jalr	-264(ra) # 80005962 <dirlookup>
    80005a72:	fea43023          	sd	a0,-32(s0)
    80005a76:	fe043783          	ld	a5,-32(s0)
    80005a7a:	cb89                	beqz	a5,80005a8c <dirlink+0x42>
    iput(ip);
    80005a7c:	fe043503          	ld	a0,-32(s0)
    80005a80:	fffff097          	auipc	ra,0xfffff
    80005a84:	732080e7          	jalr	1842(ra) # 800051b2 <iput>
    return -1;
    80005a88:	57fd                	li	a5,-1
    80005a8a:	a075                	j	80005b36 <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005a8c:	fe042623          	sw	zero,-20(s0)
    80005a90:	a0a1                	j	80005ad8 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005a92:	fd040793          	addi	a5,s0,-48
    80005a96:	fec42683          	lw	a3,-20(s0)
    80005a9a:	4741                	li	a4,16
    80005a9c:	863e                	mv	a2,a5
    80005a9e:	4581                	li	a1,0
    80005aa0:	fc843503          	ld	a0,-56(s0)
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	b36080e7          	jalr	-1226(ra) # 800055da <readi>
    80005aac:	87aa                	mv	a5,a0
    80005aae:	873e                	mv	a4,a5
    80005ab0:	47c1                	li	a5,16
    80005ab2:	00f70a63          	beq	a4,a5,80005ac6 <dirlink+0x7c>
      panic("dirlink read");
    80005ab6:	00006517          	auipc	a0,0x6
    80005aba:	a7a50513          	addi	a0,a0,-1414 # 8000b530 <etext+0x530>
    80005abe:	ffffb097          	auipc	ra,0xffffb
    80005ac2:	1cc080e7          	jalr	460(ra) # 80000c8a <panic>
    if(de.inum == 0)
    80005ac6:	fd045783          	lhu	a5,-48(s0)
    80005aca:	cf99                	beqz	a5,80005ae8 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005acc:	fec42783          	lw	a5,-20(s0)
    80005ad0:	27c1                	addiw	a5,a5,16
    80005ad2:	2781                	sext.w	a5,a5
    80005ad4:	fef42623          	sw	a5,-20(s0)
    80005ad8:	fc843783          	ld	a5,-56(s0)
    80005adc:	47f8                	lw	a4,76(a5)
    80005ade:	fec42783          	lw	a5,-20(s0)
    80005ae2:	fae7e8e3          	bltu	a5,a4,80005a92 <dirlink+0x48>
    80005ae6:	a011                	j	80005aea <dirlink+0xa0>
      break;
    80005ae8:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005aea:	fd040793          	addi	a5,s0,-48
    80005aee:	0789                	addi	a5,a5,2
    80005af0:	4639                	li	a2,14
    80005af2:	fc043583          	ld	a1,-64(s0)
    80005af6:	853e                	mv	a0,a5
    80005af8:	ffffc097          	auipc	ra,0xffffc
    80005afc:	bd6080e7          	jalr	-1066(ra) # 800016ce <strncpy>
  de.inum = inum;
    80005b00:	fbc42783          	lw	a5,-68(s0)
    80005b04:	17c2                	slli	a5,a5,0x30
    80005b06:	93c1                	srli	a5,a5,0x30
    80005b08:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005b0c:	fd040793          	addi	a5,s0,-48
    80005b10:	fec42683          	lw	a3,-20(s0)
    80005b14:	4741                	li	a4,16
    80005b16:	863e                	mv	a2,a5
    80005b18:	4581                	li	a1,0
    80005b1a:	fc843503          	ld	a0,-56(s0)
    80005b1e:	00000097          	auipc	ra,0x0
    80005b22:	c5a080e7          	jalr	-934(ra) # 80005778 <writei>
    80005b26:	87aa                	mv	a5,a0
    80005b28:	873e                	mv	a4,a5
    80005b2a:	47c1                	li	a5,16
    80005b2c:	00f70463          	beq	a4,a5,80005b34 <dirlink+0xea>
    return -1;
    80005b30:	57fd                	li	a5,-1
    80005b32:	a011                	j	80005b36 <dirlink+0xec>

  return 0;
    80005b34:	4781                	li	a5,0
}
    80005b36:	853e                	mv	a0,a5
    80005b38:	60a6                	ld	ra,72(sp)
    80005b3a:	6406                	ld	s0,64(sp)
    80005b3c:	6161                	addi	sp,sp,80
    80005b3e:	8082                	ret

0000000080005b40 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005b40:	7179                	addi	sp,sp,-48
    80005b42:	f406                	sd	ra,40(sp)
    80005b44:	f022                	sd	s0,32(sp)
    80005b46:	1800                	addi	s0,sp,48
    80005b48:	fca43c23          	sd	a0,-40(s0)
    80005b4c:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005b50:	a031                	j	80005b5c <skipelem+0x1c>
    path++;
    80005b52:	fd843783          	ld	a5,-40(s0)
    80005b56:	0785                	addi	a5,a5,1
    80005b58:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005b5c:	fd843783          	ld	a5,-40(s0)
    80005b60:	0007c783          	lbu	a5,0(a5)
    80005b64:	873e                	mv	a4,a5
    80005b66:	02f00793          	li	a5,47
    80005b6a:	fef704e3          	beq	a4,a5,80005b52 <skipelem+0x12>
  if(*path == 0)
    80005b6e:	fd843783          	ld	a5,-40(s0)
    80005b72:	0007c783          	lbu	a5,0(a5)
    80005b76:	e399                	bnez	a5,80005b7c <skipelem+0x3c>
    return 0;
    80005b78:	4781                	li	a5,0
    80005b7a:	a06d                	j	80005c24 <skipelem+0xe4>
  s = path;
    80005b7c:	fd843783          	ld	a5,-40(s0)
    80005b80:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005b84:	a031                	j	80005b90 <skipelem+0x50>
    path++;
    80005b86:	fd843783          	ld	a5,-40(s0)
    80005b8a:	0785                	addi	a5,a5,1
    80005b8c:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005b90:	fd843783          	ld	a5,-40(s0)
    80005b94:	0007c783          	lbu	a5,0(a5)
    80005b98:	873e                	mv	a4,a5
    80005b9a:	02f00793          	li	a5,47
    80005b9e:	00f70763          	beq	a4,a5,80005bac <skipelem+0x6c>
    80005ba2:	fd843783          	ld	a5,-40(s0)
    80005ba6:	0007c783          	lbu	a5,0(a5)
    80005baa:	fff1                	bnez	a5,80005b86 <skipelem+0x46>
  len = path - s;
    80005bac:	fd843703          	ld	a4,-40(s0)
    80005bb0:	fe843783          	ld	a5,-24(s0)
    80005bb4:	40f707b3          	sub	a5,a4,a5
    80005bb8:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005bbc:	fe442783          	lw	a5,-28(s0)
    80005bc0:	0007871b          	sext.w	a4,a5
    80005bc4:	47b5                	li	a5,13
    80005bc6:	00e7dc63          	bge	a5,a4,80005bde <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005bca:	4639                	li	a2,14
    80005bcc:	fe843583          	ld	a1,-24(s0)
    80005bd0:	fd043503          	ld	a0,-48(s0)
    80005bd4:	ffffc097          	auipc	ra,0xffffc
    80005bd8:	95c080e7          	jalr	-1700(ra) # 80001530 <memmove>
    80005bdc:	a80d                	j	80005c0e <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005bde:	fe442783          	lw	a5,-28(s0)
    80005be2:	863e                	mv	a2,a5
    80005be4:	fe843583          	ld	a1,-24(s0)
    80005be8:	fd043503          	ld	a0,-48(s0)
    80005bec:	ffffc097          	auipc	ra,0xffffc
    80005bf0:	944080e7          	jalr	-1724(ra) # 80001530 <memmove>
    name[len] = 0;
    80005bf4:	fe442783          	lw	a5,-28(s0)
    80005bf8:	fd043703          	ld	a4,-48(s0)
    80005bfc:	97ba                	add	a5,a5,a4
    80005bfe:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005c02:	a031                	j	80005c0e <skipelem+0xce>
    path++;
    80005c04:	fd843783          	ld	a5,-40(s0)
    80005c08:	0785                	addi	a5,a5,1
    80005c0a:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005c0e:	fd843783          	ld	a5,-40(s0)
    80005c12:	0007c783          	lbu	a5,0(a5)
    80005c16:	873e                	mv	a4,a5
    80005c18:	02f00793          	li	a5,47
    80005c1c:	fef704e3          	beq	a4,a5,80005c04 <skipelem+0xc4>
  return path;
    80005c20:	fd843783          	ld	a5,-40(s0)
}
    80005c24:	853e                	mv	a0,a5
    80005c26:	70a2                	ld	ra,40(sp)
    80005c28:	7402                	ld	s0,32(sp)
    80005c2a:	6145                	addi	sp,sp,48
    80005c2c:	8082                	ret

0000000080005c2e <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005c2e:	7139                	addi	sp,sp,-64
    80005c30:	fc06                	sd	ra,56(sp)
    80005c32:	f822                	sd	s0,48(sp)
    80005c34:	0080                	addi	s0,sp,64
    80005c36:	fca43c23          	sd	a0,-40(s0)
    80005c3a:	87ae                	mv	a5,a1
    80005c3c:	fcc43423          	sd	a2,-56(s0)
    80005c40:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005c44:	fd843783          	ld	a5,-40(s0)
    80005c48:	0007c783          	lbu	a5,0(a5)
    80005c4c:	873e                	mv	a4,a5
    80005c4e:	02f00793          	li	a5,47
    80005c52:	00f71b63          	bne	a4,a5,80005c68 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005c56:	4585                	li	a1,1
    80005c58:	4505                	li	a0,1
    80005c5a:	fffff097          	auipc	ra,0xfffff
    80005c5e:	262080e7          	jalr	610(ra) # 80004ebc <iget>
    80005c62:	fea43423          	sd	a0,-24(s0)
    80005c66:	a84d                	j	80005d18 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005c68:	ffffd097          	auipc	ra,0xffffd
    80005c6c:	bd8080e7          	jalr	-1064(ra) # 80002840 <myproc>
    80005c70:	87aa                	mv	a5,a0
    80005c72:	1507b783          	ld	a5,336(a5)
    80005c76:	853e                	mv	a0,a5
    80005c78:	fffff097          	auipc	ra,0xfffff
    80005c7c:	360080e7          	jalr	864(ra) # 80004fd8 <idup>
    80005c80:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005c84:	a851                	j	80005d18 <namex+0xea>
    ilock(ip);
    80005c86:	fe843503          	ld	a0,-24(s0)
    80005c8a:	fffff097          	auipc	ra,0xfffff
    80005c8e:	39a080e7          	jalr	922(ra) # 80005024 <ilock>
    if(ip->type != T_DIR){
    80005c92:	fe843783          	ld	a5,-24(s0)
    80005c96:	04479783          	lh	a5,68(a5)
    80005c9a:	0007871b          	sext.w	a4,a5
    80005c9e:	4785                	li	a5,1
    80005ca0:	00f70a63          	beq	a4,a5,80005cb4 <namex+0x86>
      iunlockput(ip);
    80005ca4:	fe843503          	ld	a0,-24(s0)
    80005ca8:	fffff097          	auipc	ra,0xfffff
    80005cac:	5da080e7          	jalr	1498(ra) # 80005282 <iunlockput>
      return 0;
    80005cb0:	4781                	li	a5,0
    80005cb2:	a871                	j	80005d4e <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005cb4:	fd442783          	lw	a5,-44(s0)
    80005cb8:	2781                	sext.w	a5,a5
    80005cba:	cf99                	beqz	a5,80005cd8 <namex+0xaa>
    80005cbc:	fd843783          	ld	a5,-40(s0)
    80005cc0:	0007c783          	lbu	a5,0(a5)
    80005cc4:	eb91                	bnez	a5,80005cd8 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005cc6:	fe843503          	ld	a0,-24(s0)
    80005cca:	fffff097          	auipc	ra,0xfffff
    80005cce:	48e080e7          	jalr	1166(ra) # 80005158 <iunlock>
      return ip;
    80005cd2:	fe843783          	ld	a5,-24(s0)
    80005cd6:	a8a5                	j	80005d4e <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005cd8:	4601                	li	a2,0
    80005cda:	fc843583          	ld	a1,-56(s0)
    80005cde:	fe843503          	ld	a0,-24(s0)
    80005ce2:	00000097          	auipc	ra,0x0
    80005ce6:	c80080e7          	jalr	-896(ra) # 80005962 <dirlookup>
    80005cea:	fea43023          	sd	a0,-32(s0)
    80005cee:	fe043783          	ld	a5,-32(s0)
    80005cf2:	eb89                	bnez	a5,80005d04 <namex+0xd6>
      iunlockput(ip);
    80005cf4:	fe843503          	ld	a0,-24(s0)
    80005cf8:	fffff097          	auipc	ra,0xfffff
    80005cfc:	58a080e7          	jalr	1418(ra) # 80005282 <iunlockput>
      return 0;
    80005d00:	4781                	li	a5,0
    80005d02:	a0b1                	j	80005d4e <namex+0x120>
    }
    iunlockput(ip);
    80005d04:	fe843503          	ld	a0,-24(s0)
    80005d08:	fffff097          	auipc	ra,0xfffff
    80005d0c:	57a080e7          	jalr	1402(ra) # 80005282 <iunlockput>
    ip = next;
    80005d10:	fe043783          	ld	a5,-32(s0)
    80005d14:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005d18:	fc843583          	ld	a1,-56(s0)
    80005d1c:	fd843503          	ld	a0,-40(s0)
    80005d20:	00000097          	auipc	ra,0x0
    80005d24:	e20080e7          	jalr	-480(ra) # 80005b40 <skipelem>
    80005d28:	fca43c23          	sd	a0,-40(s0)
    80005d2c:	fd843783          	ld	a5,-40(s0)
    80005d30:	fbb9                	bnez	a5,80005c86 <namex+0x58>
  }
  if(nameiparent){
    80005d32:	fd442783          	lw	a5,-44(s0)
    80005d36:	2781                	sext.w	a5,a5
    80005d38:	cb89                	beqz	a5,80005d4a <namex+0x11c>
    iput(ip);
    80005d3a:	fe843503          	ld	a0,-24(s0)
    80005d3e:	fffff097          	auipc	ra,0xfffff
    80005d42:	474080e7          	jalr	1140(ra) # 800051b2 <iput>
    return 0;
    80005d46:	4781                	li	a5,0
    80005d48:	a019                	j	80005d4e <namex+0x120>
  }
  return ip;
    80005d4a:	fe843783          	ld	a5,-24(s0)
}
    80005d4e:	853e                	mv	a0,a5
    80005d50:	70e2                	ld	ra,56(sp)
    80005d52:	7442                	ld	s0,48(sp)
    80005d54:	6121                	addi	sp,sp,64
    80005d56:	8082                	ret

0000000080005d58 <namei>:

struct inode*
namei(char *path)
{
    80005d58:	7179                	addi	sp,sp,-48
    80005d5a:	f406                	sd	ra,40(sp)
    80005d5c:	f022                	sd	s0,32(sp)
    80005d5e:	1800                	addi	s0,sp,48
    80005d60:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005d64:	fe040793          	addi	a5,s0,-32
    80005d68:	863e                	mv	a2,a5
    80005d6a:	4581                	li	a1,0
    80005d6c:	fd843503          	ld	a0,-40(s0)
    80005d70:	00000097          	auipc	ra,0x0
    80005d74:	ebe080e7          	jalr	-322(ra) # 80005c2e <namex>
    80005d78:	87aa                	mv	a5,a0
}
    80005d7a:	853e                	mv	a0,a5
    80005d7c:	70a2                	ld	ra,40(sp)
    80005d7e:	7402                	ld	s0,32(sp)
    80005d80:	6145                	addi	sp,sp,48
    80005d82:	8082                	ret

0000000080005d84 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005d84:	1101                	addi	sp,sp,-32
    80005d86:	ec06                	sd	ra,24(sp)
    80005d88:	e822                	sd	s0,16(sp)
    80005d8a:	1000                	addi	s0,sp,32
    80005d8c:	fea43423          	sd	a0,-24(s0)
    80005d90:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005d94:	fe043603          	ld	a2,-32(s0)
    80005d98:	4585                	li	a1,1
    80005d9a:	fe843503          	ld	a0,-24(s0)
    80005d9e:	00000097          	auipc	ra,0x0
    80005da2:	e90080e7          	jalr	-368(ra) # 80005c2e <namex>
    80005da6:	87aa                	mv	a5,a0
}
    80005da8:	853e                	mv	a0,a5
    80005daa:	60e2                	ld	ra,24(sp)
    80005dac:	6442                	ld	s0,16(sp)
    80005dae:	6105                	addi	sp,sp,32
    80005db0:	8082                	ret

0000000080005db2 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005db2:	1101                	addi	sp,sp,-32
    80005db4:	ec06                	sd	ra,24(sp)
    80005db6:	e822                	sd	s0,16(sp)
    80005db8:	1000                	addi	s0,sp,32
    80005dba:	87aa                	mv	a5,a0
    80005dbc:	feb43023          	sd	a1,-32(s0)
    80005dc0:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80005dc4:	00005597          	auipc	a1,0x5
    80005dc8:	77c58593          	addi	a1,a1,1916 # 8000b540 <etext+0x540>
    80005dcc:	0001e517          	auipc	a0,0x1e
    80005dd0:	d5c50513          	addi	a0,a0,-676 # 80023b28 <log>
    80005dd4:	ffffb097          	auipc	ra,0xffffb
    80005dd8:	474080e7          	jalr	1140(ra) # 80001248 <initlock>
  log.start = sb->logstart;
    80005ddc:	fe043783          	ld	a5,-32(s0)
    80005de0:	4bdc                	lw	a5,20(a5)
    80005de2:	0007871b          	sext.w	a4,a5
    80005de6:	0001e797          	auipc	a5,0x1e
    80005dea:	d4278793          	addi	a5,a5,-702 # 80023b28 <log>
    80005dee:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80005df0:	fe043783          	ld	a5,-32(s0)
    80005df4:	4b9c                	lw	a5,16(a5)
    80005df6:	0007871b          	sext.w	a4,a5
    80005dfa:	0001e797          	auipc	a5,0x1e
    80005dfe:	d2e78793          	addi	a5,a5,-722 # 80023b28 <log>
    80005e02:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80005e04:	0001e797          	auipc	a5,0x1e
    80005e08:	d2478793          	addi	a5,a5,-732 # 80023b28 <log>
    80005e0c:	fec42703          	lw	a4,-20(s0)
    80005e10:	d798                	sw	a4,40(a5)
  recover_from_log();
    80005e12:	00000097          	auipc	ra,0x0
    80005e16:	272080e7          	jalr	626(ra) # 80006084 <recover_from_log>
}
    80005e1a:	0001                	nop
    80005e1c:	60e2                	ld	ra,24(sp)
    80005e1e:	6442                	ld	s0,16(sp)
    80005e20:	6105                	addi	sp,sp,32
    80005e22:	8082                	ret

0000000080005e24 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80005e24:	7139                	addi	sp,sp,-64
    80005e26:	fc06                	sd	ra,56(sp)
    80005e28:	f822                	sd	s0,48(sp)
    80005e2a:	0080                	addi	s0,sp,64
    80005e2c:	87aa                	mv	a5,a0
    80005e2e:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80005e32:	fe042623          	sw	zero,-20(s0)
    80005e36:	a0f9                	j	80005f04 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80005e38:	0001e797          	auipc	a5,0x1e
    80005e3c:	cf078793          	addi	a5,a5,-784 # 80023b28 <log>
    80005e40:	579c                	lw	a5,40(a5)
    80005e42:	0007871b          	sext.w	a4,a5
    80005e46:	0001e797          	auipc	a5,0x1e
    80005e4a:	ce278793          	addi	a5,a5,-798 # 80023b28 <log>
    80005e4e:	4f9c                	lw	a5,24(a5)
    80005e50:	fec42683          	lw	a3,-20(s0)
    80005e54:	9fb5                	addw	a5,a5,a3
    80005e56:	2781                	sext.w	a5,a5
    80005e58:	2785                	addiw	a5,a5,1
    80005e5a:	2781                	sext.w	a5,a5
    80005e5c:	2781                	sext.w	a5,a5
    80005e5e:	85be                	mv	a1,a5
    80005e60:	853a                	mv	a0,a4
    80005e62:	ffffe097          	auipc	ra,0xffffe
    80005e66:	7ee080e7          	jalr	2030(ra) # 80004650 <bread>
    80005e6a:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80005e6e:	0001e797          	auipc	a5,0x1e
    80005e72:	cba78793          	addi	a5,a5,-838 # 80023b28 <log>
    80005e76:	579c                	lw	a5,40(a5)
    80005e78:	0007869b          	sext.w	a3,a5
    80005e7c:	0001e717          	auipc	a4,0x1e
    80005e80:	cac70713          	addi	a4,a4,-852 # 80023b28 <log>
    80005e84:	fec42783          	lw	a5,-20(s0)
    80005e88:	07a1                	addi	a5,a5,8
    80005e8a:	078a                	slli	a5,a5,0x2
    80005e8c:	97ba                	add	a5,a5,a4
    80005e8e:	4b9c                	lw	a5,16(a5)
    80005e90:	2781                	sext.w	a5,a5
    80005e92:	85be                	mv	a1,a5
    80005e94:	8536                	mv	a0,a3
    80005e96:	ffffe097          	auipc	ra,0xffffe
    80005e9a:	7ba080e7          	jalr	1978(ra) # 80004650 <bread>
    80005e9e:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80005ea2:	fd843783          	ld	a5,-40(s0)
    80005ea6:	05878713          	addi	a4,a5,88
    80005eaa:	fe043783          	ld	a5,-32(s0)
    80005eae:	05878793          	addi	a5,a5,88
    80005eb2:	40000613          	li	a2,1024
    80005eb6:	85be                	mv	a1,a5
    80005eb8:	853a                	mv	a0,a4
    80005eba:	ffffb097          	auipc	ra,0xffffb
    80005ebe:	676080e7          	jalr	1654(ra) # 80001530 <memmove>
    bwrite(dbuf);  // write dst to disk
    80005ec2:	fd843503          	ld	a0,-40(s0)
    80005ec6:	ffffe097          	auipc	ra,0xffffe
    80005eca:	7e4080e7          	jalr	2020(ra) # 800046aa <bwrite>
    if(recovering == 0)
    80005ece:	fcc42783          	lw	a5,-52(s0)
    80005ed2:	2781                	sext.w	a5,a5
    80005ed4:	e799                	bnez	a5,80005ee2 <install_trans+0xbe>
      bunpin(dbuf);
    80005ed6:	fd843503          	ld	a0,-40(s0)
    80005eda:	fffff097          	auipc	ra,0xfffff
    80005ede:	94e080e7          	jalr	-1714(ra) # 80004828 <bunpin>
    brelse(lbuf);
    80005ee2:	fe043503          	ld	a0,-32(s0)
    80005ee6:	fffff097          	auipc	ra,0xfffff
    80005eea:	80c080e7          	jalr	-2036(ra) # 800046f2 <brelse>
    brelse(dbuf);
    80005eee:	fd843503          	ld	a0,-40(s0)
    80005ef2:	fffff097          	auipc	ra,0xfffff
    80005ef6:	800080e7          	jalr	-2048(ra) # 800046f2 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80005efa:	fec42783          	lw	a5,-20(s0)
    80005efe:	2785                	addiw	a5,a5,1
    80005f00:	fef42623          	sw	a5,-20(s0)
    80005f04:	0001e797          	auipc	a5,0x1e
    80005f08:	c2478793          	addi	a5,a5,-988 # 80023b28 <log>
    80005f0c:	57d8                	lw	a4,44(a5)
    80005f0e:	fec42783          	lw	a5,-20(s0)
    80005f12:	2781                	sext.w	a5,a5
    80005f14:	f2e7c2e3          	blt	a5,a4,80005e38 <install_trans+0x14>
  }
}
    80005f18:	0001                	nop
    80005f1a:	0001                	nop
    80005f1c:	70e2                	ld	ra,56(sp)
    80005f1e:	7442                	ld	s0,48(sp)
    80005f20:	6121                	addi	sp,sp,64
    80005f22:	8082                	ret

0000000080005f24 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80005f24:	7179                	addi	sp,sp,-48
    80005f26:	f406                	sd	ra,40(sp)
    80005f28:	f022                	sd	s0,32(sp)
    80005f2a:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80005f2c:	0001e797          	auipc	a5,0x1e
    80005f30:	bfc78793          	addi	a5,a5,-1028 # 80023b28 <log>
    80005f34:	579c                	lw	a5,40(a5)
    80005f36:	0007871b          	sext.w	a4,a5
    80005f3a:	0001e797          	auipc	a5,0x1e
    80005f3e:	bee78793          	addi	a5,a5,-1042 # 80023b28 <log>
    80005f42:	4f9c                	lw	a5,24(a5)
    80005f44:	2781                	sext.w	a5,a5
    80005f46:	85be                	mv	a1,a5
    80005f48:	853a                	mv	a0,a4
    80005f4a:	ffffe097          	auipc	ra,0xffffe
    80005f4e:	706080e7          	jalr	1798(ra) # 80004650 <bread>
    80005f52:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80005f56:	fe043783          	ld	a5,-32(s0)
    80005f5a:	05878793          	addi	a5,a5,88
    80005f5e:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80005f62:	fd843783          	ld	a5,-40(s0)
    80005f66:	4398                	lw	a4,0(a5)
    80005f68:	0001e797          	auipc	a5,0x1e
    80005f6c:	bc078793          	addi	a5,a5,-1088 # 80023b28 <log>
    80005f70:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80005f72:	fe042623          	sw	zero,-20(s0)
    80005f76:	a03d                	j	80005fa4 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80005f78:	fd843703          	ld	a4,-40(s0)
    80005f7c:	fec42783          	lw	a5,-20(s0)
    80005f80:	078a                	slli	a5,a5,0x2
    80005f82:	97ba                	add	a5,a5,a4
    80005f84:	43d8                	lw	a4,4(a5)
    80005f86:	0001e697          	auipc	a3,0x1e
    80005f8a:	ba268693          	addi	a3,a3,-1118 # 80023b28 <log>
    80005f8e:	fec42783          	lw	a5,-20(s0)
    80005f92:	07a1                	addi	a5,a5,8
    80005f94:	078a                	slli	a5,a5,0x2
    80005f96:	97b6                	add	a5,a5,a3
    80005f98:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80005f9a:	fec42783          	lw	a5,-20(s0)
    80005f9e:	2785                	addiw	a5,a5,1
    80005fa0:	fef42623          	sw	a5,-20(s0)
    80005fa4:	0001e797          	auipc	a5,0x1e
    80005fa8:	b8478793          	addi	a5,a5,-1148 # 80023b28 <log>
    80005fac:	57d8                	lw	a4,44(a5)
    80005fae:	fec42783          	lw	a5,-20(s0)
    80005fb2:	2781                	sext.w	a5,a5
    80005fb4:	fce7c2e3          	blt	a5,a4,80005f78 <read_head+0x54>
  }
  brelse(buf);
    80005fb8:	fe043503          	ld	a0,-32(s0)
    80005fbc:	ffffe097          	auipc	ra,0xffffe
    80005fc0:	736080e7          	jalr	1846(ra) # 800046f2 <brelse>
}
    80005fc4:	0001                	nop
    80005fc6:	70a2                	ld	ra,40(sp)
    80005fc8:	7402                	ld	s0,32(sp)
    80005fca:	6145                	addi	sp,sp,48
    80005fcc:	8082                	ret

0000000080005fce <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80005fce:	7179                	addi	sp,sp,-48
    80005fd0:	f406                	sd	ra,40(sp)
    80005fd2:	f022                	sd	s0,32(sp)
    80005fd4:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80005fd6:	0001e797          	auipc	a5,0x1e
    80005fda:	b5278793          	addi	a5,a5,-1198 # 80023b28 <log>
    80005fde:	579c                	lw	a5,40(a5)
    80005fe0:	0007871b          	sext.w	a4,a5
    80005fe4:	0001e797          	auipc	a5,0x1e
    80005fe8:	b4478793          	addi	a5,a5,-1212 # 80023b28 <log>
    80005fec:	4f9c                	lw	a5,24(a5)
    80005fee:	2781                	sext.w	a5,a5
    80005ff0:	85be                	mv	a1,a5
    80005ff2:	853a                	mv	a0,a4
    80005ff4:	ffffe097          	auipc	ra,0xffffe
    80005ff8:	65c080e7          	jalr	1628(ra) # 80004650 <bread>
    80005ffc:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006000:	fe043783          	ld	a5,-32(s0)
    80006004:	05878793          	addi	a5,a5,88
    80006008:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000600c:	0001e797          	auipc	a5,0x1e
    80006010:	b1c78793          	addi	a5,a5,-1252 # 80023b28 <log>
    80006014:	57d8                	lw	a4,44(a5)
    80006016:	fd843783          	ld	a5,-40(s0)
    8000601a:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000601c:	fe042623          	sw	zero,-20(s0)
    80006020:	a03d                	j	8000604e <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006022:	0001e717          	auipc	a4,0x1e
    80006026:	b0670713          	addi	a4,a4,-1274 # 80023b28 <log>
    8000602a:	fec42783          	lw	a5,-20(s0)
    8000602e:	07a1                	addi	a5,a5,8
    80006030:	078a                	slli	a5,a5,0x2
    80006032:	97ba                	add	a5,a5,a4
    80006034:	4b98                	lw	a4,16(a5)
    80006036:	fd843683          	ld	a3,-40(s0)
    8000603a:	fec42783          	lw	a5,-20(s0)
    8000603e:	078a                	slli	a5,a5,0x2
    80006040:	97b6                	add	a5,a5,a3
    80006042:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006044:	fec42783          	lw	a5,-20(s0)
    80006048:	2785                	addiw	a5,a5,1
    8000604a:	fef42623          	sw	a5,-20(s0)
    8000604e:	0001e797          	auipc	a5,0x1e
    80006052:	ada78793          	addi	a5,a5,-1318 # 80023b28 <log>
    80006056:	57d8                	lw	a4,44(a5)
    80006058:	fec42783          	lw	a5,-20(s0)
    8000605c:	2781                	sext.w	a5,a5
    8000605e:	fce7c2e3          	blt	a5,a4,80006022 <write_head+0x54>
  }
  bwrite(buf);
    80006062:	fe043503          	ld	a0,-32(s0)
    80006066:	ffffe097          	auipc	ra,0xffffe
    8000606a:	644080e7          	jalr	1604(ra) # 800046aa <bwrite>
  brelse(buf);
    8000606e:	fe043503          	ld	a0,-32(s0)
    80006072:	ffffe097          	auipc	ra,0xffffe
    80006076:	680080e7          	jalr	1664(ra) # 800046f2 <brelse>
}
    8000607a:	0001                	nop
    8000607c:	70a2                	ld	ra,40(sp)
    8000607e:	7402                	ld	s0,32(sp)
    80006080:	6145                	addi	sp,sp,48
    80006082:	8082                	ret

0000000080006084 <recover_from_log>:

static void
recover_from_log(void)
{
    80006084:	1141                	addi	sp,sp,-16
    80006086:	e406                	sd	ra,8(sp)
    80006088:	e022                	sd	s0,0(sp)
    8000608a:	0800                	addi	s0,sp,16
  read_head();
    8000608c:	00000097          	auipc	ra,0x0
    80006090:	e98080e7          	jalr	-360(ra) # 80005f24 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006094:	4505                	li	a0,1
    80006096:	00000097          	auipc	ra,0x0
    8000609a:	d8e080e7          	jalr	-626(ra) # 80005e24 <install_trans>
  log.lh.n = 0;
    8000609e:	0001e797          	auipc	a5,0x1e
    800060a2:	a8a78793          	addi	a5,a5,-1398 # 80023b28 <log>
    800060a6:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800060aa:	00000097          	auipc	ra,0x0
    800060ae:	f24080e7          	jalr	-220(ra) # 80005fce <write_head>
}
    800060b2:	0001                	nop
    800060b4:	60a2                	ld	ra,8(sp)
    800060b6:	6402                	ld	s0,0(sp)
    800060b8:	0141                	addi	sp,sp,16
    800060ba:	8082                	ret

00000000800060bc <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800060bc:	1141                	addi	sp,sp,-16
    800060be:	e406                	sd	ra,8(sp)
    800060c0:	e022                	sd	s0,0(sp)
    800060c2:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800060c4:	0001e517          	auipc	a0,0x1e
    800060c8:	a6450513          	addi	a0,a0,-1436 # 80023b28 <log>
    800060cc:	ffffb097          	auipc	ra,0xffffb
    800060d0:	1ac080e7          	jalr	428(ra) # 80001278 <acquire>
  while(1){
    if(log.committing){
    800060d4:	0001e797          	auipc	a5,0x1e
    800060d8:	a5478793          	addi	a5,a5,-1452 # 80023b28 <log>
    800060dc:	53dc                	lw	a5,36(a5)
    800060de:	cf91                	beqz	a5,800060fa <begin_op+0x3e>
      sleep(&log, &log.lock);
    800060e0:	0001e597          	auipc	a1,0x1e
    800060e4:	a4858593          	addi	a1,a1,-1464 # 80023b28 <log>
    800060e8:	0001e517          	auipc	a0,0x1e
    800060ec:	a4050513          	addi	a0,a0,-1472 # 80023b28 <log>
    800060f0:	ffffd097          	auipc	ra,0xffffd
    800060f4:	312080e7          	jalr	786(ra) # 80003402 <sleep>
    800060f8:	bff1                	j	800060d4 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800060fa:	0001e797          	auipc	a5,0x1e
    800060fe:	a2e78793          	addi	a5,a5,-1490 # 80023b28 <log>
    80006102:	57d8                	lw	a4,44(a5)
    80006104:	0001e797          	auipc	a5,0x1e
    80006108:	a2478793          	addi	a5,a5,-1500 # 80023b28 <log>
    8000610c:	539c                	lw	a5,32(a5)
    8000610e:	2785                	addiw	a5,a5,1
    80006110:	2781                	sext.w	a5,a5
    80006112:	86be                	mv	a3,a5
    80006114:	87b6                	mv	a5,a3
    80006116:	0027979b          	slliw	a5,a5,0x2
    8000611a:	9fb5                	addw	a5,a5,a3
    8000611c:	0017979b          	slliw	a5,a5,0x1
    80006120:	2781                	sext.w	a5,a5
    80006122:	9fb9                	addw	a5,a5,a4
    80006124:	2781                	sext.w	a5,a5
    80006126:	873e                	mv	a4,a5
    80006128:	47f9                	li	a5,30
    8000612a:	00e7df63          	bge	a5,a4,80006148 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000612e:	0001e597          	auipc	a1,0x1e
    80006132:	9fa58593          	addi	a1,a1,-1542 # 80023b28 <log>
    80006136:	0001e517          	auipc	a0,0x1e
    8000613a:	9f250513          	addi	a0,a0,-1550 # 80023b28 <log>
    8000613e:	ffffd097          	auipc	ra,0xffffd
    80006142:	2c4080e7          	jalr	708(ra) # 80003402 <sleep>
    80006146:	b779                	j	800060d4 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006148:	0001e797          	auipc	a5,0x1e
    8000614c:	9e078793          	addi	a5,a5,-1568 # 80023b28 <log>
    80006150:	539c                	lw	a5,32(a5)
    80006152:	2785                	addiw	a5,a5,1
    80006154:	0007871b          	sext.w	a4,a5
    80006158:	0001e797          	auipc	a5,0x1e
    8000615c:	9d078793          	addi	a5,a5,-1584 # 80023b28 <log>
    80006160:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006162:	0001e517          	auipc	a0,0x1e
    80006166:	9c650513          	addi	a0,a0,-1594 # 80023b28 <log>
    8000616a:	ffffb097          	auipc	ra,0xffffb
    8000616e:	172080e7          	jalr	370(ra) # 800012dc <release>
      break;
    80006172:	0001                	nop
    }
  }
}
    80006174:	0001                	nop
    80006176:	60a2                	ld	ra,8(sp)
    80006178:	6402                	ld	s0,0(sp)
    8000617a:	0141                	addi	sp,sp,16
    8000617c:	8082                	ret

000000008000617e <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000617e:	1101                	addi	sp,sp,-32
    80006180:	ec06                	sd	ra,24(sp)
    80006182:	e822                	sd	s0,16(sp)
    80006184:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006186:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000618a:	0001e517          	auipc	a0,0x1e
    8000618e:	99e50513          	addi	a0,a0,-1634 # 80023b28 <log>
    80006192:	ffffb097          	auipc	ra,0xffffb
    80006196:	0e6080e7          	jalr	230(ra) # 80001278 <acquire>
  log.outstanding -= 1;
    8000619a:	0001e797          	auipc	a5,0x1e
    8000619e:	98e78793          	addi	a5,a5,-1650 # 80023b28 <log>
    800061a2:	539c                	lw	a5,32(a5)
    800061a4:	37fd                	addiw	a5,a5,-1
    800061a6:	0007871b          	sext.w	a4,a5
    800061aa:	0001e797          	auipc	a5,0x1e
    800061ae:	97e78793          	addi	a5,a5,-1666 # 80023b28 <log>
    800061b2:	d398                	sw	a4,32(a5)
  if(log.committing)
    800061b4:	0001e797          	auipc	a5,0x1e
    800061b8:	97478793          	addi	a5,a5,-1676 # 80023b28 <log>
    800061bc:	53dc                	lw	a5,36(a5)
    800061be:	cb89                	beqz	a5,800061d0 <end_op+0x52>
    panic("log.committing");
    800061c0:	00005517          	auipc	a0,0x5
    800061c4:	38850513          	addi	a0,a0,904 # 8000b548 <etext+0x548>
    800061c8:	ffffb097          	auipc	ra,0xffffb
    800061cc:	ac2080e7          	jalr	-1342(ra) # 80000c8a <panic>
  if(log.outstanding == 0){
    800061d0:	0001e797          	auipc	a5,0x1e
    800061d4:	95878793          	addi	a5,a5,-1704 # 80023b28 <log>
    800061d8:	539c                	lw	a5,32(a5)
    800061da:	eb99                	bnez	a5,800061f0 <end_op+0x72>
    do_commit = 1;
    800061dc:	4785                	li	a5,1
    800061de:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800061e2:	0001e797          	auipc	a5,0x1e
    800061e6:	94678793          	addi	a5,a5,-1722 # 80023b28 <log>
    800061ea:	4705                	li	a4,1
    800061ec:	d3d8                	sw	a4,36(a5)
    800061ee:	a809                	j	80006200 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800061f0:	0001e517          	auipc	a0,0x1e
    800061f4:	93850513          	addi	a0,a0,-1736 # 80023b28 <log>
    800061f8:	ffffd097          	auipc	ra,0xffffd
    800061fc:	286080e7          	jalr	646(ra) # 8000347e <wakeup>
  }
  release(&log.lock);
    80006200:	0001e517          	auipc	a0,0x1e
    80006204:	92850513          	addi	a0,a0,-1752 # 80023b28 <log>
    80006208:	ffffb097          	auipc	ra,0xffffb
    8000620c:	0d4080e7          	jalr	212(ra) # 800012dc <release>

  if(do_commit){
    80006210:	fec42783          	lw	a5,-20(s0)
    80006214:	2781                	sext.w	a5,a5
    80006216:	c3b9                	beqz	a5,8000625c <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	134080e7          	jalr	308(ra) # 8000634c <commit>
    acquire(&log.lock);
    80006220:	0001e517          	auipc	a0,0x1e
    80006224:	90850513          	addi	a0,a0,-1784 # 80023b28 <log>
    80006228:	ffffb097          	auipc	ra,0xffffb
    8000622c:	050080e7          	jalr	80(ra) # 80001278 <acquire>
    log.committing = 0;
    80006230:	0001e797          	auipc	a5,0x1e
    80006234:	8f878793          	addi	a5,a5,-1800 # 80023b28 <log>
    80006238:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000623c:	0001e517          	auipc	a0,0x1e
    80006240:	8ec50513          	addi	a0,a0,-1812 # 80023b28 <log>
    80006244:	ffffd097          	auipc	ra,0xffffd
    80006248:	23a080e7          	jalr	570(ra) # 8000347e <wakeup>
    release(&log.lock);
    8000624c:	0001e517          	auipc	a0,0x1e
    80006250:	8dc50513          	addi	a0,a0,-1828 # 80023b28 <log>
    80006254:	ffffb097          	auipc	ra,0xffffb
    80006258:	088080e7          	jalr	136(ra) # 800012dc <release>
  }
}
    8000625c:	0001                	nop
    8000625e:	60e2                	ld	ra,24(sp)
    80006260:	6442                	ld	s0,16(sp)
    80006262:	6105                	addi	sp,sp,32
    80006264:	8082                	ret

0000000080006266 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006266:	7179                	addi	sp,sp,-48
    80006268:	f406                	sd	ra,40(sp)
    8000626a:	f022                	sd	s0,32(sp)
    8000626c:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000626e:	fe042623          	sw	zero,-20(s0)
    80006272:	a86d                	j	8000632c <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006274:	0001e797          	auipc	a5,0x1e
    80006278:	8b478793          	addi	a5,a5,-1868 # 80023b28 <log>
    8000627c:	579c                	lw	a5,40(a5)
    8000627e:	0007871b          	sext.w	a4,a5
    80006282:	0001e797          	auipc	a5,0x1e
    80006286:	8a678793          	addi	a5,a5,-1882 # 80023b28 <log>
    8000628a:	4f9c                	lw	a5,24(a5)
    8000628c:	fec42683          	lw	a3,-20(s0)
    80006290:	9fb5                	addw	a5,a5,a3
    80006292:	2781                	sext.w	a5,a5
    80006294:	2785                	addiw	a5,a5,1
    80006296:	2781                	sext.w	a5,a5
    80006298:	2781                	sext.w	a5,a5
    8000629a:	85be                	mv	a1,a5
    8000629c:	853a                	mv	a0,a4
    8000629e:	ffffe097          	auipc	ra,0xffffe
    800062a2:	3b2080e7          	jalr	946(ra) # 80004650 <bread>
    800062a6:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800062aa:	0001e797          	auipc	a5,0x1e
    800062ae:	87e78793          	addi	a5,a5,-1922 # 80023b28 <log>
    800062b2:	579c                	lw	a5,40(a5)
    800062b4:	0007869b          	sext.w	a3,a5
    800062b8:	0001e717          	auipc	a4,0x1e
    800062bc:	87070713          	addi	a4,a4,-1936 # 80023b28 <log>
    800062c0:	fec42783          	lw	a5,-20(s0)
    800062c4:	07a1                	addi	a5,a5,8
    800062c6:	078a                	slli	a5,a5,0x2
    800062c8:	97ba                	add	a5,a5,a4
    800062ca:	4b9c                	lw	a5,16(a5)
    800062cc:	2781                	sext.w	a5,a5
    800062ce:	85be                	mv	a1,a5
    800062d0:	8536                	mv	a0,a3
    800062d2:	ffffe097          	auipc	ra,0xffffe
    800062d6:	37e080e7          	jalr	894(ra) # 80004650 <bread>
    800062da:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800062de:	fe043783          	ld	a5,-32(s0)
    800062e2:	05878713          	addi	a4,a5,88
    800062e6:	fd843783          	ld	a5,-40(s0)
    800062ea:	05878793          	addi	a5,a5,88
    800062ee:	40000613          	li	a2,1024
    800062f2:	85be                	mv	a1,a5
    800062f4:	853a                	mv	a0,a4
    800062f6:	ffffb097          	auipc	ra,0xffffb
    800062fa:	23a080e7          	jalr	570(ra) # 80001530 <memmove>
    bwrite(to);  // write the log
    800062fe:	fe043503          	ld	a0,-32(s0)
    80006302:	ffffe097          	auipc	ra,0xffffe
    80006306:	3a8080e7          	jalr	936(ra) # 800046aa <bwrite>
    brelse(from);
    8000630a:	fd843503          	ld	a0,-40(s0)
    8000630e:	ffffe097          	auipc	ra,0xffffe
    80006312:	3e4080e7          	jalr	996(ra) # 800046f2 <brelse>
    brelse(to);
    80006316:	fe043503          	ld	a0,-32(s0)
    8000631a:	ffffe097          	auipc	ra,0xffffe
    8000631e:	3d8080e7          	jalr	984(ra) # 800046f2 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006322:	fec42783          	lw	a5,-20(s0)
    80006326:	2785                	addiw	a5,a5,1
    80006328:	fef42623          	sw	a5,-20(s0)
    8000632c:	0001d797          	auipc	a5,0x1d
    80006330:	7fc78793          	addi	a5,a5,2044 # 80023b28 <log>
    80006334:	57d8                	lw	a4,44(a5)
    80006336:	fec42783          	lw	a5,-20(s0)
    8000633a:	2781                	sext.w	a5,a5
    8000633c:	f2e7cce3          	blt	a5,a4,80006274 <write_log+0xe>
  }
}
    80006340:	0001                	nop
    80006342:	0001                	nop
    80006344:	70a2                	ld	ra,40(sp)
    80006346:	7402                	ld	s0,32(sp)
    80006348:	6145                	addi	sp,sp,48
    8000634a:	8082                	ret

000000008000634c <commit>:

static void
commit()
{
    8000634c:	1141                	addi	sp,sp,-16
    8000634e:	e406                	sd	ra,8(sp)
    80006350:	e022                	sd	s0,0(sp)
    80006352:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006354:	0001d797          	auipc	a5,0x1d
    80006358:	7d478793          	addi	a5,a5,2004 # 80023b28 <log>
    8000635c:	57dc                	lw	a5,44(a5)
    8000635e:	02f05963          	blez	a5,80006390 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006362:	00000097          	auipc	ra,0x0
    80006366:	f04080e7          	jalr	-252(ra) # 80006266 <write_log>
    write_head();    // Write header to disk -- the real commit
    8000636a:	00000097          	auipc	ra,0x0
    8000636e:	c64080e7          	jalr	-924(ra) # 80005fce <write_head>
    install_trans(0); // Now install writes to home locations
    80006372:	4501                	li	a0,0
    80006374:	00000097          	auipc	ra,0x0
    80006378:	ab0080e7          	jalr	-1360(ra) # 80005e24 <install_trans>
    log.lh.n = 0;
    8000637c:	0001d797          	auipc	a5,0x1d
    80006380:	7ac78793          	addi	a5,a5,1964 # 80023b28 <log>
    80006384:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006388:	00000097          	auipc	ra,0x0
    8000638c:	c46080e7          	jalr	-954(ra) # 80005fce <write_head>
  }
}
    80006390:	0001                	nop
    80006392:	60a2                	ld	ra,8(sp)
    80006394:	6402                	ld	s0,0(sp)
    80006396:	0141                	addi	sp,sp,16
    80006398:	8082                	ret

000000008000639a <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000639a:	7179                	addi	sp,sp,-48
    8000639c:	f406                	sd	ra,40(sp)
    8000639e:	f022                	sd	s0,32(sp)
    800063a0:	1800                	addi	s0,sp,48
    800063a2:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    800063a6:	0001d517          	auipc	a0,0x1d
    800063aa:	78250513          	addi	a0,a0,1922 # 80023b28 <log>
    800063ae:	ffffb097          	auipc	ra,0xffffb
    800063b2:	eca080e7          	jalr	-310(ra) # 80001278 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800063b6:	0001d797          	auipc	a5,0x1d
    800063ba:	77278793          	addi	a5,a5,1906 # 80023b28 <log>
    800063be:	57dc                	lw	a5,44(a5)
    800063c0:	873e                	mv	a4,a5
    800063c2:	47f5                	li	a5,29
    800063c4:	02e7c063          	blt	a5,a4,800063e4 <log_write+0x4a>
    800063c8:	0001d797          	auipc	a5,0x1d
    800063cc:	76078793          	addi	a5,a5,1888 # 80023b28 <log>
    800063d0:	57d8                	lw	a4,44(a5)
    800063d2:	0001d797          	auipc	a5,0x1d
    800063d6:	75678793          	addi	a5,a5,1878 # 80023b28 <log>
    800063da:	4fdc                	lw	a5,28(a5)
    800063dc:	37fd                	addiw	a5,a5,-1
    800063de:	2781                	sext.w	a5,a5
    800063e0:	00f74a63          	blt	a4,a5,800063f4 <log_write+0x5a>
    panic("too big a transaction");
    800063e4:	00005517          	auipc	a0,0x5
    800063e8:	17450513          	addi	a0,a0,372 # 8000b558 <etext+0x558>
    800063ec:	ffffb097          	auipc	ra,0xffffb
    800063f0:	89e080e7          	jalr	-1890(ra) # 80000c8a <panic>
  if (log.outstanding < 1)
    800063f4:	0001d797          	auipc	a5,0x1d
    800063f8:	73478793          	addi	a5,a5,1844 # 80023b28 <log>
    800063fc:	539c                	lw	a5,32(a5)
    800063fe:	00f04a63          	bgtz	a5,80006412 <log_write+0x78>
    panic("log_write outside of trans");
    80006402:	00005517          	auipc	a0,0x5
    80006406:	16e50513          	addi	a0,a0,366 # 8000b570 <etext+0x570>
    8000640a:	ffffb097          	auipc	ra,0xffffb
    8000640e:	880080e7          	jalr	-1920(ra) # 80000c8a <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006412:	fe042623          	sw	zero,-20(s0)
    80006416:	a03d                	j	80006444 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006418:	0001d717          	auipc	a4,0x1d
    8000641c:	71070713          	addi	a4,a4,1808 # 80023b28 <log>
    80006420:	fec42783          	lw	a5,-20(s0)
    80006424:	07a1                	addi	a5,a5,8
    80006426:	078a                	slli	a5,a5,0x2
    80006428:	97ba                	add	a5,a5,a4
    8000642a:	4b9c                	lw	a5,16(a5)
    8000642c:	0007871b          	sext.w	a4,a5
    80006430:	fd843783          	ld	a5,-40(s0)
    80006434:	47dc                	lw	a5,12(a5)
    80006436:	02f70263          	beq	a4,a5,8000645a <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    8000643a:	fec42783          	lw	a5,-20(s0)
    8000643e:	2785                	addiw	a5,a5,1
    80006440:	fef42623          	sw	a5,-20(s0)
    80006444:	0001d797          	auipc	a5,0x1d
    80006448:	6e478793          	addi	a5,a5,1764 # 80023b28 <log>
    8000644c:	57d8                	lw	a4,44(a5)
    8000644e:	fec42783          	lw	a5,-20(s0)
    80006452:	2781                	sext.w	a5,a5
    80006454:	fce7c2e3          	blt	a5,a4,80006418 <log_write+0x7e>
    80006458:	a011                	j	8000645c <log_write+0xc2>
      break;
    8000645a:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000645c:	fd843783          	ld	a5,-40(s0)
    80006460:	47dc                	lw	a5,12(a5)
    80006462:	0007871b          	sext.w	a4,a5
    80006466:	0001d697          	auipc	a3,0x1d
    8000646a:	6c268693          	addi	a3,a3,1730 # 80023b28 <log>
    8000646e:	fec42783          	lw	a5,-20(s0)
    80006472:	07a1                	addi	a5,a5,8
    80006474:	078a                	slli	a5,a5,0x2
    80006476:	97b6                	add	a5,a5,a3
    80006478:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    8000647a:	0001d797          	auipc	a5,0x1d
    8000647e:	6ae78793          	addi	a5,a5,1710 # 80023b28 <log>
    80006482:	57d8                	lw	a4,44(a5)
    80006484:	fec42783          	lw	a5,-20(s0)
    80006488:	2781                	sext.w	a5,a5
    8000648a:	02e79563          	bne	a5,a4,800064b4 <log_write+0x11a>
    bpin(b);
    8000648e:	fd843503          	ld	a0,-40(s0)
    80006492:	ffffe097          	auipc	ra,0xffffe
    80006496:	34e080e7          	jalr	846(ra) # 800047e0 <bpin>
    log.lh.n++;
    8000649a:	0001d797          	auipc	a5,0x1d
    8000649e:	68e78793          	addi	a5,a5,1678 # 80023b28 <log>
    800064a2:	57dc                	lw	a5,44(a5)
    800064a4:	2785                	addiw	a5,a5,1
    800064a6:	0007871b          	sext.w	a4,a5
    800064aa:	0001d797          	auipc	a5,0x1d
    800064ae:	67e78793          	addi	a5,a5,1662 # 80023b28 <log>
    800064b2:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800064b4:	0001d517          	auipc	a0,0x1d
    800064b8:	67450513          	addi	a0,a0,1652 # 80023b28 <log>
    800064bc:	ffffb097          	auipc	ra,0xffffb
    800064c0:	e20080e7          	jalr	-480(ra) # 800012dc <release>
}
    800064c4:	0001                	nop
    800064c6:	70a2                	ld	ra,40(sp)
    800064c8:	7402                	ld	s0,32(sp)
    800064ca:	6145                	addi	sp,sp,48
    800064cc:	8082                	ret

00000000800064ce <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    800064ce:	1101                	addi	sp,sp,-32
    800064d0:	ec06                	sd	ra,24(sp)
    800064d2:	e822                	sd	s0,16(sp)
    800064d4:	1000                	addi	s0,sp,32
    800064d6:	fea43423          	sd	a0,-24(s0)
    800064da:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800064de:	fe843783          	ld	a5,-24(s0)
    800064e2:	07a1                	addi	a5,a5,8
    800064e4:	00005597          	auipc	a1,0x5
    800064e8:	0ac58593          	addi	a1,a1,172 # 8000b590 <etext+0x590>
    800064ec:	853e                	mv	a0,a5
    800064ee:	ffffb097          	auipc	ra,0xffffb
    800064f2:	d5a080e7          	jalr	-678(ra) # 80001248 <initlock>
  lk->name = name;
    800064f6:	fe843783          	ld	a5,-24(s0)
    800064fa:	fe043703          	ld	a4,-32(s0)
    800064fe:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006500:	fe843783          	ld	a5,-24(s0)
    80006504:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006508:	fe843783          	ld	a5,-24(s0)
    8000650c:	0207a423          	sw	zero,40(a5)
}
    80006510:	0001                	nop
    80006512:	60e2                	ld	ra,24(sp)
    80006514:	6442                	ld	s0,16(sp)
    80006516:	6105                	addi	sp,sp,32
    80006518:	8082                	ret

000000008000651a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8000651a:	1101                	addi	sp,sp,-32
    8000651c:	ec06                	sd	ra,24(sp)
    8000651e:	e822                	sd	s0,16(sp)
    80006520:	1000                	addi	s0,sp,32
    80006522:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006526:	fe843783          	ld	a5,-24(s0)
    8000652a:	07a1                	addi	a5,a5,8
    8000652c:	853e                	mv	a0,a5
    8000652e:	ffffb097          	auipc	ra,0xffffb
    80006532:	d4a080e7          	jalr	-694(ra) # 80001278 <acquire>
  while (lk->locked) {
    80006536:	a819                	j	8000654c <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006538:	fe843783          	ld	a5,-24(s0)
    8000653c:	07a1                	addi	a5,a5,8
    8000653e:	85be                	mv	a1,a5
    80006540:	fe843503          	ld	a0,-24(s0)
    80006544:	ffffd097          	auipc	ra,0xffffd
    80006548:	ebe080e7          	jalr	-322(ra) # 80003402 <sleep>
  while (lk->locked) {
    8000654c:	fe843783          	ld	a5,-24(s0)
    80006550:	439c                	lw	a5,0(a5)
    80006552:	f3fd                	bnez	a5,80006538 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006554:	fe843783          	ld	a5,-24(s0)
    80006558:	4705                	li	a4,1
    8000655a:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000655c:	ffffc097          	auipc	ra,0xffffc
    80006560:	2e4080e7          	jalr	740(ra) # 80002840 <myproc>
    80006564:	87aa                	mv	a5,a0
    80006566:	5b98                	lw	a4,48(a5)
    80006568:	fe843783          	ld	a5,-24(s0)
    8000656c:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    8000656e:	fe843783          	ld	a5,-24(s0)
    80006572:	07a1                	addi	a5,a5,8
    80006574:	853e                	mv	a0,a5
    80006576:	ffffb097          	auipc	ra,0xffffb
    8000657a:	d66080e7          	jalr	-666(ra) # 800012dc <release>
}
    8000657e:	0001                	nop
    80006580:	60e2                	ld	ra,24(sp)
    80006582:	6442                	ld	s0,16(sp)
    80006584:	6105                	addi	sp,sp,32
    80006586:	8082                	ret

0000000080006588 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006588:	1101                	addi	sp,sp,-32
    8000658a:	ec06                	sd	ra,24(sp)
    8000658c:	e822                	sd	s0,16(sp)
    8000658e:	1000                	addi	s0,sp,32
    80006590:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006594:	fe843783          	ld	a5,-24(s0)
    80006598:	07a1                	addi	a5,a5,8
    8000659a:	853e                	mv	a0,a5
    8000659c:	ffffb097          	auipc	ra,0xffffb
    800065a0:	cdc080e7          	jalr	-804(ra) # 80001278 <acquire>
  lk->locked = 0;
    800065a4:	fe843783          	ld	a5,-24(s0)
    800065a8:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800065ac:	fe843783          	ld	a5,-24(s0)
    800065b0:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800065b4:	fe843503          	ld	a0,-24(s0)
    800065b8:	ffffd097          	auipc	ra,0xffffd
    800065bc:	ec6080e7          	jalr	-314(ra) # 8000347e <wakeup>
  release(&lk->lk);
    800065c0:	fe843783          	ld	a5,-24(s0)
    800065c4:	07a1                	addi	a5,a5,8
    800065c6:	853e                	mv	a0,a5
    800065c8:	ffffb097          	auipc	ra,0xffffb
    800065cc:	d14080e7          	jalr	-748(ra) # 800012dc <release>
}
    800065d0:	0001                	nop
    800065d2:	60e2                	ld	ra,24(sp)
    800065d4:	6442                	ld	s0,16(sp)
    800065d6:	6105                	addi	sp,sp,32
    800065d8:	8082                	ret

00000000800065da <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800065da:	7139                	addi	sp,sp,-64
    800065dc:	fc06                	sd	ra,56(sp)
    800065de:	f822                	sd	s0,48(sp)
    800065e0:	f426                	sd	s1,40(sp)
    800065e2:	0080                	addi	s0,sp,64
    800065e4:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800065e8:	fc843783          	ld	a5,-56(s0)
    800065ec:	07a1                	addi	a5,a5,8
    800065ee:	853e                	mv	a0,a5
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	c88080e7          	jalr	-888(ra) # 80001278 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800065f8:	fc843783          	ld	a5,-56(s0)
    800065fc:	439c                	lw	a5,0(a5)
    800065fe:	cf99                	beqz	a5,8000661c <holdingsleep+0x42>
    80006600:	fc843783          	ld	a5,-56(s0)
    80006604:	5784                	lw	s1,40(a5)
    80006606:	ffffc097          	auipc	ra,0xffffc
    8000660a:	23a080e7          	jalr	570(ra) # 80002840 <myproc>
    8000660e:	87aa                	mv	a5,a0
    80006610:	5b9c                	lw	a5,48(a5)
    80006612:	8726                	mv	a4,s1
    80006614:	00f71463          	bne	a4,a5,8000661c <holdingsleep+0x42>
    80006618:	4785                	li	a5,1
    8000661a:	a011                	j	8000661e <holdingsleep+0x44>
    8000661c:	4781                	li	a5,0
    8000661e:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006622:	fc843783          	ld	a5,-56(s0)
    80006626:	07a1                	addi	a5,a5,8
    80006628:	853e                	mv	a0,a5
    8000662a:	ffffb097          	auipc	ra,0xffffb
    8000662e:	cb2080e7          	jalr	-846(ra) # 800012dc <release>
  return r;
    80006632:	fdc42783          	lw	a5,-36(s0)
}
    80006636:	853e                	mv	a0,a5
    80006638:	70e2                	ld	ra,56(sp)
    8000663a:	7442                	ld	s0,48(sp)
    8000663c:	74a2                	ld	s1,40(sp)
    8000663e:	6121                	addi	sp,sp,64
    80006640:	8082                	ret

0000000080006642 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006642:	1141                	addi	sp,sp,-16
    80006644:	e406                	sd	ra,8(sp)
    80006646:	e022                	sd	s0,0(sp)
    80006648:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    8000664a:	00005597          	auipc	a1,0x5
    8000664e:	f5658593          	addi	a1,a1,-170 # 8000b5a0 <etext+0x5a0>
    80006652:	0001d517          	auipc	a0,0x1d
    80006656:	61e50513          	addi	a0,a0,1566 # 80023c70 <ftable>
    8000665a:	ffffb097          	auipc	ra,0xffffb
    8000665e:	bee080e7          	jalr	-1042(ra) # 80001248 <initlock>
}
    80006662:	0001                	nop
    80006664:	60a2                	ld	ra,8(sp)
    80006666:	6402                	ld	s0,0(sp)
    80006668:	0141                	addi	sp,sp,16
    8000666a:	8082                	ret

000000008000666c <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    8000666c:	1101                	addi	sp,sp,-32
    8000666e:	ec06                	sd	ra,24(sp)
    80006670:	e822                	sd	s0,16(sp)
    80006672:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006674:	0001d517          	auipc	a0,0x1d
    80006678:	5fc50513          	addi	a0,a0,1532 # 80023c70 <ftable>
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	bfc080e7          	jalr	-1028(ra) # 80001278 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006684:	0001d797          	auipc	a5,0x1d
    80006688:	60478793          	addi	a5,a5,1540 # 80023c88 <ftable+0x18>
    8000668c:	fef43423          	sd	a5,-24(s0)
    80006690:	a815                	j	800066c4 <filealloc+0x58>
    if(f->ref == 0){
    80006692:	fe843783          	ld	a5,-24(s0)
    80006696:	43dc                	lw	a5,4(a5)
    80006698:	e385                	bnez	a5,800066b8 <filealloc+0x4c>
      f->ref = 1;
    8000669a:	fe843783          	ld	a5,-24(s0)
    8000669e:	4705                	li	a4,1
    800066a0:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    800066a2:	0001d517          	auipc	a0,0x1d
    800066a6:	5ce50513          	addi	a0,a0,1486 # 80023c70 <ftable>
    800066aa:	ffffb097          	auipc	ra,0xffffb
    800066ae:	c32080e7          	jalr	-974(ra) # 800012dc <release>
      return f;
    800066b2:	fe843783          	ld	a5,-24(s0)
    800066b6:	a805                	j	800066e6 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800066b8:	fe843783          	ld	a5,-24(s0)
    800066bc:	02878793          	addi	a5,a5,40
    800066c0:	fef43423          	sd	a5,-24(s0)
    800066c4:	0001e797          	auipc	a5,0x1e
    800066c8:	56478793          	addi	a5,a5,1380 # 80024c28 <disk>
    800066cc:	fe843703          	ld	a4,-24(s0)
    800066d0:	fcf761e3          	bltu	a4,a5,80006692 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800066d4:	0001d517          	auipc	a0,0x1d
    800066d8:	59c50513          	addi	a0,a0,1436 # 80023c70 <ftable>
    800066dc:	ffffb097          	auipc	ra,0xffffb
    800066e0:	c00080e7          	jalr	-1024(ra) # 800012dc <release>
  return 0;
    800066e4:	4781                	li	a5,0
}
    800066e6:	853e                	mv	a0,a5
    800066e8:	60e2                	ld	ra,24(sp)
    800066ea:	6442                	ld	s0,16(sp)
    800066ec:	6105                	addi	sp,sp,32
    800066ee:	8082                	ret

00000000800066f0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800066f0:	1101                	addi	sp,sp,-32
    800066f2:	ec06                	sd	ra,24(sp)
    800066f4:	e822                	sd	s0,16(sp)
    800066f6:	1000                	addi	s0,sp,32
    800066f8:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800066fc:	0001d517          	auipc	a0,0x1d
    80006700:	57450513          	addi	a0,a0,1396 # 80023c70 <ftable>
    80006704:	ffffb097          	auipc	ra,0xffffb
    80006708:	b74080e7          	jalr	-1164(ra) # 80001278 <acquire>
  if(f->ref < 1)
    8000670c:	fe843783          	ld	a5,-24(s0)
    80006710:	43dc                	lw	a5,4(a5)
    80006712:	00f04a63          	bgtz	a5,80006726 <filedup+0x36>
    panic("filedup");
    80006716:	00005517          	auipc	a0,0x5
    8000671a:	e9250513          	addi	a0,a0,-366 # 8000b5a8 <etext+0x5a8>
    8000671e:	ffffa097          	auipc	ra,0xffffa
    80006722:	56c080e7          	jalr	1388(ra) # 80000c8a <panic>
  f->ref++;
    80006726:	fe843783          	ld	a5,-24(s0)
    8000672a:	43dc                	lw	a5,4(a5)
    8000672c:	2785                	addiw	a5,a5,1
    8000672e:	0007871b          	sext.w	a4,a5
    80006732:	fe843783          	ld	a5,-24(s0)
    80006736:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006738:	0001d517          	auipc	a0,0x1d
    8000673c:	53850513          	addi	a0,a0,1336 # 80023c70 <ftable>
    80006740:	ffffb097          	auipc	ra,0xffffb
    80006744:	b9c080e7          	jalr	-1124(ra) # 800012dc <release>
  return f;
    80006748:	fe843783          	ld	a5,-24(s0)
}
    8000674c:	853e                	mv	a0,a5
    8000674e:	60e2                	ld	ra,24(sp)
    80006750:	6442                	ld	s0,16(sp)
    80006752:	6105                	addi	sp,sp,32
    80006754:	8082                	ret

0000000080006756 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006756:	715d                	addi	sp,sp,-80
    80006758:	e486                	sd	ra,72(sp)
    8000675a:	e0a2                	sd	s0,64(sp)
    8000675c:	0880                	addi	s0,sp,80
    8000675e:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006762:	0001d517          	auipc	a0,0x1d
    80006766:	50e50513          	addi	a0,a0,1294 # 80023c70 <ftable>
    8000676a:	ffffb097          	auipc	ra,0xffffb
    8000676e:	b0e080e7          	jalr	-1266(ra) # 80001278 <acquire>
  if(f->ref < 1)
    80006772:	fb843783          	ld	a5,-72(s0)
    80006776:	43dc                	lw	a5,4(a5)
    80006778:	00f04a63          	bgtz	a5,8000678c <fileclose+0x36>
    panic("fileclose");
    8000677c:	00005517          	auipc	a0,0x5
    80006780:	e3450513          	addi	a0,a0,-460 # 8000b5b0 <etext+0x5b0>
    80006784:	ffffa097          	auipc	ra,0xffffa
    80006788:	506080e7          	jalr	1286(ra) # 80000c8a <panic>
  if(--f->ref > 0){
    8000678c:	fb843783          	ld	a5,-72(s0)
    80006790:	43dc                	lw	a5,4(a5)
    80006792:	37fd                	addiw	a5,a5,-1
    80006794:	0007871b          	sext.w	a4,a5
    80006798:	fb843783          	ld	a5,-72(s0)
    8000679c:	c3d8                	sw	a4,4(a5)
    8000679e:	fb843783          	ld	a5,-72(s0)
    800067a2:	43dc                	lw	a5,4(a5)
    800067a4:	00f05b63          	blez	a5,800067ba <fileclose+0x64>
    release(&ftable.lock);
    800067a8:	0001d517          	auipc	a0,0x1d
    800067ac:	4c850513          	addi	a0,a0,1224 # 80023c70 <ftable>
    800067b0:	ffffb097          	auipc	ra,0xffffb
    800067b4:	b2c080e7          	jalr	-1236(ra) # 800012dc <release>
    800067b8:	a879                	j	80006856 <fileclose+0x100>
    return;
  }
  ff = *f;
    800067ba:	fb843783          	ld	a5,-72(s0)
    800067be:	638c                	ld	a1,0(a5)
    800067c0:	6790                	ld	a2,8(a5)
    800067c2:	6b94                	ld	a3,16(a5)
    800067c4:	6f98                	ld	a4,24(a5)
    800067c6:	739c                	ld	a5,32(a5)
    800067c8:	fcb43423          	sd	a1,-56(s0)
    800067cc:	fcc43823          	sd	a2,-48(s0)
    800067d0:	fcd43c23          	sd	a3,-40(s0)
    800067d4:	fee43023          	sd	a4,-32(s0)
    800067d8:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    800067dc:	fb843783          	ld	a5,-72(s0)
    800067e0:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    800067e4:	fb843783          	ld	a5,-72(s0)
    800067e8:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    800067ec:	0001d517          	auipc	a0,0x1d
    800067f0:	48450513          	addi	a0,a0,1156 # 80023c70 <ftable>
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	ae8080e7          	jalr	-1304(ra) # 800012dc <release>

  if(ff.type == FD_PIPE){
    800067fc:	fc842783          	lw	a5,-56(s0)
    80006800:	873e                	mv	a4,a5
    80006802:	4785                	li	a5,1
    80006804:	00f71e63          	bne	a4,a5,80006820 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006808:	fd843783          	ld	a5,-40(s0)
    8000680c:	fd144703          	lbu	a4,-47(s0)
    80006810:	2701                	sext.w	a4,a4
    80006812:	85ba                	mv	a1,a4
    80006814:	853e                	mv	a0,a5
    80006816:	00000097          	auipc	ra,0x0
    8000681a:	5b6080e7          	jalr	1462(ra) # 80006dcc <pipeclose>
    8000681e:	a825                	j	80006856 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006820:	fc842783          	lw	a5,-56(s0)
    80006824:	873e                	mv	a4,a5
    80006826:	4789                	li	a5,2
    80006828:	00f70863          	beq	a4,a5,80006838 <fileclose+0xe2>
    8000682c:	fc842783          	lw	a5,-56(s0)
    80006830:	873e                	mv	a4,a5
    80006832:	478d                	li	a5,3
    80006834:	02f71163          	bne	a4,a5,80006856 <fileclose+0x100>
    begin_op();
    80006838:	00000097          	auipc	ra,0x0
    8000683c:	884080e7          	jalr	-1916(ra) # 800060bc <begin_op>
    iput(ff.ip);
    80006840:	fe043783          	ld	a5,-32(s0)
    80006844:	853e                	mv	a0,a5
    80006846:	fffff097          	auipc	ra,0xfffff
    8000684a:	96c080e7          	jalr	-1684(ra) # 800051b2 <iput>
    end_op();
    8000684e:	00000097          	auipc	ra,0x0
    80006852:	930080e7          	jalr	-1744(ra) # 8000617e <end_op>
  }
}
    80006856:	60a6                	ld	ra,72(sp)
    80006858:	6406                	ld	s0,64(sp)
    8000685a:	6161                	addi	sp,sp,80
    8000685c:	8082                	ret

000000008000685e <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    8000685e:	7139                	addi	sp,sp,-64
    80006860:	fc06                	sd	ra,56(sp)
    80006862:	f822                	sd	s0,48(sp)
    80006864:	0080                	addi	s0,sp,64
    80006866:	fca43423          	sd	a0,-56(s0)
    8000686a:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    8000686e:	ffffc097          	auipc	ra,0xffffc
    80006872:	fd2080e7          	jalr	-46(ra) # 80002840 <myproc>
    80006876:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    8000687a:	fc843783          	ld	a5,-56(s0)
    8000687e:	439c                	lw	a5,0(a5)
    80006880:	873e                	mv	a4,a5
    80006882:	4789                	li	a5,2
    80006884:	00f70963          	beq	a4,a5,80006896 <filestat+0x38>
    80006888:	fc843783          	ld	a5,-56(s0)
    8000688c:	439c                	lw	a5,0(a5)
    8000688e:	873e                	mv	a4,a5
    80006890:	478d                	li	a5,3
    80006892:	06f71263          	bne	a4,a5,800068f6 <filestat+0x98>
    ilock(f->ip);
    80006896:	fc843783          	ld	a5,-56(s0)
    8000689a:	6f9c                	ld	a5,24(a5)
    8000689c:	853e                	mv	a0,a5
    8000689e:	ffffe097          	auipc	ra,0xffffe
    800068a2:	786080e7          	jalr	1926(ra) # 80005024 <ilock>
    stati(f->ip, &st);
    800068a6:	fc843783          	ld	a5,-56(s0)
    800068aa:	6f9c                	ld	a5,24(a5)
    800068ac:	fd040713          	addi	a4,s0,-48
    800068b0:	85ba                	mv	a1,a4
    800068b2:	853e                	mv	a0,a5
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	cc2080e7          	jalr	-830(ra) # 80005576 <stati>
    iunlock(f->ip);
    800068bc:	fc843783          	ld	a5,-56(s0)
    800068c0:	6f9c                	ld	a5,24(a5)
    800068c2:	853e                	mv	a0,a5
    800068c4:	fffff097          	auipc	ra,0xfffff
    800068c8:	894080e7          	jalr	-1900(ra) # 80005158 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    800068cc:	fe843783          	ld	a5,-24(s0)
    800068d0:	6bbc                	ld	a5,80(a5)
    800068d2:	fd040713          	addi	a4,s0,-48
    800068d6:	46e1                	li	a3,24
    800068d8:	863a                	mv	a2,a4
    800068da:	fc043583          	ld	a1,-64(s0)
    800068de:	853e                	mv	a0,a5
    800068e0:	ffffc097          	auipc	ra,0xffffc
    800068e4:	a2a080e7          	jalr	-1494(ra) # 8000230a <copyout>
    800068e8:	87aa                	mv	a5,a0
    800068ea:	0007d463          	bgez	a5,800068f2 <filestat+0x94>
      return -1;
    800068ee:	57fd                	li	a5,-1
    800068f0:	a021                	j	800068f8 <filestat+0x9a>
    return 0;
    800068f2:	4781                	li	a5,0
    800068f4:	a011                	j	800068f8 <filestat+0x9a>
  }
  return -1;
    800068f6:	57fd                	li	a5,-1
}
    800068f8:	853e                	mv	a0,a5
    800068fa:	70e2                	ld	ra,56(sp)
    800068fc:	7442                	ld	s0,48(sp)
    800068fe:	6121                	addi	sp,sp,64
    80006900:	8082                	ret

0000000080006902 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006902:	7139                	addi	sp,sp,-64
    80006904:	fc06                	sd	ra,56(sp)
    80006906:	f822                	sd	s0,48(sp)
    80006908:	0080                	addi	s0,sp,64
    8000690a:	fca43c23          	sd	a0,-40(s0)
    8000690e:	fcb43823          	sd	a1,-48(s0)
    80006912:	87b2                	mv	a5,a2
    80006914:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006918:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    8000691c:	fd843783          	ld	a5,-40(s0)
    80006920:	0087c783          	lbu	a5,8(a5)
    80006924:	e399                	bnez	a5,8000692a <fileread+0x28>
    return -1;
    80006926:	57fd                	li	a5,-1
    80006928:	aa1d                	j	80006a5e <fileread+0x15c>

  if(f->type == FD_PIPE){
    8000692a:	fd843783          	ld	a5,-40(s0)
    8000692e:	439c                	lw	a5,0(a5)
    80006930:	873e                	mv	a4,a5
    80006932:	4785                	li	a5,1
    80006934:	02f71363          	bne	a4,a5,8000695a <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006938:	fd843783          	ld	a5,-40(s0)
    8000693c:	6b9c                	ld	a5,16(a5)
    8000693e:	fcc42703          	lw	a4,-52(s0)
    80006942:	863a                	mv	a2,a4
    80006944:	fd043583          	ld	a1,-48(s0)
    80006948:	853e                	mv	a0,a5
    8000694a:	00000097          	auipc	ra,0x0
    8000694e:	67e080e7          	jalr	1662(ra) # 80006fc8 <piperead>
    80006952:	87aa                	mv	a5,a0
    80006954:	fef42623          	sw	a5,-20(s0)
    80006958:	a209                	j	80006a5a <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    8000695a:	fd843783          	ld	a5,-40(s0)
    8000695e:	439c                	lw	a5,0(a5)
    80006960:	873e                	mv	a4,a5
    80006962:	478d                	li	a5,3
    80006964:	06f71863          	bne	a4,a5,800069d4 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006968:	fd843783          	ld	a5,-40(s0)
    8000696c:	02479783          	lh	a5,36(a5)
    80006970:	2781                	sext.w	a5,a5
    80006972:	0207c863          	bltz	a5,800069a2 <fileread+0xa0>
    80006976:	fd843783          	ld	a5,-40(s0)
    8000697a:	02479783          	lh	a5,36(a5)
    8000697e:	0007871b          	sext.w	a4,a5
    80006982:	47a5                	li	a5,9
    80006984:	00e7cf63          	blt	a5,a4,800069a2 <fileread+0xa0>
    80006988:	fd843783          	ld	a5,-40(s0)
    8000698c:	02479783          	lh	a5,36(a5)
    80006990:	2781                	sext.w	a5,a5
    80006992:	0001d717          	auipc	a4,0x1d
    80006996:	23e70713          	addi	a4,a4,574 # 80023bd0 <devsw>
    8000699a:	0792                	slli	a5,a5,0x4
    8000699c:	97ba                	add	a5,a5,a4
    8000699e:	639c                	ld	a5,0(a5)
    800069a0:	e399                	bnez	a5,800069a6 <fileread+0xa4>
      return -1;
    800069a2:	57fd                	li	a5,-1
    800069a4:	a86d                	j	80006a5e <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    800069a6:	fd843783          	ld	a5,-40(s0)
    800069aa:	02479783          	lh	a5,36(a5)
    800069ae:	2781                	sext.w	a5,a5
    800069b0:	0001d717          	auipc	a4,0x1d
    800069b4:	22070713          	addi	a4,a4,544 # 80023bd0 <devsw>
    800069b8:	0792                	slli	a5,a5,0x4
    800069ba:	97ba                	add	a5,a5,a4
    800069bc:	639c                	ld	a5,0(a5)
    800069be:	fcc42703          	lw	a4,-52(s0)
    800069c2:	863a                	mv	a2,a4
    800069c4:	fd043583          	ld	a1,-48(s0)
    800069c8:	4505                	li	a0,1
    800069ca:	9782                	jalr	a5
    800069cc:	87aa                	mv	a5,a0
    800069ce:	fef42623          	sw	a5,-20(s0)
    800069d2:	a061                	j	80006a5a <fileread+0x158>
  } else if(f->type == FD_INODE){
    800069d4:	fd843783          	ld	a5,-40(s0)
    800069d8:	439c                	lw	a5,0(a5)
    800069da:	873e                	mv	a4,a5
    800069dc:	4789                	li	a5,2
    800069de:	06f71663          	bne	a4,a5,80006a4a <fileread+0x148>
    ilock(f->ip);
    800069e2:	fd843783          	ld	a5,-40(s0)
    800069e6:	6f9c                	ld	a5,24(a5)
    800069e8:	853e                	mv	a0,a5
    800069ea:	ffffe097          	auipc	ra,0xffffe
    800069ee:	63a080e7          	jalr	1594(ra) # 80005024 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    800069f2:	fd843783          	ld	a5,-40(s0)
    800069f6:	6f88                	ld	a0,24(a5)
    800069f8:	fd843783          	ld	a5,-40(s0)
    800069fc:	539c                	lw	a5,32(a5)
    800069fe:	fcc42703          	lw	a4,-52(s0)
    80006a02:	86be                	mv	a3,a5
    80006a04:	fd043603          	ld	a2,-48(s0)
    80006a08:	4585                	li	a1,1
    80006a0a:	fffff097          	auipc	ra,0xfffff
    80006a0e:	bd0080e7          	jalr	-1072(ra) # 800055da <readi>
    80006a12:	87aa                	mv	a5,a0
    80006a14:	fef42623          	sw	a5,-20(s0)
    80006a18:	fec42783          	lw	a5,-20(s0)
    80006a1c:	2781                	sext.w	a5,a5
    80006a1e:	00f05d63          	blez	a5,80006a38 <fileread+0x136>
      f->off += r;
    80006a22:	fd843783          	ld	a5,-40(s0)
    80006a26:	5398                	lw	a4,32(a5)
    80006a28:	fec42783          	lw	a5,-20(s0)
    80006a2c:	9fb9                	addw	a5,a5,a4
    80006a2e:	0007871b          	sext.w	a4,a5
    80006a32:	fd843783          	ld	a5,-40(s0)
    80006a36:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006a38:	fd843783          	ld	a5,-40(s0)
    80006a3c:	6f9c                	ld	a5,24(a5)
    80006a3e:	853e                	mv	a0,a5
    80006a40:	ffffe097          	auipc	ra,0xffffe
    80006a44:	718080e7          	jalr	1816(ra) # 80005158 <iunlock>
    80006a48:	a809                	j	80006a5a <fileread+0x158>
  } else {
    panic("fileread");
    80006a4a:	00005517          	auipc	a0,0x5
    80006a4e:	b7650513          	addi	a0,a0,-1162 # 8000b5c0 <etext+0x5c0>
    80006a52:	ffffa097          	auipc	ra,0xffffa
    80006a56:	238080e7          	jalr	568(ra) # 80000c8a <panic>
  }

  return r;
    80006a5a:	fec42783          	lw	a5,-20(s0)
}
    80006a5e:	853e                	mv	a0,a5
    80006a60:	70e2                	ld	ra,56(sp)
    80006a62:	7442                	ld	s0,48(sp)
    80006a64:	6121                	addi	sp,sp,64
    80006a66:	8082                	ret

0000000080006a68 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006a68:	715d                	addi	sp,sp,-80
    80006a6a:	e486                	sd	ra,72(sp)
    80006a6c:	e0a2                	sd	s0,64(sp)
    80006a6e:	0880                	addi	s0,sp,80
    80006a70:	fca43423          	sd	a0,-56(s0)
    80006a74:	fcb43023          	sd	a1,-64(s0)
    80006a78:	87b2                	mv	a5,a2
    80006a7a:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006a7e:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006a82:	fc843783          	ld	a5,-56(s0)
    80006a86:	0097c783          	lbu	a5,9(a5)
    80006a8a:	e399                	bnez	a5,80006a90 <filewrite+0x28>
    return -1;
    80006a8c:	57fd                	li	a5,-1
    80006a8e:	a2c5                	j	80006c6e <filewrite+0x206>

  if(f->type == FD_PIPE){
    80006a90:	fc843783          	ld	a5,-56(s0)
    80006a94:	439c                	lw	a5,0(a5)
    80006a96:	873e                	mv	a4,a5
    80006a98:	4785                	li	a5,1
    80006a9a:	02f71363          	bne	a4,a5,80006ac0 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006a9e:	fc843783          	ld	a5,-56(s0)
    80006aa2:	6b9c                	ld	a5,16(a5)
    80006aa4:	fbc42703          	lw	a4,-68(s0)
    80006aa8:	863a                	mv	a2,a4
    80006aaa:	fc043583          	ld	a1,-64(s0)
    80006aae:	853e                	mv	a0,a5
    80006ab0:	00000097          	auipc	ra,0x0
    80006ab4:	3c4080e7          	jalr	964(ra) # 80006e74 <pipewrite>
    80006ab8:	87aa                	mv	a5,a0
    80006aba:	fef42623          	sw	a5,-20(s0)
    80006abe:	a275                	j	80006c6a <filewrite+0x202>
  } else if(f->type == FD_DEVICE){
    80006ac0:	fc843783          	ld	a5,-56(s0)
    80006ac4:	439c                	lw	a5,0(a5)
    80006ac6:	873e                	mv	a4,a5
    80006ac8:	478d                	li	a5,3
    80006aca:	06f71863          	bne	a4,a5,80006b3a <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006ace:	fc843783          	ld	a5,-56(s0)
    80006ad2:	02479783          	lh	a5,36(a5)
    80006ad6:	2781                	sext.w	a5,a5
    80006ad8:	0207c863          	bltz	a5,80006b08 <filewrite+0xa0>
    80006adc:	fc843783          	ld	a5,-56(s0)
    80006ae0:	02479783          	lh	a5,36(a5)
    80006ae4:	0007871b          	sext.w	a4,a5
    80006ae8:	47a5                	li	a5,9
    80006aea:	00e7cf63          	blt	a5,a4,80006b08 <filewrite+0xa0>
    80006aee:	fc843783          	ld	a5,-56(s0)
    80006af2:	02479783          	lh	a5,36(a5)
    80006af6:	2781                	sext.w	a5,a5
    80006af8:	0001d717          	auipc	a4,0x1d
    80006afc:	0d870713          	addi	a4,a4,216 # 80023bd0 <devsw>
    80006b00:	0792                	slli	a5,a5,0x4
    80006b02:	97ba                	add	a5,a5,a4
    80006b04:	679c                	ld	a5,8(a5)
    80006b06:	e399                	bnez	a5,80006b0c <filewrite+0xa4>
      return -1;
    80006b08:	57fd                	li	a5,-1
    80006b0a:	a295                	j	80006c6e <filewrite+0x206>
    ret = devsw[f->major].write(1, addr, n);
    80006b0c:	fc843783          	ld	a5,-56(s0)
    80006b10:	02479783          	lh	a5,36(a5)
    80006b14:	2781                	sext.w	a5,a5
    80006b16:	0001d717          	auipc	a4,0x1d
    80006b1a:	0ba70713          	addi	a4,a4,186 # 80023bd0 <devsw>
    80006b1e:	0792                	slli	a5,a5,0x4
    80006b20:	97ba                	add	a5,a5,a4
    80006b22:	679c                	ld	a5,8(a5)
    80006b24:	fbc42703          	lw	a4,-68(s0)
    80006b28:	863a                	mv	a2,a4
    80006b2a:	fc043583          	ld	a1,-64(s0)
    80006b2e:	4505                	li	a0,1
    80006b30:	9782                	jalr	a5
    80006b32:	87aa                	mv	a5,a0
    80006b34:	fef42623          	sw	a5,-20(s0)
    80006b38:	aa0d                	j	80006c6a <filewrite+0x202>
  } else if(f->type == FD_INODE){
    80006b3a:	fc843783          	ld	a5,-56(s0)
    80006b3e:	439c                	lw	a5,0(a5)
    80006b40:	873e                	mv	a4,a5
    80006b42:	4789                	li	a5,2
    80006b44:	10f71b63          	bne	a4,a5,80006c5a <filewrite+0x1f2>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006b48:	6785                	lui	a5,0x1
    80006b4a:	c0078793          	addi	a5,a5,-1024 # c00 <_entry-0x7ffff400>
    80006b4e:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006b52:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006b56:	a0f9                	j	80006c24 <filewrite+0x1bc>
      int n1 = n - i;
    80006b58:	fbc42783          	lw	a5,-68(s0)
    80006b5c:	873e                	mv	a4,a5
    80006b5e:	fe842783          	lw	a5,-24(s0)
    80006b62:	40f707bb          	subw	a5,a4,a5
    80006b66:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006b6a:	fe442783          	lw	a5,-28(s0)
    80006b6e:	873e                	mv	a4,a5
    80006b70:	fe042783          	lw	a5,-32(s0)
    80006b74:	2701                	sext.w	a4,a4
    80006b76:	2781                	sext.w	a5,a5
    80006b78:	00e7d663          	bge	a5,a4,80006b84 <filewrite+0x11c>
        n1 = max;
    80006b7c:	fe042783          	lw	a5,-32(s0)
    80006b80:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006b84:	fffff097          	auipc	ra,0xfffff
    80006b88:	538080e7          	jalr	1336(ra) # 800060bc <begin_op>
      ilock(f->ip);
    80006b8c:	fc843783          	ld	a5,-56(s0)
    80006b90:	6f9c                	ld	a5,24(a5)
    80006b92:	853e                	mv	a0,a5
    80006b94:	ffffe097          	auipc	ra,0xffffe
    80006b98:	490080e7          	jalr	1168(ra) # 80005024 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006b9c:	fc843783          	ld	a5,-56(s0)
    80006ba0:	6f88                	ld	a0,24(a5)
    80006ba2:	fe842703          	lw	a4,-24(s0)
    80006ba6:	fc043783          	ld	a5,-64(s0)
    80006baa:	00f70633          	add	a2,a4,a5
    80006bae:	fc843783          	ld	a5,-56(s0)
    80006bb2:	539c                	lw	a5,32(a5)
    80006bb4:	fe442703          	lw	a4,-28(s0)
    80006bb8:	86be                	mv	a3,a5
    80006bba:	4585                	li	a1,1
    80006bbc:	fffff097          	auipc	ra,0xfffff
    80006bc0:	bbc080e7          	jalr	-1092(ra) # 80005778 <writei>
    80006bc4:	87aa                	mv	a5,a0
    80006bc6:	fcf42e23          	sw	a5,-36(s0)
    80006bca:	fdc42783          	lw	a5,-36(s0)
    80006bce:	2781                	sext.w	a5,a5
    80006bd0:	00f05d63          	blez	a5,80006bea <filewrite+0x182>
        f->off += r;
    80006bd4:	fc843783          	ld	a5,-56(s0)
    80006bd8:	5398                	lw	a4,32(a5)
    80006bda:	fdc42783          	lw	a5,-36(s0)
    80006bde:	9fb9                	addw	a5,a5,a4
    80006be0:	0007871b          	sext.w	a4,a5
    80006be4:	fc843783          	ld	a5,-56(s0)
    80006be8:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006bea:	fc843783          	ld	a5,-56(s0)
    80006bee:	6f9c                	ld	a5,24(a5)
    80006bf0:	853e                	mv	a0,a5
    80006bf2:	ffffe097          	auipc	ra,0xffffe
    80006bf6:	566080e7          	jalr	1382(ra) # 80005158 <iunlock>
      end_op();
    80006bfa:	fffff097          	auipc	ra,0xfffff
    80006bfe:	584080e7          	jalr	1412(ra) # 8000617e <end_op>

      if(r != n1){
    80006c02:	fdc42783          	lw	a5,-36(s0)
    80006c06:	873e                	mv	a4,a5
    80006c08:	fe442783          	lw	a5,-28(s0)
    80006c0c:	2701                	sext.w	a4,a4
    80006c0e:	2781                	sext.w	a5,a5
    80006c10:	02f71463          	bne	a4,a5,80006c38 <filewrite+0x1d0>
        // error from writei
        break;
      }
      i += r;
    80006c14:	fe842783          	lw	a5,-24(s0)
    80006c18:	873e                	mv	a4,a5
    80006c1a:	fdc42783          	lw	a5,-36(s0)
    80006c1e:	9fb9                	addw	a5,a5,a4
    80006c20:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006c24:	fe842783          	lw	a5,-24(s0)
    80006c28:	873e                	mv	a4,a5
    80006c2a:	fbc42783          	lw	a5,-68(s0)
    80006c2e:	2701                	sext.w	a4,a4
    80006c30:	2781                	sext.w	a5,a5
    80006c32:	f2f743e3          	blt	a4,a5,80006b58 <filewrite+0xf0>
    80006c36:	a011                	j	80006c3a <filewrite+0x1d2>
        break;
    80006c38:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006c3a:	fe842783          	lw	a5,-24(s0)
    80006c3e:	873e                	mv	a4,a5
    80006c40:	fbc42783          	lw	a5,-68(s0)
    80006c44:	2701                	sext.w	a4,a4
    80006c46:	2781                	sext.w	a5,a5
    80006c48:	00f71563          	bne	a4,a5,80006c52 <filewrite+0x1ea>
    80006c4c:	fbc42783          	lw	a5,-68(s0)
    80006c50:	a011                	j	80006c54 <filewrite+0x1ec>
    80006c52:	57fd                	li	a5,-1
    80006c54:	fef42623          	sw	a5,-20(s0)
    80006c58:	a809                	j	80006c6a <filewrite+0x202>
  } else {
    panic("filewrite");
    80006c5a:	00005517          	auipc	a0,0x5
    80006c5e:	97650513          	addi	a0,a0,-1674 # 8000b5d0 <etext+0x5d0>
    80006c62:	ffffa097          	auipc	ra,0xffffa
    80006c66:	028080e7          	jalr	40(ra) # 80000c8a <panic>
  }

  return ret;
    80006c6a:	fec42783          	lw	a5,-20(s0)
}
    80006c6e:	853e                	mv	a0,a5
    80006c70:	60a6                	ld	ra,72(sp)
    80006c72:	6406                	ld	s0,64(sp)
    80006c74:	6161                	addi	sp,sp,80
    80006c76:	8082                	ret

0000000080006c78 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006c78:	7179                	addi	sp,sp,-48
    80006c7a:	f406                	sd	ra,40(sp)
    80006c7c:	f022                	sd	s0,32(sp)
    80006c7e:	1800                	addi	s0,sp,48
    80006c80:	fca43c23          	sd	a0,-40(s0)
    80006c84:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006c88:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006c8c:	fd043783          	ld	a5,-48(s0)
    80006c90:	0007b023          	sd	zero,0(a5)
    80006c94:	fd043783          	ld	a5,-48(s0)
    80006c98:	6398                	ld	a4,0(a5)
    80006c9a:	fd843783          	ld	a5,-40(s0)
    80006c9e:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006ca0:	00000097          	auipc	ra,0x0
    80006ca4:	9cc080e7          	jalr	-1588(ra) # 8000666c <filealloc>
    80006ca8:	872a                	mv	a4,a0
    80006caa:	fd843783          	ld	a5,-40(s0)
    80006cae:	e398                	sd	a4,0(a5)
    80006cb0:	fd843783          	ld	a5,-40(s0)
    80006cb4:	639c                	ld	a5,0(a5)
    80006cb6:	c3e9                	beqz	a5,80006d78 <pipealloc+0x100>
    80006cb8:	00000097          	auipc	ra,0x0
    80006cbc:	9b4080e7          	jalr	-1612(ra) # 8000666c <filealloc>
    80006cc0:	872a                	mv	a4,a0
    80006cc2:	fd043783          	ld	a5,-48(s0)
    80006cc6:	e398                	sd	a4,0(a5)
    80006cc8:	fd043783          	ld	a5,-48(s0)
    80006ccc:	639c                	ld	a5,0(a5)
    80006cce:	c7cd                	beqz	a5,80006d78 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006cd0:	ffffa097          	auipc	ra,0xffffa
    80006cd4:	454080e7          	jalr	1108(ra) # 80001124 <kalloc>
    80006cd8:	fea43423          	sd	a0,-24(s0)
    80006cdc:	fe843783          	ld	a5,-24(s0)
    80006ce0:	cfd1                	beqz	a5,80006d7c <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006ce2:	fe843783          	ld	a5,-24(s0)
    80006ce6:	4705                	li	a4,1
    80006ce8:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006cec:	fe843783          	ld	a5,-24(s0)
    80006cf0:	4705                	li	a4,1
    80006cf2:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006cf6:	fe843783          	ld	a5,-24(s0)
    80006cfa:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006cfe:	fe843783          	ld	a5,-24(s0)
    80006d02:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006d06:	fe843783          	ld	a5,-24(s0)
    80006d0a:	00005597          	auipc	a1,0x5
    80006d0e:	8d658593          	addi	a1,a1,-1834 # 8000b5e0 <etext+0x5e0>
    80006d12:	853e                	mv	a0,a5
    80006d14:	ffffa097          	auipc	ra,0xffffa
    80006d18:	534080e7          	jalr	1332(ra) # 80001248 <initlock>
  (*f0)->type = FD_PIPE;
    80006d1c:	fd843783          	ld	a5,-40(s0)
    80006d20:	639c                	ld	a5,0(a5)
    80006d22:	4705                	li	a4,1
    80006d24:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006d26:	fd843783          	ld	a5,-40(s0)
    80006d2a:	639c                	ld	a5,0(a5)
    80006d2c:	4705                	li	a4,1
    80006d2e:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006d32:	fd843783          	ld	a5,-40(s0)
    80006d36:	639c                	ld	a5,0(a5)
    80006d38:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006d3c:	fd843783          	ld	a5,-40(s0)
    80006d40:	639c                	ld	a5,0(a5)
    80006d42:	fe843703          	ld	a4,-24(s0)
    80006d46:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006d48:	fd043783          	ld	a5,-48(s0)
    80006d4c:	639c                	ld	a5,0(a5)
    80006d4e:	4705                	li	a4,1
    80006d50:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006d52:	fd043783          	ld	a5,-48(s0)
    80006d56:	639c                	ld	a5,0(a5)
    80006d58:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006d5c:	fd043783          	ld	a5,-48(s0)
    80006d60:	639c                	ld	a5,0(a5)
    80006d62:	4705                	li	a4,1
    80006d64:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006d68:	fd043783          	ld	a5,-48(s0)
    80006d6c:	639c                	ld	a5,0(a5)
    80006d6e:	fe843703          	ld	a4,-24(s0)
    80006d72:	eb98                	sd	a4,16(a5)
  return 0;
    80006d74:	4781                	li	a5,0
    80006d76:	a0b1                	j	80006dc2 <pipealloc+0x14a>
    goto bad;
    80006d78:	0001                	nop
    80006d7a:	a011                	j	80006d7e <pipealloc+0x106>
    goto bad;
    80006d7c:	0001                	nop

 bad:
  if(pi)
    80006d7e:	fe843783          	ld	a5,-24(s0)
    80006d82:	c799                	beqz	a5,80006d90 <pipealloc+0x118>
    kfree((char*)pi);
    80006d84:	fe843503          	ld	a0,-24(s0)
    80006d88:	ffffa097          	auipc	ra,0xffffa
    80006d8c:	2f8080e7          	jalr	760(ra) # 80001080 <kfree>
  if(*f0)
    80006d90:	fd843783          	ld	a5,-40(s0)
    80006d94:	639c                	ld	a5,0(a5)
    80006d96:	cb89                	beqz	a5,80006da8 <pipealloc+0x130>
    fileclose(*f0);
    80006d98:	fd843783          	ld	a5,-40(s0)
    80006d9c:	639c                	ld	a5,0(a5)
    80006d9e:	853e                	mv	a0,a5
    80006da0:	00000097          	auipc	ra,0x0
    80006da4:	9b6080e7          	jalr	-1610(ra) # 80006756 <fileclose>
  if(*f1)
    80006da8:	fd043783          	ld	a5,-48(s0)
    80006dac:	639c                	ld	a5,0(a5)
    80006dae:	cb89                	beqz	a5,80006dc0 <pipealloc+0x148>
    fileclose(*f1);
    80006db0:	fd043783          	ld	a5,-48(s0)
    80006db4:	639c                	ld	a5,0(a5)
    80006db6:	853e                	mv	a0,a5
    80006db8:	00000097          	auipc	ra,0x0
    80006dbc:	99e080e7          	jalr	-1634(ra) # 80006756 <fileclose>
  return -1;
    80006dc0:	57fd                	li	a5,-1
}
    80006dc2:	853e                	mv	a0,a5
    80006dc4:	70a2                	ld	ra,40(sp)
    80006dc6:	7402                	ld	s0,32(sp)
    80006dc8:	6145                	addi	sp,sp,48
    80006dca:	8082                	ret

0000000080006dcc <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80006dcc:	1101                	addi	sp,sp,-32
    80006dce:	ec06                	sd	ra,24(sp)
    80006dd0:	e822                	sd	s0,16(sp)
    80006dd2:	1000                	addi	s0,sp,32
    80006dd4:	fea43423          	sd	a0,-24(s0)
    80006dd8:	87ae                	mv	a5,a1
    80006dda:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80006dde:	fe843783          	ld	a5,-24(s0)
    80006de2:	853e                	mv	a0,a5
    80006de4:	ffffa097          	auipc	ra,0xffffa
    80006de8:	494080e7          	jalr	1172(ra) # 80001278 <acquire>
  if(writable){
    80006dec:	fe442783          	lw	a5,-28(s0)
    80006df0:	2781                	sext.w	a5,a5
    80006df2:	cf99                	beqz	a5,80006e10 <pipeclose+0x44>
    pi->writeopen = 0;
    80006df4:	fe843783          	ld	a5,-24(s0)
    80006df8:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80006dfc:	fe843783          	ld	a5,-24(s0)
    80006e00:	21878793          	addi	a5,a5,536
    80006e04:	853e                	mv	a0,a5
    80006e06:	ffffc097          	auipc	ra,0xffffc
    80006e0a:	678080e7          	jalr	1656(ra) # 8000347e <wakeup>
    80006e0e:	a831                	j	80006e2a <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80006e10:	fe843783          	ld	a5,-24(s0)
    80006e14:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80006e18:	fe843783          	ld	a5,-24(s0)
    80006e1c:	21c78793          	addi	a5,a5,540
    80006e20:	853e                	mv	a0,a5
    80006e22:	ffffc097          	auipc	ra,0xffffc
    80006e26:	65c080e7          	jalr	1628(ra) # 8000347e <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80006e2a:	fe843783          	ld	a5,-24(s0)
    80006e2e:	2207a783          	lw	a5,544(a5)
    80006e32:	e785                	bnez	a5,80006e5a <pipeclose+0x8e>
    80006e34:	fe843783          	ld	a5,-24(s0)
    80006e38:	2247a783          	lw	a5,548(a5)
    80006e3c:	ef99                	bnez	a5,80006e5a <pipeclose+0x8e>
    release(&pi->lock);
    80006e3e:	fe843783          	ld	a5,-24(s0)
    80006e42:	853e                	mv	a0,a5
    80006e44:	ffffa097          	auipc	ra,0xffffa
    80006e48:	498080e7          	jalr	1176(ra) # 800012dc <release>
    kfree((char*)pi);
    80006e4c:	fe843503          	ld	a0,-24(s0)
    80006e50:	ffffa097          	auipc	ra,0xffffa
    80006e54:	230080e7          	jalr	560(ra) # 80001080 <kfree>
    80006e58:	a809                	j	80006e6a <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80006e5a:	fe843783          	ld	a5,-24(s0)
    80006e5e:	853e                	mv	a0,a5
    80006e60:	ffffa097          	auipc	ra,0xffffa
    80006e64:	47c080e7          	jalr	1148(ra) # 800012dc <release>
}
    80006e68:	0001                	nop
    80006e6a:	0001                	nop
    80006e6c:	60e2                	ld	ra,24(sp)
    80006e6e:	6442                	ld	s0,16(sp)
    80006e70:	6105                	addi	sp,sp,32
    80006e72:	8082                	ret

0000000080006e74 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80006e74:	715d                	addi	sp,sp,-80
    80006e76:	e486                	sd	ra,72(sp)
    80006e78:	e0a2                	sd	s0,64(sp)
    80006e7a:	0880                	addi	s0,sp,80
    80006e7c:	fca43423          	sd	a0,-56(s0)
    80006e80:	fcb43023          	sd	a1,-64(s0)
    80006e84:	87b2                	mv	a5,a2
    80006e86:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80006e8a:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80006e8e:	ffffc097          	auipc	ra,0xffffc
    80006e92:	9b2080e7          	jalr	-1614(ra) # 80002840 <myproc>
    80006e96:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80006e9a:	fc843783          	ld	a5,-56(s0)
    80006e9e:	853e                	mv	a0,a5
    80006ea0:	ffffa097          	auipc	ra,0xffffa
    80006ea4:	3d8080e7          	jalr	984(ra) # 80001278 <acquire>
  while(i < n){
    80006ea8:	a8f1                	j	80006f84 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80006eaa:	fc843783          	ld	a5,-56(s0)
    80006eae:	2207a783          	lw	a5,544(a5)
    80006eb2:	cb89                	beqz	a5,80006ec4 <pipewrite+0x50>
    80006eb4:	fe043503          	ld	a0,-32(s0)
    80006eb8:	ffffc097          	auipc	ra,0xffffc
    80006ebc:	734080e7          	jalr	1844(ra) # 800035ec <killed>
    80006ec0:	87aa                	mv	a5,a0
    80006ec2:	cb91                	beqz	a5,80006ed6 <pipewrite+0x62>
      release(&pi->lock);
    80006ec4:	fc843783          	ld	a5,-56(s0)
    80006ec8:	853e                	mv	a0,a5
    80006eca:	ffffa097          	auipc	ra,0xffffa
    80006ece:	412080e7          	jalr	1042(ra) # 800012dc <release>
      return -1;
    80006ed2:	57fd                	li	a5,-1
    80006ed4:	a0ed                	j	80006fbe <pipewrite+0x14a>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80006ed6:	fc843783          	ld	a5,-56(s0)
    80006eda:	21c7a703          	lw	a4,540(a5)
    80006ede:	fc843783          	ld	a5,-56(s0)
    80006ee2:	2187a783          	lw	a5,536(a5)
    80006ee6:	2007879b          	addiw	a5,a5,512
    80006eea:	2781                	sext.w	a5,a5
    80006eec:	02f71863          	bne	a4,a5,80006f1c <pipewrite+0xa8>
      wakeup(&pi->nread);
    80006ef0:	fc843783          	ld	a5,-56(s0)
    80006ef4:	21878793          	addi	a5,a5,536
    80006ef8:	853e                	mv	a0,a5
    80006efa:	ffffc097          	auipc	ra,0xffffc
    80006efe:	584080e7          	jalr	1412(ra) # 8000347e <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80006f02:	fc843783          	ld	a5,-56(s0)
    80006f06:	21c78793          	addi	a5,a5,540
    80006f0a:	fc843703          	ld	a4,-56(s0)
    80006f0e:	85ba                	mv	a1,a4
    80006f10:	853e                	mv	a0,a5
    80006f12:	ffffc097          	auipc	ra,0xffffc
    80006f16:	4f0080e7          	jalr	1264(ra) # 80003402 <sleep>
    80006f1a:	a0ad                	j	80006f84 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80006f1c:	fe043783          	ld	a5,-32(s0)
    80006f20:	6ba8                	ld	a0,80(a5)
    80006f22:	fec42703          	lw	a4,-20(s0)
    80006f26:	fc043783          	ld	a5,-64(s0)
    80006f2a:	973e                	add	a4,a4,a5
    80006f2c:	fdf40793          	addi	a5,s0,-33
    80006f30:	4685                	li	a3,1
    80006f32:	863a                	mv	a2,a4
    80006f34:	85be                	mv	a1,a5
    80006f36:	ffffb097          	auipc	ra,0xffffb
    80006f3a:	4a2080e7          	jalr	1186(ra) # 800023d8 <copyin>
    80006f3e:	87aa                	mv	a5,a0
    80006f40:	873e                	mv	a4,a5
    80006f42:	57fd                	li	a5,-1
    80006f44:	04f70a63          	beq	a4,a5,80006f98 <pipewrite+0x124>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80006f48:	fc843783          	ld	a5,-56(s0)
    80006f4c:	21c7a783          	lw	a5,540(a5)
    80006f50:	2781                	sext.w	a5,a5
    80006f52:	0017871b          	addiw	a4,a5,1
    80006f56:	0007069b          	sext.w	a3,a4
    80006f5a:	fc843703          	ld	a4,-56(s0)
    80006f5e:	20d72e23          	sw	a3,540(a4)
    80006f62:	1ff7f793          	andi	a5,a5,511
    80006f66:	2781                	sext.w	a5,a5
    80006f68:	fdf44703          	lbu	a4,-33(s0)
    80006f6c:	fc843683          	ld	a3,-56(s0)
    80006f70:	1782                	slli	a5,a5,0x20
    80006f72:	9381                	srli	a5,a5,0x20
    80006f74:	97b6                	add	a5,a5,a3
    80006f76:	00e78c23          	sb	a4,24(a5)
      i++;
    80006f7a:	fec42783          	lw	a5,-20(s0)
    80006f7e:	2785                	addiw	a5,a5,1
    80006f80:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80006f84:	fec42783          	lw	a5,-20(s0)
    80006f88:	873e                	mv	a4,a5
    80006f8a:	fbc42783          	lw	a5,-68(s0)
    80006f8e:	2701                	sext.w	a4,a4
    80006f90:	2781                	sext.w	a5,a5
    80006f92:	f0f74ce3          	blt	a4,a5,80006eaa <pipewrite+0x36>
    80006f96:	a011                	j	80006f9a <pipewrite+0x126>
        break;
    80006f98:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80006f9a:	fc843783          	ld	a5,-56(s0)
    80006f9e:	21878793          	addi	a5,a5,536
    80006fa2:	853e                	mv	a0,a5
    80006fa4:	ffffc097          	auipc	ra,0xffffc
    80006fa8:	4da080e7          	jalr	1242(ra) # 8000347e <wakeup>
  release(&pi->lock);
    80006fac:	fc843783          	ld	a5,-56(s0)
    80006fb0:	853e                	mv	a0,a5
    80006fb2:	ffffa097          	auipc	ra,0xffffa
    80006fb6:	32a080e7          	jalr	810(ra) # 800012dc <release>

  return i;
    80006fba:	fec42783          	lw	a5,-20(s0)
}
    80006fbe:	853e                	mv	a0,a5
    80006fc0:	60a6                	ld	ra,72(sp)
    80006fc2:	6406                	ld	s0,64(sp)
    80006fc4:	6161                	addi	sp,sp,80
    80006fc6:	8082                	ret

0000000080006fc8 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80006fc8:	715d                	addi	sp,sp,-80
    80006fca:	e486                	sd	ra,72(sp)
    80006fcc:	e0a2                	sd	s0,64(sp)
    80006fce:	0880                	addi	s0,sp,80
    80006fd0:	fca43423          	sd	a0,-56(s0)
    80006fd4:	fcb43023          	sd	a1,-64(s0)
    80006fd8:	87b2                	mv	a5,a2
    80006fda:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80006fde:	ffffc097          	auipc	ra,0xffffc
    80006fe2:	862080e7          	jalr	-1950(ra) # 80002840 <myproc>
    80006fe6:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80006fea:	fc843783          	ld	a5,-56(s0)
    80006fee:	853e                	mv	a0,a5
    80006ff0:	ffffa097          	auipc	ra,0xffffa
    80006ff4:	288080e7          	jalr	648(ra) # 80001278 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80006ff8:	a835                	j	80007034 <piperead+0x6c>
    if(killed(pr)){
    80006ffa:	fe043503          	ld	a0,-32(s0)
    80006ffe:	ffffc097          	auipc	ra,0xffffc
    80007002:	5ee080e7          	jalr	1518(ra) # 800035ec <killed>
    80007006:	87aa                	mv	a5,a0
    80007008:	cb91                	beqz	a5,8000701c <piperead+0x54>
      release(&pi->lock);
    8000700a:	fc843783          	ld	a5,-56(s0)
    8000700e:	853e                	mv	a0,a5
    80007010:	ffffa097          	auipc	ra,0xffffa
    80007014:	2cc080e7          	jalr	716(ra) # 800012dc <release>
      return -1;
    80007018:	57fd                	li	a5,-1
    8000701a:	a8e5                	j	80007112 <piperead+0x14a>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000701c:	fc843783          	ld	a5,-56(s0)
    80007020:	21878793          	addi	a5,a5,536
    80007024:	fc843703          	ld	a4,-56(s0)
    80007028:	85ba                	mv	a1,a4
    8000702a:	853e                	mv	a0,a5
    8000702c:	ffffc097          	auipc	ra,0xffffc
    80007030:	3d6080e7          	jalr	982(ra) # 80003402 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007034:	fc843783          	ld	a5,-56(s0)
    80007038:	2187a703          	lw	a4,536(a5)
    8000703c:	fc843783          	ld	a5,-56(s0)
    80007040:	21c7a783          	lw	a5,540(a5)
    80007044:	00f71763          	bne	a4,a5,80007052 <piperead+0x8a>
    80007048:	fc843783          	ld	a5,-56(s0)
    8000704c:	2247a783          	lw	a5,548(a5)
    80007050:	f7cd                	bnez	a5,80006ffa <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007052:	fe042623          	sw	zero,-20(s0)
    80007056:	a8bd                	j	800070d4 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007058:	fc843783          	ld	a5,-56(s0)
    8000705c:	2187a703          	lw	a4,536(a5)
    80007060:	fc843783          	ld	a5,-56(s0)
    80007064:	21c7a783          	lw	a5,540(a5)
    80007068:	08f70063          	beq	a4,a5,800070e8 <piperead+0x120>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000706c:	fc843783          	ld	a5,-56(s0)
    80007070:	2187a783          	lw	a5,536(a5)
    80007074:	2781                	sext.w	a5,a5
    80007076:	0017871b          	addiw	a4,a5,1
    8000707a:	0007069b          	sext.w	a3,a4
    8000707e:	fc843703          	ld	a4,-56(s0)
    80007082:	20d72c23          	sw	a3,536(a4)
    80007086:	1ff7f793          	andi	a5,a5,511
    8000708a:	2781                	sext.w	a5,a5
    8000708c:	fc843703          	ld	a4,-56(s0)
    80007090:	1782                	slli	a5,a5,0x20
    80007092:	9381                	srli	a5,a5,0x20
    80007094:	97ba                	add	a5,a5,a4
    80007096:	0187c783          	lbu	a5,24(a5)
    8000709a:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000709e:	fe043783          	ld	a5,-32(s0)
    800070a2:	6ba8                	ld	a0,80(a5)
    800070a4:	fec42703          	lw	a4,-20(s0)
    800070a8:	fc043783          	ld	a5,-64(s0)
    800070ac:	97ba                	add	a5,a5,a4
    800070ae:	fdf40713          	addi	a4,s0,-33
    800070b2:	4685                	li	a3,1
    800070b4:	863a                	mv	a2,a4
    800070b6:	85be                	mv	a1,a5
    800070b8:	ffffb097          	auipc	ra,0xffffb
    800070bc:	252080e7          	jalr	594(ra) # 8000230a <copyout>
    800070c0:	87aa                	mv	a5,a0
    800070c2:	873e                	mv	a4,a5
    800070c4:	57fd                	li	a5,-1
    800070c6:	02f70363          	beq	a4,a5,800070ec <piperead+0x124>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800070ca:	fec42783          	lw	a5,-20(s0)
    800070ce:	2785                	addiw	a5,a5,1
    800070d0:	fef42623          	sw	a5,-20(s0)
    800070d4:	fec42783          	lw	a5,-20(s0)
    800070d8:	873e                	mv	a4,a5
    800070da:	fbc42783          	lw	a5,-68(s0)
    800070de:	2701                	sext.w	a4,a4
    800070e0:	2781                	sext.w	a5,a5
    800070e2:	f6f74be3          	blt	a4,a5,80007058 <piperead+0x90>
    800070e6:	a021                	j	800070ee <piperead+0x126>
      break;
    800070e8:	0001                	nop
    800070ea:	a011                	j	800070ee <piperead+0x126>
      break;
    800070ec:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800070ee:	fc843783          	ld	a5,-56(s0)
    800070f2:	21c78793          	addi	a5,a5,540
    800070f6:	853e                	mv	a0,a5
    800070f8:	ffffc097          	auipc	ra,0xffffc
    800070fc:	386080e7          	jalr	902(ra) # 8000347e <wakeup>
  release(&pi->lock);
    80007100:	fc843783          	ld	a5,-56(s0)
    80007104:	853e                	mv	a0,a5
    80007106:	ffffa097          	auipc	ra,0xffffa
    8000710a:	1d6080e7          	jalr	470(ra) # 800012dc <release>
  return i;
    8000710e:	fec42783          	lw	a5,-20(s0)
}
    80007112:	853e                	mv	a0,a5
    80007114:	60a6                	ld	ra,72(sp)
    80007116:	6406                	ld	s0,64(sp)
    80007118:	6161                	addi	sp,sp,80
    8000711a:	8082                	ret

000000008000711c <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    8000711c:	7179                	addi	sp,sp,-48
    8000711e:	f422                	sd	s0,40(sp)
    80007120:	1800                	addi	s0,sp,48
    80007122:	87aa                	mv	a5,a0
    80007124:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    80007128:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    8000712c:	fdc42783          	lw	a5,-36(s0)
    80007130:	8b85                	andi	a5,a5,1
    80007132:	2781                	sext.w	a5,a5
    80007134:	c781                	beqz	a5,8000713c <flags2perm+0x20>
      perm = PTE_X;
    80007136:	47a1                	li	a5,8
    80007138:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    8000713c:	fdc42783          	lw	a5,-36(s0)
    80007140:	8b89                	andi	a5,a5,2
    80007142:	2781                	sext.w	a5,a5
    80007144:	c799                	beqz	a5,80007152 <flags2perm+0x36>
      perm |= PTE_W;
    80007146:	fec42783          	lw	a5,-20(s0)
    8000714a:	0047e793          	ori	a5,a5,4
    8000714e:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007152:	fec42783          	lw	a5,-20(s0)
}
    80007156:	853e                	mv	a0,a5
    80007158:	7422                	ld	s0,40(sp)
    8000715a:	6145                	addi	sp,sp,48
    8000715c:	8082                	ret

000000008000715e <exec>:

int
exec(char *path, char **argv)
{
    8000715e:	de010113          	addi	sp,sp,-544
    80007162:	20113c23          	sd	ra,536(sp)
    80007166:	20813823          	sd	s0,528(sp)
    8000716a:	20913423          	sd	s1,520(sp)
    8000716e:	1400                	addi	s0,sp,544
    80007170:	dea43423          	sd	a0,-536(s0)
    80007174:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007178:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    8000717c:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007180:	ffffb097          	auipc	ra,0xffffb
    80007184:	6c0080e7          	jalr	1728(ra) # 80002840 <myproc>
    80007188:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    8000718c:	fffff097          	auipc	ra,0xfffff
    80007190:	f30080e7          	jalr	-208(ra) # 800060bc <begin_op>

  if((ip = namei(path)) == 0){
    80007194:	de843503          	ld	a0,-536(s0)
    80007198:	fffff097          	auipc	ra,0xfffff
    8000719c:	bc0080e7          	jalr	-1088(ra) # 80005d58 <namei>
    800071a0:	faa43423          	sd	a0,-88(s0)
    800071a4:	fa843783          	ld	a5,-88(s0)
    800071a8:	e799                	bnez	a5,800071b6 <exec+0x58>
    end_op();
    800071aa:	fffff097          	auipc	ra,0xfffff
    800071ae:	fd4080e7          	jalr	-44(ra) # 8000617e <end_op>
    return -1;
    800071b2:	57fd                	li	a5,-1
    800071b4:	a199                	j	800075fa <exec+0x49c>
  }
  ilock(ip);
    800071b6:	fa843503          	ld	a0,-88(s0)
    800071ba:	ffffe097          	auipc	ra,0xffffe
    800071be:	e6a080e7          	jalr	-406(ra) # 80005024 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800071c2:	e3040793          	addi	a5,s0,-464
    800071c6:	04000713          	li	a4,64
    800071ca:	4681                	li	a3,0
    800071cc:	863e                	mv	a2,a5
    800071ce:	4581                	li	a1,0
    800071d0:	fa843503          	ld	a0,-88(s0)
    800071d4:	ffffe097          	auipc	ra,0xffffe
    800071d8:	406080e7          	jalr	1030(ra) # 800055da <readi>
    800071dc:	87aa                	mv	a5,a0
    800071de:	873e                	mv	a4,a5
    800071e0:	04000793          	li	a5,64
    800071e4:	3af71563          	bne	a4,a5,8000758e <exec+0x430>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800071e8:	e3042783          	lw	a5,-464(s0)
    800071ec:	873e                	mv	a4,a5
    800071ee:	464c47b7          	lui	a5,0x464c4
    800071f2:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800071f6:	38f71e63          	bne	a4,a5,80007592 <exec+0x434>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800071fa:	f9843503          	ld	a0,-104(s0)
    800071fe:	ffffc097          	auipc	ra,0xffffc
    80007202:	8a4080e7          	jalr	-1884(ra) # 80002aa2 <proc_pagetable>
    80007206:	faa43023          	sd	a0,-96(s0)
    8000720a:	fa043783          	ld	a5,-96(s0)
    8000720e:	38078463          	beqz	a5,80007596 <exec+0x438>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007212:	fc042623          	sw	zero,-52(s0)
    80007216:	e5043783          	ld	a5,-432(s0)
    8000721a:	fcf42423          	sw	a5,-56(s0)
    8000721e:	a0fd                	j	8000730c <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007220:	df840793          	addi	a5,s0,-520
    80007224:	fc842683          	lw	a3,-56(s0)
    80007228:	03800713          	li	a4,56
    8000722c:	863e                	mv	a2,a5
    8000722e:	4581                	li	a1,0
    80007230:	fa843503          	ld	a0,-88(s0)
    80007234:	ffffe097          	auipc	ra,0xffffe
    80007238:	3a6080e7          	jalr	934(ra) # 800055da <readi>
    8000723c:	87aa                	mv	a5,a0
    8000723e:	873e                	mv	a4,a5
    80007240:	03800793          	li	a5,56
    80007244:	34f71b63          	bne	a4,a5,8000759a <exec+0x43c>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007248:	df842783          	lw	a5,-520(s0)
    8000724c:	873e                	mv	a4,a5
    8000724e:	4785                	li	a5,1
    80007250:	0af71163          	bne	a4,a5,800072f2 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    80007254:	e2043703          	ld	a4,-480(s0)
    80007258:	e1843783          	ld	a5,-488(s0)
    8000725c:	34f76163          	bltu	a4,a5,8000759e <exec+0x440>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007260:	e0843703          	ld	a4,-504(s0)
    80007264:	e2043783          	ld	a5,-480(s0)
    80007268:	973e                	add	a4,a4,a5
    8000726a:	e0843783          	ld	a5,-504(s0)
    8000726e:	32f76a63          	bltu	a4,a5,800075a2 <exec+0x444>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007272:	e0843703          	ld	a4,-504(s0)
    80007276:	6785                	lui	a5,0x1
    80007278:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000727a:	8ff9                	and	a5,a5,a4
    8000727c:	32079563          	bnez	a5,800075a6 <exec+0x448>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007280:	e0843703          	ld	a4,-504(s0)
    80007284:	e2043783          	ld	a5,-480(s0)
    80007288:	00f704b3          	add	s1,a4,a5
    8000728c:	dfc42783          	lw	a5,-516(s0)
    80007290:	2781                	sext.w	a5,a5
    80007292:	853e                	mv	a0,a5
    80007294:	00000097          	auipc	ra,0x0
    80007298:	e88080e7          	jalr	-376(ra) # 8000711c <flags2perm>
    8000729c:	87aa                	mv	a5,a0
    8000729e:	86be                	mv	a3,a5
    800072a0:	8626                	mv	a2,s1
    800072a2:	fb843583          	ld	a1,-72(s0)
    800072a6:	fa043503          	ld	a0,-96(s0)
    800072aa:	ffffb097          	auipc	ra,0xffffb
    800072ae:	c74080e7          	jalr	-908(ra) # 80001f1e <uvmalloc>
    800072b2:	f6a43823          	sd	a0,-144(s0)
    800072b6:	f7043783          	ld	a5,-144(s0)
    800072ba:	2e078863          	beqz	a5,800075aa <exec+0x44c>
      goto bad;
    sz = sz1;
    800072be:	f7043783          	ld	a5,-144(s0)
    800072c2:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800072c6:	e0843783          	ld	a5,-504(s0)
    800072ca:	e0043703          	ld	a4,-512(s0)
    800072ce:	0007069b          	sext.w	a3,a4
    800072d2:	e1843703          	ld	a4,-488(s0)
    800072d6:	2701                	sext.w	a4,a4
    800072d8:	fa843603          	ld	a2,-88(s0)
    800072dc:	85be                	mv	a1,a5
    800072de:	fa043503          	ld	a0,-96(s0)
    800072e2:	00000097          	auipc	ra,0x0
    800072e6:	32c080e7          	jalr	812(ra) # 8000760e <loadseg>
    800072ea:	87aa                	mv	a5,a0
    800072ec:	2c07c163          	bltz	a5,800075ae <exec+0x450>
    800072f0:	a011                	j	800072f4 <exec+0x196>
      continue;
    800072f2:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800072f4:	fcc42783          	lw	a5,-52(s0)
    800072f8:	2785                	addiw	a5,a5,1
    800072fa:	fcf42623          	sw	a5,-52(s0)
    800072fe:	fc842783          	lw	a5,-56(s0)
    80007302:	0387879b          	addiw	a5,a5,56
    80007306:	2781                	sext.w	a5,a5
    80007308:	fcf42423          	sw	a5,-56(s0)
    8000730c:	e6845783          	lhu	a5,-408(s0)
    80007310:	0007871b          	sext.w	a4,a5
    80007314:	fcc42783          	lw	a5,-52(s0)
    80007318:	2781                	sext.w	a5,a5
    8000731a:	f0e7c3e3          	blt	a5,a4,80007220 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    8000731e:	fa843503          	ld	a0,-88(s0)
    80007322:	ffffe097          	auipc	ra,0xffffe
    80007326:	f60080e7          	jalr	-160(ra) # 80005282 <iunlockput>
  end_op();
    8000732a:	fffff097          	auipc	ra,0xfffff
    8000732e:	e54080e7          	jalr	-428(ra) # 8000617e <end_op>
  ip = 0;
    80007332:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007336:	ffffb097          	auipc	ra,0xffffb
    8000733a:	50a080e7          	jalr	1290(ra) # 80002840 <myproc>
    8000733e:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007342:	f9843783          	ld	a5,-104(s0)
    80007346:	67bc                	ld	a5,72(a5)
    80007348:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    8000734c:	fb843703          	ld	a4,-72(s0)
    80007350:	6785                	lui	a5,0x1
    80007352:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80007354:	973e                	add	a4,a4,a5
    80007356:	77fd                	lui	a5,0xfffff
    80007358:	8ff9                	and	a5,a5,a4
    8000735a:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    8000735e:	fb843703          	ld	a4,-72(s0)
    80007362:	6789                	lui	a5,0x2
    80007364:	97ba                	add	a5,a5,a4
    80007366:	4691                	li	a3,4
    80007368:	863e                	mv	a2,a5
    8000736a:	fb843583          	ld	a1,-72(s0)
    8000736e:	fa043503          	ld	a0,-96(s0)
    80007372:	ffffb097          	auipc	ra,0xffffb
    80007376:	bac080e7          	jalr	-1108(ra) # 80001f1e <uvmalloc>
    8000737a:	f8a43423          	sd	a0,-120(s0)
    8000737e:	f8843783          	ld	a5,-120(s0)
    80007382:	22078863          	beqz	a5,800075b2 <exec+0x454>
    goto bad;
  sz = sz1;
    80007386:	f8843783          	ld	a5,-120(s0)
    8000738a:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000738e:	fb843703          	ld	a4,-72(s0)
    80007392:	77f9                	lui	a5,0xffffe
    80007394:	97ba                	add	a5,a5,a4
    80007396:	85be                	mv	a1,a5
    80007398:	fa043503          	ld	a0,-96(s0)
    8000739c:	ffffb097          	auipc	ra,0xffffb
    800073a0:	f18080e7          	jalr	-232(ra) # 800022b4 <uvmclear>
  sp = sz;
    800073a4:	fb843783          	ld	a5,-72(s0)
    800073a8:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800073ac:	fb043703          	ld	a4,-80(s0)
    800073b0:	77fd                	lui	a5,0xfffff
    800073b2:	97ba                	add	a5,a5,a4
    800073b4:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800073b8:	fc043023          	sd	zero,-64(s0)
    800073bc:	a07d                	j	8000746a <exec+0x30c>
    if(argc >= MAXARG)
    800073be:	fc043703          	ld	a4,-64(s0)
    800073c2:	47fd                	li	a5,31
    800073c4:	1ee7e963          	bltu	a5,a4,800075b6 <exec+0x458>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800073c8:	fc043783          	ld	a5,-64(s0)
    800073cc:	078e                	slli	a5,a5,0x3
    800073ce:	de043703          	ld	a4,-544(s0)
    800073d2:	97ba                	add	a5,a5,a4
    800073d4:	639c                	ld	a5,0(a5)
    800073d6:	853e                	mv	a0,a5
    800073d8:	ffffa097          	auipc	ra,0xffffa
    800073dc:	3f4080e7          	jalr	1012(ra) # 800017cc <strlen>
    800073e0:	87aa                	mv	a5,a0
    800073e2:	2785                	addiw	a5,a5,1 # fffffffffffff001 <end+0xffffffff7ffda299>
    800073e4:	2781                	sext.w	a5,a5
    800073e6:	873e                	mv	a4,a5
    800073e8:	fb043783          	ld	a5,-80(s0)
    800073ec:	8f99                	sub	a5,a5,a4
    800073ee:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800073f2:	fb043783          	ld	a5,-80(s0)
    800073f6:	9bc1                	andi	a5,a5,-16
    800073f8:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800073fc:	fb043703          	ld	a4,-80(s0)
    80007400:	f8043783          	ld	a5,-128(s0)
    80007404:	1af76b63          	bltu	a4,a5,800075ba <exec+0x45c>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007408:	fc043783          	ld	a5,-64(s0)
    8000740c:	078e                	slli	a5,a5,0x3
    8000740e:	de043703          	ld	a4,-544(s0)
    80007412:	97ba                	add	a5,a5,a4
    80007414:	6384                	ld	s1,0(a5)
    80007416:	fc043783          	ld	a5,-64(s0)
    8000741a:	078e                	slli	a5,a5,0x3
    8000741c:	de043703          	ld	a4,-544(s0)
    80007420:	97ba                	add	a5,a5,a4
    80007422:	639c                	ld	a5,0(a5)
    80007424:	853e                	mv	a0,a5
    80007426:	ffffa097          	auipc	ra,0xffffa
    8000742a:	3a6080e7          	jalr	934(ra) # 800017cc <strlen>
    8000742e:	87aa                	mv	a5,a0
    80007430:	2785                	addiw	a5,a5,1
    80007432:	2781                	sext.w	a5,a5
    80007434:	86be                	mv	a3,a5
    80007436:	8626                	mv	a2,s1
    80007438:	fb043583          	ld	a1,-80(s0)
    8000743c:	fa043503          	ld	a0,-96(s0)
    80007440:	ffffb097          	auipc	ra,0xffffb
    80007444:	eca080e7          	jalr	-310(ra) # 8000230a <copyout>
    80007448:	87aa                	mv	a5,a0
    8000744a:	1607ca63          	bltz	a5,800075be <exec+0x460>
      goto bad;
    ustack[argc] = sp;
    8000744e:	fc043783          	ld	a5,-64(s0)
    80007452:	078e                	slli	a5,a5,0x3
    80007454:	1781                	addi	a5,a5,-32
    80007456:	97a2                	add	a5,a5,s0
    80007458:	fb043703          	ld	a4,-80(s0)
    8000745c:	e8e7b823          	sd	a4,-368(a5)
  for(argc = 0; argv[argc]; argc++) {
    80007460:	fc043783          	ld	a5,-64(s0)
    80007464:	0785                	addi	a5,a5,1
    80007466:	fcf43023          	sd	a5,-64(s0)
    8000746a:	fc043783          	ld	a5,-64(s0)
    8000746e:	078e                	slli	a5,a5,0x3
    80007470:	de043703          	ld	a4,-544(s0)
    80007474:	97ba                	add	a5,a5,a4
    80007476:	639c                	ld	a5,0(a5)
    80007478:	f3b9                	bnez	a5,800073be <exec+0x260>
  }
  ustack[argc] = 0;
    8000747a:	fc043783          	ld	a5,-64(s0)
    8000747e:	078e                	slli	a5,a5,0x3
    80007480:	1781                	addi	a5,a5,-32
    80007482:	97a2                	add	a5,a5,s0
    80007484:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007488:	fc043783          	ld	a5,-64(s0)
    8000748c:	0785                	addi	a5,a5,1
    8000748e:	078e                	slli	a5,a5,0x3
    80007490:	fb043703          	ld	a4,-80(s0)
    80007494:	40f707b3          	sub	a5,a4,a5
    80007498:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    8000749c:	fb043783          	ld	a5,-80(s0)
    800074a0:	9bc1                	andi	a5,a5,-16
    800074a2:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800074a6:	fb043703          	ld	a4,-80(s0)
    800074aa:	f8043783          	ld	a5,-128(s0)
    800074ae:	10f76a63          	bltu	a4,a5,800075c2 <exec+0x464>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800074b2:	fc043783          	ld	a5,-64(s0)
    800074b6:	0785                	addi	a5,a5,1
    800074b8:	00379713          	slli	a4,a5,0x3
    800074bc:	e7040793          	addi	a5,s0,-400
    800074c0:	86ba                	mv	a3,a4
    800074c2:	863e                	mv	a2,a5
    800074c4:	fb043583          	ld	a1,-80(s0)
    800074c8:	fa043503          	ld	a0,-96(s0)
    800074cc:	ffffb097          	auipc	ra,0xffffb
    800074d0:	e3e080e7          	jalr	-450(ra) # 8000230a <copyout>
    800074d4:	87aa                	mv	a5,a0
    800074d6:	0e07c863          	bltz	a5,800075c6 <exec+0x468>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800074da:	f9843783          	ld	a5,-104(s0)
    800074de:	6fbc                	ld	a5,88(a5)
    800074e0:	fb043703          	ld	a4,-80(s0)
    800074e4:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800074e6:	de843783          	ld	a5,-536(s0)
    800074ea:	fcf43c23          	sd	a5,-40(s0)
    800074ee:	fd843783          	ld	a5,-40(s0)
    800074f2:	fcf43823          	sd	a5,-48(s0)
    800074f6:	a025                	j	8000751e <exec+0x3c0>
    if(*s == '/')
    800074f8:	fd843783          	ld	a5,-40(s0)
    800074fc:	0007c783          	lbu	a5,0(a5)
    80007500:	873e                	mv	a4,a5
    80007502:	02f00793          	li	a5,47
    80007506:	00f71763          	bne	a4,a5,80007514 <exec+0x3b6>
      last = s+1;
    8000750a:	fd843783          	ld	a5,-40(s0)
    8000750e:	0785                	addi	a5,a5,1
    80007510:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007514:	fd843783          	ld	a5,-40(s0)
    80007518:	0785                	addi	a5,a5,1
    8000751a:	fcf43c23          	sd	a5,-40(s0)
    8000751e:	fd843783          	ld	a5,-40(s0)
    80007522:	0007c783          	lbu	a5,0(a5)
    80007526:	fbe9                	bnez	a5,800074f8 <exec+0x39a>
  safestrcpy(p->name, last, sizeof(p->name));
    80007528:	f9843783          	ld	a5,-104(s0)
    8000752c:	15878793          	addi	a5,a5,344
    80007530:	4641                	li	a2,16
    80007532:	fd043583          	ld	a1,-48(s0)
    80007536:	853e                	mv	a0,a5
    80007538:	ffffa097          	auipc	ra,0xffffa
    8000753c:	218080e7          	jalr	536(ra) # 80001750 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007540:	f9843783          	ld	a5,-104(s0)
    80007544:	6bbc                	ld	a5,80(a5)
    80007546:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    8000754a:	f9843783          	ld	a5,-104(s0)
    8000754e:	fa043703          	ld	a4,-96(s0)
    80007552:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007554:	f9843783          	ld	a5,-104(s0)
    80007558:	fb843703          	ld	a4,-72(s0)
    8000755c:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    8000755e:	f9843783          	ld	a5,-104(s0)
    80007562:	6fbc                	ld	a5,88(a5)
    80007564:	e4843703          	ld	a4,-440(s0)
    80007568:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8000756a:	f9843783          	ld	a5,-104(s0)
    8000756e:	6fbc                	ld	a5,88(a5)
    80007570:	fb043703          	ld	a4,-80(s0)
    80007574:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007576:	f9043583          	ld	a1,-112(s0)
    8000757a:	f7843503          	ld	a0,-136(s0)
    8000757e:	ffffb097          	auipc	ra,0xffffb
    80007582:	5e4080e7          	jalr	1508(ra) # 80002b62 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007586:	fc043783          	ld	a5,-64(s0)
    8000758a:	2781                	sext.w	a5,a5
    8000758c:	a0bd                	j	800075fa <exec+0x49c>
    goto bad;
    8000758e:	0001                	nop
    80007590:	a825                	j	800075c8 <exec+0x46a>
    goto bad;
    80007592:	0001                	nop
    80007594:	a815                	j	800075c8 <exec+0x46a>
    goto bad;
    80007596:	0001                	nop
    80007598:	a805                	j	800075c8 <exec+0x46a>
      goto bad;
    8000759a:	0001                	nop
    8000759c:	a035                	j	800075c8 <exec+0x46a>
      goto bad;
    8000759e:	0001                	nop
    800075a0:	a025                	j	800075c8 <exec+0x46a>
      goto bad;
    800075a2:	0001                	nop
    800075a4:	a015                	j	800075c8 <exec+0x46a>
      goto bad;
    800075a6:	0001                	nop
    800075a8:	a005                	j	800075c8 <exec+0x46a>
      goto bad;
    800075aa:	0001                	nop
    800075ac:	a831                	j	800075c8 <exec+0x46a>
      goto bad;
    800075ae:	0001                	nop
    800075b0:	a821                	j	800075c8 <exec+0x46a>
    goto bad;
    800075b2:	0001                	nop
    800075b4:	a811                	j	800075c8 <exec+0x46a>
      goto bad;
    800075b6:	0001                	nop
    800075b8:	a801                	j	800075c8 <exec+0x46a>
      goto bad;
    800075ba:	0001                	nop
    800075bc:	a031                	j	800075c8 <exec+0x46a>
      goto bad;
    800075be:	0001                	nop
    800075c0:	a021                	j	800075c8 <exec+0x46a>
    goto bad;
    800075c2:	0001                	nop
    800075c4:	a011                	j	800075c8 <exec+0x46a>
    goto bad;
    800075c6:	0001                	nop

 bad:
  if(pagetable)
    800075c8:	fa043783          	ld	a5,-96(s0)
    800075cc:	cb89                	beqz	a5,800075de <exec+0x480>
    proc_freepagetable(pagetable, sz);
    800075ce:	fb843583          	ld	a1,-72(s0)
    800075d2:	fa043503          	ld	a0,-96(s0)
    800075d6:	ffffb097          	auipc	ra,0xffffb
    800075da:	58c080e7          	jalr	1420(ra) # 80002b62 <proc_freepagetable>
  if(ip){
    800075de:	fa843783          	ld	a5,-88(s0)
    800075e2:	cb99                	beqz	a5,800075f8 <exec+0x49a>
    iunlockput(ip);
    800075e4:	fa843503          	ld	a0,-88(s0)
    800075e8:	ffffe097          	auipc	ra,0xffffe
    800075ec:	c9a080e7          	jalr	-870(ra) # 80005282 <iunlockput>
    end_op();
    800075f0:	fffff097          	auipc	ra,0xfffff
    800075f4:	b8e080e7          	jalr	-1138(ra) # 8000617e <end_op>
  }
  return -1;
    800075f8:	57fd                	li	a5,-1
}
    800075fa:	853e                	mv	a0,a5
    800075fc:	21813083          	ld	ra,536(sp)
    80007600:	21013403          	ld	s0,528(sp)
    80007604:	20813483          	ld	s1,520(sp)
    80007608:	22010113          	addi	sp,sp,544
    8000760c:	8082                	ret

000000008000760e <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    8000760e:	7139                	addi	sp,sp,-64
    80007610:	fc06                	sd	ra,56(sp)
    80007612:	f822                	sd	s0,48(sp)
    80007614:	0080                	addi	s0,sp,64
    80007616:	fca43c23          	sd	a0,-40(s0)
    8000761a:	fcb43823          	sd	a1,-48(s0)
    8000761e:	fcc43423          	sd	a2,-56(s0)
    80007622:	87b6                	mv	a5,a3
    80007624:	fcf42223          	sw	a5,-60(s0)
    80007628:	87ba                	mv	a5,a4
    8000762a:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    8000762e:	fe042623          	sw	zero,-20(s0)
    80007632:	a07d                	j	800076e0 <loadseg+0xd2>
    pa = walkaddr(pagetable, va + i);
    80007634:	fec46703          	lwu	a4,-20(s0)
    80007638:	fd043783          	ld	a5,-48(s0)
    8000763c:	97ba                	add	a5,a5,a4
    8000763e:	85be                	mv	a1,a5
    80007640:	fd843503          	ld	a0,-40(s0)
    80007644:	ffffa097          	auipc	ra,0xffffa
    80007648:	566080e7          	jalr	1382(ra) # 80001baa <walkaddr>
    8000764c:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007650:	fe043783          	ld	a5,-32(s0)
    80007654:	eb89                	bnez	a5,80007666 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007656:	00004517          	auipc	a0,0x4
    8000765a:	f9250513          	addi	a0,a0,-110 # 8000b5e8 <etext+0x5e8>
    8000765e:	ffff9097          	auipc	ra,0xffff9
    80007662:	62c080e7          	jalr	1580(ra) # 80000c8a <panic>
    if(sz - i < PGSIZE)
    80007666:	fc042783          	lw	a5,-64(s0)
    8000766a:	873e                	mv	a4,a5
    8000766c:	fec42783          	lw	a5,-20(s0)
    80007670:	40f707bb          	subw	a5,a4,a5
    80007674:	2781                	sext.w	a5,a5
    80007676:	873e                	mv	a4,a5
    80007678:	6785                	lui	a5,0x1
    8000767a:	00f77c63          	bgeu	a4,a5,80007692 <loadseg+0x84>
      n = sz - i;
    8000767e:	fc042783          	lw	a5,-64(s0)
    80007682:	873e                	mv	a4,a5
    80007684:	fec42783          	lw	a5,-20(s0)
    80007688:	40f707bb          	subw	a5,a4,a5
    8000768c:	fef42423          	sw	a5,-24(s0)
    80007690:	a021                	j	80007698 <loadseg+0x8a>
    else
      n = PGSIZE;
    80007692:	6785                	lui	a5,0x1
    80007694:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007698:	fc442783          	lw	a5,-60(s0)
    8000769c:	873e                	mv	a4,a5
    8000769e:	fec42783          	lw	a5,-20(s0)
    800076a2:	9fb9                	addw	a5,a5,a4
    800076a4:	2781                	sext.w	a5,a5
    800076a6:	fe842703          	lw	a4,-24(s0)
    800076aa:	86be                	mv	a3,a5
    800076ac:	fe043603          	ld	a2,-32(s0)
    800076b0:	4581                	li	a1,0
    800076b2:	fc843503          	ld	a0,-56(s0)
    800076b6:	ffffe097          	auipc	ra,0xffffe
    800076ba:	f24080e7          	jalr	-220(ra) # 800055da <readi>
    800076be:	87aa                	mv	a5,a0
    800076c0:	0007871b          	sext.w	a4,a5
    800076c4:	fe842783          	lw	a5,-24(s0)
    800076c8:	2781                	sext.w	a5,a5
    800076ca:	00e78463          	beq	a5,a4,800076d2 <loadseg+0xc4>
      return -1;
    800076ce:	57fd                	li	a5,-1
    800076d0:	a015                	j	800076f4 <loadseg+0xe6>
  for(i = 0; i < sz; i += PGSIZE){
    800076d2:	fec42783          	lw	a5,-20(s0)
    800076d6:	873e                	mv	a4,a5
    800076d8:	6785                	lui	a5,0x1
    800076da:	9fb9                	addw	a5,a5,a4
    800076dc:	fef42623          	sw	a5,-20(s0)
    800076e0:	fec42783          	lw	a5,-20(s0)
    800076e4:	873e                	mv	a4,a5
    800076e6:	fc042783          	lw	a5,-64(s0)
    800076ea:	2701                	sext.w	a4,a4
    800076ec:	2781                	sext.w	a5,a5
    800076ee:	f4f763e3          	bltu	a4,a5,80007634 <loadseg+0x26>
  }
  
  return 0;
    800076f2:	4781                	li	a5,0
}
    800076f4:	853e                	mv	a0,a5
    800076f6:	70e2                	ld	ra,56(sp)
    800076f8:	7442                	ld	s0,48(sp)
    800076fa:	6121                	addi	sp,sp,64
    800076fc:	8082                	ret

00000000800076fe <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800076fe:	7139                	addi	sp,sp,-64
    80007700:	fc06                	sd	ra,56(sp)
    80007702:	f822                	sd	s0,48(sp)
    80007704:	0080                	addi	s0,sp,64
    80007706:	87aa                	mv	a5,a0
    80007708:	fcb43823          	sd	a1,-48(s0)
    8000770c:	fcc43423          	sd	a2,-56(s0)
    80007710:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007714:	fe440713          	addi	a4,s0,-28
    80007718:	fdc42783          	lw	a5,-36(s0)
    8000771c:	85ba                	mv	a1,a4
    8000771e:	853e                	mv	a0,a5
    80007720:	ffffd097          	auipc	ra,0xffffd
    80007724:	97e080e7          	jalr	-1666(ra) # 8000409e <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007728:	fe442783          	lw	a5,-28(s0)
    8000772c:	0207c863          	bltz	a5,8000775c <argfd+0x5e>
    80007730:	fe442783          	lw	a5,-28(s0)
    80007734:	873e                	mv	a4,a5
    80007736:	47bd                	li	a5,15
    80007738:	02e7c263          	blt	a5,a4,8000775c <argfd+0x5e>
    8000773c:	ffffb097          	auipc	ra,0xffffb
    80007740:	104080e7          	jalr	260(ra) # 80002840 <myproc>
    80007744:	872a                	mv	a4,a0
    80007746:	fe442783          	lw	a5,-28(s0)
    8000774a:	07e9                	addi	a5,a5,26 # 101a <_entry-0x7fffefe6>
    8000774c:	078e                	slli	a5,a5,0x3
    8000774e:	97ba                	add	a5,a5,a4
    80007750:	639c                	ld	a5,0(a5)
    80007752:	fef43423          	sd	a5,-24(s0)
    80007756:	fe843783          	ld	a5,-24(s0)
    8000775a:	e399                	bnez	a5,80007760 <argfd+0x62>
    return -1;
    8000775c:	57fd                	li	a5,-1
    8000775e:	a015                	j	80007782 <argfd+0x84>
  if(pfd)
    80007760:	fd043783          	ld	a5,-48(s0)
    80007764:	c791                	beqz	a5,80007770 <argfd+0x72>
    *pfd = fd;
    80007766:	fe442703          	lw	a4,-28(s0)
    8000776a:	fd043783          	ld	a5,-48(s0)
    8000776e:	c398                	sw	a4,0(a5)
  if(pf)
    80007770:	fc843783          	ld	a5,-56(s0)
    80007774:	c791                	beqz	a5,80007780 <argfd+0x82>
    *pf = f;
    80007776:	fc843783          	ld	a5,-56(s0)
    8000777a:	fe843703          	ld	a4,-24(s0)
    8000777e:	e398                	sd	a4,0(a5)
  return 0;
    80007780:	4781                	li	a5,0
}
    80007782:	853e                	mv	a0,a5
    80007784:	70e2                	ld	ra,56(sp)
    80007786:	7442                	ld	s0,48(sp)
    80007788:	6121                	addi	sp,sp,64
    8000778a:	8082                	ret

000000008000778c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8000778c:	7179                	addi	sp,sp,-48
    8000778e:	f406                	sd	ra,40(sp)
    80007790:	f022                	sd	s0,32(sp)
    80007792:	1800                	addi	s0,sp,48
    80007794:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007798:	ffffb097          	auipc	ra,0xffffb
    8000779c:	0a8080e7          	jalr	168(ra) # 80002840 <myproc>
    800077a0:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    800077a4:	fe042623          	sw	zero,-20(s0)
    800077a8:	a825                	j	800077e0 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    800077aa:	fe043703          	ld	a4,-32(s0)
    800077ae:	fec42783          	lw	a5,-20(s0)
    800077b2:	07e9                	addi	a5,a5,26
    800077b4:	078e                	slli	a5,a5,0x3
    800077b6:	97ba                	add	a5,a5,a4
    800077b8:	639c                	ld	a5,0(a5)
    800077ba:	ef91                	bnez	a5,800077d6 <fdalloc+0x4a>
      p->ofile[fd] = f;
    800077bc:	fe043703          	ld	a4,-32(s0)
    800077c0:	fec42783          	lw	a5,-20(s0)
    800077c4:	07e9                	addi	a5,a5,26
    800077c6:	078e                	slli	a5,a5,0x3
    800077c8:	97ba                	add	a5,a5,a4
    800077ca:	fd843703          	ld	a4,-40(s0)
    800077ce:	e398                	sd	a4,0(a5)
      return fd;
    800077d0:	fec42783          	lw	a5,-20(s0)
    800077d4:	a831                	j	800077f0 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    800077d6:	fec42783          	lw	a5,-20(s0)
    800077da:	2785                	addiw	a5,a5,1
    800077dc:	fef42623          	sw	a5,-20(s0)
    800077e0:	fec42783          	lw	a5,-20(s0)
    800077e4:	0007871b          	sext.w	a4,a5
    800077e8:	47bd                	li	a5,15
    800077ea:	fce7d0e3          	bge	a5,a4,800077aa <fdalloc+0x1e>
    }
  }
  return -1;
    800077ee:	57fd                	li	a5,-1
}
    800077f0:	853e                	mv	a0,a5
    800077f2:	70a2                	ld	ra,40(sp)
    800077f4:	7402                	ld	s0,32(sp)
    800077f6:	6145                	addi	sp,sp,48
    800077f8:	8082                	ret

00000000800077fa <sys_dup>:

uint64
sys_dup(void)
{
    800077fa:	1101                	addi	sp,sp,-32
    800077fc:	ec06                	sd	ra,24(sp)
    800077fe:	e822                	sd	s0,16(sp)
    80007800:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007802:	fe040793          	addi	a5,s0,-32
    80007806:	863e                	mv	a2,a5
    80007808:	4581                	li	a1,0
    8000780a:	4501                	li	a0,0
    8000780c:	00000097          	auipc	ra,0x0
    80007810:	ef2080e7          	jalr	-270(ra) # 800076fe <argfd>
    80007814:	87aa                	mv	a5,a0
    80007816:	0007d463          	bgez	a5,8000781e <sys_dup+0x24>
    return -1;
    8000781a:	57fd                	li	a5,-1
    8000781c:	a81d                	j	80007852 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    8000781e:	fe043783          	ld	a5,-32(s0)
    80007822:	853e                	mv	a0,a5
    80007824:	00000097          	auipc	ra,0x0
    80007828:	f68080e7          	jalr	-152(ra) # 8000778c <fdalloc>
    8000782c:	87aa                	mv	a5,a0
    8000782e:	fef42623          	sw	a5,-20(s0)
    80007832:	fec42783          	lw	a5,-20(s0)
    80007836:	2781                	sext.w	a5,a5
    80007838:	0007d463          	bgez	a5,80007840 <sys_dup+0x46>
    return -1;
    8000783c:	57fd                	li	a5,-1
    8000783e:	a811                	j	80007852 <sys_dup+0x58>
  filedup(f);
    80007840:	fe043783          	ld	a5,-32(s0)
    80007844:	853e                	mv	a0,a5
    80007846:	fffff097          	auipc	ra,0xfffff
    8000784a:	eaa080e7          	jalr	-342(ra) # 800066f0 <filedup>
  return fd;
    8000784e:	fec42783          	lw	a5,-20(s0)
}
    80007852:	853e                	mv	a0,a5
    80007854:	60e2                	ld	ra,24(sp)
    80007856:	6442                	ld	s0,16(sp)
    80007858:	6105                	addi	sp,sp,32
    8000785a:	8082                	ret

000000008000785c <sys_read>:

uint64
sys_read(void)
{
    8000785c:	7179                	addi	sp,sp,-48
    8000785e:	f406                	sd	ra,40(sp)
    80007860:	f022                	sd	s0,32(sp)
    80007862:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007864:	fd840793          	addi	a5,s0,-40
    80007868:	85be                	mv	a1,a5
    8000786a:	4505                	li	a0,1
    8000786c:	ffffd097          	auipc	ra,0xffffd
    80007870:	868080e7          	jalr	-1944(ra) # 800040d4 <argaddr>
  argint(2, &n);
    80007874:	fe440793          	addi	a5,s0,-28
    80007878:	85be                	mv	a1,a5
    8000787a:	4509                	li	a0,2
    8000787c:	ffffd097          	auipc	ra,0xffffd
    80007880:	822080e7          	jalr	-2014(ra) # 8000409e <argint>
  if(argfd(0, 0, &f) < 0)
    80007884:	fe840793          	addi	a5,s0,-24
    80007888:	863e                	mv	a2,a5
    8000788a:	4581                	li	a1,0
    8000788c:	4501                	li	a0,0
    8000788e:	00000097          	auipc	ra,0x0
    80007892:	e70080e7          	jalr	-400(ra) # 800076fe <argfd>
    80007896:	87aa                	mv	a5,a0
    80007898:	0007d463          	bgez	a5,800078a0 <sys_read+0x44>
    return -1;
    8000789c:	57fd                	li	a5,-1
    8000789e:	a839                	j	800078bc <sys_read+0x60>
  return fileread(f, p, n);
    800078a0:	fe843783          	ld	a5,-24(s0)
    800078a4:	fd843703          	ld	a4,-40(s0)
    800078a8:	fe442683          	lw	a3,-28(s0)
    800078ac:	8636                	mv	a2,a3
    800078ae:	85ba                	mv	a1,a4
    800078b0:	853e                	mv	a0,a5
    800078b2:	fffff097          	auipc	ra,0xfffff
    800078b6:	050080e7          	jalr	80(ra) # 80006902 <fileread>
    800078ba:	87aa                	mv	a5,a0
}
    800078bc:	853e                	mv	a0,a5
    800078be:	70a2                	ld	ra,40(sp)
    800078c0:	7402                	ld	s0,32(sp)
    800078c2:	6145                	addi	sp,sp,48
    800078c4:	8082                	ret

00000000800078c6 <sys_write>:

uint64
sys_write(void)
{
    800078c6:	7179                	addi	sp,sp,-48
    800078c8:	f406                	sd	ra,40(sp)
    800078ca:	f022                	sd	s0,32(sp)
    800078cc:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    800078ce:	fd840793          	addi	a5,s0,-40
    800078d2:	85be                	mv	a1,a5
    800078d4:	4505                	li	a0,1
    800078d6:	ffffc097          	auipc	ra,0xffffc
    800078da:	7fe080e7          	jalr	2046(ra) # 800040d4 <argaddr>
  argint(2, &n);
    800078de:	fe440793          	addi	a5,s0,-28
    800078e2:	85be                	mv	a1,a5
    800078e4:	4509                	li	a0,2
    800078e6:	ffffc097          	auipc	ra,0xffffc
    800078ea:	7b8080e7          	jalr	1976(ra) # 8000409e <argint>
  if(argfd(0, 0, &f) < 0)
    800078ee:	fe840793          	addi	a5,s0,-24
    800078f2:	863e                	mv	a2,a5
    800078f4:	4581                	li	a1,0
    800078f6:	4501                	li	a0,0
    800078f8:	00000097          	auipc	ra,0x0
    800078fc:	e06080e7          	jalr	-506(ra) # 800076fe <argfd>
    80007900:	87aa                	mv	a5,a0
    80007902:	0007d463          	bgez	a5,8000790a <sys_write+0x44>
    return -1;
    80007906:	57fd                	li	a5,-1
    80007908:	a839                	j	80007926 <sys_write+0x60>

  return filewrite(f, p, n);
    8000790a:	fe843783          	ld	a5,-24(s0)
    8000790e:	fd843703          	ld	a4,-40(s0)
    80007912:	fe442683          	lw	a3,-28(s0)
    80007916:	8636                	mv	a2,a3
    80007918:	85ba                	mv	a1,a4
    8000791a:	853e                	mv	a0,a5
    8000791c:	fffff097          	auipc	ra,0xfffff
    80007920:	14c080e7          	jalr	332(ra) # 80006a68 <filewrite>
    80007924:	87aa                	mv	a5,a0
}
    80007926:	853e                	mv	a0,a5
    80007928:	70a2                	ld	ra,40(sp)
    8000792a:	7402                	ld	s0,32(sp)
    8000792c:	6145                	addi	sp,sp,48
    8000792e:	8082                	ret

0000000080007930 <sys_close>:

uint64
sys_close(void)
{
    80007930:	1101                	addi	sp,sp,-32
    80007932:	ec06                	sd	ra,24(sp)
    80007934:	e822                	sd	s0,16(sp)
    80007936:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007938:	fe040713          	addi	a4,s0,-32
    8000793c:	fec40793          	addi	a5,s0,-20
    80007940:	863a                	mv	a2,a4
    80007942:	85be                	mv	a1,a5
    80007944:	4501                	li	a0,0
    80007946:	00000097          	auipc	ra,0x0
    8000794a:	db8080e7          	jalr	-584(ra) # 800076fe <argfd>
    8000794e:	87aa                	mv	a5,a0
    80007950:	0007d463          	bgez	a5,80007958 <sys_close+0x28>
    return -1;
    80007954:	57fd                	li	a5,-1
    80007956:	a02d                	j	80007980 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007958:	ffffb097          	auipc	ra,0xffffb
    8000795c:	ee8080e7          	jalr	-280(ra) # 80002840 <myproc>
    80007960:	872a                	mv	a4,a0
    80007962:	fec42783          	lw	a5,-20(s0)
    80007966:	07e9                	addi	a5,a5,26
    80007968:	078e                	slli	a5,a5,0x3
    8000796a:	97ba                	add	a5,a5,a4
    8000796c:	0007b023          	sd	zero,0(a5)
  fileclose(f);
    80007970:	fe043783          	ld	a5,-32(s0)
    80007974:	853e                	mv	a0,a5
    80007976:	fffff097          	auipc	ra,0xfffff
    8000797a:	de0080e7          	jalr	-544(ra) # 80006756 <fileclose>
  return 0;
    8000797e:	4781                	li	a5,0
}
    80007980:	853e                	mv	a0,a5
    80007982:	60e2                	ld	ra,24(sp)
    80007984:	6442                	ld	s0,16(sp)
    80007986:	6105                	addi	sp,sp,32
    80007988:	8082                	ret

000000008000798a <sys_fstat>:

uint64
sys_fstat(void)
{
    8000798a:	1101                	addi	sp,sp,-32
    8000798c:	ec06                	sd	ra,24(sp)
    8000798e:	e822                	sd	s0,16(sp)
    80007990:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007992:	fe040793          	addi	a5,s0,-32
    80007996:	85be                	mv	a1,a5
    80007998:	4505                	li	a0,1
    8000799a:	ffffc097          	auipc	ra,0xffffc
    8000799e:	73a080e7          	jalr	1850(ra) # 800040d4 <argaddr>
  if(argfd(0, 0, &f) < 0)
    800079a2:	fe840793          	addi	a5,s0,-24
    800079a6:	863e                	mv	a2,a5
    800079a8:	4581                	li	a1,0
    800079aa:	4501                	li	a0,0
    800079ac:	00000097          	auipc	ra,0x0
    800079b0:	d52080e7          	jalr	-686(ra) # 800076fe <argfd>
    800079b4:	87aa                	mv	a5,a0
    800079b6:	0007d463          	bgez	a5,800079be <sys_fstat+0x34>
    return -1;
    800079ba:	57fd                	li	a5,-1
    800079bc:	a821                	j	800079d4 <sys_fstat+0x4a>
  return filestat(f, st);
    800079be:	fe843783          	ld	a5,-24(s0)
    800079c2:	fe043703          	ld	a4,-32(s0)
    800079c6:	85ba                	mv	a1,a4
    800079c8:	853e                	mv	a0,a5
    800079ca:	fffff097          	auipc	ra,0xfffff
    800079ce:	e94080e7          	jalr	-364(ra) # 8000685e <filestat>
    800079d2:	87aa                	mv	a5,a0
}
    800079d4:	853e                	mv	a0,a5
    800079d6:	60e2                	ld	ra,24(sp)
    800079d8:	6442                	ld	s0,16(sp)
    800079da:	6105                	addi	sp,sp,32
    800079dc:	8082                	ret

00000000800079de <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    800079de:	7169                	addi	sp,sp,-304
    800079e0:	f606                	sd	ra,296(sp)
    800079e2:	f222                	sd	s0,288(sp)
    800079e4:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    800079e6:	ed040793          	addi	a5,s0,-304
    800079ea:	08000613          	li	a2,128
    800079ee:	85be                	mv	a1,a5
    800079f0:	4501                	li	a0,0
    800079f2:	ffffc097          	auipc	ra,0xffffc
    800079f6:	714080e7          	jalr	1812(ra) # 80004106 <argstr>
    800079fa:	87aa                	mv	a5,a0
    800079fc:	0007cf63          	bltz	a5,80007a1a <sys_link+0x3c>
    80007a00:	f5040793          	addi	a5,s0,-176
    80007a04:	08000613          	li	a2,128
    80007a08:	85be                	mv	a1,a5
    80007a0a:	4505                	li	a0,1
    80007a0c:	ffffc097          	auipc	ra,0xffffc
    80007a10:	6fa080e7          	jalr	1786(ra) # 80004106 <argstr>
    80007a14:	87aa                	mv	a5,a0
    80007a16:	0007d463          	bgez	a5,80007a1e <sys_link+0x40>
    return -1;
    80007a1a:	57fd                	li	a5,-1
    80007a1c:	aab5                	j	80007b98 <sys_link+0x1ba>

  begin_op();
    80007a1e:	ffffe097          	auipc	ra,0xffffe
    80007a22:	69e080e7          	jalr	1694(ra) # 800060bc <begin_op>
  if((ip = namei(old)) == 0){
    80007a26:	ed040793          	addi	a5,s0,-304
    80007a2a:	853e                	mv	a0,a5
    80007a2c:	ffffe097          	auipc	ra,0xffffe
    80007a30:	32c080e7          	jalr	812(ra) # 80005d58 <namei>
    80007a34:	fea43423          	sd	a0,-24(s0)
    80007a38:	fe843783          	ld	a5,-24(s0)
    80007a3c:	e799                	bnez	a5,80007a4a <sys_link+0x6c>
    end_op();
    80007a3e:	ffffe097          	auipc	ra,0xffffe
    80007a42:	740080e7          	jalr	1856(ra) # 8000617e <end_op>
    return -1;
    80007a46:	57fd                	li	a5,-1
    80007a48:	aa81                	j	80007b98 <sys_link+0x1ba>
  }

  ilock(ip);
    80007a4a:	fe843503          	ld	a0,-24(s0)
    80007a4e:	ffffd097          	auipc	ra,0xffffd
    80007a52:	5d6080e7          	jalr	1494(ra) # 80005024 <ilock>
  if(ip->type == T_DIR){
    80007a56:	fe843783          	ld	a5,-24(s0)
    80007a5a:	04479783          	lh	a5,68(a5)
    80007a5e:	0007871b          	sext.w	a4,a5
    80007a62:	4785                	li	a5,1
    80007a64:	00f71e63          	bne	a4,a5,80007a80 <sys_link+0xa2>
    iunlockput(ip);
    80007a68:	fe843503          	ld	a0,-24(s0)
    80007a6c:	ffffe097          	auipc	ra,0xffffe
    80007a70:	816080e7          	jalr	-2026(ra) # 80005282 <iunlockput>
    end_op();
    80007a74:	ffffe097          	auipc	ra,0xffffe
    80007a78:	70a080e7          	jalr	1802(ra) # 8000617e <end_op>
    return -1;
    80007a7c:	57fd                	li	a5,-1
    80007a7e:	aa29                	j	80007b98 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007a80:	fe843783          	ld	a5,-24(s0)
    80007a84:	04a79783          	lh	a5,74(a5)
    80007a88:	17c2                	slli	a5,a5,0x30
    80007a8a:	93c1                	srli	a5,a5,0x30
    80007a8c:	2785                	addiw	a5,a5,1
    80007a8e:	17c2                	slli	a5,a5,0x30
    80007a90:	93c1                	srli	a5,a5,0x30
    80007a92:	0107971b          	slliw	a4,a5,0x10
    80007a96:	4107571b          	sraiw	a4,a4,0x10
    80007a9a:	fe843783          	ld	a5,-24(s0)
    80007a9e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007aa2:	fe843503          	ld	a0,-24(s0)
    80007aa6:	ffffd097          	auipc	ra,0xffffd
    80007aaa:	32e080e7          	jalr	814(ra) # 80004dd4 <iupdate>
  iunlock(ip);
    80007aae:	fe843503          	ld	a0,-24(s0)
    80007ab2:	ffffd097          	auipc	ra,0xffffd
    80007ab6:	6a6080e7          	jalr	1702(ra) # 80005158 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007aba:	fd040713          	addi	a4,s0,-48
    80007abe:	f5040793          	addi	a5,s0,-176
    80007ac2:	85ba                	mv	a1,a4
    80007ac4:	853e                	mv	a0,a5
    80007ac6:	ffffe097          	auipc	ra,0xffffe
    80007aca:	2be080e7          	jalr	702(ra) # 80005d84 <nameiparent>
    80007ace:	fea43023          	sd	a0,-32(s0)
    80007ad2:	fe043783          	ld	a5,-32(s0)
    80007ad6:	cba5                	beqz	a5,80007b46 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007ad8:	fe043503          	ld	a0,-32(s0)
    80007adc:	ffffd097          	auipc	ra,0xffffd
    80007ae0:	548080e7          	jalr	1352(ra) # 80005024 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007ae4:	fe043783          	ld	a5,-32(s0)
    80007ae8:	4398                	lw	a4,0(a5)
    80007aea:	fe843783          	ld	a5,-24(s0)
    80007aee:	439c                	lw	a5,0(a5)
    80007af0:	02f71263          	bne	a4,a5,80007b14 <sys_link+0x136>
    80007af4:	fe843783          	ld	a5,-24(s0)
    80007af8:	43d8                	lw	a4,4(a5)
    80007afa:	fd040793          	addi	a5,s0,-48
    80007afe:	863a                	mv	a2,a4
    80007b00:	85be                	mv	a1,a5
    80007b02:	fe043503          	ld	a0,-32(s0)
    80007b06:	ffffe097          	auipc	ra,0xffffe
    80007b0a:	f44080e7          	jalr	-188(ra) # 80005a4a <dirlink>
    80007b0e:	87aa                	mv	a5,a0
    80007b10:	0007d963          	bgez	a5,80007b22 <sys_link+0x144>
    iunlockput(dp);
    80007b14:	fe043503          	ld	a0,-32(s0)
    80007b18:	ffffd097          	auipc	ra,0xffffd
    80007b1c:	76a080e7          	jalr	1898(ra) # 80005282 <iunlockput>
    goto bad;
    80007b20:	a025                	j	80007b48 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007b22:	fe043503          	ld	a0,-32(s0)
    80007b26:	ffffd097          	auipc	ra,0xffffd
    80007b2a:	75c080e7          	jalr	1884(ra) # 80005282 <iunlockput>
  iput(ip);
    80007b2e:	fe843503          	ld	a0,-24(s0)
    80007b32:	ffffd097          	auipc	ra,0xffffd
    80007b36:	680080e7          	jalr	1664(ra) # 800051b2 <iput>

  end_op();
    80007b3a:	ffffe097          	auipc	ra,0xffffe
    80007b3e:	644080e7          	jalr	1604(ra) # 8000617e <end_op>

  return 0;
    80007b42:	4781                	li	a5,0
    80007b44:	a891                	j	80007b98 <sys_link+0x1ba>
    goto bad;
    80007b46:	0001                	nop

bad:
  ilock(ip);
    80007b48:	fe843503          	ld	a0,-24(s0)
    80007b4c:	ffffd097          	auipc	ra,0xffffd
    80007b50:	4d8080e7          	jalr	1240(ra) # 80005024 <ilock>
  ip->nlink--;
    80007b54:	fe843783          	ld	a5,-24(s0)
    80007b58:	04a79783          	lh	a5,74(a5)
    80007b5c:	17c2                	slli	a5,a5,0x30
    80007b5e:	93c1                	srli	a5,a5,0x30
    80007b60:	37fd                	addiw	a5,a5,-1
    80007b62:	17c2                	slli	a5,a5,0x30
    80007b64:	93c1                	srli	a5,a5,0x30
    80007b66:	0107971b          	slliw	a4,a5,0x10
    80007b6a:	4107571b          	sraiw	a4,a4,0x10
    80007b6e:	fe843783          	ld	a5,-24(s0)
    80007b72:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007b76:	fe843503          	ld	a0,-24(s0)
    80007b7a:	ffffd097          	auipc	ra,0xffffd
    80007b7e:	25a080e7          	jalr	602(ra) # 80004dd4 <iupdate>
  iunlockput(ip);
    80007b82:	fe843503          	ld	a0,-24(s0)
    80007b86:	ffffd097          	auipc	ra,0xffffd
    80007b8a:	6fc080e7          	jalr	1788(ra) # 80005282 <iunlockput>
  end_op();
    80007b8e:	ffffe097          	auipc	ra,0xffffe
    80007b92:	5f0080e7          	jalr	1520(ra) # 8000617e <end_op>
  return -1;
    80007b96:	57fd                	li	a5,-1
}
    80007b98:	853e                	mv	a0,a5
    80007b9a:	70b2                	ld	ra,296(sp)
    80007b9c:	7412                	ld	s0,288(sp)
    80007b9e:	6155                	addi	sp,sp,304
    80007ba0:	8082                	ret

0000000080007ba2 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007ba2:	7139                	addi	sp,sp,-64
    80007ba4:	fc06                	sd	ra,56(sp)
    80007ba6:	f822                	sd	s0,48(sp)
    80007ba8:	0080                	addi	s0,sp,64
    80007baa:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007bae:	02000793          	li	a5,32
    80007bb2:	fef42623          	sw	a5,-20(s0)
    80007bb6:	a0b1                	j	80007c02 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007bb8:	fd840793          	addi	a5,s0,-40
    80007bbc:	fec42683          	lw	a3,-20(s0)
    80007bc0:	4741                	li	a4,16
    80007bc2:	863e                	mv	a2,a5
    80007bc4:	4581                	li	a1,0
    80007bc6:	fc843503          	ld	a0,-56(s0)
    80007bca:	ffffe097          	auipc	ra,0xffffe
    80007bce:	a10080e7          	jalr	-1520(ra) # 800055da <readi>
    80007bd2:	87aa                	mv	a5,a0
    80007bd4:	873e                	mv	a4,a5
    80007bd6:	47c1                	li	a5,16
    80007bd8:	00f70a63          	beq	a4,a5,80007bec <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007bdc:	00004517          	auipc	a0,0x4
    80007be0:	a2c50513          	addi	a0,a0,-1492 # 8000b608 <etext+0x608>
    80007be4:	ffff9097          	auipc	ra,0xffff9
    80007be8:	0a6080e7          	jalr	166(ra) # 80000c8a <panic>
    if(de.inum != 0)
    80007bec:	fd845783          	lhu	a5,-40(s0)
    80007bf0:	c399                	beqz	a5,80007bf6 <isdirempty+0x54>
      return 0;
    80007bf2:	4781                	li	a5,0
    80007bf4:	a839                	j	80007c12 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007bf6:	fec42783          	lw	a5,-20(s0)
    80007bfa:	27c1                	addiw	a5,a5,16
    80007bfc:	2781                	sext.w	a5,a5
    80007bfe:	fef42623          	sw	a5,-20(s0)
    80007c02:	fc843783          	ld	a5,-56(s0)
    80007c06:	47f8                	lw	a4,76(a5)
    80007c08:	fec42783          	lw	a5,-20(s0)
    80007c0c:	fae7e6e3          	bltu	a5,a4,80007bb8 <isdirempty+0x16>
  }
  return 1;
    80007c10:	4785                	li	a5,1
}
    80007c12:	853e                	mv	a0,a5
    80007c14:	70e2                	ld	ra,56(sp)
    80007c16:	7442                	ld	s0,48(sp)
    80007c18:	6121                	addi	sp,sp,64
    80007c1a:	8082                	ret

0000000080007c1c <sys_unlink>:

uint64
sys_unlink(void)
{
    80007c1c:	7155                	addi	sp,sp,-208
    80007c1e:	e586                	sd	ra,200(sp)
    80007c20:	e1a2                	sd	s0,192(sp)
    80007c22:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007c24:	f4040793          	addi	a5,s0,-192
    80007c28:	08000613          	li	a2,128
    80007c2c:	85be                	mv	a1,a5
    80007c2e:	4501                	li	a0,0
    80007c30:	ffffc097          	auipc	ra,0xffffc
    80007c34:	4d6080e7          	jalr	1238(ra) # 80004106 <argstr>
    80007c38:	87aa                	mv	a5,a0
    80007c3a:	0007d463          	bgez	a5,80007c42 <sys_unlink+0x26>
    return -1;
    80007c3e:	57fd                	li	a5,-1
    80007c40:	a2ed                	j	80007e2a <sys_unlink+0x20e>

  begin_op();
    80007c42:	ffffe097          	auipc	ra,0xffffe
    80007c46:	47a080e7          	jalr	1146(ra) # 800060bc <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007c4a:	fc040713          	addi	a4,s0,-64
    80007c4e:	f4040793          	addi	a5,s0,-192
    80007c52:	85ba                	mv	a1,a4
    80007c54:	853e                	mv	a0,a5
    80007c56:	ffffe097          	auipc	ra,0xffffe
    80007c5a:	12e080e7          	jalr	302(ra) # 80005d84 <nameiparent>
    80007c5e:	fea43423          	sd	a0,-24(s0)
    80007c62:	fe843783          	ld	a5,-24(s0)
    80007c66:	e799                	bnez	a5,80007c74 <sys_unlink+0x58>
    end_op();
    80007c68:	ffffe097          	auipc	ra,0xffffe
    80007c6c:	516080e7          	jalr	1302(ra) # 8000617e <end_op>
    return -1;
    80007c70:	57fd                	li	a5,-1
    80007c72:	aa65                	j	80007e2a <sys_unlink+0x20e>
  }

  ilock(dp);
    80007c74:	fe843503          	ld	a0,-24(s0)
    80007c78:	ffffd097          	auipc	ra,0xffffd
    80007c7c:	3ac080e7          	jalr	940(ra) # 80005024 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007c80:	fc040793          	addi	a5,s0,-64
    80007c84:	00004597          	auipc	a1,0x4
    80007c88:	99c58593          	addi	a1,a1,-1636 # 8000b620 <etext+0x620>
    80007c8c:	853e                	mv	a0,a5
    80007c8e:	ffffe097          	auipc	ra,0xffffe
    80007c92:	ca6080e7          	jalr	-858(ra) # 80005934 <namecmp>
    80007c96:	87aa                	mv	a5,a0
    80007c98:	16078b63          	beqz	a5,80007e0e <sys_unlink+0x1f2>
    80007c9c:	fc040793          	addi	a5,s0,-64
    80007ca0:	00004597          	auipc	a1,0x4
    80007ca4:	98858593          	addi	a1,a1,-1656 # 8000b628 <etext+0x628>
    80007ca8:	853e                	mv	a0,a5
    80007caa:	ffffe097          	auipc	ra,0xffffe
    80007cae:	c8a080e7          	jalr	-886(ra) # 80005934 <namecmp>
    80007cb2:	87aa                	mv	a5,a0
    80007cb4:	14078d63          	beqz	a5,80007e0e <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007cb8:	f3c40713          	addi	a4,s0,-196
    80007cbc:	fc040793          	addi	a5,s0,-64
    80007cc0:	863a                	mv	a2,a4
    80007cc2:	85be                	mv	a1,a5
    80007cc4:	fe843503          	ld	a0,-24(s0)
    80007cc8:	ffffe097          	auipc	ra,0xffffe
    80007ccc:	c9a080e7          	jalr	-870(ra) # 80005962 <dirlookup>
    80007cd0:	fea43023          	sd	a0,-32(s0)
    80007cd4:	fe043783          	ld	a5,-32(s0)
    80007cd8:	12078d63          	beqz	a5,80007e12 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007cdc:	fe043503          	ld	a0,-32(s0)
    80007ce0:	ffffd097          	auipc	ra,0xffffd
    80007ce4:	344080e7          	jalr	836(ra) # 80005024 <ilock>

  if(ip->nlink < 1)
    80007ce8:	fe043783          	ld	a5,-32(s0)
    80007cec:	04a79783          	lh	a5,74(a5)
    80007cf0:	2781                	sext.w	a5,a5
    80007cf2:	00f04a63          	bgtz	a5,80007d06 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007cf6:	00004517          	auipc	a0,0x4
    80007cfa:	93a50513          	addi	a0,a0,-1734 # 8000b630 <etext+0x630>
    80007cfe:	ffff9097          	auipc	ra,0xffff9
    80007d02:	f8c080e7          	jalr	-116(ra) # 80000c8a <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007d06:	fe043783          	ld	a5,-32(s0)
    80007d0a:	04479783          	lh	a5,68(a5)
    80007d0e:	0007871b          	sext.w	a4,a5
    80007d12:	4785                	li	a5,1
    80007d14:	02f71163          	bne	a4,a5,80007d36 <sys_unlink+0x11a>
    80007d18:	fe043503          	ld	a0,-32(s0)
    80007d1c:	00000097          	auipc	ra,0x0
    80007d20:	e86080e7          	jalr	-378(ra) # 80007ba2 <isdirempty>
    80007d24:	87aa                	mv	a5,a0
    80007d26:	eb81                	bnez	a5,80007d36 <sys_unlink+0x11a>
    iunlockput(ip);
    80007d28:	fe043503          	ld	a0,-32(s0)
    80007d2c:	ffffd097          	auipc	ra,0xffffd
    80007d30:	556080e7          	jalr	1366(ra) # 80005282 <iunlockput>
    goto bad;
    80007d34:	a0c5                	j	80007e14 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007d36:	fd040793          	addi	a5,s0,-48
    80007d3a:	4641                	li	a2,16
    80007d3c:	4581                	li	a1,0
    80007d3e:	853e                	mv	a0,a5
    80007d40:	ffff9097          	auipc	ra,0xffff9
    80007d44:	70c080e7          	jalr	1804(ra) # 8000144c <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007d48:	fd040793          	addi	a5,s0,-48
    80007d4c:	f3c42683          	lw	a3,-196(s0)
    80007d50:	4741                	li	a4,16
    80007d52:	863e                	mv	a2,a5
    80007d54:	4581                	li	a1,0
    80007d56:	fe843503          	ld	a0,-24(s0)
    80007d5a:	ffffe097          	auipc	ra,0xffffe
    80007d5e:	a1e080e7          	jalr	-1506(ra) # 80005778 <writei>
    80007d62:	87aa                	mv	a5,a0
    80007d64:	873e                	mv	a4,a5
    80007d66:	47c1                	li	a5,16
    80007d68:	00f70a63          	beq	a4,a5,80007d7c <sys_unlink+0x160>
    panic("unlink: writei");
    80007d6c:	00004517          	auipc	a0,0x4
    80007d70:	8dc50513          	addi	a0,a0,-1828 # 8000b648 <etext+0x648>
    80007d74:	ffff9097          	auipc	ra,0xffff9
    80007d78:	f16080e7          	jalr	-234(ra) # 80000c8a <panic>
  if(ip->type == T_DIR){
    80007d7c:	fe043783          	ld	a5,-32(s0)
    80007d80:	04479783          	lh	a5,68(a5)
    80007d84:	0007871b          	sext.w	a4,a5
    80007d88:	4785                	li	a5,1
    80007d8a:	02f71963          	bne	a4,a5,80007dbc <sys_unlink+0x1a0>
    dp->nlink--;
    80007d8e:	fe843783          	ld	a5,-24(s0)
    80007d92:	04a79783          	lh	a5,74(a5)
    80007d96:	17c2                	slli	a5,a5,0x30
    80007d98:	93c1                	srli	a5,a5,0x30
    80007d9a:	37fd                	addiw	a5,a5,-1
    80007d9c:	17c2                	slli	a5,a5,0x30
    80007d9e:	93c1                	srli	a5,a5,0x30
    80007da0:	0107971b          	slliw	a4,a5,0x10
    80007da4:	4107571b          	sraiw	a4,a4,0x10
    80007da8:	fe843783          	ld	a5,-24(s0)
    80007dac:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007db0:	fe843503          	ld	a0,-24(s0)
    80007db4:	ffffd097          	auipc	ra,0xffffd
    80007db8:	020080e7          	jalr	32(ra) # 80004dd4 <iupdate>
  }
  iunlockput(dp);
    80007dbc:	fe843503          	ld	a0,-24(s0)
    80007dc0:	ffffd097          	auipc	ra,0xffffd
    80007dc4:	4c2080e7          	jalr	1218(ra) # 80005282 <iunlockput>

  ip->nlink--;
    80007dc8:	fe043783          	ld	a5,-32(s0)
    80007dcc:	04a79783          	lh	a5,74(a5)
    80007dd0:	17c2                	slli	a5,a5,0x30
    80007dd2:	93c1                	srli	a5,a5,0x30
    80007dd4:	37fd                	addiw	a5,a5,-1
    80007dd6:	17c2                	slli	a5,a5,0x30
    80007dd8:	93c1                	srli	a5,a5,0x30
    80007dda:	0107971b          	slliw	a4,a5,0x10
    80007dde:	4107571b          	sraiw	a4,a4,0x10
    80007de2:	fe043783          	ld	a5,-32(s0)
    80007de6:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007dea:	fe043503          	ld	a0,-32(s0)
    80007dee:	ffffd097          	auipc	ra,0xffffd
    80007df2:	fe6080e7          	jalr	-26(ra) # 80004dd4 <iupdate>
  iunlockput(ip);
    80007df6:	fe043503          	ld	a0,-32(s0)
    80007dfa:	ffffd097          	auipc	ra,0xffffd
    80007dfe:	488080e7          	jalr	1160(ra) # 80005282 <iunlockput>

  end_op();
    80007e02:	ffffe097          	auipc	ra,0xffffe
    80007e06:	37c080e7          	jalr	892(ra) # 8000617e <end_op>

  return 0;
    80007e0a:	4781                	li	a5,0
    80007e0c:	a839                	j	80007e2a <sys_unlink+0x20e>
    goto bad;
    80007e0e:	0001                	nop
    80007e10:	a011                	j	80007e14 <sys_unlink+0x1f8>
    goto bad;
    80007e12:	0001                	nop

bad:
  iunlockput(dp);
    80007e14:	fe843503          	ld	a0,-24(s0)
    80007e18:	ffffd097          	auipc	ra,0xffffd
    80007e1c:	46a080e7          	jalr	1130(ra) # 80005282 <iunlockput>
  end_op();
    80007e20:	ffffe097          	auipc	ra,0xffffe
    80007e24:	35e080e7          	jalr	862(ra) # 8000617e <end_op>
  return -1;
    80007e28:	57fd                	li	a5,-1
}
    80007e2a:	853e                	mv	a0,a5
    80007e2c:	60ae                	ld	ra,200(sp)
    80007e2e:	640e                	ld	s0,192(sp)
    80007e30:	6169                	addi	sp,sp,208
    80007e32:	8082                	ret

0000000080007e34 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80007e34:	7139                	addi	sp,sp,-64
    80007e36:	fc06                	sd	ra,56(sp)
    80007e38:	f822                	sd	s0,48(sp)
    80007e3a:	0080                	addi	s0,sp,64
    80007e3c:	fca43423          	sd	a0,-56(s0)
    80007e40:	87ae                	mv	a5,a1
    80007e42:	8736                	mv	a4,a3
    80007e44:	fcf41323          	sh	a5,-58(s0)
    80007e48:	87b2                	mv	a5,a2
    80007e4a:	fcf41223          	sh	a5,-60(s0)
    80007e4e:	87ba                	mv	a5,a4
    80007e50:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80007e54:	fd040793          	addi	a5,s0,-48
    80007e58:	85be                	mv	a1,a5
    80007e5a:	fc843503          	ld	a0,-56(s0)
    80007e5e:	ffffe097          	auipc	ra,0xffffe
    80007e62:	f26080e7          	jalr	-218(ra) # 80005d84 <nameiparent>
    80007e66:	fea43423          	sd	a0,-24(s0)
    80007e6a:	fe843783          	ld	a5,-24(s0)
    80007e6e:	e399                	bnez	a5,80007e74 <create+0x40>
    return 0;
    80007e70:	4781                	li	a5,0
    80007e72:	a2ed                	j	8000805c <create+0x228>

  ilock(dp);
    80007e74:	fe843503          	ld	a0,-24(s0)
    80007e78:	ffffd097          	auipc	ra,0xffffd
    80007e7c:	1ac080e7          	jalr	428(ra) # 80005024 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80007e80:	fd040793          	addi	a5,s0,-48
    80007e84:	4601                	li	a2,0
    80007e86:	85be                	mv	a1,a5
    80007e88:	fe843503          	ld	a0,-24(s0)
    80007e8c:	ffffe097          	auipc	ra,0xffffe
    80007e90:	ad6080e7          	jalr	-1322(ra) # 80005962 <dirlookup>
    80007e94:	fea43023          	sd	a0,-32(s0)
    80007e98:	fe043783          	ld	a5,-32(s0)
    80007e9c:	c3ad                	beqz	a5,80007efe <create+0xca>
    iunlockput(dp);
    80007e9e:	fe843503          	ld	a0,-24(s0)
    80007ea2:	ffffd097          	auipc	ra,0xffffd
    80007ea6:	3e0080e7          	jalr	992(ra) # 80005282 <iunlockput>
    ilock(ip);
    80007eaa:	fe043503          	ld	a0,-32(s0)
    80007eae:	ffffd097          	auipc	ra,0xffffd
    80007eb2:	176080e7          	jalr	374(ra) # 80005024 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80007eb6:	fc641783          	lh	a5,-58(s0)
    80007eba:	0007871b          	sext.w	a4,a5
    80007ebe:	4789                	li	a5,2
    80007ec0:	02f71763          	bne	a4,a5,80007eee <create+0xba>
    80007ec4:	fe043783          	ld	a5,-32(s0)
    80007ec8:	04479783          	lh	a5,68(a5)
    80007ecc:	0007871b          	sext.w	a4,a5
    80007ed0:	4789                	li	a5,2
    80007ed2:	00f70b63          	beq	a4,a5,80007ee8 <create+0xb4>
    80007ed6:	fe043783          	ld	a5,-32(s0)
    80007eda:	04479783          	lh	a5,68(a5)
    80007ede:	0007871b          	sext.w	a4,a5
    80007ee2:	478d                	li	a5,3
    80007ee4:	00f71563          	bne	a4,a5,80007eee <create+0xba>
      return ip;
    80007ee8:	fe043783          	ld	a5,-32(s0)
    80007eec:	aa85                	j	8000805c <create+0x228>
    iunlockput(ip);
    80007eee:	fe043503          	ld	a0,-32(s0)
    80007ef2:	ffffd097          	auipc	ra,0xffffd
    80007ef6:	390080e7          	jalr	912(ra) # 80005282 <iunlockput>
    return 0;
    80007efa:	4781                	li	a5,0
    80007efc:	a285                	j	8000805c <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    80007efe:	fe843783          	ld	a5,-24(s0)
    80007f02:	439c                	lw	a5,0(a5)
    80007f04:	fc641703          	lh	a4,-58(s0)
    80007f08:	85ba                	mv	a1,a4
    80007f0a:	853e                	mv	a0,a5
    80007f0c:	ffffd097          	auipc	ra,0xffffd
    80007f10:	dca080e7          	jalr	-566(ra) # 80004cd6 <ialloc>
    80007f14:	fea43023          	sd	a0,-32(s0)
    80007f18:	fe043783          	ld	a5,-32(s0)
    80007f1c:	eb89                	bnez	a5,80007f2e <create+0xfa>
    iunlockput(dp);
    80007f1e:	fe843503          	ld	a0,-24(s0)
    80007f22:	ffffd097          	auipc	ra,0xffffd
    80007f26:	360080e7          	jalr	864(ra) # 80005282 <iunlockput>
    return 0;
    80007f2a:	4781                	li	a5,0
    80007f2c:	aa05                	j	8000805c <create+0x228>
  }

  ilock(ip);
    80007f2e:	fe043503          	ld	a0,-32(s0)
    80007f32:	ffffd097          	auipc	ra,0xffffd
    80007f36:	0f2080e7          	jalr	242(ra) # 80005024 <ilock>
  ip->major = major;
    80007f3a:	fe043783          	ld	a5,-32(s0)
    80007f3e:	fc445703          	lhu	a4,-60(s0)
    80007f42:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80007f46:	fe043783          	ld	a5,-32(s0)
    80007f4a:	fc245703          	lhu	a4,-62(s0)
    80007f4e:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80007f52:	fe043783          	ld	a5,-32(s0)
    80007f56:	4705                	li	a4,1
    80007f58:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f5c:	fe043503          	ld	a0,-32(s0)
    80007f60:	ffffd097          	auipc	ra,0xffffd
    80007f64:	e74080e7          	jalr	-396(ra) # 80004dd4 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80007f68:	fc641783          	lh	a5,-58(s0)
    80007f6c:	0007871b          	sext.w	a4,a5
    80007f70:	4785                	li	a5,1
    80007f72:	04f71463          	bne	a4,a5,80007fba <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80007f76:	fe043783          	ld	a5,-32(s0)
    80007f7a:	43dc                	lw	a5,4(a5)
    80007f7c:	863e                	mv	a2,a5
    80007f7e:	00003597          	auipc	a1,0x3
    80007f82:	6a258593          	addi	a1,a1,1698 # 8000b620 <etext+0x620>
    80007f86:	fe043503          	ld	a0,-32(s0)
    80007f8a:	ffffe097          	auipc	ra,0xffffe
    80007f8e:	ac0080e7          	jalr	-1344(ra) # 80005a4a <dirlink>
    80007f92:	87aa                	mv	a5,a0
    80007f94:	0807ca63          	bltz	a5,80008028 <create+0x1f4>
    80007f98:	fe843783          	ld	a5,-24(s0)
    80007f9c:	43dc                	lw	a5,4(a5)
    80007f9e:	863e                	mv	a2,a5
    80007fa0:	00003597          	auipc	a1,0x3
    80007fa4:	68858593          	addi	a1,a1,1672 # 8000b628 <etext+0x628>
    80007fa8:	fe043503          	ld	a0,-32(s0)
    80007fac:	ffffe097          	auipc	ra,0xffffe
    80007fb0:	a9e080e7          	jalr	-1378(ra) # 80005a4a <dirlink>
    80007fb4:	87aa                	mv	a5,a0
    80007fb6:	0607c963          	bltz	a5,80008028 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80007fba:	fe043783          	ld	a5,-32(s0)
    80007fbe:	43d8                	lw	a4,4(a5)
    80007fc0:	fd040793          	addi	a5,s0,-48
    80007fc4:	863a                	mv	a2,a4
    80007fc6:	85be                	mv	a1,a5
    80007fc8:	fe843503          	ld	a0,-24(s0)
    80007fcc:	ffffe097          	auipc	ra,0xffffe
    80007fd0:	a7e080e7          	jalr	-1410(ra) # 80005a4a <dirlink>
    80007fd4:	87aa                	mv	a5,a0
    80007fd6:	0407cb63          	bltz	a5,8000802c <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    80007fda:	fc641783          	lh	a5,-58(s0)
    80007fde:	0007871b          	sext.w	a4,a5
    80007fe2:	4785                	li	a5,1
    80007fe4:	02f71963          	bne	a4,a5,80008016 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    80007fe8:	fe843783          	ld	a5,-24(s0)
    80007fec:	04a79783          	lh	a5,74(a5)
    80007ff0:	17c2                	slli	a5,a5,0x30
    80007ff2:	93c1                	srli	a5,a5,0x30
    80007ff4:	2785                	addiw	a5,a5,1
    80007ff6:	17c2                	slli	a5,a5,0x30
    80007ff8:	93c1                	srli	a5,a5,0x30
    80007ffa:	0107971b          	slliw	a4,a5,0x10
    80007ffe:	4107571b          	sraiw	a4,a4,0x10
    80008002:	fe843783          	ld	a5,-24(s0)
    80008006:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000800a:	fe843503          	ld	a0,-24(s0)
    8000800e:	ffffd097          	auipc	ra,0xffffd
    80008012:	dc6080e7          	jalr	-570(ra) # 80004dd4 <iupdate>
  }

  iunlockput(dp);
    80008016:	fe843503          	ld	a0,-24(s0)
    8000801a:	ffffd097          	auipc	ra,0xffffd
    8000801e:	268080e7          	jalr	616(ra) # 80005282 <iunlockput>

  return ip;
    80008022:	fe043783          	ld	a5,-32(s0)
    80008026:	a81d                	j	8000805c <create+0x228>
      goto fail;
    80008028:	0001                	nop
    8000802a:	a011                	j	8000802e <create+0x1fa>
    goto fail;
    8000802c:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    8000802e:	fe043783          	ld	a5,-32(s0)
    80008032:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    80008036:	fe043503          	ld	a0,-32(s0)
    8000803a:	ffffd097          	auipc	ra,0xffffd
    8000803e:	d9a080e7          	jalr	-614(ra) # 80004dd4 <iupdate>
  iunlockput(ip);
    80008042:	fe043503          	ld	a0,-32(s0)
    80008046:	ffffd097          	auipc	ra,0xffffd
    8000804a:	23c080e7          	jalr	572(ra) # 80005282 <iunlockput>
  iunlockput(dp);
    8000804e:	fe843503          	ld	a0,-24(s0)
    80008052:	ffffd097          	auipc	ra,0xffffd
    80008056:	230080e7          	jalr	560(ra) # 80005282 <iunlockput>
  return 0;
    8000805a:	4781                	li	a5,0
}
    8000805c:	853e                	mv	a0,a5
    8000805e:	70e2                	ld	ra,56(sp)
    80008060:	7442                	ld	s0,48(sp)
    80008062:	6121                	addi	sp,sp,64
    80008064:	8082                	ret

0000000080008066 <sys_open>:

uint64
sys_open(void)
{
    80008066:	7131                	addi	sp,sp,-192
    80008068:	fd06                	sd	ra,184(sp)
    8000806a:	f922                	sd	s0,176(sp)
    8000806c:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    8000806e:	f4c40793          	addi	a5,s0,-180
    80008072:	85be                	mv	a1,a5
    80008074:	4505                	li	a0,1
    80008076:	ffffc097          	auipc	ra,0xffffc
    8000807a:	028080e7          	jalr	40(ra) # 8000409e <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    8000807e:	f5040793          	addi	a5,s0,-176
    80008082:	08000613          	li	a2,128
    80008086:	85be                	mv	a1,a5
    80008088:	4501                	li	a0,0
    8000808a:	ffffc097          	auipc	ra,0xffffc
    8000808e:	07c080e7          	jalr	124(ra) # 80004106 <argstr>
    80008092:	87aa                	mv	a5,a0
    80008094:	fef42223          	sw	a5,-28(s0)
    80008098:	fe442783          	lw	a5,-28(s0)
    8000809c:	2781                	sext.w	a5,a5
    8000809e:	0007d463          	bgez	a5,800080a6 <sys_open+0x40>
    return -1;
    800080a2:	57fd                	li	a5,-1
    800080a4:	a429                	j	800082ae <sys_open+0x248>

  begin_op();
    800080a6:	ffffe097          	auipc	ra,0xffffe
    800080aa:	016080e7          	jalr	22(ra) # 800060bc <begin_op>

  if(omode & O_CREATE){
    800080ae:	f4c42783          	lw	a5,-180(s0)
    800080b2:	2007f793          	andi	a5,a5,512
    800080b6:	2781                	sext.w	a5,a5
    800080b8:	c795                	beqz	a5,800080e4 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    800080ba:	f5040793          	addi	a5,s0,-176
    800080be:	4681                	li	a3,0
    800080c0:	4601                	li	a2,0
    800080c2:	4589                	li	a1,2
    800080c4:	853e                	mv	a0,a5
    800080c6:	00000097          	auipc	ra,0x0
    800080ca:	d6e080e7          	jalr	-658(ra) # 80007e34 <create>
    800080ce:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800080d2:	fe843783          	ld	a5,-24(s0)
    800080d6:	e7bd                	bnez	a5,80008144 <sys_open+0xde>
      end_op();
    800080d8:	ffffe097          	auipc	ra,0xffffe
    800080dc:	0a6080e7          	jalr	166(ra) # 8000617e <end_op>
      return -1;
    800080e0:	57fd                	li	a5,-1
    800080e2:	a2f1                	j	800082ae <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    800080e4:	f5040793          	addi	a5,s0,-176
    800080e8:	853e                	mv	a0,a5
    800080ea:	ffffe097          	auipc	ra,0xffffe
    800080ee:	c6e080e7          	jalr	-914(ra) # 80005d58 <namei>
    800080f2:	fea43423          	sd	a0,-24(s0)
    800080f6:	fe843783          	ld	a5,-24(s0)
    800080fa:	e799                	bnez	a5,80008108 <sys_open+0xa2>
      end_op();
    800080fc:	ffffe097          	auipc	ra,0xffffe
    80008100:	082080e7          	jalr	130(ra) # 8000617e <end_op>
      return -1;
    80008104:	57fd                	li	a5,-1
    80008106:	a265                	j	800082ae <sys_open+0x248>
    }
    ilock(ip);
    80008108:	fe843503          	ld	a0,-24(s0)
    8000810c:	ffffd097          	auipc	ra,0xffffd
    80008110:	f18080e7          	jalr	-232(ra) # 80005024 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    80008114:	fe843783          	ld	a5,-24(s0)
    80008118:	04479783          	lh	a5,68(a5)
    8000811c:	0007871b          	sext.w	a4,a5
    80008120:	4785                	li	a5,1
    80008122:	02f71163          	bne	a4,a5,80008144 <sys_open+0xde>
    80008126:	f4c42783          	lw	a5,-180(s0)
    8000812a:	cf89                	beqz	a5,80008144 <sys_open+0xde>
      iunlockput(ip);
    8000812c:	fe843503          	ld	a0,-24(s0)
    80008130:	ffffd097          	auipc	ra,0xffffd
    80008134:	152080e7          	jalr	338(ra) # 80005282 <iunlockput>
      end_op();
    80008138:	ffffe097          	auipc	ra,0xffffe
    8000813c:	046080e7          	jalr	70(ra) # 8000617e <end_op>
      return -1;
    80008140:	57fd                	li	a5,-1
    80008142:	a2b5                	j	800082ae <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008144:	fe843783          	ld	a5,-24(s0)
    80008148:	04479783          	lh	a5,68(a5)
    8000814c:	0007871b          	sext.w	a4,a5
    80008150:	478d                	li	a5,3
    80008152:	02f71e63          	bne	a4,a5,8000818e <sys_open+0x128>
    80008156:	fe843783          	ld	a5,-24(s0)
    8000815a:	04679783          	lh	a5,70(a5)
    8000815e:	2781                	sext.w	a5,a5
    80008160:	0007cb63          	bltz	a5,80008176 <sys_open+0x110>
    80008164:	fe843783          	ld	a5,-24(s0)
    80008168:	04679783          	lh	a5,70(a5)
    8000816c:	0007871b          	sext.w	a4,a5
    80008170:	47a5                	li	a5,9
    80008172:	00e7de63          	bge	a5,a4,8000818e <sys_open+0x128>
    iunlockput(ip);
    80008176:	fe843503          	ld	a0,-24(s0)
    8000817a:	ffffd097          	auipc	ra,0xffffd
    8000817e:	108080e7          	jalr	264(ra) # 80005282 <iunlockput>
    end_op();
    80008182:	ffffe097          	auipc	ra,0xffffe
    80008186:	ffc080e7          	jalr	-4(ra) # 8000617e <end_op>
    return -1;
    8000818a:	57fd                	li	a5,-1
    8000818c:	a20d                	j	800082ae <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000818e:	ffffe097          	auipc	ra,0xffffe
    80008192:	4de080e7          	jalr	1246(ra) # 8000666c <filealloc>
    80008196:	fca43c23          	sd	a0,-40(s0)
    8000819a:	fd843783          	ld	a5,-40(s0)
    8000819e:	cf99                	beqz	a5,800081bc <sys_open+0x156>
    800081a0:	fd843503          	ld	a0,-40(s0)
    800081a4:	fffff097          	auipc	ra,0xfffff
    800081a8:	5e8080e7          	jalr	1512(ra) # 8000778c <fdalloc>
    800081ac:	87aa                	mv	a5,a0
    800081ae:	fcf42a23          	sw	a5,-44(s0)
    800081b2:	fd442783          	lw	a5,-44(s0)
    800081b6:	2781                	sext.w	a5,a5
    800081b8:	0207d763          	bgez	a5,800081e6 <sys_open+0x180>
    if(f)
    800081bc:	fd843783          	ld	a5,-40(s0)
    800081c0:	c799                	beqz	a5,800081ce <sys_open+0x168>
      fileclose(f);
    800081c2:	fd843503          	ld	a0,-40(s0)
    800081c6:	ffffe097          	auipc	ra,0xffffe
    800081ca:	590080e7          	jalr	1424(ra) # 80006756 <fileclose>
    iunlockput(ip);
    800081ce:	fe843503          	ld	a0,-24(s0)
    800081d2:	ffffd097          	auipc	ra,0xffffd
    800081d6:	0b0080e7          	jalr	176(ra) # 80005282 <iunlockput>
    end_op();
    800081da:	ffffe097          	auipc	ra,0xffffe
    800081de:	fa4080e7          	jalr	-92(ra) # 8000617e <end_op>
    return -1;
    800081e2:	57fd                	li	a5,-1
    800081e4:	a0e9                	j	800082ae <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800081e6:	fe843783          	ld	a5,-24(s0)
    800081ea:	04479783          	lh	a5,68(a5)
    800081ee:	0007871b          	sext.w	a4,a5
    800081f2:	478d                	li	a5,3
    800081f4:	00f71f63          	bne	a4,a5,80008212 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800081f8:	fd843783          	ld	a5,-40(s0)
    800081fc:	470d                	li	a4,3
    800081fe:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008200:	fe843783          	ld	a5,-24(s0)
    80008204:	04679703          	lh	a4,70(a5)
    80008208:	fd843783          	ld	a5,-40(s0)
    8000820c:	02e79223          	sh	a4,36(a5)
    80008210:	a809                	j	80008222 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    80008212:	fd843783          	ld	a5,-40(s0)
    80008216:	4709                	li	a4,2
    80008218:	c398                	sw	a4,0(a5)
    f->off = 0;
    8000821a:	fd843783          	ld	a5,-40(s0)
    8000821e:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008222:	fd843783          	ld	a5,-40(s0)
    80008226:	fe843703          	ld	a4,-24(s0)
    8000822a:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000822c:	f4c42783          	lw	a5,-180(s0)
    80008230:	8b85                	andi	a5,a5,1
    80008232:	2781                	sext.w	a5,a5
    80008234:	0017b793          	seqz	a5,a5
    80008238:	0ff7f793          	zext.b	a5,a5
    8000823c:	873e                	mv	a4,a5
    8000823e:	fd843783          	ld	a5,-40(s0)
    80008242:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008246:	f4c42783          	lw	a5,-180(s0)
    8000824a:	8b85                	andi	a5,a5,1
    8000824c:	2781                	sext.w	a5,a5
    8000824e:	e791                	bnez	a5,8000825a <sys_open+0x1f4>
    80008250:	f4c42783          	lw	a5,-180(s0)
    80008254:	8b89                	andi	a5,a5,2
    80008256:	2781                	sext.w	a5,a5
    80008258:	c399                	beqz	a5,8000825e <sys_open+0x1f8>
    8000825a:	4785                	li	a5,1
    8000825c:	a011                	j	80008260 <sys_open+0x1fa>
    8000825e:	4781                	li	a5,0
    80008260:	0ff7f713          	zext.b	a4,a5
    80008264:	fd843783          	ld	a5,-40(s0)
    80008268:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000826c:	f4c42783          	lw	a5,-180(s0)
    80008270:	4007f793          	andi	a5,a5,1024
    80008274:	2781                	sext.w	a5,a5
    80008276:	c385                	beqz	a5,80008296 <sys_open+0x230>
    80008278:	fe843783          	ld	a5,-24(s0)
    8000827c:	04479783          	lh	a5,68(a5)
    80008280:	0007871b          	sext.w	a4,a5
    80008284:	4789                	li	a5,2
    80008286:	00f71863          	bne	a4,a5,80008296 <sys_open+0x230>
    itrunc(ip);
    8000828a:	fe843503          	ld	a0,-24(s0)
    8000828e:	ffffd097          	auipc	ra,0xffffd
    80008292:	19e080e7          	jalr	414(ra) # 8000542c <itrunc>
  }

  iunlock(ip);
    80008296:	fe843503          	ld	a0,-24(s0)
    8000829a:	ffffd097          	auipc	ra,0xffffd
    8000829e:	ebe080e7          	jalr	-322(ra) # 80005158 <iunlock>
  end_op();
    800082a2:	ffffe097          	auipc	ra,0xffffe
    800082a6:	edc080e7          	jalr	-292(ra) # 8000617e <end_op>

  return fd;
    800082aa:	fd442783          	lw	a5,-44(s0)
}
    800082ae:	853e                	mv	a0,a5
    800082b0:	70ea                	ld	ra,184(sp)
    800082b2:	744a                	ld	s0,176(sp)
    800082b4:	6129                	addi	sp,sp,192
    800082b6:	8082                	ret

00000000800082b8 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800082b8:	7135                	addi	sp,sp,-160
    800082ba:	ed06                	sd	ra,152(sp)
    800082bc:	e922                	sd	s0,144(sp)
    800082be:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800082c0:	ffffe097          	auipc	ra,0xffffe
    800082c4:	dfc080e7          	jalr	-516(ra) # 800060bc <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800082c8:	f6840793          	addi	a5,s0,-152
    800082cc:	08000613          	li	a2,128
    800082d0:	85be                	mv	a1,a5
    800082d2:	4501                	li	a0,0
    800082d4:	ffffc097          	auipc	ra,0xffffc
    800082d8:	e32080e7          	jalr	-462(ra) # 80004106 <argstr>
    800082dc:	87aa                	mv	a5,a0
    800082de:	0207c163          	bltz	a5,80008300 <sys_mkdir+0x48>
    800082e2:	f6840793          	addi	a5,s0,-152
    800082e6:	4681                	li	a3,0
    800082e8:	4601                	li	a2,0
    800082ea:	4585                	li	a1,1
    800082ec:	853e                	mv	a0,a5
    800082ee:	00000097          	auipc	ra,0x0
    800082f2:	b46080e7          	jalr	-1210(ra) # 80007e34 <create>
    800082f6:	fea43423          	sd	a0,-24(s0)
    800082fa:	fe843783          	ld	a5,-24(s0)
    800082fe:	e799                	bnez	a5,8000830c <sys_mkdir+0x54>
    end_op();
    80008300:	ffffe097          	auipc	ra,0xffffe
    80008304:	e7e080e7          	jalr	-386(ra) # 8000617e <end_op>
    return -1;
    80008308:	57fd                	li	a5,-1
    8000830a:	a821                	j	80008322 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    8000830c:	fe843503          	ld	a0,-24(s0)
    80008310:	ffffd097          	auipc	ra,0xffffd
    80008314:	f72080e7          	jalr	-142(ra) # 80005282 <iunlockput>
  end_op();
    80008318:	ffffe097          	auipc	ra,0xffffe
    8000831c:	e66080e7          	jalr	-410(ra) # 8000617e <end_op>
  return 0;
    80008320:	4781                	li	a5,0
}
    80008322:	853e                	mv	a0,a5
    80008324:	60ea                	ld	ra,152(sp)
    80008326:	644a                	ld	s0,144(sp)
    80008328:	610d                	addi	sp,sp,160
    8000832a:	8082                	ret

000000008000832c <sys_mknod>:

uint64
sys_mknod(void)
{
    8000832c:	7135                	addi	sp,sp,-160
    8000832e:	ed06                	sd	ra,152(sp)
    80008330:	e922                	sd	s0,144(sp)
    80008332:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008334:	ffffe097          	auipc	ra,0xffffe
    80008338:	d88080e7          	jalr	-632(ra) # 800060bc <begin_op>
  argint(1, &major);
    8000833c:	f6440793          	addi	a5,s0,-156
    80008340:	85be                	mv	a1,a5
    80008342:	4505                	li	a0,1
    80008344:	ffffc097          	auipc	ra,0xffffc
    80008348:	d5a080e7          	jalr	-678(ra) # 8000409e <argint>
  argint(2, &minor);
    8000834c:	f6040793          	addi	a5,s0,-160
    80008350:	85be                	mv	a1,a5
    80008352:	4509                	li	a0,2
    80008354:	ffffc097          	auipc	ra,0xffffc
    80008358:	d4a080e7          	jalr	-694(ra) # 8000409e <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000835c:	f6840793          	addi	a5,s0,-152
    80008360:	08000613          	li	a2,128
    80008364:	85be                	mv	a1,a5
    80008366:	4501                	li	a0,0
    80008368:	ffffc097          	auipc	ra,0xffffc
    8000836c:	d9e080e7          	jalr	-610(ra) # 80004106 <argstr>
    80008370:	87aa                	mv	a5,a0
    80008372:	0207cc63          	bltz	a5,800083aa <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008376:	f6442783          	lw	a5,-156(s0)
    8000837a:	0107971b          	slliw	a4,a5,0x10
    8000837e:	4107571b          	sraiw	a4,a4,0x10
    80008382:	f6042783          	lw	a5,-160(s0)
    80008386:	0107969b          	slliw	a3,a5,0x10
    8000838a:	4106d69b          	sraiw	a3,a3,0x10
    8000838e:	f6840793          	addi	a5,s0,-152
    80008392:	863a                	mv	a2,a4
    80008394:	458d                	li	a1,3
    80008396:	853e                	mv	a0,a5
    80008398:	00000097          	auipc	ra,0x0
    8000839c:	a9c080e7          	jalr	-1380(ra) # 80007e34 <create>
    800083a0:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    800083a4:	fe843783          	ld	a5,-24(s0)
    800083a8:	e799                	bnez	a5,800083b6 <sys_mknod+0x8a>
    end_op();
    800083aa:	ffffe097          	auipc	ra,0xffffe
    800083ae:	dd4080e7          	jalr	-556(ra) # 8000617e <end_op>
    return -1;
    800083b2:	57fd                	li	a5,-1
    800083b4:	a821                	j	800083cc <sys_mknod+0xa0>
  }
  iunlockput(ip);
    800083b6:	fe843503          	ld	a0,-24(s0)
    800083ba:	ffffd097          	auipc	ra,0xffffd
    800083be:	ec8080e7          	jalr	-312(ra) # 80005282 <iunlockput>
  end_op();
    800083c2:	ffffe097          	auipc	ra,0xffffe
    800083c6:	dbc080e7          	jalr	-580(ra) # 8000617e <end_op>
  return 0;
    800083ca:	4781                	li	a5,0
}
    800083cc:	853e                	mv	a0,a5
    800083ce:	60ea                	ld	ra,152(sp)
    800083d0:	644a                	ld	s0,144(sp)
    800083d2:	610d                	addi	sp,sp,160
    800083d4:	8082                	ret

00000000800083d6 <sys_chdir>:

uint64
sys_chdir(void)
{
    800083d6:	7135                	addi	sp,sp,-160
    800083d8:	ed06                	sd	ra,152(sp)
    800083da:	e922                	sd	s0,144(sp)
    800083dc:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800083de:	ffffa097          	auipc	ra,0xffffa
    800083e2:	462080e7          	jalr	1122(ra) # 80002840 <myproc>
    800083e6:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800083ea:	ffffe097          	auipc	ra,0xffffe
    800083ee:	cd2080e7          	jalr	-814(ra) # 800060bc <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800083f2:	f6040793          	addi	a5,s0,-160
    800083f6:	08000613          	li	a2,128
    800083fa:	85be                	mv	a1,a5
    800083fc:	4501                	li	a0,0
    800083fe:	ffffc097          	auipc	ra,0xffffc
    80008402:	d08080e7          	jalr	-760(ra) # 80004106 <argstr>
    80008406:	87aa                	mv	a5,a0
    80008408:	0007ce63          	bltz	a5,80008424 <sys_chdir+0x4e>
    8000840c:	f6040793          	addi	a5,s0,-160
    80008410:	853e                	mv	a0,a5
    80008412:	ffffe097          	auipc	ra,0xffffe
    80008416:	946080e7          	jalr	-1722(ra) # 80005d58 <namei>
    8000841a:	fea43023          	sd	a0,-32(s0)
    8000841e:	fe043783          	ld	a5,-32(s0)
    80008422:	e799                	bnez	a5,80008430 <sys_chdir+0x5a>
    end_op();
    80008424:	ffffe097          	auipc	ra,0xffffe
    80008428:	d5a080e7          	jalr	-678(ra) # 8000617e <end_op>
    return -1;
    8000842c:	57fd                	li	a5,-1
    8000842e:	a0b5                	j	8000849a <sys_chdir+0xc4>
  }
  ilock(ip);
    80008430:	fe043503          	ld	a0,-32(s0)
    80008434:	ffffd097          	auipc	ra,0xffffd
    80008438:	bf0080e7          	jalr	-1040(ra) # 80005024 <ilock>
  if(ip->type != T_DIR){
    8000843c:	fe043783          	ld	a5,-32(s0)
    80008440:	04479783          	lh	a5,68(a5)
    80008444:	0007871b          	sext.w	a4,a5
    80008448:	4785                	li	a5,1
    8000844a:	00f70e63          	beq	a4,a5,80008466 <sys_chdir+0x90>
    iunlockput(ip);
    8000844e:	fe043503          	ld	a0,-32(s0)
    80008452:	ffffd097          	auipc	ra,0xffffd
    80008456:	e30080e7          	jalr	-464(ra) # 80005282 <iunlockput>
    end_op();
    8000845a:	ffffe097          	auipc	ra,0xffffe
    8000845e:	d24080e7          	jalr	-732(ra) # 8000617e <end_op>
    return -1;
    80008462:	57fd                	li	a5,-1
    80008464:	a81d                	j	8000849a <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008466:	fe043503          	ld	a0,-32(s0)
    8000846a:	ffffd097          	auipc	ra,0xffffd
    8000846e:	cee080e7          	jalr	-786(ra) # 80005158 <iunlock>
  iput(p->cwd);
    80008472:	fe843783          	ld	a5,-24(s0)
    80008476:	1507b783          	ld	a5,336(a5)
    8000847a:	853e                	mv	a0,a5
    8000847c:	ffffd097          	auipc	ra,0xffffd
    80008480:	d36080e7          	jalr	-714(ra) # 800051b2 <iput>
  end_op();
    80008484:	ffffe097          	auipc	ra,0xffffe
    80008488:	cfa080e7          	jalr	-774(ra) # 8000617e <end_op>
  p->cwd = ip;
    8000848c:	fe843783          	ld	a5,-24(s0)
    80008490:	fe043703          	ld	a4,-32(s0)
    80008494:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008498:	4781                	li	a5,0
}
    8000849a:	853e                	mv	a0,a5
    8000849c:	60ea                	ld	ra,152(sp)
    8000849e:	644a                	ld	s0,144(sp)
    800084a0:	610d                	addi	sp,sp,160
    800084a2:	8082                	ret

00000000800084a4 <sys_exec>:

uint64
sys_exec(void)
{
    800084a4:	7161                	addi	sp,sp,-432
    800084a6:	f706                	sd	ra,424(sp)
    800084a8:	f322                	sd	s0,416(sp)
    800084aa:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    800084ac:	e6040793          	addi	a5,s0,-416
    800084b0:	85be                	mv	a1,a5
    800084b2:	4505                	li	a0,1
    800084b4:	ffffc097          	auipc	ra,0xffffc
    800084b8:	c20080e7          	jalr	-992(ra) # 800040d4 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    800084bc:	f6840793          	addi	a5,s0,-152
    800084c0:	08000613          	li	a2,128
    800084c4:	85be                	mv	a1,a5
    800084c6:	4501                	li	a0,0
    800084c8:	ffffc097          	auipc	ra,0xffffc
    800084cc:	c3e080e7          	jalr	-962(ra) # 80004106 <argstr>
    800084d0:	87aa                	mv	a5,a0
    800084d2:	0007d463          	bgez	a5,800084da <sys_exec+0x36>
    return -1;
    800084d6:	57fd                	li	a5,-1
    800084d8:	aa8d                	j	8000864a <sys_exec+0x1a6>
  }
  memset(argv, 0, sizeof(argv));
    800084da:	e6840793          	addi	a5,s0,-408
    800084de:	10000613          	li	a2,256
    800084e2:	4581                	li	a1,0
    800084e4:	853e                	mv	a0,a5
    800084e6:	ffff9097          	auipc	ra,0xffff9
    800084ea:	f66080e7          	jalr	-154(ra) # 8000144c <memset>
  for(i=0;; i++){
    800084ee:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800084f2:	fec42783          	lw	a5,-20(s0)
    800084f6:	873e                	mv	a4,a5
    800084f8:	47fd                	li	a5,31
    800084fa:	0ee7ee63          	bltu	a5,a4,800085f6 <sys_exec+0x152>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800084fe:	fec42783          	lw	a5,-20(s0)
    80008502:	00379713          	slli	a4,a5,0x3
    80008506:	e6043783          	ld	a5,-416(s0)
    8000850a:	97ba                	add	a5,a5,a4
    8000850c:	e5840713          	addi	a4,s0,-424
    80008510:	85ba                	mv	a1,a4
    80008512:	853e                	mv	a0,a5
    80008514:	ffffc097          	auipc	ra,0xffffc
    80008518:	a18080e7          	jalr	-1512(ra) # 80003f2c <fetchaddr>
    8000851c:	87aa                	mv	a5,a0
    8000851e:	0c07ce63          	bltz	a5,800085fa <sys_exec+0x156>
      goto bad;
    }
    if(uarg == 0){
    80008522:	e5843783          	ld	a5,-424(s0)
    80008526:	eb8d                	bnez	a5,80008558 <sys_exec+0xb4>
      argv[i] = 0;
    80008528:	fec42783          	lw	a5,-20(s0)
    8000852c:	078e                	slli	a5,a5,0x3
    8000852e:	17c1                	addi	a5,a5,-16
    80008530:	97a2                	add	a5,a5,s0
    80008532:	e607bc23          	sd	zero,-392(a5)
      break;
    80008536:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008538:	e6840713          	addi	a4,s0,-408
    8000853c:	f6840793          	addi	a5,s0,-152
    80008540:	85ba                	mv	a1,a4
    80008542:	853e                	mv	a0,a5
    80008544:	fffff097          	auipc	ra,0xfffff
    80008548:	c1a080e7          	jalr	-998(ra) # 8000715e <exec>
    8000854c:	87aa                	mv	a5,a0
    8000854e:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008552:	fe042623          	sw	zero,-20(s0)
    80008556:	a8bd                	j	800085d4 <sys_exec+0x130>
    argv[i] = kalloc();
    80008558:	ffff9097          	auipc	ra,0xffff9
    8000855c:	bcc080e7          	jalr	-1076(ra) # 80001124 <kalloc>
    80008560:	872a                	mv	a4,a0
    80008562:	fec42783          	lw	a5,-20(s0)
    80008566:	078e                	slli	a5,a5,0x3
    80008568:	17c1                	addi	a5,a5,-16
    8000856a:	97a2                	add	a5,a5,s0
    8000856c:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008570:	fec42783          	lw	a5,-20(s0)
    80008574:	078e                	slli	a5,a5,0x3
    80008576:	17c1                	addi	a5,a5,-16
    80008578:	97a2                	add	a5,a5,s0
    8000857a:	e787b783          	ld	a5,-392(a5)
    8000857e:	c3c1                	beqz	a5,800085fe <sys_exec+0x15a>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008580:	e5843703          	ld	a4,-424(s0)
    80008584:	fec42783          	lw	a5,-20(s0)
    80008588:	078e                	slli	a5,a5,0x3
    8000858a:	17c1                	addi	a5,a5,-16
    8000858c:	97a2                	add	a5,a5,s0
    8000858e:	e787b783          	ld	a5,-392(a5)
    80008592:	6605                	lui	a2,0x1
    80008594:	85be                	mv	a1,a5
    80008596:	853a                	mv	a0,a4
    80008598:	ffffc097          	auipc	ra,0xffffc
    8000859c:	a02080e7          	jalr	-1534(ra) # 80003f9a <fetchstr>
    800085a0:	87aa                	mv	a5,a0
    800085a2:	0607c063          	bltz	a5,80008602 <sys_exec+0x15e>
  for(i=0;; i++){
    800085a6:	fec42783          	lw	a5,-20(s0)
    800085aa:	2785                	addiw	a5,a5,1
    800085ac:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800085b0:	b789                	j	800084f2 <sys_exec+0x4e>
    kfree(argv[i]);
    800085b2:	fec42783          	lw	a5,-20(s0)
    800085b6:	078e                	slli	a5,a5,0x3
    800085b8:	17c1                	addi	a5,a5,-16
    800085ba:	97a2                	add	a5,a5,s0
    800085bc:	e787b783          	ld	a5,-392(a5)
    800085c0:	853e                	mv	a0,a5
    800085c2:	ffff9097          	auipc	ra,0xffff9
    800085c6:	abe080e7          	jalr	-1346(ra) # 80001080 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800085ca:	fec42783          	lw	a5,-20(s0)
    800085ce:	2785                	addiw	a5,a5,1
    800085d0:	fef42623          	sw	a5,-20(s0)
    800085d4:	fec42783          	lw	a5,-20(s0)
    800085d8:	873e                	mv	a4,a5
    800085da:	47fd                	li	a5,31
    800085dc:	00e7ea63          	bltu	a5,a4,800085f0 <sys_exec+0x14c>
    800085e0:	fec42783          	lw	a5,-20(s0)
    800085e4:	078e                	slli	a5,a5,0x3
    800085e6:	17c1                	addi	a5,a5,-16
    800085e8:	97a2                	add	a5,a5,s0
    800085ea:	e787b783          	ld	a5,-392(a5)
    800085ee:	f3f1                	bnez	a5,800085b2 <sys_exec+0x10e>

  return ret;
    800085f0:	fe842783          	lw	a5,-24(s0)
    800085f4:	a899                	j	8000864a <sys_exec+0x1a6>
      goto bad;
    800085f6:	0001                	nop
    800085f8:	a031                	j	80008604 <sys_exec+0x160>
      goto bad;
    800085fa:	0001                	nop
    800085fc:	a021                	j	80008604 <sys_exec+0x160>
      goto bad;
    800085fe:	0001                	nop
    80008600:	a011                	j	80008604 <sys_exec+0x160>
      goto bad;
    80008602:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008604:	fe042623          	sw	zero,-20(s0)
    80008608:	a015                	j	8000862c <sys_exec+0x188>
    kfree(argv[i]);
    8000860a:	fec42783          	lw	a5,-20(s0)
    8000860e:	078e                	slli	a5,a5,0x3
    80008610:	17c1                	addi	a5,a5,-16
    80008612:	97a2                	add	a5,a5,s0
    80008614:	e787b783          	ld	a5,-392(a5)
    80008618:	853e                	mv	a0,a5
    8000861a:	ffff9097          	auipc	ra,0xffff9
    8000861e:	a66080e7          	jalr	-1434(ra) # 80001080 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008622:	fec42783          	lw	a5,-20(s0)
    80008626:	2785                	addiw	a5,a5,1
    80008628:	fef42623          	sw	a5,-20(s0)
    8000862c:	fec42783          	lw	a5,-20(s0)
    80008630:	873e                	mv	a4,a5
    80008632:	47fd                	li	a5,31
    80008634:	00e7ea63          	bltu	a5,a4,80008648 <sys_exec+0x1a4>
    80008638:	fec42783          	lw	a5,-20(s0)
    8000863c:	078e                	slli	a5,a5,0x3
    8000863e:	17c1                	addi	a5,a5,-16
    80008640:	97a2                	add	a5,a5,s0
    80008642:	e787b783          	ld	a5,-392(a5)
    80008646:	f3f1                	bnez	a5,8000860a <sys_exec+0x166>
  return -1;
    80008648:	57fd                	li	a5,-1
}
    8000864a:	853e                	mv	a0,a5
    8000864c:	70ba                	ld	ra,424(sp)
    8000864e:	741a                	ld	s0,416(sp)
    80008650:	615d                	addi	sp,sp,432
    80008652:	8082                	ret

0000000080008654 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008654:	7139                	addi	sp,sp,-64
    80008656:	fc06                	sd	ra,56(sp)
    80008658:	f822                	sd	s0,48(sp)
    8000865a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    8000865c:	ffffa097          	auipc	ra,0xffffa
    80008660:	1e4080e7          	jalr	484(ra) # 80002840 <myproc>
    80008664:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008668:	fe040793          	addi	a5,s0,-32
    8000866c:	85be                	mv	a1,a5
    8000866e:	4501                	li	a0,0
    80008670:	ffffc097          	auipc	ra,0xffffc
    80008674:	a64080e7          	jalr	-1436(ra) # 800040d4 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008678:	fd040713          	addi	a4,s0,-48
    8000867c:	fd840793          	addi	a5,s0,-40
    80008680:	85ba                	mv	a1,a4
    80008682:	853e                	mv	a0,a5
    80008684:	ffffe097          	auipc	ra,0xffffe
    80008688:	5f4080e7          	jalr	1524(ra) # 80006c78 <pipealloc>
    8000868c:	87aa                	mv	a5,a0
    8000868e:	0007d463          	bgez	a5,80008696 <sys_pipe+0x42>
    return -1;
    80008692:	57fd                	li	a5,-1
    80008694:	a219                	j	8000879a <sys_pipe+0x146>
  fd0 = -1;
    80008696:	57fd                	li	a5,-1
    80008698:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    8000869c:	fd843783          	ld	a5,-40(s0)
    800086a0:	853e                	mv	a0,a5
    800086a2:	fffff097          	auipc	ra,0xfffff
    800086a6:	0ea080e7          	jalr	234(ra) # 8000778c <fdalloc>
    800086aa:	87aa                	mv	a5,a0
    800086ac:	fcf42623          	sw	a5,-52(s0)
    800086b0:	fcc42783          	lw	a5,-52(s0)
    800086b4:	0207c063          	bltz	a5,800086d4 <sys_pipe+0x80>
    800086b8:	fd043783          	ld	a5,-48(s0)
    800086bc:	853e                	mv	a0,a5
    800086be:	fffff097          	auipc	ra,0xfffff
    800086c2:	0ce080e7          	jalr	206(ra) # 8000778c <fdalloc>
    800086c6:	87aa                	mv	a5,a0
    800086c8:	fcf42423          	sw	a5,-56(s0)
    800086cc:	fc842783          	lw	a5,-56(s0)
    800086d0:	0207df63          	bgez	a5,8000870e <sys_pipe+0xba>
    if(fd0 >= 0)
    800086d4:	fcc42783          	lw	a5,-52(s0)
    800086d8:	0007cb63          	bltz	a5,800086ee <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800086dc:	fcc42783          	lw	a5,-52(s0)
    800086e0:	fe843703          	ld	a4,-24(s0)
    800086e4:	07e9                	addi	a5,a5,26
    800086e6:	078e                	slli	a5,a5,0x3
    800086e8:	97ba                	add	a5,a5,a4
    800086ea:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800086ee:	fd843783          	ld	a5,-40(s0)
    800086f2:	853e                	mv	a0,a5
    800086f4:	ffffe097          	auipc	ra,0xffffe
    800086f8:	062080e7          	jalr	98(ra) # 80006756 <fileclose>
    fileclose(wf);
    800086fc:	fd043783          	ld	a5,-48(s0)
    80008700:	853e                	mv	a0,a5
    80008702:	ffffe097          	auipc	ra,0xffffe
    80008706:	054080e7          	jalr	84(ra) # 80006756 <fileclose>
    return -1;
    8000870a:	57fd                	li	a5,-1
    8000870c:	a079                	j	8000879a <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8000870e:	fe843783          	ld	a5,-24(s0)
    80008712:	6bbc                	ld	a5,80(a5)
    80008714:	fe043703          	ld	a4,-32(s0)
    80008718:	fcc40613          	addi	a2,s0,-52
    8000871c:	4691                	li	a3,4
    8000871e:	85ba                	mv	a1,a4
    80008720:	853e                	mv	a0,a5
    80008722:	ffffa097          	auipc	ra,0xffffa
    80008726:	be8080e7          	jalr	-1048(ra) # 8000230a <copyout>
    8000872a:	87aa                	mv	a5,a0
    8000872c:	0207c463          	bltz	a5,80008754 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008730:	fe843783          	ld	a5,-24(s0)
    80008734:	6bb8                	ld	a4,80(a5)
    80008736:	fe043783          	ld	a5,-32(s0)
    8000873a:	0791                	addi	a5,a5,4
    8000873c:	fc840613          	addi	a2,s0,-56
    80008740:	4691                	li	a3,4
    80008742:	85be                	mv	a1,a5
    80008744:	853a                	mv	a0,a4
    80008746:	ffffa097          	auipc	ra,0xffffa
    8000874a:	bc4080e7          	jalr	-1084(ra) # 8000230a <copyout>
    8000874e:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008750:	0407d463          	bgez	a5,80008798 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008754:	fcc42783          	lw	a5,-52(s0)
    80008758:	fe843703          	ld	a4,-24(s0)
    8000875c:	07e9                	addi	a5,a5,26
    8000875e:	078e                	slli	a5,a5,0x3
    80008760:	97ba                	add	a5,a5,a4
    80008762:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008766:	fc842783          	lw	a5,-56(s0)
    8000876a:	fe843703          	ld	a4,-24(s0)
    8000876e:	07e9                	addi	a5,a5,26
    80008770:	078e                	slli	a5,a5,0x3
    80008772:	97ba                	add	a5,a5,a4
    80008774:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008778:	fd843783          	ld	a5,-40(s0)
    8000877c:	853e                	mv	a0,a5
    8000877e:	ffffe097          	auipc	ra,0xffffe
    80008782:	fd8080e7          	jalr	-40(ra) # 80006756 <fileclose>
    fileclose(wf);
    80008786:	fd043783          	ld	a5,-48(s0)
    8000878a:	853e                	mv	a0,a5
    8000878c:	ffffe097          	auipc	ra,0xffffe
    80008790:	fca080e7          	jalr	-54(ra) # 80006756 <fileclose>
    return -1;
    80008794:	57fd                	li	a5,-1
    80008796:	a011                	j	8000879a <sys_pipe+0x146>
  }
  return 0;
    80008798:	4781                	li	a5,0
}
    8000879a:	853e                	mv	a0,a5
    8000879c:	70e2                	ld	ra,56(sp)
    8000879e:	7442                	ld	s0,48(sp)
    800087a0:	6121                	addi	sp,sp,64
    800087a2:	8082                	ret
	...

00000000800087b0 <kernelvec>:
    800087b0:	7111                	addi	sp,sp,-256
    800087b2:	e006                	sd	ra,0(sp)
    800087b4:	e40a                	sd	sp,8(sp)
    800087b6:	e80e                	sd	gp,16(sp)
    800087b8:	ec12                	sd	tp,24(sp)
    800087ba:	f016                	sd	t0,32(sp)
    800087bc:	f41a                	sd	t1,40(sp)
    800087be:	f81e                	sd	t2,48(sp)
    800087c0:	fc22                	sd	s0,56(sp)
    800087c2:	e0a6                	sd	s1,64(sp)
    800087c4:	e4aa                	sd	a0,72(sp)
    800087c6:	e8ae                	sd	a1,80(sp)
    800087c8:	ecb2                	sd	a2,88(sp)
    800087ca:	f0b6                	sd	a3,96(sp)
    800087cc:	f4ba                	sd	a4,104(sp)
    800087ce:	f8be                	sd	a5,112(sp)
    800087d0:	fcc2                	sd	a6,120(sp)
    800087d2:	e146                	sd	a7,128(sp)
    800087d4:	e54a                	sd	s2,136(sp)
    800087d6:	e94e                	sd	s3,144(sp)
    800087d8:	ed52                	sd	s4,152(sp)
    800087da:	f156                	sd	s5,160(sp)
    800087dc:	f55a                	sd	s6,168(sp)
    800087de:	f95e                	sd	s7,176(sp)
    800087e0:	fd62                	sd	s8,184(sp)
    800087e2:	e1e6                	sd	s9,192(sp)
    800087e4:	e5ea                	sd	s10,200(sp)
    800087e6:	e9ee                	sd	s11,208(sp)
    800087e8:	edf2                	sd	t3,216(sp)
    800087ea:	f1f6                	sd	t4,224(sp)
    800087ec:	f5fa                	sd	t5,232(sp)
    800087ee:	f9fe                	sd	t6,240(sp)
    800087f0:	cd4fb0ef          	jal	ra,80003cc4 <kerneltrap>
    800087f4:	6082                	ld	ra,0(sp)
    800087f6:	6122                	ld	sp,8(sp)
    800087f8:	61c2                	ld	gp,16(sp)
    800087fa:	7282                	ld	t0,32(sp)
    800087fc:	7322                	ld	t1,40(sp)
    800087fe:	73c2                	ld	t2,48(sp)
    80008800:	7462                	ld	s0,56(sp)
    80008802:	6486                	ld	s1,64(sp)
    80008804:	6526                	ld	a0,72(sp)
    80008806:	65c6                	ld	a1,80(sp)
    80008808:	6666                	ld	a2,88(sp)
    8000880a:	7686                	ld	a3,96(sp)
    8000880c:	7726                	ld	a4,104(sp)
    8000880e:	77c6                	ld	a5,112(sp)
    80008810:	7866                	ld	a6,120(sp)
    80008812:	688a                	ld	a7,128(sp)
    80008814:	692a                	ld	s2,136(sp)
    80008816:	69ca                	ld	s3,144(sp)
    80008818:	6a6a                	ld	s4,152(sp)
    8000881a:	7a8a                	ld	s5,160(sp)
    8000881c:	7b2a                	ld	s6,168(sp)
    8000881e:	7bca                	ld	s7,176(sp)
    80008820:	7c6a                	ld	s8,184(sp)
    80008822:	6c8e                	ld	s9,192(sp)
    80008824:	6d2e                	ld	s10,200(sp)
    80008826:	6dce                	ld	s11,208(sp)
    80008828:	6e6e                	ld	t3,216(sp)
    8000882a:	7e8e                	ld	t4,224(sp)
    8000882c:	7f2e                	ld	t5,232(sp)
    8000882e:	7fce                	ld	t6,240(sp)
    80008830:	6111                	addi	sp,sp,256
    80008832:	10200073          	sret
    80008836:	00000013          	nop
    8000883a:	00000013          	nop
    8000883e:	0001                	nop

0000000080008840 <timervec>:
    80008840:	34051573          	csrrw	a0,mscratch,a0
    80008844:	e10c                	sd	a1,0(a0)
    80008846:	e510                	sd	a2,8(a0)
    80008848:	e914                	sd	a3,16(a0)
    8000884a:	6d0c                	ld	a1,24(a0)
    8000884c:	7110                	ld	a2,32(a0)
    8000884e:	6194                	ld	a3,0(a1)
    80008850:	96b2                	add	a3,a3,a2
    80008852:	e194                	sd	a3,0(a1)
    80008854:	4589                	li	a1,2
    80008856:	14459073          	csrw	sip,a1
    8000885a:	6914                	ld	a3,16(a0)
    8000885c:	6510                	ld	a2,8(a0)
    8000885e:	610c                	ld	a1,0(a0)
    80008860:	34051573          	csrrw	a0,mscratch,a0
    80008864:	30200073          	mret
	...

000000008000886a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    8000886a:	1141                	addi	sp,sp,-16
    8000886c:	e422                	sd	s0,8(sp)
    8000886e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008870:	0c0007b7          	lui	a5,0xc000
    80008874:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008878:	4705                	li	a4,1
    8000887a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    8000887c:	0c0007b7          	lui	a5,0xc000
    80008880:	0791                	addi	a5,a5,4 # c000004 <_entry-0x73fffffc>
    80008882:	4705                	li	a4,1
    80008884:	c398                	sw	a4,0(a5)
}
    80008886:	0001                	nop
    80008888:	6422                	ld	s0,8(sp)
    8000888a:	0141                	addi	sp,sp,16
    8000888c:	8082                	ret

000000008000888e <plicinithart>:

void
plicinithart(void)
{
    8000888e:	1101                	addi	sp,sp,-32
    80008890:	ec06                	sd	ra,24(sp)
    80008892:	e822                	sd	s0,16(sp)
    80008894:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008896:	ffffa097          	auipc	ra,0xffffa
    8000889a:	f4c080e7          	jalr	-180(ra) # 800027e2 <cpuid>
    8000889e:	87aa                	mv	a5,a0
    800088a0:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    800088a4:	fec42783          	lw	a5,-20(s0)
    800088a8:	0087979b          	slliw	a5,a5,0x8
    800088ac:	2781                	sext.w	a5,a5
    800088ae:	873e                	mv	a4,a5
    800088b0:	0c0027b7          	lui	a5,0xc002
    800088b4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    800088b8:	97ba                	add	a5,a5,a4
    800088ba:	873e                	mv	a4,a5
    800088bc:	40200793          	li	a5,1026
    800088c0:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    800088c2:	fec42783          	lw	a5,-20(s0)
    800088c6:	00d7979b          	slliw	a5,a5,0xd
    800088ca:	2781                	sext.w	a5,a5
    800088cc:	873e                	mv	a4,a5
    800088ce:	0c2017b7          	lui	a5,0xc201
    800088d2:	97ba                	add	a5,a5,a4
    800088d4:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    800088d8:	0001                	nop
    800088da:	60e2                	ld	ra,24(sp)
    800088dc:	6442                	ld	s0,16(sp)
    800088de:	6105                	addi	sp,sp,32
    800088e0:	8082                	ret

00000000800088e2 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    800088e2:	1101                	addi	sp,sp,-32
    800088e4:	ec06                	sd	ra,24(sp)
    800088e6:	e822                	sd	s0,16(sp)
    800088e8:	1000                	addi	s0,sp,32
  int hart = cpuid();
    800088ea:	ffffa097          	auipc	ra,0xffffa
    800088ee:	ef8080e7          	jalr	-264(ra) # 800027e2 <cpuid>
    800088f2:	87aa                	mv	a5,a0
    800088f4:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    800088f8:	fec42783          	lw	a5,-20(s0)
    800088fc:	00d7979b          	slliw	a5,a5,0xd
    80008900:	2781                	sext.w	a5,a5
    80008902:	873e                	mv	a4,a5
    80008904:	0c2017b7          	lui	a5,0xc201
    80008908:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    8000890a:	97ba                	add	a5,a5,a4
    8000890c:	439c                	lw	a5,0(a5)
    8000890e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008912:	fe842783          	lw	a5,-24(s0)
}
    80008916:	853e                	mv	a0,a5
    80008918:	60e2                	ld	ra,24(sp)
    8000891a:	6442                	ld	s0,16(sp)
    8000891c:	6105                	addi	sp,sp,32
    8000891e:	8082                	ret

0000000080008920 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008920:	7179                	addi	sp,sp,-48
    80008922:	f406                	sd	ra,40(sp)
    80008924:	f022                	sd	s0,32(sp)
    80008926:	1800                	addi	s0,sp,48
    80008928:	87aa                	mv	a5,a0
    8000892a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    8000892e:	ffffa097          	auipc	ra,0xffffa
    80008932:	eb4080e7          	jalr	-332(ra) # 800027e2 <cpuid>
    80008936:	87aa                	mv	a5,a0
    80008938:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    8000893c:	fec42783          	lw	a5,-20(s0)
    80008940:	00d7979b          	slliw	a5,a5,0xd
    80008944:	2781                	sext.w	a5,a5
    80008946:	873e                	mv	a4,a5
    80008948:	0c2017b7          	lui	a5,0xc201
    8000894c:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    8000894e:	97ba                	add	a5,a5,a4
    80008950:	873e                	mv	a4,a5
    80008952:	fdc42783          	lw	a5,-36(s0)
    80008956:	c31c                	sw	a5,0(a4)
}
    80008958:	0001                	nop
    8000895a:	70a2                	ld	ra,40(sp)
    8000895c:	7402                	ld	s0,32(sp)
    8000895e:	6145                	addi	sp,sp,48
    80008960:	8082                	ret

0000000080008962 <virtio_disk_init>:
  
} disk;

void
virtio_disk_init(void)
{
    80008962:	7179                	addi	sp,sp,-48
    80008964:	f406                	sd	ra,40(sp)
    80008966:	f022                	sd	s0,32(sp)
    80008968:	1800                	addi	s0,sp,48
  uint32 status = 0;
    8000896a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    8000896e:	00003597          	auipc	a1,0x3
    80008972:	cea58593          	addi	a1,a1,-790 # 8000b658 <etext+0x658>
    80008976:	0001c517          	auipc	a0,0x1c
    8000897a:	3da50513          	addi	a0,a0,986 # 80024d50 <disk+0x128>
    8000897e:	ffff9097          	auipc	ra,0xffff9
    80008982:	8ca080e7          	jalr	-1846(ra) # 80001248 <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008986:	100017b7          	lui	a5,0x10001
    8000898a:	439c                	lw	a5,0(a5)
    8000898c:	2781                	sext.w	a5,a5
    8000898e:	873e                	mv	a4,a5
    80008990:	747277b7          	lui	a5,0x74727
    80008994:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008998:	04f71063          	bne	a4,a5,800089d8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 2 ||
    8000899c:	100017b7          	lui	a5,0x10001
    800089a0:	0791                	addi	a5,a5,4 # 10001004 <_entry-0x6fffeffc>
    800089a2:	439c                	lw	a5,0(a5)
    800089a4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800089a6:	873e                	mv	a4,a5
    800089a8:	4789                	li	a5,2
    800089aa:	02f71763          	bne	a4,a5,800089d8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    800089ae:	100017b7          	lui	a5,0x10001
    800089b2:	07a1                	addi	a5,a5,8 # 10001008 <_entry-0x6fffeff8>
    800089b4:	439c                	lw	a5,0(a5)
    800089b6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 2 ||
    800089b8:	873e                	mv	a4,a5
    800089ba:	4789                	li	a5,2
    800089bc:	00f71e63          	bne	a4,a5,800089d8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    800089c0:	100017b7          	lui	a5,0x10001
    800089c4:	07b1                	addi	a5,a5,12 # 1000100c <_entry-0x6fffeff4>
    800089c6:	439c                	lw	a5,0(a5)
    800089c8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    800089ca:	873e                	mv	a4,a5
    800089cc:	554d47b7          	lui	a5,0x554d4
    800089d0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    800089d4:	00f70a63          	beq	a4,a5,800089e8 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    800089d8:	00003517          	auipc	a0,0x3
    800089dc:	c9050513          	addi	a0,a0,-880 # 8000b668 <etext+0x668>
    800089e0:	ffff8097          	auipc	ra,0xffff8
    800089e4:	2aa080e7          	jalr	682(ra) # 80000c8a <panic>
  }
  
  // reset device
  *R(VIRTIO_MMIO_STATUS) = status;
    800089e8:	100017b7          	lui	a5,0x10001
    800089ec:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    800089f0:	fe842703          	lw	a4,-24(s0)
    800089f4:	c398                	sw	a4,0(a5)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    800089f6:	fe842783          	lw	a5,-24(s0)
    800089fa:	0017e793          	ori	a5,a5,1
    800089fe:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a02:	100017b7          	lui	a5,0x10001
    80008a06:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a0a:	fe842703          	lw	a4,-24(s0)
    80008a0e:	c398                	sw	a4,0(a5)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008a10:	fe842783          	lw	a5,-24(s0)
    80008a14:	0027e793          	ori	a5,a5,2
    80008a18:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a1c:	100017b7          	lui	a5,0x10001
    80008a20:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a24:	fe842703          	lw	a4,-24(s0)
    80008a28:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008a2a:	100017b7          	lui	a5,0x10001
    80008a2e:	07c1                	addi	a5,a5,16 # 10001010 <_entry-0x6fffeff0>
    80008a30:	439c                	lw	a5,0(a5)
    80008a32:	2781                	sext.w	a5,a5
    80008a34:	1782                	slli	a5,a5,0x20
    80008a36:	9381                	srli	a5,a5,0x20
    80008a38:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008a3c:	fe043783          	ld	a5,-32(s0)
    80008a40:	fdf7f793          	andi	a5,a5,-33
    80008a44:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008a48:	fe043783          	ld	a5,-32(s0)
    80008a4c:	f7f7f793          	andi	a5,a5,-129
    80008a50:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008a54:	fe043703          	ld	a4,-32(s0)
    80008a58:	77fd                	lui	a5,0xfffff
    80008a5a:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffdaa97>
    80008a5e:	8ff9                	and	a5,a5,a4
    80008a60:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008a64:	fe043703          	ld	a4,-32(s0)
    80008a68:	77fd                	lui	a5,0xfffff
    80008a6a:	17fd                	addi	a5,a5,-1 # ffffffffffffefff <end+0xffffffff7ffda297>
    80008a6c:	8ff9                	and	a5,a5,a4
    80008a6e:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008a72:	fe043703          	ld	a4,-32(s0)
    80008a76:	f80007b7          	lui	a5,0xf8000
    80008a7a:	17fd                	addi	a5,a5,-1 # fffffffff7ffffff <end+0xffffffff77fdb297>
    80008a7c:	8ff9                	and	a5,a5,a4
    80008a7e:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008a82:	fe043703          	ld	a4,-32(s0)
    80008a86:	e00007b7          	lui	a5,0xe0000
    80008a8a:	17fd                	addi	a5,a5,-1 # ffffffffdfffffff <end+0xffffffff5ffdb297>
    80008a8c:	8ff9                	and	a5,a5,a4
    80008a8e:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008a92:	fe043703          	ld	a4,-32(s0)
    80008a96:	f00007b7          	lui	a5,0xf0000
    80008a9a:	17fd                	addi	a5,a5,-1 # ffffffffefffffff <end+0xffffffff6ffdb297>
    80008a9c:	8ff9                	and	a5,a5,a4
    80008a9e:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008aa2:	100017b7          	lui	a5,0x10001
    80008aa6:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008aaa:	fe043703          	ld	a4,-32(s0)
    80008aae:	2701                	sext.w	a4,a4
    80008ab0:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ab2:	fe842783          	lw	a5,-24(s0)
    80008ab6:	0087e793          	ori	a5,a5,8
    80008aba:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008abe:	100017b7          	lui	a5,0x10001
    80008ac2:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ac6:	fe842703          	lw	a4,-24(s0)
    80008aca:	c398                	sw	a4,0(a5)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(VIRTIO_MMIO_STATUS);
    80008acc:	100017b7          	lui	a5,0x10001
    80008ad0:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008ad4:	439c                	lw	a5,0(a5)
    80008ad6:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008ada:	fe842783          	lw	a5,-24(s0)
    80008ade:	8ba1                	andi	a5,a5,8
    80008ae0:	2781                	sext.w	a5,a5
    80008ae2:	eb89                	bnez	a5,80008af4 <virtio_disk_init+0x192>
    panic("virtio disk FEATURES_OK unset");
    80008ae4:	00003517          	auipc	a0,0x3
    80008ae8:	ba450513          	addi	a0,a0,-1116 # 8000b688 <etext+0x688>
    80008aec:	ffff8097          	auipc	ra,0xffff8
    80008af0:	19e080e7          	jalr	414(ra) # 80000c8a <panic>

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008af4:	100017b7          	lui	a5,0x10001
    80008af8:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008afc:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(VIRTIO_MMIO_QUEUE_READY))
    80008b00:	100017b7          	lui	a5,0x10001
    80008b04:	04478793          	addi	a5,a5,68 # 10001044 <_entry-0x6fffefbc>
    80008b08:	439c                	lw	a5,0(a5)
    80008b0a:	2781                	sext.w	a5,a5
    80008b0c:	cb89                	beqz	a5,80008b1e <virtio_disk_init+0x1bc>
    panic("virtio disk should not be ready");
    80008b0e:	00003517          	auipc	a0,0x3
    80008b12:	b9a50513          	addi	a0,a0,-1126 # 8000b6a8 <etext+0x6a8>
    80008b16:	ffff8097          	auipc	ra,0xffff8
    80008b1a:	174080e7          	jalr	372(ra) # 80000c8a <panic>

  // check maximum queue size.
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008b1e:	100017b7          	lui	a5,0x10001
    80008b22:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008b26:	439c                	lw	a5,0(a5)
    80008b28:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008b2c:	fdc42783          	lw	a5,-36(s0)
    80008b30:	2781                	sext.w	a5,a5
    80008b32:	eb89                	bnez	a5,80008b44 <virtio_disk_init+0x1e2>
    panic("virtio disk has no queue 0");
    80008b34:	00003517          	auipc	a0,0x3
    80008b38:	b9450513          	addi	a0,a0,-1132 # 8000b6c8 <etext+0x6c8>
    80008b3c:	ffff8097          	auipc	ra,0xffff8
    80008b40:	14e080e7          	jalr	334(ra) # 80000c8a <panic>
  if(max < NUM)
    80008b44:	fdc42783          	lw	a5,-36(s0)
    80008b48:	0007871b          	sext.w	a4,a5
    80008b4c:	479d                	li	a5,7
    80008b4e:	00e7ea63          	bltu	a5,a4,80008b62 <virtio_disk_init+0x200>
    panic("virtio disk max queue too short");
    80008b52:	00003517          	auipc	a0,0x3
    80008b56:	b9650513          	addi	a0,a0,-1130 # 8000b6e8 <etext+0x6e8>
    80008b5a:	ffff8097          	auipc	ra,0xffff8
    80008b5e:	130080e7          	jalr	304(ra) # 80000c8a <panic>

  // allocate and zero queue memory.
  disk.desc = kalloc();
    80008b62:	ffff8097          	auipc	ra,0xffff8
    80008b66:	5c2080e7          	jalr	1474(ra) # 80001124 <kalloc>
    80008b6a:	872a                	mv	a4,a0
    80008b6c:	0001c797          	auipc	a5,0x1c
    80008b70:	0bc78793          	addi	a5,a5,188 # 80024c28 <disk>
    80008b74:	e398                	sd	a4,0(a5)
  disk.avail = kalloc();
    80008b76:	ffff8097          	auipc	ra,0xffff8
    80008b7a:	5ae080e7          	jalr	1454(ra) # 80001124 <kalloc>
    80008b7e:	872a                	mv	a4,a0
    80008b80:	0001c797          	auipc	a5,0x1c
    80008b84:	0a878793          	addi	a5,a5,168 # 80024c28 <disk>
    80008b88:	e798                	sd	a4,8(a5)
  disk.used = kalloc();
    80008b8a:	ffff8097          	auipc	ra,0xffff8
    80008b8e:	59a080e7          	jalr	1434(ra) # 80001124 <kalloc>
    80008b92:	872a                	mv	a4,a0
    80008b94:	0001c797          	auipc	a5,0x1c
    80008b98:	09478793          	addi	a5,a5,148 # 80024c28 <disk>
    80008b9c:	eb98                	sd	a4,16(a5)
  if(!disk.desc || !disk.avail || !disk.used)
    80008b9e:	0001c797          	auipc	a5,0x1c
    80008ba2:	08a78793          	addi	a5,a5,138 # 80024c28 <disk>
    80008ba6:	639c                	ld	a5,0(a5)
    80008ba8:	cf89                	beqz	a5,80008bc2 <virtio_disk_init+0x260>
    80008baa:	0001c797          	auipc	a5,0x1c
    80008bae:	07e78793          	addi	a5,a5,126 # 80024c28 <disk>
    80008bb2:	679c                	ld	a5,8(a5)
    80008bb4:	c799                	beqz	a5,80008bc2 <virtio_disk_init+0x260>
    80008bb6:	0001c797          	auipc	a5,0x1c
    80008bba:	07278793          	addi	a5,a5,114 # 80024c28 <disk>
    80008bbe:	6b9c                	ld	a5,16(a5)
    80008bc0:	eb89                	bnez	a5,80008bd2 <virtio_disk_init+0x270>
    panic("virtio disk kalloc");
    80008bc2:	00003517          	auipc	a0,0x3
    80008bc6:	b4650513          	addi	a0,a0,-1210 # 8000b708 <etext+0x708>
    80008bca:	ffff8097          	auipc	ra,0xffff8
    80008bce:	0c0080e7          	jalr	192(ra) # 80000c8a <panic>
  memset(disk.desc, 0, PGSIZE);
    80008bd2:	0001c797          	auipc	a5,0x1c
    80008bd6:	05678793          	addi	a5,a5,86 # 80024c28 <disk>
    80008bda:	639c                	ld	a5,0(a5)
    80008bdc:	6605                	lui	a2,0x1
    80008bde:	4581                	li	a1,0
    80008be0:	853e                	mv	a0,a5
    80008be2:	ffff9097          	auipc	ra,0xffff9
    80008be6:	86a080e7          	jalr	-1942(ra) # 8000144c <memset>
  memset(disk.avail, 0, PGSIZE);
    80008bea:	0001c797          	auipc	a5,0x1c
    80008bee:	03e78793          	addi	a5,a5,62 # 80024c28 <disk>
    80008bf2:	679c                	ld	a5,8(a5)
    80008bf4:	6605                	lui	a2,0x1
    80008bf6:	4581                	li	a1,0
    80008bf8:	853e                	mv	a0,a5
    80008bfa:	ffff9097          	auipc	ra,0xffff9
    80008bfe:	852080e7          	jalr	-1966(ra) # 8000144c <memset>
  memset(disk.used, 0, PGSIZE);
    80008c02:	0001c797          	auipc	a5,0x1c
    80008c06:	02678793          	addi	a5,a5,38 # 80024c28 <disk>
    80008c0a:	6b9c                	ld	a5,16(a5)
    80008c0c:	6605                	lui	a2,0x1
    80008c0e:	4581                	li	a1,0
    80008c10:	853e                	mv	a0,a5
    80008c12:	ffff9097          	auipc	ra,0xffff9
    80008c16:	83a080e7          	jalr	-1990(ra) # 8000144c <memset>

  // set queue size.
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008c1a:	100017b7          	lui	a5,0x10001
    80008c1e:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008c22:	4721                	li	a4,8
    80008c24:	c398                	sw	a4,0(a5)

  // write physical addresses.
  *R(VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk.desc;
    80008c26:	0001c797          	auipc	a5,0x1c
    80008c2a:	00278793          	addi	a5,a5,2 # 80024c28 <disk>
    80008c2e:	639c                	ld	a5,0(a5)
    80008c30:	873e                	mv	a4,a5
    80008c32:	100017b7          	lui	a5,0x10001
    80008c36:	08078793          	addi	a5,a5,128 # 10001080 <_entry-0x6fffef80>
    80008c3a:	2701                	sext.w	a4,a4
    80008c3c:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk.desc >> 32;
    80008c3e:	0001c797          	auipc	a5,0x1c
    80008c42:	fea78793          	addi	a5,a5,-22 # 80024c28 <disk>
    80008c46:	639c                	ld	a5,0(a5)
    80008c48:	0207d713          	srli	a4,a5,0x20
    80008c4c:	100017b7          	lui	a5,0x10001
    80008c50:	08478793          	addi	a5,a5,132 # 10001084 <_entry-0x6fffef7c>
    80008c54:	2701                	sext.w	a4,a4
    80008c56:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk.avail;
    80008c58:	0001c797          	auipc	a5,0x1c
    80008c5c:	fd078793          	addi	a5,a5,-48 # 80024c28 <disk>
    80008c60:	679c                	ld	a5,8(a5)
    80008c62:	873e                	mv	a4,a5
    80008c64:	100017b7          	lui	a5,0x10001
    80008c68:	09078793          	addi	a5,a5,144 # 10001090 <_entry-0x6fffef70>
    80008c6c:	2701                	sext.w	a4,a4
    80008c6e:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk.avail >> 32;
    80008c70:	0001c797          	auipc	a5,0x1c
    80008c74:	fb878793          	addi	a5,a5,-72 # 80024c28 <disk>
    80008c78:	679c                	ld	a5,8(a5)
    80008c7a:	0207d713          	srli	a4,a5,0x20
    80008c7e:	100017b7          	lui	a5,0x10001
    80008c82:	09478793          	addi	a5,a5,148 # 10001094 <_entry-0x6fffef6c>
    80008c86:	2701                	sext.w	a4,a4
    80008c88:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk.used;
    80008c8a:	0001c797          	auipc	a5,0x1c
    80008c8e:	f9e78793          	addi	a5,a5,-98 # 80024c28 <disk>
    80008c92:	6b9c                	ld	a5,16(a5)
    80008c94:	873e                	mv	a4,a5
    80008c96:	100017b7          	lui	a5,0x10001
    80008c9a:	0a078793          	addi	a5,a5,160 # 100010a0 <_entry-0x6fffef60>
    80008c9e:	2701                	sext.w	a4,a4
    80008ca0:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk.used >> 32;
    80008ca2:	0001c797          	auipc	a5,0x1c
    80008ca6:	f8678793          	addi	a5,a5,-122 # 80024c28 <disk>
    80008caa:	6b9c                	ld	a5,16(a5)
    80008cac:	0207d713          	srli	a4,a5,0x20
    80008cb0:	100017b7          	lui	a5,0x10001
    80008cb4:	0a478793          	addi	a5,a5,164 # 100010a4 <_entry-0x6fffef5c>
    80008cb8:	2701                	sext.w	a4,a4
    80008cba:	c398                	sw	a4,0(a5)

  // queue is ready.
  *R(VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80008cbc:	100017b7          	lui	a5,0x10001
    80008cc0:	04478793          	addi	a5,a5,68 # 10001044 <_entry-0x6fffefbc>
    80008cc4:	4705                	li	a4,1
    80008cc6:	c398                	sw	a4,0(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008cc8:	fe042623          	sw	zero,-20(s0)
    80008ccc:	a005                	j	80008cec <virtio_disk_init+0x38a>
    disk.free[i] = 1;
    80008cce:	0001c717          	auipc	a4,0x1c
    80008cd2:	f5a70713          	addi	a4,a4,-166 # 80024c28 <disk>
    80008cd6:	fec42783          	lw	a5,-20(s0)
    80008cda:	97ba                	add	a5,a5,a4
    80008cdc:	4705                	li	a4,1
    80008cde:	00e78c23          	sb	a4,24(a5)
  for(int i = 0; i < NUM; i++)
    80008ce2:	fec42783          	lw	a5,-20(s0)
    80008ce6:	2785                	addiw	a5,a5,1
    80008ce8:	fef42623          	sw	a5,-20(s0)
    80008cec:	fec42783          	lw	a5,-20(s0)
    80008cf0:	0007871b          	sext.w	a4,a5
    80008cf4:	479d                	li	a5,7
    80008cf6:	fce7dce3          	bge	a5,a4,80008cce <virtio_disk_init+0x36c>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008cfa:	fe842783          	lw	a5,-24(s0)
    80008cfe:	0047e793          	ori	a5,a5,4
    80008d02:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008d06:	100017b7          	lui	a5,0x10001
    80008d0a:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008d0e:	fe842703          	lw	a4,-24(s0)
    80008d12:	c398                	sw	a4,0(a5)

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008d14:	0001                	nop
    80008d16:	70a2                	ld	ra,40(sp)
    80008d18:	7402                	ld	s0,32(sp)
    80008d1a:	6145                	addi	sp,sp,48
    80008d1c:	8082                	ret

0000000080008d1e <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008d1e:	1101                	addi	sp,sp,-32
    80008d20:	ec22                	sd	s0,24(sp)
    80008d22:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008d24:	fe042623          	sw	zero,-20(s0)
    80008d28:	a825                	j	80008d60 <alloc_desc+0x42>
    if(disk.free[i]){
    80008d2a:	0001c717          	auipc	a4,0x1c
    80008d2e:	efe70713          	addi	a4,a4,-258 # 80024c28 <disk>
    80008d32:	fec42783          	lw	a5,-20(s0)
    80008d36:	97ba                	add	a5,a5,a4
    80008d38:	0187c783          	lbu	a5,24(a5)
    80008d3c:	cf89                	beqz	a5,80008d56 <alloc_desc+0x38>
      disk.free[i] = 0;
    80008d3e:	0001c717          	auipc	a4,0x1c
    80008d42:	eea70713          	addi	a4,a4,-278 # 80024c28 <disk>
    80008d46:	fec42783          	lw	a5,-20(s0)
    80008d4a:	97ba                	add	a5,a5,a4
    80008d4c:	00078c23          	sb	zero,24(a5)
      return i;
    80008d50:	fec42783          	lw	a5,-20(s0)
    80008d54:	a831                	j	80008d70 <alloc_desc+0x52>
  for(int i = 0; i < NUM; i++){
    80008d56:	fec42783          	lw	a5,-20(s0)
    80008d5a:	2785                	addiw	a5,a5,1
    80008d5c:	fef42623          	sw	a5,-20(s0)
    80008d60:	fec42783          	lw	a5,-20(s0)
    80008d64:	0007871b          	sext.w	a4,a5
    80008d68:	479d                	li	a5,7
    80008d6a:	fce7d0e3          	bge	a5,a4,80008d2a <alloc_desc+0xc>
    }
  }
  return -1;
    80008d6e:	57fd                	li	a5,-1
}
    80008d70:	853e                	mv	a0,a5
    80008d72:	6462                	ld	s0,24(sp)
    80008d74:	6105                	addi	sp,sp,32
    80008d76:	8082                	ret

0000000080008d78 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008d78:	1101                	addi	sp,sp,-32
    80008d7a:	ec06                	sd	ra,24(sp)
    80008d7c:	e822                	sd	s0,16(sp)
    80008d7e:	1000                	addi	s0,sp,32
    80008d80:	87aa                	mv	a5,a0
    80008d82:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008d86:	fec42783          	lw	a5,-20(s0)
    80008d8a:	0007871b          	sext.w	a4,a5
    80008d8e:	479d                	li	a5,7
    80008d90:	00e7da63          	bge	a5,a4,80008da4 <free_desc+0x2c>
    panic("free_desc 1");
    80008d94:	00003517          	auipc	a0,0x3
    80008d98:	98c50513          	addi	a0,a0,-1652 # 8000b720 <etext+0x720>
    80008d9c:	ffff8097          	auipc	ra,0xffff8
    80008da0:	eee080e7          	jalr	-274(ra) # 80000c8a <panic>
  if(disk.free[i])
    80008da4:	0001c717          	auipc	a4,0x1c
    80008da8:	e8470713          	addi	a4,a4,-380 # 80024c28 <disk>
    80008dac:	fec42783          	lw	a5,-20(s0)
    80008db0:	97ba                	add	a5,a5,a4
    80008db2:	0187c783          	lbu	a5,24(a5)
    80008db6:	cb89                	beqz	a5,80008dc8 <free_desc+0x50>
    panic("free_desc 2");
    80008db8:	00003517          	auipc	a0,0x3
    80008dbc:	97850513          	addi	a0,a0,-1672 # 8000b730 <etext+0x730>
    80008dc0:	ffff8097          	auipc	ra,0xffff8
    80008dc4:	eca080e7          	jalr	-310(ra) # 80000c8a <panic>
  disk.desc[i].addr = 0;
    80008dc8:	0001c797          	auipc	a5,0x1c
    80008dcc:	e6078793          	addi	a5,a5,-416 # 80024c28 <disk>
    80008dd0:	6398                	ld	a4,0(a5)
    80008dd2:	fec42783          	lw	a5,-20(s0)
    80008dd6:	0792                	slli	a5,a5,0x4
    80008dd8:	97ba                	add	a5,a5,a4
    80008dda:	0007b023          	sd	zero,0(a5)
  disk.desc[i].len = 0;
    80008dde:	0001c797          	auipc	a5,0x1c
    80008de2:	e4a78793          	addi	a5,a5,-438 # 80024c28 <disk>
    80008de6:	6398                	ld	a4,0(a5)
    80008de8:	fec42783          	lw	a5,-20(s0)
    80008dec:	0792                	slli	a5,a5,0x4
    80008dee:	97ba                	add	a5,a5,a4
    80008df0:	0007a423          	sw	zero,8(a5)
  disk.desc[i].flags = 0;
    80008df4:	0001c797          	auipc	a5,0x1c
    80008df8:	e3478793          	addi	a5,a5,-460 # 80024c28 <disk>
    80008dfc:	6398                	ld	a4,0(a5)
    80008dfe:	fec42783          	lw	a5,-20(s0)
    80008e02:	0792                	slli	a5,a5,0x4
    80008e04:	97ba                	add	a5,a5,a4
    80008e06:	00079623          	sh	zero,12(a5)
  disk.desc[i].next = 0;
    80008e0a:	0001c797          	auipc	a5,0x1c
    80008e0e:	e1e78793          	addi	a5,a5,-482 # 80024c28 <disk>
    80008e12:	6398                	ld	a4,0(a5)
    80008e14:	fec42783          	lw	a5,-20(s0)
    80008e18:	0792                	slli	a5,a5,0x4
    80008e1a:	97ba                	add	a5,a5,a4
    80008e1c:	00079723          	sh	zero,14(a5)
  disk.free[i] = 1;
    80008e20:	0001c717          	auipc	a4,0x1c
    80008e24:	e0870713          	addi	a4,a4,-504 # 80024c28 <disk>
    80008e28:	fec42783          	lw	a5,-20(s0)
    80008e2c:	97ba                	add	a5,a5,a4
    80008e2e:	4705                	li	a4,1
    80008e30:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80008e34:	0001c517          	auipc	a0,0x1c
    80008e38:	e0c50513          	addi	a0,a0,-500 # 80024c40 <disk+0x18>
    80008e3c:	ffffa097          	auipc	ra,0xffffa
    80008e40:	642080e7          	jalr	1602(ra) # 8000347e <wakeup>
}
    80008e44:	0001                	nop
    80008e46:	60e2                	ld	ra,24(sp)
    80008e48:	6442                	ld	s0,16(sp)
    80008e4a:	6105                	addi	sp,sp,32
    80008e4c:	8082                	ret

0000000080008e4e <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80008e4e:	7179                	addi	sp,sp,-48
    80008e50:	f406                	sd	ra,40(sp)
    80008e52:	f022                	sd	s0,32(sp)
    80008e54:	1800                	addi	s0,sp,48
    80008e56:	87aa                	mv	a5,a0
    80008e58:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    80008e5c:	0001c797          	auipc	a5,0x1c
    80008e60:	dcc78793          	addi	a5,a5,-564 # 80024c28 <disk>
    80008e64:	6398                	ld	a4,0(a5)
    80008e66:	fdc42783          	lw	a5,-36(s0)
    80008e6a:	0792                	slli	a5,a5,0x4
    80008e6c:	97ba                	add	a5,a5,a4
    80008e6e:	00c7d783          	lhu	a5,12(a5)
    80008e72:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    80008e76:	0001c797          	auipc	a5,0x1c
    80008e7a:	db278793          	addi	a5,a5,-590 # 80024c28 <disk>
    80008e7e:	6398                	ld	a4,0(a5)
    80008e80:	fdc42783          	lw	a5,-36(s0)
    80008e84:	0792                	slli	a5,a5,0x4
    80008e86:	97ba                	add	a5,a5,a4
    80008e88:	00e7d783          	lhu	a5,14(a5)
    80008e8c:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    80008e90:	fdc42783          	lw	a5,-36(s0)
    80008e94:	853e                	mv	a0,a5
    80008e96:	00000097          	auipc	ra,0x0
    80008e9a:	ee2080e7          	jalr	-286(ra) # 80008d78 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80008e9e:	fec42783          	lw	a5,-20(s0)
    80008ea2:	8b85                	andi	a5,a5,1
    80008ea4:	2781                	sext.w	a5,a5
    80008ea6:	c791                	beqz	a5,80008eb2 <free_chain+0x64>
      i = nxt;
    80008ea8:	fe842783          	lw	a5,-24(s0)
    80008eac:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    80008eb0:	b775                	j	80008e5c <free_chain+0xe>
    else
      break;
    80008eb2:	0001                	nop
  }
}
    80008eb4:	0001                	nop
    80008eb6:	70a2                	ld	ra,40(sp)
    80008eb8:	7402                	ld	s0,32(sp)
    80008eba:	6145                	addi	sp,sp,48
    80008ebc:	8082                	ret

0000000080008ebe <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80008ebe:	7139                	addi	sp,sp,-64
    80008ec0:	fc06                	sd	ra,56(sp)
    80008ec2:	f822                	sd	s0,48(sp)
    80008ec4:	f426                	sd	s1,40(sp)
    80008ec6:	0080                	addi	s0,sp,64
    80008ec8:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80008ecc:	fc042e23          	sw	zero,-36(s0)
    80008ed0:	a89d                	j	80008f46 <alloc3_desc+0x88>
    idx[i] = alloc_desc();
    80008ed2:	fdc42783          	lw	a5,-36(s0)
    80008ed6:	078a                	slli	a5,a5,0x2
    80008ed8:	fc843703          	ld	a4,-56(s0)
    80008edc:	00f704b3          	add	s1,a4,a5
    80008ee0:	00000097          	auipc	ra,0x0
    80008ee4:	e3e080e7          	jalr	-450(ra) # 80008d1e <alloc_desc>
    80008ee8:	87aa                	mv	a5,a0
    80008eea:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80008eec:	fdc42783          	lw	a5,-36(s0)
    80008ef0:	078a                	slli	a5,a5,0x2
    80008ef2:	fc843703          	ld	a4,-56(s0)
    80008ef6:	97ba                	add	a5,a5,a4
    80008ef8:	439c                	lw	a5,0(a5)
    80008efa:	0407d163          	bgez	a5,80008f3c <alloc3_desc+0x7e>
      for(int j = 0; j < i; j++)
    80008efe:	fc042c23          	sw	zero,-40(s0)
    80008f02:	a015                	j	80008f26 <alloc3_desc+0x68>
        free_desc(idx[j]);
    80008f04:	fd842783          	lw	a5,-40(s0)
    80008f08:	078a                	slli	a5,a5,0x2
    80008f0a:	fc843703          	ld	a4,-56(s0)
    80008f0e:	97ba                	add	a5,a5,a4
    80008f10:	439c                	lw	a5,0(a5)
    80008f12:	853e                	mv	a0,a5
    80008f14:	00000097          	auipc	ra,0x0
    80008f18:	e64080e7          	jalr	-412(ra) # 80008d78 <free_desc>
      for(int j = 0; j < i; j++)
    80008f1c:	fd842783          	lw	a5,-40(s0)
    80008f20:	2785                	addiw	a5,a5,1
    80008f22:	fcf42c23          	sw	a5,-40(s0)
    80008f26:	fd842783          	lw	a5,-40(s0)
    80008f2a:	873e                	mv	a4,a5
    80008f2c:	fdc42783          	lw	a5,-36(s0)
    80008f30:	2701                	sext.w	a4,a4
    80008f32:	2781                	sext.w	a5,a5
    80008f34:	fcf748e3          	blt	a4,a5,80008f04 <alloc3_desc+0x46>
      return -1;
    80008f38:	57fd                	li	a5,-1
    80008f3a:	a831                	j	80008f56 <alloc3_desc+0x98>
  for(int i = 0; i < 3; i++){
    80008f3c:	fdc42783          	lw	a5,-36(s0)
    80008f40:	2785                	addiw	a5,a5,1
    80008f42:	fcf42e23          	sw	a5,-36(s0)
    80008f46:	fdc42783          	lw	a5,-36(s0)
    80008f4a:	0007871b          	sext.w	a4,a5
    80008f4e:	4789                	li	a5,2
    80008f50:	f8e7d1e3          	bge	a5,a4,80008ed2 <alloc3_desc+0x14>
    }
  }
  return 0;
    80008f54:	4781                	li	a5,0
}
    80008f56:	853e                	mv	a0,a5
    80008f58:	70e2                	ld	ra,56(sp)
    80008f5a:	7442                	ld	s0,48(sp)
    80008f5c:	74a2                	ld	s1,40(sp)
    80008f5e:	6121                	addi	sp,sp,64
    80008f60:	8082                	ret

0000000080008f62 <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    80008f62:	7139                	addi	sp,sp,-64
    80008f64:	fc06                	sd	ra,56(sp)
    80008f66:	f822                	sd	s0,48(sp)
    80008f68:	0080                	addi	s0,sp,64
    80008f6a:	fca43423          	sd	a0,-56(s0)
    80008f6e:	87ae                	mv	a5,a1
    80008f70:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80008f74:	fc843783          	ld	a5,-56(s0)
    80008f78:	47dc                	lw	a5,12(a5)
    80008f7a:	0017979b          	slliw	a5,a5,0x1
    80008f7e:	2781                	sext.w	a5,a5
    80008f80:	1782                	slli	a5,a5,0x20
    80008f82:	9381                	srli	a5,a5,0x20
    80008f84:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    80008f88:	0001c517          	auipc	a0,0x1c
    80008f8c:	dc850513          	addi	a0,a0,-568 # 80024d50 <disk+0x128>
    80008f90:	ffff8097          	auipc	ra,0xffff8
    80008f94:	2e8080e7          	jalr	744(ra) # 80001278 <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    80008f98:	fd040793          	addi	a5,s0,-48
    80008f9c:	853e                	mv	a0,a5
    80008f9e:	00000097          	auipc	ra,0x0
    80008fa2:	f20080e7          	jalr	-224(ra) # 80008ebe <alloc3_desc>
    80008fa6:	87aa                	mv	a5,a0
    80008fa8:	cf91                	beqz	a5,80008fc4 <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80008faa:	0001c597          	auipc	a1,0x1c
    80008fae:	da658593          	addi	a1,a1,-602 # 80024d50 <disk+0x128>
    80008fb2:	0001c517          	auipc	a0,0x1c
    80008fb6:	c8e50513          	addi	a0,a0,-882 # 80024c40 <disk+0x18>
    80008fba:	ffffa097          	auipc	ra,0xffffa
    80008fbe:	448080e7          	jalr	1096(ra) # 80003402 <sleep>
    if(alloc3_desc(idx) == 0) {
    80008fc2:	bfd9                	j	80008f98 <virtio_disk_rw+0x36>
      break;
    80008fc4:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    80008fc6:	fd042783          	lw	a5,-48(s0)
    80008fca:	07a9                	addi	a5,a5,10
    80008fcc:	00479713          	slli	a4,a5,0x4
    80008fd0:	0001c797          	auipc	a5,0x1c
    80008fd4:	c5878793          	addi	a5,a5,-936 # 80024c28 <disk>
    80008fd8:	97ba                	add	a5,a5,a4
    80008fda:	07a1                	addi	a5,a5,8
    80008fdc:	fef43023          	sd	a5,-32(s0)

  if(write)
    80008fe0:	fc442783          	lw	a5,-60(s0)
    80008fe4:	2781                	sext.w	a5,a5
    80008fe6:	c791                	beqz	a5,80008ff2 <virtio_disk_rw+0x90>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80008fe8:	fe043783          	ld	a5,-32(s0)
    80008fec:	4705                	li	a4,1
    80008fee:	c398                	sw	a4,0(a5)
    80008ff0:	a029                	j	80008ffa <virtio_disk_rw+0x98>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80008ff2:	fe043783          	ld	a5,-32(s0)
    80008ff6:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80008ffa:	fe043783          	ld	a5,-32(s0)
    80008ffe:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    80009002:	fe043783          	ld	a5,-32(s0)
    80009006:	fe843703          	ld	a4,-24(s0)
    8000900a:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    8000900c:	0001c797          	auipc	a5,0x1c
    80009010:	c1c78793          	addi	a5,a5,-996 # 80024c28 <disk>
    80009014:	6398                	ld	a4,0(a5)
    80009016:	fd042783          	lw	a5,-48(s0)
    8000901a:	0792                	slli	a5,a5,0x4
    8000901c:	97ba                	add	a5,a5,a4
    8000901e:	fe043703          	ld	a4,-32(s0)
    80009022:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009024:	0001c797          	auipc	a5,0x1c
    80009028:	c0478793          	addi	a5,a5,-1020 # 80024c28 <disk>
    8000902c:	6398                	ld	a4,0(a5)
    8000902e:	fd042783          	lw	a5,-48(s0)
    80009032:	0792                	slli	a5,a5,0x4
    80009034:	97ba                	add	a5,a5,a4
    80009036:	4741                	li	a4,16
    80009038:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000903a:	0001c797          	auipc	a5,0x1c
    8000903e:	bee78793          	addi	a5,a5,-1042 # 80024c28 <disk>
    80009042:	6398                	ld	a4,0(a5)
    80009044:	fd042783          	lw	a5,-48(s0)
    80009048:	0792                	slli	a5,a5,0x4
    8000904a:	97ba                	add	a5,a5,a4
    8000904c:	4705                	li	a4,1
    8000904e:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80009052:	fd442683          	lw	a3,-44(s0)
    80009056:	0001c797          	auipc	a5,0x1c
    8000905a:	bd278793          	addi	a5,a5,-1070 # 80024c28 <disk>
    8000905e:	6398                	ld	a4,0(a5)
    80009060:	fd042783          	lw	a5,-48(s0)
    80009064:	0792                	slli	a5,a5,0x4
    80009066:	97ba                	add	a5,a5,a4
    80009068:	03069713          	slli	a4,a3,0x30
    8000906c:	9341                	srli	a4,a4,0x30
    8000906e:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80009072:	fc843783          	ld	a5,-56(s0)
    80009076:	05878693          	addi	a3,a5,88
    8000907a:	0001c797          	auipc	a5,0x1c
    8000907e:	bae78793          	addi	a5,a5,-1106 # 80024c28 <disk>
    80009082:	6398                	ld	a4,0(a5)
    80009084:	fd442783          	lw	a5,-44(s0)
    80009088:	0792                	slli	a5,a5,0x4
    8000908a:	97ba                	add	a5,a5,a4
    8000908c:	8736                	mv	a4,a3
    8000908e:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80009090:	0001c797          	auipc	a5,0x1c
    80009094:	b9878793          	addi	a5,a5,-1128 # 80024c28 <disk>
    80009098:	6398                	ld	a4,0(a5)
    8000909a:	fd442783          	lw	a5,-44(s0)
    8000909e:	0792                	slli	a5,a5,0x4
    800090a0:	97ba                	add	a5,a5,a4
    800090a2:	40000713          	li	a4,1024
    800090a6:	c798                	sw	a4,8(a5)
  if(write)
    800090a8:	fc442783          	lw	a5,-60(s0)
    800090ac:	2781                	sext.w	a5,a5
    800090ae:	cf89                	beqz	a5,800090c8 <virtio_disk_rw+0x166>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    800090b0:	0001c797          	auipc	a5,0x1c
    800090b4:	b7878793          	addi	a5,a5,-1160 # 80024c28 <disk>
    800090b8:	6398                	ld	a4,0(a5)
    800090ba:	fd442783          	lw	a5,-44(s0)
    800090be:	0792                	slli	a5,a5,0x4
    800090c0:	97ba                	add	a5,a5,a4
    800090c2:	00079623          	sh	zero,12(a5)
    800090c6:	a829                	j	800090e0 <virtio_disk_rw+0x17e>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    800090c8:	0001c797          	auipc	a5,0x1c
    800090cc:	b6078793          	addi	a5,a5,-1184 # 80024c28 <disk>
    800090d0:	6398                	ld	a4,0(a5)
    800090d2:	fd442783          	lw	a5,-44(s0)
    800090d6:	0792                	slli	a5,a5,0x4
    800090d8:	97ba                	add	a5,a5,a4
    800090da:	4709                	li	a4,2
    800090dc:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    800090e0:	0001c797          	auipc	a5,0x1c
    800090e4:	b4878793          	addi	a5,a5,-1208 # 80024c28 <disk>
    800090e8:	6398                	ld	a4,0(a5)
    800090ea:	fd442783          	lw	a5,-44(s0)
    800090ee:	0792                	slli	a5,a5,0x4
    800090f0:	97ba                	add	a5,a5,a4
    800090f2:	00c7d703          	lhu	a4,12(a5)
    800090f6:	0001c797          	auipc	a5,0x1c
    800090fa:	b3278793          	addi	a5,a5,-1230 # 80024c28 <disk>
    800090fe:	6394                	ld	a3,0(a5)
    80009100:	fd442783          	lw	a5,-44(s0)
    80009104:	0792                	slli	a5,a5,0x4
    80009106:	97b6                	add	a5,a5,a3
    80009108:	00176713          	ori	a4,a4,1
    8000910c:	1742                	slli	a4,a4,0x30
    8000910e:	9341                	srli	a4,a4,0x30
    80009110:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[1]].next = idx[2];
    80009114:	fd842683          	lw	a3,-40(s0)
    80009118:	0001c797          	auipc	a5,0x1c
    8000911c:	b1078793          	addi	a5,a5,-1264 # 80024c28 <disk>
    80009120:	6398                	ld	a4,0(a5)
    80009122:	fd442783          	lw	a5,-44(s0)
    80009126:	0792                	slli	a5,a5,0x4
    80009128:	97ba                	add	a5,a5,a4
    8000912a:	03069713          	slli	a4,a3,0x30
    8000912e:	9341                	srli	a4,a4,0x30
    80009130:	00e79723          	sh	a4,14(a5)

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    80009134:	fd042783          	lw	a5,-48(s0)
    80009138:	0001c717          	auipc	a4,0x1c
    8000913c:	af070713          	addi	a4,a4,-1296 # 80024c28 <disk>
    80009140:	0789                	addi	a5,a5,2
    80009142:	0792                	slli	a5,a5,0x4
    80009144:	97ba                	add	a5,a5,a4
    80009146:	577d                	li	a4,-1
    80009148:	00e78823          	sb	a4,16(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    8000914c:	fd042783          	lw	a5,-48(s0)
    80009150:	0789                	addi	a5,a5,2
    80009152:	00479713          	slli	a4,a5,0x4
    80009156:	0001c797          	auipc	a5,0x1c
    8000915a:	ad278793          	addi	a5,a5,-1326 # 80024c28 <disk>
    8000915e:	97ba                	add	a5,a5,a4
    80009160:	01078693          	addi	a3,a5,16
    80009164:	0001c797          	auipc	a5,0x1c
    80009168:	ac478793          	addi	a5,a5,-1340 # 80024c28 <disk>
    8000916c:	6398                	ld	a4,0(a5)
    8000916e:	fd842783          	lw	a5,-40(s0)
    80009172:	0792                	slli	a5,a5,0x4
    80009174:	97ba                	add	a5,a5,a4
    80009176:	8736                	mv	a4,a3
    80009178:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    8000917a:	0001c797          	auipc	a5,0x1c
    8000917e:	aae78793          	addi	a5,a5,-1362 # 80024c28 <disk>
    80009182:	6398                	ld	a4,0(a5)
    80009184:	fd842783          	lw	a5,-40(s0)
    80009188:	0792                	slli	a5,a5,0x4
    8000918a:	97ba                	add	a5,a5,a4
    8000918c:	4705                	li	a4,1
    8000918e:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009190:	0001c797          	auipc	a5,0x1c
    80009194:	a9878793          	addi	a5,a5,-1384 # 80024c28 <disk>
    80009198:	6398                	ld	a4,0(a5)
    8000919a:	fd842783          	lw	a5,-40(s0)
    8000919e:	0792                	slli	a5,a5,0x4
    800091a0:	97ba                	add	a5,a5,a4
    800091a2:	4709                	li	a4,2
    800091a4:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[2]].next = 0;
    800091a8:	0001c797          	auipc	a5,0x1c
    800091ac:	a8078793          	addi	a5,a5,-1408 # 80024c28 <disk>
    800091b0:	6398                	ld	a4,0(a5)
    800091b2:	fd842783          	lw	a5,-40(s0)
    800091b6:	0792                	slli	a5,a5,0x4
    800091b8:	97ba                	add	a5,a5,a4
    800091ba:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    800091be:	fc843783          	ld	a5,-56(s0)
    800091c2:	4705                	li	a4,1
    800091c4:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    800091c6:	fd042783          	lw	a5,-48(s0)
    800091ca:	0001c717          	auipc	a4,0x1c
    800091ce:	a5e70713          	addi	a4,a4,-1442 # 80024c28 <disk>
    800091d2:	0789                	addi	a5,a5,2
    800091d4:	0792                	slli	a5,a5,0x4
    800091d6:	97ba                	add	a5,a5,a4
    800091d8:	fc843703          	ld	a4,-56(s0)
    800091dc:	e798                	sd	a4,8(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    800091de:	fd042703          	lw	a4,-48(s0)
    800091e2:	0001c797          	auipc	a5,0x1c
    800091e6:	a4678793          	addi	a5,a5,-1466 # 80024c28 <disk>
    800091ea:	6794                	ld	a3,8(a5)
    800091ec:	0001c797          	auipc	a5,0x1c
    800091f0:	a3c78793          	addi	a5,a5,-1476 # 80024c28 <disk>
    800091f4:	679c                	ld	a5,8(a5)
    800091f6:	0027d783          	lhu	a5,2(a5)
    800091fa:	2781                	sext.w	a5,a5
    800091fc:	8b9d                	andi	a5,a5,7
    800091fe:	2781                	sext.w	a5,a5
    80009200:	1742                	slli	a4,a4,0x30
    80009202:	9341                	srli	a4,a4,0x30
    80009204:	0786                	slli	a5,a5,0x1
    80009206:	97b6                	add	a5,a5,a3
    80009208:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    8000920c:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009210:	0001c797          	auipc	a5,0x1c
    80009214:	a1878793          	addi	a5,a5,-1512 # 80024c28 <disk>
    80009218:	679c                	ld	a5,8(a5)
    8000921a:	0027d703          	lhu	a4,2(a5)
    8000921e:	0001c797          	auipc	a5,0x1c
    80009222:	a0a78793          	addi	a5,a5,-1526 # 80024c28 <disk>
    80009226:	679c                	ld	a5,8(a5)
    80009228:	2705                	addiw	a4,a4,1
    8000922a:	1742                	slli	a4,a4,0x30
    8000922c:	9341                	srli	a4,a4,0x30
    8000922e:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009232:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009236:	100017b7          	lui	a5,0x10001
    8000923a:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    8000923e:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009242:	a819                	j	80009258 <virtio_disk_rw+0x2f6>
    sleep(b, &disk.vdisk_lock);
    80009244:	0001c597          	auipc	a1,0x1c
    80009248:	b0c58593          	addi	a1,a1,-1268 # 80024d50 <disk+0x128>
    8000924c:	fc843503          	ld	a0,-56(s0)
    80009250:	ffffa097          	auipc	ra,0xffffa
    80009254:	1b2080e7          	jalr	434(ra) # 80003402 <sleep>
  while(b->disk == 1) {
    80009258:	fc843783          	ld	a5,-56(s0)
    8000925c:	43dc                	lw	a5,4(a5)
    8000925e:	873e                	mv	a4,a5
    80009260:	4785                	li	a5,1
    80009262:	fef701e3          	beq	a4,a5,80009244 <virtio_disk_rw+0x2e2>
  }

  disk.info[idx[0]].b = 0;
    80009266:	fd042783          	lw	a5,-48(s0)
    8000926a:	0001c717          	auipc	a4,0x1c
    8000926e:	9be70713          	addi	a4,a4,-1602 # 80024c28 <disk>
    80009272:	0789                	addi	a5,a5,2
    80009274:	0792                	slli	a5,a5,0x4
    80009276:	97ba                	add	a5,a5,a4
    80009278:	0007b423          	sd	zero,8(a5)
  free_chain(idx[0]);
    8000927c:	fd042783          	lw	a5,-48(s0)
    80009280:	853e                	mv	a0,a5
    80009282:	00000097          	auipc	ra,0x0
    80009286:	bcc080e7          	jalr	-1076(ra) # 80008e4e <free_chain>

  release(&disk.vdisk_lock);
    8000928a:	0001c517          	auipc	a0,0x1c
    8000928e:	ac650513          	addi	a0,a0,-1338 # 80024d50 <disk+0x128>
    80009292:	ffff8097          	auipc	ra,0xffff8
    80009296:	04a080e7          	jalr	74(ra) # 800012dc <release>
}
    8000929a:	0001                	nop
    8000929c:	70e2                	ld	ra,56(sp)
    8000929e:	7442                	ld	s0,48(sp)
    800092a0:	6121                	addi	sp,sp,64
    800092a2:	8082                	ret

00000000800092a4 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    800092a4:	1101                	addi	sp,sp,-32
    800092a6:	ec06                	sd	ra,24(sp)
    800092a8:	e822                	sd	s0,16(sp)
    800092aa:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    800092ac:	0001c517          	auipc	a0,0x1c
    800092b0:	aa450513          	addi	a0,a0,-1372 # 80024d50 <disk+0x128>
    800092b4:	ffff8097          	auipc	ra,0xffff8
    800092b8:	fc4080e7          	jalr	-60(ra) # 80001278 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    800092bc:	100017b7          	lui	a5,0x10001
    800092c0:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    800092c4:	439c                	lw	a5,0(a5)
    800092c6:	0007871b          	sext.w	a4,a5
    800092ca:	100017b7          	lui	a5,0x10001
    800092ce:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    800092d2:	8b0d                	andi	a4,a4,3
    800092d4:	2701                	sext.w	a4,a4
    800092d6:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    800092d8:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    800092dc:	a045                	j	8000937c <virtio_disk_intr+0xd8>
    __sync_synchronize();
    800092de:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    800092e2:	0001c797          	auipc	a5,0x1c
    800092e6:	94678793          	addi	a5,a5,-1722 # 80024c28 <disk>
    800092ea:	6b98                	ld	a4,16(a5)
    800092ec:	0001c797          	auipc	a5,0x1c
    800092f0:	93c78793          	addi	a5,a5,-1732 # 80024c28 <disk>
    800092f4:	0207d783          	lhu	a5,32(a5)
    800092f8:	2781                	sext.w	a5,a5
    800092fa:	8b9d                	andi	a5,a5,7
    800092fc:	2781                	sext.w	a5,a5
    800092fe:	078e                	slli	a5,a5,0x3
    80009300:	97ba                	add	a5,a5,a4
    80009302:	43dc                	lw	a5,4(a5)
    80009304:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009308:	0001c717          	auipc	a4,0x1c
    8000930c:	92070713          	addi	a4,a4,-1760 # 80024c28 <disk>
    80009310:	fec42783          	lw	a5,-20(s0)
    80009314:	0789                	addi	a5,a5,2
    80009316:	0792                	slli	a5,a5,0x4
    80009318:	97ba                	add	a5,a5,a4
    8000931a:	0107c783          	lbu	a5,16(a5)
    8000931e:	cb89                	beqz	a5,80009330 <virtio_disk_intr+0x8c>
      panic("virtio_disk_intr status");
    80009320:	00002517          	auipc	a0,0x2
    80009324:	42050513          	addi	a0,a0,1056 # 8000b740 <etext+0x740>
    80009328:	ffff8097          	auipc	ra,0xffff8
    8000932c:	962080e7          	jalr	-1694(ra) # 80000c8a <panic>

    struct buf *b = disk.info[id].b;
    80009330:	0001c717          	auipc	a4,0x1c
    80009334:	8f870713          	addi	a4,a4,-1800 # 80024c28 <disk>
    80009338:	fec42783          	lw	a5,-20(s0)
    8000933c:	0789                	addi	a5,a5,2
    8000933e:	0792                	slli	a5,a5,0x4
    80009340:	97ba                	add	a5,a5,a4
    80009342:	679c                	ld	a5,8(a5)
    80009344:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009348:	fe043783          	ld	a5,-32(s0)
    8000934c:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    80009350:	fe043503          	ld	a0,-32(s0)
    80009354:	ffffa097          	auipc	ra,0xffffa
    80009358:	12a080e7          	jalr	298(ra) # 8000347e <wakeup>

    disk.used_idx += 1;
    8000935c:	0001c797          	auipc	a5,0x1c
    80009360:	8cc78793          	addi	a5,a5,-1844 # 80024c28 <disk>
    80009364:	0207d783          	lhu	a5,32(a5)
    80009368:	2785                	addiw	a5,a5,1
    8000936a:	03079713          	slli	a4,a5,0x30
    8000936e:	9341                	srli	a4,a4,0x30
    80009370:	0001c797          	auipc	a5,0x1c
    80009374:	8b878793          	addi	a5,a5,-1864 # 80024c28 <disk>
    80009378:	02e79023          	sh	a4,32(a5)
  while(disk.used_idx != disk.used->idx){
    8000937c:	0001c797          	auipc	a5,0x1c
    80009380:	8ac78793          	addi	a5,a5,-1876 # 80024c28 <disk>
    80009384:	0207d703          	lhu	a4,32(a5)
    80009388:	0001c797          	auipc	a5,0x1c
    8000938c:	8a078793          	addi	a5,a5,-1888 # 80024c28 <disk>
    80009390:	6b9c                	ld	a5,16(a5)
    80009392:	0027d783          	lhu	a5,2(a5)
    80009396:	2701                	sext.w	a4,a4
    80009398:	2781                	sext.w	a5,a5
    8000939a:	f4f712e3          	bne	a4,a5,800092de <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000939e:	0001c517          	auipc	a0,0x1c
    800093a2:	9b250513          	addi	a0,a0,-1614 # 80024d50 <disk+0x128>
    800093a6:	ffff8097          	auipc	ra,0xffff8
    800093aa:	f36080e7          	jalr	-202(ra) # 800012dc <release>
}
    800093ae:	0001                	nop
    800093b0:	60e2                	ld	ra,24(sp)
    800093b2:	6442                	ld	s0,16(sp)
    800093b4:	6105                	addi	sp,sp,32
    800093b6:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051073          	csrw	sscratch,a0
    8000a004:	02000537          	lui	a0,0x2000
    8000a008:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a00a:	0536                	slli	a0,a0,0xd
    8000a00c:	02153423          	sd	ra,40(a0)
    8000a010:	02253823          	sd	sp,48(a0)
    8000a014:	02353c23          	sd	gp,56(a0)
    8000a018:	04453023          	sd	tp,64(a0)
    8000a01c:	04553423          	sd	t0,72(a0)
    8000a020:	04653823          	sd	t1,80(a0)
    8000a024:	04753c23          	sd	t2,88(a0)
    8000a028:	f120                	sd	s0,96(a0)
    8000a02a:	f524                	sd	s1,104(a0)
    8000a02c:	fd2c                	sd	a1,120(a0)
    8000a02e:	e150                	sd	a2,128(a0)
    8000a030:	e554                	sd	a3,136(a0)
    8000a032:	e958                	sd	a4,144(a0)
    8000a034:	ed5c                	sd	a5,152(a0)
    8000a036:	0b053023          	sd	a6,160(a0)
    8000a03a:	0b153423          	sd	a7,168(a0)
    8000a03e:	0b253823          	sd	s2,176(a0)
    8000a042:	0b353c23          	sd	s3,184(a0)
    8000a046:	0d453023          	sd	s4,192(a0)
    8000a04a:	0d553423          	sd	s5,200(a0)
    8000a04e:	0d653823          	sd	s6,208(a0)
    8000a052:	0d753c23          	sd	s7,216(a0)
    8000a056:	0f853023          	sd	s8,224(a0)
    8000a05a:	0f953423          	sd	s9,232(a0)
    8000a05e:	0fa53823          	sd	s10,240(a0)
    8000a062:	0fb53c23          	sd	s11,248(a0)
    8000a066:	11c53023          	sd	t3,256(a0)
    8000a06a:	11d53423          	sd	t4,264(a0)
    8000a06e:	11e53823          	sd	t5,272(a0)
    8000a072:	11f53c23          	sd	t6,280(a0)
    8000a076:	140022f3          	csrr	t0,sscratch
    8000a07a:	06553823          	sd	t0,112(a0)
    8000a07e:	00853103          	ld	sp,8(a0)
    8000a082:	02053203          	ld	tp,32(a0)
    8000a086:	01053283          	ld	t0,16(a0)
    8000a08a:	00053303          	ld	t1,0(a0)
    8000a08e:	12000073          	sfence.vma
    8000a092:	18031073          	csrw	satp,t1
    8000a096:	12000073          	sfence.vma
    8000a09a:	8282                	jr	t0

000000008000a09c <userret>:
    8000a09c:	12000073          	sfence.vma
    8000a0a0:	18051073          	csrw	satp,a0
    8000a0a4:	12000073          	sfence.vma
    8000a0a8:	02000537          	lui	a0,0x2000
    8000a0ac:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a0ae:	0536                	slli	a0,a0,0xd
    8000a0b0:	02853083          	ld	ra,40(a0)
    8000a0b4:	03053103          	ld	sp,48(a0)
    8000a0b8:	03853183          	ld	gp,56(a0)
    8000a0bc:	04053203          	ld	tp,64(a0)
    8000a0c0:	04853283          	ld	t0,72(a0)
    8000a0c4:	05053303          	ld	t1,80(a0)
    8000a0c8:	05853383          	ld	t2,88(a0)
    8000a0cc:	7120                	ld	s0,96(a0)
    8000a0ce:	7524                	ld	s1,104(a0)
    8000a0d0:	7d2c                	ld	a1,120(a0)
    8000a0d2:	6150                	ld	a2,128(a0)
    8000a0d4:	6554                	ld	a3,136(a0)
    8000a0d6:	6958                	ld	a4,144(a0)
    8000a0d8:	6d5c                	ld	a5,152(a0)
    8000a0da:	0a053803          	ld	a6,160(a0)
    8000a0de:	0a853883          	ld	a7,168(a0)
    8000a0e2:	0b053903          	ld	s2,176(a0)
    8000a0e6:	0b853983          	ld	s3,184(a0)
    8000a0ea:	0c053a03          	ld	s4,192(a0)
    8000a0ee:	0c853a83          	ld	s5,200(a0)
    8000a0f2:	0d053b03          	ld	s6,208(a0)
    8000a0f6:	0d853b83          	ld	s7,216(a0)
    8000a0fa:	0e053c03          	ld	s8,224(a0)
    8000a0fe:	0e853c83          	ld	s9,232(a0)
    8000a102:	0f053d03          	ld	s10,240(a0)
    8000a106:	0f853d83          	ld	s11,248(a0)
    8000a10a:	10053e03          	ld	t3,256(a0)
    8000a10e:	10853e83          	ld	t4,264(a0)
    8000a112:	11053f03          	ld	t5,272(a0)
    8000a116:	11853f83          	ld	t6,280(a0)
    8000a11a:	7928                	ld	a0,112(a0)
    8000a11c:	10200073          	sret
	...
