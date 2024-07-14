#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "proc.h"

// for mp3
uint64
sys_thrdstop(void)
{
  int delay;
  uint64 context_id_ptr;
  uint64 handler, handler_arg;
  if (argint(0, &delay) < 0)
    return -1;
  if (argaddr(1, &context_id_ptr) < 0)
    return -1;
  if (argaddr(2, &handler) < 0)
    return -1;
  if (argaddr(3, &handler_arg) < 0)
    return -1;

  // check if the context ID is valid
  //struct proc *proc = myproc();
  int context_id;
  copyin(myproc()->pagetable, (char *)&context_id, context_id_ptr, sizeof(int));
  //context_id = -1;
  if (context_id == -1) {
    // find a free context ID
    for (int i = 0; i < MAX_THRD_NUM; i++) {
      if (myproc()->valid[i] == 1) {
        context_id = i;
        myproc()->valid[i] = 0;
        break;
      }
    }
    if (context_id == -1) {
      return -1; // no free context ID available
    }
  }
  copyout(myproc()->pagetable, context_id_ptr, (char *)&context_id, sizeof(int));
  
  myproc()->delay = delay;
  myproc()->context_id = context_id;
  myproc()->handler = handler;
  myproc()->handler_arg = handler_arg;
  myproc()->ticks = 0;
  //memmove(&myproc()->stored_frame[myproc()->context_id], myproc()->trapframe, sizeof(struct trapframe));

  //TODO: mp3

  return 0;
}

// for mp3
uint64
sys_cancelthrdstop(void)
{
  int context_id, is_exit;
  if (argint(0, &context_id) < 0)
    return -1;
  if (argint(1, &is_exit) < 0)
    return -1;

  if (context_id < 0 || context_id >= MAX_THRD_NUM) {
    return -1;
  }
  //struct proc *proc = myproc();
  if(is_exit == 0){
    // if(context_id==-1)
    //   return myproc()->ticks;
    //myproc()->stored_frame[context_id]=*(myproc()->trapframe);
    memmove(myproc()->stored_frame + context_id, myproc()->trapframe, sizeof(struct trapframe));
  }
  else if(is_exit == 1){
    myproc()->valid[context_id] = 1;
  }
  myproc()->delay = 0;
  return myproc()->ticks;
  

  //TODO: mp3

  return 0;
}

// for mp3
uint64
sys_thrdresume(void)
{
  int context_id;
  if (argint(0, &context_id) < 0)
    return -1;

  //struct proc *proc = myproc();
  if(context_id >= 0 && context_id <= 15 && myproc()->valid[context_id] == 0){
    //*(myproc()->trapframe) = myproc()->stored_frame[context_id];
    //panic("re");
    memmove(myproc()->trapframe, myproc()->stored_frame + context_id, sizeof(struct trapframe));
    return 0;
  }
  else return -1;
  //TODO: mp3

  return 0;
}
