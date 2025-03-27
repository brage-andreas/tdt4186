#include "kernel/types.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
    if (argc <= 1)
    {
        printf("Usage: %s virtual_address [pid]\n", argv[0]);
        exit(1);
    }

    int addr = atoi(argv[1]);
    int pid = 0;

    if (argc >= 3)
    {
        pid = atoi(argv[2]);
    }

    int pa = va2pa(addr, pid);

    printf("0x%x\n", pa);
    exit(0);
}