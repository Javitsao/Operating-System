#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

/* NTU OS 2022 */
/* Page fault handler */
int handle_pgfault() {
  /* Find the address that caused the fault */
  /* uint64 va = r_stval(); */
  /* TODO */
  // panic("not implemented yet\n");
  madvise(PGROUNDDOWN((r_stval())),PGSIZE,1);
  return 0;
}
