
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
    80000016:	170000ef          	jal	ra,80000186 <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
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

000000008000013a <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	18079073          	csrw	satp,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	34079073          	csrw	mscratch,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	823e                	mv	tp,a5
}
    8000017e:	0001                	nop
    80000180:	6462                	ld	s0,24(sp)
    80000182:	6105                	addi	sp,sp,32
    80000184:	8082                	ret

0000000080000186 <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    80000186:	1101                	addi	sp,sp,-32
    80000188:	ec06                	sd	ra,24(sp)
    8000018a:	e822                	sd	s0,16(sp)
    8000018c:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    8000018e:	00000097          	auipc	ra,0x0
    80000192:	ea8080e7          	jalr	-344(ra) # 80000036 <r_mstatus>
    80000196:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    8000019a:	fe843703          	ld	a4,-24(s0)
    8000019e:	77f9                	lui	a5,0xffffe
    800001a0:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ff8c7ff>
    800001a4:	8ff9                	and	a5,a5,a4
    800001a6:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001aa:	fe843703          	ld	a4,-24(s0)
    800001ae:	6785                	lui	a5,0x1
    800001b0:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001b4:	8fd9                	or	a5,a5,a4
    800001b6:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ba:	fe843503          	ld	a0,-24(s0)
    800001be:	00000097          	auipc	ra,0x0
    800001c2:	e92080e7          	jalr	-366(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001c6:	00001797          	auipc	a5,0x1
    800001ca:	63478793          	addi	a5,a5,1588 # 800017fa <main>
    800001ce:	853e                	mv	a0,a5
    800001d0:	00000097          	auipc	ra,0x0
    800001d4:	e9a080e7          	jalr	-358(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    800001d8:	4501                	li	a0,0
    800001da:	00000097          	auipc	ra,0x0
    800001de:	f60080e7          	jalr	-160(ra) # 8000013a <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    800001e2:	67c1                	lui	a5,0x10
    800001e4:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    800001e8:	00000097          	auipc	ra,0x0
    800001ec:	f04080e7          	jalr	-252(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    800001f0:	67c1                	lui	a5,0x10
    800001f2:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    800001f6:	00000097          	auipc	ra,0x0
    800001fa:	f10080e7          	jalr	-240(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    800001fe:	00000097          	auipc	ra,0x0
    80000202:	e86080e7          	jalr	-378(ra) # 80000084 <r_sie>
    80000206:	87aa                	mv	a5,a0
    80000208:	2227e793          	ori	a5,a5,546
    8000020c:	853e                	mv	a0,a5
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	e90080e7          	jalr	-368(ra) # 8000009e <w_sie>

  // ask for clock interrupts.
  timerinit();
    80000216:	00000097          	auipc	ra,0x0
    8000021a:	032080e7          	jalr	50(ra) # 80000248 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000021e:	00000097          	auipc	ra,0x0
    80000222:	dfe080e7          	jalr	-514(ra) # 8000001c <r_mhartid>
    80000226:	87aa                	mv	a5,a0
    80000228:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    8000022c:	fe442783          	lw	a5,-28(s0)
    80000230:	853e                	mv	a0,a5
    80000232:	00000097          	auipc	ra,0x0
    80000236:	f3c080e7          	jalr	-196(ra) # 8000016e <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    8000023a:	30200073          	mret
}
    8000023e:	0001                	nop
    80000240:	60e2                	ld	ra,24(sp)
    80000242:	6442                	ld	s0,16(sp)
    80000244:	6105                	addi	sp,sp,32
    80000246:	8082                	ret

0000000080000248 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000248:	1101                	addi	sp,sp,-32
    8000024a:	ec06                	sd	ra,24(sp)
    8000024c:	e822                	sd	s0,16(sp)
    8000024e:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    80000250:	00000097          	auipc	ra,0x0
    80000254:	dcc080e7          	jalr	-564(ra) # 8000001c <r_mhartid>
    80000258:	87aa                	mv	a5,a0
    8000025a:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    8000025e:	000f47b7          	lui	a5,0xf4
    80000262:	24078793          	addi	a5,a5,576 # f4240 <_entry-0x7ff0bdc0>
    80000266:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    8000026a:	0200c7b7          	lui	a5,0x200c
    8000026e:	17e1                	addi	a5,a5,-8
    80000270:	6398                	ld	a4,0(a5)
    80000272:	fe842783          	lw	a5,-24(s0)
    80000276:	fec42683          	lw	a3,-20(s0)
    8000027a:	0036969b          	slliw	a3,a3,0x3
    8000027e:	2681                	sext.w	a3,a3
    80000280:	8636                	mv	a2,a3
    80000282:	020046b7          	lui	a3,0x2004
    80000286:	96b2                	add	a3,a3,a2
    80000288:	97ba                	add	a5,a5,a4
    8000028a:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    8000028c:	fec42703          	lw	a4,-20(s0)
    80000290:	87ba                	mv	a5,a4
    80000292:	078a                	slli	a5,a5,0x2
    80000294:	97ba                	add	a5,a5,a4
    80000296:	078e                	slli	a5,a5,0x3
    80000298:	00014717          	auipc	a4,0x14
    8000029c:	d9870713          	addi	a4,a4,-616 # 80014030 <timer_scratch>
    800002a0:	97ba                	add	a5,a5,a4
    800002a2:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002a6:	fec42783          	lw	a5,-20(s0)
    800002aa:	0037979b          	slliw	a5,a5,0x3
    800002ae:	2781                	sext.w	a5,a5
    800002b0:	873e                	mv	a4,a5
    800002b2:	020047b7          	lui	a5,0x2004
    800002b6:	973e                	add	a4,a4,a5
    800002b8:	fe043783          	ld	a5,-32(s0)
    800002bc:	07e1                	addi	a5,a5,24
    800002be:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    800002c0:	fe043783          	ld	a5,-32(s0)
    800002c4:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    800002c8:	fe842703          	lw	a4,-24(s0)
    800002cc:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    800002ce:	fe043783          	ld	a5,-32(s0)
    800002d2:	853e                	mv	a0,a5
    800002d4:	00000097          	auipc	ra,0x0
    800002d8:	e80080e7          	jalr	-384(ra) # 80000154 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    800002dc:	00008797          	auipc	a5,0x8
    800002e0:	78478793          	addi	a5,a5,1924 # 80008a60 <timervec>
    800002e4:	853e                	mv	a0,a5
    800002e6:	00000097          	auipc	ra,0x0
    800002ea:	e3a080e7          	jalr	-454(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    800002ee:	00000097          	auipc	ra,0x0
    800002f2:	d48080e7          	jalr	-696(ra) # 80000036 <r_mstatus>
    800002f6:	87aa                	mv	a5,a0
    800002f8:	0087e793          	ori	a5,a5,8
    800002fc:	853e                	mv	a0,a5
    800002fe:	00000097          	auipc	ra,0x0
    80000302:	d52080e7          	jalr	-686(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000306:	00000097          	auipc	ra,0x0
    8000030a:	db2080e7          	jalr	-590(ra) # 800000b8 <r_mie>
    8000030e:	87aa                	mv	a5,a0
    80000310:	0807e793          	ori	a5,a5,128
    80000314:	853e                	mv	a0,a5
    80000316:	00000097          	auipc	ra,0x0
    8000031a:	dbc080e7          	jalr	-580(ra) # 800000d2 <w_mie>
}
    8000031e:	0001                	nop
    80000320:	60e2                	ld	ra,24(sp)
    80000322:	6442                	ld	s0,16(sp)
    80000324:	6105                	addi	sp,sp,32
    80000326:	8082                	ret

0000000080000328 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000328:	1101                	addi	sp,sp,-32
    8000032a:	ec06                	sd	ra,24(sp)
    8000032c:	e822                	sd	s0,16(sp)
    8000032e:	1000                	addi	s0,sp,32
    80000330:	87aa                	mv	a5,a0
    80000332:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000336:	fec42783          	lw	a5,-20(s0)
    8000033a:	0007871b          	sext.w	a4,a5
    8000033e:	10000793          	li	a5,256
    80000342:	02f71363          	bne	a4,a5,80000368 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000346:	4521                	li	a0,8
    80000348:	00001097          	auipc	ra,0x1
    8000034c:	af6080e7          	jalr	-1290(ra) # 80000e3e <uartputc_sync>
    80000350:	02000513          	li	a0,32
    80000354:	00001097          	auipc	ra,0x1
    80000358:	aea080e7          	jalr	-1302(ra) # 80000e3e <uartputc_sync>
    8000035c:	4521                	li	a0,8
    8000035e:	00001097          	auipc	ra,0x1
    80000362:	ae0080e7          	jalr	-1312(ra) # 80000e3e <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    80000366:	a801                	j	80000376 <consputc+0x4e>
    uartputc_sync(c);
    80000368:	fec42783          	lw	a5,-20(s0)
    8000036c:	853e                	mv	a0,a5
    8000036e:	00001097          	auipc	ra,0x1
    80000372:	ad0080e7          	jalr	-1328(ra) # 80000e3e <uartputc_sync>
}
    80000376:	0001                	nop
    80000378:	60e2                	ld	ra,24(sp)
    8000037a:	6442                	ld	s0,16(sp)
    8000037c:	6105                	addi	sp,sp,32
    8000037e:	8082                	ret

0000000080000380 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80000380:	7179                	addi	sp,sp,-48
    80000382:	f406                	sd	ra,40(sp)
    80000384:	f022                	sd	s0,32(sp)
    80000386:	1800                	addi	s0,sp,48
    80000388:	87aa                	mv	a5,a0
    8000038a:	fcb43823          	sd	a1,-48(s0)
    8000038e:	8732                	mv	a4,a2
    80000390:	fcf42e23          	sw	a5,-36(s0)
    80000394:	87ba                	mv	a5,a4
    80000396:	fcf42c23          	sw	a5,-40(s0)
  int i;

  acquire(&cons.lock);
    8000039a:	00014517          	auipc	a0,0x14
    8000039e:	dd650513          	addi	a0,a0,-554 # 80014170 <cons>
    800003a2:	00001097          	auipc	ra,0x1
    800003a6:	ede080e7          	jalr	-290(ra) # 80001280 <acquire>
  for(i = 0; i < n; i++){
    800003aa:	fe042623          	sw	zero,-20(s0)
    800003ae:	a0a1                	j	800003f6 <consolewrite+0x76>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003b0:	fec42703          	lw	a4,-20(s0)
    800003b4:	fd043783          	ld	a5,-48(s0)
    800003b8:	00f70633          	add	a2,a4,a5
    800003bc:	fdc42703          	lw	a4,-36(s0)
    800003c0:	feb40793          	addi	a5,s0,-21
    800003c4:	4685                	li	a3,1
    800003c6:	85ba                	mv	a1,a4
    800003c8:	853e                	mv	a0,a5
    800003ca:	00003097          	auipc	ra,0x3
    800003ce:	2fe080e7          	jalr	766(ra) # 800036c8 <either_copyin>
    800003d2:	87aa                	mv	a5,a0
    800003d4:	873e                	mv	a4,a5
    800003d6:	57fd                	li	a5,-1
    800003d8:	02f70863          	beq	a4,a5,80000408 <consolewrite+0x88>
      break;
    uartputc(c);
    800003dc:	feb44783          	lbu	a5,-21(s0)
    800003e0:	2781                	sext.w	a5,a5
    800003e2:	853e                	mv	a0,a5
    800003e4:	00001097          	auipc	ra,0x1
    800003e8:	970080e7          	jalr	-1680(ra) # 80000d54 <uartputc>
  for(i = 0; i < n; i++){
    800003ec:	fec42783          	lw	a5,-20(s0)
    800003f0:	2785                	addiw	a5,a5,1
    800003f2:	fef42623          	sw	a5,-20(s0)
    800003f6:	fec42703          	lw	a4,-20(s0)
    800003fa:	fd842783          	lw	a5,-40(s0)
    800003fe:	2701                	sext.w	a4,a4
    80000400:	2781                	sext.w	a5,a5
    80000402:	faf747e3          	blt	a4,a5,800003b0 <consolewrite+0x30>
    80000406:	a011                	j	8000040a <consolewrite+0x8a>
      break;
    80000408:	0001                	nop
  }
  release(&cons.lock);
    8000040a:	00014517          	auipc	a0,0x14
    8000040e:	d6650513          	addi	a0,a0,-666 # 80014170 <cons>
    80000412:	00001097          	auipc	ra,0x1
    80000416:	ed2080e7          	jalr	-302(ra) # 800012e4 <release>

  return i;
    8000041a:	fec42783          	lw	a5,-20(s0)
}
    8000041e:	853e                	mv	a0,a5
    80000420:	70a2                	ld	ra,40(sp)
    80000422:	7402                	ld	s0,32(sp)
    80000424:	6145                	addi	sp,sp,48
    80000426:	8082                	ret

0000000080000428 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000428:	7179                	addi	sp,sp,-48
    8000042a:	f406                	sd	ra,40(sp)
    8000042c:	f022                	sd	s0,32(sp)
    8000042e:	1800                	addi	s0,sp,48
    80000430:	87aa                	mv	a5,a0
    80000432:	fcb43823          	sd	a1,-48(s0)
    80000436:	8732                	mv	a4,a2
    80000438:	fcf42e23          	sw	a5,-36(s0)
    8000043c:	87ba                	mv	a5,a4
    8000043e:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    80000442:	fd842783          	lw	a5,-40(s0)
    80000446:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    8000044a:	00014517          	auipc	a0,0x14
    8000044e:	d2650513          	addi	a0,a0,-730 # 80014170 <cons>
    80000452:	00001097          	auipc	ra,0x1
    80000456:	e2e080e7          	jalr	-466(ra) # 80001280 <acquire>
  while(n > 0){
    8000045a:	a215                	j	8000057e <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    8000045c:	00002097          	auipc	ra,0x2
    80000460:	396080e7          	jalr	918(ra) # 800027f2 <myproc>
    80000464:	87aa                	mv	a5,a0
    80000466:	5b9c                	lw	a5,48(a5)
    80000468:	cb99                	beqz	a5,8000047e <consoleread+0x56>
        release(&cons.lock);
    8000046a:	00014517          	auipc	a0,0x14
    8000046e:	d0650513          	addi	a0,a0,-762 # 80014170 <cons>
    80000472:	00001097          	auipc	ra,0x1
    80000476:	e72080e7          	jalr	-398(ra) # 800012e4 <release>
        return -1;
    8000047a:	57fd                	li	a5,-1
    8000047c:	aa25                	j	800005b4 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    8000047e:	00014597          	auipc	a1,0x14
    80000482:	cf258593          	addi	a1,a1,-782 # 80014170 <cons>
    80000486:	00014517          	auipc	a0,0x14
    8000048a:	d8250513          	addi	a0,a0,-638 # 80014208 <cons+0x98>
    8000048e:	00003097          	auipc	ra,0x3
    80000492:	fac080e7          	jalr	-84(ra) # 8000343a <sleep>
    while(cons.r == cons.w){
    80000496:	00014797          	auipc	a5,0x14
    8000049a:	cda78793          	addi	a5,a5,-806 # 80014170 <cons>
    8000049e:	0987a703          	lw	a4,152(a5)
    800004a2:	00014797          	auipc	a5,0x14
    800004a6:	cce78793          	addi	a5,a5,-818 # 80014170 <cons>
    800004aa:	09c7a783          	lw	a5,156(a5)
    800004ae:	faf707e3          	beq	a4,a5,8000045c <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004b2:	00014797          	auipc	a5,0x14
    800004b6:	cbe78793          	addi	a5,a5,-834 # 80014170 <cons>
    800004ba:	0987a783          	lw	a5,152(a5)
    800004be:	2781                	sext.w	a5,a5
    800004c0:	0017871b          	addiw	a4,a5,1
    800004c4:	0007069b          	sext.w	a3,a4
    800004c8:	00014717          	auipc	a4,0x14
    800004cc:	ca870713          	addi	a4,a4,-856 # 80014170 <cons>
    800004d0:	08d72c23          	sw	a3,152(a4)
    800004d4:	07f7f793          	andi	a5,a5,127
    800004d8:	2781                	sext.w	a5,a5
    800004da:	00014717          	auipc	a4,0x14
    800004de:	c9670713          	addi	a4,a4,-874 # 80014170 <cons>
    800004e2:	1782                	slli	a5,a5,0x20
    800004e4:	9381                	srli	a5,a5,0x20
    800004e6:	97ba                	add	a5,a5,a4
    800004e8:	0187c783          	lbu	a5,24(a5)
    800004ec:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    800004f0:	fe842783          	lw	a5,-24(s0)
    800004f4:	0007871b          	sext.w	a4,a5
    800004f8:	4791                	li	a5,4
    800004fa:	02f71963          	bne	a4,a5,8000052c <consoleread+0x104>
      if(n < target){
    800004fe:	fd842703          	lw	a4,-40(s0)
    80000502:	fec42783          	lw	a5,-20(s0)
    80000506:	2781                	sext.w	a5,a5
    80000508:	08f77163          	bgeu	a4,a5,8000058a <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    8000050c:	00014797          	auipc	a5,0x14
    80000510:	c6478793          	addi	a5,a5,-924 # 80014170 <cons>
    80000514:	0987a783          	lw	a5,152(a5)
    80000518:	37fd                	addiw	a5,a5,-1
    8000051a:	0007871b          	sext.w	a4,a5
    8000051e:	00014797          	auipc	a5,0x14
    80000522:	c5278793          	addi	a5,a5,-942 # 80014170 <cons>
    80000526:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    8000052a:	a085                	j	8000058a <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    8000052c:	fe842783          	lw	a5,-24(s0)
    80000530:	0ff7f793          	andi	a5,a5,255
    80000534:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000538:	fe740713          	addi	a4,s0,-25
    8000053c:	fdc42783          	lw	a5,-36(s0)
    80000540:	4685                	li	a3,1
    80000542:	863a                	mv	a2,a4
    80000544:	fd043583          	ld	a1,-48(s0)
    80000548:	853e                	mv	a0,a5
    8000054a:	00003097          	auipc	ra,0x3
    8000054e:	10a080e7          	jalr	266(ra) # 80003654 <either_copyout>
    80000552:	87aa                	mv	a5,a0
    80000554:	873e                	mv	a4,a5
    80000556:	57fd                	li	a5,-1
    80000558:	02f70b63          	beq	a4,a5,8000058e <consoleread+0x166>
      break;

    dst++;
    8000055c:	fd043783          	ld	a5,-48(s0)
    80000560:	0785                	addi	a5,a5,1
    80000562:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000566:	fd842783          	lw	a5,-40(s0)
    8000056a:	37fd                	addiw	a5,a5,-1
    8000056c:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    80000570:	fe842783          	lw	a5,-24(s0)
    80000574:	0007871b          	sext.w	a4,a5
    80000578:	47a9                	li	a5,10
    8000057a:	00f70c63          	beq	a4,a5,80000592 <consoleread+0x16a>
  while(n > 0){
    8000057e:	fd842783          	lw	a5,-40(s0)
    80000582:	2781                	sext.w	a5,a5
    80000584:	f0f049e3          	bgtz	a5,80000496 <consoleread+0x6e>
    80000588:	a031                	j	80000594 <consoleread+0x16c>
      break;
    8000058a:	0001                	nop
    8000058c:	a021                	j	80000594 <consoleread+0x16c>
      break;
    8000058e:	0001                	nop
    80000590:	a011                	j	80000594 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    80000592:	0001                	nop
    }
  }
  release(&cons.lock);
    80000594:	00014517          	auipc	a0,0x14
    80000598:	bdc50513          	addi	a0,a0,-1060 # 80014170 <cons>
    8000059c:	00001097          	auipc	ra,0x1
    800005a0:	d48080e7          	jalr	-696(ra) # 800012e4 <release>

  return target - n;
    800005a4:	fd842783          	lw	a5,-40(s0)
    800005a8:	fec42703          	lw	a4,-20(s0)
    800005ac:	40f707bb          	subw	a5,a4,a5
    800005b0:	2781                	sext.w	a5,a5
    800005b2:	2781                	sext.w	a5,a5
}
    800005b4:	853e                	mv	a0,a5
    800005b6:	70a2                	ld	ra,40(sp)
    800005b8:	7402                	ld	s0,32(sp)
    800005ba:	6145                	addi	sp,sp,48
    800005bc:	8082                	ret

00000000800005be <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005be:	1101                	addi	sp,sp,-32
    800005c0:	ec06                	sd	ra,24(sp)
    800005c2:	e822                	sd	s0,16(sp)
    800005c4:	1000                	addi	s0,sp,32
    800005c6:	87aa                	mv	a5,a0
    800005c8:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005cc:	00014517          	auipc	a0,0x14
    800005d0:	ba450513          	addi	a0,a0,-1116 # 80014170 <cons>
    800005d4:	00001097          	auipc	ra,0x1
    800005d8:	cac080e7          	jalr	-852(ra) # 80001280 <acquire>

  switch(c){
    800005dc:	fec42783          	lw	a5,-20(s0)
    800005e0:	0007871b          	sext.w	a4,a5
    800005e4:	07f00793          	li	a5,127
    800005e8:	0cf70763          	beq	a4,a5,800006b6 <consoleintr+0xf8>
    800005ec:	fec42783          	lw	a5,-20(s0)
    800005f0:	0007871b          	sext.w	a4,a5
    800005f4:	07f00793          	li	a5,127
    800005f8:	10e7c363          	blt	a5,a4,800006fe <consoleintr+0x140>
    800005fc:	fec42783          	lw	a5,-20(s0)
    80000600:	0007871b          	sext.w	a4,a5
    80000604:	47d5                	li	a5,21
    80000606:	06f70163          	beq	a4,a5,80000668 <consoleintr+0xaa>
    8000060a:	fec42783          	lw	a5,-20(s0)
    8000060e:	0007871b          	sext.w	a4,a5
    80000612:	47d5                	li	a5,21
    80000614:	0ee7c563          	blt	a5,a4,800006fe <consoleintr+0x140>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	47a1                	li	a5,8
    80000622:	08f70a63          	beq	a4,a5,800006b6 <consoleintr+0xf8>
    80000626:	fec42783          	lw	a5,-20(s0)
    8000062a:	0007871b          	sext.w	a4,a5
    8000062e:	47c1                	li	a5,16
    80000630:	0cf71763          	bne	a4,a5,800006fe <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000634:	00003097          	auipc	ra,0x3
    80000638:	108080e7          	jalr	264(ra) # 8000373c <procdump>
    break;
    8000063c:	aac1                	j	8000080c <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000063e:	00014797          	auipc	a5,0x14
    80000642:	b3278793          	addi	a5,a5,-1230 # 80014170 <cons>
    80000646:	0a07a783          	lw	a5,160(a5)
    8000064a:	37fd                	addiw	a5,a5,-1
    8000064c:	0007871b          	sext.w	a4,a5
    80000650:	00014797          	auipc	a5,0x14
    80000654:	b2078793          	addi	a5,a5,-1248 # 80014170 <cons>
    80000658:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000065c:	10000513          	li	a0,256
    80000660:	00000097          	auipc	ra,0x0
    80000664:	cc8080e7          	jalr	-824(ra) # 80000328 <consputc>
    while(cons.e != cons.w &&
    80000668:	00014797          	auipc	a5,0x14
    8000066c:	b0878793          	addi	a5,a5,-1272 # 80014170 <cons>
    80000670:	0a07a703          	lw	a4,160(a5)
    80000674:	00014797          	auipc	a5,0x14
    80000678:	afc78793          	addi	a5,a5,-1284 # 80014170 <cons>
    8000067c:	09c7a783          	lw	a5,156(a5)
    80000680:	18f70163          	beq	a4,a5,80000802 <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80000684:	00014797          	auipc	a5,0x14
    80000688:	aec78793          	addi	a5,a5,-1300 # 80014170 <cons>
    8000068c:	0a07a783          	lw	a5,160(a5)
    80000690:	37fd                	addiw	a5,a5,-1
    80000692:	2781                	sext.w	a5,a5
    80000694:	07f7f793          	andi	a5,a5,127
    80000698:	2781                	sext.w	a5,a5
    8000069a:	00014717          	auipc	a4,0x14
    8000069e:	ad670713          	addi	a4,a4,-1322 # 80014170 <cons>
    800006a2:	1782                	slli	a5,a5,0x20
    800006a4:	9381                	srli	a5,a5,0x20
    800006a6:	97ba                	add	a5,a5,a4
    800006a8:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006ac:	873e                	mv	a4,a5
    800006ae:	47a9                	li	a5,10
    800006b0:	f8f717e3          	bne	a4,a5,8000063e <consoleintr+0x80>
    }
    break;
    800006b4:	a2b9                	j	80000802 <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006b6:	00014797          	auipc	a5,0x14
    800006ba:	aba78793          	addi	a5,a5,-1350 # 80014170 <cons>
    800006be:	0a07a703          	lw	a4,160(a5)
    800006c2:	00014797          	auipc	a5,0x14
    800006c6:	aae78793          	addi	a5,a5,-1362 # 80014170 <cons>
    800006ca:	09c7a783          	lw	a5,156(a5)
    800006ce:	12f70c63          	beq	a4,a5,80000806 <consoleintr+0x248>
      cons.e--;
    800006d2:	00014797          	auipc	a5,0x14
    800006d6:	a9e78793          	addi	a5,a5,-1378 # 80014170 <cons>
    800006da:	0a07a783          	lw	a5,160(a5)
    800006de:	37fd                	addiw	a5,a5,-1
    800006e0:	0007871b          	sext.w	a4,a5
    800006e4:	00014797          	auipc	a5,0x14
    800006e8:	a8c78793          	addi	a5,a5,-1396 # 80014170 <cons>
    800006ec:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    800006f0:	10000513          	li	a0,256
    800006f4:	00000097          	auipc	ra,0x0
    800006f8:	c34080e7          	jalr	-972(ra) # 80000328 <consputc>
    }
    break;
    800006fc:	a229                	j	80000806 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    800006fe:	fec42783          	lw	a5,-20(s0)
    80000702:	2781                	sext.w	a5,a5
    80000704:	10078363          	beqz	a5,8000080a <consoleintr+0x24c>
    80000708:	00014797          	auipc	a5,0x14
    8000070c:	a6878793          	addi	a5,a5,-1432 # 80014170 <cons>
    80000710:	0a07a703          	lw	a4,160(a5)
    80000714:	00014797          	auipc	a5,0x14
    80000718:	a5c78793          	addi	a5,a5,-1444 # 80014170 <cons>
    8000071c:	0987a783          	lw	a5,152(a5)
    80000720:	40f707bb          	subw	a5,a4,a5
    80000724:	2781                	sext.w	a5,a5
    80000726:	873e                	mv	a4,a5
    80000728:	07f00793          	li	a5,127
    8000072c:	0ce7ef63          	bltu	a5,a4,8000080a <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    80000730:	fec42783          	lw	a5,-20(s0)
    80000734:	0007871b          	sext.w	a4,a5
    80000738:	47b5                	li	a5,13
    8000073a:	00f70563          	beq	a4,a5,80000744 <consoleintr+0x186>
    8000073e:	fec42783          	lw	a5,-20(s0)
    80000742:	a011                	j	80000746 <consoleintr+0x188>
    80000744:	47a9                	li	a5,10
    80000746:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    8000074a:	fec42783          	lw	a5,-20(s0)
    8000074e:	853e                	mv	a0,a5
    80000750:	00000097          	auipc	ra,0x0
    80000754:	bd8080e7          	jalr	-1064(ra) # 80000328 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000758:	00014797          	auipc	a5,0x14
    8000075c:	a1878793          	addi	a5,a5,-1512 # 80014170 <cons>
    80000760:	0a07a783          	lw	a5,160(a5)
    80000764:	2781                	sext.w	a5,a5
    80000766:	0017871b          	addiw	a4,a5,1
    8000076a:	0007069b          	sext.w	a3,a4
    8000076e:	00014717          	auipc	a4,0x14
    80000772:	a0270713          	addi	a4,a4,-1534 # 80014170 <cons>
    80000776:	0ad72023          	sw	a3,160(a4)
    8000077a:	07f7f793          	andi	a5,a5,127
    8000077e:	2781                	sext.w	a5,a5
    80000780:	fec42703          	lw	a4,-20(s0)
    80000784:	0ff77713          	andi	a4,a4,255
    80000788:	00014697          	auipc	a3,0x14
    8000078c:	9e868693          	addi	a3,a3,-1560 # 80014170 <cons>
    80000790:	1782                	slli	a5,a5,0x20
    80000792:	9381                	srli	a5,a5,0x20
    80000794:	97b6                	add	a5,a5,a3
    80000796:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    8000079a:	fec42783          	lw	a5,-20(s0)
    8000079e:	0007871b          	sext.w	a4,a5
    800007a2:	47a9                	li	a5,10
    800007a4:	02f70a63          	beq	a4,a5,800007d8 <consoleintr+0x21a>
    800007a8:	fec42783          	lw	a5,-20(s0)
    800007ac:	0007871b          	sext.w	a4,a5
    800007b0:	4791                	li	a5,4
    800007b2:	02f70363          	beq	a4,a5,800007d8 <consoleintr+0x21a>
    800007b6:	00014797          	auipc	a5,0x14
    800007ba:	9ba78793          	addi	a5,a5,-1606 # 80014170 <cons>
    800007be:	0a07a703          	lw	a4,160(a5)
    800007c2:	00014797          	auipc	a5,0x14
    800007c6:	9ae78793          	addi	a5,a5,-1618 # 80014170 <cons>
    800007ca:	0987a783          	lw	a5,152(a5)
    800007ce:	0807879b          	addiw	a5,a5,128
    800007d2:	2781                	sext.w	a5,a5
    800007d4:	02f71b63          	bne	a4,a5,8000080a <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    800007d8:	00014797          	auipc	a5,0x14
    800007dc:	99878793          	addi	a5,a5,-1640 # 80014170 <cons>
    800007e0:	0a07a703          	lw	a4,160(a5)
    800007e4:	00014797          	auipc	a5,0x14
    800007e8:	98c78793          	addi	a5,a5,-1652 # 80014170 <cons>
    800007ec:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    800007f0:	00014517          	auipc	a0,0x14
    800007f4:	a1850513          	addi	a0,a0,-1512 # 80014208 <cons+0x98>
    800007f8:	00003097          	auipc	ra,0x3
    800007fc:	cd6080e7          	jalr	-810(ra) # 800034ce <wakeup>
      }
    }
    break;
    80000800:	a029                	j	8000080a <consoleintr+0x24c>
    break;
    80000802:	0001                	nop
    80000804:	a021                	j	8000080c <consoleintr+0x24e>
    break;
    80000806:	0001                	nop
    80000808:	a011                	j	8000080c <consoleintr+0x24e>
    break;
    8000080a:	0001                	nop
  }
  
  release(&cons.lock);
    8000080c:	00014517          	auipc	a0,0x14
    80000810:	96450513          	addi	a0,a0,-1692 # 80014170 <cons>
    80000814:	00001097          	auipc	ra,0x1
    80000818:	ad0080e7          	jalr	-1328(ra) # 800012e4 <release>
}
    8000081c:	0001                	nop
    8000081e:	60e2                	ld	ra,24(sp)
    80000820:	6442                	ld	s0,16(sp)
    80000822:	6105                	addi	sp,sp,32
    80000824:	8082                	ret

0000000080000826 <consoleinit>:

void
consoleinit(void)
{
    80000826:	1141                	addi	sp,sp,-16
    80000828:	e406                	sd	ra,8(sp)
    8000082a:	e022                	sd	s0,0(sp)
    8000082c:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000082e:	0000a597          	auipc	a1,0xa
    80000832:	7d258593          	addi	a1,a1,2002 # 8000b000 <etext>
    80000836:	00014517          	auipc	a0,0x14
    8000083a:	93a50513          	addi	a0,a0,-1734 # 80014170 <cons>
    8000083e:	00001097          	auipc	ra,0x1
    80000842:	a12080e7          	jalr	-1518(ra) # 80001250 <initlock>

  uartinit();
    80000846:	00000097          	auipc	ra,0x0
    8000084a:	494080e7          	jalr	1172(ra) # 80000cda <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000084e:	0006d797          	auipc	a5,0x6d
    80000852:	4aa78793          	addi	a5,a5,1194 # 8006dcf8 <devsw>
    80000856:	00000717          	auipc	a4,0x0
    8000085a:	bd270713          	addi	a4,a4,-1070 # 80000428 <consoleread>
    8000085e:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80000860:	0006d797          	auipc	a5,0x6d
    80000864:	49878793          	addi	a5,a5,1176 # 8006dcf8 <devsw>
    80000868:	00000717          	auipc	a4,0x0
    8000086c:	b1870713          	addi	a4,a4,-1256 # 80000380 <consolewrite>
    80000870:	ef98                	sd	a4,24(a5)
}
    80000872:	0001                	nop
    80000874:	60a2                	ld	ra,8(sp)
    80000876:	6402                	ld	s0,0(sp)
    80000878:	0141                	addi	sp,sp,16
    8000087a:	8082                	ret

000000008000087c <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    8000087c:	7139                	addi	sp,sp,-64
    8000087e:	fc06                	sd	ra,56(sp)
    80000880:	f822                	sd	s0,48(sp)
    80000882:	0080                	addi	s0,sp,64
    80000884:	87aa                	mv	a5,a0
    80000886:	86ae                	mv	a3,a1
    80000888:	8732                	mv	a4,a2
    8000088a:	fcf42623          	sw	a5,-52(s0)
    8000088e:	87b6                	mv	a5,a3
    80000890:	fcf42423          	sw	a5,-56(s0)
    80000894:	87ba                	mv	a5,a4
    80000896:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    8000089a:	fc442783          	lw	a5,-60(s0)
    8000089e:	2781                	sext.w	a5,a5
    800008a0:	c78d                	beqz	a5,800008ca <printint+0x4e>
    800008a2:	fcc42783          	lw	a5,-52(s0)
    800008a6:	01f7d79b          	srliw	a5,a5,0x1f
    800008aa:	0ff7f793          	andi	a5,a5,255
    800008ae:	fcf42223          	sw	a5,-60(s0)
    800008b2:	fc442783          	lw	a5,-60(s0)
    800008b6:	2781                	sext.w	a5,a5
    800008b8:	cb89                	beqz	a5,800008ca <printint+0x4e>
    x = -xx;
    800008ba:	fcc42783          	lw	a5,-52(s0)
    800008be:	40f007bb          	negw	a5,a5
    800008c2:	2781                	sext.w	a5,a5
    800008c4:	fef42423          	sw	a5,-24(s0)
    800008c8:	a029                	j	800008d2 <printint+0x56>
  else
    x = xx;
    800008ca:	fcc42783          	lw	a5,-52(s0)
    800008ce:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008d2:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    800008d6:	fc842783          	lw	a5,-56(s0)
    800008da:	fe842703          	lw	a4,-24(s0)
    800008de:	02f777bb          	remuw	a5,a4,a5
    800008e2:	0007861b          	sext.w	a2,a5
    800008e6:	fec42783          	lw	a5,-20(s0)
    800008ea:	0017871b          	addiw	a4,a5,1
    800008ee:	fee42623          	sw	a4,-20(s0)
    800008f2:	0000b697          	auipc	a3,0xb
    800008f6:	e6e68693          	addi	a3,a3,-402 # 8000b760 <digits>
    800008fa:	02061713          	slli	a4,a2,0x20
    800008fe:	9301                	srli	a4,a4,0x20
    80000900:	9736                	add	a4,a4,a3
    80000902:	00074703          	lbu	a4,0(a4)
    80000906:	ff040693          	addi	a3,s0,-16
    8000090a:	97b6                	add	a5,a5,a3
    8000090c:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    80000910:	fc842783          	lw	a5,-56(s0)
    80000914:	fe842703          	lw	a4,-24(s0)
    80000918:	02f757bb          	divuw	a5,a4,a5
    8000091c:	fef42423          	sw	a5,-24(s0)
    80000920:	fe842783          	lw	a5,-24(s0)
    80000924:	2781                	sext.w	a5,a5
    80000926:	fbc5                	bnez	a5,800008d6 <printint+0x5a>

  if(sign)
    80000928:	fc442783          	lw	a5,-60(s0)
    8000092c:	2781                	sext.w	a5,a5
    8000092e:	cf85                	beqz	a5,80000966 <printint+0xea>
    buf[i++] = '-';
    80000930:	fec42783          	lw	a5,-20(s0)
    80000934:	0017871b          	addiw	a4,a5,1
    80000938:	fee42623          	sw	a4,-20(s0)
    8000093c:	ff040713          	addi	a4,s0,-16
    80000940:	97ba                	add	a5,a5,a4
    80000942:	02d00713          	li	a4,45
    80000946:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    8000094a:	a831                	j	80000966 <printint+0xea>
    consputc(buf[i]);
    8000094c:	fec42783          	lw	a5,-20(s0)
    80000950:	ff040713          	addi	a4,s0,-16
    80000954:	97ba                	add	a5,a5,a4
    80000956:	fe87c783          	lbu	a5,-24(a5)
    8000095a:	2781                	sext.w	a5,a5
    8000095c:	853e                	mv	a0,a5
    8000095e:	00000097          	auipc	ra,0x0
    80000962:	9ca080e7          	jalr	-1590(ra) # 80000328 <consputc>
  while(--i >= 0)
    80000966:	fec42783          	lw	a5,-20(s0)
    8000096a:	37fd                	addiw	a5,a5,-1
    8000096c:	fef42623          	sw	a5,-20(s0)
    80000970:	fec42783          	lw	a5,-20(s0)
    80000974:	2781                	sext.w	a5,a5
    80000976:	fc07dbe3          	bgez	a5,8000094c <printint+0xd0>
}
    8000097a:	0001                	nop
    8000097c:	0001                	nop
    8000097e:	70e2                	ld	ra,56(sp)
    80000980:	7442                	ld	s0,48(sp)
    80000982:	6121                	addi	sp,sp,64
    80000984:	8082                	ret

0000000080000986 <printptr>:

static void
printptr(uint64 x)
{
    80000986:	7179                	addi	sp,sp,-48
    80000988:	f406                	sd	ra,40(sp)
    8000098a:	f022                	sd	s0,32(sp)
    8000098c:	1800                	addi	s0,sp,48
    8000098e:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    80000992:	03000513          	li	a0,48
    80000996:	00000097          	auipc	ra,0x0
    8000099a:	992080e7          	jalr	-1646(ra) # 80000328 <consputc>
  consputc('x');
    8000099e:	07800513          	li	a0,120
    800009a2:	00000097          	auipc	ra,0x0
    800009a6:	986080e7          	jalr	-1658(ra) # 80000328 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009aa:	fe042623          	sw	zero,-20(s0)
    800009ae:	a81d                	j	800009e4 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009b0:	fd843783          	ld	a5,-40(s0)
    800009b4:	93f1                	srli	a5,a5,0x3c
    800009b6:	0000b717          	auipc	a4,0xb
    800009ba:	daa70713          	addi	a4,a4,-598 # 8000b760 <digits>
    800009be:	97ba                	add	a5,a5,a4
    800009c0:	0007c783          	lbu	a5,0(a5)
    800009c4:	2781                	sext.w	a5,a5
    800009c6:	853e                	mv	a0,a5
    800009c8:	00000097          	auipc	ra,0x0
    800009cc:	960080e7          	jalr	-1696(ra) # 80000328 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d0:	fec42783          	lw	a5,-20(s0)
    800009d4:	2785                	addiw	a5,a5,1
    800009d6:	fef42623          	sw	a5,-20(s0)
    800009da:	fd843783          	ld	a5,-40(s0)
    800009de:	0792                	slli	a5,a5,0x4
    800009e0:	fcf43c23          	sd	a5,-40(s0)
    800009e4:	fec42783          	lw	a5,-20(s0)
    800009e8:	873e                	mv	a4,a5
    800009ea:	47bd                	li	a5,15
    800009ec:	fce7f2e3          	bgeu	a5,a4,800009b0 <printptr+0x2a>
}
    800009f0:	0001                	nop
    800009f2:	0001                	nop
    800009f4:	70a2                	ld	ra,40(sp)
    800009f6:	7402                	ld	s0,32(sp)
    800009f8:	6145                	addi	sp,sp,48
    800009fa:	8082                	ret

00000000800009fc <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    800009fc:	7119                	addi	sp,sp,-128
    800009fe:	fc06                	sd	ra,56(sp)
    80000a00:	f822                	sd	s0,48(sp)
    80000a02:	0080                	addi	s0,sp,64
    80000a04:	fca43423          	sd	a0,-56(s0)
    80000a08:	e40c                	sd	a1,8(s0)
    80000a0a:	e810                	sd	a2,16(s0)
    80000a0c:	ec14                	sd	a3,24(s0)
    80000a0e:	f018                	sd	a4,32(s0)
    80000a10:	f41c                	sd	a5,40(s0)
    80000a12:	03043823          	sd	a6,48(s0)
    80000a16:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a1a:	00013797          	auipc	a5,0x13
    80000a1e:	7fe78793          	addi	a5,a5,2046 # 80014218 <pr>
    80000a22:	4f9c                	lw	a5,24(a5)
    80000a24:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a28:	fdc42783          	lw	a5,-36(s0)
    80000a2c:	2781                	sext.w	a5,a5
    80000a2e:	cb89                	beqz	a5,80000a40 <printf+0x44>
    acquire(&pr.lock);
    80000a30:	00013517          	auipc	a0,0x13
    80000a34:	7e850513          	addi	a0,a0,2024 # 80014218 <pr>
    80000a38:	00001097          	auipc	ra,0x1
    80000a3c:	848080e7          	jalr	-1976(ra) # 80001280 <acquire>

  if (fmt == 0)
    80000a40:	fc843783          	ld	a5,-56(s0)
    80000a44:	eb89                	bnez	a5,80000a56 <printf+0x5a>
    panic("null fmt");
    80000a46:	0000a517          	auipc	a0,0xa
    80000a4a:	5c250513          	addi	a0,a0,1474 # 8000b008 <etext+0x8>
    80000a4e:	00000097          	auipc	ra,0x0
    80000a52:	204080e7          	jalr	516(ra) # 80000c52 <panic>

  va_start(ap, fmt);
    80000a56:	04040793          	addi	a5,s0,64
    80000a5a:	fcf43023          	sd	a5,-64(s0)
    80000a5e:	fc043783          	ld	a5,-64(s0)
    80000a62:	fc878793          	addi	a5,a5,-56
    80000a66:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a6a:	fe042623          	sw	zero,-20(s0)
    80000a6e:	a24d                	j	80000c10 <printf+0x214>
    if(c != '%'){
    80000a70:	fd842783          	lw	a5,-40(s0)
    80000a74:	0007871b          	sext.w	a4,a5
    80000a78:	02500793          	li	a5,37
    80000a7c:	00f70a63          	beq	a4,a5,80000a90 <printf+0x94>
      consputc(c);
    80000a80:	fd842783          	lw	a5,-40(s0)
    80000a84:	853e                	mv	a0,a5
    80000a86:	00000097          	auipc	ra,0x0
    80000a8a:	8a2080e7          	jalr	-1886(ra) # 80000328 <consputc>
      continue;
    80000a8e:	aaa5                	j	80000c06 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000a90:	fec42783          	lw	a5,-20(s0)
    80000a94:	2785                	addiw	a5,a5,1
    80000a96:	fef42623          	sw	a5,-20(s0)
    80000a9a:	fec42783          	lw	a5,-20(s0)
    80000a9e:	fc843703          	ld	a4,-56(s0)
    80000aa2:	97ba                	add	a5,a5,a4
    80000aa4:	0007c783          	lbu	a5,0(a5)
    80000aa8:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	2781                	sext.w	a5,a5
    80000ab2:	16078e63          	beqz	a5,80000c2e <printf+0x232>
      break;
    switch(c){
    80000ab6:	fd842783          	lw	a5,-40(s0)
    80000aba:	0007871b          	sext.w	a4,a5
    80000abe:	07800793          	li	a5,120
    80000ac2:	08f70963          	beq	a4,a5,80000b54 <printf+0x158>
    80000ac6:	fd842783          	lw	a5,-40(s0)
    80000aca:	0007871b          	sext.w	a4,a5
    80000ace:	07800793          	li	a5,120
    80000ad2:	10e7cc63          	blt	a5,a4,80000bea <printf+0x1ee>
    80000ad6:	fd842783          	lw	a5,-40(s0)
    80000ada:	0007871b          	sext.w	a4,a5
    80000ade:	07300793          	li	a5,115
    80000ae2:	0af70563          	beq	a4,a5,80000b8c <printf+0x190>
    80000ae6:	fd842783          	lw	a5,-40(s0)
    80000aea:	0007871b          	sext.w	a4,a5
    80000aee:	07300793          	li	a5,115
    80000af2:	0ee7cc63          	blt	a5,a4,80000bea <printf+0x1ee>
    80000af6:	fd842783          	lw	a5,-40(s0)
    80000afa:	0007871b          	sext.w	a4,a5
    80000afe:	07000793          	li	a5,112
    80000b02:	06f70863          	beq	a4,a5,80000b72 <printf+0x176>
    80000b06:	fd842783          	lw	a5,-40(s0)
    80000b0a:	0007871b          	sext.w	a4,a5
    80000b0e:	07000793          	li	a5,112
    80000b12:	0ce7cc63          	blt	a5,a4,80000bea <printf+0x1ee>
    80000b16:	fd842783          	lw	a5,-40(s0)
    80000b1a:	0007871b          	sext.w	a4,a5
    80000b1e:	02500793          	li	a5,37
    80000b22:	0af70d63          	beq	a4,a5,80000bdc <printf+0x1e0>
    80000b26:	fd842783          	lw	a5,-40(s0)
    80000b2a:	0007871b          	sext.w	a4,a5
    80000b2e:	06400793          	li	a5,100
    80000b32:	0af71c63          	bne	a4,a5,80000bea <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b36:	fd043783          	ld	a5,-48(s0)
    80000b3a:	00878713          	addi	a4,a5,8
    80000b3e:	fce43823          	sd	a4,-48(s0)
    80000b42:	439c                	lw	a5,0(a5)
    80000b44:	4605                	li	a2,1
    80000b46:	45a9                	li	a1,10
    80000b48:	853e                	mv	a0,a5
    80000b4a:	00000097          	auipc	ra,0x0
    80000b4e:	d32080e7          	jalr	-718(ra) # 8000087c <printint>
      break;
    80000b52:	a855                	j	80000c06 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b54:	fd043783          	ld	a5,-48(s0)
    80000b58:	00878713          	addi	a4,a5,8
    80000b5c:	fce43823          	sd	a4,-48(s0)
    80000b60:	439c                	lw	a5,0(a5)
    80000b62:	4605                	li	a2,1
    80000b64:	45c1                	li	a1,16
    80000b66:	853e                	mv	a0,a5
    80000b68:	00000097          	auipc	ra,0x0
    80000b6c:	d14080e7          	jalr	-748(ra) # 8000087c <printint>
      break;
    80000b70:	a859                	j	80000c06 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b72:	fd043783          	ld	a5,-48(s0)
    80000b76:	00878713          	addi	a4,a5,8
    80000b7a:	fce43823          	sd	a4,-48(s0)
    80000b7e:	639c                	ld	a5,0(a5)
    80000b80:	853e                	mv	a0,a5
    80000b82:	00000097          	auipc	ra,0x0
    80000b86:	e04080e7          	jalr	-508(ra) # 80000986 <printptr>
      break;
    80000b8a:	a8b5                	j	80000c06 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000b8c:	fd043783          	ld	a5,-48(s0)
    80000b90:	00878713          	addi	a4,a5,8
    80000b94:	fce43823          	sd	a4,-48(s0)
    80000b98:	639c                	ld	a5,0(a5)
    80000b9a:	fef43023          	sd	a5,-32(s0)
    80000b9e:	fe043783          	ld	a5,-32(s0)
    80000ba2:	e79d                	bnez	a5,80000bd0 <printf+0x1d4>
        s = "(null)";
    80000ba4:	0000a797          	auipc	a5,0xa
    80000ba8:	47478793          	addi	a5,a5,1140 # 8000b018 <etext+0x18>
    80000bac:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bb0:	a005                	j	80000bd0 <printf+0x1d4>
        consputc(*s);
    80000bb2:	fe043783          	ld	a5,-32(s0)
    80000bb6:	0007c783          	lbu	a5,0(a5)
    80000bba:	2781                	sext.w	a5,a5
    80000bbc:	853e                	mv	a0,a5
    80000bbe:	fffff097          	auipc	ra,0xfffff
    80000bc2:	76a080e7          	jalr	1898(ra) # 80000328 <consputc>
      for(; *s; s++)
    80000bc6:	fe043783          	ld	a5,-32(s0)
    80000bca:	0785                	addi	a5,a5,1
    80000bcc:	fef43023          	sd	a5,-32(s0)
    80000bd0:	fe043783          	ld	a5,-32(s0)
    80000bd4:	0007c783          	lbu	a5,0(a5)
    80000bd8:	ffe9                	bnez	a5,80000bb2 <printf+0x1b6>
      break;
    80000bda:	a035                	j	80000c06 <printf+0x20a>
    case '%':
      consputc('%');
    80000bdc:	02500513          	li	a0,37
    80000be0:	fffff097          	auipc	ra,0xfffff
    80000be4:	748080e7          	jalr	1864(ra) # 80000328 <consputc>
      break;
    80000be8:	a839                	j	80000c06 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000bea:	02500513          	li	a0,37
    80000bee:	fffff097          	auipc	ra,0xfffff
    80000bf2:	73a080e7          	jalr	1850(ra) # 80000328 <consputc>
      consputc(c);
    80000bf6:	fd842783          	lw	a5,-40(s0)
    80000bfa:	853e                	mv	a0,a5
    80000bfc:	fffff097          	auipc	ra,0xfffff
    80000c00:	72c080e7          	jalr	1836(ra) # 80000328 <consputc>
      break;
    80000c04:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c06:	fec42783          	lw	a5,-20(s0)
    80000c0a:	2785                	addiw	a5,a5,1
    80000c0c:	fef42623          	sw	a5,-20(s0)
    80000c10:	fec42783          	lw	a5,-20(s0)
    80000c14:	fc843703          	ld	a4,-56(s0)
    80000c18:	97ba                	add	a5,a5,a4
    80000c1a:	0007c783          	lbu	a5,0(a5)
    80000c1e:	fcf42c23          	sw	a5,-40(s0)
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	2781                	sext.w	a5,a5
    80000c28:	e40794e3          	bnez	a5,80000a70 <printf+0x74>
    80000c2c:	a011                	j	80000c30 <printf+0x234>
      break;
    80000c2e:	0001                	nop
    }
  }

  if(locking)
    80000c30:	fdc42783          	lw	a5,-36(s0)
    80000c34:	2781                	sext.w	a5,a5
    80000c36:	cb89                	beqz	a5,80000c48 <printf+0x24c>
    release(&pr.lock);
    80000c38:	00013517          	auipc	a0,0x13
    80000c3c:	5e050513          	addi	a0,a0,1504 # 80014218 <pr>
    80000c40:	00000097          	auipc	ra,0x0
    80000c44:	6a4080e7          	jalr	1700(ra) # 800012e4 <release>
}
    80000c48:	0001                	nop
    80000c4a:	70e2                	ld	ra,56(sp)
    80000c4c:	7442                	ld	s0,48(sp)
    80000c4e:	6109                	addi	sp,sp,128
    80000c50:	8082                	ret

0000000080000c52 <panic>:

void
panic(char *s)
{
    80000c52:	1101                	addi	sp,sp,-32
    80000c54:	ec06                	sd	ra,24(sp)
    80000c56:	e822                	sd	s0,16(sp)
    80000c58:	1000                	addi	s0,sp,32
    80000c5a:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c5e:	00013797          	auipc	a5,0x13
    80000c62:	5ba78793          	addi	a5,a5,1466 # 80014218 <pr>
    80000c66:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c6a:	0000a517          	auipc	a0,0xa
    80000c6e:	3b650513          	addi	a0,a0,950 # 8000b020 <etext+0x20>
    80000c72:	00000097          	auipc	ra,0x0
    80000c76:	d8a080e7          	jalr	-630(ra) # 800009fc <printf>
  printf(s);
    80000c7a:	fe843503          	ld	a0,-24(s0)
    80000c7e:	00000097          	auipc	ra,0x0
    80000c82:	d7e080e7          	jalr	-642(ra) # 800009fc <printf>
  printf("\n");
    80000c86:	0000a517          	auipc	a0,0xa
    80000c8a:	3a250513          	addi	a0,a0,930 # 8000b028 <etext+0x28>
    80000c8e:	00000097          	auipc	ra,0x0
    80000c92:	d6e080e7          	jalr	-658(ra) # 800009fc <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000c96:	0000b797          	auipc	a5,0xb
    80000c9a:	36a78793          	addi	a5,a5,874 # 8000c000 <panicked>
    80000c9e:	4705                	li	a4,1
    80000ca0:	c398                	sw	a4,0(a5)
  for(;;)
    80000ca2:	a001                	j	80000ca2 <panic+0x50>

0000000080000ca4 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000ca4:	1141                	addi	sp,sp,-16
    80000ca6:	e406                	sd	ra,8(sp)
    80000ca8:	e022                	sd	s0,0(sp)
    80000caa:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cac:	0000a597          	auipc	a1,0xa
    80000cb0:	38458593          	addi	a1,a1,900 # 8000b030 <etext+0x30>
    80000cb4:	00013517          	auipc	a0,0x13
    80000cb8:	56450513          	addi	a0,a0,1380 # 80014218 <pr>
    80000cbc:	00000097          	auipc	ra,0x0
    80000cc0:	594080e7          	jalr	1428(ra) # 80001250 <initlock>
  pr.locking = 1;
    80000cc4:	00013797          	auipc	a5,0x13
    80000cc8:	55478793          	addi	a5,a5,1364 # 80014218 <pr>
    80000ccc:	4705                	li	a4,1
    80000cce:	cf98                	sw	a4,24(a5)
}
    80000cd0:	0001                	nop
    80000cd2:	60a2                	ld	ra,8(sp)
    80000cd4:	6402                	ld	s0,0(sp)
    80000cd6:	0141                	addi	sp,sp,16
    80000cd8:	8082                	ret

0000000080000cda <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000cda:	1141                	addi	sp,sp,-16
    80000cdc:	e406                	sd	ra,8(sp)
    80000cde:	e022                	sd	s0,0(sp)
    80000ce0:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000ce2:	100007b7          	lui	a5,0x10000
    80000ce6:	0785                	addi	a5,a5,1
    80000ce8:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000cec:	100007b7          	lui	a5,0x10000
    80000cf0:	078d                	addi	a5,a5,3
    80000cf2:	f8000713          	li	a4,-128
    80000cf6:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000cfa:	100007b7          	lui	a5,0x10000
    80000cfe:	470d                	li	a4,3
    80000d00:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d04:	100007b7          	lui	a5,0x10000
    80000d08:	0785                	addi	a5,a5,1
    80000d0a:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	078d                	addi	a5,a5,3
    80000d14:	470d                	li	a4,3
    80000d16:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d1a:	100007b7          	lui	a5,0x10000
    80000d1e:	0789                	addi	a5,a5,2
    80000d20:	471d                	li	a4,7
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	0785                	addi	a5,a5,1
    80000d2c:	470d                	li	a4,3
    80000d2e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d32:	0000a597          	auipc	a1,0xa
    80000d36:	30658593          	addi	a1,a1,774 # 8000b038 <etext+0x38>
    80000d3a:	00013517          	auipc	a0,0x13
    80000d3e:	4fe50513          	addi	a0,a0,1278 # 80014238 <uart_tx_lock>
    80000d42:	00000097          	auipc	ra,0x0
    80000d46:	50e080e7          	jalr	1294(ra) # 80001250 <initlock>
}
    80000d4a:	0001                	nop
    80000d4c:	60a2                	ld	ra,8(sp)
    80000d4e:	6402                	ld	s0,0(sp)
    80000d50:	0141                	addi	sp,sp,16
    80000d52:	8082                	ret

0000000080000d54 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d54:	1101                	addi	sp,sp,-32
    80000d56:	ec06                	sd	ra,24(sp)
    80000d58:	e822                	sd	s0,16(sp)
    80000d5a:	1000                	addi	s0,sp,32
    80000d5c:	87aa                	mv	a5,a0
    80000d5e:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d62:	00013517          	auipc	a0,0x13
    80000d66:	4d650513          	addi	a0,a0,1238 # 80014238 <uart_tx_lock>
    80000d6a:	00000097          	auipc	ra,0x0
    80000d6e:	516080e7          	jalr	1302(ra) # 80001280 <acquire>

  if(panicked){
    80000d72:	0000b797          	auipc	a5,0xb
    80000d76:	28e78793          	addi	a5,a5,654 # 8000c000 <panicked>
    80000d7a:	439c                	lw	a5,0(a5)
    80000d7c:	2781                	sext.w	a5,a5
    80000d7e:	c391                	beqz	a5,80000d82 <uartputc+0x2e>
    for(;;)
    80000d80:	a001                	j	80000d80 <uartputc+0x2c>
      ;
  }

  while(1){
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80000d82:	0000b797          	auipc	a5,0xb
    80000d86:	28278793          	addi	a5,a5,642 # 8000c004 <uart_tx_w>
    80000d8a:	439c                	lw	a5,0(a5)
    80000d8c:	2785                	addiw	a5,a5,1
    80000d8e:	2781                	sext.w	a5,a5
    80000d90:	873e                	mv	a4,a5
    80000d92:	41f7579b          	sraiw	a5,a4,0x1f
    80000d96:	01b7d79b          	srliw	a5,a5,0x1b
    80000d9a:	9f3d                	addw	a4,a4,a5
    80000d9c:	8b7d                	andi	a4,a4,31
    80000d9e:	40f707bb          	subw	a5,a4,a5
    80000da2:	0007871b          	sext.w	a4,a5
    80000da6:	0000b797          	auipc	a5,0xb
    80000daa:	26278793          	addi	a5,a5,610 # 8000c008 <uart_tx_r>
    80000dae:	439c                	lw	a5,0(a5)
    80000db0:	00f71f63          	bne	a4,a5,80000dce <uartputc+0x7a>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000db4:	00013597          	auipc	a1,0x13
    80000db8:	48458593          	addi	a1,a1,1156 # 80014238 <uart_tx_lock>
    80000dbc:	0000b517          	auipc	a0,0xb
    80000dc0:	24c50513          	addi	a0,a0,588 # 8000c008 <uart_tx_r>
    80000dc4:	00002097          	auipc	ra,0x2
    80000dc8:	676080e7          	jalr	1654(ra) # 8000343a <sleep>
    80000dcc:	bf5d                	j	80000d82 <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w] = c;
    80000dce:	0000b797          	auipc	a5,0xb
    80000dd2:	23678793          	addi	a5,a5,566 # 8000c004 <uart_tx_w>
    80000dd6:	439c                	lw	a5,0(a5)
    80000dd8:	fec42703          	lw	a4,-20(s0)
    80000ddc:	0ff77713          	andi	a4,a4,255
    80000de0:	00013697          	auipc	a3,0x13
    80000de4:	47068693          	addi	a3,a3,1136 # 80014250 <uart_tx_buf>
    80000de8:	97b6                	add	a5,a5,a3
    80000dea:	00e78023          	sb	a4,0(a5)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    80000dee:	0000b797          	auipc	a5,0xb
    80000df2:	21678793          	addi	a5,a5,534 # 8000c004 <uart_tx_w>
    80000df6:	439c                	lw	a5,0(a5)
    80000df8:	2785                	addiw	a5,a5,1
    80000dfa:	2781                	sext.w	a5,a5
    80000dfc:	873e                	mv	a4,a5
    80000dfe:	41f7579b          	sraiw	a5,a4,0x1f
    80000e02:	01b7d79b          	srliw	a5,a5,0x1b
    80000e06:	9f3d                	addw	a4,a4,a5
    80000e08:	8b7d                	andi	a4,a4,31
    80000e0a:	40f707bb          	subw	a5,a4,a5
    80000e0e:	0007871b          	sext.w	a4,a5
    80000e12:	0000b797          	auipc	a5,0xb
    80000e16:	1f278793          	addi	a5,a5,498 # 8000c004 <uart_tx_w>
    80000e1a:	c398                	sw	a4,0(a5)
      uartstart();
    80000e1c:	00000097          	auipc	ra,0x0
    80000e20:	084080e7          	jalr	132(ra) # 80000ea0 <uartstart>
      release(&uart_tx_lock);
    80000e24:	00013517          	auipc	a0,0x13
    80000e28:	41450513          	addi	a0,a0,1044 # 80014238 <uart_tx_lock>
    80000e2c:	00000097          	auipc	ra,0x0
    80000e30:	4b8080e7          	jalr	1208(ra) # 800012e4 <release>
      return;
    80000e34:	0001                	nop
    }
  }
}
    80000e36:	60e2                	ld	ra,24(sp)
    80000e38:	6442                	ld	s0,16(sp)
    80000e3a:	6105                	addi	sp,sp,32
    80000e3c:	8082                	ret

0000000080000e3e <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e3e:	1101                	addi	sp,sp,-32
    80000e40:	ec06                	sd	ra,24(sp)
    80000e42:	e822                	sd	s0,16(sp)
    80000e44:	1000                	addi	s0,sp,32
    80000e46:	87aa                	mv	a5,a0
    80000e48:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4c:	00000097          	auipc	ra,0x0
    80000e50:	532080e7          	jalr	1330(ra) # 8000137e <push_off>

  if(panicked){
    80000e54:	0000b797          	auipc	a5,0xb
    80000e58:	1ac78793          	addi	a5,a5,428 # 8000c000 <panicked>
    80000e5c:	439c                	lw	a5,0(a5)
    80000e5e:	2781                	sext.w	a5,a5
    80000e60:	c391                	beqz	a5,80000e64 <uartputc_sync+0x26>
    for(;;)
    80000e62:	a001                	j	80000e62 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e64:	0001                	nop
    80000e66:	100007b7          	lui	a5,0x10000
    80000e6a:	0795                	addi	a5,a5,5
    80000e6c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e70:	0ff7f793          	andi	a5,a5,255
    80000e74:	2781                	sext.w	a5,a5
    80000e76:	0207f793          	andi	a5,a5,32
    80000e7a:	2781                	sext.w	a5,a5
    80000e7c:	d7ed                	beqz	a5,80000e66 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e7e:	100007b7          	lui	a5,0x10000
    80000e82:	fec42703          	lw	a4,-20(s0)
    80000e86:	0ff77713          	andi	a4,a4,255
    80000e8a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e8e:	00000097          	auipc	ra,0x0
    80000e92:	548080e7          	jalr	1352(ra) # 800013d6 <pop_off>
}
    80000e96:	0001                	nop
    80000e98:	60e2                	ld	ra,24(sp)
    80000e9a:	6442                	ld	s0,16(sp)
    80000e9c:	6105                	addi	sp,sp,32
    80000e9e:	8082                	ret

0000000080000ea0 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea0:	1101                	addi	sp,sp,-32
    80000ea2:	ec06                	sd	ra,24(sp)
    80000ea4:	e822                	sd	s0,16(sp)
    80000ea6:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000ea8:	0000b797          	auipc	a5,0xb
    80000eac:	15c78793          	addi	a5,a5,348 # 8000c004 <uart_tx_w>
    80000eb0:	4398                	lw	a4,0(a5)
    80000eb2:	0000b797          	auipc	a5,0xb
    80000eb6:	15678793          	addi	a5,a5,342 # 8000c008 <uart_tx_r>
    80000eba:	439c                	lw	a5,0(a5)
    80000ebc:	08f70463          	beq	a4,a5,80000f44 <uartstart+0xa4>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec0:	100007b7          	lui	a5,0x10000
    80000ec4:	0795                	addi	a5,a5,5
    80000ec6:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000eca:	0ff7f793          	andi	a5,a5,255
    80000ece:	2781                	sext.w	a5,a5
    80000ed0:	0207f793          	andi	a5,a5,32
    80000ed4:	2781                	sext.w	a5,a5
    80000ed6:	cbad                	beqz	a5,80000f48 <uartstart+0xa8>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    80000ed8:	0000b797          	auipc	a5,0xb
    80000edc:	13078793          	addi	a5,a5,304 # 8000c008 <uart_tx_r>
    80000ee0:	439c                	lw	a5,0(a5)
    80000ee2:	00013717          	auipc	a4,0x13
    80000ee6:	36e70713          	addi	a4,a4,878 # 80014250 <uart_tx_buf>
    80000eea:	97ba                	add	a5,a5,a4
    80000eec:	0007c783          	lbu	a5,0(a5)
    80000ef0:	fef42623          	sw	a5,-20(s0)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    80000ef4:	0000b797          	auipc	a5,0xb
    80000ef8:	11478793          	addi	a5,a5,276 # 8000c008 <uart_tx_r>
    80000efc:	439c                	lw	a5,0(a5)
    80000efe:	2785                	addiw	a5,a5,1
    80000f00:	2781                	sext.w	a5,a5
    80000f02:	873e                	mv	a4,a5
    80000f04:	41f7579b          	sraiw	a5,a4,0x1f
    80000f08:	01b7d79b          	srliw	a5,a5,0x1b
    80000f0c:	9f3d                	addw	a4,a4,a5
    80000f0e:	8b7d                	andi	a4,a4,31
    80000f10:	40f707bb          	subw	a5,a4,a5
    80000f14:	0007871b          	sext.w	a4,a5
    80000f18:	0000b797          	auipc	a5,0xb
    80000f1c:	0f078793          	addi	a5,a5,240 # 8000c008 <uart_tx_r>
    80000f20:	c398                	sw	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f22:	0000b517          	auipc	a0,0xb
    80000f26:	0e650513          	addi	a0,a0,230 # 8000c008 <uart_tx_r>
    80000f2a:	00002097          	auipc	ra,0x2
    80000f2e:	5a4080e7          	jalr	1444(ra) # 800034ce <wakeup>
    
    WriteReg(THR, c);
    80000f32:	100007b7          	lui	a5,0x10000
    80000f36:	fec42703          	lw	a4,-20(s0)
    80000f3a:	0ff77713          	andi	a4,a4,255
    80000f3e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f42:	b79d                	j	80000ea8 <uartstart+0x8>
      return;
    80000f44:	0001                	nop
    80000f46:	a011                	j	80000f4a <uartstart+0xaa>
      return;
    80000f48:	0001                	nop
  }
}
    80000f4a:	60e2                	ld	ra,24(sp)
    80000f4c:	6442                	ld	s0,16(sp)
    80000f4e:	6105                	addi	sp,sp,32
    80000f50:	8082                	ret

0000000080000f52 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f52:	1141                	addi	sp,sp,-16
    80000f54:	e422                	sd	s0,8(sp)
    80000f56:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f58:	100007b7          	lui	a5,0x10000
    80000f5c:	0795                	addi	a5,a5,5
    80000f5e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f62:	0ff7f793          	andi	a5,a5,255
    80000f66:	2781                	sext.w	a5,a5
    80000f68:	8b85                	andi	a5,a5,1
    80000f6a:	2781                	sext.w	a5,a5
    80000f6c:	cb89                	beqz	a5,80000f7e <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f6e:	100007b7          	lui	a5,0x10000
    80000f72:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f76:	0ff7f793          	andi	a5,a5,255
    80000f7a:	2781                	sext.w	a5,a5
    80000f7c:	a011                	j	80000f80 <uartgetc+0x2e>
  } else {
    return -1;
    80000f7e:	57fd                	li	a5,-1
  }
}
    80000f80:	853e                	mv	a0,a5
    80000f82:	6422                	ld	s0,8(sp)
    80000f84:	0141                	addi	sp,sp,16
    80000f86:	8082                	ret

0000000080000f88 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f88:	1101                	addi	sp,sp,-32
    80000f8a:	ec06                	sd	ra,24(sp)
    80000f8c:	e822                	sd	s0,16(sp)
    80000f8e:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f90:	00000097          	auipc	ra,0x0
    80000f94:	fc2080e7          	jalr	-62(ra) # 80000f52 <uartgetc>
    80000f98:	87aa                	mv	a5,a0
    80000f9a:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f9e:	fec42783          	lw	a5,-20(s0)
    80000fa2:	0007871b          	sext.w	a4,a5
    80000fa6:	57fd                	li	a5,-1
    80000fa8:	00f70a63          	beq	a4,a5,80000fbc <uartintr+0x34>
      break;
    consoleintr(c);
    80000fac:	fec42783          	lw	a5,-20(s0)
    80000fb0:	853e                	mv	a0,a5
    80000fb2:	fffff097          	auipc	ra,0xfffff
    80000fb6:	60c080e7          	jalr	1548(ra) # 800005be <consoleintr>
  while(1){
    80000fba:	bfd9                	j	80000f90 <uartintr+0x8>
      break;
    80000fbc:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fbe:	00013517          	auipc	a0,0x13
    80000fc2:	27a50513          	addi	a0,a0,634 # 80014238 <uart_tx_lock>
    80000fc6:	00000097          	auipc	ra,0x0
    80000fca:	2ba080e7          	jalr	698(ra) # 80001280 <acquire>
  uartstart();
    80000fce:	00000097          	auipc	ra,0x0
    80000fd2:	ed2080e7          	jalr	-302(ra) # 80000ea0 <uartstart>
  release(&uart_tx_lock);
    80000fd6:	00013517          	auipc	a0,0x13
    80000fda:	26250513          	addi	a0,a0,610 # 80014238 <uart_tx_lock>
    80000fde:	00000097          	auipc	ra,0x0
    80000fe2:	306080e7          	jalr	774(ra) # 800012e4 <release>
}
    80000fe6:	0001                	nop
    80000fe8:	60e2                	ld	ra,24(sp)
    80000fea:	6442                	ld	s0,16(sp)
    80000fec:	6105                	addi	sp,sp,32
    80000fee:	8082                	ret

0000000080000ff0 <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000ff0:	1141                	addi	sp,sp,-16
    80000ff2:	e406                	sd	ra,8(sp)
    80000ff4:	e022                	sd	s0,0(sp)
    80000ff6:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000ff8:	0000a597          	auipc	a1,0xa
    80000ffc:	04858593          	addi	a1,a1,72 # 8000b040 <etext+0x40>
    80001000:	00013517          	auipc	a0,0x13
    80001004:	27050513          	addi	a0,a0,624 # 80014270 <kmem>
    80001008:	00000097          	auipc	ra,0x0
    8000100c:	248080e7          	jalr	584(ra) # 80001250 <initlock>
  freerange(end, (void*)PHYSTOP);
    80001010:	47c5                	li	a5,17
    80001012:	01b79593          	slli	a1,a5,0x1b
    80001016:	00071517          	auipc	a0,0x71
    8000101a:	fea50513          	addi	a0,a0,-22 # 80072000 <end>
    8000101e:	00000097          	auipc	ra,0x0
    80001022:	012080e7          	jalr	18(ra) # 80001030 <freerange>
}
    80001026:	0001                	nop
    80001028:	60a2                	ld	ra,8(sp)
    8000102a:	6402                	ld	s0,0(sp)
    8000102c:	0141                	addi	sp,sp,16
    8000102e:	8082                	ret

0000000080001030 <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    80001030:	7179                	addi	sp,sp,-48
    80001032:	f406                	sd	ra,40(sp)
    80001034:	f022                	sd	s0,32(sp)
    80001036:	1800                	addi	s0,sp,48
    80001038:	fca43c23          	sd	a0,-40(s0)
    8000103c:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    80001040:	fd843703          	ld	a4,-40(s0)
    80001044:	6785                	lui	a5,0x1
    80001046:	17fd                	addi	a5,a5,-1
    80001048:	973e                	add	a4,a4,a5
    8000104a:	77fd                	lui	a5,0xfffff
    8000104c:	8ff9                	and	a5,a5,a4
    8000104e:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001052:	a829                	j	8000106c <freerange+0x3c>
    kfree(p);
    80001054:	fe843503          	ld	a0,-24(s0)
    80001058:	00000097          	auipc	ra,0x0
    8000105c:	030080e7          	jalr	48(ra) # 80001088 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001060:	fe843703          	ld	a4,-24(s0)
    80001064:	6785                	lui	a5,0x1
    80001066:	97ba                	add	a5,a5,a4
    80001068:	fef43423          	sd	a5,-24(s0)
    8000106c:	fe843703          	ld	a4,-24(s0)
    80001070:	6785                	lui	a5,0x1
    80001072:	97ba                	add	a5,a5,a4
    80001074:	fd043703          	ld	a4,-48(s0)
    80001078:	fcf77ee3          	bgeu	a4,a5,80001054 <freerange+0x24>
}
    8000107c:	0001                	nop
    8000107e:	0001                	nop
    80001080:	70a2                	ld	ra,40(sp)
    80001082:	7402                	ld	s0,32(sp)
    80001084:	6145                	addi	sp,sp,48
    80001086:	8082                	ret

0000000080001088 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001088:	7179                	addi	sp,sp,-48
    8000108a:	f406                	sd	ra,40(sp)
    8000108c:	f022                	sd	s0,32(sp)
    8000108e:	1800                	addi	s0,sp,48
    80001090:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001094:	fd843703          	ld	a4,-40(s0)
    80001098:	6785                	lui	a5,0x1
    8000109a:	17fd                	addi	a5,a5,-1
    8000109c:	8ff9                	and	a5,a5,a4
    8000109e:	ef99                	bnez	a5,800010bc <kfree+0x34>
    800010a0:	fd843703          	ld	a4,-40(s0)
    800010a4:	00071797          	auipc	a5,0x71
    800010a8:	f5c78793          	addi	a5,a5,-164 # 80072000 <end>
    800010ac:	00f76863          	bltu	a4,a5,800010bc <kfree+0x34>
    800010b0:	fd843703          	ld	a4,-40(s0)
    800010b4:	47c5                	li	a5,17
    800010b6:	07ee                	slli	a5,a5,0x1b
    800010b8:	00f76a63          	bltu	a4,a5,800010cc <kfree+0x44>
    panic("kfree");
    800010bc:	0000a517          	auipc	a0,0xa
    800010c0:	f8c50513          	addi	a0,a0,-116 # 8000b048 <etext+0x48>
    800010c4:	00000097          	auipc	ra,0x0
    800010c8:	b8e080e7          	jalr	-1138(ra) # 80000c52 <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010cc:	6605                	lui	a2,0x1
    800010ce:	4585                	li	a1,1
    800010d0:	fd843503          	ld	a0,-40(s0)
    800010d4:	00000097          	auipc	ra,0x0
    800010d8:	380080e7          	jalr	896(ra) # 80001454 <memset>

  r = (struct run*)pa;
    800010dc:	fd843783          	ld	a5,-40(s0)
    800010e0:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010e4:	00013517          	auipc	a0,0x13
    800010e8:	18c50513          	addi	a0,a0,396 # 80014270 <kmem>
    800010ec:	00000097          	auipc	ra,0x0
    800010f0:	194080e7          	jalr	404(ra) # 80001280 <acquire>
  r->next = kmem.freelist;
    800010f4:	00013797          	auipc	a5,0x13
    800010f8:	17c78793          	addi	a5,a5,380 # 80014270 <kmem>
    800010fc:	6f98                	ld	a4,24(a5)
    800010fe:	fe843783          	ld	a5,-24(s0)
    80001102:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    80001104:	00013797          	auipc	a5,0x13
    80001108:	16c78793          	addi	a5,a5,364 # 80014270 <kmem>
    8000110c:	fe843703          	ld	a4,-24(s0)
    80001110:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001112:	00013517          	auipc	a0,0x13
    80001116:	15e50513          	addi	a0,a0,350 # 80014270 <kmem>
    8000111a:	00000097          	auipc	ra,0x0
    8000111e:	1ca080e7          	jalr	458(ra) # 800012e4 <release>
}
    80001122:	0001                	nop
    80001124:	70a2                	ld	ra,40(sp)
    80001126:	7402                	ld	s0,32(sp)
    80001128:	6145                	addi	sp,sp,48
    8000112a:	8082                	ret

000000008000112c <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000112c:	1101                	addi	sp,sp,-32
    8000112e:	ec06                	sd	ra,24(sp)
    80001130:	e822                	sd	s0,16(sp)
    80001132:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001134:	00013517          	auipc	a0,0x13
    80001138:	13c50513          	addi	a0,a0,316 # 80014270 <kmem>
    8000113c:	00000097          	auipc	ra,0x0
    80001140:	144080e7          	jalr	324(ra) # 80001280 <acquire>
  r = kmem.freelist;
    80001144:	00013797          	auipc	a5,0x13
    80001148:	12c78793          	addi	a5,a5,300 # 80014270 <kmem>
    8000114c:	6f9c                	ld	a5,24(a5)
    8000114e:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001152:	fe843783          	ld	a5,-24(s0)
    80001156:	cb89                	beqz	a5,80001168 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001158:	fe843783          	ld	a5,-24(s0)
    8000115c:	6398                	ld	a4,0(a5)
    8000115e:	00013797          	auipc	a5,0x13
    80001162:	11278793          	addi	a5,a5,274 # 80014270 <kmem>
    80001166:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001168:	00013517          	auipc	a0,0x13
    8000116c:	10850513          	addi	a0,a0,264 # 80014270 <kmem>
    80001170:	00000097          	auipc	ra,0x0
    80001174:	174080e7          	jalr	372(ra) # 800012e4 <release>

  if(r)
    80001178:	fe843783          	ld	a5,-24(s0)
    8000117c:	cb89                	beqz	a5,8000118e <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000117e:	6605                	lui	a2,0x1
    80001180:	4595                	li	a1,5
    80001182:	fe843503          	ld	a0,-24(s0)
    80001186:	00000097          	auipc	ra,0x0
    8000118a:	2ce080e7          	jalr	718(ra) # 80001454 <memset>
  return (void*)r;
    8000118e:	fe843783          	ld	a5,-24(s0)
}
    80001192:	853e                	mv	a0,a5
    80001194:	60e2                	ld	ra,24(sp)
    80001196:	6442                	ld	s0,16(sp)
    80001198:	6105                	addi	sp,sp,32
    8000119a:	8082                	ret

000000008000119c <r_sstatus>:
{
    8000119c:	1101                	addi	sp,sp,-32
    8000119e:	ec22                	sd	s0,24(sp)
    800011a0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800011a2:	100027f3          	csrr	a5,sstatus
    800011a6:	fef43423          	sd	a5,-24(s0)
  return x;
    800011aa:	fe843783          	ld	a5,-24(s0)
}
    800011ae:	853e                	mv	a0,a5
    800011b0:	6462                	ld	s0,24(sp)
    800011b2:	6105                	addi	sp,sp,32
    800011b4:	8082                	ret

00000000800011b6 <w_sstatus>:
{
    800011b6:	1101                	addi	sp,sp,-32
    800011b8:	ec22                	sd	s0,24(sp)
    800011ba:	1000                	addi	s0,sp,32
    800011bc:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011c0:	fe843783          	ld	a5,-24(s0)
    800011c4:	10079073          	csrw	sstatus,a5
}
    800011c8:	0001                	nop
    800011ca:	6462                	ld	s0,24(sp)
    800011cc:	6105                	addi	sp,sp,32
    800011ce:	8082                	ret

00000000800011d0 <intr_on>:
{
    800011d0:	1141                	addi	sp,sp,-16
    800011d2:	e406                	sd	ra,8(sp)
    800011d4:	e022                	sd	s0,0(sp)
    800011d6:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011d8:	00000097          	auipc	ra,0x0
    800011dc:	fc4080e7          	jalr	-60(ra) # 8000119c <r_sstatus>
    800011e0:	87aa                	mv	a5,a0
    800011e2:	0027e793          	ori	a5,a5,2
    800011e6:	853e                	mv	a0,a5
    800011e8:	00000097          	auipc	ra,0x0
    800011ec:	fce080e7          	jalr	-50(ra) # 800011b6 <w_sstatus>
}
    800011f0:	0001                	nop
    800011f2:	60a2                	ld	ra,8(sp)
    800011f4:	6402                	ld	s0,0(sp)
    800011f6:	0141                	addi	sp,sp,16
    800011f8:	8082                	ret

00000000800011fa <intr_off>:
{
    800011fa:	1141                	addi	sp,sp,-16
    800011fc:	e406                	sd	ra,8(sp)
    800011fe:	e022                	sd	s0,0(sp)
    80001200:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80001202:	00000097          	auipc	ra,0x0
    80001206:	f9a080e7          	jalr	-102(ra) # 8000119c <r_sstatus>
    8000120a:	87aa                	mv	a5,a0
    8000120c:	9bf5                	andi	a5,a5,-3
    8000120e:	853e                	mv	a0,a5
    80001210:	00000097          	auipc	ra,0x0
    80001214:	fa6080e7          	jalr	-90(ra) # 800011b6 <w_sstatus>
}
    80001218:	0001                	nop
    8000121a:	60a2                	ld	ra,8(sp)
    8000121c:	6402                	ld	s0,0(sp)
    8000121e:	0141                	addi	sp,sp,16
    80001220:	8082                	ret

0000000080001222 <intr_get>:
{
    80001222:	1101                	addi	sp,sp,-32
    80001224:	ec06                	sd	ra,24(sp)
    80001226:	e822                	sd	s0,16(sp)
    80001228:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    8000122a:	00000097          	auipc	ra,0x0
    8000122e:	f72080e7          	jalr	-142(ra) # 8000119c <r_sstatus>
    80001232:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001236:	fe843783          	ld	a5,-24(s0)
    8000123a:	8b89                	andi	a5,a5,2
    8000123c:	00f037b3          	snez	a5,a5
    80001240:	0ff7f793          	andi	a5,a5,255
    80001244:	2781                	sext.w	a5,a5
}
    80001246:	853e                	mv	a0,a5
    80001248:	60e2                	ld	ra,24(sp)
    8000124a:	6442                	ld	s0,16(sp)
    8000124c:	6105                	addi	sp,sp,32
    8000124e:	8082                	ret

0000000080001250 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80001250:	1101                	addi	sp,sp,-32
    80001252:	ec22                	sd	s0,24(sp)
    80001254:	1000                	addi	s0,sp,32
    80001256:	fea43423          	sd	a0,-24(s0)
    8000125a:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	fe043703          	ld	a4,-32(s0)
    80001266:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001268:	fe843783          	ld	a5,-24(s0)
    8000126c:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    80001270:	fe843783          	ld	a5,-24(s0)
    80001274:	0007b823          	sd	zero,16(a5)
}
    80001278:	0001                	nop
    8000127a:	6462                	ld	s0,24(sp)
    8000127c:	6105                	addi	sp,sp,32
    8000127e:	8082                	ret

0000000080001280 <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    80001280:	1101                	addi	sp,sp,-32
    80001282:	ec06                	sd	ra,24(sp)
    80001284:	e822                	sd	s0,16(sp)
    80001286:	1000                	addi	s0,sp,32
    80001288:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000128c:	00000097          	auipc	ra,0x0
    80001290:	0f2080e7          	jalr	242(ra) # 8000137e <push_off>
  if(holding(lk))
    80001294:	fe843503          	ld	a0,-24(s0)
    80001298:	00000097          	auipc	ra,0x0
    8000129c:	0a2080e7          	jalr	162(ra) # 8000133a <holding>
    800012a0:	87aa                	mv	a5,a0
    800012a2:	cb89                	beqz	a5,800012b4 <acquire+0x34>
    panic("acquire");
    800012a4:	0000a517          	auipc	a0,0xa
    800012a8:	dac50513          	addi	a0,a0,-596 # 8000b050 <etext+0x50>
    800012ac:	00000097          	auipc	ra,0x0
    800012b0:	9a6080e7          	jalr	-1626(ra) # 80000c52 <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012b4:	0001                	nop
    800012b6:	fe843783          	ld	a5,-24(s0)
    800012ba:	4705                	li	a4,1
    800012bc:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012c0:	0007079b          	sext.w	a5,a4
    800012c4:	fbed                	bnez	a5,800012b6 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012c6:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012ca:	00001097          	auipc	ra,0x1
    800012ce:	4ee080e7          	jalr	1262(ra) # 800027b8 <mycpu>
    800012d2:	872a                	mv	a4,a0
    800012d4:	fe843783          	ld	a5,-24(s0)
    800012d8:	eb98                	sd	a4,16(a5)
}
    800012da:	0001                	nop
    800012dc:	60e2                	ld	ra,24(sp)
    800012de:	6442                	ld	s0,16(sp)
    800012e0:	6105                	addi	sp,sp,32
    800012e2:	8082                	ret

00000000800012e4 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012e4:	1101                	addi	sp,sp,-32
    800012e6:	ec06                	sd	ra,24(sp)
    800012e8:	e822                	sd	s0,16(sp)
    800012ea:	1000                	addi	s0,sp,32
    800012ec:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012f0:	fe843503          	ld	a0,-24(s0)
    800012f4:	00000097          	auipc	ra,0x0
    800012f8:	046080e7          	jalr	70(ra) # 8000133a <holding>
    800012fc:	87aa                	mv	a5,a0
    800012fe:	eb89                	bnez	a5,80001310 <release+0x2c>
    panic("release");
    80001300:	0000a517          	auipc	a0,0xa
    80001304:	d5850513          	addi	a0,a0,-680 # 8000b058 <etext+0x58>
    80001308:	00000097          	auipc	ra,0x0
    8000130c:	94a080e7          	jalr	-1718(ra) # 80000c52 <panic>

  lk->cpu = 0;
    80001310:	fe843783          	ld	a5,-24(s0)
    80001314:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001318:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000131c:	fe843783          	ld	a5,-24(s0)
    80001320:	0f50000f          	fence	iorw,ow
    80001324:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001328:	00000097          	auipc	ra,0x0
    8000132c:	0ae080e7          	jalr	174(ra) # 800013d6 <pop_off>
}
    80001330:	0001                	nop
    80001332:	60e2                	ld	ra,24(sp)
    80001334:	6442                	ld	s0,16(sp)
    80001336:	6105                	addi	sp,sp,32
    80001338:	8082                	ret

000000008000133a <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    8000133a:	7139                	addi	sp,sp,-64
    8000133c:	fc06                	sd	ra,56(sp)
    8000133e:	f822                	sd	s0,48(sp)
    80001340:	f426                	sd	s1,40(sp)
    80001342:	0080                	addi	s0,sp,64
    80001344:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001348:	fc843783          	ld	a5,-56(s0)
    8000134c:	439c                	lw	a5,0(a5)
    8000134e:	cf89                	beqz	a5,80001368 <holding+0x2e>
    80001350:	fc843783          	ld	a5,-56(s0)
    80001354:	6b84                	ld	s1,16(a5)
    80001356:	00001097          	auipc	ra,0x1
    8000135a:	462080e7          	jalr	1122(ra) # 800027b8 <mycpu>
    8000135e:	87aa                	mv	a5,a0
    80001360:	00f49463          	bne	s1,a5,80001368 <holding+0x2e>
    80001364:	4785                	li	a5,1
    80001366:	a011                	j	8000136a <holding+0x30>
    80001368:	4781                	li	a5,0
    8000136a:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000136e:	fdc42783          	lw	a5,-36(s0)
}
    80001372:	853e                	mv	a0,a5
    80001374:	70e2                	ld	ra,56(sp)
    80001376:	7442                	ld	s0,48(sp)
    80001378:	74a2                	ld	s1,40(sp)
    8000137a:	6121                	addi	sp,sp,64
    8000137c:	8082                	ret

000000008000137e <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000137e:	1101                	addi	sp,sp,-32
    80001380:	ec06                	sd	ra,24(sp)
    80001382:	e822                	sd	s0,16(sp)
    80001384:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001386:	00000097          	auipc	ra,0x0
    8000138a:	e9c080e7          	jalr	-356(ra) # 80001222 <intr_get>
    8000138e:	87aa                	mv	a5,a0
    80001390:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001394:	00000097          	auipc	ra,0x0
    80001398:	e66080e7          	jalr	-410(ra) # 800011fa <intr_off>
  if(mycpu()->noff == 0)
    8000139c:	00001097          	auipc	ra,0x1
    800013a0:	41c080e7          	jalr	1052(ra) # 800027b8 <mycpu>
    800013a4:	87aa                	mv	a5,a0
    800013a6:	5fbc                	lw	a5,120(a5)
    800013a8:	eb89                	bnez	a5,800013ba <push_off+0x3c>
    mycpu()->intena = old;
    800013aa:	00001097          	auipc	ra,0x1
    800013ae:	40e080e7          	jalr	1038(ra) # 800027b8 <mycpu>
    800013b2:	872a                	mv	a4,a0
    800013b4:	fec42783          	lw	a5,-20(s0)
    800013b8:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013ba:	00001097          	auipc	ra,0x1
    800013be:	3fe080e7          	jalr	1022(ra) # 800027b8 <mycpu>
    800013c2:	87aa                	mv	a5,a0
    800013c4:	5fb8                	lw	a4,120(a5)
    800013c6:	2705                	addiw	a4,a4,1
    800013c8:	2701                	sext.w	a4,a4
    800013ca:	dfb8                	sw	a4,120(a5)
}
    800013cc:	0001                	nop
    800013ce:	60e2                	ld	ra,24(sp)
    800013d0:	6442                	ld	s0,16(sp)
    800013d2:	6105                	addi	sp,sp,32
    800013d4:	8082                	ret

00000000800013d6 <pop_off>:

void
pop_off(void)
{
    800013d6:	1101                	addi	sp,sp,-32
    800013d8:	ec06                	sd	ra,24(sp)
    800013da:	e822                	sd	s0,16(sp)
    800013dc:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013de:	00001097          	auipc	ra,0x1
    800013e2:	3da080e7          	jalr	986(ra) # 800027b8 <mycpu>
    800013e6:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013ea:	00000097          	auipc	ra,0x0
    800013ee:	e38080e7          	jalr	-456(ra) # 80001222 <intr_get>
    800013f2:	87aa                	mv	a5,a0
    800013f4:	cb89                	beqz	a5,80001406 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013f6:	0000a517          	auipc	a0,0xa
    800013fa:	c6a50513          	addi	a0,a0,-918 # 8000b060 <etext+0x60>
    800013fe:	00000097          	auipc	ra,0x0
    80001402:	854080e7          	jalr	-1964(ra) # 80000c52 <panic>
  if(c->noff < 1)
    80001406:	fe843783          	ld	a5,-24(s0)
    8000140a:	5fbc                	lw	a5,120(a5)
    8000140c:	00f04a63          	bgtz	a5,80001420 <pop_off+0x4a>
    panic("pop_off");
    80001410:	0000a517          	auipc	a0,0xa
    80001414:	c6850513          	addi	a0,a0,-920 # 8000b078 <etext+0x78>
    80001418:	00000097          	auipc	ra,0x0
    8000141c:	83a080e7          	jalr	-1990(ra) # 80000c52 <panic>
  c->noff -= 1;
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	37fd                	addiw	a5,a5,-1
    80001428:	0007871b          	sext.w	a4,a5
    8000142c:	fe843783          	ld	a5,-24(s0)
    80001430:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001432:	fe843783          	ld	a5,-24(s0)
    80001436:	5fbc                	lw	a5,120(a5)
    80001438:	eb89                	bnez	a5,8000144a <pop_off+0x74>
    8000143a:	fe843783          	ld	a5,-24(s0)
    8000143e:	5ffc                	lw	a5,124(a5)
    80001440:	c789                	beqz	a5,8000144a <pop_off+0x74>
    intr_on();
    80001442:	00000097          	auipc	ra,0x0
    80001446:	d8e080e7          	jalr	-626(ra) # 800011d0 <intr_on>
}
    8000144a:	0001                	nop
    8000144c:	60e2                	ld	ra,24(sp)
    8000144e:	6442                	ld	s0,16(sp)
    80001450:	6105                	addi	sp,sp,32
    80001452:	8082                	ret

0000000080001454 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001454:	7179                	addi	sp,sp,-48
    80001456:	f422                	sd	s0,40(sp)
    80001458:	1800                	addi	s0,sp,48
    8000145a:	fca43c23          	sd	a0,-40(s0)
    8000145e:	87ae                	mv	a5,a1
    80001460:	8732                	mv	a4,a2
    80001462:	fcf42a23          	sw	a5,-44(s0)
    80001466:	87ba                	mv	a5,a4
    80001468:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000146c:	fd843783          	ld	a5,-40(s0)
    80001470:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001474:	fe042623          	sw	zero,-20(s0)
    80001478:	a00d                	j	8000149a <memset+0x46>
    cdst[i] = c;
    8000147a:	fec42783          	lw	a5,-20(s0)
    8000147e:	fe043703          	ld	a4,-32(s0)
    80001482:	97ba                	add	a5,a5,a4
    80001484:	fd442703          	lw	a4,-44(s0)
    80001488:	0ff77713          	andi	a4,a4,255
    8000148c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    80001490:	fec42783          	lw	a5,-20(s0)
    80001494:	2785                	addiw	a5,a5,1
    80001496:	fef42623          	sw	a5,-20(s0)
    8000149a:	fec42703          	lw	a4,-20(s0)
    8000149e:	fd042783          	lw	a5,-48(s0)
    800014a2:	2781                	sext.w	a5,a5
    800014a4:	fcf76be3          	bltu	a4,a5,8000147a <memset+0x26>
  }
  return dst;
    800014a8:	fd843783          	ld	a5,-40(s0)
}
    800014ac:	853e                	mv	a0,a5
    800014ae:	7422                	ld	s0,40(sp)
    800014b0:	6145                	addi	sp,sp,48
    800014b2:	8082                	ret

00000000800014b4 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014b4:	7139                	addi	sp,sp,-64
    800014b6:	fc22                	sd	s0,56(sp)
    800014b8:	0080                	addi	s0,sp,64
    800014ba:	fca43c23          	sd	a0,-40(s0)
    800014be:	fcb43823          	sd	a1,-48(s0)
    800014c2:	87b2                	mv	a5,a2
    800014c4:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014c8:	fd843783          	ld	a5,-40(s0)
    800014cc:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014d0:	fd043783          	ld	a5,-48(s0)
    800014d4:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014d8:	a0a1                	j	80001520 <memcmp+0x6c>
    if(*s1 != *s2)
    800014da:	fe843783          	ld	a5,-24(s0)
    800014de:	0007c703          	lbu	a4,0(a5)
    800014e2:	fe043783          	ld	a5,-32(s0)
    800014e6:	0007c783          	lbu	a5,0(a5)
    800014ea:	02f70163          	beq	a4,a5,8000150c <memcmp+0x58>
      return *s1 - *s2;
    800014ee:	fe843783          	ld	a5,-24(s0)
    800014f2:	0007c783          	lbu	a5,0(a5)
    800014f6:	0007871b          	sext.w	a4,a5
    800014fa:	fe043783          	ld	a5,-32(s0)
    800014fe:	0007c783          	lbu	a5,0(a5)
    80001502:	2781                	sext.w	a5,a5
    80001504:	40f707bb          	subw	a5,a4,a5
    80001508:	2781                	sext.w	a5,a5
    8000150a:	a01d                	j	80001530 <memcmp+0x7c>
    s1++, s2++;
    8000150c:	fe843783          	ld	a5,-24(s0)
    80001510:	0785                	addi	a5,a5,1
    80001512:	fef43423          	sd	a5,-24(s0)
    80001516:	fe043783          	ld	a5,-32(s0)
    8000151a:	0785                	addi	a5,a5,1
    8000151c:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001520:	fcc42783          	lw	a5,-52(s0)
    80001524:	fff7871b          	addiw	a4,a5,-1
    80001528:	fce42623          	sw	a4,-52(s0)
    8000152c:	f7dd                	bnez	a5,800014da <memcmp+0x26>
  }

  return 0;
    8000152e:	4781                	li	a5,0
}
    80001530:	853e                	mv	a0,a5
    80001532:	7462                	ld	s0,56(sp)
    80001534:	6121                	addi	sp,sp,64
    80001536:	8082                	ret

0000000080001538 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001538:	7139                	addi	sp,sp,-64
    8000153a:	fc22                	sd	s0,56(sp)
    8000153c:	0080                	addi	s0,sp,64
    8000153e:	fca43c23          	sd	a0,-40(s0)
    80001542:	fcb43823          	sd	a1,-48(s0)
    80001546:	87b2                	mv	a5,a2
    80001548:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  s = src;
    8000154c:	fd043783          	ld	a5,-48(s0)
    80001550:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001554:	fd843783          	ld	a5,-40(s0)
    80001558:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    8000155c:	fe843703          	ld	a4,-24(s0)
    80001560:	fe043783          	ld	a5,-32(s0)
    80001564:	08f77463          	bgeu	a4,a5,800015ec <memmove+0xb4>
    80001568:	fcc46783          	lwu	a5,-52(s0)
    8000156c:	fe843703          	ld	a4,-24(s0)
    80001570:	97ba                	add	a5,a5,a4
    80001572:	fe043703          	ld	a4,-32(s0)
    80001576:	06f77b63          	bgeu	a4,a5,800015ec <memmove+0xb4>
    s += n;
    8000157a:	fcc46783          	lwu	a5,-52(s0)
    8000157e:	fe843703          	ld	a4,-24(s0)
    80001582:	97ba                	add	a5,a5,a4
    80001584:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001588:	fcc46783          	lwu	a5,-52(s0)
    8000158c:	fe043703          	ld	a4,-32(s0)
    80001590:	97ba                	add	a5,a5,a4
    80001592:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001596:	a01d                	j	800015bc <memmove+0x84>
      *--d = *--s;
    80001598:	fe843783          	ld	a5,-24(s0)
    8000159c:	17fd                	addi	a5,a5,-1
    8000159e:	fef43423          	sd	a5,-24(s0)
    800015a2:	fe043783          	ld	a5,-32(s0)
    800015a6:	17fd                	addi	a5,a5,-1
    800015a8:	fef43023          	sd	a5,-32(s0)
    800015ac:	fe843783          	ld	a5,-24(s0)
    800015b0:	0007c703          	lbu	a4,0(a5)
    800015b4:	fe043783          	ld	a5,-32(s0)
    800015b8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015bc:	fcc42783          	lw	a5,-52(s0)
    800015c0:	fff7871b          	addiw	a4,a5,-1
    800015c4:	fce42623          	sw	a4,-52(s0)
    800015c8:	fbe1                	bnez	a5,80001598 <memmove+0x60>
  if(s < d && s + n > d){
    800015ca:	a805                	j	800015fa <memmove+0xc2>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015cc:	fe843703          	ld	a4,-24(s0)
    800015d0:	00170793          	addi	a5,a4,1
    800015d4:	fef43423          	sd	a5,-24(s0)
    800015d8:	fe043783          	ld	a5,-32(s0)
    800015dc:	00178693          	addi	a3,a5,1
    800015e0:	fed43023          	sd	a3,-32(s0)
    800015e4:	00074703          	lbu	a4,0(a4)
    800015e8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015ec:	fcc42783          	lw	a5,-52(s0)
    800015f0:	fff7871b          	addiw	a4,a5,-1
    800015f4:	fce42623          	sw	a4,-52(s0)
    800015f8:	fbf1                	bnez	a5,800015cc <memmove+0x94>

  return dst;
    800015fa:	fd843783          	ld	a5,-40(s0)
}
    800015fe:	853e                	mv	a0,a5
    80001600:	7462                	ld	s0,56(sp)
    80001602:	6121                	addi	sp,sp,64
    80001604:	8082                	ret

0000000080001606 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001606:	7179                	addi	sp,sp,-48
    80001608:	f406                	sd	ra,40(sp)
    8000160a:	f022                	sd	s0,32(sp)
    8000160c:	1800                	addi	s0,sp,48
    8000160e:	fea43423          	sd	a0,-24(s0)
    80001612:	feb43023          	sd	a1,-32(s0)
    80001616:	87b2                	mv	a5,a2
    80001618:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    8000161c:	fdc42783          	lw	a5,-36(s0)
    80001620:	863e                	mv	a2,a5
    80001622:	fe043583          	ld	a1,-32(s0)
    80001626:	fe843503          	ld	a0,-24(s0)
    8000162a:	00000097          	auipc	ra,0x0
    8000162e:	f0e080e7          	jalr	-242(ra) # 80001538 <memmove>
    80001632:	87aa                	mv	a5,a0
}
    80001634:	853e                	mv	a0,a5
    80001636:	70a2                	ld	ra,40(sp)
    80001638:	7402                	ld	s0,32(sp)
    8000163a:	6145                	addi	sp,sp,48
    8000163c:	8082                	ret

000000008000163e <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163e:	7179                	addi	sp,sp,-48
    80001640:	f422                	sd	s0,40(sp)
    80001642:	1800                	addi	s0,sp,48
    80001644:	fea43423          	sd	a0,-24(s0)
    80001648:	feb43023          	sd	a1,-32(s0)
    8000164c:	87b2                	mv	a5,a2
    8000164e:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    80001652:	a005                	j	80001672 <strncmp+0x34>
    n--, p++, q++;
    80001654:	fdc42783          	lw	a5,-36(s0)
    80001658:	37fd                	addiw	a5,a5,-1
    8000165a:	fcf42e23          	sw	a5,-36(s0)
    8000165e:	fe843783          	ld	a5,-24(s0)
    80001662:	0785                	addi	a5,a5,1
    80001664:	fef43423          	sd	a5,-24(s0)
    80001668:	fe043783          	ld	a5,-32(s0)
    8000166c:	0785                	addi	a5,a5,1
    8000166e:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    80001672:	fdc42783          	lw	a5,-36(s0)
    80001676:	2781                	sext.w	a5,a5
    80001678:	c385                	beqz	a5,80001698 <strncmp+0x5a>
    8000167a:	fe843783          	ld	a5,-24(s0)
    8000167e:	0007c783          	lbu	a5,0(a5)
    80001682:	cb99                	beqz	a5,80001698 <strncmp+0x5a>
    80001684:	fe843783          	ld	a5,-24(s0)
    80001688:	0007c703          	lbu	a4,0(a5)
    8000168c:	fe043783          	ld	a5,-32(s0)
    80001690:	0007c783          	lbu	a5,0(a5)
    80001694:	fcf700e3          	beq	a4,a5,80001654 <strncmp+0x16>
  if(n == 0)
    80001698:	fdc42783          	lw	a5,-36(s0)
    8000169c:	2781                	sext.w	a5,a5
    8000169e:	e399                	bnez	a5,800016a4 <strncmp+0x66>
    return 0;
    800016a0:	4781                	li	a5,0
    800016a2:	a839                	j	800016c0 <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a4:	fe843783          	ld	a5,-24(s0)
    800016a8:	0007c783          	lbu	a5,0(a5)
    800016ac:	0007871b          	sext.w	a4,a5
    800016b0:	fe043783          	ld	a5,-32(s0)
    800016b4:	0007c783          	lbu	a5,0(a5)
    800016b8:	2781                	sext.w	a5,a5
    800016ba:	40f707bb          	subw	a5,a4,a5
    800016be:	2781                	sext.w	a5,a5
}
    800016c0:	853e                	mv	a0,a5
    800016c2:	7422                	ld	s0,40(sp)
    800016c4:	6145                	addi	sp,sp,48
    800016c6:	8082                	ret

00000000800016c8 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c8:	7139                	addi	sp,sp,-64
    800016ca:	fc22                	sd	s0,56(sp)
    800016cc:	0080                	addi	s0,sp,64
    800016ce:	fca43c23          	sd	a0,-40(s0)
    800016d2:	fcb43823          	sd	a1,-48(s0)
    800016d6:	87b2                	mv	a5,a2
    800016d8:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016dc:	fd843783          	ld	a5,-40(s0)
    800016e0:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e4:	0001                	nop
    800016e6:	fcc42783          	lw	a5,-52(s0)
    800016ea:	fff7871b          	addiw	a4,a5,-1
    800016ee:	fce42623          	sw	a4,-52(s0)
    800016f2:	02f05e63          	blez	a5,8000172e <strncpy+0x66>
    800016f6:	fd043703          	ld	a4,-48(s0)
    800016fa:	00170793          	addi	a5,a4,1
    800016fe:	fcf43823          	sd	a5,-48(s0)
    80001702:	fd843783          	ld	a5,-40(s0)
    80001706:	00178693          	addi	a3,a5,1
    8000170a:	fcd43c23          	sd	a3,-40(s0)
    8000170e:	00074703          	lbu	a4,0(a4)
    80001712:	00e78023          	sb	a4,0(a5)
    80001716:	0007c783          	lbu	a5,0(a5)
    8000171a:	f7f1                	bnez	a5,800016e6 <strncpy+0x1e>
    ;
  while(n-- > 0)
    8000171c:	a809                	j	8000172e <strncpy+0x66>
    *s++ = 0;
    8000171e:	fd843783          	ld	a5,-40(s0)
    80001722:	00178713          	addi	a4,a5,1
    80001726:	fce43c23          	sd	a4,-40(s0)
    8000172a:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172e:	fcc42783          	lw	a5,-52(s0)
    80001732:	fff7871b          	addiw	a4,a5,-1
    80001736:	fce42623          	sw	a4,-52(s0)
    8000173a:	fef042e3          	bgtz	a5,8000171e <strncpy+0x56>
  return os;
    8000173e:	fe843783          	ld	a5,-24(s0)
}
    80001742:	853e                	mv	a0,a5
    80001744:	7462                	ld	s0,56(sp)
    80001746:	6121                	addi	sp,sp,64
    80001748:	8082                	ret

000000008000174a <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    8000174a:	7139                	addi	sp,sp,-64
    8000174c:	fc22                	sd	s0,56(sp)
    8000174e:	0080                	addi	s0,sp,64
    80001750:	fca43c23          	sd	a0,-40(s0)
    80001754:	fcb43823          	sd	a1,-48(s0)
    80001758:	87b2                	mv	a5,a2
    8000175a:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175e:	fd843783          	ld	a5,-40(s0)
    80001762:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001766:	fcc42783          	lw	a5,-52(s0)
    8000176a:	2781                	sext.w	a5,a5
    8000176c:	00f04563          	bgtz	a5,80001776 <safestrcpy+0x2c>
    return os;
    80001770:	fe843783          	ld	a5,-24(s0)
    80001774:	a0a1                	j	800017bc <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001776:	fcc42783          	lw	a5,-52(s0)
    8000177a:	37fd                	addiw	a5,a5,-1
    8000177c:	fcf42623          	sw	a5,-52(s0)
    80001780:	fcc42783          	lw	a5,-52(s0)
    80001784:	2781                	sext.w	a5,a5
    80001786:	02f05563          	blez	a5,800017b0 <safestrcpy+0x66>
    8000178a:	fd043703          	ld	a4,-48(s0)
    8000178e:	00170793          	addi	a5,a4,1
    80001792:	fcf43823          	sd	a5,-48(s0)
    80001796:	fd843783          	ld	a5,-40(s0)
    8000179a:	00178693          	addi	a3,a5,1
    8000179e:	fcd43c23          	sd	a3,-40(s0)
    800017a2:	00074703          	lbu	a4,0(a4)
    800017a6:	00e78023          	sb	a4,0(a5)
    800017aa:	0007c783          	lbu	a5,0(a5)
    800017ae:	f7e1                	bnez	a5,80001776 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017b0:	fd843783          	ld	a5,-40(s0)
    800017b4:	00078023          	sb	zero,0(a5)
  return os;
    800017b8:	fe843783          	ld	a5,-24(s0)
}
    800017bc:	853e                	mv	a0,a5
    800017be:	7462                	ld	s0,56(sp)
    800017c0:	6121                	addi	sp,sp,64
    800017c2:	8082                	ret

00000000800017c4 <strlen>:

int
strlen(const char *s)
{
    800017c4:	7179                	addi	sp,sp,-48
    800017c6:	f422                	sd	s0,40(sp)
    800017c8:	1800                	addi	s0,sp,48
    800017ca:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ce:	fe042623          	sw	zero,-20(s0)
    800017d2:	a031                	j	800017de <strlen+0x1a>
    800017d4:	fec42783          	lw	a5,-20(s0)
    800017d8:	2785                	addiw	a5,a5,1
    800017da:	fef42623          	sw	a5,-20(s0)
    800017de:	fec42783          	lw	a5,-20(s0)
    800017e2:	fd843703          	ld	a4,-40(s0)
    800017e6:	97ba                	add	a5,a5,a4
    800017e8:	0007c783          	lbu	a5,0(a5)
    800017ec:	f7e5                	bnez	a5,800017d4 <strlen+0x10>
    ;
  return n;
    800017ee:	fec42783          	lw	a5,-20(s0)
}
    800017f2:	853e                	mv	a0,a5
    800017f4:	7422                	ld	s0,40(sp)
    800017f6:	6145                	addi	sp,sp,48
    800017f8:	8082                	ret

00000000800017fa <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017fa:	1141                	addi	sp,sp,-16
    800017fc:	e406                	sd	ra,8(sp)
    800017fe:	e022                	sd	s0,0(sp)
    80001800:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    80001802:	00001097          	auipc	ra,0x1
    80001806:	f92080e7          	jalr	-110(ra) # 80002794 <cpuid>
    8000180a:	87aa                	mv	a5,a0
    8000180c:	efd5                	bnez	a5,800018c8 <main+0xce>
    consoleinit();
    8000180e:	fffff097          	auipc	ra,0xfffff
    80001812:	018080e7          	jalr	24(ra) # 80000826 <consoleinit>
    printfinit();
    80001816:	fffff097          	auipc	ra,0xfffff
    8000181a:	48e080e7          	jalr	1166(ra) # 80000ca4 <printfinit>
    printf("\n");
    8000181e:	0000a517          	auipc	a0,0xa
    80001822:	86250513          	addi	a0,a0,-1950 # 8000b080 <etext+0x80>
    80001826:	fffff097          	auipc	ra,0xfffff
    8000182a:	1d6080e7          	jalr	470(ra) # 800009fc <printf>
    printf("xv6 kernel is booting\n");
    8000182e:	0000a517          	auipc	a0,0xa
    80001832:	85a50513          	addi	a0,a0,-1958 # 8000b088 <etext+0x88>
    80001836:	fffff097          	auipc	ra,0xfffff
    8000183a:	1c6080e7          	jalr	454(ra) # 800009fc <printf>
    printf("\n");
    8000183e:	0000a517          	auipc	a0,0xa
    80001842:	84250513          	addi	a0,a0,-1982 # 8000b080 <etext+0x80>
    80001846:	fffff097          	auipc	ra,0xfffff
    8000184a:	1b6080e7          	jalr	438(ra) # 800009fc <printf>
    kinit();         // physical page allocator
    8000184e:	fffff097          	auipc	ra,0xfffff
    80001852:	7a2080e7          	jalr	1954(ra) # 80000ff0 <kinit>
    kvminit();       // create kernel page table
    80001856:	00000097          	auipc	ra,0x0
    8000185a:	1f4080e7          	jalr	500(ra) # 80001a4a <kvminit>
    kvminithart();   // turn on paging
    8000185e:	00000097          	auipc	ra,0x0
    80001862:	212080e7          	jalr	530(ra) # 80001a70 <kvminithart>
    procinit();      // process table
    80001866:	00001097          	auipc	ra,0x1
    8000186a:	e7c080e7          	jalr	-388(ra) # 800026e2 <procinit>
    trapinit();      // trap vectors
    8000186e:	00002097          	auipc	ra,0x2
    80001872:	1ba080e7          	jalr	442(ra) # 80003a28 <trapinit>
    trapinithart();  // install kernel trap vector
    80001876:	00002097          	auipc	ra,0x2
    8000187a:	1dc080e7          	jalr	476(ra) # 80003a52 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187e:	00007097          	auipc	ra,0x7
    80001882:	20c080e7          	jalr	524(ra) # 80008a8a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001886:	00007097          	auipc	ra,0x7
    8000188a:	228080e7          	jalr	552(ra) # 80008aae <plicinithart>
    binit();         // buffer cache
    8000188e:	00003097          	auipc	ra,0x3
    80001892:	de8080e7          	jalr	-536(ra) # 80004676 <binit>
    iinit();         // inode cache
    80001896:	00003097          	auipc	ra,0x3
    8000189a:	634080e7          	jalr	1588(ra) # 80004eca <iinit>
    fileinit();      // file table
    8000189e:	00005097          	auipc	ra,0x5
    800018a2:	fe4080e7          	jalr	-28(ra) # 80006882 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a6:	00007097          	auipc	ra,0x7
    800018aa:	2dc080e7          	jalr	732(ra) # 80008b82 <virtio_disk_init>
    userinit();      // first user process
    800018ae:	00001097          	auipc	ra,0x1
    800018b2:	318080e7          	jalr	792(ra) # 80002bc6 <userinit>
    __sync_synchronize();
    800018b6:	0ff0000f          	fence
    started = 1;
    800018ba:	00013797          	auipc	a5,0x13
    800018be:	9d678793          	addi	a5,a5,-1578 # 80014290 <started>
    800018c2:	4705                	li	a4,1
    800018c4:	c398                	sw	a4,0(a5)
    800018c6:	a0a9                	j	80001910 <main+0x116>
  } else {
    while(started == 0)
    800018c8:	0001                	nop
    800018ca:	00013797          	auipc	a5,0x13
    800018ce:	9c678793          	addi	a5,a5,-1594 # 80014290 <started>
    800018d2:	439c                	lw	a5,0(a5)
    800018d4:	2781                	sext.w	a5,a5
    800018d6:	dbf5                	beqz	a5,800018ca <main+0xd0>
      ;
    __sync_synchronize();
    800018d8:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018dc:	00001097          	auipc	ra,0x1
    800018e0:	eb8080e7          	jalr	-328(ra) # 80002794 <cpuid>
    800018e4:	87aa                	mv	a5,a0
    800018e6:	85be                	mv	a1,a5
    800018e8:	00009517          	auipc	a0,0x9
    800018ec:	7b850513          	addi	a0,a0,1976 # 8000b0a0 <etext+0xa0>
    800018f0:	fffff097          	auipc	ra,0xfffff
    800018f4:	10c080e7          	jalr	268(ra) # 800009fc <printf>
    kvminithart();    // turn on paging
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	178080e7          	jalr	376(ra) # 80001a70 <kvminithart>
    trapinithart();   // install kernel trap vector
    80001900:	00002097          	auipc	ra,0x2
    80001904:	152080e7          	jalr	338(ra) # 80003a52 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001908:	00007097          	auipc	ra,0x7
    8000190c:	1a6080e7          	jalr	422(ra) # 80008aae <plicinithart>
  }

  scheduler();        
    80001910:	00002097          	auipc	ra,0x2
    80001914:	8fa080e7          	jalr	-1798(ra) # 8000320a <scheduler>

0000000080001918 <w_satp>:
{
    80001918:	1101                	addi	sp,sp,-32
    8000191a:	ec22                	sd	s0,24(sp)
    8000191c:	1000                	addi	s0,sp,32
    8000191e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001922:	fe843783          	ld	a5,-24(s0)
    80001926:	18079073          	csrw	satp,a5
}
    8000192a:	0001                	nop
    8000192c:	6462                	ld	s0,24(sp)
    8000192e:	6105                	addi	sp,sp,32
    80001930:	8082                	ret

0000000080001932 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001932:	1141                	addi	sp,sp,-16
    80001934:	e422                	sd	s0,8(sp)
    80001936:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001938:	12000073          	sfence.vma
}
    8000193c:	0001                	nop
    8000193e:	6422                	ld	s0,8(sp)
    80001940:	0141                	addi	sp,sp,16
    80001942:	8082                	ret

0000000080001944 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001944:	1101                	addi	sp,sp,-32
    80001946:	ec06                	sd	ra,24(sp)
    80001948:	e822                	sd	s0,16(sp)
    8000194a:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    8000194c:	fffff097          	auipc	ra,0xfffff
    80001950:	7e0080e7          	jalr	2016(ra) # 8000112c <kalloc>
    80001954:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001958:	6605                	lui	a2,0x1
    8000195a:	4581                	li	a1,0
    8000195c:	fe843503          	ld	a0,-24(s0)
    80001960:	00000097          	auipc	ra,0x0
    80001964:	af4080e7          	jalr	-1292(ra) # 80001454 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001968:	4719                	li	a4,6
    8000196a:	6685                	lui	a3,0x1
    8000196c:	10000637          	lui	a2,0x10000
    80001970:	100005b7          	lui	a1,0x10000
    80001974:	fe843503          	ld	a0,-24(s0)
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	298080e7          	jalr	664(ra) # 80001c10 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001980:	4719                	li	a4,6
    80001982:	6685                	lui	a3,0x1
    80001984:	10001637          	lui	a2,0x10001
    80001988:	100015b7          	lui	a1,0x10001
    8000198c:	fe843503          	ld	a0,-24(s0)
    80001990:	00000097          	auipc	ra,0x0
    80001994:	280080e7          	jalr	640(ra) # 80001c10 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001998:	4719                	li	a4,6
    8000199a:	004006b7          	lui	a3,0x400
    8000199e:	0c000637          	lui	a2,0xc000
    800019a2:	0c0005b7          	lui	a1,0xc000
    800019a6:	fe843503          	ld	a0,-24(s0)
    800019aa:	00000097          	auipc	ra,0x0
    800019ae:	266080e7          	jalr	614(ra) # 80001c10 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019b2:	00009717          	auipc	a4,0x9
    800019b6:	64e70713          	addi	a4,a4,1614 # 8000b000 <etext>
    800019ba:	800007b7          	lui	a5,0x80000
    800019be:	97ba                	add	a5,a5,a4
    800019c0:	4729                	li	a4,10
    800019c2:	86be                	mv	a3,a5
    800019c4:	4785                	li	a5,1
    800019c6:	01f79613          	slli	a2,a5,0x1f
    800019ca:	4785                	li	a5,1
    800019cc:	01f79593          	slli	a1,a5,0x1f
    800019d0:	fe843503          	ld	a0,-24(s0)
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	23c080e7          	jalr	572(ra) # 80001c10 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019dc:	00009597          	auipc	a1,0x9
    800019e0:	62458593          	addi	a1,a1,1572 # 8000b000 <etext>
    800019e4:	00009617          	auipc	a2,0x9
    800019e8:	61c60613          	addi	a2,a2,1564 # 8000b000 <etext>
    800019ec:	00009797          	auipc	a5,0x9
    800019f0:	61478793          	addi	a5,a5,1556 # 8000b000 <etext>
    800019f4:	4745                	li	a4,17
    800019f6:	076e                	slli	a4,a4,0x1b
    800019f8:	40f707b3          	sub	a5,a4,a5
    800019fc:	4719                	li	a4,6
    800019fe:	86be                	mv	a3,a5
    80001a00:	fe843503          	ld	a0,-24(s0)
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	20c080e7          	jalr	524(ra) # 80001c10 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a0c:	00008797          	auipc	a5,0x8
    80001a10:	5f478793          	addi	a5,a5,1524 # 8000a000 <_trampoline>
    80001a14:	4729                	li	a4,10
    80001a16:	6685                	lui	a3,0x1
    80001a18:	863e                	mv	a2,a5
    80001a1a:	040007b7          	lui	a5,0x4000
    80001a1e:	17fd                	addi	a5,a5,-1
    80001a20:	00c79593          	slli	a1,a5,0xc
    80001a24:	fe843503          	ld	a0,-24(s0)
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	1e8080e7          	jalr	488(ra) # 80001c10 <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a30:	fe843503          	ld	a0,-24(s0)
    80001a34:	00001097          	auipc	ra,0x1
    80001a38:	bee080e7          	jalr	-1042(ra) # 80002622 <proc_mapstacks>
  
  return kpgtbl;
    80001a3c:	fe843783          	ld	a5,-24(s0)
}
    80001a40:	853e                	mv	a0,a5
    80001a42:	60e2                	ld	ra,24(sp)
    80001a44:	6442                	ld	s0,16(sp)
    80001a46:	6105                	addi	sp,sp,32
    80001a48:	8082                	ret

0000000080001a4a <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a4a:	1141                	addi	sp,sp,-16
    80001a4c:	e406                	sd	ra,8(sp)
    80001a4e:	e022                	sd	s0,0(sp)
    80001a50:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a52:	00000097          	auipc	ra,0x0
    80001a56:	ef2080e7          	jalr	-270(ra) # 80001944 <kvmmake>
    80001a5a:	872a                	mv	a4,a0
    80001a5c:	0000a797          	auipc	a5,0xa
    80001a60:	5b478793          	addi	a5,a5,1460 # 8000c010 <kernel_pagetable>
    80001a64:	e398                	sd	a4,0(a5)
}
    80001a66:	0001                	nop
    80001a68:	60a2                	ld	ra,8(sp)
    80001a6a:	6402                	ld	s0,0(sp)
    80001a6c:	0141                	addi	sp,sp,16
    80001a6e:	8082                	ret

0000000080001a70 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a70:	1141                	addi	sp,sp,-16
    80001a72:	e406                	sd	ra,8(sp)
    80001a74:	e022                	sd	s0,0(sp)
    80001a76:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a78:	0000a797          	auipc	a5,0xa
    80001a7c:	59878793          	addi	a5,a5,1432 # 8000c010 <kernel_pagetable>
    80001a80:	639c                	ld	a5,0(a5)
    80001a82:	00c7d713          	srli	a4,a5,0xc
    80001a86:	57fd                	li	a5,-1
    80001a88:	17fe                	slli	a5,a5,0x3f
    80001a8a:	8fd9                	or	a5,a5,a4
    80001a8c:	853e                	mv	a0,a5
    80001a8e:	00000097          	auipc	ra,0x0
    80001a92:	e8a080e7          	jalr	-374(ra) # 80001918 <w_satp>
  sfence_vma();
    80001a96:	00000097          	auipc	ra,0x0
    80001a9a:	e9c080e7          	jalr	-356(ra) # 80001932 <sfence_vma>
}
    80001a9e:	0001                	nop
    80001aa0:	60a2                	ld	ra,8(sp)
    80001aa2:	6402                	ld	s0,0(sp)
    80001aa4:	0141                	addi	sp,sp,16
    80001aa6:	8082                	ret

0000000080001aa8 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa8:	7139                	addi	sp,sp,-64
    80001aaa:	fc06                	sd	ra,56(sp)
    80001aac:	f822                	sd	s0,48(sp)
    80001aae:	0080                	addi	s0,sp,64
    80001ab0:	fca43c23          	sd	a0,-40(s0)
    80001ab4:	fcb43823          	sd	a1,-48(s0)
    80001ab8:	87b2                	mv	a5,a2
    80001aba:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001abe:	fd043703          	ld	a4,-48(s0)
    80001ac2:	57fd                	li	a5,-1
    80001ac4:	83e9                	srli	a5,a5,0x1a
    80001ac6:	00e7fa63          	bgeu	a5,a4,80001ada <walk+0x32>
    panic("walk");
    80001aca:	00009517          	auipc	a0,0x9
    80001ace:	5ee50513          	addi	a0,a0,1518 # 8000b0b8 <etext+0xb8>
    80001ad2:	fffff097          	auipc	ra,0xfffff
    80001ad6:	180080e7          	jalr	384(ra) # 80000c52 <panic>

  for(int level = 2; level > 0; level--) {
    80001ada:	4789                	li	a5,2
    80001adc:	fef42623          	sw	a5,-20(s0)
    80001ae0:	a849                	j	80001b72 <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ae2:	fec42703          	lw	a4,-20(s0)
    80001ae6:	87ba                	mv	a5,a4
    80001ae8:	0037979b          	slliw	a5,a5,0x3
    80001aec:	9fb9                	addw	a5,a5,a4
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	27b1                	addiw	a5,a5,12
    80001af2:	2781                	sext.w	a5,a5
    80001af4:	873e                	mv	a4,a5
    80001af6:	fd043783          	ld	a5,-48(s0)
    80001afa:	00e7d7b3          	srl	a5,a5,a4
    80001afe:	1ff7f793          	andi	a5,a5,511
    80001b02:	078e                	slli	a5,a5,0x3
    80001b04:	fd843703          	ld	a4,-40(s0)
    80001b08:	97ba                	add	a5,a5,a4
    80001b0a:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0e:	fe043783          	ld	a5,-32(s0)
    80001b12:	639c                	ld	a5,0(a5)
    80001b14:	8b85                	andi	a5,a5,1
    80001b16:	cb89                	beqz	a5,80001b28 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b18:	fe043783          	ld	a5,-32(s0)
    80001b1c:	639c                	ld	a5,0(a5)
    80001b1e:	83a9                	srli	a5,a5,0xa
    80001b20:	07b2                	slli	a5,a5,0xc
    80001b22:	fcf43c23          	sd	a5,-40(s0)
    80001b26:	a089                	j	80001b68 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b28:	fcc42783          	lw	a5,-52(s0)
    80001b2c:	2781                	sext.w	a5,a5
    80001b2e:	cb91                	beqz	a5,80001b42 <walk+0x9a>
    80001b30:	fffff097          	auipc	ra,0xfffff
    80001b34:	5fc080e7          	jalr	1532(ra) # 8000112c <kalloc>
    80001b38:	fca43c23          	sd	a0,-40(s0)
    80001b3c:	fd843783          	ld	a5,-40(s0)
    80001b40:	e399                	bnez	a5,80001b46 <walk+0x9e>
        return 0;
    80001b42:	4781                	li	a5,0
    80001b44:	a0a9                	j	80001b8e <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b46:	6605                	lui	a2,0x1
    80001b48:	4581                	li	a1,0
    80001b4a:	fd843503          	ld	a0,-40(s0)
    80001b4e:	00000097          	auipc	ra,0x0
    80001b52:	906080e7          	jalr	-1786(ra) # 80001454 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b56:	fd843783          	ld	a5,-40(s0)
    80001b5a:	83b1                	srli	a5,a5,0xc
    80001b5c:	07aa                	slli	a5,a5,0xa
    80001b5e:	0017e713          	ori	a4,a5,1
    80001b62:	fe043783          	ld	a5,-32(s0)
    80001b66:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b68:	fec42783          	lw	a5,-20(s0)
    80001b6c:	37fd                	addiw	a5,a5,-1
    80001b6e:	fef42623          	sw	a5,-20(s0)
    80001b72:	fec42783          	lw	a5,-20(s0)
    80001b76:	2781                	sext.w	a5,a5
    80001b78:	f6f045e3          	bgtz	a5,80001ae2 <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b7c:	fd043783          	ld	a5,-48(s0)
    80001b80:	83b1                	srli	a5,a5,0xc
    80001b82:	1ff7f793          	andi	a5,a5,511
    80001b86:	078e                	slli	a5,a5,0x3
    80001b88:	fd843703          	ld	a4,-40(s0)
    80001b8c:	97ba                	add	a5,a5,a4
}
    80001b8e:	853e                	mv	a0,a5
    80001b90:	70e2                	ld	ra,56(sp)
    80001b92:	7442                	ld	s0,48(sp)
    80001b94:	6121                	addi	sp,sp,64
    80001b96:	8082                	ret

0000000080001b98 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b98:	7179                	addi	sp,sp,-48
    80001b9a:	f406                	sd	ra,40(sp)
    80001b9c:	f022                	sd	s0,32(sp)
    80001b9e:	1800                	addi	s0,sp,48
    80001ba0:	fca43c23          	sd	a0,-40(s0)
    80001ba4:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba8:	fd043703          	ld	a4,-48(s0)
    80001bac:	57fd                	li	a5,-1
    80001bae:	83e9                	srli	a5,a5,0x1a
    80001bb0:	00e7f463          	bgeu	a5,a4,80001bb8 <walkaddr+0x20>
    return 0;
    80001bb4:	4781                	li	a5,0
    80001bb6:	a881                	j	80001c06 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb8:	4601                	li	a2,0
    80001bba:	fd043583          	ld	a1,-48(s0)
    80001bbe:	fd843503          	ld	a0,-40(s0)
    80001bc2:	00000097          	auipc	ra,0x0
    80001bc6:	ee6080e7          	jalr	-282(ra) # 80001aa8 <walk>
    80001bca:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bce:	fe843783          	ld	a5,-24(s0)
    80001bd2:	e399                	bnez	a5,80001bd8 <walkaddr+0x40>
    return 0;
    80001bd4:	4781                	li	a5,0
    80001bd6:	a805                	j	80001c06 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd8:	fe843783          	ld	a5,-24(s0)
    80001bdc:	639c                	ld	a5,0(a5)
    80001bde:	8b85                	andi	a5,a5,1
    80001be0:	e399                	bnez	a5,80001be6 <walkaddr+0x4e>
    return 0;
    80001be2:	4781                	li	a5,0
    80001be4:	a00d                	j	80001c06 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be6:	fe843783          	ld	a5,-24(s0)
    80001bea:	639c                	ld	a5,0(a5)
    80001bec:	8bc1                	andi	a5,a5,16
    80001bee:	e399                	bnez	a5,80001bf4 <walkaddr+0x5c>
    return 0;
    80001bf0:	4781                	li	a5,0
    80001bf2:	a811                	j	80001c06 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf4:	fe843783          	ld	a5,-24(s0)
    80001bf8:	639c                	ld	a5,0(a5)
    80001bfa:	83a9                	srli	a5,a5,0xa
    80001bfc:	07b2                	slli	a5,a5,0xc
    80001bfe:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001c02:	fe043783          	ld	a5,-32(s0)
}
    80001c06:	853e                	mv	a0,a5
    80001c08:	70a2                	ld	ra,40(sp)
    80001c0a:	7402                	ld	s0,32(sp)
    80001c0c:	6145                	addi	sp,sp,48
    80001c0e:	8082                	ret

0000000080001c10 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c10:	7139                	addi	sp,sp,-64
    80001c12:	fc06                	sd	ra,56(sp)
    80001c14:	f822                	sd	s0,48(sp)
    80001c16:	0080                	addi	s0,sp,64
    80001c18:	fea43423          	sd	a0,-24(s0)
    80001c1c:	feb43023          	sd	a1,-32(s0)
    80001c20:	fcc43c23          	sd	a2,-40(s0)
    80001c24:	fcd43823          	sd	a3,-48(s0)
    80001c28:	87ba                	mv	a5,a4
    80001c2a:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2e:	fcc42783          	lw	a5,-52(s0)
    80001c32:	873e                	mv	a4,a5
    80001c34:	fd843683          	ld	a3,-40(s0)
    80001c38:	fd043603          	ld	a2,-48(s0)
    80001c3c:	fe043583          	ld	a1,-32(s0)
    80001c40:	fe843503          	ld	a0,-24(s0)
    80001c44:	00000097          	auipc	ra,0x0
    80001c48:	026080e7          	jalr	38(ra) # 80001c6a <mappages>
    80001c4c:	87aa                	mv	a5,a0
    80001c4e:	cb89                	beqz	a5,80001c60 <kvmmap+0x50>
    panic("kvmmap");
    80001c50:	00009517          	auipc	a0,0x9
    80001c54:	47050513          	addi	a0,a0,1136 # 8000b0c0 <etext+0xc0>
    80001c58:	fffff097          	auipc	ra,0xfffff
    80001c5c:	ffa080e7          	jalr	-6(ra) # 80000c52 <panic>
}
    80001c60:	0001                	nop
    80001c62:	70e2                	ld	ra,56(sp)
    80001c64:	7442                	ld	s0,48(sp)
    80001c66:	6121                	addi	sp,sp,64
    80001c68:	8082                	ret

0000000080001c6a <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c6a:	711d                	addi	sp,sp,-96
    80001c6c:	ec86                	sd	ra,88(sp)
    80001c6e:	e8a2                	sd	s0,80(sp)
    80001c70:	1080                	addi	s0,sp,96
    80001c72:	fca43423          	sd	a0,-56(s0)
    80001c76:	fcb43023          	sd	a1,-64(s0)
    80001c7a:	fac43c23          	sd	a2,-72(s0)
    80001c7e:	fad43823          	sd	a3,-80(s0)
    80001c82:	87ba                	mv	a5,a4
    80001c84:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80001c88:	fc043703          	ld	a4,-64(s0)
    80001c8c:	77fd                	lui	a5,0xfffff
    80001c8e:	8ff9                	and	a5,a5,a4
    80001c90:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001c94:	fc043703          	ld	a4,-64(s0)
    80001c98:	fb843783          	ld	a5,-72(s0)
    80001c9c:	97ba                	add	a5,a5,a4
    80001c9e:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ff8cfff>
    80001ca2:	77fd                	lui	a5,0xfffff
    80001ca4:	8ff9                	and	a5,a5,a4
    80001ca6:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001caa:	4605                	li	a2,1
    80001cac:	fe843583          	ld	a1,-24(s0)
    80001cb0:	fc843503          	ld	a0,-56(s0)
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	df4080e7          	jalr	-524(ra) # 80001aa8 <walk>
    80001cbc:	fca43c23          	sd	a0,-40(s0)
    80001cc0:	fd843783          	ld	a5,-40(s0)
    80001cc4:	e399                	bnez	a5,80001cca <mappages+0x60>
      return -1;
    80001cc6:	57fd                	li	a5,-1
    80001cc8:	a085                	j	80001d28 <mappages+0xbe>
    if(*pte & PTE_V)
    80001cca:	fd843783          	ld	a5,-40(s0)
    80001cce:	639c                	ld	a5,0(a5)
    80001cd0:	8b85                	andi	a5,a5,1
    80001cd2:	cb89                	beqz	a5,80001ce4 <mappages+0x7a>
      panic("remap");
    80001cd4:	00009517          	auipc	a0,0x9
    80001cd8:	3f450513          	addi	a0,a0,1012 # 8000b0c8 <etext+0xc8>
    80001cdc:	fffff097          	auipc	ra,0xfffff
    80001ce0:	f76080e7          	jalr	-138(ra) # 80000c52 <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001ce4:	fb043783          	ld	a5,-80(s0)
    80001ce8:	83b1                	srli	a5,a5,0xc
    80001cea:	00a79713          	slli	a4,a5,0xa
    80001cee:	fac42783          	lw	a5,-84(s0)
    80001cf2:	8fd9                	or	a5,a5,a4
    80001cf4:	0017e713          	ori	a4,a5,1
    80001cf8:	fd843783          	ld	a5,-40(s0)
    80001cfc:	e398                	sd	a4,0(a5)
    if(a == last)
    80001cfe:	fe843703          	ld	a4,-24(s0)
    80001d02:	fe043783          	ld	a5,-32(s0)
    80001d06:	00f70f63          	beq	a4,a5,80001d24 <mappages+0xba>
      break;
    a += PGSIZE;
    80001d0a:	fe843703          	ld	a4,-24(s0)
    80001d0e:	6785                	lui	a5,0x1
    80001d10:	97ba                	add	a5,a5,a4
    80001d12:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d16:	fb043703          	ld	a4,-80(s0)
    80001d1a:	6785                	lui	a5,0x1
    80001d1c:	97ba                	add	a5,a5,a4
    80001d1e:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d22:	b761                	j	80001caa <mappages+0x40>
      break;
    80001d24:	0001                	nop
  }
  return 0;
    80001d26:	4781                	li	a5,0
}
    80001d28:	853e                	mv	a0,a5
    80001d2a:	60e6                	ld	ra,88(sp)
    80001d2c:	6446                	ld	s0,80(sp)
    80001d2e:	6125                	addi	sp,sp,96
    80001d30:	8082                	ret

0000000080001d32 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d32:	715d                	addi	sp,sp,-80
    80001d34:	e486                	sd	ra,72(sp)
    80001d36:	e0a2                	sd	s0,64(sp)
    80001d38:	0880                	addi	s0,sp,80
    80001d3a:	fca43423          	sd	a0,-56(s0)
    80001d3e:	fcb43023          	sd	a1,-64(s0)
    80001d42:	fac43c23          	sd	a2,-72(s0)
    80001d46:	87b6                	mv	a5,a3
    80001d48:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d4c:	fc043703          	ld	a4,-64(s0)
    80001d50:	6785                	lui	a5,0x1
    80001d52:	17fd                	addi	a5,a5,-1
    80001d54:	8ff9                	and	a5,a5,a4
    80001d56:	cb89                	beqz	a5,80001d68 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d58:	00009517          	auipc	a0,0x9
    80001d5c:	37850513          	addi	a0,a0,888 # 8000b0d0 <etext+0xd0>
    80001d60:	fffff097          	auipc	ra,0xfffff
    80001d64:	ef2080e7          	jalr	-270(ra) # 80000c52 <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d68:	fc043783          	ld	a5,-64(s0)
    80001d6c:	fef43423          	sd	a5,-24(s0)
    80001d70:	a045                	j	80001e10 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d72:	4601                	li	a2,0
    80001d74:	fe843583          	ld	a1,-24(s0)
    80001d78:	fc843503          	ld	a0,-56(s0)
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	d2c080e7          	jalr	-724(ra) # 80001aa8 <walk>
    80001d84:	fea43023          	sd	a0,-32(s0)
    80001d88:	fe043783          	ld	a5,-32(s0)
    80001d8c:	eb89                	bnez	a5,80001d9e <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001d8e:	00009517          	auipc	a0,0x9
    80001d92:	35a50513          	addi	a0,a0,858 # 8000b0e8 <etext+0xe8>
    80001d96:	fffff097          	auipc	ra,0xfffff
    80001d9a:	ebc080e7          	jalr	-324(ra) # 80000c52 <panic>
    if((*pte & PTE_V) == 0)
    80001d9e:	fe043783          	ld	a5,-32(s0)
    80001da2:	639c                	ld	a5,0(a5)
    80001da4:	8b85                	andi	a5,a5,1
    80001da6:	eb89                	bnez	a5,80001db8 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001da8:	00009517          	auipc	a0,0x9
    80001dac:	35050513          	addi	a0,a0,848 # 8000b0f8 <etext+0xf8>
    80001db0:	fffff097          	auipc	ra,0xfffff
    80001db4:	ea2080e7          	jalr	-350(ra) # 80000c52 <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001db8:	fe043783          	ld	a5,-32(s0)
    80001dbc:	639c                	ld	a5,0(a5)
    80001dbe:	3ff7f713          	andi	a4,a5,1023
    80001dc2:	4785                	li	a5,1
    80001dc4:	00f71a63          	bne	a4,a5,80001dd8 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dc8:	00009517          	auipc	a0,0x9
    80001dcc:	34850513          	addi	a0,a0,840 # 8000b110 <etext+0x110>
    80001dd0:	fffff097          	auipc	ra,0xfffff
    80001dd4:	e82080e7          	jalr	-382(ra) # 80000c52 <panic>
    if(do_free){
    80001dd8:	fb442783          	lw	a5,-76(s0)
    80001ddc:	2781                	sext.w	a5,a5
    80001dde:	cf99                	beqz	a5,80001dfc <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001de0:	fe043783          	ld	a5,-32(s0)
    80001de4:	639c                	ld	a5,0(a5)
    80001de6:	83a9                	srli	a5,a5,0xa
    80001de8:	07b2                	slli	a5,a5,0xc
    80001dea:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001dee:	fd843783          	ld	a5,-40(s0)
    80001df2:	853e                	mv	a0,a5
    80001df4:	fffff097          	auipc	ra,0xfffff
    80001df8:	294080e7          	jalr	660(ra) # 80001088 <kfree>
    }
    *pte = 0;
    80001dfc:	fe043783          	ld	a5,-32(s0)
    80001e00:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e04:	fe843703          	ld	a4,-24(s0)
    80001e08:	6785                	lui	a5,0x1
    80001e0a:	97ba                	add	a5,a5,a4
    80001e0c:	fef43423          	sd	a5,-24(s0)
    80001e10:	fb843783          	ld	a5,-72(s0)
    80001e14:	00c79713          	slli	a4,a5,0xc
    80001e18:	fc043783          	ld	a5,-64(s0)
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fe843703          	ld	a4,-24(s0)
    80001e22:	f4f768e3          	bltu	a4,a5,80001d72 <uvmunmap+0x40>
  }
}
    80001e26:	0001                	nop
    80001e28:	0001                	nop
    80001e2a:	60a6                	ld	ra,72(sp)
    80001e2c:	6406                	ld	s0,64(sp)
    80001e2e:	6161                	addi	sp,sp,80
    80001e30:	8082                	ret

0000000080001e32 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e32:	1101                	addi	sp,sp,-32
    80001e34:	ec06                	sd	ra,24(sp)
    80001e36:	e822                	sd	s0,16(sp)
    80001e38:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e3a:	fffff097          	auipc	ra,0xfffff
    80001e3e:	2f2080e7          	jalr	754(ra) # 8000112c <kalloc>
    80001e42:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e46:	fe843783          	ld	a5,-24(s0)
    80001e4a:	e399                	bnez	a5,80001e50 <uvmcreate+0x1e>
    return 0;
    80001e4c:	4781                	li	a5,0
    80001e4e:	a819                	j	80001e64 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e50:	6605                	lui	a2,0x1
    80001e52:	4581                	li	a1,0
    80001e54:	fe843503          	ld	a0,-24(s0)
    80001e58:	fffff097          	auipc	ra,0xfffff
    80001e5c:	5fc080e7          	jalr	1532(ra) # 80001454 <memset>
  return pagetable;
    80001e60:	fe843783          	ld	a5,-24(s0)
}
    80001e64:	853e                	mv	a0,a5
    80001e66:	60e2                	ld	ra,24(sp)
    80001e68:	6442                	ld	s0,16(sp)
    80001e6a:	6105                	addi	sp,sp,32
    80001e6c:	8082                	ret

0000000080001e6e <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e6e:	7139                	addi	sp,sp,-64
    80001e70:	fc06                	sd	ra,56(sp)
    80001e72:	f822                	sd	s0,48(sp)
    80001e74:	0080                	addi	s0,sp,64
    80001e76:	fca43c23          	sd	a0,-40(s0)
    80001e7a:	fcb43823          	sd	a1,-48(s0)
    80001e7e:	87b2                	mv	a5,a2
    80001e80:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e84:	fcc42783          	lw	a5,-52(s0)
    80001e88:	0007871b          	sext.w	a4,a5
    80001e8c:	6785                	lui	a5,0x1
    80001e8e:	00f76a63          	bltu	a4,a5,80001ea2 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001e92:	00009517          	auipc	a0,0x9
    80001e96:	29650513          	addi	a0,a0,662 # 8000b128 <etext+0x128>
    80001e9a:	fffff097          	auipc	ra,0xfffff
    80001e9e:	db8080e7          	jalr	-584(ra) # 80000c52 <panic>
  mem = kalloc();
    80001ea2:	fffff097          	auipc	ra,0xfffff
    80001ea6:	28a080e7          	jalr	650(ra) # 8000112c <kalloc>
    80001eaa:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001eae:	6605                	lui	a2,0x1
    80001eb0:	4581                	li	a1,0
    80001eb2:	fe843503          	ld	a0,-24(s0)
    80001eb6:	fffff097          	auipc	ra,0xfffff
    80001eba:	59e080e7          	jalr	1438(ra) # 80001454 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ebe:	fe843783          	ld	a5,-24(s0)
    80001ec2:	4779                	li	a4,30
    80001ec4:	86be                	mv	a3,a5
    80001ec6:	6605                	lui	a2,0x1
    80001ec8:	4581                	li	a1,0
    80001eca:	fd843503          	ld	a0,-40(s0)
    80001ece:	00000097          	auipc	ra,0x0
    80001ed2:	d9c080e7          	jalr	-612(ra) # 80001c6a <mappages>
  memmove(mem, src, sz);
    80001ed6:	fcc42783          	lw	a5,-52(s0)
    80001eda:	863e                	mv	a2,a5
    80001edc:	fd043583          	ld	a1,-48(s0)
    80001ee0:	fe843503          	ld	a0,-24(s0)
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	654080e7          	jalr	1620(ra) # 80001538 <memmove>
}
    80001eec:	0001                	nop
    80001eee:	70e2                	ld	ra,56(sp)
    80001ef0:	7442                	ld	s0,48(sp)
    80001ef2:	6121                	addi	sp,sp,64
    80001ef4:	8082                	ret

0000000080001ef6 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001ef6:	7139                	addi	sp,sp,-64
    80001ef8:	fc06                	sd	ra,56(sp)
    80001efa:	f822                	sd	s0,48(sp)
    80001efc:	0080                	addi	s0,sp,64
    80001efe:	fca43c23          	sd	a0,-40(s0)
    80001f02:	fcb43823          	sd	a1,-48(s0)
    80001f06:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f0a:	fc843703          	ld	a4,-56(s0)
    80001f0e:	fd043783          	ld	a5,-48(s0)
    80001f12:	00f77563          	bgeu	a4,a5,80001f1c <uvmalloc+0x26>
    return oldsz;
    80001f16:	fd043783          	ld	a5,-48(s0)
    80001f1a:	a85d                	j	80001fd0 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f1c:	fd043703          	ld	a4,-48(s0)
    80001f20:	6785                	lui	a5,0x1
    80001f22:	17fd                	addi	a5,a5,-1
    80001f24:	973e                	add	a4,a4,a5
    80001f26:	77fd                	lui	a5,0xfffff
    80001f28:	8ff9                	and	a5,a5,a4
    80001f2a:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f2e:	fd043783          	ld	a5,-48(s0)
    80001f32:	fef43423          	sd	a5,-24(s0)
    80001f36:	a069                	j	80001fc0 <uvmalloc+0xca>
    mem = kalloc();
    80001f38:	fffff097          	auipc	ra,0xfffff
    80001f3c:	1f4080e7          	jalr	500(ra) # 8000112c <kalloc>
    80001f40:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f44:	fe043783          	ld	a5,-32(s0)
    80001f48:	ef89                	bnez	a5,80001f62 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f4a:	fd043603          	ld	a2,-48(s0)
    80001f4e:	fe843583          	ld	a1,-24(s0)
    80001f52:	fd843503          	ld	a0,-40(s0)
    80001f56:	00000097          	auipc	ra,0x0
    80001f5a:	084080e7          	jalr	132(ra) # 80001fda <uvmdealloc>
      return 0;
    80001f5e:	4781                	li	a5,0
    80001f60:	a885                	j	80001fd0 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f62:	6605                	lui	a2,0x1
    80001f64:	4581                	li	a1,0
    80001f66:	fe043503          	ld	a0,-32(s0)
    80001f6a:	fffff097          	auipc	ra,0xfffff
    80001f6e:	4ea080e7          	jalr	1258(ra) # 80001454 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f72:	fe043783          	ld	a5,-32(s0)
    80001f76:	4779                	li	a4,30
    80001f78:	86be                	mv	a3,a5
    80001f7a:	6605                	lui	a2,0x1
    80001f7c:	fe843583          	ld	a1,-24(s0)
    80001f80:	fd843503          	ld	a0,-40(s0)
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	ce6080e7          	jalr	-794(ra) # 80001c6a <mappages>
    80001f8c:	87aa                	mv	a5,a0
    80001f8e:	c39d                	beqz	a5,80001fb4 <uvmalloc+0xbe>
      kfree(mem);
    80001f90:	fe043503          	ld	a0,-32(s0)
    80001f94:	fffff097          	auipc	ra,0xfffff
    80001f98:	0f4080e7          	jalr	244(ra) # 80001088 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001f9c:	fd043603          	ld	a2,-48(s0)
    80001fa0:	fe843583          	ld	a1,-24(s0)
    80001fa4:	fd843503          	ld	a0,-40(s0)
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	032080e7          	jalr	50(ra) # 80001fda <uvmdealloc>
      return 0;
    80001fb0:	4781                	li	a5,0
    80001fb2:	a839                	j	80001fd0 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fb4:	fe843703          	ld	a4,-24(s0)
    80001fb8:	6785                	lui	a5,0x1
    80001fba:	97ba                	add	a5,a5,a4
    80001fbc:	fef43423          	sd	a5,-24(s0)
    80001fc0:	fe843703          	ld	a4,-24(s0)
    80001fc4:	fc843783          	ld	a5,-56(s0)
    80001fc8:	f6f768e3          	bltu	a4,a5,80001f38 <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fcc:	fc843783          	ld	a5,-56(s0)
}
    80001fd0:	853e                	mv	a0,a5
    80001fd2:	70e2                	ld	ra,56(sp)
    80001fd4:	7442                	ld	s0,48(sp)
    80001fd6:	6121                	addi	sp,sp,64
    80001fd8:	8082                	ret

0000000080001fda <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fda:	7139                	addi	sp,sp,-64
    80001fdc:	fc06                	sd	ra,56(sp)
    80001fde:	f822                	sd	s0,48(sp)
    80001fe0:	0080                	addi	s0,sp,64
    80001fe2:	fca43c23          	sd	a0,-40(s0)
    80001fe6:	fcb43823          	sd	a1,-48(s0)
    80001fea:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80001fee:	fc843703          	ld	a4,-56(s0)
    80001ff2:	fd043783          	ld	a5,-48(s0)
    80001ff6:	00f76563          	bltu	a4,a5,80002000 <uvmdealloc+0x26>
    return oldsz;
    80001ffa:	fd043783          	ld	a5,-48(s0)
    80001ffe:	a885                	j	8000206e <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	6785                	lui	a5,0x1
    80002006:	17fd                	addi	a5,a5,-1
    80002008:	973e                	add	a4,a4,a5
    8000200a:	77fd                	lui	a5,0xfffff
    8000200c:	8f7d                	and	a4,a4,a5
    8000200e:	fd043683          	ld	a3,-48(s0)
    80002012:	6785                	lui	a5,0x1
    80002014:	17fd                	addi	a5,a5,-1
    80002016:	96be                	add	a3,a3,a5
    80002018:	77fd                	lui	a5,0xfffff
    8000201a:	8ff5                	and	a5,a5,a3
    8000201c:	04f77763          	bgeu	a4,a5,8000206a <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002020:	fd043703          	ld	a4,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	973e                	add	a4,a4,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8f7d                	and	a4,a4,a5
    8000202e:	fc843683          	ld	a3,-56(s0)
    80002032:	6785                	lui	a5,0x1
    80002034:	17fd                	addi	a5,a5,-1
    80002036:	96be                	add	a3,a3,a5
    80002038:	77fd                	lui	a5,0xfffff
    8000203a:	8ff5                	and	a5,a5,a3
    8000203c:	40f707b3          	sub	a5,a4,a5
    80002040:	83b1                	srli	a5,a5,0xc
    80002042:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002046:	fc843703          	ld	a4,-56(s0)
    8000204a:	6785                	lui	a5,0x1
    8000204c:	17fd                	addi	a5,a5,-1
    8000204e:	973e                	add	a4,a4,a5
    80002050:	77fd                	lui	a5,0xfffff
    80002052:	8ff9                	and	a5,a5,a4
    80002054:	fec42703          	lw	a4,-20(s0)
    80002058:	4685                	li	a3,1
    8000205a:	863a                	mv	a2,a4
    8000205c:	85be                	mv	a1,a5
    8000205e:	fd843503          	ld	a0,-40(s0)
    80002062:	00000097          	auipc	ra,0x0
    80002066:	cd0080e7          	jalr	-816(ra) # 80001d32 <uvmunmap>
  }

  return newsz;
    8000206a:	fc843783          	ld	a5,-56(s0)
}
    8000206e:	853e                	mv	a0,a5
    80002070:	70e2                	ld	ra,56(sp)
    80002072:	7442                	ld	s0,48(sp)
    80002074:	6121                	addi	sp,sp,64
    80002076:	8082                	ret

0000000080002078 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80002078:	7139                	addi	sp,sp,-64
    8000207a:	fc06                	sd	ra,56(sp)
    8000207c:	f822                	sd	s0,48(sp)
    8000207e:	0080                	addi	s0,sp,64
    80002080:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002084:	fe042623          	sw	zero,-20(s0)
    80002088:	a88d                	j	800020fa <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000208a:	fec42783          	lw	a5,-20(s0)
    8000208e:	078e                	slli	a5,a5,0x3
    80002090:	fc843703          	ld	a4,-56(s0)
    80002094:	97ba                	add	a5,a5,a4
    80002096:	639c                	ld	a5,0(a5)
    80002098:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000209c:	fe043783          	ld	a5,-32(s0)
    800020a0:	8b85                	andi	a5,a5,1
    800020a2:	cb9d                	beqz	a5,800020d8 <freewalk+0x60>
    800020a4:	fe043783          	ld	a5,-32(s0)
    800020a8:	8bb9                	andi	a5,a5,14
    800020aa:	e79d                	bnez	a5,800020d8 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020ac:	fe043783          	ld	a5,-32(s0)
    800020b0:	83a9                	srli	a5,a5,0xa
    800020b2:	07b2                	slli	a5,a5,0xc
    800020b4:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020b8:	fd843783          	ld	a5,-40(s0)
    800020bc:	853e                	mv	a0,a5
    800020be:	00000097          	auipc	ra,0x0
    800020c2:	fba080e7          	jalr	-70(ra) # 80002078 <freewalk>
      pagetable[i] = 0;
    800020c6:	fec42783          	lw	a5,-20(s0)
    800020ca:	078e                	slli	a5,a5,0x3
    800020cc:	fc843703          	ld	a4,-56(s0)
    800020d0:	97ba                	add	a5,a5,a4
    800020d2:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ff8d000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020d6:	a829                	j	800020f0 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020d8:	fe043783          	ld	a5,-32(s0)
    800020dc:	8b85                	andi	a5,a5,1
    800020de:	cb89                	beqz	a5,800020f0 <freewalk+0x78>
      panic("freewalk: leaf");
    800020e0:	00009517          	auipc	a0,0x9
    800020e4:	06850513          	addi	a0,a0,104 # 8000b148 <etext+0x148>
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	b6a080e7          	jalr	-1174(ra) # 80000c52 <panic>
  for(int i = 0; i < 512; i++){
    800020f0:	fec42783          	lw	a5,-20(s0)
    800020f4:	2785                	addiw	a5,a5,1
    800020f6:	fef42623          	sw	a5,-20(s0)
    800020fa:	fec42783          	lw	a5,-20(s0)
    800020fe:	0007871b          	sext.w	a4,a5
    80002102:	1ff00793          	li	a5,511
    80002106:	f8e7d2e3          	bge	a5,a4,8000208a <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000210a:	fc843503          	ld	a0,-56(s0)
    8000210e:	fffff097          	auipc	ra,0xfffff
    80002112:	f7a080e7          	jalr	-134(ra) # 80001088 <kfree>
}
    80002116:	0001                	nop
    80002118:	70e2                	ld	ra,56(sp)
    8000211a:	7442                	ld	s0,48(sp)
    8000211c:	6121                	addi	sp,sp,64
    8000211e:	8082                	ret

0000000080002120 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002120:	1101                	addi	sp,sp,-32
    80002122:	ec06                	sd	ra,24(sp)
    80002124:	e822                	sd	s0,16(sp)
    80002126:	1000                	addi	s0,sp,32
    80002128:	fea43423          	sd	a0,-24(s0)
    8000212c:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002130:	fe043783          	ld	a5,-32(s0)
    80002134:	c385                	beqz	a5,80002154 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002136:	fe043703          	ld	a4,-32(s0)
    8000213a:	6785                	lui	a5,0x1
    8000213c:	17fd                	addi	a5,a5,-1
    8000213e:	97ba                	add	a5,a5,a4
    80002140:	83b1                	srli	a5,a5,0xc
    80002142:	4685                	li	a3,1
    80002144:	863e                	mv	a2,a5
    80002146:	4581                	li	a1,0
    80002148:	fe843503          	ld	a0,-24(s0)
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	be6080e7          	jalr	-1050(ra) # 80001d32 <uvmunmap>
  freewalk(pagetable);
    80002154:	fe843503          	ld	a0,-24(s0)
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	f20080e7          	jalr	-224(ra) # 80002078 <freewalk>
}
    80002160:	0001                	nop
    80002162:	60e2                	ld	ra,24(sp)
    80002164:	6442                	ld	s0,16(sp)
    80002166:	6105                	addi	sp,sp,32
    80002168:	8082                	ret

000000008000216a <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000216a:	711d                	addi	sp,sp,-96
    8000216c:	ec86                	sd	ra,88(sp)
    8000216e:	e8a2                	sd	s0,80(sp)
    80002170:	1080                	addi	s0,sp,96
    80002172:	faa43c23          	sd	a0,-72(s0)
    80002176:	fab43823          	sd	a1,-80(s0)
    8000217a:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    8000217e:	fe043423          	sd	zero,-24(s0)
    80002182:	a0d9                	j	80002248 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002184:	4601                	li	a2,0
    80002186:	fe843583          	ld	a1,-24(s0)
    8000218a:	fb843503          	ld	a0,-72(s0)
    8000218e:	00000097          	auipc	ra,0x0
    80002192:	91a080e7          	jalr	-1766(ra) # 80001aa8 <walk>
    80002196:	fea43023          	sd	a0,-32(s0)
    8000219a:	fe043783          	ld	a5,-32(s0)
    8000219e:	eb89                	bnez	a5,800021b0 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021a0:	00009517          	auipc	a0,0x9
    800021a4:	fb850513          	addi	a0,a0,-72 # 8000b158 <etext+0x158>
    800021a8:	fffff097          	auipc	ra,0xfffff
    800021ac:	aaa080e7          	jalr	-1366(ra) # 80000c52 <panic>
    if((*pte & PTE_V) == 0)
    800021b0:	fe043783          	ld	a5,-32(s0)
    800021b4:	639c                	ld	a5,0(a5)
    800021b6:	8b85                	andi	a5,a5,1
    800021b8:	eb89                	bnez	a5,800021ca <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021ba:	00009517          	auipc	a0,0x9
    800021be:	fbe50513          	addi	a0,a0,-66 # 8000b178 <etext+0x178>
    800021c2:	fffff097          	auipc	ra,0xfffff
    800021c6:	a90080e7          	jalr	-1392(ra) # 80000c52 <panic>
    pa = PTE2PA(*pte);
    800021ca:	fe043783          	ld	a5,-32(s0)
    800021ce:	639c                	ld	a5,0(a5)
    800021d0:	83a9                	srli	a5,a5,0xa
    800021d2:	07b2                	slli	a5,a5,0xc
    800021d4:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021d8:	fe043783          	ld	a5,-32(s0)
    800021dc:	639c                	ld	a5,0(a5)
    800021de:	2781                	sext.w	a5,a5
    800021e0:	3ff7f793          	andi	a5,a5,1023
    800021e4:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021e8:	fffff097          	auipc	ra,0xfffff
    800021ec:	f44080e7          	jalr	-188(ra) # 8000112c <kalloc>
    800021f0:	fca43423          	sd	a0,-56(s0)
    800021f4:	fc843783          	ld	a5,-56(s0)
    800021f8:	c3a5                	beqz	a5,80002258 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800021fa:	fd843783          	ld	a5,-40(s0)
    800021fe:	6605                	lui	a2,0x1
    80002200:	85be                	mv	a1,a5
    80002202:	fc843503          	ld	a0,-56(s0)
    80002206:	fffff097          	auipc	ra,0xfffff
    8000220a:	332080e7          	jalr	818(ra) # 80001538 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    8000220e:	fc843783          	ld	a5,-56(s0)
    80002212:	fd442703          	lw	a4,-44(s0)
    80002216:	86be                	mv	a3,a5
    80002218:	6605                	lui	a2,0x1
    8000221a:	fe843583          	ld	a1,-24(s0)
    8000221e:	fb043503          	ld	a0,-80(s0)
    80002222:	00000097          	auipc	ra,0x0
    80002226:	a48080e7          	jalr	-1464(ra) # 80001c6a <mappages>
    8000222a:	87aa                	mv	a5,a0
    8000222c:	cb81                	beqz	a5,8000223c <uvmcopy+0xd2>
      kfree(mem);
    8000222e:	fc843503          	ld	a0,-56(s0)
    80002232:	fffff097          	auipc	ra,0xfffff
    80002236:	e56080e7          	jalr	-426(ra) # 80001088 <kfree>
      goto err;
    8000223a:	a005                	j	8000225a <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000223c:	fe843703          	ld	a4,-24(s0)
    80002240:	6785                	lui	a5,0x1
    80002242:	97ba                	add	a5,a5,a4
    80002244:	fef43423          	sd	a5,-24(s0)
    80002248:	fe843703          	ld	a4,-24(s0)
    8000224c:	fa843783          	ld	a5,-88(s0)
    80002250:	f2f76ae3          	bltu	a4,a5,80002184 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002254:	4781                	li	a5,0
    80002256:	a839                	j	80002274 <uvmcopy+0x10a>
      goto err;
    80002258:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000225a:	fe843783          	ld	a5,-24(s0)
    8000225e:	83b1                	srli	a5,a5,0xc
    80002260:	4685                	li	a3,1
    80002262:	863e                	mv	a2,a5
    80002264:	4581                	li	a1,0
    80002266:	fb043503          	ld	a0,-80(s0)
    8000226a:	00000097          	auipc	ra,0x0
    8000226e:	ac8080e7          	jalr	-1336(ra) # 80001d32 <uvmunmap>
  return -1;
    80002272:	57fd                	li	a5,-1
}
    80002274:	853e                	mv	a0,a5
    80002276:	60e6                	ld	ra,88(sp)
    80002278:	6446                	ld	s0,80(sp)
    8000227a:	6125                	addi	sp,sp,96
    8000227c:	8082                	ret

000000008000227e <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    8000227e:	7179                	addi	sp,sp,-48
    80002280:	f406                	sd	ra,40(sp)
    80002282:	f022                	sd	s0,32(sp)
    80002284:	1800                	addi	s0,sp,48
    80002286:	fca43c23          	sd	a0,-40(s0)
    8000228a:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8000228e:	4601                	li	a2,0
    80002290:	fd043583          	ld	a1,-48(s0)
    80002294:	fd843503          	ld	a0,-40(s0)
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	810080e7          	jalr	-2032(ra) # 80001aa8 <walk>
    800022a0:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022a4:	fe843783          	ld	a5,-24(s0)
    800022a8:	eb89                	bnez	a5,800022ba <uvmclear+0x3c>
    panic("uvmclear");
    800022aa:	00009517          	auipc	a0,0x9
    800022ae:	eee50513          	addi	a0,a0,-274 # 8000b198 <etext+0x198>
    800022b2:	fffff097          	auipc	ra,0xfffff
    800022b6:	9a0080e7          	jalr	-1632(ra) # 80000c52 <panic>
  *pte &= ~PTE_U;
    800022ba:	fe843783          	ld	a5,-24(s0)
    800022be:	639c                	ld	a5,0(a5)
    800022c0:	fef7f713          	andi	a4,a5,-17
    800022c4:	fe843783          	ld	a5,-24(s0)
    800022c8:	e398                	sd	a4,0(a5)
}
    800022ca:	0001                	nop
    800022cc:	70a2                	ld	ra,40(sp)
    800022ce:	7402                	ld	s0,32(sp)
    800022d0:	6145                	addi	sp,sp,48
    800022d2:	8082                	ret

00000000800022d4 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022d4:	715d                	addi	sp,sp,-80
    800022d6:	e486                	sd	ra,72(sp)
    800022d8:	e0a2                	sd	s0,64(sp)
    800022da:	0880                	addi	s0,sp,80
    800022dc:	fca43423          	sd	a0,-56(s0)
    800022e0:	fcb43023          	sd	a1,-64(s0)
    800022e4:	fac43c23          	sd	a2,-72(s0)
    800022e8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022ec:	a055                	j	80002390 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800022ee:	fc043703          	ld	a4,-64(s0)
    800022f2:	77fd                	lui	a5,0xfffff
    800022f4:	8ff9                	and	a5,a5,a4
    800022f6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800022fa:	fe043583          	ld	a1,-32(s0)
    800022fe:	fc843503          	ld	a0,-56(s0)
    80002302:	00000097          	auipc	ra,0x0
    80002306:	896080e7          	jalr	-1898(ra) # 80001b98 <walkaddr>
    8000230a:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000230e:	fd843783          	ld	a5,-40(s0)
    80002312:	e399                	bnez	a5,80002318 <copyout+0x44>
      return -1;
    80002314:	57fd                	li	a5,-1
    80002316:	a049                	j	80002398 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002318:	fe043703          	ld	a4,-32(s0)
    8000231c:	fc043783          	ld	a5,-64(s0)
    80002320:	8f1d                	sub	a4,a4,a5
    80002322:	6785                	lui	a5,0x1
    80002324:	97ba                	add	a5,a5,a4
    80002326:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000232a:	fe843703          	ld	a4,-24(s0)
    8000232e:	fb043783          	ld	a5,-80(s0)
    80002332:	00e7f663          	bgeu	a5,a4,8000233e <copyout+0x6a>
      n = len;
    80002336:	fb043783          	ld	a5,-80(s0)
    8000233a:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8000233e:	fc043703          	ld	a4,-64(s0)
    80002342:	fe043783          	ld	a5,-32(s0)
    80002346:	8f1d                	sub	a4,a4,a5
    80002348:	fd843783          	ld	a5,-40(s0)
    8000234c:	97ba                	add	a5,a5,a4
    8000234e:	873e                	mv	a4,a5
    80002350:	fe843783          	ld	a5,-24(s0)
    80002354:	2781                	sext.w	a5,a5
    80002356:	863e                	mv	a2,a5
    80002358:	fb843583          	ld	a1,-72(s0)
    8000235c:	853a                	mv	a0,a4
    8000235e:	fffff097          	auipc	ra,0xfffff
    80002362:	1da080e7          	jalr	474(ra) # 80001538 <memmove>

    len -= n;
    80002366:	fb043703          	ld	a4,-80(s0)
    8000236a:	fe843783          	ld	a5,-24(s0)
    8000236e:	40f707b3          	sub	a5,a4,a5
    80002372:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002376:	fb843703          	ld	a4,-72(s0)
    8000237a:	fe843783          	ld	a5,-24(s0)
    8000237e:	97ba                	add	a5,a5,a4
    80002380:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002384:	fe043703          	ld	a4,-32(s0)
    80002388:	6785                	lui	a5,0x1
    8000238a:	97ba                	add	a5,a5,a4
    8000238c:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002390:	fb043783          	ld	a5,-80(s0)
    80002394:	ffa9                	bnez	a5,800022ee <copyout+0x1a>
  }
  return 0;
    80002396:	4781                	li	a5,0
}
    80002398:	853e                	mv	a0,a5
    8000239a:	60a6                	ld	ra,72(sp)
    8000239c:	6406                	ld	s0,64(sp)
    8000239e:	6161                	addi	sp,sp,80
    800023a0:	8082                	ret

00000000800023a2 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023a2:	715d                	addi	sp,sp,-80
    800023a4:	e486                	sd	ra,72(sp)
    800023a6:	e0a2                	sd	s0,64(sp)
    800023a8:	0880                	addi	s0,sp,80
    800023aa:	fca43423          	sd	a0,-56(s0)
    800023ae:	fcb43023          	sd	a1,-64(s0)
    800023b2:	fac43c23          	sd	a2,-72(s0)
    800023b6:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023ba:	a055                	j	8000245e <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023bc:	fb843703          	ld	a4,-72(s0)
    800023c0:	77fd                	lui	a5,0xfffff
    800023c2:	8ff9                	and	a5,a5,a4
    800023c4:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023c8:	fe043583          	ld	a1,-32(s0)
    800023cc:	fc843503          	ld	a0,-56(s0)
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	7c8080e7          	jalr	1992(ra) # 80001b98 <walkaddr>
    800023d8:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023dc:	fd843783          	ld	a5,-40(s0)
    800023e0:	e399                	bnez	a5,800023e6 <copyin+0x44>
      return -1;
    800023e2:	57fd                	li	a5,-1
    800023e4:	a049                	j	80002466 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023e6:	fe043703          	ld	a4,-32(s0)
    800023ea:	fb843783          	ld	a5,-72(s0)
    800023ee:	8f1d                	sub	a4,a4,a5
    800023f0:	6785                	lui	a5,0x1
    800023f2:	97ba                	add	a5,a5,a4
    800023f4:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800023f8:	fe843703          	ld	a4,-24(s0)
    800023fc:	fb043783          	ld	a5,-80(s0)
    80002400:	00e7f663          	bgeu	a5,a4,8000240c <copyin+0x6a>
      n = len;
    80002404:	fb043783          	ld	a5,-80(s0)
    80002408:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000240c:	fb843703          	ld	a4,-72(s0)
    80002410:	fe043783          	ld	a5,-32(s0)
    80002414:	8f1d                	sub	a4,a4,a5
    80002416:	fd843783          	ld	a5,-40(s0)
    8000241a:	97ba                	add	a5,a5,a4
    8000241c:	873e                	mv	a4,a5
    8000241e:	fe843783          	ld	a5,-24(s0)
    80002422:	2781                	sext.w	a5,a5
    80002424:	863e                	mv	a2,a5
    80002426:	85ba                	mv	a1,a4
    80002428:	fc043503          	ld	a0,-64(s0)
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	10c080e7          	jalr	268(ra) # 80001538 <memmove>

    len -= n;
    80002434:	fb043703          	ld	a4,-80(s0)
    80002438:	fe843783          	ld	a5,-24(s0)
    8000243c:	40f707b3          	sub	a5,a4,a5
    80002440:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002444:	fc043703          	ld	a4,-64(s0)
    80002448:	fe843783          	ld	a5,-24(s0)
    8000244c:	97ba                	add	a5,a5,a4
    8000244e:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002452:	fe043703          	ld	a4,-32(s0)
    80002456:	6785                	lui	a5,0x1
    80002458:	97ba                	add	a5,a5,a4
    8000245a:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    8000245e:	fb043783          	ld	a5,-80(s0)
    80002462:	ffa9                	bnez	a5,800023bc <copyin+0x1a>
  }
  return 0;
    80002464:	4781                	li	a5,0
}
    80002466:	853e                	mv	a0,a5
    80002468:	60a6                	ld	ra,72(sp)
    8000246a:	6406                	ld	s0,64(sp)
    8000246c:	6161                	addi	sp,sp,80
    8000246e:	8082                	ret

0000000080002470 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002470:	711d                	addi	sp,sp,-96
    80002472:	ec86                	sd	ra,88(sp)
    80002474:	e8a2                	sd	s0,80(sp)
    80002476:	1080                	addi	s0,sp,96
    80002478:	faa43c23          	sd	a0,-72(s0)
    8000247c:	fab43823          	sd	a1,-80(s0)
    80002480:	fac43423          	sd	a2,-88(s0)
    80002484:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002488:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000248c:	a0f1                	j	80002558 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    8000248e:	fa843703          	ld	a4,-88(s0)
    80002492:	77fd                	lui	a5,0xfffff
    80002494:	8ff9                	and	a5,a5,a4
    80002496:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    8000249a:	fd043583          	ld	a1,-48(s0)
    8000249e:	fb843503          	ld	a0,-72(s0)
    800024a2:	fffff097          	auipc	ra,0xfffff
    800024a6:	6f6080e7          	jalr	1782(ra) # 80001b98 <walkaddr>
    800024aa:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024ae:	fc843783          	ld	a5,-56(s0)
    800024b2:	e399                	bnez	a5,800024b8 <copyinstr+0x48>
      return -1;
    800024b4:	57fd                	li	a5,-1
    800024b6:	a87d                	j	80002574 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024b8:	fd043703          	ld	a4,-48(s0)
    800024bc:	fa843783          	ld	a5,-88(s0)
    800024c0:	8f1d                	sub	a4,a4,a5
    800024c2:	6785                	lui	a5,0x1
    800024c4:	97ba                	add	a5,a5,a4
    800024c6:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024ca:	fe843703          	ld	a4,-24(s0)
    800024ce:	fa043783          	ld	a5,-96(s0)
    800024d2:	00e7f663          	bgeu	a5,a4,800024de <copyinstr+0x6e>
      n = max;
    800024d6:	fa043783          	ld	a5,-96(s0)
    800024da:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024de:	fa843703          	ld	a4,-88(s0)
    800024e2:	fd043783          	ld	a5,-48(s0)
    800024e6:	8f1d                	sub	a4,a4,a5
    800024e8:	fc843783          	ld	a5,-56(s0)
    800024ec:	97ba                	add	a5,a5,a4
    800024ee:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800024f2:	a891                	j	80002546 <copyinstr+0xd6>
      if(*p == '\0'){
    800024f4:	fd843783          	ld	a5,-40(s0)
    800024f8:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800024fc:	eb89                	bnez	a5,8000250e <copyinstr+0x9e>
        *dst = '\0';
    800024fe:	fb043783          	ld	a5,-80(s0)
    80002502:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002506:	4785                	li	a5,1
    80002508:	fef42223          	sw	a5,-28(s0)
        break;
    8000250c:	a081                	j	8000254c <copyinstr+0xdc>
      } else {
        *dst = *p;
    8000250e:	fd843783          	ld	a5,-40(s0)
    80002512:	0007c703          	lbu	a4,0(a5)
    80002516:	fb043783          	ld	a5,-80(s0)
    8000251a:	00e78023          	sb	a4,0(a5)
      }
      --n;
    8000251e:	fe843783          	ld	a5,-24(s0)
    80002522:	17fd                	addi	a5,a5,-1
    80002524:	fef43423          	sd	a5,-24(s0)
      --max;
    80002528:	fa043783          	ld	a5,-96(s0)
    8000252c:	17fd                	addi	a5,a5,-1
    8000252e:	faf43023          	sd	a5,-96(s0)
      p++;
    80002532:	fd843783          	ld	a5,-40(s0)
    80002536:	0785                	addi	a5,a5,1
    80002538:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000253c:	fb043783          	ld	a5,-80(s0)
    80002540:	0785                	addi	a5,a5,1
    80002542:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002546:	fe843783          	ld	a5,-24(s0)
    8000254a:	f7cd                	bnez	a5,800024f4 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000254c:	fd043703          	ld	a4,-48(s0)
    80002550:	6785                	lui	a5,0x1
    80002552:	97ba                	add	a5,a5,a4
    80002554:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002558:	fe442783          	lw	a5,-28(s0)
    8000255c:	2781                	sext.w	a5,a5
    8000255e:	e781                	bnez	a5,80002566 <copyinstr+0xf6>
    80002560:	fa043783          	ld	a5,-96(s0)
    80002564:	f78d                	bnez	a5,8000248e <copyinstr+0x1e>
  }
  if(got_null){
    80002566:	fe442783          	lw	a5,-28(s0)
    8000256a:	2781                	sext.w	a5,a5
    8000256c:	c399                	beqz	a5,80002572 <copyinstr+0x102>
    return 0;
    8000256e:	4781                	li	a5,0
    80002570:	a011                	j	80002574 <copyinstr+0x104>
  } else {
    return -1;
    80002572:	57fd                	li	a5,-1
  }
}
    80002574:	853e                	mv	a0,a5
    80002576:	60e6                	ld	ra,88(sp)
    80002578:	6446                	ld	s0,80(sp)
    8000257a:	6125                	addi	sp,sp,96
    8000257c:	8082                	ret

000000008000257e <r_sstatus>:
{
    8000257e:	1101                	addi	sp,sp,-32
    80002580:	ec22                	sd	s0,24(sp)
    80002582:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002584:	100027f3          	csrr	a5,sstatus
    80002588:	fef43423          	sd	a5,-24(s0)
  return x;
    8000258c:	fe843783          	ld	a5,-24(s0)
}
    80002590:	853e                	mv	a0,a5
    80002592:	6462                	ld	s0,24(sp)
    80002594:	6105                	addi	sp,sp,32
    80002596:	8082                	ret

0000000080002598 <w_sstatus>:
{
    80002598:	1101                	addi	sp,sp,-32
    8000259a:	ec22                	sd	s0,24(sp)
    8000259c:	1000                	addi	s0,sp,32
    8000259e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025a2:	fe843783          	ld	a5,-24(s0)
    800025a6:	10079073          	csrw	sstatus,a5
}
    800025aa:	0001                	nop
    800025ac:	6462                	ld	s0,24(sp)
    800025ae:	6105                	addi	sp,sp,32
    800025b0:	8082                	ret

00000000800025b2 <intr_on>:
{
    800025b2:	1141                	addi	sp,sp,-16
    800025b4:	e406                	sd	ra,8(sp)
    800025b6:	e022                	sd	s0,0(sp)
    800025b8:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025ba:	00000097          	auipc	ra,0x0
    800025be:	fc4080e7          	jalr	-60(ra) # 8000257e <r_sstatus>
    800025c2:	87aa                	mv	a5,a0
    800025c4:	0027e793          	ori	a5,a5,2
    800025c8:	853e                	mv	a0,a5
    800025ca:	00000097          	auipc	ra,0x0
    800025ce:	fce080e7          	jalr	-50(ra) # 80002598 <w_sstatus>
}
    800025d2:	0001                	nop
    800025d4:	60a2                	ld	ra,8(sp)
    800025d6:	6402                	ld	s0,0(sp)
    800025d8:	0141                	addi	sp,sp,16
    800025da:	8082                	ret

00000000800025dc <intr_get>:
{
    800025dc:	1101                	addi	sp,sp,-32
    800025de:	ec06                	sd	ra,24(sp)
    800025e0:	e822                	sd	s0,16(sp)
    800025e2:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025e4:	00000097          	auipc	ra,0x0
    800025e8:	f9a080e7          	jalr	-102(ra) # 8000257e <r_sstatus>
    800025ec:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800025f0:	fe843783          	ld	a5,-24(s0)
    800025f4:	8b89                	andi	a5,a5,2
    800025f6:	00f037b3          	snez	a5,a5
    800025fa:	0ff7f793          	andi	a5,a5,255
    800025fe:	2781                	sext.w	a5,a5
}
    80002600:	853e                	mv	a0,a5
    80002602:	60e2                	ld	ra,24(sp)
    80002604:	6442                	ld	s0,16(sp)
    80002606:	6105                	addi	sp,sp,32
    80002608:	8082                	ret

000000008000260a <r_tp>:
{
    8000260a:	1101                	addi	sp,sp,-32
    8000260c:	ec22                	sd	s0,24(sp)
    8000260e:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002610:	8792                	mv	a5,tp
    80002612:	fef43423          	sd	a5,-24(s0)
  return x;
    80002616:	fe843783          	ld	a5,-24(s0)
}
    8000261a:	853e                	mv	a0,a5
    8000261c:	6462                	ld	s0,24(sp)
    8000261e:	6105                	addi	sp,sp,32
    80002620:	8082                	ret

0000000080002622 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002622:	7139                	addi	sp,sp,-64
    80002624:	fc06                	sd	ra,56(sp)
    80002626:	f822                	sd	s0,48(sp)
    80002628:	0080                	addi	s0,sp,64
    8000262a:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    8000262e:	00012797          	auipc	a5,0x12
    80002632:	06a78793          	addi	a5,a5,106 # 80014698 <proc>
    80002636:	fef43423          	sd	a5,-24(s0)
    8000263a:	a071                	j	800026c6 <proc_mapstacks+0xa4>
    char *pa = kalloc();
    8000263c:	fffff097          	auipc	ra,0xfffff
    80002640:	af0080e7          	jalr	-1296(ra) # 8000112c <kalloc>
    80002644:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002648:	fe043783          	ld	a5,-32(s0)
    8000264c:	eb89                	bnez	a5,8000265e <proc_mapstacks+0x3c>
      panic("kalloc");
    8000264e:	00009517          	auipc	a0,0x9
    80002652:	b5a50513          	addi	a0,a0,-1190 # 8000b1a8 <etext+0x1a8>
    80002656:	ffffe097          	auipc	ra,0xffffe
    8000265a:	5fc080e7          	jalr	1532(ra) # 80000c52 <panic>
    uint64 va = KSTACK((int) (p - proc));
    8000265e:	fe843703          	ld	a4,-24(s0)
    80002662:	00012797          	auipc	a5,0x12
    80002666:	03678793          	addi	a5,a5,54 # 80014698 <proc>
    8000266a:	40f707b3          	sub	a5,a4,a5
    8000266e:	4047d713          	srai	a4,a5,0x4
    80002672:	00009797          	auipc	a5,0x9
    80002676:	c1e78793          	addi	a5,a5,-994 # 8000b290 <etext+0x290>
    8000267a:	639c                	ld	a5,0(a5)
    8000267c:	02f707b3          	mul	a5,a4,a5
    80002680:	2781                	sext.w	a5,a5
    80002682:	2785                	addiw	a5,a5,1
    80002684:	2781                	sext.w	a5,a5
    80002686:	00d7979b          	slliw	a5,a5,0xd
    8000268a:	2781                	sext.w	a5,a5
    8000268c:	873e                	mv	a4,a5
    8000268e:	040007b7          	lui	a5,0x4000
    80002692:	17fd                	addi	a5,a5,-1
    80002694:	07b2                	slli	a5,a5,0xc
    80002696:	8f99                	sub	a5,a5,a4
    80002698:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    8000269c:	fe043783          	ld	a5,-32(s0)
    800026a0:	4719                	li	a4,6
    800026a2:	6685                	lui	a3,0x1
    800026a4:	863e                	mv	a2,a5
    800026a6:	fd843583          	ld	a1,-40(s0)
    800026aa:	fc843503          	ld	a0,-56(s0)
    800026ae:	fffff097          	auipc	ra,0xfffff
    800026b2:	562080e7          	jalr	1378(ra) # 80001c10 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026b6:	fe843703          	ld	a4,-24(s0)
    800026ba:	6785                	lui	a5,0x1
    800026bc:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800026c0:	97ba                	add	a5,a5,a4
    800026c2:	fef43423          	sd	a5,-24(s0)
    800026c6:	fe843703          	ld	a4,-24(s0)
    800026ca:	00061797          	auipc	a5,0x61
    800026ce:	3ce78793          	addi	a5,a5,974 # 80063a98 <pid_lock>
    800026d2:	f6f765e3          	bltu	a4,a5,8000263c <proc_mapstacks+0x1a>
  }
}
    800026d6:	0001                	nop
    800026d8:	0001                	nop
    800026da:	70e2                	ld	ra,56(sp)
    800026dc:	7442                	ld	s0,48(sp)
    800026de:	6121                	addi	sp,sp,64
    800026e0:	8082                	ret

00000000800026e2 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026e2:	1101                	addi	sp,sp,-32
    800026e4:	ec06                	sd	ra,24(sp)
    800026e6:	e822                	sd	s0,16(sp)
    800026e8:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026ea:	00009597          	auipc	a1,0x9
    800026ee:	ac658593          	addi	a1,a1,-1338 # 8000b1b0 <etext+0x1b0>
    800026f2:	00061517          	auipc	a0,0x61
    800026f6:	3a650513          	addi	a0,a0,934 # 80063a98 <pid_lock>
    800026fa:	fffff097          	auipc	ra,0xfffff
    800026fe:	b56080e7          	jalr	-1194(ra) # 80001250 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002702:	00012797          	auipc	a5,0x12
    80002706:	f9678793          	addi	a5,a5,-106 # 80014698 <proc>
    8000270a:	fef43423          	sd	a5,-24(s0)
    8000270e:	a0ad                	j	80002778 <procinit+0x96>
      initlock(&p->lock, "proc");
    80002710:	fe843783          	ld	a5,-24(s0)
    80002714:	00009597          	auipc	a1,0x9
    80002718:	aa458593          	addi	a1,a1,-1372 # 8000b1b8 <etext+0x1b8>
    8000271c:	853e                	mv	a0,a5
    8000271e:	fffff097          	auipc	ra,0xfffff
    80002722:	b32080e7          	jalr	-1230(ra) # 80001250 <initlock>
      p->kstack = KSTACK((int) (p - proc));
    80002726:	fe843703          	ld	a4,-24(s0)
    8000272a:	00012797          	auipc	a5,0x12
    8000272e:	f6e78793          	addi	a5,a5,-146 # 80014698 <proc>
    80002732:	40f707b3          	sub	a5,a4,a5
    80002736:	4047d713          	srai	a4,a5,0x4
    8000273a:	00009797          	auipc	a5,0x9
    8000273e:	b5678793          	addi	a5,a5,-1194 # 8000b290 <etext+0x290>
    80002742:	639c                	ld	a5,0(a5)
    80002744:	02f707b3          	mul	a5,a4,a5
    80002748:	2781                	sext.w	a5,a5
    8000274a:	2785                	addiw	a5,a5,1
    8000274c:	2781                	sext.w	a5,a5
    8000274e:	00d7979b          	slliw	a5,a5,0xd
    80002752:	2781                	sext.w	a5,a5
    80002754:	873e                	mv	a4,a5
    80002756:	040007b7          	lui	a5,0x4000
    8000275a:	17fd                	addi	a5,a5,-1
    8000275c:	07b2                	slli	a5,a5,0xc
    8000275e:	8f99                	sub	a5,a5,a4
    80002760:	873e                	mv	a4,a5
    80002762:	fe843783          	ld	a5,-24(s0)
    80002766:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002768:	fe843703          	ld	a4,-24(s0)
    8000276c:	6785                	lui	a5,0x1
    8000276e:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80002772:	97ba                	add	a5,a5,a4
    80002774:	fef43423          	sd	a5,-24(s0)
    80002778:	fe843703          	ld	a4,-24(s0)
    8000277c:	00061797          	auipc	a5,0x61
    80002780:	31c78793          	addi	a5,a5,796 # 80063a98 <pid_lock>
    80002784:	f8f766e3          	bltu	a4,a5,80002710 <procinit+0x2e>
  }
}
    80002788:	0001                	nop
    8000278a:	0001                	nop
    8000278c:	60e2                	ld	ra,24(sp)
    8000278e:	6442                	ld	s0,16(sp)
    80002790:	6105                	addi	sp,sp,32
    80002792:	8082                	ret

0000000080002794 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002794:	1101                	addi	sp,sp,-32
    80002796:	ec06                	sd	ra,24(sp)
    80002798:	e822                	sd	s0,16(sp)
    8000279a:	1000                	addi	s0,sp,32
  int id = r_tp();
    8000279c:	00000097          	auipc	ra,0x0
    800027a0:	e6e080e7          	jalr	-402(ra) # 8000260a <r_tp>
    800027a4:	87aa                	mv	a5,a0
    800027a6:	fef42623          	sw	a5,-20(s0)
  return id;
    800027aa:	fec42783          	lw	a5,-20(s0)
}
    800027ae:	853e                	mv	a0,a5
    800027b0:	60e2                	ld	ra,24(sp)
    800027b2:	6442                	ld	s0,16(sp)
    800027b4:	6105                	addi	sp,sp,32
    800027b6:	8082                	ret

00000000800027b8 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027b8:	1101                	addi	sp,sp,-32
    800027ba:	ec06                	sd	ra,24(sp)
    800027bc:	e822                	sd	s0,16(sp)
    800027be:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	fd4080e7          	jalr	-44(ra) # 80002794 <cpuid>
    800027c8:	87aa                	mv	a5,a0
    800027ca:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027ce:	fec42783          	lw	a5,-20(s0)
    800027d2:	00779713          	slli	a4,a5,0x7
    800027d6:	00012797          	auipc	a5,0x12
    800027da:	ac278793          	addi	a5,a5,-1342 # 80014298 <cpus>
    800027de:	97ba                	add	a5,a5,a4
    800027e0:	fef43023          	sd	a5,-32(s0)
  return c;
    800027e4:	fe043783          	ld	a5,-32(s0)
}
    800027e8:	853e                	mv	a0,a5
    800027ea:	60e2                	ld	ra,24(sp)
    800027ec:	6442                	ld	s0,16(sp)
    800027ee:	6105                	addi	sp,sp,32
    800027f0:	8082                	ret

00000000800027f2 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    800027f2:	1101                	addi	sp,sp,-32
    800027f4:	ec06                	sd	ra,24(sp)
    800027f6:	e822                	sd	s0,16(sp)
    800027f8:	1000                	addi	s0,sp,32
  push_off();
    800027fa:	fffff097          	auipc	ra,0xfffff
    800027fe:	b84080e7          	jalr	-1148(ra) # 8000137e <push_off>
  struct cpu *c = mycpu();
    80002802:	00000097          	auipc	ra,0x0
    80002806:	fb6080e7          	jalr	-74(ra) # 800027b8 <mycpu>
    8000280a:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    8000280e:	fe843783          	ld	a5,-24(s0)
    80002812:	639c                	ld	a5,0(a5)
    80002814:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	bbe080e7          	jalr	-1090(ra) # 800013d6 <pop_off>
  return p;
    80002820:	fe043783          	ld	a5,-32(s0)
}
    80002824:	853e                	mv	a0,a5
    80002826:	60e2                	ld	ra,24(sp)
    80002828:	6442                	ld	s0,16(sp)
    8000282a:	6105                	addi	sp,sp,32
    8000282c:	8082                	ret

000000008000282e <allocpid>:

int
allocpid() {
    8000282e:	1101                	addi	sp,sp,-32
    80002830:	ec06                	sd	ra,24(sp)
    80002832:	e822                	sd	s0,16(sp)
    80002834:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002836:	00061517          	auipc	a0,0x61
    8000283a:	26250513          	addi	a0,a0,610 # 80063a98 <pid_lock>
    8000283e:	fffff097          	auipc	ra,0xfffff
    80002842:	a42080e7          	jalr	-1470(ra) # 80001280 <acquire>
  pid = nextpid;
    80002846:	00009797          	auipc	a5,0x9
    8000284a:	f0a78793          	addi	a5,a5,-246 # 8000b750 <nextpid>
    8000284e:	439c                	lw	a5,0(a5)
    80002850:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002854:	00009797          	auipc	a5,0x9
    80002858:	efc78793          	addi	a5,a5,-260 # 8000b750 <nextpid>
    8000285c:	439c                	lw	a5,0(a5)
    8000285e:	2785                	addiw	a5,a5,1
    80002860:	0007871b          	sext.w	a4,a5
    80002864:	00009797          	auipc	a5,0x9
    80002868:	eec78793          	addi	a5,a5,-276 # 8000b750 <nextpid>
    8000286c:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    8000286e:	00061517          	auipc	a0,0x61
    80002872:	22a50513          	addi	a0,a0,554 # 80063a98 <pid_lock>
    80002876:	fffff097          	auipc	ra,0xfffff
    8000287a:	a6e080e7          	jalr	-1426(ra) # 800012e4 <release>

  return pid;
    8000287e:	fec42783          	lw	a5,-20(s0)
}
    80002882:	853e                	mv	a0,a5
    80002884:	60e2                	ld	ra,24(sp)
    80002886:	6442                	ld	s0,16(sp)
    80002888:	6105                	addi	sp,sp,32
    8000288a:	8082                	ret

000000008000288c <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    8000288c:	1101                	addi	sp,sp,-32
    8000288e:	ec06                	sd	ra,24(sp)
    80002890:	e822                	sd	s0,16(sp)
    80002892:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002894:	00012797          	auipc	a5,0x12
    80002898:	e0478793          	addi	a5,a5,-508 # 80014698 <proc>
    8000289c:	fef43423          	sd	a5,-24(s0)
    800028a0:	a81d                	j	800028d6 <allocproc+0x4a>
    acquire(&p->lock);
    800028a2:	fe843783          	ld	a5,-24(s0)
    800028a6:	853e                	mv	a0,a5
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	9d8080e7          	jalr	-1576(ra) # 80001280 <acquire>
    if(p->state == UNUSED) {
    800028b0:	fe843783          	ld	a5,-24(s0)
    800028b4:	4f9c                	lw	a5,24(a5)
    800028b6:	cb95                	beqz	a5,800028ea <allocproc+0x5e>
      goto found;
    } else {
      release(&p->lock);
    800028b8:	fe843783          	ld	a5,-24(s0)
    800028bc:	853e                	mv	a0,a5
    800028be:	fffff097          	auipc	ra,0xfffff
    800028c2:	a26080e7          	jalr	-1498(ra) # 800012e4 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028c6:	fe843703          	ld	a4,-24(s0)
    800028ca:	6785                	lui	a5,0x1
    800028cc:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800028d0:	97ba                	add	a5,a5,a4
    800028d2:	fef43423          	sd	a5,-24(s0)
    800028d6:	fe843703          	ld	a4,-24(s0)
    800028da:	00061797          	auipc	a5,0x61
    800028de:	1be78793          	addi	a5,a5,446 # 80063a98 <pid_lock>
    800028e2:	fcf760e3          	bltu	a4,a5,800028a2 <allocproc+0x16>
    }
  }
  return 0;
    800028e6:	4781                	li	a5,0
    800028e8:	aa21                	j	80002a00 <allocproc+0x174>
      goto found;
    800028ea:	0001                	nop

found:
  p->pid = allocpid();
    800028ec:	00000097          	auipc	ra,0x0
    800028f0:	f42080e7          	jalr	-190(ra) # 8000282e <allocpid>
    800028f4:	87aa                	mv	a5,a0
    800028f6:	873e                	mv	a4,a5
    800028f8:	fe843783          	ld	a5,-24(s0)
    800028fc:	df98                	sw	a4,56(a5)

  

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    800028fe:	fffff097          	auipc	ra,0xfffff
    80002902:	82e080e7          	jalr	-2002(ra) # 8000112c <kalloc>
    80002906:	872a                	mv	a4,a0
    80002908:	fe843783          	ld	a5,-24(s0)
    8000290c:	efb8                	sd	a4,88(a5)
    8000290e:	fe843783          	ld	a5,-24(s0)
    80002912:	6fbc                	ld	a5,88(a5)
    80002914:	eb91                	bnez	a5,80002928 <allocproc+0x9c>
    release(&p->lock);
    80002916:	fe843783          	ld	a5,-24(s0)
    8000291a:	853e                	mv	a0,a5
    8000291c:	fffff097          	auipc	ra,0xfffff
    80002920:	9c8080e7          	jalr	-1592(ra) # 800012e4 <release>
    return 0;
    80002924:	4781                	li	a5,0
    80002926:	a8e9                	j	80002a00 <allocproc+0x174>
  }
  for(int i = 0; i < MAX_THRD_NUM; i++){
    80002928:	fe042223          	sw	zero,-28(s0)
    8000292c:	a005                	j	8000294c <allocproc+0xc0>
    p->valid[i] = 1;
    8000292e:	fe843703          	ld	a4,-24(s0)
    80002932:	fe442783          	lw	a5,-28(s0)
    80002936:	05878793          	addi	a5,a5,88
    8000293a:	078a                	slli	a5,a5,0x2
    8000293c:	97ba                	add	a5,a5,a4
    8000293e:	4705                	li	a4,1
    80002940:	c798                	sw	a4,8(a5)
  for(int i = 0; i < MAX_THRD_NUM; i++){
    80002942:	fe442783          	lw	a5,-28(s0)
    80002946:	2785                	addiw	a5,a5,1
    80002948:	fef42223          	sw	a5,-28(s0)
    8000294c:	fe442783          	lw	a5,-28(s0)
    80002950:	0007871b          	sext.w	a4,a5
    80002954:	47bd                	li	a5,15
    80002956:	fce7dce3          	bge	a5,a4,8000292e <allocproc+0xa2>
  }
  p->delay = 0;
    8000295a:	fe843703          	ld	a4,-24(s0)
    8000295e:	6785                	lui	a5,0x1
    80002960:	97ba                	add	a5,a5,a4
    80002962:	3a07a423          	sw	zero,936(a5) # 13a8 <_entry-0x7fffec58>
  p->ticks = -1;
    80002966:	fe843703          	ld	a4,-24(s0)
    8000296a:	6785                	lui	a5,0x1
    8000296c:	97ba                	add	a5,a5,a4
    8000296e:	577d                	li	a4,-1
    80002970:	3ae7a623          	sw	a4,940(a5) # 13ac <_entry-0x7fffec54>
  p->kernal_flag = 0;
    80002974:	fe843703          	ld	a4,-24(s0)
    80002978:	6785                	lui	a5,0x1
    8000297a:	97ba                	add	a5,a5,a4
    8000297c:	3a07aa23          	sw	zero,948(a5) # 13b4 <_entry-0x7fffec4c>
  p->h_flag = 0;
    80002980:	fe843703          	ld	a4,-24(s0)
    80002984:	6785                	lui	a5,0x1
    80002986:	97ba                	add	a5,a5,a4
    80002988:	3a07ac23          	sw	zero,952(a5) # 13b8 <_entry-0x7fffec48>
  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    8000298c:	fe843503          	ld	a0,-24(s0)
    80002990:	00000097          	auipc	ra,0x0
    80002994:	118080e7          	jalr	280(ra) # 80002aa8 <proc_pagetable>
    80002998:	872a                	mv	a4,a0
    8000299a:	fe843783          	ld	a5,-24(s0)
    8000299e:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    800029a0:	fe843783          	ld	a5,-24(s0)
    800029a4:	6bbc                	ld	a5,80(a5)
    800029a6:	e385                	bnez	a5,800029c6 <allocproc+0x13a>
    freeproc(p);
    800029a8:	fe843503          	ld	a0,-24(s0)
    800029ac:	00000097          	auipc	ra,0x0
    800029b0:	05e080e7          	jalr	94(ra) # 80002a0a <freeproc>
    release(&p->lock);
    800029b4:	fe843783          	ld	a5,-24(s0)
    800029b8:	853e                	mv	a0,a5
    800029ba:	fffff097          	auipc	ra,0xfffff
    800029be:	92a080e7          	jalr	-1750(ra) # 800012e4 <release>
    return 0;
    800029c2:	4781                	li	a5,0
    800029c4:	a835                	j	80002a00 <allocproc+0x174>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    800029c6:	fe843783          	ld	a5,-24(s0)
    800029ca:	06078793          	addi	a5,a5,96
    800029ce:	07000613          	li	a2,112
    800029d2:	4581                	li	a1,0
    800029d4:	853e                	mv	a0,a5
    800029d6:	fffff097          	auipc	ra,0xfffff
    800029da:	a7e080e7          	jalr	-1410(ra) # 80001454 <memset>
  p->context.ra = (uint64)forkret;
    800029de:	00001717          	auipc	a4,0x1
    800029e2:	a0c70713          	addi	a4,a4,-1524 # 800033ea <forkret>
    800029e6:	fe843783          	ld	a5,-24(s0)
    800029ea:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029ec:	fe843783          	ld	a5,-24(s0)
    800029f0:	63b8                	ld	a4,64(a5)
    800029f2:	6785                	lui	a5,0x1
    800029f4:	973e                	add	a4,a4,a5
    800029f6:	fe843783          	ld	a5,-24(s0)
    800029fa:	f7b8                	sd	a4,104(a5)

  return p;
    800029fc:	fe843783          	ld	a5,-24(s0)
}
    80002a00:	853e                	mv	a0,a5
    80002a02:	60e2                	ld	ra,24(sp)
    80002a04:	6442                	ld	s0,16(sp)
    80002a06:	6105                	addi	sp,sp,32
    80002a08:	8082                	ret

0000000080002a0a <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002a0a:	1101                	addi	sp,sp,-32
    80002a0c:	ec06                	sd	ra,24(sp)
    80002a0e:	e822                	sd	s0,16(sp)
    80002a10:	1000                	addi	s0,sp,32
    80002a12:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002a16:	fe843783          	ld	a5,-24(s0)
    80002a1a:	6fbc                	ld	a5,88(a5)
    80002a1c:	cb89                	beqz	a5,80002a2e <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002a1e:	fe843783          	ld	a5,-24(s0)
    80002a22:	6fbc                	ld	a5,88(a5)
    80002a24:	853e                	mv	a0,a5
    80002a26:	ffffe097          	auipc	ra,0xffffe
    80002a2a:	662080e7          	jalr	1634(ra) # 80001088 <kfree>
  p->trapframe = 0;
    80002a2e:	fe843783          	ld	a5,-24(s0)
    80002a32:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002a36:	fe843783          	ld	a5,-24(s0)
    80002a3a:	6bbc                	ld	a5,80(a5)
    80002a3c:	cf89                	beqz	a5,80002a56 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a3e:	fe843783          	ld	a5,-24(s0)
    80002a42:	6bb8                	ld	a4,80(a5)
    80002a44:	fe843783          	ld	a5,-24(s0)
    80002a48:	67bc                	ld	a5,72(a5)
    80002a4a:	85be                	mv	a1,a5
    80002a4c:	853a                	mv	a0,a4
    80002a4e:	00000097          	auipc	ra,0x0
    80002a52:	11a080e7          	jalr	282(ra) # 80002b68 <proc_freepagetable>
  p->pagetable = 0;
    80002a56:	fe843783          	ld	a5,-24(s0)
    80002a5a:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002a5e:	fe843783          	ld	a5,-24(s0)
    80002a62:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002a66:	fe843783          	ld	a5,-24(s0)
    80002a6a:	0207ac23          	sw	zero,56(a5)
  p->parent = 0;
    80002a6e:	fe843783          	ld	a5,-24(s0)
    80002a72:	0207b023          	sd	zero,32(a5)
  p->name[0] = 0;
    80002a76:	fe843783          	ld	a5,-24(s0)
    80002a7a:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002a7e:	fe843783          	ld	a5,-24(s0)
    80002a82:	0207b423          	sd	zero,40(a5)
  p->killed = 0;
    80002a86:	fe843783          	ld	a5,-24(s0)
    80002a8a:	0207a823          	sw	zero,48(a5)
  p->xstate = 0;
    80002a8e:	fe843783          	ld	a5,-24(s0)
    80002a92:	0207aa23          	sw	zero,52(a5)
  p->state = UNUSED;
    80002a96:	fe843783          	ld	a5,-24(s0)
    80002a9a:	0007ac23          	sw	zero,24(a5)
}
    80002a9e:	0001                	nop
    80002aa0:	60e2                	ld	ra,24(sp)
    80002aa2:	6442                	ld	s0,16(sp)
    80002aa4:	6105                	addi	sp,sp,32
    80002aa6:	8082                	ret

0000000080002aa8 <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002aa8:	7179                	addi	sp,sp,-48
    80002aaa:	f406                	sd	ra,40(sp)
    80002aac:	f022                	sd	s0,32(sp)
    80002aae:	1800                	addi	s0,sp,48
    80002ab0:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	37e080e7          	jalr	894(ra) # 80001e32 <uvmcreate>
    80002abc:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002ac0:	fe843783          	ld	a5,-24(s0)
    80002ac4:	e399                	bnez	a5,80002aca <proc_pagetable+0x22>
    return 0;
    80002ac6:	4781                	li	a5,0
    80002ac8:	a859                	j	80002b5e <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002aca:	00007797          	auipc	a5,0x7
    80002ace:	53678793          	addi	a5,a5,1334 # 8000a000 <_trampoline>
    80002ad2:	4729                	li	a4,10
    80002ad4:	86be                	mv	a3,a5
    80002ad6:	6605                	lui	a2,0x1
    80002ad8:	040007b7          	lui	a5,0x4000
    80002adc:	17fd                	addi	a5,a5,-1
    80002ade:	00c79593          	slli	a1,a5,0xc
    80002ae2:	fe843503          	ld	a0,-24(s0)
    80002ae6:	fffff097          	auipc	ra,0xfffff
    80002aea:	184080e7          	jalr	388(ra) # 80001c6a <mappages>
    80002aee:	87aa                	mv	a5,a0
    80002af0:	0007db63          	bgez	a5,80002b06 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002af4:	4581                	li	a1,0
    80002af6:	fe843503          	ld	a0,-24(s0)
    80002afa:	fffff097          	auipc	ra,0xfffff
    80002afe:	626080e7          	jalr	1574(ra) # 80002120 <uvmfree>
    return 0;
    80002b02:	4781                	li	a5,0
    80002b04:	a8a9                	j	80002b5e <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002b06:	fd843783          	ld	a5,-40(s0)
    80002b0a:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002b0c:	4719                	li	a4,6
    80002b0e:	86be                	mv	a3,a5
    80002b10:	6605                	lui	a2,0x1
    80002b12:	020007b7          	lui	a5,0x2000
    80002b16:	17fd                	addi	a5,a5,-1
    80002b18:	00d79593          	slli	a1,a5,0xd
    80002b1c:	fe843503          	ld	a0,-24(s0)
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	14a080e7          	jalr	330(ra) # 80001c6a <mappages>
    80002b28:	87aa                	mv	a5,a0
    80002b2a:	0207d863          	bgez	a5,80002b5a <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b2e:	4681                	li	a3,0
    80002b30:	4605                	li	a2,1
    80002b32:	040007b7          	lui	a5,0x4000
    80002b36:	17fd                	addi	a5,a5,-1
    80002b38:	00c79593          	slli	a1,a5,0xc
    80002b3c:	fe843503          	ld	a0,-24(s0)
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	1f2080e7          	jalr	498(ra) # 80001d32 <uvmunmap>
    uvmfree(pagetable, 0);
    80002b48:	4581                	li	a1,0
    80002b4a:	fe843503          	ld	a0,-24(s0)
    80002b4e:	fffff097          	auipc	ra,0xfffff
    80002b52:	5d2080e7          	jalr	1490(ra) # 80002120 <uvmfree>
    return 0;
    80002b56:	4781                	li	a5,0
    80002b58:	a019                	j	80002b5e <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b5a:	fe843783          	ld	a5,-24(s0)
}
    80002b5e:	853e                	mv	a0,a5
    80002b60:	70a2                	ld	ra,40(sp)
    80002b62:	7402                	ld	s0,32(sp)
    80002b64:	6145                	addi	sp,sp,48
    80002b66:	8082                	ret

0000000080002b68 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b68:	1101                	addi	sp,sp,-32
    80002b6a:	ec06                	sd	ra,24(sp)
    80002b6c:	e822                	sd	s0,16(sp)
    80002b6e:	1000                	addi	s0,sp,32
    80002b70:	fea43423          	sd	a0,-24(s0)
    80002b74:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b78:	4681                	li	a3,0
    80002b7a:	4605                	li	a2,1
    80002b7c:	040007b7          	lui	a5,0x4000
    80002b80:	17fd                	addi	a5,a5,-1
    80002b82:	00c79593          	slli	a1,a5,0xc
    80002b86:	fe843503          	ld	a0,-24(s0)
    80002b8a:	fffff097          	auipc	ra,0xfffff
    80002b8e:	1a8080e7          	jalr	424(ra) # 80001d32 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b92:	4681                	li	a3,0
    80002b94:	4605                	li	a2,1
    80002b96:	020007b7          	lui	a5,0x2000
    80002b9a:	17fd                	addi	a5,a5,-1
    80002b9c:	00d79593          	slli	a1,a5,0xd
    80002ba0:	fe843503          	ld	a0,-24(s0)
    80002ba4:	fffff097          	auipc	ra,0xfffff
    80002ba8:	18e080e7          	jalr	398(ra) # 80001d32 <uvmunmap>
  uvmfree(pagetable, sz);
    80002bac:	fe043583          	ld	a1,-32(s0)
    80002bb0:	fe843503          	ld	a0,-24(s0)
    80002bb4:	fffff097          	auipc	ra,0xfffff
    80002bb8:	56c080e7          	jalr	1388(ra) # 80002120 <uvmfree>
}
    80002bbc:	0001                	nop
    80002bbe:	60e2                	ld	ra,24(sp)
    80002bc0:	6442                	ld	s0,16(sp)
    80002bc2:	6105                	addi	sp,sp,32
    80002bc4:	8082                	ret

0000000080002bc6 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002bc6:	1101                	addi	sp,sp,-32
    80002bc8:	ec06                	sd	ra,24(sp)
    80002bca:	e822                	sd	s0,16(sp)
    80002bcc:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002bce:	00000097          	auipc	ra,0x0
    80002bd2:	cbe080e7          	jalr	-834(ra) # 8000288c <allocproc>
    80002bd6:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002bda:	00009797          	auipc	a5,0x9
    80002bde:	43e78793          	addi	a5,a5,1086 # 8000c018 <initproc>
    80002be2:	fe843703          	ld	a4,-24(s0)
    80002be6:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002be8:	fe843783          	ld	a5,-24(s0)
    80002bec:	6bbc                	ld	a5,80(a5)
    80002bee:	03400613          	li	a2,52
    80002bf2:	00009597          	auipc	a1,0x9
    80002bf6:	b8658593          	addi	a1,a1,-1146 # 8000b778 <initcode>
    80002bfa:	853e                	mv	a0,a5
    80002bfc:	fffff097          	auipc	ra,0xfffff
    80002c00:	272080e7          	jalr	626(ra) # 80001e6e <uvminit>
  p->sz = PGSIZE;
    80002c04:	fe843783          	ld	a5,-24(s0)
    80002c08:	6705                	lui	a4,0x1
    80002c0a:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002c0c:	fe843783          	ld	a5,-24(s0)
    80002c10:	6fbc                	ld	a5,88(a5)
    80002c12:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002c16:	fe843783          	ld	a5,-24(s0)
    80002c1a:	6fbc                	ld	a5,88(a5)
    80002c1c:	6705                	lui	a4,0x1
    80002c1e:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	15878793          	addi	a5,a5,344
    80002c28:	4641                	li	a2,16
    80002c2a:	00008597          	auipc	a1,0x8
    80002c2e:	59658593          	addi	a1,a1,1430 # 8000b1c0 <etext+0x1c0>
    80002c32:	853e                	mv	a0,a5
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	b16080e7          	jalr	-1258(ra) # 8000174a <safestrcpy>
  p->cwd = namei("/");
    80002c3c:	00008517          	auipc	a0,0x8
    80002c40:	59450513          	addi	a0,a0,1428 # 8000b1d0 <etext+0x1d0>
    80002c44:	00003097          	auipc	ra,0x3
    80002c48:	354080e7          	jalr	852(ra) # 80005f98 <namei>
    80002c4c:	872a                	mv	a4,a0
    80002c4e:	fe843783          	ld	a5,-24(s0)
    80002c52:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002c56:	fe843783          	ld	a5,-24(s0)
    80002c5a:	4709                	li	a4,2
    80002c5c:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002c5e:	fe843783          	ld	a5,-24(s0)
    80002c62:	853e                	mv	a0,a5
    80002c64:	ffffe097          	auipc	ra,0xffffe
    80002c68:	680080e7          	jalr	1664(ra) # 800012e4 <release>
}
    80002c6c:	0001                	nop
    80002c6e:	60e2                	ld	ra,24(sp)
    80002c70:	6442                	ld	s0,16(sp)
    80002c72:	6105                	addi	sp,sp,32
    80002c74:	8082                	ret

0000000080002c76 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c76:	7179                	addi	sp,sp,-48
    80002c78:	f406                	sd	ra,40(sp)
    80002c7a:	f022                	sd	s0,32(sp)
    80002c7c:	1800                	addi	s0,sp,48
    80002c7e:	87aa                	mv	a5,a0
    80002c80:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002c84:	00000097          	auipc	ra,0x0
    80002c88:	b6e080e7          	jalr	-1170(ra) # 800027f2 <myproc>
    80002c8c:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c90:	fe043783          	ld	a5,-32(s0)
    80002c94:	67bc                	ld	a5,72(a5)
    80002c96:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002c9a:	fdc42783          	lw	a5,-36(s0)
    80002c9e:	2781                	sext.w	a5,a5
    80002ca0:	02f05e63          	blez	a5,80002cdc <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002ca4:	fe043783          	ld	a5,-32(s0)
    80002ca8:	6bb4                	ld	a3,80(a5)
    80002caa:	fec46583          	lwu	a1,-20(s0)
    80002cae:	fdc42783          	lw	a5,-36(s0)
    80002cb2:	fec42703          	lw	a4,-20(s0)
    80002cb6:	9fb9                	addw	a5,a5,a4
    80002cb8:	2781                	sext.w	a5,a5
    80002cba:	1782                	slli	a5,a5,0x20
    80002cbc:	9381                	srli	a5,a5,0x20
    80002cbe:	863e                	mv	a2,a5
    80002cc0:	8536                	mv	a0,a3
    80002cc2:	fffff097          	auipc	ra,0xfffff
    80002cc6:	234080e7          	jalr	564(ra) # 80001ef6 <uvmalloc>
    80002cca:	87aa                	mv	a5,a0
    80002ccc:	fef42623          	sw	a5,-20(s0)
    80002cd0:	fec42783          	lw	a5,-20(s0)
    80002cd4:	2781                	sext.w	a5,a5
    80002cd6:	ef95                	bnez	a5,80002d12 <growproc+0x9c>
      return -1;
    80002cd8:	57fd                	li	a5,-1
    80002cda:	a091                	j	80002d1e <growproc+0xa8>
    }
  } else if(n < 0){
    80002cdc:	fdc42783          	lw	a5,-36(s0)
    80002ce0:	2781                	sext.w	a5,a5
    80002ce2:	0207d863          	bgez	a5,80002d12 <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002ce6:	fe043783          	ld	a5,-32(s0)
    80002cea:	6bb4                	ld	a3,80(a5)
    80002cec:	fec46583          	lwu	a1,-20(s0)
    80002cf0:	fdc42783          	lw	a5,-36(s0)
    80002cf4:	fec42703          	lw	a4,-20(s0)
    80002cf8:	9fb9                	addw	a5,a5,a4
    80002cfa:	2781                	sext.w	a5,a5
    80002cfc:	1782                	slli	a5,a5,0x20
    80002cfe:	9381                	srli	a5,a5,0x20
    80002d00:	863e                	mv	a2,a5
    80002d02:	8536                	mv	a0,a3
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	2d6080e7          	jalr	726(ra) # 80001fda <uvmdealloc>
    80002d0c:	87aa                	mv	a5,a0
    80002d0e:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002d12:	fec46703          	lwu	a4,-20(s0)
    80002d16:	fe043783          	ld	a5,-32(s0)
    80002d1a:	e7b8                	sd	a4,72(a5)
  return 0;
    80002d1c:	4781                	li	a5,0
}
    80002d1e:	853e                	mv	a0,a5
    80002d20:	70a2                	ld	ra,40(sp)
    80002d22:	7402                	ld	s0,32(sp)
    80002d24:	6145                	addi	sp,sp,48
    80002d26:	8082                	ret

0000000080002d28 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002d28:	7179                	addi	sp,sp,-48
    80002d2a:	f406                	sd	ra,40(sp)
    80002d2c:	f022                	sd	s0,32(sp)
    80002d2e:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d30:	00000097          	auipc	ra,0x0
    80002d34:	ac2080e7          	jalr	-1342(ra) # 800027f2 <myproc>
    80002d38:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002d3c:	00000097          	auipc	ra,0x0
    80002d40:	b50080e7          	jalr	-1200(ra) # 8000288c <allocproc>
    80002d44:	fca43c23          	sd	a0,-40(s0)
    80002d48:	fd843783          	ld	a5,-40(s0)
    80002d4c:	e399                	bnez	a5,80002d52 <fork+0x2a>
    return -1;
    80002d4e:	57fd                	li	a5,-1
    80002d50:	a281                	j	80002e90 <fork+0x168>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002d52:	fe043783          	ld	a5,-32(s0)
    80002d56:	6bb8                	ld	a4,80(a5)
    80002d58:	fd843783          	ld	a5,-40(s0)
    80002d5c:	6bb4                	ld	a3,80(a5)
    80002d5e:	fe043783          	ld	a5,-32(s0)
    80002d62:	67bc                	ld	a5,72(a5)
    80002d64:	863e                	mv	a2,a5
    80002d66:	85b6                	mv	a1,a3
    80002d68:	853a                	mv	a0,a4
    80002d6a:	fffff097          	auipc	ra,0xfffff
    80002d6e:	400080e7          	jalr	1024(ra) # 8000216a <uvmcopy>
    80002d72:	87aa                	mv	a5,a0
    80002d74:	0207d163          	bgez	a5,80002d96 <fork+0x6e>
    freeproc(np);
    80002d78:	fd843503          	ld	a0,-40(s0)
    80002d7c:	00000097          	auipc	ra,0x0
    80002d80:	c8e080e7          	jalr	-882(ra) # 80002a0a <freeproc>
    release(&np->lock);
    80002d84:	fd843783          	ld	a5,-40(s0)
    80002d88:	853e                	mv	a0,a5
    80002d8a:	ffffe097          	auipc	ra,0xffffe
    80002d8e:	55a080e7          	jalr	1370(ra) # 800012e4 <release>
    return -1;
    80002d92:	57fd                	li	a5,-1
    80002d94:	a8f5                	j	80002e90 <fork+0x168>
  }
  np->sz = p->sz;
    80002d96:	fe043783          	ld	a5,-32(s0)
    80002d9a:	67b8                	ld	a4,72(a5)
    80002d9c:	fd843783          	ld	a5,-40(s0)
    80002da0:	e7b8                	sd	a4,72(a5)

  np->parent = p;
    80002da2:	fd843783          	ld	a5,-40(s0)
    80002da6:	fe043703          	ld	a4,-32(s0)
    80002daa:	f398                	sd	a4,32(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002dac:	fe043783          	ld	a5,-32(s0)
    80002db0:	6fb8                	ld	a4,88(a5)
    80002db2:	fd843783          	ld	a5,-40(s0)
    80002db6:	6fbc                	ld	a5,88(a5)
    80002db8:	86be                	mv	a3,a5
    80002dba:	12000793          	li	a5,288
    80002dbe:	863e                	mv	a2,a5
    80002dc0:	85ba                	mv	a1,a4
    80002dc2:	8536                	mv	a0,a3
    80002dc4:	fffff097          	auipc	ra,0xfffff
    80002dc8:	842080e7          	jalr	-1982(ra) # 80001606 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002dcc:	fd843783          	ld	a5,-40(s0)
    80002dd0:	6fbc                	ld	a5,88(a5)
    80002dd2:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002dd6:	fe042623          	sw	zero,-20(s0)
    80002dda:	a0a9                	j	80002e24 <fork+0xfc>
    if(p->ofile[i])
    80002ddc:	fe043703          	ld	a4,-32(s0)
    80002de0:	fec42783          	lw	a5,-20(s0)
    80002de4:	07e9                	addi	a5,a5,26
    80002de6:	078e                	slli	a5,a5,0x3
    80002de8:	97ba                	add	a5,a5,a4
    80002dea:	639c                	ld	a5,0(a5)
    80002dec:	c79d                	beqz	a5,80002e1a <fork+0xf2>
      np->ofile[i] = filedup(p->ofile[i]);
    80002dee:	fe043703          	ld	a4,-32(s0)
    80002df2:	fec42783          	lw	a5,-20(s0)
    80002df6:	07e9                	addi	a5,a5,26
    80002df8:	078e                	slli	a5,a5,0x3
    80002dfa:	97ba                	add	a5,a5,a4
    80002dfc:	639c                	ld	a5,0(a5)
    80002dfe:	853e                	mv	a0,a5
    80002e00:	00004097          	auipc	ra,0x4
    80002e04:	b30080e7          	jalr	-1232(ra) # 80006930 <filedup>
    80002e08:	86aa                	mv	a3,a0
    80002e0a:	fd843703          	ld	a4,-40(s0)
    80002e0e:	fec42783          	lw	a5,-20(s0)
    80002e12:	07e9                	addi	a5,a5,26
    80002e14:	078e                	slli	a5,a5,0x3
    80002e16:	97ba                	add	a5,a5,a4
    80002e18:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002e1a:	fec42783          	lw	a5,-20(s0)
    80002e1e:	2785                	addiw	a5,a5,1
    80002e20:	fef42623          	sw	a5,-20(s0)
    80002e24:	fec42783          	lw	a5,-20(s0)
    80002e28:	0007871b          	sext.w	a4,a5
    80002e2c:	47bd                	li	a5,15
    80002e2e:	fae7d7e3          	bge	a5,a4,80002ddc <fork+0xb4>
  np->cwd = idup(p->cwd);
    80002e32:	fe043783          	ld	a5,-32(s0)
    80002e36:	1507b783          	ld	a5,336(a5)
    80002e3a:	853e                	mv	a0,a5
    80002e3c:	00002097          	auipc	ra,0x2
    80002e40:	40c080e7          	jalr	1036(ra) # 80005248 <idup>
    80002e44:	872a                	mv	a4,a0
    80002e46:	fd843783          	ld	a5,-40(s0)
    80002e4a:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002e4e:	fd843783          	ld	a5,-40(s0)
    80002e52:	15878713          	addi	a4,a5,344
    80002e56:	fe043783          	ld	a5,-32(s0)
    80002e5a:	15878793          	addi	a5,a5,344
    80002e5e:	4641                	li	a2,16
    80002e60:	85be                	mv	a1,a5
    80002e62:	853a                	mv	a0,a4
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	8e6080e7          	jalr	-1818(ra) # 8000174a <safestrcpy>

  pid = np->pid;
    80002e6c:	fd843783          	ld	a5,-40(s0)
    80002e70:	5f9c                	lw	a5,56(a5)
    80002e72:	fcf42a23          	sw	a5,-44(s0)

  np->state = RUNNABLE;
    80002e76:	fd843783          	ld	a5,-40(s0)
    80002e7a:	4709                	li	a4,2
    80002e7c:	cf98                	sw	a4,24(a5)

  release(&np->lock);
    80002e7e:	fd843783          	ld	a5,-40(s0)
    80002e82:	853e                	mv	a0,a5
    80002e84:	ffffe097          	auipc	ra,0xffffe
    80002e88:	460080e7          	jalr	1120(ra) # 800012e4 <release>

  return pid;
    80002e8c:	fd442783          	lw	a5,-44(s0)
}
    80002e90:	853e                	mv	a0,a5
    80002e92:	70a2                	ld	ra,40(sp)
    80002e94:	7402                	ld	s0,32(sp)
    80002e96:	6145                	addi	sp,sp,48
    80002e98:	8082                	ret

0000000080002e9a <reparent>:

// Pass p's abandoned children to init.
// Caller must hold p->lock.
void
reparent(struct proc *p)
{
    80002e9a:	7179                	addi	sp,sp,-48
    80002e9c:	f406                	sd	ra,40(sp)
    80002e9e:	f022                	sd	s0,32(sp)
    80002ea0:	1800                	addi	s0,sp,48
    80002ea2:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002ea6:	00011797          	auipc	a5,0x11
    80002eaa:	7f278793          	addi	a5,a5,2034 # 80014698 <proc>
    80002eae:	fef43423          	sd	a5,-24(s0)
    80002eb2:	a0b1                	j	80002efe <reparent+0x64>
    // this code uses pp->parent without holding pp->lock.
    // acquiring the lock first could cause a deadlock
    // if pp or a child of pp were also in exit()
    // and about to try to lock p.
    if(pp->parent == p){
    80002eb4:	fe843783          	ld	a5,-24(s0)
    80002eb8:	739c                	ld	a5,32(a5)
    80002eba:	fd843703          	ld	a4,-40(s0)
    80002ebe:	02f71863          	bne	a4,a5,80002eee <reparent+0x54>
      // pp->parent can't change between the check and the acquire()
      // because only the parent changes it, and we're the parent.
      acquire(&pp->lock);
    80002ec2:	fe843783          	ld	a5,-24(s0)
    80002ec6:	853e                	mv	a0,a5
    80002ec8:	ffffe097          	auipc	ra,0xffffe
    80002ecc:	3b8080e7          	jalr	952(ra) # 80001280 <acquire>
      pp->parent = initproc;
    80002ed0:	00009797          	auipc	a5,0x9
    80002ed4:	14878793          	addi	a5,a5,328 # 8000c018 <initproc>
    80002ed8:	6398                	ld	a4,0(a5)
    80002eda:	fe843783          	ld	a5,-24(s0)
    80002ede:	f398                	sd	a4,32(a5)
      // we should wake up init here, but that would require
      // initproc->lock, which would be a deadlock, since we hold
      // the lock on one of init's children (pp). this is why
      // exit() always wakes init (before acquiring any locks).
      release(&pp->lock);
    80002ee0:	fe843783          	ld	a5,-24(s0)
    80002ee4:	853e                	mv	a0,a5
    80002ee6:	ffffe097          	auipc	ra,0xffffe
    80002eea:	3fe080e7          	jalr	1022(ra) # 800012e4 <release>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002eee:	fe843703          	ld	a4,-24(s0)
    80002ef2:	6785                	lui	a5,0x1
    80002ef4:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80002ef8:	97ba                	add	a5,a5,a4
    80002efa:	fef43423          	sd	a5,-24(s0)
    80002efe:	fe843703          	ld	a4,-24(s0)
    80002f02:	00061797          	auipc	a5,0x61
    80002f06:	b9678793          	addi	a5,a5,-1130 # 80063a98 <pid_lock>
    80002f0a:	faf765e3          	bltu	a4,a5,80002eb4 <reparent+0x1a>
    }
  }
}
    80002f0e:	0001                	nop
    80002f10:	0001                	nop
    80002f12:	70a2                	ld	ra,40(sp)
    80002f14:	7402                	ld	s0,32(sp)
    80002f16:	6145                	addi	sp,sp,48
    80002f18:	8082                	ret

0000000080002f1a <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002f1a:	7139                	addi	sp,sp,-64
    80002f1c:	fc06                	sd	ra,56(sp)
    80002f1e:	f822                	sd	s0,48(sp)
    80002f20:	0080                	addi	s0,sp,64
    80002f22:	87aa                	mv	a5,a0
    80002f24:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002f28:	00000097          	auipc	ra,0x0
    80002f2c:	8ca080e7          	jalr	-1846(ra) # 800027f2 <myproc>
    80002f30:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002f34:	00009797          	auipc	a5,0x9
    80002f38:	0e478793          	addi	a5,a5,228 # 8000c018 <initproc>
    80002f3c:	639c                	ld	a5,0(a5)
    80002f3e:	fe043703          	ld	a4,-32(s0)
    80002f42:	00f71a63          	bne	a4,a5,80002f56 <exit+0x3c>
    panic("init exiting");
    80002f46:	00008517          	auipc	a0,0x8
    80002f4a:	29250513          	addi	a0,a0,658 # 8000b1d8 <etext+0x1d8>
    80002f4e:	ffffe097          	auipc	ra,0xffffe
    80002f52:	d04080e7          	jalr	-764(ra) # 80000c52 <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002f56:	fe042623          	sw	zero,-20(s0)
    80002f5a:	a881                	j	80002faa <exit+0x90>
    if(p->ofile[fd]){
    80002f5c:	fe043703          	ld	a4,-32(s0)
    80002f60:	fec42783          	lw	a5,-20(s0)
    80002f64:	07e9                	addi	a5,a5,26
    80002f66:	078e                	slli	a5,a5,0x3
    80002f68:	97ba                	add	a5,a5,a4
    80002f6a:	639c                	ld	a5,0(a5)
    80002f6c:	cb95                	beqz	a5,80002fa0 <exit+0x86>
      struct file *f = p->ofile[fd];
    80002f6e:	fe043703          	ld	a4,-32(s0)
    80002f72:	fec42783          	lw	a5,-20(s0)
    80002f76:	07e9                	addi	a5,a5,26
    80002f78:	078e                	slli	a5,a5,0x3
    80002f7a:	97ba                	add	a5,a5,a4
    80002f7c:	639c                	ld	a5,0(a5)
    80002f7e:	fcf43823          	sd	a5,-48(s0)
      fileclose(f);
    80002f82:	fd043503          	ld	a0,-48(s0)
    80002f86:	00004097          	auipc	ra,0x4
    80002f8a:	a10080e7          	jalr	-1520(ra) # 80006996 <fileclose>
      p->ofile[fd] = 0;
    80002f8e:	fe043703          	ld	a4,-32(s0)
    80002f92:	fec42783          	lw	a5,-20(s0)
    80002f96:	07e9                	addi	a5,a5,26
    80002f98:	078e                	slli	a5,a5,0x3
    80002f9a:	97ba                	add	a5,a5,a4
    80002f9c:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80002fa0:	fec42783          	lw	a5,-20(s0)
    80002fa4:	2785                	addiw	a5,a5,1
    80002fa6:	fef42623          	sw	a5,-20(s0)
    80002faa:	fec42783          	lw	a5,-20(s0)
    80002fae:	0007871b          	sext.w	a4,a5
    80002fb2:	47bd                	li	a5,15
    80002fb4:	fae7d4e3          	bge	a5,a4,80002f5c <exit+0x42>
    }
  }

  begin_op();
    80002fb8:	00003097          	auipc	ra,0x3
    80002fbc:	344080e7          	jalr	836(ra) # 800062fc <begin_op>
  iput(p->cwd);
    80002fc0:	fe043783          	ld	a5,-32(s0)
    80002fc4:	1507b783          	ld	a5,336(a5)
    80002fc8:	853e                	mv	a0,a5
    80002fca:	00002097          	auipc	ra,0x2
    80002fce:	458080e7          	jalr	1112(ra) # 80005422 <iput>
  end_op();
    80002fd2:	00003097          	auipc	ra,0x3
    80002fd6:	3ec080e7          	jalr	1004(ra) # 800063be <end_op>
  p->cwd = 0;
    80002fda:	fe043783          	ld	a5,-32(s0)
    80002fde:	1407b823          	sd	zero,336(a5)
  // we might re-parent a child to init. we can't be precise about
  // waking up init, since we can't acquire its lock once we've
  // acquired any other proc lock. so wake up init whether that's
  // necessary or not. init may miss this wakeup, but that seems
  // harmless.
  acquire(&initproc->lock);
    80002fe2:	00009797          	auipc	a5,0x9
    80002fe6:	03678793          	addi	a5,a5,54 # 8000c018 <initproc>
    80002fea:	639c                	ld	a5,0(a5)
    80002fec:	853e                	mv	a0,a5
    80002fee:	ffffe097          	auipc	ra,0xffffe
    80002ff2:	292080e7          	jalr	658(ra) # 80001280 <acquire>
  wakeup1(initproc);
    80002ff6:	00009797          	auipc	a5,0x9
    80002ffa:	02278793          	addi	a5,a5,34 # 8000c018 <initproc>
    80002ffe:	639c                	ld	a5,0(a5)
    80003000:	853e                	mv	a0,a5
    80003002:	00000097          	auipc	ra,0x0
    80003006:	552080e7          	jalr	1362(ra) # 80003554 <wakeup1>
  release(&initproc->lock);
    8000300a:	00009797          	auipc	a5,0x9
    8000300e:	00e78793          	addi	a5,a5,14 # 8000c018 <initproc>
    80003012:	639c                	ld	a5,0(a5)
    80003014:	853e                	mv	a0,a5
    80003016:	ffffe097          	auipc	ra,0xffffe
    8000301a:	2ce080e7          	jalr	718(ra) # 800012e4 <release>
  // parent we locked. in case our parent gives us away to init while
  // we're waiting for the parent lock. we may then race with an
  // exiting parent, but the result will be a harmless spurious wakeup
  // to a dead or wrong process; proc structs are never re-allocated
  // as anything else.
  acquire(&p->lock);
    8000301e:	fe043783          	ld	a5,-32(s0)
    80003022:	853e                	mv	a0,a5
    80003024:	ffffe097          	auipc	ra,0xffffe
    80003028:	25c080e7          	jalr	604(ra) # 80001280 <acquire>
  struct proc *original_parent = p->parent;
    8000302c:	fe043783          	ld	a5,-32(s0)
    80003030:	739c                	ld	a5,32(a5)
    80003032:	fcf43c23          	sd	a5,-40(s0)
  release(&p->lock);
    80003036:	fe043783          	ld	a5,-32(s0)
    8000303a:	853e                	mv	a0,a5
    8000303c:	ffffe097          	auipc	ra,0xffffe
    80003040:	2a8080e7          	jalr	680(ra) # 800012e4 <release>
  
  // we need the parent's lock in order to wake it up from wait().
  // the parent-then-child rule says we have to lock it first.
  acquire(&original_parent->lock);
    80003044:	fd843783          	ld	a5,-40(s0)
    80003048:	853e                	mv	a0,a5
    8000304a:	ffffe097          	auipc	ra,0xffffe
    8000304e:	236080e7          	jalr	566(ra) # 80001280 <acquire>

  acquire(&p->lock);
    80003052:	fe043783          	ld	a5,-32(s0)
    80003056:	853e                	mv	a0,a5
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	228080e7          	jalr	552(ra) # 80001280 <acquire>

  // Give any children to init.
  reparent(p);
    80003060:	fe043503          	ld	a0,-32(s0)
    80003064:	00000097          	auipc	ra,0x0
    80003068:	e36080e7          	jalr	-458(ra) # 80002e9a <reparent>

  // Parent might be sleeping in wait().
  wakeup1(original_parent);
    8000306c:	fd843503          	ld	a0,-40(s0)
    80003070:	00000097          	auipc	ra,0x0
    80003074:	4e4080e7          	jalr	1252(ra) # 80003554 <wakeup1>

  p->xstate = status;
    80003078:	fe043783          	ld	a5,-32(s0)
    8000307c:	fcc42703          	lw	a4,-52(s0)
    80003080:	dbd8                	sw	a4,52(a5)
  p->state = ZOMBIE;
    80003082:	fe043783          	ld	a5,-32(s0)
    80003086:	4711                	li	a4,4
    80003088:	cf98                	sw	a4,24(a5)

  release(&original_parent->lock);
    8000308a:	fd843783          	ld	a5,-40(s0)
    8000308e:	853e                	mv	a0,a5
    80003090:	ffffe097          	auipc	ra,0xffffe
    80003094:	254080e7          	jalr	596(ra) # 800012e4 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	226080e7          	jalr	550(ra) # 800032be <sched>
  panic("zombie exit");
    800030a0:	00008517          	auipc	a0,0x8
    800030a4:	14850513          	addi	a0,a0,328 # 8000b1e8 <etext+0x1e8>
    800030a8:	ffffe097          	auipc	ra,0xffffe
    800030ac:	baa080e7          	jalr	-1110(ra) # 80000c52 <panic>

00000000800030b0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800030b0:	7139                	addi	sp,sp,-64
    800030b2:	fc06                	sd	ra,56(sp)
    800030b4:	f822                	sd	s0,48(sp)
    800030b6:	0080                	addi	s0,sp,64
    800030b8:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    800030bc:	fffff097          	auipc	ra,0xfffff
    800030c0:	736080e7          	jalr	1846(ra) # 800027f2 <myproc>
    800030c4:	fca43c23          	sd	a0,-40(s0)

  // hold p->lock for the whole time to avoid lost
  // wakeups from a child's exit().
  acquire(&p->lock);
    800030c8:	fd843783          	ld	a5,-40(s0)
    800030cc:	853e                	mv	a0,a5
    800030ce:	ffffe097          	auipc	ra,0xffffe
    800030d2:	1b2080e7          	jalr	434(ra) # 80001280 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800030d6:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    800030da:	00011797          	auipc	a5,0x11
    800030de:	5be78793          	addi	a5,a5,1470 # 80014698 <proc>
    800030e2:	fef43423          	sd	a5,-24(s0)
    800030e6:	a8d1                	j	800031ba <wait+0x10a>
      // this code uses np->parent without holding np->lock.
      // acquiring the lock first would cause a deadlock,
      // since np might be an ancestor, and we already hold p->lock.
      if(np->parent == p){
    800030e8:	fe843783          	ld	a5,-24(s0)
    800030ec:	739c                	ld	a5,32(a5)
    800030ee:	fd843703          	ld	a4,-40(s0)
    800030f2:	0af71c63          	bne	a4,a5,800031aa <wait+0xfa>
        // np->parent can't change between the check and the acquire()
        // because only the parent changes it, and we're the parent.
        acquire(&np->lock);
    800030f6:	fe843783          	ld	a5,-24(s0)
    800030fa:	853e                	mv	a0,a5
    800030fc:	ffffe097          	auipc	ra,0xffffe
    80003100:	184080e7          	jalr	388(ra) # 80001280 <acquire>
        havekids = 1;
    80003104:	4785                	li	a5,1
    80003106:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    8000310a:	fe843783          	ld	a5,-24(s0)
    8000310e:	4f9c                	lw	a5,24(a5)
    80003110:	873e                	mv	a4,a5
    80003112:	4791                	li	a5,4
    80003114:	08f71463          	bne	a4,a5,8000319c <wait+0xec>
          // Found one.
          pid = np->pid;
    80003118:	fe843783          	ld	a5,-24(s0)
    8000311c:	5f9c                	lw	a5,56(a5)
    8000311e:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    80003122:	fc843783          	ld	a5,-56(s0)
    80003126:	c7a1                	beqz	a5,8000316e <wait+0xbe>
    80003128:	fd843783          	ld	a5,-40(s0)
    8000312c:	6bb8                	ld	a4,80(a5)
    8000312e:	fe843783          	ld	a5,-24(s0)
    80003132:	03478793          	addi	a5,a5,52
    80003136:	4691                	li	a3,4
    80003138:	863e                	mv	a2,a5
    8000313a:	fc843583          	ld	a1,-56(s0)
    8000313e:	853a                	mv	a0,a4
    80003140:	fffff097          	auipc	ra,0xfffff
    80003144:	194080e7          	jalr	404(ra) # 800022d4 <copyout>
    80003148:	87aa                	mv	a5,a0
    8000314a:	0207d263          	bgez	a5,8000316e <wait+0xbe>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    8000314e:	fe843783          	ld	a5,-24(s0)
    80003152:	853e                	mv	a0,a5
    80003154:	ffffe097          	auipc	ra,0xffffe
    80003158:	190080e7          	jalr	400(ra) # 800012e4 <release>
            release(&p->lock);
    8000315c:	fd843783          	ld	a5,-40(s0)
    80003160:	853e                	mv	a0,a5
    80003162:	ffffe097          	auipc	ra,0xffffe
    80003166:	182080e7          	jalr	386(ra) # 800012e4 <release>
            return -1;
    8000316a:	57fd                	li	a5,-1
    8000316c:	a851                	j	80003200 <wait+0x150>
          }
          freeproc(np);
    8000316e:	fe843503          	ld	a0,-24(s0)
    80003172:	00000097          	auipc	ra,0x0
    80003176:	898080e7          	jalr	-1896(ra) # 80002a0a <freeproc>
          release(&np->lock);
    8000317a:	fe843783          	ld	a5,-24(s0)
    8000317e:	853e                	mv	a0,a5
    80003180:	ffffe097          	auipc	ra,0xffffe
    80003184:	164080e7          	jalr	356(ra) # 800012e4 <release>
          release(&p->lock);
    80003188:	fd843783          	ld	a5,-40(s0)
    8000318c:	853e                	mv	a0,a5
    8000318e:	ffffe097          	auipc	ra,0xffffe
    80003192:	156080e7          	jalr	342(ra) # 800012e4 <release>
          return pid;
    80003196:	fd442783          	lw	a5,-44(s0)
    8000319a:	a09d                	j	80003200 <wait+0x150>
        }
        release(&np->lock);
    8000319c:	fe843783          	ld	a5,-24(s0)
    800031a0:	853e                	mv	a0,a5
    800031a2:	ffffe097          	auipc	ra,0xffffe
    800031a6:	142080e7          	jalr	322(ra) # 800012e4 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    800031aa:	fe843703          	ld	a4,-24(s0)
    800031ae:	6785                	lui	a5,0x1
    800031b0:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800031b4:	97ba                	add	a5,a5,a4
    800031b6:	fef43423          	sd	a5,-24(s0)
    800031ba:	fe843703          	ld	a4,-24(s0)
    800031be:	00061797          	auipc	a5,0x61
    800031c2:	8da78793          	addi	a5,a5,-1830 # 80063a98 <pid_lock>
    800031c6:	f2f761e3          	bltu	a4,a5,800030e8 <wait+0x38>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    800031ca:	fe442783          	lw	a5,-28(s0)
    800031ce:	2781                	sext.w	a5,a5
    800031d0:	c789                	beqz	a5,800031da <wait+0x12a>
    800031d2:	fd843783          	ld	a5,-40(s0)
    800031d6:	5b9c                	lw	a5,48(a5)
    800031d8:	cb91                	beqz	a5,800031ec <wait+0x13c>
      release(&p->lock);
    800031da:	fd843783          	ld	a5,-40(s0)
    800031de:	853e                	mv	a0,a5
    800031e0:	ffffe097          	auipc	ra,0xffffe
    800031e4:	104080e7          	jalr	260(ra) # 800012e4 <release>
      return -1;
    800031e8:	57fd                	li	a5,-1
    800031ea:	a819                	j	80003200 <wait+0x150>
    }
    
    // Wait for a child to exit.
    sleep(p, &p->lock);  //DOC: wait-sleep
    800031ec:	fd843783          	ld	a5,-40(s0)
    800031f0:	85be                	mv	a1,a5
    800031f2:	fd843503          	ld	a0,-40(s0)
    800031f6:	00000097          	auipc	ra,0x0
    800031fa:	244080e7          	jalr	580(ra) # 8000343a <sleep>
    havekids = 0;
    800031fe:	bde1                	j	800030d6 <wait+0x26>
  }
}
    80003200:	853e                	mv	a0,a5
    80003202:	70e2                	ld	ra,56(sp)
    80003204:	7442                	ld	s0,48(sp)
    80003206:	6121                	addi	sp,sp,64
    80003208:	8082                	ret

000000008000320a <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000320a:	1101                	addi	sp,sp,-32
    8000320c:	ec06                	sd	ra,24(sp)
    8000320e:	e822                	sd	s0,16(sp)
    80003210:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003212:	fffff097          	auipc	ra,0xfffff
    80003216:	5a6080e7          	jalr	1446(ra) # 800027b8 <mycpu>
    8000321a:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    8000321e:	fe043783          	ld	a5,-32(s0)
    80003222:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003226:	fffff097          	auipc	ra,0xfffff
    8000322a:	38c080e7          	jalr	908(ra) # 800025b2 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    8000322e:	00011797          	auipc	a5,0x11
    80003232:	46a78793          	addi	a5,a5,1130 # 80014698 <proc>
    80003236:	fef43423          	sd	a5,-24(s0)
    8000323a:	a88d                	j	800032ac <scheduler+0xa2>
      acquire(&p->lock);
    8000323c:	fe843783          	ld	a5,-24(s0)
    80003240:	853e                	mv	a0,a5
    80003242:	ffffe097          	auipc	ra,0xffffe
    80003246:	03e080e7          	jalr	62(ra) # 80001280 <acquire>
      if(p->state == RUNNABLE) {
    8000324a:	fe843783          	ld	a5,-24(s0)
    8000324e:	4f9c                	lw	a5,24(a5)
    80003250:	873e                	mv	a4,a5
    80003252:	4789                	li	a5,2
    80003254:	02f71d63          	bne	a4,a5,8000328e <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    80003258:	fe843783          	ld	a5,-24(s0)
    8000325c:	470d                	li	a4,3
    8000325e:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003260:	fe043783          	ld	a5,-32(s0)
    80003264:	fe843703          	ld	a4,-24(s0)
    80003268:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000326a:	fe043783          	ld	a5,-32(s0)
    8000326e:	00878713          	addi	a4,a5,8
    80003272:	fe843783          	ld	a5,-24(s0)
    80003276:	06078793          	addi	a5,a5,96
    8000327a:	85be                	mv	a1,a5
    8000327c:	853a                	mv	a0,a4
    8000327e:	00000097          	auipc	ra,0x0
    80003282:	5a4080e7          	jalr	1444(ra) # 80003822 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003286:	fe043783          	ld	a5,-32(s0)
    8000328a:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    8000328e:	fe843783          	ld	a5,-24(s0)
    80003292:	853e                	mv	a0,a5
    80003294:	ffffe097          	auipc	ra,0xffffe
    80003298:	050080e7          	jalr	80(ra) # 800012e4 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8000329c:	fe843703          	ld	a4,-24(s0)
    800032a0:	6785                	lui	a5,0x1
    800032a2:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    800032a6:	97ba                	add	a5,a5,a4
    800032a8:	fef43423          	sd	a5,-24(s0)
    800032ac:	fe843703          	ld	a4,-24(s0)
    800032b0:	00060797          	auipc	a5,0x60
    800032b4:	7e878793          	addi	a5,a5,2024 # 80063a98 <pid_lock>
    800032b8:	f8f762e3          	bltu	a4,a5,8000323c <scheduler+0x32>
    intr_on();
    800032bc:	b7ad                	j	80003226 <scheduler+0x1c>

00000000800032be <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800032be:	7179                	addi	sp,sp,-48
    800032c0:	f406                	sd	ra,40(sp)
    800032c2:	f022                	sd	s0,32(sp)
    800032c4:	ec26                	sd	s1,24(sp)
    800032c6:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800032c8:	fffff097          	auipc	ra,0xfffff
    800032cc:	52a080e7          	jalr	1322(ra) # 800027f2 <myproc>
    800032d0:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800032d4:	fd843783          	ld	a5,-40(s0)
    800032d8:	853e                	mv	a0,a5
    800032da:	ffffe097          	auipc	ra,0xffffe
    800032de:	060080e7          	jalr	96(ra) # 8000133a <holding>
    800032e2:	87aa                	mv	a5,a0
    800032e4:	eb89                	bnez	a5,800032f6 <sched+0x38>
    panic("sched p->lock");
    800032e6:	00008517          	auipc	a0,0x8
    800032ea:	f1250513          	addi	a0,a0,-238 # 8000b1f8 <etext+0x1f8>
    800032ee:	ffffe097          	auipc	ra,0xffffe
    800032f2:	964080e7          	jalr	-1692(ra) # 80000c52 <panic>
  if(mycpu()->noff != 1)
    800032f6:	fffff097          	auipc	ra,0xfffff
    800032fa:	4c2080e7          	jalr	1218(ra) # 800027b8 <mycpu>
    800032fe:	87aa                	mv	a5,a0
    80003300:	5fbc                	lw	a5,120(a5)
    80003302:	873e                	mv	a4,a5
    80003304:	4785                	li	a5,1
    80003306:	00f70a63          	beq	a4,a5,8000331a <sched+0x5c>
    panic("sched locks");
    8000330a:	00008517          	auipc	a0,0x8
    8000330e:	efe50513          	addi	a0,a0,-258 # 8000b208 <etext+0x208>
    80003312:	ffffe097          	auipc	ra,0xffffe
    80003316:	940080e7          	jalr	-1728(ra) # 80000c52 <panic>
  if(p->state == RUNNING)
    8000331a:	fd843783          	ld	a5,-40(s0)
    8000331e:	4f9c                	lw	a5,24(a5)
    80003320:	873e                	mv	a4,a5
    80003322:	478d                	li	a5,3
    80003324:	00f71a63          	bne	a4,a5,80003338 <sched+0x7a>
    panic("sched running");
    80003328:	00008517          	auipc	a0,0x8
    8000332c:	ef050513          	addi	a0,a0,-272 # 8000b218 <etext+0x218>
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	922080e7          	jalr	-1758(ra) # 80000c52 <panic>
  if(intr_get())
    80003338:	fffff097          	auipc	ra,0xfffff
    8000333c:	2a4080e7          	jalr	676(ra) # 800025dc <intr_get>
    80003340:	87aa                	mv	a5,a0
    80003342:	cb89                	beqz	a5,80003354 <sched+0x96>
    panic("sched interruptible");
    80003344:	00008517          	auipc	a0,0x8
    80003348:	ee450513          	addi	a0,a0,-284 # 8000b228 <etext+0x228>
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	906080e7          	jalr	-1786(ra) # 80000c52 <panic>

  intena = mycpu()->intena;
    80003354:	fffff097          	auipc	ra,0xfffff
    80003358:	464080e7          	jalr	1124(ra) # 800027b8 <mycpu>
    8000335c:	87aa                	mv	a5,a0
    8000335e:	5ffc                	lw	a5,124(a5)
    80003360:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003364:	fd843783          	ld	a5,-40(s0)
    80003368:	06078493          	addi	s1,a5,96
    8000336c:	fffff097          	auipc	ra,0xfffff
    80003370:	44c080e7          	jalr	1100(ra) # 800027b8 <mycpu>
    80003374:	87aa                	mv	a5,a0
    80003376:	07a1                	addi	a5,a5,8
    80003378:	85be                	mv	a1,a5
    8000337a:	8526                	mv	a0,s1
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	4a6080e7          	jalr	1190(ra) # 80003822 <swtch>
  mycpu()->intena = intena;
    80003384:	fffff097          	auipc	ra,0xfffff
    80003388:	434080e7          	jalr	1076(ra) # 800027b8 <mycpu>
    8000338c:	872a                	mv	a4,a0
    8000338e:	fd442783          	lw	a5,-44(s0)
    80003392:	df7c                	sw	a5,124(a4)
}
    80003394:	0001                	nop
    80003396:	70a2                	ld	ra,40(sp)
    80003398:	7402                	ld	s0,32(sp)
    8000339a:	64e2                	ld	s1,24(sp)
    8000339c:	6145                	addi	sp,sp,48
    8000339e:	8082                	ret

00000000800033a0 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800033a0:	1101                	addi	sp,sp,-32
    800033a2:	ec06                	sd	ra,24(sp)
    800033a4:	e822                	sd	s0,16(sp)
    800033a6:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800033a8:	fffff097          	auipc	ra,0xfffff
    800033ac:	44a080e7          	jalr	1098(ra) # 800027f2 <myproc>
    800033b0:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800033b4:	fe843783          	ld	a5,-24(s0)
    800033b8:	853e                	mv	a0,a5
    800033ba:	ffffe097          	auipc	ra,0xffffe
    800033be:	ec6080e7          	jalr	-314(ra) # 80001280 <acquire>
  p->state = RUNNABLE;
    800033c2:	fe843783          	ld	a5,-24(s0)
    800033c6:	4709                	li	a4,2
    800033c8:	cf98                	sw	a4,24(a5)
  sched();
    800033ca:	00000097          	auipc	ra,0x0
    800033ce:	ef4080e7          	jalr	-268(ra) # 800032be <sched>
  release(&p->lock);
    800033d2:	fe843783          	ld	a5,-24(s0)
    800033d6:	853e                	mv	a0,a5
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	f0c080e7          	jalr	-244(ra) # 800012e4 <release>
}
    800033e0:	0001                	nop
    800033e2:	60e2                	ld	ra,24(sp)
    800033e4:	6442                	ld	s0,16(sp)
    800033e6:	6105                	addi	sp,sp,32
    800033e8:	8082                	ret

00000000800033ea <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800033ea:	1141                	addi	sp,sp,-16
    800033ec:	e406                	sd	ra,8(sp)
    800033ee:	e022                	sd	s0,0(sp)
    800033f0:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800033f2:	fffff097          	auipc	ra,0xfffff
    800033f6:	400080e7          	jalr	1024(ra) # 800027f2 <myproc>
    800033fa:	87aa                	mv	a5,a0
    800033fc:	853e                	mv	a0,a5
    800033fe:	ffffe097          	auipc	ra,0xffffe
    80003402:	ee6080e7          	jalr	-282(ra) # 800012e4 <release>

  if (first) {
    80003406:	00008797          	auipc	a5,0x8
    8000340a:	34e78793          	addi	a5,a5,846 # 8000b754 <first.1>
    8000340e:	439c                	lw	a5,0(a5)
    80003410:	cf81                	beqz	a5,80003428 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003412:	00008797          	auipc	a5,0x8
    80003416:	34278793          	addi	a5,a5,834 # 8000b754 <first.1>
    8000341a:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000341e:	4505                	li	a0,1
    80003420:	00001097          	auipc	ra,0x1
    80003424:	702080e7          	jalr	1794(ra) # 80004b22 <fsinit>
  }

  usertrapret();
    80003428:	00001097          	auipc	ra,0x1
    8000342c:	862080e7          	jalr	-1950(ra) # 80003c8a <usertrapret>
}
    80003430:	0001                	nop
    80003432:	60a2                	ld	ra,8(sp)
    80003434:	6402                	ld	s0,0(sp)
    80003436:	0141                	addi	sp,sp,16
    80003438:	8082                	ret

000000008000343a <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    8000343a:	7179                	addi	sp,sp,-48
    8000343c:	f406                	sd	ra,40(sp)
    8000343e:	f022                	sd	s0,32(sp)
    80003440:	1800                	addi	s0,sp,48
    80003442:	fca43c23          	sd	a0,-40(s0)
    80003446:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000344a:	fffff097          	auipc	ra,0xfffff
    8000344e:	3a8080e7          	jalr	936(ra) # 800027f2 <myproc>
    80003452:	fea43423          	sd	a0,-24(s0)
  // change p->state and then call sched.
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.
  if(lk != &p->lock){  //DOC: sleeplock0
    80003456:	fe843783          	ld	a5,-24(s0)
    8000345a:	fd043703          	ld	a4,-48(s0)
    8000345e:	00f70f63          	beq	a4,a5,8000347c <sleep+0x42>
    acquire(&p->lock);  //DOC: sleeplock1
    80003462:	fe843783          	ld	a5,-24(s0)
    80003466:	853e                	mv	a0,a5
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	e18080e7          	jalr	-488(ra) # 80001280 <acquire>
    release(lk);
    80003470:	fd043503          	ld	a0,-48(s0)
    80003474:	ffffe097          	auipc	ra,0xffffe
    80003478:	e70080e7          	jalr	-400(ra) # 800012e4 <release>
  }

  // Go to sleep.
  p->chan = chan;
    8000347c:	fe843783          	ld	a5,-24(s0)
    80003480:	fd843703          	ld	a4,-40(s0)
    80003484:	f798                	sd	a4,40(a5)
  p->state = SLEEPING;
    80003486:	fe843783          	ld	a5,-24(s0)
    8000348a:	4705                	li	a4,1
    8000348c:	cf98                	sw	a4,24(a5)

  sched();
    8000348e:	00000097          	auipc	ra,0x0
    80003492:	e30080e7          	jalr	-464(ra) # 800032be <sched>

  // Tidy up.
  p->chan = 0;
    80003496:	fe843783          	ld	a5,-24(s0)
    8000349a:	0207b423          	sd	zero,40(a5)

  // Reacquire original lock.
  if(lk != &p->lock){
    8000349e:	fe843783          	ld	a5,-24(s0)
    800034a2:	fd043703          	ld	a4,-48(s0)
    800034a6:	00f70f63          	beq	a4,a5,800034c4 <sleep+0x8a>
    release(&p->lock);
    800034aa:	fe843783          	ld	a5,-24(s0)
    800034ae:	853e                	mv	a0,a5
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	e34080e7          	jalr	-460(ra) # 800012e4 <release>
    acquire(lk);
    800034b8:	fd043503          	ld	a0,-48(s0)
    800034bc:	ffffe097          	auipc	ra,0xffffe
    800034c0:	dc4080e7          	jalr	-572(ra) # 80001280 <acquire>
  }
}
    800034c4:	0001                	nop
    800034c6:	70a2                	ld	ra,40(sp)
    800034c8:	7402                	ld	s0,32(sp)
    800034ca:	6145                	addi	sp,sp,48
    800034cc:	8082                	ret

00000000800034ce <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800034ce:	7179                	addi	sp,sp,-48
    800034d0:	f406                	sd	ra,40(sp)
    800034d2:	f022                	sd	s0,32(sp)
    800034d4:	1800                	addi	s0,sp,48
    800034d6:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800034da:	00011797          	auipc	a5,0x11
    800034de:	1be78793          	addi	a5,a5,446 # 80014698 <proc>
    800034e2:	fef43423          	sd	a5,-24(s0)
    800034e6:	a889                	j	80003538 <wakeup+0x6a>
    acquire(&p->lock);
    800034e8:	fe843783          	ld	a5,-24(s0)
    800034ec:	853e                	mv	a0,a5
    800034ee:	ffffe097          	auipc	ra,0xffffe
    800034f2:	d92080e7          	jalr	-622(ra) # 80001280 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    800034f6:	fe843783          	ld	a5,-24(s0)
    800034fa:	4f9c                	lw	a5,24(a5)
    800034fc:	873e                	mv	a4,a5
    800034fe:	4785                	li	a5,1
    80003500:	00f71d63          	bne	a4,a5,8000351a <wakeup+0x4c>
    80003504:	fe843783          	ld	a5,-24(s0)
    80003508:	779c                	ld	a5,40(a5)
    8000350a:	fd843703          	ld	a4,-40(s0)
    8000350e:	00f71663          	bne	a4,a5,8000351a <wakeup+0x4c>
      p->state = RUNNABLE;
    80003512:	fe843783          	ld	a5,-24(s0)
    80003516:	4709                	li	a4,2
    80003518:	cf98                	sw	a4,24(a5)
    }
    release(&p->lock);
    8000351a:	fe843783          	ld	a5,-24(s0)
    8000351e:	853e                	mv	a0,a5
    80003520:	ffffe097          	auipc	ra,0xffffe
    80003524:	dc4080e7          	jalr	-572(ra) # 800012e4 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003528:	fe843703          	ld	a4,-24(s0)
    8000352c:	6785                	lui	a5,0x1
    8000352e:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80003532:	97ba                	add	a5,a5,a4
    80003534:	fef43423          	sd	a5,-24(s0)
    80003538:	fe843703          	ld	a4,-24(s0)
    8000353c:	00060797          	auipc	a5,0x60
    80003540:	55c78793          	addi	a5,a5,1372 # 80063a98 <pid_lock>
    80003544:	faf762e3          	bltu	a4,a5,800034e8 <wakeup+0x1a>
  }
}
    80003548:	0001                	nop
    8000354a:	0001                	nop
    8000354c:	70a2                	ld	ra,40(sp)
    8000354e:	7402                	ld	s0,32(sp)
    80003550:	6145                	addi	sp,sp,48
    80003552:	8082                	ret

0000000080003554 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    80003554:	1101                	addi	sp,sp,-32
    80003556:	ec06                	sd	ra,24(sp)
    80003558:	e822                	sd	s0,16(sp)
    8000355a:	1000                	addi	s0,sp,32
    8000355c:	fea43423          	sd	a0,-24(s0)
  if(!holding(&p->lock))
    80003560:	fe843783          	ld	a5,-24(s0)
    80003564:	853e                	mv	a0,a5
    80003566:	ffffe097          	auipc	ra,0xffffe
    8000356a:	dd4080e7          	jalr	-556(ra) # 8000133a <holding>
    8000356e:	87aa                	mv	a5,a0
    80003570:	eb89                	bnez	a5,80003582 <wakeup1+0x2e>
    panic("wakeup1");
    80003572:	00008517          	auipc	a0,0x8
    80003576:	cce50513          	addi	a0,a0,-818 # 8000b240 <etext+0x240>
    8000357a:	ffffd097          	auipc	ra,0xffffd
    8000357e:	6d8080e7          	jalr	1752(ra) # 80000c52 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    80003582:	fe843783          	ld	a5,-24(s0)
    80003586:	779c                	ld	a5,40(a5)
    80003588:	fe843703          	ld	a4,-24(s0)
    8000358c:	00f71d63          	bne	a4,a5,800035a6 <wakeup1+0x52>
    80003590:	fe843783          	ld	a5,-24(s0)
    80003594:	4f9c                	lw	a5,24(a5)
    80003596:	873e                	mv	a4,a5
    80003598:	4785                	li	a5,1
    8000359a:	00f71663          	bne	a4,a5,800035a6 <wakeup1+0x52>
    p->state = RUNNABLE;
    8000359e:	fe843783          	ld	a5,-24(s0)
    800035a2:	4709                	li	a4,2
    800035a4:	cf98                	sw	a4,24(a5)
  }
}
    800035a6:	0001                	nop
    800035a8:	60e2                	ld	ra,24(sp)
    800035aa:	6442                	ld	s0,16(sp)
    800035ac:	6105                	addi	sp,sp,32
    800035ae:	8082                	ret

00000000800035b0 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800035b0:	7179                	addi	sp,sp,-48
    800035b2:	f406                	sd	ra,40(sp)
    800035b4:	f022                	sd	s0,32(sp)
    800035b6:	1800                	addi	s0,sp,48
    800035b8:	87aa                	mv	a5,a0
    800035ba:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800035be:	00011797          	auipc	a5,0x11
    800035c2:	0da78793          	addi	a5,a5,218 # 80014698 <proc>
    800035c6:	fef43423          	sd	a5,-24(s0)
    800035ca:	a0bd                	j	80003638 <kill+0x88>
    acquire(&p->lock);
    800035cc:	fe843783          	ld	a5,-24(s0)
    800035d0:	853e                	mv	a0,a5
    800035d2:	ffffe097          	auipc	ra,0xffffe
    800035d6:	cae080e7          	jalr	-850(ra) # 80001280 <acquire>
    if(p->pid == pid){
    800035da:	fe843783          	ld	a5,-24(s0)
    800035de:	5f98                	lw	a4,56(a5)
    800035e0:	fdc42783          	lw	a5,-36(s0)
    800035e4:	2781                	sext.w	a5,a5
    800035e6:	02e79a63          	bne	a5,a4,8000361a <kill+0x6a>
      p->killed = 1;
    800035ea:	fe843783          	ld	a5,-24(s0)
    800035ee:	4705                	li	a4,1
    800035f0:	db98                	sw	a4,48(a5)
      if(p->state == SLEEPING){
    800035f2:	fe843783          	ld	a5,-24(s0)
    800035f6:	4f9c                	lw	a5,24(a5)
    800035f8:	873e                	mv	a4,a5
    800035fa:	4785                	li	a5,1
    800035fc:	00f71663          	bne	a4,a5,80003608 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003600:	fe843783          	ld	a5,-24(s0)
    80003604:	4709                	li	a4,2
    80003606:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003608:	fe843783          	ld	a5,-24(s0)
    8000360c:	853e                	mv	a0,a5
    8000360e:	ffffe097          	auipc	ra,0xffffe
    80003612:	cd6080e7          	jalr	-810(ra) # 800012e4 <release>
      return 0;
    80003616:	4781                	li	a5,0
    80003618:	a80d                	j	8000364a <kill+0x9a>
    }
    release(&p->lock);
    8000361a:	fe843783          	ld	a5,-24(s0)
    8000361e:	853e                	mv	a0,a5
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	cc4080e7          	jalr	-828(ra) # 800012e4 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003628:	fe843703          	ld	a4,-24(s0)
    8000362c:	6785                	lui	a5,0x1
    8000362e:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80003632:	97ba                	add	a5,a5,a4
    80003634:	fef43423          	sd	a5,-24(s0)
    80003638:	fe843703          	ld	a4,-24(s0)
    8000363c:	00060797          	auipc	a5,0x60
    80003640:	45c78793          	addi	a5,a5,1116 # 80063a98 <pid_lock>
    80003644:	f8f764e3          	bltu	a4,a5,800035cc <kill+0x1c>
  }
  return -1;
    80003648:	57fd                	li	a5,-1
}
    8000364a:	853e                	mv	a0,a5
    8000364c:	70a2                	ld	ra,40(sp)
    8000364e:	7402                	ld	s0,32(sp)
    80003650:	6145                	addi	sp,sp,48
    80003652:	8082                	ret

0000000080003654 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003654:	7139                	addi	sp,sp,-64
    80003656:	fc06                	sd	ra,56(sp)
    80003658:	f822                	sd	s0,48(sp)
    8000365a:	0080                	addi	s0,sp,64
    8000365c:	87aa                	mv	a5,a0
    8000365e:	fcb43823          	sd	a1,-48(s0)
    80003662:	fcc43423          	sd	a2,-56(s0)
    80003666:	fcd43023          	sd	a3,-64(s0)
    8000366a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000366e:	fffff097          	auipc	ra,0xfffff
    80003672:	184080e7          	jalr	388(ra) # 800027f2 <myproc>
    80003676:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    8000367a:	fdc42783          	lw	a5,-36(s0)
    8000367e:	2781                	sext.w	a5,a5
    80003680:	c38d                	beqz	a5,800036a2 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003682:	fe843783          	ld	a5,-24(s0)
    80003686:	6bbc                	ld	a5,80(a5)
    80003688:	fc043683          	ld	a3,-64(s0)
    8000368c:	fc843603          	ld	a2,-56(s0)
    80003690:	fd043583          	ld	a1,-48(s0)
    80003694:	853e                	mv	a0,a5
    80003696:	fffff097          	auipc	ra,0xfffff
    8000369a:	c3e080e7          	jalr	-962(ra) # 800022d4 <copyout>
    8000369e:	87aa                	mv	a5,a0
    800036a0:	a839                	j	800036be <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800036a2:	fd043783          	ld	a5,-48(s0)
    800036a6:	fc043703          	ld	a4,-64(s0)
    800036aa:	2701                	sext.w	a4,a4
    800036ac:	863a                	mv	a2,a4
    800036ae:	fc843583          	ld	a1,-56(s0)
    800036b2:	853e                	mv	a0,a5
    800036b4:	ffffe097          	auipc	ra,0xffffe
    800036b8:	e84080e7          	jalr	-380(ra) # 80001538 <memmove>
    return 0;
    800036bc:	4781                	li	a5,0
  }
}
    800036be:	853e                	mv	a0,a5
    800036c0:	70e2                	ld	ra,56(sp)
    800036c2:	7442                	ld	s0,48(sp)
    800036c4:	6121                	addi	sp,sp,64
    800036c6:	8082                	ret

00000000800036c8 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800036c8:	7139                	addi	sp,sp,-64
    800036ca:	fc06                	sd	ra,56(sp)
    800036cc:	f822                	sd	s0,48(sp)
    800036ce:	0080                	addi	s0,sp,64
    800036d0:	fca43c23          	sd	a0,-40(s0)
    800036d4:	87ae                	mv	a5,a1
    800036d6:	fcc43423          	sd	a2,-56(s0)
    800036da:	fcd43023          	sd	a3,-64(s0)
    800036de:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800036e2:	fffff097          	auipc	ra,0xfffff
    800036e6:	110080e7          	jalr	272(ra) # 800027f2 <myproc>
    800036ea:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800036ee:	fd442783          	lw	a5,-44(s0)
    800036f2:	2781                	sext.w	a5,a5
    800036f4:	c38d                	beqz	a5,80003716 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800036f6:	fe843783          	ld	a5,-24(s0)
    800036fa:	6bbc                	ld	a5,80(a5)
    800036fc:	fc043683          	ld	a3,-64(s0)
    80003700:	fc843603          	ld	a2,-56(s0)
    80003704:	fd843583          	ld	a1,-40(s0)
    80003708:	853e                	mv	a0,a5
    8000370a:	fffff097          	auipc	ra,0xfffff
    8000370e:	c98080e7          	jalr	-872(ra) # 800023a2 <copyin>
    80003712:	87aa                	mv	a5,a0
    80003714:	a839                	j	80003732 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003716:	fc843783          	ld	a5,-56(s0)
    8000371a:	fc043703          	ld	a4,-64(s0)
    8000371e:	2701                	sext.w	a4,a4
    80003720:	863a                	mv	a2,a4
    80003722:	85be                	mv	a1,a5
    80003724:	fd843503          	ld	a0,-40(s0)
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	e10080e7          	jalr	-496(ra) # 80001538 <memmove>
    return 0;
    80003730:	4781                	li	a5,0
  }
}
    80003732:	853e                	mv	a0,a5
    80003734:	70e2                	ld	ra,56(sp)
    80003736:	7442                	ld	s0,48(sp)
    80003738:	6121                	addi	sp,sp,64
    8000373a:	8082                	ret

000000008000373c <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    8000373c:	1101                	addi	sp,sp,-32
    8000373e:	ec06                	sd	ra,24(sp)
    80003740:	e822                	sd	s0,16(sp)
    80003742:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003744:	00008517          	auipc	a0,0x8
    80003748:	b0450513          	addi	a0,a0,-1276 # 8000b248 <etext+0x248>
    8000374c:	ffffd097          	auipc	ra,0xffffd
    80003750:	2b0080e7          	jalr	688(ra) # 800009fc <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003754:	00011797          	auipc	a5,0x11
    80003758:	f4478793          	addi	a5,a5,-188 # 80014698 <proc>
    8000375c:	fef43423          	sd	a5,-24(s0)
    80003760:	a05d                	j	80003806 <procdump+0xca>
    if(p->state == UNUSED)
    80003762:	fe843783          	ld	a5,-24(s0)
    80003766:	4f9c                	lw	a5,24(a5)
    80003768:	c7d1                	beqz	a5,800037f4 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8000376a:	fe843783          	ld	a5,-24(s0)
    8000376e:	4f9c                	lw	a5,24(a5)
    80003770:	873e                	mv	a4,a5
    80003772:	4791                	li	a5,4
    80003774:	02e7ee63          	bltu	a5,a4,800037b0 <procdump+0x74>
    80003778:	fe843783          	ld	a5,-24(s0)
    8000377c:	4f9c                	lw	a5,24(a5)
    8000377e:	00008717          	auipc	a4,0x8
    80003782:	03270713          	addi	a4,a4,50 # 8000b7b0 <states.0>
    80003786:	1782                	slli	a5,a5,0x20
    80003788:	9381                	srli	a5,a5,0x20
    8000378a:	078e                	slli	a5,a5,0x3
    8000378c:	97ba                	add	a5,a5,a4
    8000378e:	639c                	ld	a5,0(a5)
    80003790:	c385                	beqz	a5,800037b0 <procdump+0x74>
      state = states[p->state];
    80003792:	fe843783          	ld	a5,-24(s0)
    80003796:	4f9c                	lw	a5,24(a5)
    80003798:	00008717          	auipc	a4,0x8
    8000379c:	01870713          	addi	a4,a4,24 # 8000b7b0 <states.0>
    800037a0:	1782                	slli	a5,a5,0x20
    800037a2:	9381                	srli	a5,a5,0x20
    800037a4:	078e                	slli	a5,a5,0x3
    800037a6:	97ba                	add	a5,a5,a4
    800037a8:	639c                	ld	a5,0(a5)
    800037aa:	fef43023          	sd	a5,-32(s0)
    800037ae:	a039                	j	800037bc <procdump+0x80>
    else
      state = "???";
    800037b0:	00008797          	auipc	a5,0x8
    800037b4:	aa078793          	addi	a5,a5,-1376 # 8000b250 <etext+0x250>
    800037b8:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    800037bc:	fe843783          	ld	a5,-24(s0)
    800037c0:	5f98                	lw	a4,56(a5)
    800037c2:	fe843783          	ld	a5,-24(s0)
    800037c6:	15878793          	addi	a5,a5,344
    800037ca:	86be                	mv	a3,a5
    800037cc:	fe043603          	ld	a2,-32(s0)
    800037d0:	85ba                	mv	a1,a4
    800037d2:	00008517          	auipc	a0,0x8
    800037d6:	a8650513          	addi	a0,a0,-1402 # 8000b258 <etext+0x258>
    800037da:	ffffd097          	auipc	ra,0xffffd
    800037de:	222080e7          	jalr	546(ra) # 800009fc <printf>
    printf("\n");
    800037e2:	00008517          	auipc	a0,0x8
    800037e6:	a6650513          	addi	a0,a0,-1434 # 8000b248 <etext+0x248>
    800037ea:	ffffd097          	auipc	ra,0xffffd
    800037ee:	212080e7          	jalr	530(ra) # 800009fc <printf>
    800037f2:	a011                	j	800037f6 <procdump+0xba>
      continue;
    800037f4:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800037f6:	fe843703          	ld	a4,-24(s0)
    800037fa:	6785                	lui	a5,0x1
    800037fc:	3d078793          	addi	a5,a5,976 # 13d0 <_entry-0x7fffec30>
    80003800:	97ba                	add	a5,a5,a4
    80003802:	fef43423          	sd	a5,-24(s0)
    80003806:	fe843703          	ld	a4,-24(s0)
    8000380a:	00060797          	auipc	a5,0x60
    8000380e:	28e78793          	addi	a5,a5,654 # 80063a98 <pid_lock>
    80003812:	f4f768e3          	bltu	a4,a5,80003762 <procdump+0x26>
  }
}
    80003816:	0001                	nop
    80003818:	0001                	nop
    8000381a:	60e2                	ld	ra,24(sp)
    8000381c:	6442                	ld	s0,16(sp)
    8000381e:	6105                	addi	sp,sp,32
    80003820:	8082                	ret

0000000080003822 <swtch>:
    80003822:	00153023          	sd	ra,0(a0)
    80003826:	00253423          	sd	sp,8(a0)
    8000382a:	e900                	sd	s0,16(a0)
    8000382c:	ed04                	sd	s1,24(a0)
    8000382e:	03253023          	sd	s2,32(a0)
    80003832:	03353423          	sd	s3,40(a0)
    80003836:	03453823          	sd	s4,48(a0)
    8000383a:	03553c23          	sd	s5,56(a0)
    8000383e:	05653023          	sd	s6,64(a0)
    80003842:	05753423          	sd	s7,72(a0)
    80003846:	05853823          	sd	s8,80(a0)
    8000384a:	05953c23          	sd	s9,88(a0)
    8000384e:	07a53023          	sd	s10,96(a0)
    80003852:	07b53423          	sd	s11,104(a0)
    80003856:	0005b083          	ld	ra,0(a1)
    8000385a:	0085b103          	ld	sp,8(a1)
    8000385e:	6980                	ld	s0,16(a1)
    80003860:	6d84                	ld	s1,24(a1)
    80003862:	0205b903          	ld	s2,32(a1)
    80003866:	0285b983          	ld	s3,40(a1)
    8000386a:	0305ba03          	ld	s4,48(a1)
    8000386e:	0385ba83          	ld	s5,56(a1)
    80003872:	0405bb03          	ld	s6,64(a1)
    80003876:	0485bb83          	ld	s7,72(a1)
    8000387a:	0505bc03          	ld	s8,80(a1)
    8000387e:	0585bc83          	ld	s9,88(a1)
    80003882:	0605bd03          	ld	s10,96(a1)
    80003886:	0685bd83          	ld	s11,104(a1)
    8000388a:	8082                	ret

000000008000388c <r_sstatus>:
{
    8000388c:	1101                	addi	sp,sp,-32
    8000388e:	ec22                	sd	s0,24(sp)
    80003890:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003892:	100027f3          	csrr	a5,sstatus
    80003896:	fef43423          	sd	a5,-24(s0)
  return x;
    8000389a:	fe843783          	ld	a5,-24(s0)
}
    8000389e:	853e                	mv	a0,a5
    800038a0:	6462                	ld	s0,24(sp)
    800038a2:	6105                	addi	sp,sp,32
    800038a4:	8082                	ret

00000000800038a6 <w_sstatus>:
{
    800038a6:	1101                	addi	sp,sp,-32
    800038a8:	ec22                	sd	s0,24(sp)
    800038aa:	1000                	addi	s0,sp,32
    800038ac:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800038b0:	fe843783          	ld	a5,-24(s0)
    800038b4:	10079073          	csrw	sstatus,a5
}
    800038b8:	0001                	nop
    800038ba:	6462                	ld	s0,24(sp)
    800038bc:	6105                	addi	sp,sp,32
    800038be:	8082                	ret

00000000800038c0 <r_sip>:
{
    800038c0:	1101                	addi	sp,sp,-32
    800038c2:	ec22                	sd	s0,24(sp)
    800038c4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    800038c6:	144027f3          	csrr	a5,sip
    800038ca:	fef43423          	sd	a5,-24(s0)
  return x;
    800038ce:	fe843783          	ld	a5,-24(s0)
}
    800038d2:	853e                	mv	a0,a5
    800038d4:	6462                	ld	s0,24(sp)
    800038d6:	6105                	addi	sp,sp,32
    800038d8:	8082                	ret

00000000800038da <w_sip>:
{
    800038da:	1101                	addi	sp,sp,-32
    800038dc:	ec22                	sd	s0,24(sp)
    800038de:	1000                	addi	s0,sp,32
    800038e0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    800038e4:	fe843783          	ld	a5,-24(s0)
    800038e8:	14479073          	csrw	sip,a5
}
    800038ec:	0001                	nop
    800038ee:	6462                	ld	s0,24(sp)
    800038f0:	6105                	addi	sp,sp,32
    800038f2:	8082                	ret

00000000800038f4 <w_sepc>:
{
    800038f4:	1101                	addi	sp,sp,-32
    800038f6:	ec22                	sd	s0,24(sp)
    800038f8:	1000                	addi	s0,sp,32
    800038fa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    800038fe:	fe843783          	ld	a5,-24(s0)
    80003902:	14179073          	csrw	sepc,a5
}
    80003906:	0001                	nop
    80003908:	6462                	ld	s0,24(sp)
    8000390a:	6105                	addi	sp,sp,32
    8000390c:	8082                	ret

000000008000390e <r_sepc>:
{
    8000390e:	1101                	addi	sp,sp,-32
    80003910:	ec22                	sd	s0,24(sp)
    80003912:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003914:	141027f3          	csrr	a5,sepc
    80003918:	fef43423          	sd	a5,-24(s0)
  return x;
    8000391c:	fe843783          	ld	a5,-24(s0)
}
    80003920:	853e                	mv	a0,a5
    80003922:	6462                	ld	s0,24(sp)
    80003924:	6105                	addi	sp,sp,32
    80003926:	8082                	ret

0000000080003928 <w_stvec>:
{
    80003928:	1101                	addi	sp,sp,-32
    8000392a:	ec22                	sd	s0,24(sp)
    8000392c:	1000                	addi	s0,sp,32
    8000392e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003932:	fe843783          	ld	a5,-24(s0)
    80003936:	10579073          	csrw	stvec,a5
}
    8000393a:	0001                	nop
    8000393c:	6462                	ld	s0,24(sp)
    8000393e:	6105                	addi	sp,sp,32
    80003940:	8082                	ret

0000000080003942 <r_satp>:
{
    80003942:	1101                	addi	sp,sp,-32
    80003944:	ec22                	sd	s0,24(sp)
    80003946:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003948:	180027f3          	csrr	a5,satp
    8000394c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003950:	fe843783          	ld	a5,-24(s0)
}
    80003954:	853e                	mv	a0,a5
    80003956:	6462                	ld	s0,24(sp)
    80003958:	6105                	addi	sp,sp,32
    8000395a:	8082                	ret

000000008000395c <r_scause>:
{
    8000395c:	1101                	addi	sp,sp,-32
    8000395e:	ec22                	sd	s0,24(sp)
    80003960:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003962:	142027f3          	csrr	a5,scause
    80003966:	fef43423          	sd	a5,-24(s0)
  return x;
    8000396a:	fe843783          	ld	a5,-24(s0)
}
    8000396e:	853e                	mv	a0,a5
    80003970:	6462                	ld	s0,24(sp)
    80003972:	6105                	addi	sp,sp,32
    80003974:	8082                	ret

0000000080003976 <r_stval>:
{
    80003976:	1101                	addi	sp,sp,-32
    80003978:	ec22                	sd	s0,24(sp)
    8000397a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    8000397c:	143027f3          	csrr	a5,stval
    80003980:	fef43423          	sd	a5,-24(s0)
  return x;
    80003984:	fe843783          	ld	a5,-24(s0)
}
    80003988:	853e                	mv	a0,a5
    8000398a:	6462                	ld	s0,24(sp)
    8000398c:	6105                	addi	sp,sp,32
    8000398e:	8082                	ret

0000000080003990 <intr_on>:
{
    80003990:	1141                	addi	sp,sp,-16
    80003992:	e406                	sd	ra,8(sp)
    80003994:	e022                	sd	s0,0(sp)
    80003996:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003998:	00000097          	auipc	ra,0x0
    8000399c:	ef4080e7          	jalr	-268(ra) # 8000388c <r_sstatus>
    800039a0:	87aa                	mv	a5,a0
    800039a2:	0027e793          	ori	a5,a5,2
    800039a6:	853e                	mv	a0,a5
    800039a8:	00000097          	auipc	ra,0x0
    800039ac:	efe080e7          	jalr	-258(ra) # 800038a6 <w_sstatus>
}
    800039b0:	0001                	nop
    800039b2:	60a2                	ld	ra,8(sp)
    800039b4:	6402                	ld	s0,0(sp)
    800039b6:	0141                	addi	sp,sp,16
    800039b8:	8082                	ret

00000000800039ba <intr_off>:
{
    800039ba:	1141                	addi	sp,sp,-16
    800039bc:	e406                	sd	ra,8(sp)
    800039be:	e022                	sd	s0,0(sp)
    800039c0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800039c2:	00000097          	auipc	ra,0x0
    800039c6:	eca080e7          	jalr	-310(ra) # 8000388c <r_sstatus>
    800039ca:	87aa                	mv	a5,a0
    800039cc:	9bf5                	andi	a5,a5,-3
    800039ce:	853e                	mv	a0,a5
    800039d0:	00000097          	auipc	ra,0x0
    800039d4:	ed6080e7          	jalr	-298(ra) # 800038a6 <w_sstatus>
}
    800039d8:	0001                	nop
    800039da:	60a2                	ld	ra,8(sp)
    800039dc:	6402                	ld	s0,0(sp)
    800039de:	0141                	addi	sp,sp,16
    800039e0:	8082                	ret

00000000800039e2 <intr_get>:
{
    800039e2:	1101                	addi	sp,sp,-32
    800039e4:	ec06                	sd	ra,24(sp)
    800039e6:	e822                	sd	s0,16(sp)
    800039e8:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800039ea:	00000097          	auipc	ra,0x0
    800039ee:	ea2080e7          	jalr	-350(ra) # 8000388c <r_sstatus>
    800039f2:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800039f6:	fe843783          	ld	a5,-24(s0)
    800039fa:	8b89                	andi	a5,a5,2
    800039fc:	00f037b3          	snez	a5,a5
    80003a00:	0ff7f793          	andi	a5,a5,255
    80003a04:	2781                	sext.w	a5,a5
}
    80003a06:	853e                	mv	a0,a5
    80003a08:	60e2                	ld	ra,24(sp)
    80003a0a:	6442                	ld	s0,16(sp)
    80003a0c:	6105                	addi	sp,sp,32
    80003a0e:	8082                	ret

0000000080003a10 <r_tp>:
{
    80003a10:	1101                	addi	sp,sp,-32
    80003a12:	ec22                	sd	s0,24(sp)
    80003a14:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003a16:	8792                	mv	a5,tp
    80003a18:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a1c:	fe843783          	ld	a5,-24(s0)
}
    80003a20:	853e                	mv	a0,a5
    80003a22:	6462                	ld	s0,24(sp)
    80003a24:	6105                	addi	sp,sp,32
    80003a26:	8082                	ret

0000000080003a28 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003a28:	1141                	addi	sp,sp,-16
    80003a2a:	e406                	sd	ra,8(sp)
    80003a2c:	e022                	sd	s0,0(sp)
    80003a2e:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003a30:	00008597          	auipc	a1,0x8
    80003a34:	86858593          	addi	a1,a1,-1944 # 8000b298 <etext+0x298>
    80003a38:	00060517          	auipc	a0,0x60
    80003a3c:	07850513          	addi	a0,a0,120 # 80063ab0 <tickslock>
    80003a40:	ffffe097          	auipc	ra,0xffffe
    80003a44:	810080e7          	jalr	-2032(ra) # 80001250 <initlock>
}
    80003a48:	0001                	nop
    80003a4a:	60a2                	ld	ra,8(sp)
    80003a4c:	6402                	ld	s0,0(sp)
    80003a4e:	0141                	addi	sp,sp,16
    80003a50:	8082                	ret

0000000080003a52 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003a52:	1141                	addi	sp,sp,-16
    80003a54:	e406                	sd	ra,8(sp)
    80003a56:	e022                	sd	s0,0(sp)
    80003a58:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003a5a:	00005797          	auipc	a5,0x5
    80003a5e:	f7678793          	addi	a5,a5,-138 # 800089d0 <kernelvec>
    80003a62:	853e                	mv	a0,a5
    80003a64:	00000097          	auipc	ra,0x0
    80003a68:	ec4080e7          	jalr	-316(ra) # 80003928 <w_stvec>
}
    80003a6c:	0001                	nop
    80003a6e:	60a2                	ld	ra,8(sp)
    80003a70:	6402                	ld	s0,0(sp)
    80003a72:	0141                	addi	sp,sp,16
    80003a74:	8082                	ret

0000000080003a76 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003a76:	7179                	addi	sp,sp,-48
    80003a78:	f406                	sd	ra,40(sp)
    80003a7a:	f022                	sd	s0,32(sp)
    80003a7c:	ec26                	sd	s1,24(sp)
    80003a7e:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003a80:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003a84:	00000097          	auipc	ra,0x0
    80003a88:	e08080e7          	jalr	-504(ra) # 8000388c <r_sstatus>
    80003a8c:	87aa                	mv	a5,a0
    80003a8e:	1007f793          	andi	a5,a5,256
    80003a92:	cb89                	beqz	a5,80003aa4 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003a94:	00008517          	auipc	a0,0x8
    80003a98:	80c50513          	addi	a0,a0,-2036 # 8000b2a0 <etext+0x2a0>
    80003a9c:	ffffd097          	auipc	ra,0xffffd
    80003aa0:	1b6080e7          	jalr	438(ra) # 80000c52 <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003aa4:	00005797          	auipc	a5,0x5
    80003aa8:	f2c78793          	addi	a5,a5,-212 # 800089d0 <kernelvec>
    80003aac:	853e                	mv	a0,a5
    80003aae:	00000097          	auipc	ra,0x0
    80003ab2:	e7a080e7          	jalr	-390(ra) # 80003928 <w_stvec>

  struct proc *p = myproc();
    80003ab6:	fffff097          	auipc	ra,0xfffff
    80003aba:	d3c080e7          	jalr	-708(ra) # 800027f2 <myproc>
    80003abe:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003ac2:	fd043783          	ld	a5,-48(s0)
    80003ac6:	6fa4                	ld	s1,88(a5)
    80003ac8:	00000097          	auipc	ra,0x0
    80003acc:	e46080e7          	jalr	-442(ra) # 8000390e <r_sepc>
    80003ad0:	87aa                	mv	a5,a0
    80003ad2:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003ad4:	00000097          	auipc	ra,0x0
    80003ad8:	e88080e7          	jalr	-376(ra) # 8000395c <r_scause>
    80003adc:	872a                	mv	a4,a0
    80003ade:	47a1                	li	a5,8
    80003ae0:	02f71d63          	bne	a4,a5,80003b1a <usertrap+0xa4>
    // system call

    if(p->killed)
    80003ae4:	fd043783          	ld	a5,-48(s0)
    80003ae8:	5b9c                	lw	a5,48(a5)
    80003aea:	c791                	beqz	a5,80003af6 <usertrap+0x80>
      exit(-1);
    80003aec:	557d                	li	a0,-1
    80003aee:	fffff097          	auipc	ra,0xfffff
    80003af2:	42c080e7          	jalr	1068(ra) # 80002f1a <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003af6:	fd043783          	ld	a5,-48(s0)
    80003afa:	6fbc                	ld	a5,88(a5)
    80003afc:	6f98                	ld	a4,24(a5)
    80003afe:	fd043783          	ld	a5,-48(s0)
    80003b02:	6fbc                	ld	a5,88(a5)
    80003b04:	0711                	addi	a4,a4,4
    80003b06:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003b08:	00000097          	auipc	ra,0x0
    80003b0c:	e88080e7          	jalr	-376(ra) # 80003990 <intr_on>

    syscall();
    80003b10:	00001097          	auipc	ra,0x1
    80003b14:	87a080e7          	jalr	-1926(ra) # 8000438a <syscall>
    80003b18:	a0b5                	j	80003b84 <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80003b1a:	00000097          	auipc	ra,0x0
    80003b1e:	542080e7          	jalr	1346(ra) # 8000405c <devintr>
    80003b22:	87aa                	mv	a5,a0
    80003b24:	fcf42e23          	sw	a5,-36(s0)
    80003b28:	fdc42783          	lw	a5,-36(s0)
    80003b2c:	2781                	sext.w	a5,a5
    80003b2e:	ebb9                	bnez	a5,80003b84 <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003b30:	00000097          	auipc	ra,0x0
    80003b34:	e2c080e7          	jalr	-468(ra) # 8000395c <r_scause>
    80003b38:	872a                	mv	a4,a0
    80003b3a:	fd043783          	ld	a5,-48(s0)
    80003b3e:	5f9c                	lw	a5,56(a5)
    80003b40:	863e                	mv	a2,a5
    80003b42:	85ba                	mv	a1,a4
    80003b44:	00007517          	auipc	a0,0x7
    80003b48:	77c50513          	addi	a0,a0,1916 # 8000b2c0 <etext+0x2c0>
    80003b4c:	ffffd097          	auipc	ra,0xffffd
    80003b50:	eb0080e7          	jalr	-336(ra) # 800009fc <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003b54:	00000097          	auipc	ra,0x0
    80003b58:	dba080e7          	jalr	-582(ra) # 8000390e <r_sepc>
    80003b5c:	84aa                	mv	s1,a0
    80003b5e:	00000097          	auipc	ra,0x0
    80003b62:	e18080e7          	jalr	-488(ra) # 80003976 <r_stval>
    80003b66:	87aa                	mv	a5,a0
    80003b68:	863e                	mv	a2,a5
    80003b6a:	85a6                	mv	a1,s1
    80003b6c:	00007517          	auipc	a0,0x7
    80003b70:	78450513          	addi	a0,a0,1924 # 8000b2f0 <etext+0x2f0>
    80003b74:	ffffd097          	auipc	ra,0xffffd
    80003b78:	e88080e7          	jalr	-376(ra) # 800009fc <printf>
    p->killed = 1;
    80003b7c:	fd043783          	ld	a5,-48(s0)
    80003b80:	4705                	li	a4,1
    80003b82:	db98                	sw	a4,48(a5)
  }

  if(p->killed)
    80003b84:	fd043783          	ld	a5,-48(s0)
    80003b88:	5b9c                	lw	a5,48(a5)
    80003b8a:	c791                	beqz	a5,80003b96 <usertrap+0x120>
    exit(-1);
    80003b8c:	557d                	li	a0,-1
    80003b8e:	fffff097          	auipc	ra,0xfffff
    80003b92:	38c080e7          	jalr	908(ra) # 80002f1a <exit>
  //   p->trapframe->epc = p->handler;
  //   p->trapframe->a0 = p->handler_arg;
  //   p->kernal_flag = 0;
  // }
  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2){
    80003b96:	fdc42783          	lw	a5,-36(s0)
    80003b9a:	0007871b          	sext.w	a4,a5
    80003b9e:	4789                	li	a5,2
    80003ba0:	0cf71b63          	bne	a4,a5,80003c76 <usertrap+0x200>
    if(p->ticks != -1){
    80003ba4:	fd043703          	ld	a4,-48(s0)
    80003ba8:	6785                	lui	a5,0x1
    80003baa:	97ba                	add	a5,a5,a4
    80003bac:	3ac7a783          	lw	a5,940(a5) # 13ac <_entry-0x7fffec54>
    80003bb0:	873e                	mv	a4,a5
    80003bb2:	57fd                	li	a5,-1
    80003bb4:	0af70d63          	beq	a4,a5,80003c6e <usertrap+0x1f8>
      p->ticks += 1;
    80003bb8:	fd043703          	ld	a4,-48(s0)
    80003bbc:	6785                	lui	a5,0x1
    80003bbe:	97ba                	add	a5,a5,a4
    80003bc0:	3ac7a783          	lw	a5,940(a5) # 13ac <_entry-0x7fffec54>
    80003bc4:	2785                	addiw	a5,a5,1
    80003bc6:	0007871b          	sext.w	a4,a5
    80003bca:	fd043683          	ld	a3,-48(s0)
    80003bce:	6785                	lui	a5,0x1
    80003bd0:	97b6                	add	a5,a5,a3
    80003bd2:	3ae7a623          	sw	a4,940(a5) # 13ac <_entry-0x7fffec54>
      if(p->ticks == p->delay){
    80003bd6:	fd043703          	ld	a4,-48(s0)
    80003bda:	6785                	lui	a5,0x1
    80003bdc:	97ba                	add	a5,a5,a4
    80003bde:	3ac7a683          	lw	a3,940(a5) # 13ac <_entry-0x7fffec54>
    80003be2:	fd043703          	ld	a4,-48(s0)
    80003be6:	6785                	lui	a5,0x1
    80003be8:	97ba                	add	a5,a5,a4
    80003bea:	3a87a783          	lw	a5,936(a5) # 13a8 <_entry-0x7fffec58>
    80003bee:	8736                	mv	a4,a3
    80003bf0:	06f71f63          	bne	a4,a5,80003c6e <usertrap+0x1f8>
        p->h_flag = 1;
    80003bf4:	fd043703          	ld	a4,-48(s0)
    80003bf8:	6785                	lui	a5,0x1
    80003bfa:	97ba                	add	a5,a5,a4
    80003bfc:	4705                	li	a4,1
    80003bfe:	3ae7ac23          	sw	a4,952(a5) # 13b8 <_entry-0x7fffec48>
        //p->stored_frame[p->context_id] = *(p->trapframe);
        memmove(&myproc()->stored_frame[p->context_id], myproc()->trapframe, sizeof(struct trapframe));
    80003c02:	fffff097          	auipc	ra,0xfffff
    80003c06:	bf0080e7          	jalr	-1040(ra) # 800027f2 <myproc>
    80003c0a:	86aa                	mv	a3,a0
    80003c0c:	fd043703          	ld	a4,-48(s0)
    80003c10:	6785                	lui	a5,0x1
    80003c12:	97ba                	add	a5,a5,a4
    80003c14:	3b07a703          	lw	a4,944(a5) # 13b0 <_entry-0x7fffec50>
    80003c18:	87ba                	mv	a5,a4
    80003c1a:	078e                	slli	a5,a5,0x3
    80003c1c:	97ba                	add	a5,a5,a4
    80003c1e:	0796                	slli	a5,a5,0x5
    80003c20:	1a078793          	addi	a5,a5,416
    80003c24:	97b6                	add	a5,a5,a3
    80003c26:	00878493          	addi	s1,a5,8
    80003c2a:	fffff097          	auipc	ra,0xfffff
    80003c2e:	bc8080e7          	jalr	-1080(ra) # 800027f2 <myproc>
    80003c32:	87aa                	mv	a5,a0
    80003c34:	6fbc                	ld	a5,88(a5)
    80003c36:	12000613          	li	a2,288
    80003c3a:	85be                	mv	a1,a5
    80003c3c:	8526                	mv	a0,s1
    80003c3e:	ffffe097          	auipc	ra,0xffffe
    80003c42:	8fa080e7          	jalr	-1798(ra) # 80001538 <memmove>
        p->trapframe->epc = p->handler;
    80003c46:	fd043783          	ld	a5,-48(s0)
    80003c4a:	6fbc                	ld	a5,88(a5)
    80003c4c:	fd043683          	ld	a3,-48(s0)
    80003c50:	6705                	lui	a4,0x1
    80003c52:	9736                	add	a4,a4,a3
    80003c54:	3c073703          	ld	a4,960(a4) # 13c0 <_entry-0x7fffec40>
    80003c58:	ef98                	sd	a4,24(a5)
        p->trapframe->a0 = p->handler_arg;
    80003c5a:	fd043783          	ld	a5,-48(s0)
    80003c5e:	6fbc                	ld	a5,88(a5)
    80003c60:	fd043683          	ld	a3,-48(s0)
    80003c64:	6705                	lui	a4,0x1
    80003c66:	9736                	add	a4,a4,a3
    80003c68:	3c873703          	ld	a4,968(a4) # 13c8 <_entry-0x7fffec38>
    80003c6c:	fbb8                	sd	a4,112(a5)
        //p->h_flag = 0;
      }
    }
    yield();
    80003c6e:	fffff097          	auipc	ra,0xfffff
    80003c72:	732080e7          	jalr	1842(ra) # 800033a0 <yield>
  }
  usertrapret();
    80003c76:	00000097          	auipc	ra,0x0
    80003c7a:	014080e7          	jalr	20(ra) # 80003c8a <usertrapret>
}
    80003c7e:	0001                	nop
    80003c80:	70a2                	ld	ra,40(sp)
    80003c82:	7402                	ld	s0,32(sp)
    80003c84:	64e2                	ld	s1,24(sp)
    80003c86:	6145                	addi	sp,sp,48
    80003c88:	8082                	ret

0000000080003c8a <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003c8a:	7139                	addi	sp,sp,-64
    80003c8c:	fc06                	sd	ra,56(sp)
    80003c8e:	f822                	sd	s0,48(sp)
    80003c90:	f426                	sd	s1,40(sp)
    80003c92:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80003c94:	fffff097          	auipc	ra,0xfffff
    80003c98:	b5e080e7          	jalr	-1186(ra) # 800027f2 <myproc>
    80003c9c:	fca43c23          	sd	a0,-40(s0)
  if(p->h_flag == 1){
    80003ca0:	fd843703          	ld	a4,-40(s0)
    80003ca4:	6785                	lui	a5,0x1
    80003ca6:	97ba                	add	a5,a5,a4
    80003ca8:	3b87a783          	lw	a5,952(a5) # 13b8 <_entry-0x7fffec48>
    80003cac:	873e                	mv	a4,a5
    80003cae:	4785                	li	a5,1
    80003cb0:	02f71c63          	bne	a4,a5,80003ce8 <usertrapret+0x5e>
    //p->stored_frame[p->context_id] = *(p->trapframe);
    //memmove(myproc()->stored_frame + p->context_id, myproc()->trapframe, sizeof(struct trapframe));
    p->trapframe->epc = p->handler;
    80003cb4:	fd843783          	ld	a5,-40(s0)
    80003cb8:	6fbc                	ld	a5,88(a5)
    80003cba:	fd843683          	ld	a3,-40(s0)
    80003cbe:	6705                	lui	a4,0x1
    80003cc0:	9736                	add	a4,a4,a3
    80003cc2:	3c073703          	ld	a4,960(a4) # 13c0 <_entry-0x7fffec40>
    80003cc6:	ef98                	sd	a4,24(a5)
    p->trapframe->a0 = p->handler_arg;
    80003cc8:	fd843783          	ld	a5,-40(s0)
    80003ccc:	6fbc                	ld	a5,88(a5)
    80003cce:	fd843683          	ld	a3,-40(s0)
    80003cd2:	6705                	lui	a4,0x1
    80003cd4:	9736                	add	a4,a4,a3
    80003cd6:	3c873703          	ld	a4,968(a4) # 13c8 <_entry-0x7fffec38>
    80003cda:	fbb8                	sd	a4,112(a5)
    p->h_flag = 0;
    80003cdc:	fd843703          	ld	a4,-40(s0)
    80003ce0:	6785                	lui	a5,0x1
    80003ce2:	97ba                	add	a5,a5,a4
    80003ce4:	3a07ac23          	sw	zero,952(a5) # 13b8 <_entry-0x7fffec48>
  }
  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003ce8:	00000097          	auipc	ra,0x0
    80003cec:	cd2080e7          	jalr	-814(ra) # 800039ba <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003cf0:	00006717          	auipc	a4,0x6
    80003cf4:	31070713          	addi	a4,a4,784 # 8000a000 <_trampoline>
    80003cf8:	00006797          	auipc	a5,0x6
    80003cfc:	30878793          	addi	a5,a5,776 # 8000a000 <_trampoline>
    80003d00:	8f1d                	sub	a4,a4,a5
    80003d02:	040007b7          	lui	a5,0x4000
    80003d06:	17fd                	addi	a5,a5,-1
    80003d08:	07b2                	slli	a5,a5,0xc
    80003d0a:	97ba                	add	a5,a5,a4
    80003d0c:	853e                	mv	a0,a5
    80003d0e:	00000097          	auipc	ra,0x0
    80003d12:	c1a080e7          	jalr	-998(ra) # 80003928 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003d16:	fd843783          	ld	a5,-40(s0)
    80003d1a:	6fa4                	ld	s1,88(a5)
    80003d1c:	00000097          	auipc	ra,0x0
    80003d20:	c26080e7          	jalr	-986(ra) # 80003942 <r_satp>
    80003d24:	87aa                	mv	a5,a0
    80003d26:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003d28:	fd843783          	ld	a5,-40(s0)
    80003d2c:	63b4                	ld	a3,64(a5)
    80003d2e:	fd843783          	ld	a5,-40(s0)
    80003d32:	6fbc                	ld	a5,88(a5)
    80003d34:	6705                	lui	a4,0x1
    80003d36:	9736                	add	a4,a4,a3
    80003d38:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003d3a:	fd843783          	ld	a5,-40(s0)
    80003d3e:	6fbc                	ld	a5,88(a5)
    80003d40:	00000717          	auipc	a4,0x0
    80003d44:	d3670713          	addi	a4,a4,-714 # 80003a76 <usertrap>
    80003d48:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003d4a:	fd843783          	ld	a5,-40(s0)
    80003d4e:	6fa4                	ld	s1,88(a5)
    80003d50:	00000097          	auipc	ra,0x0
    80003d54:	cc0080e7          	jalr	-832(ra) # 80003a10 <r_tp>
    80003d58:	87aa                	mv	a5,a0
    80003d5a:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003d5c:	00000097          	auipc	ra,0x0
    80003d60:	b30080e7          	jalr	-1232(ra) # 8000388c <r_sstatus>
    80003d64:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003d68:	fd043783          	ld	a5,-48(s0)
    80003d6c:	eff7f793          	andi	a5,a5,-257
    80003d70:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003d74:	fd043783          	ld	a5,-48(s0)
    80003d78:	0207e793          	ori	a5,a5,32
    80003d7c:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    80003d80:	fd043503          	ld	a0,-48(s0)
    80003d84:	00000097          	auipc	ra,0x0
    80003d88:	b22080e7          	jalr	-1246(ra) # 800038a6 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003d8c:	fd843783          	ld	a5,-40(s0)
    80003d90:	6fbc                	ld	a5,88(a5)
    80003d92:	6f9c                	ld	a5,24(a5)
    80003d94:	853e                	mv	a0,a5
    80003d96:	00000097          	auipc	ra,0x0
    80003d9a:	b5e080e7          	jalr	-1186(ra) # 800038f4 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003d9e:	fd843783          	ld	a5,-40(s0)
    80003da2:	6bbc                	ld	a5,80(a5)
    80003da4:	00c7d713          	srli	a4,a5,0xc
    80003da8:	57fd                	li	a5,-1
    80003daa:	17fe                	slli	a5,a5,0x3f
    80003dac:	8fd9                	or	a5,a5,a4
    80003dae:	fcf43423          	sd	a5,-56(s0)
  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80003db2:	00006717          	auipc	a4,0x6
    80003db6:	2de70713          	addi	a4,a4,734 # 8000a090 <userret>
    80003dba:	00006797          	auipc	a5,0x6
    80003dbe:	24678793          	addi	a5,a5,582 # 8000a000 <_trampoline>
    80003dc2:	8f1d                	sub	a4,a4,a5
    80003dc4:	040007b7          	lui	a5,0x4000
    80003dc8:	17fd                	addi	a5,a5,-1
    80003dca:	07b2                	slli	a5,a5,0xc
    80003dcc:	97ba                	add	a5,a5,a4
    80003dce:	fcf43023          	sd	a5,-64(s0)
  
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80003dd2:	fc043703          	ld	a4,-64(s0)
    80003dd6:	fc843583          	ld	a1,-56(s0)
    80003dda:	020007b7          	lui	a5,0x2000
    80003dde:	17fd                	addi	a5,a5,-1
    80003de0:	00d79513          	slli	a0,a5,0xd
    80003de4:	9702                	jalr	a4
}
    80003de6:	0001                	nop
    80003de8:	70e2                	ld	ra,56(sp)
    80003dea:	7442                	ld	s0,48(sp)
    80003dec:	74a2                	ld	s1,40(sp)
    80003dee:	6121                	addi	sp,sp,64
    80003df0:	8082                	ret

0000000080003df2 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003df2:	715d                	addi	sp,sp,-80
    80003df4:	e486                	sd	ra,72(sp)
    80003df6:	e0a2                	sd	s0,64(sp)
    80003df8:	fc26                	sd	s1,56(sp)
    80003dfa:	0880                	addi	s0,sp,80
  
  int which_dev = 0;
    80003dfc:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	b0e080e7          	jalr	-1266(ra) # 8000390e <r_sepc>
    80003e08:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003e0c:	00000097          	auipc	ra,0x0
    80003e10:	a80080e7          	jalr	-1408(ra) # 8000388c <r_sstatus>
    80003e14:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003e18:	00000097          	auipc	ra,0x0
    80003e1c:	b44080e7          	jalr	-1212(ra) # 8000395c <r_scause>
    80003e20:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003e24:	fc843783          	ld	a5,-56(s0)
    80003e28:	1007f793          	andi	a5,a5,256
    80003e2c:	eb89                	bnez	a5,80003e3e <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003e2e:	00007517          	auipc	a0,0x7
    80003e32:	4e250513          	addi	a0,a0,1250 # 8000b310 <etext+0x310>
    80003e36:	ffffd097          	auipc	ra,0xffffd
    80003e3a:	e1c080e7          	jalr	-484(ra) # 80000c52 <panic>
  if(intr_get() != 0)
    80003e3e:	00000097          	auipc	ra,0x0
    80003e42:	ba4080e7          	jalr	-1116(ra) # 800039e2 <intr_get>
    80003e46:	87aa                	mv	a5,a0
    80003e48:	cb89                	beqz	a5,80003e5a <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003e4a:	00007517          	auipc	a0,0x7
    80003e4e:	4ee50513          	addi	a0,a0,1262 # 8000b338 <etext+0x338>
    80003e52:	ffffd097          	auipc	ra,0xffffd
    80003e56:	e00080e7          	jalr	-512(ra) # 80000c52 <panic>

  if((which_dev = devintr()) == 0){
    80003e5a:	00000097          	auipc	ra,0x0
    80003e5e:	202080e7          	jalr	514(ra) # 8000405c <devintr>
    80003e62:	87aa                	mv	a5,a0
    80003e64:	fcf42e23          	sw	a5,-36(s0)
    80003e68:	fdc42783          	lw	a5,-36(s0)
    80003e6c:	2781                	sext.w	a5,a5
    80003e6e:	e7b9                	bnez	a5,80003ebc <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003e70:	fc043583          	ld	a1,-64(s0)
    80003e74:	00007517          	auipc	a0,0x7
    80003e78:	4e450513          	addi	a0,a0,1252 # 8000b358 <etext+0x358>
    80003e7c:	ffffd097          	auipc	ra,0xffffd
    80003e80:	b80080e7          	jalr	-1152(ra) # 800009fc <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003e84:	00000097          	auipc	ra,0x0
    80003e88:	a8a080e7          	jalr	-1398(ra) # 8000390e <r_sepc>
    80003e8c:	84aa                	mv	s1,a0
    80003e8e:	00000097          	auipc	ra,0x0
    80003e92:	ae8080e7          	jalr	-1304(ra) # 80003976 <r_stval>
    80003e96:	87aa                	mv	a5,a0
    80003e98:	863e                	mv	a2,a5
    80003e9a:	85a6                	mv	a1,s1
    80003e9c:	00007517          	auipc	a0,0x7
    80003ea0:	4cc50513          	addi	a0,a0,1228 # 8000b368 <etext+0x368>
    80003ea4:	ffffd097          	auipc	ra,0xffffd
    80003ea8:	b58080e7          	jalr	-1192(ra) # 800009fc <printf>
    panic("kerneltrap");
    80003eac:	00007517          	auipc	a0,0x7
    80003eb0:	4d450513          	addi	a0,a0,1236 # 8000b380 <etext+0x380>
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	d9e080e7          	jalr	-610(ra) # 80000c52 <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING){
    80003ebc:	fdc42783          	lw	a5,-36(s0)
    80003ec0:	0007871b          	sext.w	a4,a5
    80003ec4:	4789                	li	a5,2
    80003ec6:	10f71b63          	bne	a4,a5,80003fdc <kerneltrap+0x1ea>
    80003eca:	fffff097          	auipc	ra,0xfffff
    80003ece:	928080e7          	jalr	-1752(ra) # 800027f2 <myproc>
    80003ed2:	87aa                	mv	a5,a0
    80003ed4:	10078463          	beqz	a5,80003fdc <kerneltrap+0x1ea>
    80003ed8:	fffff097          	auipc	ra,0xfffff
    80003edc:	91a080e7          	jalr	-1766(ra) # 800027f2 <myproc>
    80003ee0:	87aa                	mv	a5,a0
    80003ee2:	4f9c                	lw	a5,24(a5)
    80003ee4:	873e                	mv	a4,a5
    80003ee6:	478d                	li	a5,3
    80003ee8:	0ef71a63          	bne	a4,a5,80003fdc <kerneltrap+0x1ea>
    if(myproc()->ticks != -1){
    80003eec:	fffff097          	auipc	ra,0xfffff
    80003ef0:	906080e7          	jalr	-1786(ra) # 800027f2 <myproc>
    80003ef4:	872a                	mv	a4,a0
    80003ef6:	6785                	lui	a5,0x1
    80003ef8:	97ba                	add	a5,a5,a4
    80003efa:	3ac7a783          	lw	a5,940(a5) # 13ac <_entry-0x7fffec54>
    80003efe:	873e                	mv	a4,a5
    80003f00:	57fd                	li	a5,-1
    80003f02:	0cf70963          	beq	a4,a5,80003fd4 <kerneltrap+0x1e2>
      myproc()->ticks += 1;
    80003f06:	fffff097          	auipc	ra,0xfffff
    80003f0a:	8ec080e7          	jalr	-1812(ra) # 800027f2 <myproc>
    80003f0e:	87aa                	mv	a5,a0
    80003f10:	6705                	lui	a4,0x1
    80003f12:	973e                	add	a4,a4,a5
    80003f14:	3ac72703          	lw	a4,940(a4) # 13ac <_entry-0x7fffec54>
    80003f18:	2705                	addiw	a4,a4,1
    80003f1a:	2701                	sext.w	a4,a4
    80003f1c:	6685                	lui	a3,0x1
    80003f1e:	97b6                	add	a5,a5,a3
    80003f20:	3ae7a623          	sw	a4,940(a5)
      struct proc *p = myproc();
    80003f24:	fffff097          	auipc	ra,0xfffff
    80003f28:	8ce080e7          	jalr	-1842(ra) # 800027f2 <myproc>
    80003f2c:	faa43c23          	sd	a0,-72(s0)
      if(myproc()->ticks == myproc()->delay){
    80003f30:	fffff097          	auipc	ra,0xfffff
    80003f34:	8c2080e7          	jalr	-1854(ra) # 800027f2 <myproc>
    80003f38:	872a                	mv	a4,a0
    80003f3a:	6785                	lui	a5,0x1
    80003f3c:	97ba                	add	a5,a5,a4
    80003f3e:	3ac7a483          	lw	s1,940(a5) # 13ac <_entry-0x7fffec54>
    80003f42:	fffff097          	auipc	ra,0xfffff
    80003f46:	8b0080e7          	jalr	-1872(ra) # 800027f2 <myproc>
    80003f4a:	872a                	mv	a4,a0
    80003f4c:	6785                	lui	a5,0x1
    80003f4e:	97ba                	add	a5,a5,a4
    80003f50:	3a87a783          	lw	a5,936(a5) # 13a8 <_entry-0x7fffec58>
    80003f54:	8726                	mv	a4,s1
    80003f56:	06f71f63          	bne	a4,a5,80003fd4 <kerneltrap+0x1e2>
        memmove(myproc()->stored_frame + p->context_id, myproc()->trapframe, sizeof(struct trapframe));
    80003f5a:	fffff097          	auipc	ra,0xfffff
    80003f5e:	898080e7          	jalr	-1896(ra) # 800027f2 <myproc>
    80003f62:	87aa                	mv	a5,a0
    80003f64:	1a878713          	addi	a4,a5,424
    80003f68:	fb843683          	ld	a3,-72(s0)
    80003f6c:	6785                	lui	a5,0x1
    80003f6e:	97b6                	add	a5,a5,a3
    80003f70:	3b07a783          	lw	a5,944(a5) # 13b0 <_entry-0x7fffec50>
    80003f74:	86be                	mv	a3,a5
    80003f76:	87b6                	mv	a5,a3
    80003f78:	078e                	slli	a5,a5,0x3
    80003f7a:	97b6                	add	a5,a5,a3
    80003f7c:	0796                	slli	a5,a5,0x5
    80003f7e:	00f704b3          	add	s1,a4,a5
    80003f82:	fffff097          	auipc	ra,0xfffff
    80003f86:	870080e7          	jalr	-1936(ra) # 800027f2 <myproc>
    80003f8a:	87aa                	mv	a5,a0
    80003f8c:	6fbc                	ld	a5,88(a5)
    80003f8e:	12000613          	li	a2,288
    80003f92:	85be                	mv	a1,a5
    80003f94:	8526                	mv	a0,s1
    80003f96:	ffffd097          	auipc	ra,0xffffd
    80003f9a:	5a2080e7          	jalr	1442(ra) # 80001538 <memmove>
        p->trapframe->epc = p->handler;
    80003f9e:	fb843783          	ld	a5,-72(s0)
    80003fa2:	6fbc                	ld	a5,88(a5)
    80003fa4:	fb843683          	ld	a3,-72(s0)
    80003fa8:	6705                	lui	a4,0x1
    80003faa:	9736                	add	a4,a4,a3
    80003fac:	3c073703          	ld	a4,960(a4) # 13c0 <_entry-0x7fffec40>
    80003fb0:	ef98                	sd	a4,24(a5)
        p->trapframe->a0 = p->handler_arg;
    80003fb2:	fb843783          	ld	a5,-72(s0)
    80003fb6:	6fbc                	ld	a5,88(a5)
    80003fb8:	fb843683          	ld	a3,-72(s0)
    80003fbc:	6705                	lui	a4,0x1
    80003fbe:	9736                	add	a4,a4,a3
    80003fc0:	3c873703          	ld	a4,968(a4) # 13c8 <_entry-0x7fffec38>
    80003fc4:	fbb8                	sd	a4,112(a5)
        p->h_flag = 1;
    80003fc6:	fb843703          	ld	a4,-72(s0)
    80003fca:	6785                	lui	a5,0x1
    80003fcc:	97ba                	add	a5,a5,a4
    80003fce:	4705                	li	a4,1
    80003fd0:	3ae7ac23          	sw	a4,952(a5) # 13b8 <_entry-0x7fffec48>
        //p->kernal_flag = 0;
      }
    }
    yield();
    80003fd4:	fffff097          	auipc	ra,0xfffff
    80003fd8:	3cc080e7          	jalr	972(ra) # 800033a0 <yield>
  }

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003fdc:	fd043503          	ld	a0,-48(s0)
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	914080e7          	jalr	-1772(ra) # 800038f4 <w_sepc>
  w_sstatus(sstatus);
    80003fe8:	fc843503          	ld	a0,-56(s0)
    80003fec:	00000097          	auipc	ra,0x0
    80003ff0:	8ba080e7          	jalr	-1862(ra) # 800038a6 <w_sstatus>

}
    80003ff4:	0001                	nop
    80003ff6:	60a6                	ld	ra,72(sp)
    80003ff8:	6406                	ld	s0,64(sp)
    80003ffa:	74e2                	ld	s1,56(sp)
    80003ffc:	6161                	addi	sp,sp,80
    80003ffe:	8082                	ret

0000000080004000 <clockintr>:

void
clockintr()
{
    80004000:	1141                	addi	sp,sp,-16
    80004002:	e406                	sd	ra,8(sp)
    80004004:	e022                	sd	s0,0(sp)
    80004006:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004008:	00060517          	auipc	a0,0x60
    8000400c:	aa850513          	addi	a0,a0,-1368 # 80063ab0 <tickslock>
    80004010:	ffffd097          	auipc	ra,0xffffd
    80004014:	270080e7          	jalr	624(ra) # 80001280 <acquire>
  ticks++;
    80004018:	00008797          	auipc	a5,0x8
    8000401c:	00878793          	addi	a5,a5,8 # 8000c020 <ticks>
    80004020:	439c                	lw	a5,0(a5)
    80004022:	2785                	addiw	a5,a5,1
    80004024:	0007871b          	sext.w	a4,a5
    80004028:	00008797          	auipc	a5,0x8
    8000402c:	ff878793          	addi	a5,a5,-8 # 8000c020 <ticks>
    80004030:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80004032:	00008517          	auipc	a0,0x8
    80004036:	fee50513          	addi	a0,a0,-18 # 8000c020 <ticks>
    8000403a:	fffff097          	auipc	ra,0xfffff
    8000403e:	494080e7          	jalr	1172(ra) # 800034ce <wakeup>
  release(&tickslock);
    80004042:	00060517          	auipc	a0,0x60
    80004046:	a6e50513          	addi	a0,a0,-1426 # 80063ab0 <tickslock>
    8000404a:	ffffd097          	auipc	ra,0xffffd
    8000404e:	29a080e7          	jalr	666(ra) # 800012e4 <release>
}
    80004052:	0001                	nop
    80004054:	60a2                	ld	ra,8(sp)
    80004056:	6402                	ld	s0,0(sp)
    80004058:	0141                	addi	sp,sp,16
    8000405a:	8082                	ret

000000008000405c <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    8000405c:	1101                	addi	sp,sp,-32
    8000405e:	ec06                	sd	ra,24(sp)
    80004060:	e822                	sd	s0,16(sp)
    80004062:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004064:	00000097          	auipc	ra,0x0
    80004068:	8f8080e7          	jalr	-1800(ra) # 8000395c <r_scause>
    8000406c:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80004070:	fe843783          	ld	a5,-24(s0)
    80004074:	0807d463          	bgez	a5,800040fc <devintr+0xa0>
     (scause & 0xff) == 9){
    80004078:	fe843783          	ld	a5,-24(s0)
    8000407c:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004080:	47a5                	li	a5,9
    80004082:	06f71d63          	bne	a4,a5,800040fc <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004086:	00005097          	auipc	ra,0x5
    8000408a:	a7c080e7          	jalr	-1412(ra) # 80008b02 <plic_claim>
    8000408e:	87aa                	mv	a5,a0
    80004090:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004094:	fe442783          	lw	a5,-28(s0)
    80004098:	0007871b          	sext.w	a4,a5
    8000409c:	47a9                	li	a5,10
    8000409e:	00f71763          	bne	a4,a5,800040ac <devintr+0x50>
      uartintr();
    800040a2:	ffffd097          	auipc	ra,0xffffd
    800040a6:	ee6080e7          	jalr	-282(ra) # 80000f88 <uartintr>
    800040aa:	a825                	j	800040e2 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    800040ac:	fe442783          	lw	a5,-28(s0)
    800040b0:	0007871b          	sext.w	a4,a5
    800040b4:	4785                	li	a5,1
    800040b6:	00f71763          	bne	a4,a5,800040c4 <devintr+0x68>
      virtio_disk_intr();
    800040ba:	00005097          	auipc	ra,0x5
    800040be:	35c080e7          	jalr	860(ra) # 80009416 <virtio_disk_intr>
    800040c2:	a005                	j	800040e2 <devintr+0x86>
    } else if(irq){
    800040c4:	fe442783          	lw	a5,-28(s0)
    800040c8:	2781                	sext.w	a5,a5
    800040ca:	cf81                	beqz	a5,800040e2 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    800040cc:	fe442783          	lw	a5,-28(s0)
    800040d0:	85be                	mv	a1,a5
    800040d2:	00007517          	auipc	a0,0x7
    800040d6:	2be50513          	addi	a0,a0,702 # 8000b390 <etext+0x390>
    800040da:	ffffd097          	auipc	ra,0xffffd
    800040de:	922080e7          	jalr	-1758(ra) # 800009fc <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800040e2:	fe442783          	lw	a5,-28(s0)
    800040e6:	2781                	sext.w	a5,a5
    800040e8:	cb81                	beqz	a5,800040f8 <devintr+0x9c>
      plic_complete(irq);
    800040ea:	fe442783          	lw	a5,-28(s0)
    800040ee:	853e                	mv	a0,a5
    800040f0:	00005097          	auipc	ra,0x5
    800040f4:	a50080e7          	jalr	-1456(ra) # 80008b40 <plic_complete>

    return 1;
    800040f8:	4785                	li	a5,1
    800040fa:	a081                	j	8000413a <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    800040fc:	fe843703          	ld	a4,-24(s0)
    80004100:	57fd                	li	a5,-1
    80004102:	17fe                	slli	a5,a5,0x3f
    80004104:	0785                	addi	a5,a5,1
    80004106:	02f71963          	bne	a4,a5,80004138 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    8000410a:	ffffe097          	auipc	ra,0xffffe
    8000410e:	68a080e7          	jalr	1674(ra) # 80002794 <cpuid>
    80004112:	87aa                	mv	a5,a0
    80004114:	e789                	bnez	a5,8000411e <devintr+0xc2>
      clockintr();
    80004116:	00000097          	auipc	ra,0x0
    8000411a:	eea080e7          	jalr	-278(ra) # 80004000 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    8000411e:	fffff097          	auipc	ra,0xfffff
    80004122:	7a2080e7          	jalr	1954(ra) # 800038c0 <r_sip>
    80004126:	87aa                	mv	a5,a0
    80004128:	9bf5                	andi	a5,a5,-3
    8000412a:	853e                	mv	a0,a5
    8000412c:	fffff097          	auipc	ra,0xfffff
    80004130:	7ae080e7          	jalr	1966(ra) # 800038da <w_sip>

    return 2;
    80004134:	4789                	li	a5,2
    80004136:	a011                	j	8000413a <devintr+0xde>
  } else {
    return 0;
    80004138:	4781                	li	a5,0
  }
}
    8000413a:	853e                	mv	a0,a5
    8000413c:	60e2                	ld	ra,24(sp)
    8000413e:	6442                	ld	s0,16(sp)
    80004140:	6105                	addi	sp,sp,32
    80004142:	8082                	ret

0000000080004144 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004144:	7179                	addi	sp,sp,-48
    80004146:	f406                	sd	ra,40(sp)
    80004148:	f022                	sd	s0,32(sp)
    8000414a:	1800                	addi	s0,sp,48
    8000414c:	fca43c23          	sd	a0,-40(s0)
    80004150:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	69e080e7          	jalr	1694(ra) # 800027f2 <myproc>
    8000415c:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80004160:	fe843783          	ld	a5,-24(s0)
    80004164:	67bc                	ld	a5,72(a5)
    80004166:	fd843703          	ld	a4,-40(s0)
    8000416a:	00f77b63          	bgeu	a4,a5,80004180 <fetchaddr+0x3c>
    8000416e:	fd843783          	ld	a5,-40(s0)
    80004172:	00878713          	addi	a4,a5,8
    80004176:	fe843783          	ld	a5,-24(s0)
    8000417a:	67bc                	ld	a5,72(a5)
    8000417c:	00e7f463          	bgeu	a5,a4,80004184 <fetchaddr+0x40>
    return -1;
    80004180:	57fd                	li	a5,-1
    80004182:	a01d                	j	800041a8 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004184:	fe843783          	ld	a5,-24(s0)
    80004188:	6bbc                	ld	a5,80(a5)
    8000418a:	46a1                	li	a3,8
    8000418c:	fd843603          	ld	a2,-40(s0)
    80004190:	fd043583          	ld	a1,-48(s0)
    80004194:	853e                	mv	a0,a5
    80004196:	ffffe097          	auipc	ra,0xffffe
    8000419a:	20c080e7          	jalr	524(ra) # 800023a2 <copyin>
    8000419e:	87aa                	mv	a5,a0
    800041a0:	c399                	beqz	a5,800041a6 <fetchaddr+0x62>
    return -1;
    800041a2:	57fd                	li	a5,-1
    800041a4:	a011                	j	800041a8 <fetchaddr+0x64>
  return 0;
    800041a6:	4781                	li	a5,0
}
    800041a8:	853e                	mv	a0,a5
    800041aa:	70a2                	ld	ra,40(sp)
    800041ac:	7402                	ld	s0,32(sp)
    800041ae:	6145                	addi	sp,sp,48
    800041b0:	8082                	ret

00000000800041b2 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    800041b2:	7139                	addi	sp,sp,-64
    800041b4:	fc06                	sd	ra,56(sp)
    800041b6:	f822                	sd	s0,48(sp)
    800041b8:	0080                	addi	s0,sp,64
    800041ba:	fca43c23          	sd	a0,-40(s0)
    800041be:	fcb43823          	sd	a1,-48(s0)
    800041c2:	87b2                	mv	a5,a2
    800041c4:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800041c8:	ffffe097          	auipc	ra,0xffffe
    800041cc:	62a080e7          	jalr	1578(ra) # 800027f2 <myproc>
    800041d0:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    800041d4:	fe843783          	ld	a5,-24(s0)
    800041d8:	6bbc                	ld	a5,80(a5)
    800041da:	fcc42703          	lw	a4,-52(s0)
    800041de:	86ba                	mv	a3,a4
    800041e0:	fd843603          	ld	a2,-40(s0)
    800041e4:	fd043583          	ld	a1,-48(s0)
    800041e8:	853e                	mv	a0,a5
    800041ea:	ffffe097          	auipc	ra,0xffffe
    800041ee:	286080e7          	jalr	646(ra) # 80002470 <copyinstr>
    800041f2:	87aa                	mv	a5,a0
    800041f4:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    800041f8:	fe442783          	lw	a5,-28(s0)
    800041fc:	2781                	sext.w	a5,a5
    800041fe:	0007d563          	bgez	a5,80004208 <fetchstr+0x56>
    return err;
    80004202:	fe442783          	lw	a5,-28(s0)
    80004206:	a801                	j	80004216 <fetchstr+0x64>
  return strlen(buf);
    80004208:	fd043503          	ld	a0,-48(s0)
    8000420c:	ffffd097          	auipc	ra,0xffffd
    80004210:	5b8080e7          	jalr	1464(ra) # 800017c4 <strlen>
    80004214:	87aa                	mv	a5,a0
}
    80004216:	853e                	mv	a0,a5
    80004218:	70e2                	ld	ra,56(sp)
    8000421a:	7442                	ld	s0,48(sp)
    8000421c:	6121                	addi	sp,sp,64
    8000421e:	8082                	ret

0000000080004220 <argraw>:

static uint64
argraw(int n)
{
    80004220:	7179                	addi	sp,sp,-48
    80004222:	f406                	sd	ra,40(sp)
    80004224:	f022                	sd	s0,32(sp)
    80004226:	1800                	addi	s0,sp,48
    80004228:	87aa                	mv	a5,a0
    8000422a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000422e:	ffffe097          	auipc	ra,0xffffe
    80004232:	5c4080e7          	jalr	1476(ra) # 800027f2 <myproc>
    80004236:	fea43423          	sd	a0,-24(s0)
    8000423a:	fdc42783          	lw	a5,-36(s0)
    8000423e:	0007871b          	sext.w	a4,a5
    80004242:	4795                	li	a5,5
    80004244:	06e7e263          	bltu	a5,a4,800042a8 <argraw+0x88>
    80004248:	fdc46783          	lwu	a5,-36(s0)
    8000424c:	00279713          	slli	a4,a5,0x2
    80004250:	00007797          	auipc	a5,0x7
    80004254:	16878793          	addi	a5,a5,360 # 8000b3b8 <etext+0x3b8>
    80004258:	97ba                	add	a5,a5,a4
    8000425a:	439c                	lw	a5,0(a5)
    8000425c:	0007871b          	sext.w	a4,a5
    80004260:	00007797          	auipc	a5,0x7
    80004264:	15878793          	addi	a5,a5,344 # 8000b3b8 <etext+0x3b8>
    80004268:	97ba                	add	a5,a5,a4
    8000426a:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000426c:	fe843783          	ld	a5,-24(s0)
    80004270:	6fbc                	ld	a5,88(a5)
    80004272:	7bbc                	ld	a5,112(a5)
    80004274:	a091                	j	800042b8 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004276:	fe843783          	ld	a5,-24(s0)
    8000427a:	6fbc                	ld	a5,88(a5)
    8000427c:	7fbc                	ld	a5,120(a5)
    8000427e:	a82d                	j	800042b8 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004280:	fe843783          	ld	a5,-24(s0)
    80004284:	6fbc                	ld	a5,88(a5)
    80004286:	63dc                	ld	a5,128(a5)
    80004288:	a805                	j	800042b8 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    8000428a:	fe843783          	ld	a5,-24(s0)
    8000428e:	6fbc                	ld	a5,88(a5)
    80004290:	67dc                	ld	a5,136(a5)
    80004292:	a01d                	j	800042b8 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004294:	fe843783          	ld	a5,-24(s0)
    80004298:	6fbc                	ld	a5,88(a5)
    8000429a:	6bdc                	ld	a5,144(a5)
    8000429c:	a831                	j	800042b8 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000429e:	fe843783          	ld	a5,-24(s0)
    800042a2:	6fbc                	ld	a5,88(a5)
    800042a4:	6fdc                	ld	a5,152(a5)
    800042a6:	a809                	j	800042b8 <argraw+0x98>
  }
  panic("argraw");
    800042a8:	00007517          	auipc	a0,0x7
    800042ac:	10850513          	addi	a0,a0,264 # 8000b3b0 <etext+0x3b0>
    800042b0:	ffffd097          	auipc	ra,0xffffd
    800042b4:	9a2080e7          	jalr	-1630(ra) # 80000c52 <panic>
  return -1;
}
    800042b8:	853e                	mv	a0,a5
    800042ba:	70a2                	ld	ra,40(sp)
    800042bc:	7402                	ld	s0,32(sp)
    800042be:	6145                	addi	sp,sp,48
    800042c0:	8082                	ret

00000000800042c2 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    800042c2:	1101                	addi	sp,sp,-32
    800042c4:	ec06                	sd	ra,24(sp)
    800042c6:	e822                	sd	s0,16(sp)
    800042c8:	1000                	addi	s0,sp,32
    800042ca:	87aa                	mv	a5,a0
    800042cc:	feb43023          	sd	a1,-32(s0)
    800042d0:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800042d4:	fec42783          	lw	a5,-20(s0)
    800042d8:	853e                	mv	a0,a5
    800042da:	00000097          	auipc	ra,0x0
    800042de:	f46080e7          	jalr	-186(ra) # 80004220 <argraw>
    800042e2:	87aa                	mv	a5,a0
    800042e4:	0007871b          	sext.w	a4,a5
    800042e8:	fe043783          	ld	a5,-32(s0)
    800042ec:	c398                	sw	a4,0(a5)
  return 0;
    800042ee:	4781                	li	a5,0
}
    800042f0:	853e                	mv	a0,a5
    800042f2:	60e2                	ld	ra,24(sp)
    800042f4:	6442                	ld	s0,16(sp)
    800042f6:	6105                	addi	sp,sp,32
    800042f8:	8082                	ret

00000000800042fa <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    800042fa:	1101                	addi	sp,sp,-32
    800042fc:	ec06                	sd	ra,24(sp)
    800042fe:	e822                	sd	s0,16(sp)
    80004300:	1000                	addi	s0,sp,32
    80004302:	87aa                	mv	a5,a0
    80004304:	feb43023          	sd	a1,-32(s0)
    80004308:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000430c:	fec42783          	lw	a5,-20(s0)
    80004310:	853e                	mv	a0,a5
    80004312:	00000097          	auipc	ra,0x0
    80004316:	f0e080e7          	jalr	-242(ra) # 80004220 <argraw>
    8000431a:	872a                	mv	a4,a0
    8000431c:	fe043783          	ld	a5,-32(s0)
    80004320:	e398                	sd	a4,0(a5)
  return 0;
    80004322:	4781                	li	a5,0
}
    80004324:	853e                	mv	a0,a5
    80004326:	60e2                	ld	ra,24(sp)
    80004328:	6442                	ld	s0,16(sp)
    8000432a:	6105                	addi	sp,sp,32
    8000432c:	8082                	ret

000000008000432e <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    8000432e:	7179                	addi	sp,sp,-48
    80004330:	f406                	sd	ra,40(sp)
    80004332:	f022                	sd	s0,32(sp)
    80004334:	1800                	addi	s0,sp,48
    80004336:	87aa                	mv	a5,a0
    80004338:	fcb43823          	sd	a1,-48(s0)
    8000433c:	8732                	mv	a4,a2
    8000433e:	fcf42e23          	sw	a5,-36(s0)
    80004342:	87ba                	mv	a5,a4
    80004344:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    80004348:	fe840713          	addi	a4,s0,-24
    8000434c:	fdc42783          	lw	a5,-36(s0)
    80004350:	85ba                	mv	a1,a4
    80004352:	853e                	mv	a0,a5
    80004354:	00000097          	auipc	ra,0x0
    80004358:	fa6080e7          	jalr	-90(ra) # 800042fa <argaddr>
    8000435c:	87aa                	mv	a5,a0
    8000435e:	0007d463          	bgez	a5,80004366 <argstr+0x38>
    return -1;
    80004362:	57fd                	li	a5,-1
    80004364:	a831                	j	80004380 <argstr+0x52>
  return fetchstr(addr, buf, max);
    80004366:	fe843783          	ld	a5,-24(s0)
    8000436a:	fd842703          	lw	a4,-40(s0)
    8000436e:	863a                	mv	a2,a4
    80004370:	fd043583          	ld	a1,-48(s0)
    80004374:	853e                	mv	a0,a5
    80004376:	00000097          	auipc	ra,0x0
    8000437a:	e3c080e7          	jalr	-452(ra) # 800041b2 <fetchstr>
    8000437e:	87aa                	mv	a5,a0
}
    80004380:	853e                	mv	a0,a5
    80004382:	70a2                	ld	ra,40(sp)
    80004384:	7402                	ld	s0,32(sp)
    80004386:	6145                	addi	sp,sp,48
    80004388:	8082                	ret

000000008000438a <syscall>:
[SYS_cancelthrdstop]   sys_cancelthrdstop,
};

void
syscall(void)
{
    8000438a:	7179                	addi	sp,sp,-48
    8000438c:	f406                	sd	ra,40(sp)
    8000438e:	f022                	sd	s0,32(sp)
    80004390:	ec26                	sd	s1,24(sp)
    80004392:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004394:	ffffe097          	auipc	ra,0xffffe
    80004398:	45e080e7          	jalr	1118(ra) # 800027f2 <myproc>
    8000439c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    800043a0:	fd843783          	ld	a5,-40(s0)
    800043a4:	6fbc                	ld	a5,88(a5)
    800043a6:	77dc                	ld	a5,168(a5)
    800043a8:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800043ac:	fd442783          	lw	a5,-44(s0)
    800043b0:	2781                	sext.w	a5,a5
    800043b2:	04f05263          	blez	a5,800043f6 <syscall+0x6c>
    800043b6:	fd442783          	lw	a5,-44(s0)
    800043ba:	873e                	mv	a4,a5
    800043bc:	47e1                	li	a5,24
    800043be:	02e7ec63          	bltu	a5,a4,800043f6 <syscall+0x6c>
    800043c2:	00007717          	auipc	a4,0x7
    800043c6:	41670713          	addi	a4,a4,1046 # 8000b7d8 <syscalls>
    800043ca:	fd442783          	lw	a5,-44(s0)
    800043ce:	078e                	slli	a5,a5,0x3
    800043d0:	97ba                	add	a5,a5,a4
    800043d2:	639c                	ld	a5,0(a5)
    800043d4:	c38d                	beqz	a5,800043f6 <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    800043d6:	00007717          	auipc	a4,0x7
    800043da:	40270713          	addi	a4,a4,1026 # 8000b7d8 <syscalls>
    800043de:	fd442783          	lw	a5,-44(s0)
    800043e2:	078e                	slli	a5,a5,0x3
    800043e4:	97ba                	add	a5,a5,a4
    800043e6:	6398                	ld	a4,0(a5)
    800043e8:	fd843783          	ld	a5,-40(s0)
    800043ec:	6fa4                	ld	s1,88(a5)
    800043ee:	9702                	jalr	a4
    800043f0:	87aa                	mv	a5,a0
    800043f2:	f8bc                	sd	a5,112(s1)
    800043f4:	a815                	j	80004428 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800043f6:	fd843783          	ld	a5,-40(s0)
    800043fa:	5f98                	lw	a4,56(a5)
            p->pid, p->name, num);
    800043fc:	fd843783          	ld	a5,-40(s0)
    80004400:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    80004404:	fd442683          	lw	a3,-44(s0)
    80004408:	863e                	mv	a2,a5
    8000440a:	85ba                	mv	a1,a4
    8000440c:	00007517          	auipc	a0,0x7
    80004410:	fc450513          	addi	a0,a0,-60 # 8000b3d0 <etext+0x3d0>
    80004414:	ffffc097          	auipc	ra,0xffffc
    80004418:	5e8080e7          	jalr	1512(ra) # 800009fc <printf>
    p->trapframe->a0 = -1;
    8000441c:	fd843783          	ld	a5,-40(s0)
    80004420:	6fbc                	ld	a5,88(a5)
    80004422:	577d                	li	a4,-1
    80004424:	fbb8                	sd	a4,112(a5)
  }
}
    80004426:	0001                	nop
    80004428:	0001                	nop
    8000442a:	70a2                	ld	ra,40(sp)
    8000442c:	7402                	ld	s0,32(sp)
    8000442e:	64e2                	ld	s1,24(sp)
    80004430:	6145                	addi	sp,sp,48
    80004432:	8082                	ret

0000000080004434 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    80004434:	1101                	addi	sp,sp,-32
    80004436:	ec06                	sd	ra,24(sp)
    80004438:	e822                	sd	s0,16(sp)
    8000443a:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8000443c:	fec40793          	addi	a5,s0,-20
    80004440:	85be                	mv	a1,a5
    80004442:	4501                	li	a0,0
    80004444:	00000097          	auipc	ra,0x0
    80004448:	e7e080e7          	jalr	-386(ra) # 800042c2 <argint>
    8000444c:	87aa                	mv	a5,a0
    8000444e:	0007d463          	bgez	a5,80004456 <sys_exit+0x22>
    return -1;
    80004452:	57fd                	li	a5,-1
    80004454:	a809                	j	80004466 <sys_exit+0x32>
  exit(n);
    80004456:	fec42783          	lw	a5,-20(s0)
    8000445a:	853e                	mv	a0,a5
    8000445c:	fffff097          	auipc	ra,0xfffff
    80004460:	abe080e7          	jalr	-1346(ra) # 80002f1a <exit>
  return 0;  // not reached
    80004464:	4781                	li	a5,0
}
    80004466:	853e                	mv	a0,a5
    80004468:	60e2                	ld	ra,24(sp)
    8000446a:	6442                	ld	s0,16(sp)
    8000446c:	6105                	addi	sp,sp,32
    8000446e:	8082                	ret

0000000080004470 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004470:	1141                	addi	sp,sp,-16
    80004472:	e406                	sd	ra,8(sp)
    80004474:	e022                	sd	s0,0(sp)
    80004476:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004478:	ffffe097          	auipc	ra,0xffffe
    8000447c:	37a080e7          	jalr	890(ra) # 800027f2 <myproc>
    80004480:	87aa                	mv	a5,a0
    80004482:	5f9c                	lw	a5,56(a5)
}
    80004484:	853e                	mv	a0,a5
    80004486:	60a2                	ld	ra,8(sp)
    80004488:	6402                	ld	s0,0(sp)
    8000448a:	0141                	addi	sp,sp,16
    8000448c:	8082                	ret

000000008000448e <sys_fork>:

uint64
sys_fork(void)
{
    8000448e:	1141                	addi	sp,sp,-16
    80004490:	e406                	sd	ra,8(sp)
    80004492:	e022                	sd	s0,0(sp)
    80004494:	0800                	addi	s0,sp,16
  return fork();
    80004496:	fffff097          	auipc	ra,0xfffff
    8000449a:	892080e7          	jalr	-1902(ra) # 80002d28 <fork>
    8000449e:	87aa                	mv	a5,a0
}
    800044a0:	853e                	mv	a0,a5
    800044a2:	60a2                	ld	ra,8(sp)
    800044a4:	6402                	ld	s0,0(sp)
    800044a6:	0141                	addi	sp,sp,16
    800044a8:	8082                	ret

00000000800044aa <sys_wait>:

uint64
sys_wait(void)
{
    800044aa:	1101                	addi	sp,sp,-32
    800044ac:	ec06                	sd	ra,24(sp)
    800044ae:	e822                	sd	s0,16(sp)
    800044b0:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    800044b2:	fe840793          	addi	a5,s0,-24
    800044b6:	85be                	mv	a1,a5
    800044b8:	4501                	li	a0,0
    800044ba:	00000097          	auipc	ra,0x0
    800044be:	e40080e7          	jalr	-448(ra) # 800042fa <argaddr>
    800044c2:	87aa                	mv	a5,a0
    800044c4:	0007d463          	bgez	a5,800044cc <sys_wait+0x22>
    return -1;
    800044c8:	57fd                	li	a5,-1
    800044ca:	a809                	j	800044dc <sys_wait+0x32>
  return wait(p);
    800044cc:	fe843783          	ld	a5,-24(s0)
    800044d0:	853e                	mv	a0,a5
    800044d2:	fffff097          	auipc	ra,0xfffff
    800044d6:	bde080e7          	jalr	-1058(ra) # 800030b0 <wait>
    800044da:	87aa                	mv	a5,a0
}
    800044dc:	853e                	mv	a0,a5
    800044de:	60e2                	ld	ra,24(sp)
    800044e0:	6442                	ld	s0,16(sp)
    800044e2:	6105                	addi	sp,sp,32
    800044e4:	8082                	ret

00000000800044e6 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800044e6:	1101                	addi	sp,sp,-32
    800044e8:	ec06                	sd	ra,24(sp)
    800044ea:	e822                	sd	s0,16(sp)
    800044ec:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800044ee:	fe840793          	addi	a5,s0,-24
    800044f2:	85be                	mv	a1,a5
    800044f4:	4501                	li	a0,0
    800044f6:	00000097          	auipc	ra,0x0
    800044fa:	dcc080e7          	jalr	-564(ra) # 800042c2 <argint>
    800044fe:	87aa                	mv	a5,a0
    80004500:	0007d463          	bgez	a5,80004508 <sys_sbrk+0x22>
    return -1;
    80004504:	57fd                	li	a5,-1
    80004506:	a03d                	j	80004534 <sys_sbrk+0x4e>
  addr = myproc()->sz;
    80004508:	ffffe097          	auipc	ra,0xffffe
    8000450c:	2ea080e7          	jalr	746(ra) # 800027f2 <myproc>
    80004510:	87aa                	mv	a5,a0
    80004512:	67bc                	ld	a5,72(a5)
    80004514:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    80004518:	fe842783          	lw	a5,-24(s0)
    8000451c:	853e                	mv	a0,a5
    8000451e:	ffffe097          	auipc	ra,0xffffe
    80004522:	758080e7          	jalr	1880(ra) # 80002c76 <growproc>
    80004526:	87aa                	mv	a5,a0
    80004528:	0007d463          	bgez	a5,80004530 <sys_sbrk+0x4a>
    return -1;
    8000452c:	57fd                	li	a5,-1
    8000452e:	a019                	j	80004534 <sys_sbrk+0x4e>
  return addr;
    80004530:	fec42783          	lw	a5,-20(s0)
}
    80004534:	853e                	mv	a0,a5
    80004536:	60e2                	ld	ra,24(sp)
    80004538:	6442                	ld	s0,16(sp)
    8000453a:	6105                	addi	sp,sp,32
    8000453c:	8082                	ret

000000008000453e <sys_sleep>:

uint64
sys_sleep(void)
{
    8000453e:	1101                	addi	sp,sp,-32
    80004540:	ec06                	sd	ra,24(sp)
    80004542:	e822                	sd	s0,16(sp)
    80004544:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80004546:	fe840793          	addi	a5,s0,-24
    8000454a:	85be                	mv	a1,a5
    8000454c:	4501                	li	a0,0
    8000454e:	00000097          	auipc	ra,0x0
    80004552:	d74080e7          	jalr	-652(ra) # 800042c2 <argint>
    80004556:	87aa                	mv	a5,a0
    80004558:	0007d463          	bgez	a5,80004560 <sys_sleep+0x22>
    return -1;
    8000455c:	57fd                	li	a5,-1
    8000455e:	a079                	j	800045ec <sys_sleep+0xae>
  acquire(&tickslock);
    80004560:	0005f517          	auipc	a0,0x5f
    80004564:	55050513          	addi	a0,a0,1360 # 80063ab0 <tickslock>
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	d18080e7          	jalr	-744(ra) # 80001280 <acquire>
  ticks0 = ticks;
    80004570:	00008797          	auipc	a5,0x8
    80004574:	ab078793          	addi	a5,a5,-1360 # 8000c020 <ticks>
    80004578:	439c                	lw	a5,0(a5)
    8000457a:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000457e:	a835                	j	800045ba <sys_sleep+0x7c>
    if(myproc()->killed){
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	272080e7          	jalr	626(ra) # 800027f2 <myproc>
    80004588:	87aa                	mv	a5,a0
    8000458a:	5b9c                	lw	a5,48(a5)
    8000458c:	cb99                	beqz	a5,800045a2 <sys_sleep+0x64>
      release(&tickslock);
    8000458e:	0005f517          	auipc	a0,0x5f
    80004592:	52250513          	addi	a0,a0,1314 # 80063ab0 <tickslock>
    80004596:	ffffd097          	auipc	ra,0xffffd
    8000459a:	d4e080e7          	jalr	-690(ra) # 800012e4 <release>
      return -1;
    8000459e:	57fd                	li	a5,-1
    800045a0:	a0b1                	j	800045ec <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    800045a2:	0005f597          	auipc	a1,0x5f
    800045a6:	50e58593          	addi	a1,a1,1294 # 80063ab0 <tickslock>
    800045aa:	00008517          	auipc	a0,0x8
    800045ae:	a7650513          	addi	a0,a0,-1418 # 8000c020 <ticks>
    800045b2:	fffff097          	auipc	ra,0xfffff
    800045b6:	e88080e7          	jalr	-376(ra) # 8000343a <sleep>
  while(ticks - ticks0 < n){
    800045ba:	00008797          	auipc	a5,0x8
    800045be:	a6678793          	addi	a5,a5,-1434 # 8000c020 <ticks>
    800045c2:	4398                	lw	a4,0(a5)
    800045c4:	fec42783          	lw	a5,-20(s0)
    800045c8:	40f707bb          	subw	a5,a4,a5
    800045cc:	0007871b          	sext.w	a4,a5
    800045d0:	fe842783          	lw	a5,-24(s0)
    800045d4:	2781                	sext.w	a5,a5
    800045d6:	faf765e3          	bltu	a4,a5,80004580 <sys_sleep+0x42>
  }
  release(&tickslock);
    800045da:	0005f517          	auipc	a0,0x5f
    800045de:	4d650513          	addi	a0,a0,1238 # 80063ab0 <tickslock>
    800045e2:	ffffd097          	auipc	ra,0xffffd
    800045e6:	d02080e7          	jalr	-766(ra) # 800012e4 <release>
  return 0;
    800045ea:	4781                	li	a5,0
}
    800045ec:	853e                	mv	a0,a5
    800045ee:	60e2                	ld	ra,24(sp)
    800045f0:	6442                	ld	s0,16(sp)
    800045f2:	6105                	addi	sp,sp,32
    800045f4:	8082                	ret

00000000800045f6 <sys_kill>:

uint64
sys_kill(void)
{
    800045f6:	1101                	addi	sp,sp,-32
    800045f8:	ec06                	sd	ra,24(sp)
    800045fa:	e822                	sd	s0,16(sp)
    800045fc:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800045fe:	fec40793          	addi	a5,s0,-20
    80004602:	85be                	mv	a1,a5
    80004604:	4501                	li	a0,0
    80004606:	00000097          	auipc	ra,0x0
    8000460a:	cbc080e7          	jalr	-836(ra) # 800042c2 <argint>
    8000460e:	87aa                	mv	a5,a0
    80004610:	0007d463          	bgez	a5,80004618 <sys_kill+0x22>
    return -1;
    80004614:	57fd                	li	a5,-1
    80004616:	a809                	j	80004628 <sys_kill+0x32>
  return kill(pid);
    80004618:	fec42783          	lw	a5,-20(s0)
    8000461c:	853e                	mv	a0,a5
    8000461e:	fffff097          	auipc	ra,0xfffff
    80004622:	f92080e7          	jalr	-110(ra) # 800035b0 <kill>
    80004626:	87aa                	mv	a5,a0
}
    80004628:	853e                	mv	a0,a5
    8000462a:	60e2                	ld	ra,24(sp)
    8000462c:	6442                	ld	s0,16(sp)
    8000462e:	6105                	addi	sp,sp,32
    80004630:	8082                	ret

0000000080004632 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004632:	1101                	addi	sp,sp,-32
    80004634:	ec06                	sd	ra,24(sp)
    80004636:	e822                	sd	s0,16(sp)
    80004638:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8000463a:	0005f517          	auipc	a0,0x5f
    8000463e:	47650513          	addi	a0,a0,1142 # 80063ab0 <tickslock>
    80004642:	ffffd097          	auipc	ra,0xffffd
    80004646:	c3e080e7          	jalr	-962(ra) # 80001280 <acquire>
  xticks = ticks;
    8000464a:	00008797          	auipc	a5,0x8
    8000464e:	9d678793          	addi	a5,a5,-1578 # 8000c020 <ticks>
    80004652:	439c                	lw	a5,0(a5)
    80004654:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004658:	0005f517          	auipc	a0,0x5f
    8000465c:	45850513          	addi	a0,a0,1112 # 80063ab0 <tickslock>
    80004660:	ffffd097          	auipc	ra,0xffffd
    80004664:	c84080e7          	jalr	-892(ra) # 800012e4 <release>
  return xticks;
    80004668:	fec46783          	lwu	a5,-20(s0)
}
    8000466c:	853e                	mv	a0,a5
    8000466e:	60e2                	ld	ra,24(sp)
    80004670:	6442                	ld	s0,16(sp)
    80004672:	6105                	addi	sp,sp,32
    80004674:	8082                	ret

0000000080004676 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004676:	1101                	addi	sp,sp,-32
    80004678:	ec06                	sd	ra,24(sp)
    8000467a:	e822                	sd	s0,16(sp)
    8000467c:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8000467e:	00007597          	auipc	a1,0x7
    80004682:	d7258593          	addi	a1,a1,-654 # 8000b3f0 <etext+0x3f0>
    80004686:	0005f517          	auipc	a0,0x5f
    8000468a:	44250513          	addi	a0,a0,1090 # 80063ac8 <bcache>
    8000468e:	ffffd097          	auipc	ra,0xffffd
    80004692:	bc2080e7          	jalr	-1086(ra) # 80001250 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004696:	0005f717          	auipc	a4,0x5f
    8000469a:	43270713          	addi	a4,a4,1074 # 80063ac8 <bcache>
    8000469e:	67a1                	lui	a5,0x8
    800046a0:	97ba                	add	a5,a5,a4
    800046a2:	00067717          	auipc	a4,0x67
    800046a6:	68e70713          	addi	a4,a4,1678 # 8006bd30 <bcache+0x8268>
    800046aa:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800046ae:	0005f717          	auipc	a4,0x5f
    800046b2:	41a70713          	addi	a4,a4,1050 # 80063ac8 <bcache>
    800046b6:	67a1                	lui	a5,0x8
    800046b8:	97ba                	add	a5,a5,a4
    800046ba:	00067717          	auipc	a4,0x67
    800046be:	67670713          	addi	a4,a4,1654 # 8006bd30 <bcache+0x8268>
    800046c2:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800046c6:	0005f797          	auipc	a5,0x5f
    800046ca:	41a78793          	addi	a5,a5,1050 # 80063ae0 <bcache+0x18>
    800046ce:	fef43423          	sd	a5,-24(s0)
    800046d2:	a895                	j	80004746 <binit+0xd0>
    b->next = bcache.head.next;
    800046d4:	0005f717          	auipc	a4,0x5f
    800046d8:	3f470713          	addi	a4,a4,1012 # 80063ac8 <bcache>
    800046dc:	67a1                	lui	a5,0x8
    800046de:	97ba                	add	a5,a5,a4
    800046e0:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    800046e4:	fe843783          	ld	a5,-24(s0)
    800046e8:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    800046ea:	fe843783          	ld	a5,-24(s0)
    800046ee:	00067717          	auipc	a4,0x67
    800046f2:	64270713          	addi	a4,a4,1602 # 8006bd30 <bcache+0x8268>
    800046f6:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    800046f8:	fe843783          	ld	a5,-24(s0)
    800046fc:	07c1                	addi	a5,a5,16
    800046fe:	00007597          	auipc	a1,0x7
    80004702:	cfa58593          	addi	a1,a1,-774 # 8000b3f8 <etext+0x3f8>
    80004706:	853e                	mv	a0,a5
    80004708:	00002097          	auipc	ra,0x2
    8000470c:	006080e7          	jalr	6(ra) # 8000670e <initsleeplock>
    bcache.head.next->prev = b;
    80004710:	0005f717          	auipc	a4,0x5f
    80004714:	3b870713          	addi	a4,a4,952 # 80063ac8 <bcache>
    80004718:	67a1                	lui	a5,0x8
    8000471a:	97ba                	add	a5,a5,a4
    8000471c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004720:	fe843703          	ld	a4,-24(s0)
    80004724:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004726:	0005f717          	auipc	a4,0x5f
    8000472a:	3a270713          	addi	a4,a4,930 # 80063ac8 <bcache>
    8000472e:	67a1                	lui	a5,0x8
    80004730:	97ba                	add	a5,a5,a4
    80004732:	fe843703          	ld	a4,-24(s0)
    80004736:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000473a:	fe843783          	ld	a5,-24(s0)
    8000473e:	45878793          	addi	a5,a5,1112
    80004742:	fef43423          	sd	a5,-24(s0)
    80004746:	00067797          	auipc	a5,0x67
    8000474a:	5ea78793          	addi	a5,a5,1514 # 8006bd30 <bcache+0x8268>
    8000474e:	fe843703          	ld	a4,-24(s0)
    80004752:	f8f761e3          	bltu	a4,a5,800046d4 <binit+0x5e>
  }
}
    80004756:	0001                	nop
    80004758:	0001                	nop
    8000475a:	60e2                	ld	ra,24(sp)
    8000475c:	6442                	ld	s0,16(sp)
    8000475e:	6105                	addi	sp,sp,32
    80004760:	8082                	ret

0000000080004762 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004762:	7179                	addi	sp,sp,-48
    80004764:	f406                	sd	ra,40(sp)
    80004766:	f022                	sd	s0,32(sp)
    80004768:	1800                	addi	s0,sp,48
    8000476a:	87aa                	mv	a5,a0
    8000476c:	872e                	mv	a4,a1
    8000476e:	fcf42e23          	sw	a5,-36(s0)
    80004772:	87ba                	mv	a5,a4
    80004774:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004778:	0005f517          	auipc	a0,0x5f
    8000477c:	35050513          	addi	a0,a0,848 # 80063ac8 <bcache>
    80004780:	ffffd097          	auipc	ra,0xffffd
    80004784:	b00080e7          	jalr	-1280(ra) # 80001280 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004788:	0005f717          	auipc	a4,0x5f
    8000478c:	34070713          	addi	a4,a4,832 # 80063ac8 <bcache>
    80004790:	67a1                	lui	a5,0x8
    80004792:	97ba                	add	a5,a5,a4
    80004794:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004798:	fef43423          	sd	a5,-24(s0)
    8000479c:	a095                	j	80004800 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    8000479e:	fe843783          	ld	a5,-24(s0)
    800047a2:	4798                	lw	a4,8(a5)
    800047a4:	fdc42783          	lw	a5,-36(s0)
    800047a8:	2781                	sext.w	a5,a5
    800047aa:	04e79663          	bne	a5,a4,800047f6 <bget+0x94>
    800047ae:	fe843783          	ld	a5,-24(s0)
    800047b2:	47d8                	lw	a4,12(a5)
    800047b4:	fd842783          	lw	a5,-40(s0)
    800047b8:	2781                	sext.w	a5,a5
    800047ba:	02e79e63          	bne	a5,a4,800047f6 <bget+0x94>
      b->refcnt++;
    800047be:	fe843783          	ld	a5,-24(s0)
    800047c2:	43bc                	lw	a5,64(a5)
    800047c4:	2785                	addiw	a5,a5,1
    800047c6:	0007871b          	sext.w	a4,a5
    800047ca:	fe843783          	ld	a5,-24(s0)
    800047ce:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800047d0:	0005f517          	auipc	a0,0x5f
    800047d4:	2f850513          	addi	a0,a0,760 # 80063ac8 <bcache>
    800047d8:	ffffd097          	auipc	ra,0xffffd
    800047dc:	b0c080e7          	jalr	-1268(ra) # 800012e4 <release>
      acquiresleep(&b->lock);
    800047e0:	fe843783          	ld	a5,-24(s0)
    800047e4:	07c1                	addi	a5,a5,16
    800047e6:	853e                	mv	a0,a5
    800047e8:	00002097          	auipc	ra,0x2
    800047ec:	f72080e7          	jalr	-142(ra) # 8000675a <acquiresleep>
      return b;
    800047f0:	fe843783          	ld	a5,-24(s0)
    800047f4:	a07d                	j	800048a2 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800047f6:	fe843783          	ld	a5,-24(s0)
    800047fa:	6bbc                	ld	a5,80(a5)
    800047fc:	fef43423          	sd	a5,-24(s0)
    80004800:	fe843703          	ld	a4,-24(s0)
    80004804:	00067797          	auipc	a5,0x67
    80004808:	52c78793          	addi	a5,a5,1324 # 8006bd30 <bcache+0x8268>
    8000480c:	f8f719e3          	bne	a4,a5,8000479e <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004810:	0005f717          	auipc	a4,0x5f
    80004814:	2b870713          	addi	a4,a4,696 # 80063ac8 <bcache>
    80004818:	67a1                	lui	a5,0x8
    8000481a:	97ba                	add	a5,a5,a4
    8000481c:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004820:	fef43423          	sd	a5,-24(s0)
    80004824:	a8b9                	j	80004882 <bget+0x120>
    if(b->refcnt == 0) {
    80004826:	fe843783          	ld	a5,-24(s0)
    8000482a:	43bc                	lw	a5,64(a5)
    8000482c:	e7b1                	bnez	a5,80004878 <bget+0x116>
      b->dev = dev;
    8000482e:	fe843783          	ld	a5,-24(s0)
    80004832:	fdc42703          	lw	a4,-36(s0)
    80004836:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004838:	fe843783          	ld	a5,-24(s0)
    8000483c:	fd842703          	lw	a4,-40(s0)
    80004840:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004842:	fe843783          	ld	a5,-24(s0)
    80004846:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    8000484a:	fe843783          	ld	a5,-24(s0)
    8000484e:	4705                	li	a4,1
    80004850:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004852:	0005f517          	auipc	a0,0x5f
    80004856:	27650513          	addi	a0,a0,630 # 80063ac8 <bcache>
    8000485a:	ffffd097          	auipc	ra,0xffffd
    8000485e:	a8a080e7          	jalr	-1398(ra) # 800012e4 <release>
      acquiresleep(&b->lock);
    80004862:	fe843783          	ld	a5,-24(s0)
    80004866:	07c1                	addi	a5,a5,16
    80004868:	853e                	mv	a0,a5
    8000486a:	00002097          	auipc	ra,0x2
    8000486e:	ef0080e7          	jalr	-272(ra) # 8000675a <acquiresleep>
      return b;
    80004872:	fe843783          	ld	a5,-24(s0)
    80004876:	a035                	j	800048a2 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004878:	fe843783          	ld	a5,-24(s0)
    8000487c:	67bc                	ld	a5,72(a5)
    8000487e:	fef43423          	sd	a5,-24(s0)
    80004882:	fe843703          	ld	a4,-24(s0)
    80004886:	00067797          	auipc	a5,0x67
    8000488a:	4aa78793          	addi	a5,a5,1194 # 8006bd30 <bcache+0x8268>
    8000488e:	f8f71ce3          	bne	a4,a5,80004826 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004892:	00007517          	auipc	a0,0x7
    80004896:	b6e50513          	addi	a0,a0,-1170 # 8000b400 <etext+0x400>
    8000489a:	ffffc097          	auipc	ra,0xffffc
    8000489e:	3b8080e7          	jalr	952(ra) # 80000c52 <panic>
}
    800048a2:	853e                	mv	a0,a5
    800048a4:	70a2                	ld	ra,40(sp)
    800048a6:	7402                	ld	s0,32(sp)
    800048a8:	6145                	addi	sp,sp,48
    800048aa:	8082                	ret

00000000800048ac <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800048ac:	7179                	addi	sp,sp,-48
    800048ae:	f406                	sd	ra,40(sp)
    800048b0:	f022                	sd	s0,32(sp)
    800048b2:	1800                	addi	s0,sp,48
    800048b4:	87aa                	mv	a5,a0
    800048b6:	872e                	mv	a4,a1
    800048b8:	fcf42e23          	sw	a5,-36(s0)
    800048bc:	87ba                	mv	a5,a4
    800048be:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    800048c2:	fd842703          	lw	a4,-40(s0)
    800048c6:	fdc42783          	lw	a5,-36(s0)
    800048ca:	85ba                	mv	a1,a4
    800048cc:	853e                	mv	a0,a5
    800048ce:	00000097          	auipc	ra,0x0
    800048d2:	e94080e7          	jalr	-364(ra) # 80004762 <bget>
    800048d6:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    800048da:	fe843783          	ld	a5,-24(s0)
    800048de:	439c                	lw	a5,0(a5)
    800048e0:	ef81                	bnez	a5,800048f8 <bread+0x4c>
    virtio_disk_rw(b, 0);
    800048e2:	4581                	li	a1,0
    800048e4:	fe843503          	ld	a0,-24(s0)
    800048e8:	00004097          	auipc	ra,0x4
    800048ec:	792080e7          	jalr	1938(ra) # 8000907a <virtio_disk_rw>
    b->valid = 1;
    800048f0:	fe843783          	ld	a5,-24(s0)
    800048f4:	4705                	li	a4,1
    800048f6:	c398                	sw	a4,0(a5)
  }
  return b;
    800048f8:	fe843783          	ld	a5,-24(s0)
}
    800048fc:	853e                	mv	a0,a5
    800048fe:	70a2                	ld	ra,40(sp)
    80004900:	7402                	ld	s0,32(sp)
    80004902:	6145                	addi	sp,sp,48
    80004904:	8082                	ret

0000000080004906 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004906:	1101                	addi	sp,sp,-32
    80004908:	ec06                	sd	ra,24(sp)
    8000490a:	e822                	sd	s0,16(sp)
    8000490c:	1000                	addi	s0,sp,32
    8000490e:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004912:	fe843783          	ld	a5,-24(s0)
    80004916:	07c1                	addi	a5,a5,16
    80004918:	853e                	mv	a0,a5
    8000491a:	00002097          	auipc	ra,0x2
    8000491e:	f00080e7          	jalr	-256(ra) # 8000681a <holdingsleep>
    80004922:	87aa                	mv	a5,a0
    80004924:	eb89                	bnez	a5,80004936 <bwrite+0x30>
    panic("bwrite");
    80004926:	00007517          	auipc	a0,0x7
    8000492a:	af250513          	addi	a0,a0,-1294 # 8000b418 <etext+0x418>
    8000492e:	ffffc097          	auipc	ra,0xffffc
    80004932:	324080e7          	jalr	804(ra) # 80000c52 <panic>
  virtio_disk_rw(b, 1);
    80004936:	4585                	li	a1,1
    80004938:	fe843503          	ld	a0,-24(s0)
    8000493c:	00004097          	auipc	ra,0x4
    80004940:	73e080e7          	jalr	1854(ra) # 8000907a <virtio_disk_rw>
}
    80004944:	0001                	nop
    80004946:	60e2                	ld	ra,24(sp)
    80004948:	6442                	ld	s0,16(sp)
    8000494a:	6105                	addi	sp,sp,32
    8000494c:	8082                	ret

000000008000494e <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    8000494e:	1101                	addi	sp,sp,-32
    80004950:	ec06                	sd	ra,24(sp)
    80004952:	e822                	sd	s0,16(sp)
    80004954:	1000                	addi	s0,sp,32
    80004956:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    8000495a:	fe843783          	ld	a5,-24(s0)
    8000495e:	07c1                	addi	a5,a5,16
    80004960:	853e                	mv	a0,a5
    80004962:	00002097          	auipc	ra,0x2
    80004966:	eb8080e7          	jalr	-328(ra) # 8000681a <holdingsleep>
    8000496a:	87aa                	mv	a5,a0
    8000496c:	eb89                	bnez	a5,8000497e <brelse+0x30>
    panic("brelse");
    8000496e:	00007517          	auipc	a0,0x7
    80004972:	ab250513          	addi	a0,a0,-1358 # 8000b420 <etext+0x420>
    80004976:	ffffc097          	auipc	ra,0xffffc
    8000497a:	2dc080e7          	jalr	732(ra) # 80000c52 <panic>

  releasesleep(&b->lock);
    8000497e:	fe843783          	ld	a5,-24(s0)
    80004982:	07c1                	addi	a5,a5,16
    80004984:	853e                	mv	a0,a5
    80004986:	00002097          	auipc	ra,0x2
    8000498a:	e42080e7          	jalr	-446(ra) # 800067c8 <releasesleep>

  acquire(&bcache.lock);
    8000498e:	0005f517          	auipc	a0,0x5f
    80004992:	13a50513          	addi	a0,a0,314 # 80063ac8 <bcache>
    80004996:	ffffd097          	auipc	ra,0xffffd
    8000499a:	8ea080e7          	jalr	-1814(ra) # 80001280 <acquire>
  b->refcnt--;
    8000499e:	fe843783          	ld	a5,-24(s0)
    800049a2:	43bc                	lw	a5,64(a5)
    800049a4:	37fd                	addiw	a5,a5,-1
    800049a6:	0007871b          	sext.w	a4,a5
    800049aa:	fe843783          	ld	a5,-24(s0)
    800049ae:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    800049b0:	fe843783          	ld	a5,-24(s0)
    800049b4:	43bc                	lw	a5,64(a5)
    800049b6:	e7b5                	bnez	a5,80004a22 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    800049b8:	fe843783          	ld	a5,-24(s0)
    800049bc:	6bbc                	ld	a5,80(a5)
    800049be:	fe843703          	ld	a4,-24(s0)
    800049c2:	6738                	ld	a4,72(a4)
    800049c4:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    800049c6:	fe843783          	ld	a5,-24(s0)
    800049ca:	67bc                	ld	a5,72(a5)
    800049cc:	fe843703          	ld	a4,-24(s0)
    800049d0:	6b38                	ld	a4,80(a4)
    800049d2:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    800049d4:	0005f717          	auipc	a4,0x5f
    800049d8:	0f470713          	addi	a4,a4,244 # 80063ac8 <bcache>
    800049dc:	67a1                	lui	a5,0x8
    800049de:	97ba                	add	a5,a5,a4
    800049e0:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    800049e4:	fe843783          	ld	a5,-24(s0)
    800049e8:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    800049ea:	fe843783          	ld	a5,-24(s0)
    800049ee:	00067717          	auipc	a4,0x67
    800049f2:	34270713          	addi	a4,a4,834 # 8006bd30 <bcache+0x8268>
    800049f6:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    800049f8:	0005f717          	auipc	a4,0x5f
    800049fc:	0d070713          	addi	a4,a4,208 # 80063ac8 <bcache>
    80004a00:	67a1                	lui	a5,0x8
    80004a02:	97ba                	add	a5,a5,a4
    80004a04:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a08:	fe843703          	ld	a4,-24(s0)
    80004a0c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004a0e:	0005f717          	auipc	a4,0x5f
    80004a12:	0ba70713          	addi	a4,a4,186 # 80063ac8 <bcache>
    80004a16:	67a1                	lui	a5,0x8
    80004a18:	97ba                	add	a5,a5,a4
    80004a1a:	fe843703          	ld	a4,-24(s0)
    80004a1e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004a22:	0005f517          	auipc	a0,0x5f
    80004a26:	0a650513          	addi	a0,a0,166 # 80063ac8 <bcache>
    80004a2a:	ffffd097          	auipc	ra,0xffffd
    80004a2e:	8ba080e7          	jalr	-1862(ra) # 800012e4 <release>
}
    80004a32:	0001                	nop
    80004a34:	60e2                	ld	ra,24(sp)
    80004a36:	6442                	ld	s0,16(sp)
    80004a38:	6105                	addi	sp,sp,32
    80004a3a:	8082                	ret

0000000080004a3c <bpin>:

void
bpin(struct buf *b) {
    80004a3c:	1101                	addi	sp,sp,-32
    80004a3e:	ec06                	sd	ra,24(sp)
    80004a40:	e822                	sd	s0,16(sp)
    80004a42:	1000                	addi	s0,sp,32
    80004a44:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004a48:	0005f517          	auipc	a0,0x5f
    80004a4c:	08050513          	addi	a0,a0,128 # 80063ac8 <bcache>
    80004a50:	ffffd097          	auipc	ra,0xffffd
    80004a54:	830080e7          	jalr	-2000(ra) # 80001280 <acquire>
  b->refcnt++;
    80004a58:	fe843783          	ld	a5,-24(s0)
    80004a5c:	43bc                	lw	a5,64(a5)
    80004a5e:	2785                	addiw	a5,a5,1
    80004a60:	0007871b          	sext.w	a4,a5
    80004a64:	fe843783          	ld	a5,-24(s0)
    80004a68:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004a6a:	0005f517          	auipc	a0,0x5f
    80004a6e:	05e50513          	addi	a0,a0,94 # 80063ac8 <bcache>
    80004a72:	ffffd097          	auipc	ra,0xffffd
    80004a76:	872080e7          	jalr	-1934(ra) # 800012e4 <release>
}
    80004a7a:	0001                	nop
    80004a7c:	60e2                	ld	ra,24(sp)
    80004a7e:	6442                	ld	s0,16(sp)
    80004a80:	6105                	addi	sp,sp,32
    80004a82:	8082                	ret

0000000080004a84 <bunpin>:

void
bunpin(struct buf *b) {
    80004a84:	1101                	addi	sp,sp,-32
    80004a86:	ec06                	sd	ra,24(sp)
    80004a88:	e822                	sd	s0,16(sp)
    80004a8a:	1000                	addi	s0,sp,32
    80004a8c:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004a90:	0005f517          	auipc	a0,0x5f
    80004a94:	03850513          	addi	a0,a0,56 # 80063ac8 <bcache>
    80004a98:	ffffc097          	auipc	ra,0xffffc
    80004a9c:	7e8080e7          	jalr	2024(ra) # 80001280 <acquire>
  b->refcnt--;
    80004aa0:	fe843783          	ld	a5,-24(s0)
    80004aa4:	43bc                	lw	a5,64(a5)
    80004aa6:	37fd                	addiw	a5,a5,-1
    80004aa8:	0007871b          	sext.w	a4,a5
    80004aac:	fe843783          	ld	a5,-24(s0)
    80004ab0:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004ab2:	0005f517          	auipc	a0,0x5f
    80004ab6:	01650513          	addi	a0,a0,22 # 80063ac8 <bcache>
    80004aba:	ffffd097          	auipc	ra,0xffffd
    80004abe:	82a080e7          	jalr	-2006(ra) # 800012e4 <release>
}
    80004ac2:	0001                	nop
    80004ac4:	60e2                	ld	ra,24(sp)
    80004ac6:	6442                	ld	s0,16(sp)
    80004ac8:	6105                	addi	sp,sp,32
    80004aca:	8082                	ret

0000000080004acc <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004acc:	7179                	addi	sp,sp,-48
    80004ace:	f406                	sd	ra,40(sp)
    80004ad0:	f022                	sd	s0,32(sp)
    80004ad2:	1800                	addi	s0,sp,48
    80004ad4:	87aa                	mv	a5,a0
    80004ad6:	fcb43823          	sd	a1,-48(s0)
    80004ada:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004ade:	fdc42783          	lw	a5,-36(s0)
    80004ae2:	4585                	li	a1,1
    80004ae4:	853e                	mv	a0,a5
    80004ae6:	00000097          	auipc	ra,0x0
    80004aea:	dc6080e7          	jalr	-570(ra) # 800048ac <bread>
    80004aee:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004af2:	fe843783          	ld	a5,-24(s0)
    80004af6:	05878793          	addi	a5,a5,88
    80004afa:	02000613          	li	a2,32
    80004afe:	85be                	mv	a1,a5
    80004b00:	fd043503          	ld	a0,-48(s0)
    80004b04:	ffffd097          	auipc	ra,0xffffd
    80004b08:	a34080e7          	jalr	-1484(ra) # 80001538 <memmove>
  brelse(bp);
    80004b0c:	fe843503          	ld	a0,-24(s0)
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	e3e080e7          	jalr	-450(ra) # 8000494e <brelse>
}
    80004b18:	0001                	nop
    80004b1a:	70a2                	ld	ra,40(sp)
    80004b1c:	7402                	ld	s0,32(sp)
    80004b1e:	6145                	addi	sp,sp,48
    80004b20:	8082                	ret

0000000080004b22 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004b22:	1101                	addi	sp,sp,-32
    80004b24:	ec06                	sd	ra,24(sp)
    80004b26:	e822                	sd	s0,16(sp)
    80004b28:	1000                	addi	s0,sp,32
    80004b2a:	87aa                	mv	a5,a0
    80004b2c:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004b30:	fec42783          	lw	a5,-20(s0)
    80004b34:	00067597          	auipc	a1,0x67
    80004b38:	65458593          	addi	a1,a1,1620 # 8006c188 <sb>
    80004b3c:	853e                	mv	a0,a5
    80004b3e:	00000097          	auipc	ra,0x0
    80004b42:	f8e080e7          	jalr	-114(ra) # 80004acc <readsb>
  if(sb.magic != FSMAGIC)
    80004b46:	00067797          	auipc	a5,0x67
    80004b4a:	64278793          	addi	a5,a5,1602 # 8006c188 <sb>
    80004b4e:	439c                	lw	a5,0(a5)
    80004b50:	873e                	mv	a4,a5
    80004b52:	102037b7          	lui	a5,0x10203
    80004b56:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004b5a:	00f70a63          	beq	a4,a5,80004b6e <fsinit+0x4c>
    panic("invalid file system");
    80004b5e:	00007517          	auipc	a0,0x7
    80004b62:	8ca50513          	addi	a0,a0,-1846 # 8000b428 <etext+0x428>
    80004b66:	ffffc097          	auipc	ra,0xffffc
    80004b6a:	0ec080e7          	jalr	236(ra) # 80000c52 <panic>
  initlog(dev, &sb);
    80004b6e:	fec42783          	lw	a5,-20(s0)
    80004b72:	00067597          	auipc	a1,0x67
    80004b76:	61658593          	addi	a1,a1,1558 # 8006c188 <sb>
    80004b7a:	853e                	mv	a0,a5
    80004b7c:	00001097          	auipc	ra,0x1
    80004b80:	476080e7          	jalr	1142(ra) # 80005ff2 <initlog>
}
    80004b84:	0001                	nop
    80004b86:	60e2                	ld	ra,24(sp)
    80004b88:	6442                	ld	s0,16(sp)
    80004b8a:	6105                	addi	sp,sp,32
    80004b8c:	8082                	ret

0000000080004b8e <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004b8e:	7179                	addi	sp,sp,-48
    80004b90:	f406                	sd	ra,40(sp)
    80004b92:	f022                	sd	s0,32(sp)
    80004b94:	1800                	addi	s0,sp,48
    80004b96:	87aa                	mv	a5,a0
    80004b98:	872e                	mv	a4,a1
    80004b9a:	fcf42e23          	sw	a5,-36(s0)
    80004b9e:	87ba                	mv	a5,a4
    80004ba0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004ba4:	fdc42783          	lw	a5,-36(s0)
    80004ba8:	fd842703          	lw	a4,-40(s0)
    80004bac:	85ba                	mv	a1,a4
    80004bae:	853e                	mv	a0,a5
    80004bb0:	00000097          	auipc	ra,0x0
    80004bb4:	cfc080e7          	jalr	-772(ra) # 800048ac <bread>
    80004bb8:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004bbc:	fe843783          	ld	a5,-24(s0)
    80004bc0:	05878793          	addi	a5,a5,88
    80004bc4:	40000613          	li	a2,1024
    80004bc8:	4581                	li	a1,0
    80004bca:	853e                	mv	a0,a5
    80004bcc:	ffffd097          	auipc	ra,0xffffd
    80004bd0:	888080e7          	jalr	-1912(ra) # 80001454 <memset>
  log_write(bp);
    80004bd4:	fe843503          	ld	a0,-24(s0)
    80004bd8:	00002097          	auipc	ra,0x2
    80004bdc:	a02080e7          	jalr	-1534(ra) # 800065da <log_write>
  brelse(bp);
    80004be0:	fe843503          	ld	a0,-24(s0)
    80004be4:	00000097          	auipc	ra,0x0
    80004be8:	d6a080e7          	jalr	-662(ra) # 8000494e <brelse>
}
    80004bec:	0001                	nop
    80004bee:	70a2                	ld	ra,40(sp)
    80004bf0:	7402                	ld	s0,32(sp)
    80004bf2:	6145                	addi	sp,sp,48
    80004bf4:	8082                	ret

0000000080004bf6 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80004bf6:	7139                	addi	sp,sp,-64
    80004bf8:	fc06                	sd	ra,56(sp)
    80004bfa:	f822                	sd	s0,48(sp)
    80004bfc:	0080                	addi	s0,sp,64
    80004bfe:	87aa                	mv	a5,a0
    80004c00:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c04:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c08:	fe042623          	sw	zero,-20(s0)
    80004c0c:	a2b5                	j	80004d78 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004c0e:	fec42783          	lw	a5,-20(s0)
    80004c12:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c16:	0137571b          	srliw	a4,a4,0x13
    80004c1a:	9fb9                	addw	a5,a5,a4
    80004c1c:	40d7d79b          	sraiw	a5,a5,0xd
    80004c20:	2781                	sext.w	a5,a5
    80004c22:	0007871b          	sext.w	a4,a5
    80004c26:	00067797          	auipc	a5,0x67
    80004c2a:	56278793          	addi	a5,a5,1378 # 8006c188 <sb>
    80004c2e:	4fdc                	lw	a5,28(a5)
    80004c30:	9fb9                	addw	a5,a5,a4
    80004c32:	0007871b          	sext.w	a4,a5
    80004c36:	fcc42783          	lw	a5,-52(s0)
    80004c3a:	85ba                	mv	a1,a4
    80004c3c:	853e                	mv	a0,a5
    80004c3e:	00000097          	auipc	ra,0x0
    80004c42:	c6e080e7          	jalr	-914(ra) # 800048ac <bread>
    80004c46:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004c4a:	fe042423          	sw	zero,-24(s0)
    80004c4e:	a0dd                	j	80004d34 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004c50:	fe842703          	lw	a4,-24(s0)
    80004c54:	41f7579b          	sraiw	a5,a4,0x1f
    80004c58:	01d7d79b          	srliw	a5,a5,0x1d
    80004c5c:	9f3d                	addw	a4,a4,a5
    80004c5e:	8b1d                	andi	a4,a4,7
    80004c60:	40f707bb          	subw	a5,a4,a5
    80004c64:	2781                	sext.w	a5,a5
    80004c66:	4705                	li	a4,1
    80004c68:	00f717bb          	sllw	a5,a4,a5
    80004c6c:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004c70:	fe842783          	lw	a5,-24(s0)
    80004c74:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c78:	01d7571b          	srliw	a4,a4,0x1d
    80004c7c:	9fb9                	addw	a5,a5,a4
    80004c7e:	4037d79b          	sraiw	a5,a5,0x3
    80004c82:	2781                	sext.w	a5,a5
    80004c84:	fe043703          	ld	a4,-32(s0)
    80004c88:	97ba                	add	a5,a5,a4
    80004c8a:	0587c783          	lbu	a5,88(a5)
    80004c8e:	0007871b          	sext.w	a4,a5
    80004c92:	fdc42783          	lw	a5,-36(s0)
    80004c96:	8ff9                	and	a5,a5,a4
    80004c98:	2781                	sext.w	a5,a5
    80004c9a:	ebc1                	bnez	a5,80004d2a <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004c9c:	fe842783          	lw	a5,-24(s0)
    80004ca0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ca4:	01d7571b          	srliw	a4,a4,0x1d
    80004ca8:	9fb9                	addw	a5,a5,a4
    80004caa:	4037d79b          	sraiw	a5,a5,0x3
    80004cae:	2781                	sext.w	a5,a5
    80004cb0:	fe043703          	ld	a4,-32(s0)
    80004cb4:	973e                	add	a4,a4,a5
    80004cb6:	05874703          	lbu	a4,88(a4)
    80004cba:	0187169b          	slliw	a3,a4,0x18
    80004cbe:	4186d69b          	sraiw	a3,a3,0x18
    80004cc2:	fdc42703          	lw	a4,-36(s0)
    80004cc6:	0187171b          	slliw	a4,a4,0x18
    80004cca:	4187571b          	sraiw	a4,a4,0x18
    80004cce:	8f55                	or	a4,a4,a3
    80004cd0:	0187171b          	slliw	a4,a4,0x18
    80004cd4:	4187571b          	sraiw	a4,a4,0x18
    80004cd8:	0ff77713          	andi	a4,a4,255
    80004cdc:	fe043683          	ld	a3,-32(s0)
    80004ce0:	97b6                	add	a5,a5,a3
    80004ce2:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004ce6:	fe043503          	ld	a0,-32(s0)
    80004cea:	00002097          	auipc	ra,0x2
    80004cee:	8f0080e7          	jalr	-1808(ra) # 800065da <log_write>
        brelse(bp);
    80004cf2:	fe043503          	ld	a0,-32(s0)
    80004cf6:	00000097          	auipc	ra,0x0
    80004cfa:	c58080e7          	jalr	-936(ra) # 8000494e <brelse>
        bzero(dev, b + bi);
    80004cfe:	fcc42683          	lw	a3,-52(s0)
    80004d02:	fec42703          	lw	a4,-20(s0)
    80004d06:	fe842783          	lw	a5,-24(s0)
    80004d0a:	9fb9                	addw	a5,a5,a4
    80004d0c:	2781                	sext.w	a5,a5
    80004d0e:	85be                	mv	a1,a5
    80004d10:	8536                	mv	a0,a3
    80004d12:	00000097          	auipc	ra,0x0
    80004d16:	e7c080e7          	jalr	-388(ra) # 80004b8e <bzero>
        return b + bi;
    80004d1a:	fec42703          	lw	a4,-20(s0)
    80004d1e:	fe842783          	lw	a5,-24(s0)
    80004d22:	9fb9                	addw	a5,a5,a4
    80004d24:	2781                	sext.w	a5,a5
    80004d26:	2781                	sext.w	a5,a5
    80004d28:	a88d                	j	80004d9a <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d2a:	fe842783          	lw	a5,-24(s0)
    80004d2e:	2785                	addiw	a5,a5,1
    80004d30:	fef42423          	sw	a5,-24(s0)
    80004d34:	fe842783          	lw	a5,-24(s0)
    80004d38:	0007871b          	sext.w	a4,a5
    80004d3c:	6789                	lui	a5,0x2
    80004d3e:	02f75163          	bge	a4,a5,80004d60 <balloc+0x16a>
    80004d42:	fec42703          	lw	a4,-20(s0)
    80004d46:	fe842783          	lw	a5,-24(s0)
    80004d4a:	9fb9                	addw	a5,a5,a4
    80004d4c:	2781                	sext.w	a5,a5
    80004d4e:	0007871b          	sext.w	a4,a5
    80004d52:	00067797          	auipc	a5,0x67
    80004d56:	43678793          	addi	a5,a5,1078 # 8006c188 <sb>
    80004d5a:	43dc                	lw	a5,4(a5)
    80004d5c:	eef76ae3          	bltu	a4,a5,80004c50 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004d60:	fe043503          	ld	a0,-32(s0)
    80004d64:	00000097          	auipc	ra,0x0
    80004d68:	bea080e7          	jalr	-1046(ra) # 8000494e <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004d6c:	fec42703          	lw	a4,-20(s0)
    80004d70:	6789                	lui	a5,0x2
    80004d72:	9fb9                	addw	a5,a5,a4
    80004d74:	fef42623          	sw	a5,-20(s0)
    80004d78:	00067797          	auipc	a5,0x67
    80004d7c:	41078793          	addi	a5,a5,1040 # 8006c188 <sb>
    80004d80:	43d8                	lw	a4,4(a5)
    80004d82:	fec42783          	lw	a5,-20(s0)
    80004d86:	e8e7e4e3          	bltu	a5,a4,80004c0e <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004d8a:	00006517          	auipc	a0,0x6
    80004d8e:	6b650513          	addi	a0,a0,1718 # 8000b440 <etext+0x440>
    80004d92:	ffffc097          	auipc	ra,0xffffc
    80004d96:	ec0080e7          	jalr	-320(ra) # 80000c52 <panic>
}
    80004d9a:	853e                	mv	a0,a5
    80004d9c:	70e2                	ld	ra,56(sp)
    80004d9e:	7442                	ld	s0,48(sp)
    80004da0:	6121                	addi	sp,sp,64
    80004da2:	8082                	ret

0000000080004da4 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004da4:	7179                	addi	sp,sp,-48
    80004da6:	f406                	sd	ra,40(sp)
    80004da8:	f022                	sd	s0,32(sp)
    80004daa:	1800                	addi	s0,sp,48
    80004dac:	87aa                	mv	a5,a0
    80004dae:	872e                	mv	a4,a1
    80004db0:	fcf42e23          	sw	a5,-36(s0)
    80004db4:	87ba                	mv	a5,a4
    80004db6:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004dba:	fdc42683          	lw	a3,-36(s0)
    80004dbe:	fd842783          	lw	a5,-40(s0)
    80004dc2:	00d7d79b          	srliw	a5,a5,0xd
    80004dc6:	0007871b          	sext.w	a4,a5
    80004dca:	00067797          	auipc	a5,0x67
    80004dce:	3be78793          	addi	a5,a5,958 # 8006c188 <sb>
    80004dd2:	4fdc                	lw	a5,28(a5)
    80004dd4:	9fb9                	addw	a5,a5,a4
    80004dd6:	2781                	sext.w	a5,a5
    80004dd8:	85be                	mv	a1,a5
    80004dda:	8536                	mv	a0,a3
    80004ddc:	00000097          	auipc	ra,0x0
    80004de0:	ad0080e7          	jalr	-1328(ra) # 800048ac <bread>
    80004de4:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004de8:	fd842703          	lw	a4,-40(s0)
    80004dec:	6789                	lui	a5,0x2
    80004dee:	17fd                	addi	a5,a5,-1
    80004df0:	8ff9                	and	a5,a5,a4
    80004df2:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004df6:	fe442703          	lw	a4,-28(s0)
    80004dfa:	41f7579b          	sraiw	a5,a4,0x1f
    80004dfe:	01d7d79b          	srliw	a5,a5,0x1d
    80004e02:	9f3d                	addw	a4,a4,a5
    80004e04:	8b1d                	andi	a4,a4,7
    80004e06:	40f707bb          	subw	a5,a4,a5
    80004e0a:	2781                	sext.w	a5,a5
    80004e0c:	4705                	li	a4,1
    80004e0e:	00f717bb          	sllw	a5,a4,a5
    80004e12:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004e16:	fe442783          	lw	a5,-28(s0)
    80004e1a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e1e:	01d7571b          	srliw	a4,a4,0x1d
    80004e22:	9fb9                	addw	a5,a5,a4
    80004e24:	4037d79b          	sraiw	a5,a5,0x3
    80004e28:	2781                	sext.w	a5,a5
    80004e2a:	fe843703          	ld	a4,-24(s0)
    80004e2e:	97ba                	add	a5,a5,a4
    80004e30:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004e34:	0007871b          	sext.w	a4,a5
    80004e38:	fe042783          	lw	a5,-32(s0)
    80004e3c:	8ff9                	and	a5,a5,a4
    80004e3e:	2781                	sext.w	a5,a5
    80004e40:	eb89                	bnez	a5,80004e52 <bfree+0xae>
    panic("freeing free block");
    80004e42:	00006517          	auipc	a0,0x6
    80004e46:	61650513          	addi	a0,a0,1558 # 8000b458 <etext+0x458>
    80004e4a:	ffffc097          	auipc	ra,0xffffc
    80004e4e:	e08080e7          	jalr	-504(ra) # 80000c52 <panic>
  bp->data[bi/8] &= ~m;
    80004e52:	fe442783          	lw	a5,-28(s0)
    80004e56:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e5a:	01d7571b          	srliw	a4,a4,0x1d
    80004e5e:	9fb9                	addw	a5,a5,a4
    80004e60:	4037d79b          	sraiw	a5,a5,0x3
    80004e64:	2781                	sext.w	a5,a5
    80004e66:	fe843703          	ld	a4,-24(s0)
    80004e6a:	973e                	add	a4,a4,a5
    80004e6c:	05874703          	lbu	a4,88(a4)
    80004e70:	0187169b          	slliw	a3,a4,0x18
    80004e74:	4186d69b          	sraiw	a3,a3,0x18
    80004e78:	fe042703          	lw	a4,-32(s0)
    80004e7c:	0187171b          	slliw	a4,a4,0x18
    80004e80:	4187571b          	sraiw	a4,a4,0x18
    80004e84:	fff74713          	not	a4,a4
    80004e88:	0187171b          	slliw	a4,a4,0x18
    80004e8c:	4187571b          	sraiw	a4,a4,0x18
    80004e90:	8f75                	and	a4,a4,a3
    80004e92:	0187171b          	slliw	a4,a4,0x18
    80004e96:	4187571b          	sraiw	a4,a4,0x18
    80004e9a:	0ff77713          	andi	a4,a4,255
    80004e9e:	fe843683          	ld	a3,-24(s0)
    80004ea2:	97b6                	add	a5,a5,a3
    80004ea4:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004ea8:	fe843503          	ld	a0,-24(s0)
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	72e080e7          	jalr	1838(ra) # 800065da <log_write>
  brelse(bp);
    80004eb4:	fe843503          	ld	a0,-24(s0)
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	a96080e7          	jalr	-1386(ra) # 8000494e <brelse>
}
    80004ec0:	0001                	nop
    80004ec2:	70a2                	ld	ra,40(sp)
    80004ec4:	7402                	ld	s0,32(sp)
    80004ec6:	6145                	addi	sp,sp,48
    80004ec8:	8082                	ret

0000000080004eca <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit()
{
    80004eca:	1101                	addi	sp,sp,-32
    80004ecc:	ec06                	sd	ra,24(sp)
    80004ece:	e822                	sd	s0,16(sp)
    80004ed0:	1000                	addi	s0,sp,32
  int i = 0;
    80004ed2:	fe042623          	sw	zero,-20(s0)
  
  initlock(&icache.lock, "icache");
    80004ed6:	00006597          	auipc	a1,0x6
    80004eda:	59a58593          	addi	a1,a1,1434 # 8000b470 <etext+0x470>
    80004ede:	00067517          	auipc	a0,0x67
    80004ee2:	2ca50513          	addi	a0,a0,714 # 8006c1a8 <icache>
    80004ee6:	ffffc097          	auipc	ra,0xffffc
    80004eea:	36a080e7          	jalr	874(ra) # 80001250 <initlock>
  for(i = 0; i < NINODE; i++) {
    80004eee:	fe042623          	sw	zero,-20(s0)
    80004ef2:	a82d                	j	80004f2c <iinit+0x62>
    initsleeplock(&icache.inode[i].lock, "inode");
    80004ef4:	fec42703          	lw	a4,-20(s0)
    80004ef8:	87ba                	mv	a5,a4
    80004efa:	0792                	slli	a5,a5,0x4
    80004efc:	97ba                	add	a5,a5,a4
    80004efe:	078e                	slli	a5,a5,0x3
    80004f00:	02078713          	addi	a4,a5,32
    80004f04:	00067797          	auipc	a5,0x67
    80004f08:	2a478793          	addi	a5,a5,676 # 8006c1a8 <icache>
    80004f0c:	97ba                	add	a5,a5,a4
    80004f0e:	07a1                	addi	a5,a5,8
    80004f10:	00006597          	auipc	a1,0x6
    80004f14:	56858593          	addi	a1,a1,1384 # 8000b478 <etext+0x478>
    80004f18:	853e                	mv	a0,a5
    80004f1a:	00001097          	auipc	ra,0x1
    80004f1e:	7f4080e7          	jalr	2036(ra) # 8000670e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004f22:	fec42783          	lw	a5,-20(s0)
    80004f26:	2785                	addiw	a5,a5,1
    80004f28:	fef42623          	sw	a5,-20(s0)
    80004f2c:	fec42783          	lw	a5,-20(s0)
    80004f30:	0007871b          	sext.w	a4,a5
    80004f34:	03100793          	li	a5,49
    80004f38:	fae7dee3          	bge	a5,a4,80004ef4 <iinit+0x2a>
  }
}
    80004f3c:	0001                	nop
    80004f3e:	0001                	nop
    80004f40:	60e2                	ld	ra,24(sp)
    80004f42:	6442                	ld	s0,16(sp)
    80004f44:	6105                	addi	sp,sp,32
    80004f46:	8082                	ret

0000000080004f48 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80004f48:	7139                	addi	sp,sp,-64
    80004f4a:	fc06                	sd	ra,56(sp)
    80004f4c:	f822                	sd	s0,48(sp)
    80004f4e:	0080                	addi	s0,sp,64
    80004f50:	87aa                	mv	a5,a0
    80004f52:	872e                	mv	a4,a1
    80004f54:	fcf42623          	sw	a5,-52(s0)
    80004f58:	87ba                	mv	a5,a4
    80004f5a:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004f5e:	4785                	li	a5,1
    80004f60:	fef42623          	sw	a5,-20(s0)
    80004f64:	a855                	j	80005018 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004f66:	fec42783          	lw	a5,-20(s0)
    80004f6a:	8391                	srli	a5,a5,0x4
    80004f6c:	0007871b          	sext.w	a4,a5
    80004f70:	00067797          	auipc	a5,0x67
    80004f74:	21878793          	addi	a5,a5,536 # 8006c188 <sb>
    80004f78:	4f9c                	lw	a5,24(a5)
    80004f7a:	9fb9                	addw	a5,a5,a4
    80004f7c:	0007871b          	sext.w	a4,a5
    80004f80:	fcc42783          	lw	a5,-52(s0)
    80004f84:	85ba                	mv	a1,a4
    80004f86:	853e                	mv	a0,a5
    80004f88:	00000097          	auipc	ra,0x0
    80004f8c:	924080e7          	jalr	-1756(ra) # 800048ac <bread>
    80004f90:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004f94:	fe043783          	ld	a5,-32(s0)
    80004f98:	05878713          	addi	a4,a5,88
    80004f9c:	fec42783          	lw	a5,-20(s0)
    80004fa0:	8bbd                	andi	a5,a5,15
    80004fa2:	079a                	slli	a5,a5,0x6
    80004fa4:	97ba                	add	a5,a5,a4
    80004fa6:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004faa:	fd843783          	ld	a5,-40(s0)
    80004fae:	00079783          	lh	a5,0(a5)
    80004fb2:	eba1                	bnez	a5,80005002 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004fb4:	04000613          	li	a2,64
    80004fb8:	4581                	li	a1,0
    80004fba:	fd843503          	ld	a0,-40(s0)
    80004fbe:	ffffc097          	auipc	ra,0xffffc
    80004fc2:	496080e7          	jalr	1174(ra) # 80001454 <memset>
      dip->type = type;
    80004fc6:	fd843783          	ld	a5,-40(s0)
    80004fca:	fca45703          	lhu	a4,-54(s0)
    80004fce:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004fd2:	fe043503          	ld	a0,-32(s0)
    80004fd6:	00001097          	auipc	ra,0x1
    80004fda:	604080e7          	jalr	1540(ra) # 800065da <log_write>
      brelse(bp);
    80004fde:	fe043503          	ld	a0,-32(s0)
    80004fe2:	00000097          	auipc	ra,0x0
    80004fe6:	96c080e7          	jalr	-1684(ra) # 8000494e <brelse>
      return iget(dev, inum);
    80004fea:	fec42703          	lw	a4,-20(s0)
    80004fee:	fcc42783          	lw	a5,-52(s0)
    80004ff2:	85ba                	mv	a1,a4
    80004ff4:	853e                	mv	a0,a5
    80004ff6:	00000097          	auipc	ra,0x0
    80004ffa:	136080e7          	jalr	310(ra) # 8000512c <iget>
    80004ffe:	87aa                	mv	a5,a0
    80005000:	a82d                	j	8000503a <ialloc+0xf2>
    }
    brelse(bp);
    80005002:	fe043503          	ld	a0,-32(s0)
    80005006:	00000097          	auipc	ra,0x0
    8000500a:	948080e7          	jalr	-1720(ra) # 8000494e <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000500e:	fec42783          	lw	a5,-20(s0)
    80005012:	2785                	addiw	a5,a5,1
    80005014:	fef42623          	sw	a5,-20(s0)
    80005018:	00067797          	auipc	a5,0x67
    8000501c:	17078793          	addi	a5,a5,368 # 8006c188 <sb>
    80005020:	47d8                	lw	a4,12(a5)
    80005022:	fec42783          	lw	a5,-20(s0)
    80005026:	f4e7e0e3          	bltu	a5,a4,80004f66 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    8000502a:	00006517          	auipc	a0,0x6
    8000502e:	45650513          	addi	a0,a0,1110 # 8000b480 <etext+0x480>
    80005032:	ffffc097          	auipc	ra,0xffffc
    80005036:	c20080e7          	jalr	-992(ra) # 80000c52 <panic>
}
    8000503a:	853e                	mv	a0,a5
    8000503c:	70e2                	ld	ra,56(sp)
    8000503e:	7442                	ld	s0,48(sp)
    80005040:	6121                	addi	sp,sp,64
    80005042:	8082                	ret

0000000080005044 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005044:	7179                	addi	sp,sp,-48
    80005046:	f406                	sd	ra,40(sp)
    80005048:	f022                	sd	s0,32(sp)
    8000504a:	1800                	addi	s0,sp,48
    8000504c:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005050:	fd843783          	ld	a5,-40(s0)
    80005054:	4394                	lw	a3,0(a5)
    80005056:	fd843783          	ld	a5,-40(s0)
    8000505a:	43dc                	lw	a5,4(a5)
    8000505c:	0047d79b          	srliw	a5,a5,0x4
    80005060:	0007871b          	sext.w	a4,a5
    80005064:	00067797          	auipc	a5,0x67
    80005068:	12478793          	addi	a5,a5,292 # 8006c188 <sb>
    8000506c:	4f9c                	lw	a5,24(a5)
    8000506e:	9fb9                	addw	a5,a5,a4
    80005070:	2781                	sext.w	a5,a5
    80005072:	85be                	mv	a1,a5
    80005074:	8536                	mv	a0,a3
    80005076:	00000097          	auipc	ra,0x0
    8000507a:	836080e7          	jalr	-1994(ra) # 800048ac <bread>
    8000507e:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005082:	fe843783          	ld	a5,-24(s0)
    80005086:	05878713          	addi	a4,a5,88
    8000508a:	fd843783          	ld	a5,-40(s0)
    8000508e:	43dc                	lw	a5,4(a5)
    80005090:	1782                	slli	a5,a5,0x20
    80005092:	9381                	srli	a5,a5,0x20
    80005094:	8bbd                	andi	a5,a5,15
    80005096:	079a                	slli	a5,a5,0x6
    80005098:	97ba                	add	a5,a5,a4
    8000509a:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000509e:	fd843783          	ld	a5,-40(s0)
    800050a2:	04479703          	lh	a4,68(a5)
    800050a6:	fe043783          	ld	a5,-32(s0)
    800050aa:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800050ae:	fd843783          	ld	a5,-40(s0)
    800050b2:	04679703          	lh	a4,70(a5)
    800050b6:	fe043783          	ld	a5,-32(s0)
    800050ba:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    800050be:	fd843783          	ld	a5,-40(s0)
    800050c2:	04879703          	lh	a4,72(a5)
    800050c6:	fe043783          	ld	a5,-32(s0)
    800050ca:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    800050ce:	fd843783          	ld	a5,-40(s0)
    800050d2:	04a79703          	lh	a4,74(a5)
    800050d6:	fe043783          	ld	a5,-32(s0)
    800050da:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    800050de:	fd843783          	ld	a5,-40(s0)
    800050e2:	47f8                	lw	a4,76(a5)
    800050e4:	fe043783          	ld	a5,-32(s0)
    800050e8:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    800050ea:	fe043783          	ld	a5,-32(s0)
    800050ee:	00c78713          	addi	a4,a5,12
    800050f2:	fd843783          	ld	a5,-40(s0)
    800050f6:	05078793          	addi	a5,a5,80
    800050fa:	03400613          	li	a2,52
    800050fe:	85be                	mv	a1,a5
    80005100:	853a                	mv	a0,a4
    80005102:	ffffc097          	auipc	ra,0xffffc
    80005106:	436080e7          	jalr	1078(ra) # 80001538 <memmove>
  log_write(bp);
    8000510a:	fe843503          	ld	a0,-24(s0)
    8000510e:	00001097          	auipc	ra,0x1
    80005112:	4cc080e7          	jalr	1228(ra) # 800065da <log_write>
  brelse(bp);
    80005116:	fe843503          	ld	a0,-24(s0)
    8000511a:	00000097          	auipc	ra,0x0
    8000511e:	834080e7          	jalr	-1996(ra) # 8000494e <brelse>
}
    80005122:	0001                	nop
    80005124:	70a2                	ld	ra,40(sp)
    80005126:	7402                	ld	s0,32(sp)
    80005128:	6145                	addi	sp,sp,48
    8000512a:	8082                	ret

000000008000512c <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    8000512c:	7179                	addi	sp,sp,-48
    8000512e:	f406                	sd	ra,40(sp)
    80005130:	f022                	sd	s0,32(sp)
    80005132:	1800                	addi	s0,sp,48
    80005134:	87aa                	mv	a5,a0
    80005136:	872e                	mv	a4,a1
    80005138:	fcf42e23          	sw	a5,-36(s0)
    8000513c:	87ba                	mv	a5,a4
    8000513e:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&icache.lock);
    80005142:	00067517          	auipc	a0,0x67
    80005146:	06650513          	addi	a0,a0,102 # 8006c1a8 <icache>
    8000514a:	ffffc097          	auipc	ra,0xffffc
    8000514e:	136080e7          	jalr	310(ra) # 80001280 <acquire>

  // Is the inode already cached?
  empty = 0;
    80005152:	fe043023          	sd	zero,-32(s0)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    80005156:	00067797          	auipc	a5,0x67
    8000515a:	06a78793          	addi	a5,a5,106 # 8006c1c0 <icache+0x18>
    8000515e:	fef43423          	sd	a5,-24(s0)
    80005162:	a89d                	j	800051d8 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80005164:	fe843783          	ld	a5,-24(s0)
    80005168:	479c                	lw	a5,8(a5)
    8000516a:	04f05663          	blez	a5,800051b6 <iget+0x8a>
    8000516e:	fe843783          	ld	a5,-24(s0)
    80005172:	4398                	lw	a4,0(a5)
    80005174:	fdc42783          	lw	a5,-36(s0)
    80005178:	2781                	sext.w	a5,a5
    8000517a:	02e79e63          	bne	a5,a4,800051b6 <iget+0x8a>
    8000517e:	fe843783          	ld	a5,-24(s0)
    80005182:	43d8                	lw	a4,4(a5)
    80005184:	fd842783          	lw	a5,-40(s0)
    80005188:	2781                	sext.w	a5,a5
    8000518a:	02e79663          	bne	a5,a4,800051b6 <iget+0x8a>
      ip->ref++;
    8000518e:	fe843783          	ld	a5,-24(s0)
    80005192:	479c                	lw	a5,8(a5)
    80005194:	2785                	addiw	a5,a5,1
    80005196:	0007871b          	sext.w	a4,a5
    8000519a:	fe843783          	ld	a5,-24(s0)
    8000519e:	c798                	sw	a4,8(a5)
      release(&icache.lock);
    800051a0:	00067517          	auipc	a0,0x67
    800051a4:	00850513          	addi	a0,a0,8 # 8006c1a8 <icache>
    800051a8:	ffffc097          	auipc	ra,0xffffc
    800051ac:	13c080e7          	jalr	316(ra) # 800012e4 <release>
      return ip;
    800051b0:	fe843783          	ld	a5,-24(s0)
    800051b4:	a069                	j	8000523e <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    800051b6:	fe043783          	ld	a5,-32(s0)
    800051ba:	eb89                	bnez	a5,800051cc <iget+0xa0>
    800051bc:	fe843783          	ld	a5,-24(s0)
    800051c0:	479c                	lw	a5,8(a5)
    800051c2:	e789                	bnez	a5,800051cc <iget+0xa0>
      empty = ip;
    800051c4:	fe843783          	ld	a5,-24(s0)
    800051c8:	fef43023          	sd	a5,-32(s0)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    800051cc:	fe843783          	ld	a5,-24(s0)
    800051d0:	08878793          	addi	a5,a5,136
    800051d4:	fef43423          	sd	a5,-24(s0)
    800051d8:	fe843703          	ld	a4,-24(s0)
    800051dc:	00069797          	auipc	a5,0x69
    800051e0:	a7478793          	addi	a5,a5,-1420 # 8006dc50 <log>
    800051e4:	f8f760e3          	bltu	a4,a5,80005164 <iget+0x38>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    800051e8:	fe043783          	ld	a5,-32(s0)
    800051ec:	eb89                	bnez	a5,800051fe <iget+0xd2>
    panic("iget: no inodes");
    800051ee:	00006517          	auipc	a0,0x6
    800051f2:	2aa50513          	addi	a0,a0,682 # 8000b498 <etext+0x498>
    800051f6:	ffffc097          	auipc	ra,0xffffc
    800051fa:	a5c080e7          	jalr	-1444(ra) # 80000c52 <panic>

  ip = empty;
    800051fe:	fe043783          	ld	a5,-32(s0)
    80005202:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005206:	fe843783          	ld	a5,-24(s0)
    8000520a:	fdc42703          	lw	a4,-36(s0)
    8000520e:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80005210:	fe843783          	ld	a5,-24(s0)
    80005214:	fd842703          	lw	a4,-40(s0)
    80005218:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    8000521a:	fe843783          	ld	a5,-24(s0)
    8000521e:	4705                	li	a4,1
    80005220:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005222:	fe843783          	ld	a5,-24(s0)
    80005226:	0407a023          	sw	zero,64(a5)
  release(&icache.lock);
    8000522a:	00067517          	auipc	a0,0x67
    8000522e:	f7e50513          	addi	a0,a0,-130 # 8006c1a8 <icache>
    80005232:	ffffc097          	auipc	ra,0xffffc
    80005236:	0b2080e7          	jalr	178(ra) # 800012e4 <release>

  return ip;
    8000523a:	fe843783          	ld	a5,-24(s0)
}
    8000523e:	853e                	mv	a0,a5
    80005240:	70a2                	ld	ra,40(sp)
    80005242:	7402                	ld	s0,32(sp)
    80005244:	6145                	addi	sp,sp,48
    80005246:	8082                	ret

0000000080005248 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005248:	1101                	addi	sp,sp,-32
    8000524a:	ec06                	sd	ra,24(sp)
    8000524c:	e822                	sd	s0,16(sp)
    8000524e:	1000                	addi	s0,sp,32
    80005250:	fea43423          	sd	a0,-24(s0)
  acquire(&icache.lock);
    80005254:	00067517          	auipc	a0,0x67
    80005258:	f5450513          	addi	a0,a0,-172 # 8006c1a8 <icache>
    8000525c:	ffffc097          	auipc	ra,0xffffc
    80005260:	024080e7          	jalr	36(ra) # 80001280 <acquire>
  ip->ref++;
    80005264:	fe843783          	ld	a5,-24(s0)
    80005268:	479c                	lw	a5,8(a5)
    8000526a:	2785                	addiw	a5,a5,1
    8000526c:	0007871b          	sext.w	a4,a5
    80005270:	fe843783          	ld	a5,-24(s0)
    80005274:	c798                	sw	a4,8(a5)
  release(&icache.lock);
    80005276:	00067517          	auipc	a0,0x67
    8000527a:	f3250513          	addi	a0,a0,-206 # 8006c1a8 <icache>
    8000527e:	ffffc097          	auipc	ra,0xffffc
    80005282:	066080e7          	jalr	102(ra) # 800012e4 <release>
  return ip;
    80005286:	fe843783          	ld	a5,-24(s0)
}
    8000528a:	853e                	mv	a0,a5
    8000528c:	60e2                	ld	ra,24(sp)
    8000528e:	6442                	ld	s0,16(sp)
    80005290:	6105                	addi	sp,sp,32
    80005292:	8082                	ret

0000000080005294 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005294:	7179                	addi	sp,sp,-48
    80005296:	f406                	sd	ra,40(sp)
    80005298:	f022                	sd	s0,32(sp)
    8000529a:	1800                	addi	s0,sp,48
    8000529c:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800052a0:	fd843783          	ld	a5,-40(s0)
    800052a4:	c791                	beqz	a5,800052b0 <ilock+0x1c>
    800052a6:	fd843783          	ld	a5,-40(s0)
    800052aa:	479c                	lw	a5,8(a5)
    800052ac:	00f04a63          	bgtz	a5,800052c0 <ilock+0x2c>
    panic("ilock");
    800052b0:	00006517          	auipc	a0,0x6
    800052b4:	1f850513          	addi	a0,a0,504 # 8000b4a8 <etext+0x4a8>
    800052b8:	ffffc097          	auipc	ra,0xffffc
    800052bc:	99a080e7          	jalr	-1638(ra) # 80000c52 <panic>

  acquiresleep(&ip->lock);
    800052c0:	fd843783          	ld	a5,-40(s0)
    800052c4:	07c1                	addi	a5,a5,16
    800052c6:	853e                	mv	a0,a5
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	492080e7          	jalr	1170(ra) # 8000675a <acquiresleep>

  if(ip->valid == 0){
    800052d0:	fd843783          	ld	a5,-40(s0)
    800052d4:	43bc                	lw	a5,64(a5)
    800052d6:	e7e5                	bnez	a5,800053be <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800052d8:	fd843783          	ld	a5,-40(s0)
    800052dc:	4394                	lw	a3,0(a5)
    800052de:	fd843783          	ld	a5,-40(s0)
    800052e2:	43dc                	lw	a5,4(a5)
    800052e4:	0047d79b          	srliw	a5,a5,0x4
    800052e8:	0007871b          	sext.w	a4,a5
    800052ec:	00067797          	auipc	a5,0x67
    800052f0:	e9c78793          	addi	a5,a5,-356 # 8006c188 <sb>
    800052f4:	4f9c                	lw	a5,24(a5)
    800052f6:	9fb9                	addw	a5,a5,a4
    800052f8:	2781                	sext.w	a5,a5
    800052fa:	85be                	mv	a1,a5
    800052fc:	8536                	mv	a0,a3
    800052fe:	fffff097          	auipc	ra,0xfffff
    80005302:	5ae080e7          	jalr	1454(ra) # 800048ac <bread>
    80005306:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000530a:	fe843783          	ld	a5,-24(s0)
    8000530e:	05878713          	addi	a4,a5,88
    80005312:	fd843783          	ld	a5,-40(s0)
    80005316:	43dc                	lw	a5,4(a5)
    80005318:	1782                	slli	a5,a5,0x20
    8000531a:	9381                	srli	a5,a5,0x20
    8000531c:	8bbd                	andi	a5,a5,15
    8000531e:	079a                	slli	a5,a5,0x6
    80005320:	97ba                	add	a5,a5,a4
    80005322:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005326:	fe043783          	ld	a5,-32(s0)
    8000532a:	00079703          	lh	a4,0(a5)
    8000532e:	fd843783          	ld	a5,-40(s0)
    80005332:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005336:	fe043783          	ld	a5,-32(s0)
    8000533a:	00279703          	lh	a4,2(a5)
    8000533e:	fd843783          	ld	a5,-40(s0)
    80005342:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005346:	fe043783          	ld	a5,-32(s0)
    8000534a:	00479703          	lh	a4,4(a5)
    8000534e:	fd843783          	ld	a5,-40(s0)
    80005352:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    80005356:	fe043783          	ld	a5,-32(s0)
    8000535a:	00679703          	lh	a4,6(a5)
    8000535e:	fd843783          	ld	a5,-40(s0)
    80005362:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    80005366:	fe043783          	ld	a5,-32(s0)
    8000536a:	4798                	lw	a4,8(a5)
    8000536c:	fd843783          	ld	a5,-40(s0)
    80005370:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005372:	fd843783          	ld	a5,-40(s0)
    80005376:	05078713          	addi	a4,a5,80
    8000537a:	fe043783          	ld	a5,-32(s0)
    8000537e:	07b1                	addi	a5,a5,12
    80005380:	03400613          	li	a2,52
    80005384:	85be                	mv	a1,a5
    80005386:	853a                	mv	a0,a4
    80005388:	ffffc097          	auipc	ra,0xffffc
    8000538c:	1b0080e7          	jalr	432(ra) # 80001538 <memmove>
    brelse(bp);
    80005390:	fe843503          	ld	a0,-24(s0)
    80005394:	fffff097          	auipc	ra,0xfffff
    80005398:	5ba080e7          	jalr	1466(ra) # 8000494e <brelse>
    ip->valid = 1;
    8000539c:	fd843783          	ld	a5,-40(s0)
    800053a0:	4705                	li	a4,1
    800053a2:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800053a4:	fd843783          	ld	a5,-40(s0)
    800053a8:	04479783          	lh	a5,68(a5)
    800053ac:	eb89                	bnez	a5,800053be <ilock+0x12a>
      panic("ilock: no type");
    800053ae:	00006517          	auipc	a0,0x6
    800053b2:	10250513          	addi	a0,a0,258 # 8000b4b0 <etext+0x4b0>
    800053b6:	ffffc097          	auipc	ra,0xffffc
    800053ba:	89c080e7          	jalr	-1892(ra) # 80000c52 <panic>
  }
}
    800053be:	0001                	nop
    800053c0:	70a2                	ld	ra,40(sp)
    800053c2:	7402                	ld	s0,32(sp)
    800053c4:	6145                	addi	sp,sp,48
    800053c6:	8082                	ret

00000000800053c8 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    800053c8:	1101                	addi	sp,sp,-32
    800053ca:	ec06                	sd	ra,24(sp)
    800053cc:	e822                	sd	s0,16(sp)
    800053ce:	1000                	addi	s0,sp,32
    800053d0:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    800053d4:	fe843783          	ld	a5,-24(s0)
    800053d8:	c385                	beqz	a5,800053f8 <iunlock+0x30>
    800053da:	fe843783          	ld	a5,-24(s0)
    800053de:	07c1                	addi	a5,a5,16
    800053e0:	853e                	mv	a0,a5
    800053e2:	00001097          	auipc	ra,0x1
    800053e6:	438080e7          	jalr	1080(ra) # 8000681a <holdingsleep>
    800053ea:	87aa                	mv	a5,a0
    800053ec:	c791                	beqz	a5,800053f8 <iunlock+0x30>
    800053ee:	fe843783          	ld	a5,-24(s0)
    800053f2:	479c                	lw	a5,8(a5)
    800053f4:	00f04a63          	bgtz	a5,80005408 <iunlock+0x40>
    panic("iunlock");
    800053f8:	00006517          	auipc	a0,0x6
    800053fc:	0c850513          	addi	a0,a0,200 # 8000b4c0 <etext+0x4c0>
    80005400:	ffffc097          	auipc	ra,0xffffc
    80005404:	852080e7          	jalr	-1966(ra) # 80000c52 <panic>

  releasesleep(&ip->lock);
    80005408:	fe843783          	ld	a5,-24(s0)
    8000540c:	07c1                	addi	a5,a5,16
    8000540e:	853e                	mv	a0,a5
    80005410:	00001097          	auipc	ra,0x1
    80005414:	3b8080e7          	jalr	952(ra) # 800067c8 <releasesleep>
}
    80005418:	0001                	nop
    8000541a:	60e2                	ld	ra,24(sp)
    8000541c:	6442                	ld	s0,16(sp)
    8000541e:	6105                	addi	sp,sp,32
    80005420:	8082                	ret

0000000080005422 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005422:	1101                	addi	sp,sp,-32
    80005424:	ec06                	sd	ra,24(sp)
    80005426:	e822                	sd	s0,16(sp)
    80005428:	1000                	addi	s0,sp,32
    8000542a:	fea43423          	sd	a0,-24(s0)
  acquire(&icache.lock);
    8000542e:	00067517          	auipc	a0,0x67
    80005432:	d7a50513          	addi	a0,a0,-646 # 8006c1a8 <icache>
    80005436:	ffffc097          	auipc	ra,0xffffc
    8000543a:	e4a080e7          	jalr	-438(ra) # 80001280 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000543e:	fe843783          	ld	a5,-24(s0)
    80005442:	479c                	lw	a5,8(a5)
    80005444:	873e                	mv	a4,a5
    80005446:	4785                	li	a5,1
    80005448:	06f71f63          	bne	a4,a5,800054c6 <iput+0xa4>
    8000544c:	fe843783          	ld	a5,-24(s0)
    80005450:	43bc                	lw	a5,64(a5)
    80005452:	cbb5                	beqz	a5,800054c6 <iput+0xa4>
    80005454:	fe843783          	ld	a5,-24(s0)
    80005458:	04a79783          	lh	a5,74(a5)
    8000545c:	e7ad                	bnez	a5,800054c6 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    8000545e:	fe843783          	ld	a5,-24(s0)
    80005462:	07c1                	addi	a5,a5,16
    80005464:	853e                	mv	a0,a5
    80005466:	00001097          	auipc	ra,0x1
    8000546a:	2f4080e7          	jalr	756(ra) # 8000675a <acquiresleep>

    release(&icache.lock);
    8000546e:	00067517          	auipc	a0,0x67
    80005472:	d3a50513          	addi	a0,a0,-710 # 8006c1a8 <icache>
    80005476:	ffffc097          	auipc	ra,0xffffc
    8000547a:	e6e080e7          	jalr	-402(ra) # 800012e4 <release>

    itrunc(ip);
    8000547e:	fe843503          	ld	a0,-24(s0)
    80005482:	00000097          	auipc	ra,0x0
    80005486:	1fa080e7          	jalr	506(ra) # 8000567c <itrunc>
    ip->type = 0;
    8000548a:	fe843783          	ld	a5,-24(s0)
    8000548e:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005492:	fe843503          	ld	a0,-24(s0)
    80005496:	00000097          	auipc	ra,0x0
    8000549a:	bae080e7          	jalr	-1106(ra) # 80005044 <iupdate>
    ip->valid = 0;
    8000549e:	fe843783          	ld	a5,-24(s0)
    800054a2:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800054a6:	fe843783          	ld	a5,-24(s0)
    800054aa:	07c1                	addi	a5,a5,16
    800054ac:	853e                	mv	a0,a5
    800054ae:	00001097          	auipc	ra,0x1
    800054b2:	31a080e7          	jalr	794(ra) # 800067c8 <releasesleep>

    acquire(&icache.lock);
    800054b6:	00067517          	auipc	a0,0x67
    800054ba:	cf250513          	addi	a0,a0,-782 # 8006c1a8 <icache>
    800054be:	ffffc097          	auipc	ra,0xffffc
    800054c2:	dc2080e7          	jalr	-574(ra) # 80001280 <acquire>
  }

  ip->ref--;
    800054c6:	fe843783          	ld	a5,-24(s0)
    800054ca:	479c                	lw	a5,8(a5)
    800054cc:	37fd                	addiw	a5,a5,-1
    800054ce:	0007871b          	sext.w	a4,a5
    800054d2:	fe843783          	ld	a5,-24(s0)
    800054d6:	c798                	sw	a4,8(a5)
  release(&icache.lock);
    800054d8:	00067517          	auipc	a0,0x67
    800054dc:	cd050513          	addi	a0,a0,-816 # 8006c1a8 <icache>
    800054e0:	ffffc097          	auipc	ra,0xffffc
    800054e4:	e04080e7          	jalr	-508(ra) # 800012e4 <release>
}
    800054e8:	0001                	nop
    800054ea:	60e2                	ld	ra,24(sp)
    800054ec:	6442                	ld	s0,16(sp)
    800054ee:	6105                	addi	sp,sp,32
    800054f0:	8082                	ret

00000000800054f2 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    800054f2:	1101                	addi	sp,sp,-32
    800054f4:	ec06                	sd	ra,24(sp)
    800054f6:	e822                	sd	s0,16(sp)
    800054f8:	1000                	addi	s0,sp,32
    800054fa:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    800054fe:	fe843503          	ld	a0,-24(s0)
    80005502:	00000097          	auipc	ra,0x0
    80005506:	ec6080e7          	jalr	-314(ra) # 800053c8 <iunlock>
  iput(ip);
    8000550a:	fe843503          	ld	a0,-24(s0)
    8000550e:	00000097          	auipc	ra,0x0
    80005512:	f14080e7          	jalr	-236(ra) # 80005422 <iput>
}
    80005516:	0001                	nop
    80005518:	60e2                	ld	ra,24(sp)
    8000551a:	6442                	ld	s0,16(sp)
    8000551c:	6105                	addi	sp,sp,32
    8000551e:	8082                	ret

0000000080005520 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    80005520:	7139                	addi	sp,sp,-64
    80005522:	fc06                	sd	ra,56(sp)
    80005524:	f822                	sd	s0,48(sp)
    80005526:	0080                	addi	s0,sp,64
    80005528:	fca43423          	sd	a0,-56(s0)
    8000552c:	87ae                	mv	a5,a1
    8000552e:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005532:	fc442783          	lw	a5,-60(s0)
    80005536:	0007871b          	sext.w	a4,a5
    8000553a:	47ad                	li	a5,11
    8000553c:	04e7e863          	bltu	a5,a4,8000558c <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    80005540:	fc843703          	ld	a4,-56(s0)
    80005544:	fc446783          	lwu	a5,-60(s0)
    80005548:	07d1                	addi	a5,a5,20
    8000554a:	078a                	slli	a5,a5,0x2
    8000554c:	97ba                	add	a5,a5,a4
    8000554e:	439c                	lw	a5,0(a5)
    80005550:	fef42623          	sw	a5,-20(s0)
    80005554:	fec42783          	lw	a5,-20(s0)
    80005558:	2781                	sext.w	a5,a5
    8000555a:	e795                	bnez	a5,80005586 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    8000555c:	fc843783          	ld	a5,-56(s0)
    80005560:	439c                	lw	a5,0(a5)
    80005562:	853e                	mv	a0,a5
    80005564:	fffff097          	auipc	ra,0xfffff
    80005568:	692080e7          	jalr	1682(ra) # 80004bf6 <balloc>
    8000556c:	87aa                	mv	a5,a0
    8000556e:	fef42623          	sw	a5,-20(s0)
    80005572:	fc843703          	ld	a4,-56(s0)
    80005576:	fc446783          	lwu	a5,-60(s0)
    8000557a:	07d1                	addi	a5,a5,20
    8000557c:	078a                	slli	a5,a5,0x2
    8000557e:	97ba                	add	a5,a5,a4
    80005580:	fec42703          	lw	a4,-20(s0)
    80005584:	c398                	sw	a4,0(a5)
    return addr;
    80005586:	fec42783          	lw	a5,-20(s0)
    8000558a:	a0e5                	j	80005672 <bmap+0x152>
  }
  bn -= NDIRECT;
    8000558c:	fc442783          	lw	a5,-60(s0)
    80005590:	37d1                	addiw	a5,a5,-12
    80005592:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005596:	fc442783          	lw	a5,-60(s0)
    8000559a:	0007871b          	sext.w	a4,a5
    8000559e:	0ff00793          	li	a5,255
    800055a2:	0ce7e063          	bltu	a5,a4,80005662 <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    800055a6:	fc843783          	ld	a5,-56(s0)
    800055aa:	0807a783          	lw	a5,128(a5)
    800055ae:	fef42623          	sw	a5,-20(s0)
    800055b2:	fec42783          	lw	a5,-20(s0)
    800055b6:	2781                	sext.w	a5,a5
    800055b8:	e395                	bnez	a5,800055dc <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    800055ba:	fc843783          	ld	a5,-56(s0)
    800055be:	439c                	lw	a5,0(a5)
    800055c0:	853e                	mv	a0,a5
    800055c2:	fffff097          	auipc	ra,0xfffff
    800055c6:	634080e7          	jalr	1588(ra) # 80004bf6 <balloc>
    800055ca:	87aa                	mv	a5,a0
    800055cc:	fef42623          	sw	a5,-20(s0)
    800055d0:	fc843783          	ld	a5,-56(s0)
    800055d4:	fec42703          	lw	a4,-20(s0)
    800055d8:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    800055dc:	fc843783          	ld	a5,-56(s0)
    800055e0:	439c                	lw	a5,0(a5)
    800055e2:	fec42703          	lw	a4,-20(s0)
    800055e6:	85ba                	mv	a1,a4
    800055e8:	853e                	mv	a0,a5
    800055ea:	fffff097          	auipc	ra,0xfffff
    800055ee:	2c2080e7          	jalr	706(ra) # 800048ac <bread>
    800055f2:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800055f6:	fe043783          	ld	a5,-32(s0)
    800055fa:	05878793          	addi	a5,a5,88
    800055fe:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005602:	fc446783          	lwu	a5,-60(s0)
    80005606:	078a                	slli	a5,a5,0x2
    80005608:	fd843703          	ld	a4,-40(s0)
    8000560c:	97ba                	add	a5,a5,a4
    8000560e:	439c                	lw	a5,0(a5)
    80005610:	fef42623          	sw	a5,-20(s0)
    80005614:	fec42783          	lw	a5,-20(s0)
    80005618:	2781                	sext.w	a5,a5
    8000561a:	eb9d                	bnez	a5,80005650 <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    8000561c:	fc843783          	ld	a5,-56(s0)
    80005620:	439c                	lw	a5,0(a5)
    80005622:	853e                	mv	a0,a5
    80005624:	fffff097          	auipc	ra,0xfffff
    80005628:	5d2080e7          	jalr	1490(ra) # 80004bf6 <balloc>
    8000562c:	87aa                	mv	a5,a0
    8000562e:	fef42623          	sw	a5,-20(s0)
    80005632:	fc446783          	lwu	a5,-60(s0)
    80005636:	078a                	slli	a5,a5,0x2
    80005638:	fd843703          	ld	a4,-40(s0)
    8000563c:	97ba                	add	a5,a5,a4
    8000563e:	fec42703          	lw	a4,-20(s0)
    80005642:	c398                	sw	a4,0(a5)
      log_write(bp);
    80005644:	fe043503          	ld	a0,-32(s0)
    80005648:	00001097          	auipc	ra,0x1
    8000564c:	f92080e7          	jalr	-110(ra) # 800065da <log_write>
    }
    brelse(bp);
    80005650:	fe043503          	ld	a0,-32(s0)
    80005654:	fffff097          	auipc	ra,0xfffff
    80005658:	2fa080e7          	jalr	762(ra) # 8000494e <brelse>
    return addr;
    8000565c:	fec42783          	lw	a5,-20(s0)
    80005660:	a809                	j	80005672 <bmap+0x152>
  }

  panic("bmap: out of range");
    80005662:	00006517          	auipc	a0,0x6
    80005666:	e6650513          	addi	a0,a0,-410 # 8000b4c8 <etext+0x4c8>
    8000566a:	ffffb097          	auipc	ra,0xffffb
    8000566e:	5e8080e7          	jalr	1512(ra) # 80000c52 <panic>
}
    80005672:	853e                	mv	a0,a5
    80005674:	70e2                	ld	ra,56(sp)
    80005676:	7442                	ld	s0,48(sp)
    80005678:	6121                	addi	sp,sp,64
    8000567a:	8082                	ret

000000008000567c <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    8000567c:	7139                	addi	sp,sp,-64
    8000567e:	fc06                	sd	ra,56(sp)
    80005680:	f822                	sd	s0,48(sp)
    80005682:	0080                	addi	s0,sp,64
    80005684:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005688:	fe042623          	sw	zero,-20(s0)
    8000568c:	a899                	j	800056e2 <itrunc+0x66>
    if(ip->addrs[i]){
    8000568e:	fc843703          	ld	a4,-56(s0)
    80005692:	fec42783          	lw	a5,-20(s0)
    80005696:	07d1                	addi	a5,a5,20
    80005698:	078a                	slli	a5,a5,0x2
    8000569a:	97ba                	add	a5,a5,a4
    8000569c:	439c                	lw	a5,0(a5)
    8000569e:	cf8d                	beqz	a5,800056d8 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800056a0:	fc843783          	ld	a5,-56(s0)
    800056a4:	439c                	lw	a5,0(a5)
    800056a6:	0007869b          	sext.w	a3,a5
    800056aa:	fc843703          	ld	a4,-56(s0)
    800056ae:	fec42783          	lw	a5,-20(s0)
    800056b2:	07d1                	addi	a5,a5,20
    800056b4:	078a                	slli	a5,a5,0x2
    800056b6:	97ba                	add	a5,a5,a4
    800056b8:	439c                	lw	a5,0(a5)
    800056ba:	85be                	mv	a1,a5
    800056bc:	8536                	mv	a0,a3
    800056be:	fffff097          	auipc	ra,0xfffff
    800056c2:	6e6080e7          	jalr	1766(ra) # 80004da4 <bfree>
      ip->addrs[i] = 0;
    800056c6:	fc843703          	ld	a4,-56(s0)
    800056ca:	fec42783          	lw	a5,-20(s0)
    800056ce:	07d1                	addi	a5,a5,20
    800056d0:	078a                	slli	a5,a5,0x2
    800056d2:	97ba                	add	a5,a5,a4
    800056d4:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    800056d8:	fec42783          	lw	a5,-20(s0)
    800056dc:	2785                	addiw	a5,a5,1
    800056de:	fef42623          	sw	a5,-20(s0)
    800056e2:	fec42783          	lw	a5,-20(s0)
    800056e6:	0007871b          	sext.w	a4,a5
    800056ea:	47ad                	li	a5,11
    800056ec:	fae7d1e3          	bge	a5,a4,8000568e <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800056f0:	fc843783          	ld	a5,-56(s0)
    800056f4:	0807a783          	lw	a5,128(a5)
    800056f8:	cbc5                	beqz	a5,800057a8 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800056fa:	fc843783          	ld	a5,-56(s0)
    800056fe:	4398                	lw	a4,0(a5)
    80005700:	fc843783          	ld	a5,-56(s0)
    80005704:	0807a783          	lw	a5,128(a5)
    80005708:	85be                	mv	a1,a5
    8000570a:	853a                	mv	a0,a4
    8000570c:	fffff097          	auipc	ra,0xfffff
    80005710:	1a0080e7          	jalr	416(ra) # 800048ac <bread>
    80005714:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005718:	fe043783          	ld	a5,-32(s0)
    8000571c:	05878793          	addi	a5,a5,88
    80005720:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005724:	fe042423          	sw	zero,-24(s0)
    80005728:	a081                	j	80005768 <itrunc+0xec>
      if(a[j])
    8000572a:	fe842783          	lw	a5,-24(s0)
    8000572e:	078a                	slli	a5,a5,0x2
    80005730:	fd843703          	ld	a4,-40(s0)
    80005734:	97ba                	add	a5,a5,a4
    80005736:	439c                	lw	a5,0(a5)
    80005738:	c39d                	beqz	a5,8000575e <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    8000573a:	fc843783          	ld	a5,-56(s0)
    8000573e:	439c                	lw	a5,0(a5)
    80005740:	0007869b          	sext.w	a3,a5
    80005744:	fe842783          	lw	a5,-24(s0)
    80005748:	078a                	slli	a5,a5,0x2
    8000574a:	fd843703          	ld	a4,-40(s0)
    8000574e:	97ba                	add	a5,a5,a4
    80005750:	439c                	lw	a5,0(a5)
    80005752:	85be                	mv	a1,a5
    80005754:	8536                	mv	a0,a3
    80005756:	fffff097          	auipc	ra,0xfffff
    8000575a:	64e080e7          	jalr	1614(ra) # 80004da4 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    8000575e:	fe842783          	lw	a5,-24(s0)
    80005762:	2785                	addiw	a5,a5,1
    80005764:	fef42423          	sw	a5,-24(s0)
    80005768:	fe842783          	lw	a5,-24(s0)
    8000576c:	873e                	mv	a4,a5
    8000576e:	0ff00793          	li	a5,255
    80005772:	fae7fce3          	bgeu	a5,a4,8000572a <itrunc+0xae>
    }
    brelse(bp);
    80005776:	fe043503          	ld	a0,-32(s0)
    8000577a:	fffff097          	auipc	ra,0xfffff
    8000577e:	1d4080e7          	jalr	468(ra) # 8000494e <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005782:	fc843783          	ld	a5,-56(s0)
    80005786:	439c                	lw	a5,0(a5)
    80005788:	0007871b          	sext.w	a4,a5
    8000578c:	fc843783          	ld	a5,-56(s0)
    80005790:	0807a783          	lw	a5,128(a5)
    80005794:	85be                	mv	a1,a5
    80005796:	853a                	mv	a0,a4
    80005798:	fffff097          	auipc	ra,0xfffff
    8000579c:	60c080e7          	jalr	1548(ra) # 80004da4 <bfree>
    ip->addrs[NDIRECT] = 0;
    800057a0:	fc843783          	ld	a5,-56(s0)
    800057a4:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800057a8:	fc843783          	ld	a5,-56(s0)
    800057ac:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    800057b0:	fc843503          	ld	a0,-56(s0)
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	890080e7          	jalr	-1904(ra) # 80005044 <iupdate>
}
    800057bc:	0001                	nop
    800057be:	70e2                	ld	ra,56(sp)
    800057c0:	7442                	ld	s0,48(sp)
    800057c2:	6121                	addi	sp,sp,64
    800057c4:	8082                	ret

00000000800057c6 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    800057c6:	1101                	addi	sp,sp,-32
    800057c8:	ec22                	sd	s0,24(sp)
    800057ca:	1000                	addi	s0,sp,32
    800057cc:	fea43423          	sd	a0,-24(s0)
    800057d0:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    800057d4:	fe843783          	ld	a5,-24(s0)
    800057d8:	439c                	lw	a5,0(a5)
    800057da:	0007871b          	sext.w	a4,a5
    800057de:	fe043783          	ld	a5,-32(s0)
    800057e2:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    800057e4:	fe843783          	ld	a5,-24(s0)
    800057e8:	43d8                	lw	a4,4(a5)
    800057ea:	fe043783          	ld	a5,-32(s0)
    800057ee:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800057f0:	fe843783          	ld	a5,-24(s0)
    800057f4:	04479703          	lh	a4,68(a5)
    800057f8:	fe043783          	ld	a5,-32(s0)
    800057fc:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005800:	fe843783          	ld	a5,-24(s0)
    80005804:	04a79703          	lh	a4,74(a5)
    80005808:	fe043783          	ld	a5,-32(s0)
    8000580c:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005810:	fe843783          	ld	a5,-24(s0)
    80005814:	47fc                	lw	a5,76(a5)
    80005816:	02079713          	slli	a4,a5,0x20
    8000581a:	9301                	srli	a4,a4,0x20
    8000581c:	fe043783          	ld	a5,-32(s0)
    80005820:	eb98                	sd	a4,16(a5)
}
    80005822:	0001                	nop
    80005824:	6462                	ld	s0,24(sp)
    80005826:	6105                	addi	sp,sp,32
    80005828:	8082                	ret

000000008000582a <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    8000582a:	711d                	addi	sp,sp,-96
    8000582c:	ec86                	sd	ra,88(sp)
    8000582e:	e8a2                	sd	s0,80(sp)
    80005830:	e4a6                	sd	s1,72(sp)
    80005832:	1080                	addi	s0,sp,96
    80005834:	faa43c23          	sd	a0,-72(s0)
    80005838:	87ae                	mv	a5,a1
    8000583a:	fac43423          	sd	a2,-88(s0)
    8000583e:	faf42a23          	sw	a5,-76(s0)
    80005842:	87b6                	mv	a5,a3
    80005844:	faf42823          	sw	a5,-80(s0)
    80005848:	87ba                	mv	a5,a4
    8000584a:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000584e:	fb843783          	ld	a5,-72(s0)
    80005852:	47f8                	lw	a4,76(a5)
    80005854:	fb042783          	lw	a5,-80(s0)
    80005858:	2781                	sext.w	a5,a5
    8000585a:	00f76e63          	bltu	a4,a5,80005876 <readi+0x4c>
    8000585e:	fb042703          	lw	a4,-80(s0)
    80005862:	fa442783          	lw	a5,-92(s0)
    80005866:	9fb9                	addw	a5,a5,a4
    80005868:	0007871b          	sext.w	a4,a5
    8000586c:	fb042783          	lw	a5,-80(s0)
    80005870:	2781                	sext.w	a5,a5
    80005872:	00f77463          	bgeu	a4,a5,8000587a <readi+0x50>
    return 0;
    80005876:	4781                	li	a5,0
    80005878:	aa05                	j	800059a8 <readi+0x17e>
  if(off + n > ip->size)
    8000587a:	fb042703          	lw	a4,-80(s0)
    8000587e:	fa442783          	lw	a5,-92(s0)
    80005882:	9fb9                	addw	a5,a5,a4
    80005884:	0007871b          	sext.w	a4,a5
    80005888:	fb843783          	ld	a5,-72(s0)
    8000588c:	47fc                	lw	a5,76(a5)
    8000588e:	00e7fb63          	bgeu	a5,a4,800058a4 <readi+0x7a>
    n = ip->size - off;
    80005892:	fb843783          	ld	a5,-72(s0)
    80005896:	47f8                	lw	a4,76(a5)
    80005898:	fb042783          	lw	a5,-80(s0)
    8000589c:	40f707bb          	subw	a5,a4,a5
    800058a0:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800058a4:	fc042e23          	sw	zero,-36(s0)
    800058a8:	a0f5                	j	80005994 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    800058aa:	fb843783          	ld	a5,-72(s0)
    800058ae:	4384                	lw	s1,0(a5)
    800058b0:	fb042783          	lw	a5,-80(s0)
    800058b4:	00a7d79b          	srliw	a5,a5,0xa
    800058b8:	2781                	sext.w	a5,a5
    800058ba:	85be                	mv	a1,a5
    800058bc:	fb843503          	ld	a0,-72(s0)
    800058c0:	00000097          	auipc	ra,0x0
    800058c4:	c60080e7          	jalr	-928(ra) # 80005520 <bmap>
    800058c8:	87aa                	mv	a5,a0
    800058ca:	2781                	sext.w	a5,a5
    800058cc:	85be                	mv	a1,a5
    800058ce:	8526                	mv	a0,s1
    800058d0:	fffff097          	auipc	ra,0xfffff
    800058d4:	fdc080e7          	jalr	-36(ra) # 800048ac <bread>
    800058d8:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    800058dc:	fb042783          	lw	a5,-80(s0)
    800058e0:	3ff7f793          	andi	a5,a5,1023
    800058e4:	2781                	sext.w	a5,a5
    800058e6:	40000713          	li	a4,1024
    800058ea:	40f707bb          	subw	a5,a4,a5
    800058ee:	0007869b          	sext.w	a3,a5
    800058f2:	fa442703          	lw	a4,-92(s0)
    800058f6:	fdc42783          	lw	a5,-36(s0)
    800058fa:	40f707bb          	subw	a5,a4,a5
    800058fe:	2781                	sext.w	a5,a5
    80005900:	863e                	mv	a2,a5
    80005902:	87b6                	mv	a5,a3
    80005904:	0007869b          	sext.w	a3,a5
    80005908:	0006071b          	sext.w	a4,a2
    8000590c:	00d77363          	bgeu	a4,a3,80005912 <readi+0xe8>
    80005910:	87b2                	mv	a5,a2
    80005912:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005916:	fd043783          	ld	a5,-48(s0)
    8000591a:	05878713          	addi	a4,a5,88
    8000591e:	fb046783          	lwu	a5,-80(s0)
    80005922:	3ff7f793          	andi	a5,a5,1023
    80005926:	973e                	add	a4,a4,a5
    80005928:	fcc46683          	lwu	a3,-52(s0)
    8000592c:	fb442783          	lw	a5,-76(s0)
    80005930:	863a                	mv	a2,a4
    80005932:	fa843583          	ld	a1,-88(s0)
    80005936:	853e                	mv	a0,a5
    80005938:	ffffe097          	auipc	ra,0xffffe
    8000593c:	d1c080e7          	jalr	-740(ra) # 80003654 <either_copyout>
    80005940:	87aa                	mv	a5,a0
    80005942:	873e                	mv	a4,a5
    80005944:	57fd                	li	a5,-1
    80005946:	00f71c63          	bne	a4,a5,8000595e <readi+0x134>
      brelse(bp);
    8000594a:	fd043503          	ld	a0,-48(s0)
    8000594e:	fffff097          	auipc	ra,0xfffff
    80005952:	000080e7          	jalr	ra # 8000494e <brelse>
      tot = -1;
    80005956:	57fd                	li	a5,-1
    80005958:	fcf42e23          	sw	a5,-36(s0)
      break;
    8000595c:	a0a1                	j	800059a4 <readi+0x17a>
    }
    brelse(bp);
    8000595e:	fd043503          	ld	a0,-48(s0)
    80005962:	fffff097          	auipc	ra,0xfffff
    80005966:	fec080e7          	jalr	-20(ra) # 8000494e <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    8000596a:	fdc42703          	lw	a4,-36(s0)
    8000596e:	fcc42783          	lw	a5,-52(s0)
    80005972:	9fb9                	addw	a5,a5,a4
    80005974:	fcf42e23          	sw	a5,-36(s0)
    80005978:	fb042703          	lw	a4,-80(s0)
    8000597c:	fcc42783          	lw	a5,-52(s0)
    80005980:	9fb9                	addw	a5,a5,a4
    80005982:	faf42823          	sw	a5,-80(s0)
    80005986:	fcc46783          	lwu	a5,-52(s0)
    8000598a:	fa843703          	ld	a4,-88(s0)
    8000598e:	97ba                	add	a5,a5,a4
    80005990:	faf43423          	sd	a5,-88(s0)
    80005994:	fdc42703          	lw	a4,-36(s0)
    80005998:	fa442783          	lw	a5,-92(s0)
    8000599c:	2701                	sext.w	a4,a4
    8000599e:	2781                	sext.w	a5,a5
    800059a0:	f0f765e3          	bltu	a4,a5,800058aa <readi+0x80>
  }
  return tot;
    800059a4:	fdc42783          	lw	a5,-36(s0)
}
    800059a8:	853e                	mv	a0,a5
    800059aa:	60e6                	ld	ra,88(sp)
    800059ac:	6446                	ld	s0,80(sp)
    800059ae:	64a6                	ld	s1,72(sp)
    800059b0:	6125                	addi	sp,sp,96
    800059b2:	8082                	ret

00000000800059b4 <writei>:
// Caller must hold ip->lock.
// If user_src==1, then src is a user virtual address;
// otherwise, src is a kernel address.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    800059b4:	711d                	addi	sp,sp,-96
    800059b6:	ec86                	sd	ra,88(sp)
    800059b8:	e8a2                	sd	s0,80(sp)
    800059ba:	e4a6                	sd	s1,72(sp)
    800059bc:	1080                	addi	s0,sp,96
    800059be:	faa43c23          	sd	a0,-72(s0)
    800059c2:	87ae                	mv	a5,a1
    800059c4:	fac43423          	sd	a2,-88(s0)
    800059c8:	faf42a23          	sw	a5,-76(s0)
    800059cc:	87b6                	mv	a5,a3
    800059ce:	faf42823          	sw	a5,-80(s0)
    800059d2:	87ba                	mv	a5,a4
    800059d4:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800059d8:	fb843783          	ld	a5,-72(s0)
    800059dc:	47f8                	lw	a4,76(a5)
    800059de:	fb042783          	lw	a5,-80(s0)
    800059e2:	2781                	sext.w	a5,a5
    800059e4:	00f76e63          	bltu	a4,a5,80005a00 <writei+0x4c>
    800059e8:	fb042703          	lw	a4,-80(s0)
    800059ec:	fa442783          	lw	a5,-92(s0)
    800059f0:	9fb9                	addw	a5,a5,a4
    800059f2:	0007871b          	sext.w	a4,a5
    800059f6:	fb042783          	lw	a5,-80(s0)
    800059fa:	2781                	sext.w	a5,a5
    800059fc:	00f77463          	bgeu	a4,a5,80005a04 <writei+0x50>
    return -1;
    80005a00:	57fd                	li	a5,-1
    80005a02:	aaa9                	j	80005b5c <writei+0x1a8>
  if(off + n > MAXFILE*BSIZE)
    80005a04:	fb042703          	lw	a4,-80(s0)
    80005a08:	fa442783          	lw	a5,-92(s0)
    80005a0c:	9fb9                	addw	a5,a5,a4
    80005a0e:	2781                	sext.w	a5,a5
    80005a10:	873e                	mv	a4,a5
    80005a12:	000437b7          	lui	a5,0x43
    80005a16:	00e7f463          	bgeu	a5,a4,80005a1e <writei+0x6a>
    return -1;
    80005a1a:	57fd                	li	a5,-1
    80005a1c:	a281                	j	80005b5c <writei+0x1a8>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005a1e:	fc042e23          	sw	zero,-36(s0)
    80005a22:	a8e5                	j	80005b1a <writei+0x166>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005a24:	fb843783          	ld	a5,-72(s0)
    80005a28:	4384                	lw	s1,0(a5)
    80005a2a:	fb042783          	lw	a5,-80(s0)
    80005a2e:	00a7d79b          	srliw	a5,a5,0xa
    80005a32:	2781                	sext.w	a5,a5
    80005a34:	85be                	mv	a1,a5
    80005a36:	fb843503          	ld	a0,-72(s0)
    80005a3a:	00000097          	auipc	ra,0x0
    80005a3e:	ae6080e7          	jalr	-1306(ra) # 80005520 <bmap>
    80005a42:	87aa                	mv	a5,a0
    80005a44:	2781                	sext.w	a5,a5
    80005a46:	85be                	mv	a1,a5
    80005a48:	8526                	mv	a0,s1
    80005a4a:	fffff097          	auipc	ra,0xfffff
    80005a4e:	e62080e7          	jalr	-414(ra) # 800048ac <bread>
    80005a52:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005a56:	fb042783          	lw	a5,-80(s0)
    80005a5a:	3ff7f793          	andi	a5,a5,1023
    80005a5e:	2781                	sext.w	a5,a5
    80005a60:	40000713          	li	a4,1024
    80005a64:	40f707bb          	subw	a5,a4,a5
    80005a68:	0007869b          	sext.w	a3,a5
    80005a6c:	fa442703          	lw	a4,-92(s0)
    80005a70:	fdc42783          	lw	a5,-36(s0)
    80005a74:	40f707bb          	subw	a5,a4,a5
    80005a78:	2781                	sext.w	a5,a5
    80005a7a:	863e                	mv	a2,a5
    80005a7c:	87b6                	mv	a5,a3
    80005a7e:	0007869b          	sext.w	a3,a5
    80005a82:	0006071b          	sext.w	a4,a2
    80005a86:	00d77363          	bgeu	a4,a3,80005a8c <writei+0xd8>
    80005a8a:	87b2                	mv	a5,a2
    80005a8c:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005a90:	fd043783          	ld	a5,-48(s0)
    80005a94:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005a98:	fb046783          	lwu	a5,-80(s0)
    80005a9c:	3ff7f793          	andi	a5,a5,1023
    80005aa0:	97ba                	add	a5,a5,a4
    80005aa2:	fcc46683          	lwu	a3,-52(s0)
    80005aa6:	fb442703          	lw	a4,-76(s0)
    80005aaa:	fa843603          	ld	a2,-88(s0)
    80005aae:	85ba                	mv	a1,a4
    80005ab0:	853e                	mv	a0,a5
    80005ab2:	ffffe097          	auipc	ra,0xffffe
    80005ab6:	c16080e7          	jalr	-1002(ra) # 800036c8 <either_copyin>
    80005aba:	87aa                	mv	a5,a0
    80005abc:	873e                	mv	a4,a5
    80005abe:	57fd                	li	a5,-1
    80005ac0:	00f71c63          	bne	a4,a5,80005ad8 <writei+0x124>
      brelse(bp);
    80005ac4:	fd043503          	ld	a0,-48(s0)
    80005ac8:	fffff097          	auipc	ra,0xfffff
    80005acc:	e86080e7          	jalr	-378(ra) # 8000494e <brelse>
      n = -1;
    80005ad0:	57fd                	li	a5,-1
    80005ad2:	faf42223          	sw	a5,-92(s0)
      break;
    80005ad6:	a891                	j	80005b2a <writei+0x176>
    }
    log_write(bp);
    80005ad8:	fd043503          	ld	a0,-48(s0)
    80005adc:	00001097          	auipc	ra,0x1
    80005ae0:	afe080e7          	jalr	-1282(ra) # 800065da <log_write>
    brelse(bp);
    80005ae4:	fd043503          	ld	a0,-48(s0)
    80005ae8:	fffff097          	auipc	ra,0xfffff
    80005aec:	e66080e7          	jalr	-410(ra) # 8000494e <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005af0:	fdc42703          	lw	a4,-36(s0)
    80005af4:	fcc42783          	lw	a5,-52(s0)
    80005af8:	9fb9                	addw	a5,a5,a4
    80005afa:	fcf42e23          	sw	a5,-36(s0)
    80005afe:	fb042703          	lw	a4,-80(s0)
    80005b02:	fcc42783          	lw	a5,-52(s0)
    80005b06:	9fb9                	addw	a5,a5,a4
    80005b08:	faf42823          	sw	a5,-80(s0)
    80005b0c:	fcc46783          	lwu	a5,-52(s0)
    80005b10:	fa843703          	ld	a4,-88(s0)
    80005b14:	97ba                	add	a5,a5,a4
    80005b16:	faf43423          	sd	a5,-88(s0)
    80005b1a:	fdc42703          	lw	a4,-36(s0)
    80005b1e:	fa442783          	lw	a5,-92(s0)
    80005b22:	2701                	sext.w	a4,a4
    80005b24:	2781                	sext.w	a5,a5
    80005b26:	eef76fe3          	bltu	a4,a5,80005a24 <writei+0x70>
  }

  if(n > 0){
    80005b2a:	fa442783          	lw	a5,-92(s0)
    80005b2e:	2781                	sext.w	a5,a5
    80005b30:	c785                	beqz	a5,80005b58 <writei+0x1a4>
    if(off > ip->size)
    80005b32:	fb843783          	ld	a5,-72(s0)
    80005b36:	47f8                	lw	a4,76(a5)
    80005b38:	fb042783          	lw	a5,-80(s0)
    80005b3c:	2781                	sext.w	a5,a5
    80005b3e:	00f77763          	bgeu	a4,a5,80005b4c <writei+0x198>
      ip->size = off;
    80005b42:	fb843783          	ld	a5,-72(s0)
    80005b46:	fb042703          	lw	a4,-80(s0)
    80005b4a:	c7f8                	sw	a4,76(a5)
    // write the i-node back to disk even if the size didn't change
    // because the loop above might have called bmap() and added a new
    // block to ip->addrs[].
    iupdate(ip);
    80005b4c:	fb843503          	ld	a0,-72(s0)
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	4f4080e7          	jalr	1268(ra) # 80005044 <iupdate>
  }

  return n;
    80005b58:	fa442783          	lw	a5,-92(s0)
}
    80005b5c:	853e                	mv	a0,a5
    80005b5e:	60e6                	ld	ra,88(sp)
    80005b60:	6446                	ld	s0,80(sp)
    80005b62:	64a6                	ld	s1,72(sp)
    80005b64:	6125                	addi	sp,sp,96
    80005b66:	8082                	ret

0000000080005b68 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005b68:	1101                	addi	sp,sp,-32
    80005b6a:	ec06                	sd	ra,24(sp)
    80005b6c:	e822                	sd	s0,16(sp)
    80005b6e:	1000                	addi	s0,sp,32
    80005b70:	fea43423          	sd	a0,-24(s0)
    80005b74:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005b78:	4639                	li	a2,14
    80005b7a:	fe043583          	ld	a1,-32(s0)
    80005b7e:	fe843503          	ld	a0,-24(s0)
    80005b82:	ffffc097          	auipc	ra,0xffffc
    80005b86:	abc080e7          	jalr	-1348(ra) # 8000163e <strncmp>
    80005b8a:	87aa                	mv	a5,a0
}
    80005b8c:	853e                	mv	a0,a5
    80005b8e:	60e2                	ld	ra,24(sp)
    80005b90:	6442                	ld	s0,16(sp)
    80005b92:	6105                	addi	sp,sp,32
    80005b94:	8082                	ret

0000000080005b96 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005b96:	715d                	addi	sp,sp,-80
    80005b98:	e486                	sd	ra,72(sp)
    80005b9a:	e0a2                	sd	s0,64(sp)
    80005b9c:	0880                	addi	s0,sp,80
    80005b9e:	fca43423          	sd	a0,-56(s0)
    80005ba2:	fcb43023          	sd	a1,-64(s0)
    80005ba6:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005baa:	fc843783          	ld	a5,-56(s0)
    80005bae:	04479783          	lh	a5,68(a5)
    80005bb2:	0007871b          	sext.w	a4,a5
    80005bb6:	4785                	li	a5,1
    80005bb8:	00f70a63          	beq	a4,a5,80005bcc <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005bbc:	00006517          	auipc	a0,0x6
    80005bc0:	92450513          	addi	a0,a0,-1756 # 8000b4e0 <etext+0x4e0>
    80005bc4:	ffffb097          	auipc	ra,0xffffb
    80005bc8:	08e080e7          	jalr	142(ra) # 80000c52 <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005bcc:	fe042623          	sw	zero,-20(s0)
    80005bd0:	a849                	j	80005c62 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005bd2:	fd840793          	addi	a5,s0,-40
    80005bd6:	fec42683          	lw	a3,-20(s0)
    80005bda:	4741                	li	a4,16
    80005bdc:	863e                	mv	a2,a5
    80005bde:	4581                	li	a1,0
    80005be0:	fc843503          	ld	a0,-56(s0)
    80005be4:	00000097          	auipc	ra,0x0
    80005be8:	c46080e7          	jalr	-954(ra) # 8000582a <readi>
    80005bec:	87aa                	mv	a5,a0
    80005bee:	873e                	mv	a4,a5
    80005bf0:	47c1                	li	a5,16
    80005bf2:	00f70a63          	beq	a4,a5,80005c06 <dirlookup+0x70>
      panic("dirlookup read");
    80005bf6:	00006517          	auipc	a0,0x6
    80005bfa:	90250513          	addi	a0,a0,-1790 # 8000b4f8 <etext+0x4f8>
    80005bfe:	ffffb097          	auipc	ra,0xffffb
    80005c02:	054080e7          	jalr	84(ra) # 80000c52 <panic>
    if(de.inum == 0)
    80005c06:	fd845783          	lhu	a5,-40(s0)
    80005c0a:	c7b1                	beqz	a5,80005c56 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005c0c:	fd840793          	addi	a5,s0,-40
    80005c10:	0789                	addi	a5,a5,2
    80005c12:	85be                	mv	a1,a5
    80005c14:	fc043503          	ld	a0,-64(s0)
    80005c18:	00000097          	auipc	ra,0x0
    80005c1c:	f50080e7          	jalr	-176(ra) # 80005b68 <namecmp>
    80005c20:	87aa                	mv	a5,a0
    80005c22:	eb9d                	bnez	a5,80005c58 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005c24:	fb843783          	ld	a5,-72(s0)
    80005c28:	c791                	beqz	a5,80005c34 <dirlookup+0x9e>
        *poff = off;
    80005c2a:	fb843783          	ld	a5,-72(s0)
    80005c2e:	fec42703          	lw	a4,-20(s0)
    80005c32:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005c34:	fd845783          	lhu	a5,-40(s0)
    80005c38:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005c3c:	fc843783          	ld	a5,-56(s0)
    80005c40:	439c                	lw	a5,0(a5)
    80005c42:	fe842703          	lw	a4,-24(s0)
    80005c46:	85ba                	mv	a1,a4
    80005c48:	853e                	mv	a0,a5
    80005c4a:	fffff097          	auipc	ra,0xfffff
    80005c4e:	4e2080e7          	jalr	1250(ra) # 8000512c <iget>
    80005c52:	87aa                	mv	a5,a0
    80005c54:	a005                	j	80005c74 <dirlookup+0xde>
      continue;
    80005c56:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c58:	fec42783          	lw	a5,-20(s0)
    80005c5c:	27c1                	addiw	a5,a5,16
    80005c5e:	fef42623          	sw	a5,-20(s0)
    80005c62:	fc843783          	ld	a5,-56(s0)
    80005c66:	47f8                	lw	a4,76(a5)
    80005c68:	fec42783          	lw	a5,-20(s0)
    80005c6c:	2781                	sext.w	a5,a5
    80005c6e:	f6e7e2e3          	bltu	a5,a4,80005bd2 <dirlookup+0x3c>
    }
  }

  return 0;
    80005c72:	4781                	li	a5,0
}
    80005c74:	853e                	mv	a0,a5
    80005c76:	60a6                	ld	ra,72(sp)
    80005c78:	6406                	ld	s0,64(sp)
    80005c7a:	6161                	addi	sp,sp,80
    80005c7c:	8082                	ret

0000000080005c7e <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005c7e:	715d                	addi	sp,sp,-80
    80005c80:	e486                	sd	ra,72(sp)
    80005c82:	e0a2                	sd	s0,64(sp)
    80005c84:	0880                	addi	s0,sp,80
    80005c86:	fca43423          	sd	a0,-56(s0)
    80005c8a:	fcb43023          	sd	a1,-64(s0)
    80005c8e:	87b2                	mv	a5,a2
    80005c90:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005c94:	4601                	li	a2,0
    80005c96:	fc043583          	ld	a1,-64(s0)
    80005c9a:	fc843503          	ld	a0,-56(s0)
    80005c9e:	00000097          	auipc	ra,0x0
    80005ca2:	ef8080e7          	jalr	-264(ra) # 80005b96 <dirlookup>
    80005ca6:	fea43023          	sd	a0,-32(s0)
    80005caa:	fe043783          	ld	a5,-32(s0)
    80005cae:	cb89                	beqz	a5,80005cc0 <dirlink+0x42>
    iput(ip);
    80005cb0:	fe043503          	ld	a0,-32(s0)
    80005cb4:	fffff097          	auipc	ra,0xfffff
    80005cb8:	76e080e7          	jalr	1902(ra) # 80005422 <iput>
    return -1;
    80005cbc:	57fd                	li	a5,-1
    80005cbe:	a865                	j	80005d76 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005cc0:	fe042623          	sw	zero,-20(s0)
    80005cc4:	a0a1                	j	80005d0c <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005cc6:	fd040793          	addi	a5,s0,-48
    80005cca:	fec42683          	lw	a3,-20(s0)
    80005cce:	4741                	li	a4,16
    80005cd0:	863e                	mv	a2,a5
    80005cd2:	4581                	li	a1,0
    80005cd4:	fc843503          	ld	a0,-56(s0)
    80005cd8:	00000097          	auipc	ra,0x0
    80005cdc:	b52080e7          	jalr	-1198(ra) # 8000582a <readi>
    80005ce0:	87aa                	mv	a5,a0
    80005ce2:	873e                	mv	a4,a5
    80005ce4:	47c1                	li	a5,16
    80005ce6:	00f70a63          	beq	a4,a5,80005cfa <dirlink+0x7c>
      panic("dirlink read");
    80005cea:	00006517          	auipc	a0,0x6
    80005cee:	81e50513          	addi	a0,a0,-2018 # 8000b508 <etext+0x508>
    80005cf2:	ffffb097          	auipc	ra,0xffffb
    80005cf6:	f60080e7          	jalr	-160(ra) # 80000c52 <panic>
    if(de.inum == 0)
    80005cfa:	fd045783          	lhu	a5,-48(s0)
    80005cfe:	cf99                	beqz	a5,80005d1c <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d00:	fec42783          	lw	a5,-20(s0)
    80005d04:	27c1                	addiw	a5,a5,16
    80005d06:	2781                	sext.w	a5,a5
    80005d08:	fef42623          	sw	a5,-20(s0)
    80005d0c:	fc843783          	ld	a5,-56(s0)
    80005d10:	47f8                	lw	a4,76(a5)
    80005d12:	fec42783          	lw	a5,-20(s0)
    80005d16:	fae7e8e3          	bltu	a5,a4,80005cc6 <dirlink+0x48>
    80005d1a:	a011                	j	80005d1e <dirlink+0xa0>
      break;
    80005d1c:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005d1e:	fd040793          	addi	a5,s0,-48
    80005d22:	0789                	addi	a5,a5,2
    80005d24:	4639                	li	a2,14
    80005d26:	fc043583          	ld	a1,-64(s0)
    80005d2a:	853e                	mv	a0,a5
    80005d2c:	ffffc097          	auipc	ra,0xffffc
    80005d30:	99c080e7          	jalr	-1636(ra) # 800016c8 <strncpy>
  de.inum = inum;
    80005d34:	fbc42783          	lw	a5,-68(s0)
    80005d38:	17c2                	slli	a5,a5,0x30
    80005d3a:	93c1                	srli	a5,a5,0x30
    80005d3c:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d40:	fd040793          	addi	a5,s0,-48
    80005d44:	fec42683          	lw	a3,-20(s0)
    80005d48:	4741                	li	a4,16
    80005d4a:	863e                	mv	a2,a5
    80005d4c:	4581                	li	a1,0
    80005d4e:	fc843503          	ld	a0,-56(s0)
    80005d52:	00000097          	auipc	ra,0x0
    80005d56:	c62080e7          	jalr	-926(ra) # 800059b4 <writei>
    80005d5a:	87aa                	mv	a5,a0
    80005d5c:	873e                	mv	a4,a5
    80005d5e:	47c1                	li	a5,16
    80005d60:	00f70a63          	beq	a4,a5,80005d74 <dirlink+0xf6>
    panic("dirlink");
    80005d64:	00005517          	auipc	a0,0x5
    80005d68:	7b450513          	addi	a0,a0,1972 # 8000b518 <etext+0x518>
    80005d6c:	ffffb097          	auipc	ra,0xffffb
    80005d70:	ee6080e7          	jalr	-282(ra) # 80000c52 <panic>

  return 0;
    80005d74:	4781                	li	a5,0
}
    80005d76:	853e                	mv	a0,a5
    80005d78:	60a6                	ld	ra,72(sp)
    80005d7a:	6406                	ld	s0,64(sp)
    80005d7c:	6161                	addi	sp,sp,80
    80005d7e:	8082                	ret

0000000080005d80 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005d80:	7179                	addi	sp,sp,-48
    80005d82:	f406                	sd	ra,40(sp)
    80005d84:	f022                	sd	s0,32(sp)
    80005d86:	1800                	addi	s0,sp,48
    80005d88:	fca43c23          	sd	a0,-40(s0)
    80005d8c:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005d90:	a031                	j	80005d9c <skipelem+0x1c>
    path++;
    80005d92:	fd843783          	ld	a5,-40(s0)
    80005d96:	0785                	addi	a5,a5,1
    80005d98:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005d9c:	fd843783          	ld	a5,-40(s0)
    80005da0:	0007c783          	lbu	a5,0(a5)
    80005da4:	873e                	mv	a4,a5
    80005da6:	02f00793          	li	a5,47
    80005daa:	fef704e3          	beq	a4,a5,80005d92 <skipelem+0x12>
  if(*path == 0)
    80005dae:	fd843783          	ld	a5,-40(s0)
    80005db2:	0007c783          	lbu	a5,0(a5)
    80005db6:	e399                	bnez	a5,80005dbc <skipelem+0x3c>
    return 0;
    80005db8:	4781                	li	a5,0
    80005dba:	a06d                	j	80005e64 <skipelem+0xe4>
  s = path;
    80005dbc:	fd843783          	ld	a5,-40(s0)
    80005dc0:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005dc4:	a031                	j	80005dd0 <skipelem+0x50>
    path++;
    80005dc6:	fd843783          	ld	a5,-40(s0)
    80005dca:	0785                	addi	a5,a5,1
    80005dcc:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005dd0:	fd843783          	ld	a5,-40(s0)
    80005dd4:	0007c783          	lbu	a5,0(a5)
    80005dd8:	873e                	mv	a4,a5
    80005dda:	02f00793          	li	a5,47
    80005dde:	00f70763          	beq	a4,a5,80005dec <skipelem+0x6c>
    80005de2:	fd843783          	ld	a5,-40(s0)
    80005de6:	0007c783          	lbu	a5,0(a5)
    80005dea:	fff1                	bnez	a5,80005dc6 <skipelem+0x46>
  len = path - s;
    80005dec:	fd843703          	ld	a4,-40(s0)
    80005df0:	fe843783          	ld	a5,-24(s0)
    80005df4:	40f707b3          	sub	a5,a4,a5
    80005df8:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005dfc:	fe442783          	lw	a5,-28(s0)
    80005e00:	0007871b          	sext.w	a4,a5
    80005e04:	47b5                	li	a5,13
    80005e06:	00e7dc63          	bge	a5,a4,80005e1e <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005e0a:	4639                	li	a2,14
    80005e0c:	fe843583          	ld	a1,-24(s0)
    80005e10:	fd043503          	ld	a0,-48(s0)
    80005e14:	ffffb097          	auipc	ra,0xffffb
    80005e18:	724080e7          	jalr	1828(ra) # 80001538 <memmove>
    80005e1c:	a80d                	j	80005e4e <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005e1e:	fe442783          	lw	a5,-28(s0)
    80005e22:	863e                	mv	a2,a5
    80005e24:	fe843583          	ld	a1,-24(s0)
    80005e28:	fd043503          	ld	a0,-48(s0)
    80005e2c:	ffffb097          	auipc	ra,0xffffb
    80005e30:	70c080e7          	jalr	1804(ra) # 80001538 <memmove>
    name[len] = 0;
    80005e34:	fe442783          	lw	a5,-28(s0)
    80005e38:	fd043703          	ld	a4,-48(s0)
    80005e3c:	97ba                	add	a5,a5,a4
    80005e3e:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005e42:	a031                	j	80005e4e <skipelem+0xce>
    path++;
    80005e44:	fd843783          	ld	a5,-40(s0)
    80005e48:	0785                	addi	a5,a5,1
    80005e4a:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005e4e:	fd843783          	ld	a5,-40(s0)
    80005e52:	0007c783          	lbu	a5,0(a5)
    80005e56:	873e                	mv	a4,a5
    80005e58:	02f00793          	li	a5,47
    80005e5c:	fef704e3          	beq	a4,a5,80005e44 <skipelem+0xc4>
  return path;
    80005e60:	fd843783          	ld	a5,-40(s0)
}
    80005e64:	853e                	mv	a0,a5
    80005e66:	70a2                	ld	ra,40(sp)
    80005e68:	7402                	ld	s0,32(sp)
    80005e6a:	6145                	addi	sp,sp,48
    80005e6c:	8082                	ret

0000000080005e6e <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005e6e:	7139                	addi	sp,sp,-64
    80005e70:	fc06                	sd	ra,56(sp)
    80005e72:	f822                	sd	s0,48(sp)
    80005e74:	0080                	addi	s0,sp,64
    80005e76:	fca43c23          	sd	a0,-40(s0)
    80005e7a:	87ae                	mv	a5,a1
    80005e7c:	fcc43423          	sd	a2,-56(s0)
    80005e80:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005e84:	fd843783          	ld	a5,-40(s0)
    80005e88:	0007c783          	lbu	a5,0(a5)
    80005e8c:	873e                	mv	a4,a5
    80005e8e:	02f00793          	li	a5,47
    80005e92:	00f71b63          	bne	a4,a5,80005ea8 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005e96:	4585                	li	a1,1
    80005e98:	4505                	li	a0,1
    80005e9a:	fffff097          	auipc	ra,0xfffff
    80005e9e:	292080e7          	jalr	658(ra) # 8000512c <iget>
    80005ea2:	fea43423          	sd	a0,-24(s0)
    80005ea6:	a84d                	j	80005f58 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005ea8:	ffffd097          	auipc	ra,0xffffd
    80005eac:	94a080e7          	jalr	-1718(ra) # 800027f2 <myproc>
    80005eb0:	87aa                	mv	a5,a0
    80005eb2:	1507b783          	ld	a5,336(a5)
    80005eb6:	853e                	mv	a0,a5
    80005eb8:	fffff097          	auipc	ra,0xfffff
    80005ebc:	390080e7          	jalr	912(ra) # 80005248 <idup>
    80005ec0:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005ec4:	a851                	j	80005f58 <namex+0xea>
    ilock(ip);
    80005ec6:	fe843503          	ld	a0,-24(s0)
    80005eca:	fffff097          	auipc	ra,0xfffff
    80005ece:	3ca080e7          	jalr	970(ra) # 80005294 <ilock>
    if(ip->type != T_DIR){
    80005ed2:	fe843783          	ld	a5,-24(s0)
    80005ed6:	04479783          	lh	a5,68(a5)
    80005eda:	0007871b          	sext.w	a4,a5
    80005ede:	4785                	li	a5,1
    80005ee0:	00f70a63          	beq	a4,a5,80005ef4 <namex+0x86>
      iunlockput(ip);
    80005ee4:	fe843503          	ld	a0,-24(s0)
    80005ee8:	fffff097          	auipc	ra,0xfffff
    80005eec:	60a080e7          	jalr	1546(ra) # 800054f2 <iunlockput>
      return 0;
    80005ef0:	4781                	li	a5,0
    80005ef2:	a871                	j	80005f8e <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005ef4:	fd442783          	lw	a5,-44(s0)
    80005ef8:	2781                	sext.w	a5,a5
    80005efa:	cf99                	beqz	a5,80005f18 <namex+0xaa>
    80005efc:	fd843783          	ld	a5,-40(s0)
    80005f00:	0007c783          	lbu	a5,0(a5)
    80005f04:	eb91                	bnez	a5,80005f18 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005f06:	fe843503          	ld	a0,-24(s0)
    80005f0a:	fffff097          	auipc	ra,0xfffff
    80005f0e:	4be080e7          	jalr	1214(ra) # 800053c8 <iunlock>
      return ip;
    80005f12:	fe843783          	ld	a5,-24(s0)
    80005f16:	a8a5                	j	80005f8e <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005f18:	4601                	li	a2,0
    80005f1a:	fc843583          	ld	a1,-56(s0)
    80005f1e:	fe843503          	ld	a0,-24(s0)
    80005f22:	00000097          	auipc	ra,0x0
    80005f26:	c74080e7          	jalr	-908(ra) # 80005b96 <dirlookup>
    80005f2a:	fea43023          	sd	a0,-32(s0)
    80005f2e:	fe043783          	ld	a5,-32(s0)
    80005f32:	eb89                	bnez	a5,80005f44 <namex+0xd6>
      iunlockput(ip);
    80005f34:	fe843503          	ld	a0,-24(s0)
    80005f38:	fffff097          	auipc	ra,0xfffff
    80005f3c:	5ba080e7          	jalr	1466(ra) # 800054f2 <iunlockput>
      return 0;
    80005f40:	4781                	li	a5,0
    80005f42:	a0b1                	j	80005f8e <namex+0x120>
    }
    iunlockput(ip);
    80005f44:	fe843503          	ld	a0,-24(s0)
    80005f48:	fffff097          	auipc	ra,0xfffff
    80005f4c:	5aa080e7          	jalr	1450(ra) # 800054f2 <iunlockput>
    ip = next;
    80005f50:	fe043783          	ld	a5,-32(s0)
    80005f54:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005f58:	fc843583          	ld	a1,-56(s0)
    80005f5c:	fd843503          	ld	a0,-40(s0)
    80005f60:	00000097          	auipc	ra,0x0
    80005f64:	e20080e7          	jalr	-480(ra) # 80005d80 <skipelem>
    80005f68:	fca43c23          	sd	a0,-40(s0)
    80005f6c:	fd843783          	ld	a5,-40(s0)
    80005f70:	fbb9                	bnez	a5,80005ec6 <namex+0x58>
  }
  if(nameiparent){
    80005f72:	fd442783          	lw	a5,-44(s0)
    80005f76:	2781                	sext.w	a5,a5
    80005f78:	cb89                	beqz	a5,80005f8a <namex+0x11c>
    iput(ip);
    80005f7a:	fe843503          	ld	a0,-24(s0)
    80005f7e:	fffff097          	auipc	ra,0xfffff
    80005f82:	4a4080e7          	jalr	1188(ra) # 80005422 <iput>
    return 0;
    80005f86:	4781                	li	a5,0
    80005f88:	a019                	j	80005f8e <namex+0x120>
  }
  return ip;
    80005f8a:	fe843783          	ld	a5,-24(s0)
}
    80005f8e:	853e                	mv	a0,a5
    80005f90:	70e2                	ld	ra,56(sp)
    80005f92:	7442                	ld	s0,48(sp)
    80005f94:	6121                	addi	sp,sp,64
    80005f96:	8082                	ret

0000000080005f98 <namei>:

struct inode*
namei(char *path)
{
    80005f98:	7179                	addi	sp,sp,-48
    80005f9a:	f406                	sd	ra,40(sp)
    80005f9c:	f022                	sd	s0,32(sp)
    80005f9e:	1800                	addi	s0,sp,48
    80005fa0:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005fa4:	fe040793          	addi	a5,s0,-32
    80005fa8:	863e                	mv	a2,a5
    80005faa:	4581                	li	a1,0
    80005fac:	fd843503          	ld	a0,-40(s0)
    80005fb0:	00000097          	auipc	ra,0x0
    80005fb4:	ebe080e7          	jalr	-322(ra) # 80005e6e <namex>
    80005fb8:	87aa                	mv	a5,a0
}
    80005fba:	853e                	mv	a0,a5
    80005fbc:	70a2                	ld	ra,40(sp)
    80005fbe:	7402                	ld	s0,32(sp)
    80005fc0:	6145                	addi	sp,sp,48
    80005fc2:	8082                	ret

0000000080005fc4 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005fc4:	1101                	addi	sp,sp,-32
    80005fc6:	ec06                	sd	ra,24(sp)
    80005fc8:	e822                	sd	s0,16(sp)
    80005fca:	1000                	addi	s0,sp,32
    80005fcc:	fea43423          	sd	a0,-24(s0)
    80005fd0:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005fd4:	fe043603          	ld	a2,-32(s0)
    80005fd8:	4585                	li	a1,1
    80005fda:	fe843503          	ld	a0,-24(s0)
    80005fde:	00000097          	auipc	ra,0x0
    80005fe2:	e90080e7          	jalr	-368(ra) # 80005e6e <namex>
    80005fe6:	87aa                	mv	a5,a0
}
    80005fe8:	853e                	mv	a0,a5
    80005fea:	60e2                	ld	ra,24(sp)
    80005fec:	6442                	ld	s0,16(sp)
    80005fee:	6105                	addi	sp,sp,32
    80005ff0:	8082                	ret

0000000080005ff2 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005ff2:	1101                	addi	sp,sp,-32
    80005ff4:	ec06                	sd	ra,24(sp)
    80005ff6:	e822                	sd	s0,16(sp)
    80005ff8:	1000                	addi	s0,sp,32
    80005ffa:	87aa                	mv	a5,a0
    80005ffc:	feb43023          	sd	a1,-32(s0)
    80006000:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006004:	00005597          	auipc	a1,0x5
    80006008:	51c58593          	addi	a1,a1,1308 # 8000b520 <etext+0x520>
    8000600c:	00068517          	auipc	a0,0x68
    80006010:	c4450513          	addi	a0,a0,-956 # 8006dc50 <log>
    80006014:	ffffb097          	auipc	ra,0xffffb
    80006018:	23c080e7          	jalr	572(ra) # 80001250 <initlock>
  log.start = sb->logstart;
    8000601c:	fe043783          	ld	a5,-32(s0)
    80006020:	4bdc                	lw	a5,20(a5)
    80006022:	0007871b          	sext.w	a4,a5
    80006026:	00068797          	auipc	a5,0x68
    8000602a:	c2a78793          	addi	a5,a5,-982 # 8006dc50 <log>
    8000602e:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80006030:	fe043783          	ld	a5,-32(s0)
    80006034:	4b9c                	lw	a5,16(a5)
    80006036:	0007871b          	sext.w	a4,a5
    8000603a:	00068797          	auipc	a5,0x68
    8000603e:	c1678793          	addi	a5,a5,-1002 # 8006dc50 <log>
    80006042:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006044:	00068797          	auipc	a5,0x68
    80006048:	c0c78793          	addi	a5,a5,-1012 # 8006dc50 <log>
    8000604c:	fec42703          	lw	a4,-20(s0)
    80006050:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006052:	00000097          	auipc	ra,0x0
    80006056:	272080e7          	jalr	626(ra) # 800062c4 <recover_from_log>
}
    8000605a:	0001                	nop
    8000605c:	60e2                	ld	ra,24(sp)
    8000605e:	6442                	ld	s0,16(sp)
    80006060:	6105                	addi	sp,sp,32
    80006062:	8082                	ret

0000000080006064 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80006064:	7139                	addi	sp,sp,-64
    80006066:	fc06                	sd	ra,56(sp)
    80006068:	f822                	sd	s0,48(sp)
    8000606a:	0080                	addi	s0,sp,64
    8000606c:	87aa                	mv	a5,a0
    8000606e:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006072:	fe042623          	sw	zero,-20(s0)
    80006076:	a0f9                	j	80006144 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80006078:	00068797          	auipc	a5,0x68
    8000607c:	bd878793          	addi	a5,a5,-1064 # 8006dc50 <log>
    80006080:	579c                	lw	a5,40(a5)
    80006082:	0007869b          	sext.w	a3,a5
    80006086:	00068797          	auipc	a5,0x68
    8000608a:	bca78793          	addi	a5,a5,-1078 # 8006dc50 <log>
    8000608e:	4f9c                	lw	a5,24(a5)
    80006090:	fec42703          	lw	a4,-20(s0)
    80006094:	9fb9                	addw	a5,a5,a4
    80006096:	2781                	sext.w	a5,a5
    80006098:	2785                	addiw	a5,a5,1
    8000609a:	2781                	sext.w	a5,a5
    8000609c:	2781                	sext.w	a5,a5
    8000609e:	85be                	mv	a1,a5
    800060a0:	8536                	mv	a0,a3
    800060a2:	fffff097          	auipc	ra,0xfffff
    800060a6:	80a080e7          	jalr	-2038(ra) # 800048ac <bread>
    800060aa:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    800060ae:	00068797          	auipc	a5,0x68
    800060b2:	ba278793          	addi	a5,a5,-1118 # 8006dc50 <log>
    800060b6:	579c                	lw	a5,40(a5)
    800060b8:	0007869b          	sext.w	a3,a5
    800060bc:	00068717          	auipc	a4,0x68
    800060c0:	b9470713          	addi	a4,a4,-1132 # 8006dc50 <log>
    800060c4:	fec42783          	lw	a5,-20(s0)
    800060c8:	07a1                	addi	a5,a5,8
    800060ca:	078a                	slli	a5,a5,0x2
    800060cc:	97ba                	add	a5,a5,a4
    800060ce:	4b9c                	lw	a5,16(a5)
    800060d0:	2781                	sext.w	a5,a5
    800060d2:	85be                	mv	a1,a5
    800060d4:	8536                	mv	a0,a3
    800060d6:	ffffe097          	auipc	ra,0xffffe
    800060da:	7d6080e7          	jalr	2006(ra) # 800048ac <bread>
    800060de:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    800060e2:	fd843783          	ld	a5,-40(s0)
    800060e6:	05878713          	addi	a4,a5,88
    800060ea:	fe043783          	ld	a5,-32(s0)
    800060ee:	05878793          	addi	a5,a5,88
    800060f2:	40000613          	li	a2,1024
    800060f6:	85be                	mv	a1,a5
    800060f8:	853a                	mv	a0,a4
    800060fa:	ffffb097          	auipc	ra,0xffffb
    800060fe:	43e080e7          	jalr	1086(ra) # 80001538 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006102:	fd843503          	ld	a0,-40(s0)
    80006106:	fffff097          	auipc	ra,0xfffff
    8000610a:	800080e7          	jalr	-2048(ra) # 80004906 <bwrite>
    if(recovering == 0)
    8000610e:	fcc42783          	lw	a5,-52(s0)
    80006112:	2781                	sext.w	a5,a5
    80006114:	e799                	bnez	a5,80006122 <install_trans+0xbe>
      bunpin(dbuf);
    80006116:	fd843503          	ld	a0,-40(s0)
    8000611a:	fffff097          	auipc	ra,0xfffff
    8000611e:	96a080e7          	jalr	-1686(ra) # 80004a84 <bunpin>
    brelse(lbuf);
    80006122:	fe043503          	ld	a0,-32(s0)
    80006126:	fffff097          	auipc	ra,0xfffff
    8000612a:	828080e7          	jalr	-2008(ra) # 8000494e <brelse>
    brelse(dbuf);
    8000612e:	fd843503          	ld	a0,-40(s0)
    80006132:	fffff097          	auipc	ra,0xfffff
    80006136:	81c080e7          	jalr	-2020(ra) # 8000494e <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    8000613a:	fec42783          	lw	a5,-20(s0)
    8000613e:	2785                	addiw	a5,a5,1
    80006140:	fef42623          	sw	a5,-20(s0)
    80006144:	00068797          	auipc	a5,0x68
    80006148:	b0c78793          	addi	a5,a5,-1268 # 8006dc50 <log>
    8000614c:	57d8                	lw	a4,44(a5)
    8000614e:	fec42783          	lw	a5,-20(s0)
    80006152:	2781                	sext.w	a5,a5
    80006154:	f2e7c2e3          	blt	a5,a4,80006078 <install_trans+0x14>
  }
}
    80006158:	0001                	nop
    8000615a:	0001                	nop
    8000615c:	70e2                	ld	ra,56(sp)
    8000615e:	7442                	ld	s0,48(sp)
    80006160:	6121                	addi	sp,sp,64
    80006162:	8082                	ret

0000000080006164 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80006164:	7179                	addi	sp,sp,-48
    80006166:	f406                	sd	ra,40(sp)
    80006168:	f022                	sd	s0,32(sp)
    8000616a:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000616c:	00068797          	auipc	a5,0x68
    80006170:	ae478793          	addi	a5,a5,-1308 # 8006dc50 <log>
    80006174:	579c                	lw	a5,40(a5)
    80006176:	0007871b          	sext.w	a4,a5
    8000617a:	00068797          	auipc	a5,0x68
    8000617e:	ad678793          	addi	a5,a5,-1322 # 8006dc50 <log>
    80006182:	4f9c                	lw	a5,24(a5)
    80006184:	2781                	sext.w	a5,a5
    80006186:	85be                	mv	a1,a5
    80006188:	853a                	mv	a0,a4
    8000618a:	ffffe097          	auipc	ra,0xffffe
    8000618e:	722080e7          	jalr	1826(ra) # 800048ac <bread>
    80006192:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006196:	fe043783          	ld	a5,-32(s0)
    8000619a:	05878793          	addi	a5,a5,88
    8000619e:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800061a2:	fd843783          	ld	a5,-40(s0)
    800061a6:	4398                	lw	a4,0(a5)
    800061a8:	00068797          	auipc	a5,0x68
    800061ac:	aa878793          	addi	a5,a5,-1368 # 8006dc50 <log>
    800061b0:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    800061b2:	fe042623          	sw	zero,-20(s0)
    800061b6:	a03d                	j	800061e4 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    800061b8:	fd843703          	ld	a4,-40(s0)
    800061bc:	fec42783          	lw	a5,-20(s0)
    800061c0:	078a                	slli	a5,a5,0x2
    800061c2:	97ba                	add	a5,a5,a4
    800061c4:	43d8                	lw	a4,4(a5)
    800061c6:	00068697          	auipc	a3,0x68
    800061ca:	a8a68693          	addi	a3,a3,-1398 # 8006dc50 <log>
    800061ce:	fec42783          	lw	a5,-20(s0)
    800061d2:	07a1                	addi	a5,a5,8
    800061d4:	078a                	slli	a5,a5,0x2
    800061d6:	97b6                	add	a5,a5,a3
    800061d8:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    800061da:	fec42783          	lw	a5,-20(s0)
    800061de:	2785                	addiw	a5,a5,1
    800061e0:	fef42623          	sw	a5,-20(s0)
    800061e4:	00068797          	auipc	a5,0x68
    800061e8:	a6c78793          	addi	a5,a5,-1428 # 8006dc50 <log>
    800061ec:	57d8                	lw	a4,44(a5)
    800061ee:	fec42783          	lw	a5,-20(s0)
    800061f2:	2781                	sext.w	a5,a5
    800061f4:	fce7c2e3          	blt	a5,a4,800061b8 <read_head+0x54>
  }
  brelse(buf);
    800061f8:	fe043503          	ld	a0,-32(s0)
    800061fc:	ffffe097          	auipc	ra,0xffffe
    80006200:	752080e7          	jalr	1874(ra) # 8000494e <brelse>
}
    80006204:	0001                	nop
    80006206:	70a2                	ld	ra,40(sp)
    80006208:	7402                	ld	s0,32(sp)
    8000620a:	6145                	addi	sp,sp,48
    8000620c:	8082                	ret

000000008000620e <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000620e:	7179                	addi	sp,sp,-48
    80006210:	f406                	sd	ra,40(sp)
    80006212:	f022                	sd	s0,32(sp)
    80006214:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006216:	00068797          	auipc	a5,0x68
    8000621a:	a3a78793          	addi	a5,a5,-1478 # 8006dc50 <log>
    8000621e:	579c                	lw	a5,40(a5)
    80006220:	0007871b          	sext.w	a4,a5
    80006224:	00068797          	auipc	a5,0x68
    80006228:	a2c78793          	addi	a5,a5,-1492 # 8006dc50 <log>
    8000622c:	4f9c                	lw	a5,24(a5)
    8000622e:	2781                	sext.w	a5,a5
    80006230:	85be                	mv	a1,a5
    80006232:	853a                	mv	a0,a4
    80006234:	ffffe097          	auipc	ra,0xffffe
    80006238:	678080e7          	jalr	1656(ra) # 800048ac <bread>
    8000623c:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006240:	fe043783          	ld	a5,-32(s0)
    80006244:	05878793          	addi	a5,a5,88
    80006248:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000624c:	00068797          	auipc	a5,0x68
    80006250:	a0478793          	addi	a5,a5,-1532 # 8006dc50 <log>
    80006254:	57d8                	lw	a4,44(a5)
    80006256:	fd843783          	ld	a5,-40(s0)
    8000625a:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000625c:	fe042623          	sw	zero,-20(s0)
    80006260:	a03d                	j	8000628e <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006262:	00068717          	auipc	a4,0x68
    80006266:	9ee70713          	addi	a4,a4,-1554 # 8006dc50 <log>
    8000626a:	fec42783          	lw	a5,-20(s0)
    8000626e:	07a1                	addi	a5,a5,8
    80006270:	078a                	slli	a5,a5,0x2
    80006272:	97ba                	add	a5,a5,a4
    80006274:	4b98                	lw	a4,16(a5)
    80006276:	fd843683          	ld	a3,-40(s0)
    8000627a:	fec42783          	lw	a5,-20(s0)
    8000627e:	078a                	slli	a5,a5,0x2
    80006280:	97b6                	add	a5,a5,a3
    80006282:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006284:	fec42783          	lw	a5,-20(s0)
    80006288:	2785                	addiw	a5,a5,1
    8000628a:	fef42623          	sw	a5,-20(s0)
    8000628e:	00068797          	auipc	a5,0x68
    80006292:	9c278793          	addi	a5,a5,-1598 # 8006dc50 <log>
    80006296:	57d8                	lw	a4,44(a5)
    80006298:	fec42783          	lw	a5,-20(s0)
    8000629c:	2781                	sext.w	a5,a5
    8000629e:	fce7c2e3          	blt	a5,a4,80006262 <write_head+0x54>
  }
  bwrite(buf);
    800062a2:	fe043503          	ld	a0,-32(s0)
    800062a6:	ffffe097          	auipc	ra,0xffffe
    800062aa:	660080e7          	jalr	1632(ra) # 80004906 <bwrite>
  brelse(buf);
    800062ae:	fe043503          	ld	a0,-32(s0)
    800062b2:	ffffe097          	auipc	ra,0xffffe
    800062b6:	69c080e7          	jalr	1692(ra) # 8000494e <brelse>
}
    800062ba:	0001                	nop
    800062bc:	70a2                	ld	ra,40(sp)
    800062be:	7402                	ld	s0,32(sp)
    800062c0:	6145                	addi	sp,sp,48
    800062c2:	8082                	ret

00000000800062c4 <recover_from_log>:

static void
recover_from_log(void)
{
    800062c4:	1141                	addi	sp,sp,-16
    800062c6:	e406                	sd	ra,8(sp)
    800062c8:	e022                	sd	s0,0(sp)
    800062ca:	0800                	addi	s0,sp,16
  read_head();
    800062cc:	00000097          	auipc	ra,0x0
    800062d0:	e98080e7          	jalr	-360(ra) # 80006164 <read_head>
  install_trans(1); // if committed, copy from log to disk
    800062d4:	4505                	li	a0,1
    800062d6:	00000097          	auipc	ra,0x0
    800062da:	d8e080e7          	jalr	-626(ra) # 80006064 <install_trans>
  log.lh.n = 0;
    800062de:	00068797          	auipc	a5,0x68
    800062e2:	97278793          	addi	a5,a5,-1678 # 8006dc50 <log>
    800062e6:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800062ea:	00000097          	auipc	ra,0x0
    800062ee:	f24080e7          	jalr	-220(ra) # 8000620e <write_head>
}
    800062f2:	0001                	nop
    800062f4:	60a2                	ld	ra,8(sp)
    800062f6:	6402                	ld	s0,0(sp)
    800062f8:	0141                	addi	sp,sp,16
    800062fa:	8082                	ret

00000000800062fc <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800062fc:	1141                	addi	sp,sp,-16
    800062fe:	e406                	sd	ra,8(sp)
    80006300:	e022                	sd	s0,0(sp)
    80006302:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006304:	00068517          	auipc	a0,0x68
    80006308:	94c50513          	addi	a0,a0,-1716 # 8006dc50 <log>
    8000630c:	ffffb097          	auipc	ra,0xffffb
    80006310:	f74080e7          	jalr	-140(ra) # 80001280 <acquire>
  while(1){
    if(log.committing){
    80006314:	00068797          	auipc	a5,0x68
    80006318:	93c78793          	addi	a5,a5,-1732 # 8006dc50 <log>
    8000631c:	53dc                	lw	a5,36(a5)
    8000631e:	cf91                	beqz	a5,8000633a <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006320:	00068597          	auipc	a1,0x68
    80006324:	93058593          	addi	a1,a1,-1744 # 8006dc50 <log>
    80006328:	00068517          	auipc	a0,0x68
    8000632c:	92850513          	addi	a0,a0,-1752 # 8006dc50 <log>
    80006330:	ffffd097          	auipc	ra,0xffffd
    80006334:	10a080e7          	jalr	266(ra) # 8000343a <sleep>
    80006338:	bff1                	j	80006314 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    8000633a:	00068797          	auipc	a5,0x68
    8000633e:	91678793          	addi	a5,a5,-1770 # 8006dc50 <log>
    80006342:	57d8                	lw	a4,44(a5)
    80006344:	00068797          	auipc	a5,0x68
    80006348:	90c78793          	addi	a5,a5,-1780 # 8006dc50 <log>
    8000634c:	539c                	lw	a5,32(a5)
    8000634e:	2785                	addiw	a5,a5,1
    80006350:	2781                	sext.w	a5,a5
    80006352:	86be                	mv	a3,a5
    80006354:	87b6                	mv	a5,a3
    80006356:	0027979b          	slliw	a5,a5,0x2
    8000635a:	9fb5                	addw	a5,a5,a3
    8000635c:	0017979b          	slliw	a5,a5,0x1
    80006360:	2781                	sext.w	a5,a5
    80006362:	9fb9                	addw	a5,a5,a4
    80006364:	2781                	sext.w	a5,a5
    80006366:	873e                	mv	a4,a5
    80006368:	47f9                	li	a5,30
    8000636a:	00e7df63          	bge	a5,a4,80006388 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000636e:	00068597          	auipc	a1,0x68
    80006372:	8e258593          	addi	a1,a1,-1822 # 8006dc50 <log>
    80006376:	00068517          	auipc	a0,0x68
    8000637a:	8da50513          	addi	a0,a0,-1830 # 8006dc50 <log>
    8000637e:	ffffd097          	auipc	ra,0xffffd
    80006382:	0bc080e7          	jalr	188(ra) # 8000343a <sleep>
    80006386:	b779                	j	80006314 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006388:	00068797          	auipc	a5,0x68
    8000638c:	8c878793          	addi	a5,a5,-1848 # 8006dc50 <log>
    80006390:	539c                	lw	a5,32(a5)
    80006392:	2785                	addiw	a5,a5,1
    80006394:	0007871b          	sext.w	a4,a5
    80006398:	00068797          	auipc	a5,0x68
    8000639c:	8b878793          	addi	a5,a5,-1864 # 8006dc50 <log>
    800063a0:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800063a2:	00068517          	auipc	a0,0x68
    800063a6:	8ae50513          	addi	a0,a0,-1874 # 8006dc50 <log>
    800063aa:	ffffb097          	auipc	ra,0xffffb
    800063ae:	f3a080e7          	jalr	-198(ra) # 800012e4 <release>
      break;
    800063b2:	0001                	nop
    }
  }
}
    800063b4:	0001                	nop
    800063b6:	60a2                	ld	ra,8(sp)
    800063b8:	6402                	ld	s0,0(sp)
    800063ba:	0141                	addi	sp,sp,16
    800063bc:	8082                	ret

00000000800063be <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    800063be:	1101                	addi	sp,sp,-32
    800063c0:	ec06                	sd	ra,24(sp)
    800063c2:	e822                	sd	s0,16(sp)
    800063c4:	1000                	addi	s0,sp,32
  int do_commit = 0;
    800063c6:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    800063ca:	00068517          	auipc	a0,0x68
    800063ce:	88650513          	addi	a0,a0,-1914 # 8006dc50 <log>
    800063d2:	ffffb097          	auipc	ra,0xffffb
    800063d6:	eae080e7          	jalr	-338(ra) # 80001280 <acquire>
  log.outstanding -= 1;
    800063da:	00068797          	auipc	a5,0x68
    800063de:	87678793          	addi	a5,a5,-1930 # 8006dc50 <log>
    800063e2:	539c                	lw	a5,32(a5)
    800063e4:	37fd                	addiw	a5,a5,-1
    800063e6:	0007871b          	sext.w	a4,a5
    800063ea:	00068797          	auipc	a5,0x68
    800063ee:	86678793          	addi	a5,a5,-1946 # 8006dc50 <log>
    800063f2:	d398                	sw	a4,32(a5)
  if(log.committing)
    800063f4:	00068797          	auipc	a5,0x68
    800063f8:	85c78793          	addi	a5,a5,-1956 # 8006dc50 <log>
    800063fc:	53dc                	lw	a5,36(a5)
    800063fe:	cb89                	beqz	a5,80006410 <end_op+0x52>
    panic("log.committing");
    80006400:	00005517          	auipc	a0,0x5
    80006404:	12850513          	addi	a0,a0,296 # 8000b528 <etext+0x528>
    80006408:	ffffb097          	auipc	ra,0xffffb
    8000640c:	84a080e7          	jalr	-1974(ra) # 80000c52 <panic>
  if(log.outstanding == 0){
    80006410:	00068797          	auipc	a5,0x68
    80006414:	84078793          	addi	a5,a5,-1984 # 8006dc50 <log>
    80006418:	539c                	lw	a5,32(a5)
    8000641a:	eb99                	bnez	a5,80006430 <end_op+0x72>
    do_commit = 1;
    8000641c:	4785                	li	a5,1
    8000641e:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006422:	00068797          	auipc	a5,0x68
    80006426:	82e78793          	addi	a5,a5,-2002 # 8006dc50 <log>
    8000642a:	4705                	li	a4,1
    8000642c:	d3d8                	sw	a4,36(a5)
    8000642e:	a809                	j	80006440 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    80006430:	00068517          	auipc	a0,0x68
    80006434:	82050513          	addi	a0,a0,-2016 # 8006dc50 <log>
    80006438:	ffffd097          	auipc	ra,0xffffd
    8000643c:	096080e7          	jalr	150(ra) # 800034ce <wakeup>
  }
  release(&log.lock);
    80006440:	00068517          	auipc	a0,0x68
    80006444:	81050513          	addi	a0,a0,-2032 # 8006dc50 <log>
    80006448:	ffffb097          	auipc	ra,0xffffb
    8000644c:	e9c080e7          	jalr	-356(ra) # 800012e4 <release>

  if(do_commit){
    80006450:	fec42783          	lw	a5,-20(s0)
    80006454:	2781                	sext.w	a5,a5
    80006456:	c3b9                	beqz	a5,8000649c <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006458:	00000097          	auipc	ra,0x0
    8000645c:	134080e7          	jalr	308(ra) # 8000658c <commit>
    acquire(&log.lock);
    80006460:	00067517          	auipc	a0,0x67
    80006464:	7f050513          	addi	a0,a0,2032 # 8006dc50 <log>
    80006468:	ffffb097          	auipc	ra,0xffffb
    8000646c:	e18080e7          	jalr	-488(ra) # 80001280 <acquire>
    log.committing = 0;
    80006470:	00067797          	auipc	a5,0x67
    80006474:	7e078793          	addi	a5,a5,2016 # 8006dc50 <log>
    80006478:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000647c:	00067517          	auipc	a0,0x67
    80006480:	7d450513          	addi	a0,a0,2004 # 8006dc50 <log>
    80006484:	ffffd097          	auipc	ra,0xffffd
    80006488:	04a080e7          	jalr	74(ra) # 800034ce <wakeup>
    release(&log.lock);
    8000648c:	00067517          	auipc	a0,0x67
    80006490:	7c450513          	addi	a0,a0,1988 # 8006dc50 <log>
    80006494:	ffffb097          	auipc	ra,0xffffb
    80006498:	e50080e7          	jalr	-432(ra) # 800012e4 <release>
  }
}
    8000649c:	0001                	nop
    8000649e:	60e2                	ld	ra,24(sp)
    800064a0:	6442                	ld	s0,16(sp)
    800064a2:	6105                	addi	sp,sp,32
    800064a4:	8082                	ret

00000000800064a6 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800064a6:	7179                	addi	sp,sp,-48
    800064a8:	f406                	sd	ra,40(sp)
    800064aa:	f022                	sd	s0,32(sp)
    800064ac:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800064ae:	fe042623          	sw	zero,-20(s0)
    800064b2:	a86d                	j	8000656c <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    800064b4:	00067797          	auipc	a5,0x67
    800064b8:	79c78793          	addi	a5,a5,1948 # 8006dc50 <log>
    800064bc:	579c                	lw	a5,40(a5)
    800064be:	0007869b          	sext.w	a3,a5
    800064c2:	00067797          	auipc	a5,0x67
    800064c6:	78e78793          	addi	a5,a5,1934 # 8006dc50 <log>
    800064ca:	4f9c                	lw	a5,24(a5)
    800064cc:	fec42703          	lw	a4,-20(s0)
    800064d0:	9fb9                	addw	a5,a5,a4
    800064d2:	2781                	sext.w	a5,a5
    800064d4:	2785                	addiw	a5,a5,1
    800064d6:	2781                	sext.w	a5,a5
    800064d8:	2781                	sext.w	a5,a5
    800064da:	85be                	mv	a1,a5
    800064dc:	8536                	mv	a0,a3
    800064de:	ffffe097          	auipc	ra,0xffffe
    800064e2:	3ce080e7          	jalr	974(ra) # 800048ac <bread>
    800064e6:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800064ea:	00067797          	auipc	a5,0x67
    800064ee:	76678793          	addi	a5,a5,1894 # 8006dc50 <log>
    800064f2:	579c                	lw	a5,40(a5)
    800064f4:	0007869b          	sext.w	a3,a5
    800064f8:	00067717          	auipc	a4,0x67
    800064fc:	75870713          	addi	a4,a4,1880 # 8006dc50 <log>
    80006500:	fec42783          	lw	a5,-20(s0)
    80006504:	07a1                	addi	a5,a5,8
    80006506:	078a                	slli	a5,a5,0x2
    80006508:	97ba                	add	a5,a5,a4
    8000650a:	4b9c                	lw	a5,16(a5)
    8000650c:	2781                	sext.w	a5,a5
    8000650e:	85be                	mv	a1,a5
    80006510:	8536                	mv	a0,a3
    80006512:	ffffe097          	auipc	ra,0xffffe
    80006516:	39a080e7          	jalr	922(ra) # 800048ac <bread>
    8000651a:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000651e:	fe043783          	ld	a5,-32(s0)
    80006522:	05878713          	addi	a4,a5,88
    80006526:	fd843783          	ld	a5,-40(s0)
    8000652a:	05878793          	addi	a5,a5,88
    8000652e:	40000613          	li	a2,1024
    80006532:	85be                	mv	a1,a5
    80006534:	853a                	mv	a0,a4
    80006536:	ffffb097          	auipc	ra,0xffffb
    8000653a:	002080e7          	jalr	2(ra) # 80001538 <memmove>
    bwrite(to);  // write the log
    8000653e:	fe043503          	ld	a0,-32(s0)
    80006542:	ffffe097          	auipc	ra,0xffffe
    80006546:	3c4080e7          	jalr	964(ra) # 80004906 <bwrite>
    brelse(from);
    8000654a:	fd843503          	ld	a0,-40(s0)
    8000654e:	ffffe097          	auipc	ra,0xffffe
    80006552:	400080e7          	jalr	1024(ra) # 8000494e <brelse>
    brelse(to);
    80006556:	fe043503          	ld	a0,-32(s0)
    8000655a:	ffffe097          	auipc	ra,0xffffe
    8000655e:	3f4080e7          	jalr	1012(ra) # 8000494e <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006562:	fec42783          	lw	a5,-20(s0)
    80006566:	2785                	addiw	a5,a5,1
    80006568:	fef42623          	sw	a5,-20(s0)
    8000656c:	00067797          	auipc	a5,0x67
    80006570:	6e478793          	addi	a5,a5,1764 # 8006dc50 <log>
    80006574:	57d8                	lw	a4,44(a5)
    80006576:	fec42783          	lw	a5,-20(s0)
    8000657a:	2781                	sext.w	a5,a5
    8000657c:	f2e7cce3          	blt	a5,a4,800064b4 <write_log+0xe>
  }
}
    80006580:	0001                	nop
    80006582:	0001                	nop
    80006584:	70a2                	ld	ra,40(sp)
    80006586:	7402                	ld	s0,32(sp)
    80006588:	6145                	addi	sp,sp,48
    8000658a:	8082                	ret

000000008000658c <commit>:

static void
commit()
{
    8000658c:	1141                	addi	sp,sp,-16
    8000658e:	e406                	sd	ra,8(sp)
    80006590:	e022                	sd	s0,0(sp)
    80006592:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006594:	00067797          	auipc	a5,0x67
    80006598:	6bc78793          	addi	a5,a5,1724 # 8006dc50 <log>
    8000659c:	57dc                	lw	a5,44(a5)
    8000659e:	02f05963          	blez	a5,800065d0 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800065a2:	00000097          	auipc	ra,0x0
    800065a6:	f04080e7          	jalr	-252(ra) # 800064a6 <write_log>
    write_head();    // Write header to disk -- the real commit
    800065aa:	00000097          	auipc	ra,0x0
    800065ae:	c64080e7          	jalr	-924(ra) # 8000620e <write_head>
    install_trans(0); // Now install writes to home locations
    800065b2:	4501                	li	a0,0
    800065b4:	00000097          	auipc	ra,0x0
    800065b8:	ab0080e7          	jalr	-1360(ra) # 80006064 <install_trans>
    log.lh.n = 0;
    800065bc:	00067797          	auipc	a5,0x67
    800065c0:	69478793          	addi	a5,a5,1684 # 8006dc50 <log>
    800065c4:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    800065c8:	00000097          	auipc	ra,0x0
    800065cc:	c46080e7          	jalr	-954(ra) # 8000620e <write_head>
  }
}
    800065d0:	0001                	nop
    800065d2:	60a2                	ld	ra,8(sp)
    800065d4:	6402                	ld	s0,0(sp)
    800065d6:	0141                	addi	sp,sp,16
    800065d8:	8082                	ret

00000000800065da <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    800065da:	7179                	addi	sp,sp,-48
    800065dc:	f406                	sd	ra,40(sp)
    800065de:	f022                	sd	s0,32(sp)
    800065e0:	1800                	addi	s0,sp,48
    800065e2:	fca43c23          	sd	a0,-40(s0)
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800065e6:	00067797          	auipc	a5,0x67
    800065ea:	66a78793          	addi	a5,a5,1642 # 8006dc50 <log>
    800065ee:	57dc                	lw	a5,44(a5)
    800065f0:	873e                	mv	a4,a5
    800065f2:	47f5                	li	a5,29
    800065f4:	02e7c063          	blt	a5,a4,80006614 <log_write+0x3a>
    800065f8:	00067797          	auipc	a5,0x67
    800065fc:	65878793          	addi	a5,a5,1624 # 8006dc50 <log>
    80006600:	57d8                	lw	a4,44(a5)
    80006602:	00067797          	auipc	a5,0x67
    80006606:	64e78793          	addi	a5,a5,1614 # 8006dc50 <log>
    8000660a:	4fdc                	lw	a5,28(a5)
    8000660c:	37fd                	addiw	a5,a5,-1
    8000660e:	2781                	sext.w	a5,a5
    80006610:	00f74a63          	blt	a4,a5,80006624 <log_write+0x4a>
    panic("too big a transaction");
    80006614:	00005517          	auipc	a0,0x5
    80006618:	f2450513          	addi	a0,a0,-220 # 8000b538 <etext+0x538>
    8000661c:	ffffa097          	auipc	ra,0xffffa
    80006620:	636080e7          	jalr	1590(ra) # 80000c52 <panic>
  if (log.outstanding < 1)
    80006624:	00067797          	auipc	a5,0x67
    80006628:	62c78793          	addi	a5,a5,1580 # 8006dc50 <log>
    8000662c:	539c                	lw	a5,32(a5)
    8000662e:	00f04a63          	bgtz	a5,80006642 <log_write+0x68>
    panic("log_write outside of trans");
    80006632:	00005517          	auipc	a0,0x5
    80006636:	f1e50513          	addi	a0,a0,-226 # 8000b550 <etext+0x550>
    8000663a:	ffffa097          	auipc	ra,0xffffa
    8000663e:	618080e7          	jalr	1560(ra) # 80000c52 <panic>

  acquire(&log.lock);
    80006642:	00067517          	auipc	a0,0x67
    80006646:	60e50513          	addi	a0,a0,1550 # 8006dc50 <log>
    8000664a:	ffffb097          	auipc	ra,0xffffb
    8000664e:	c36080e7          	jalr	-970(ra) # 80001280 <acquire>
  for (i = 0; i < log.lh.n; i++) {
    80006652:	fe042623          	sw	zero,-20(s0)
    80006656:	a03d                	j	80006684 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
    80006658:	00067717          	auipc	a4,0x67
    8000665c:	5f870713          	addi	a4,a4,1528 # 8006dc50 <log>
    80006660:	fec42783          	lw	a5,-20(s0)
    80006664:	07a1                	addi	a5,a5,8
    80006666:	078a                	slli	a5,a5,0x2
    80006668:	97ba                	add	a5,a5,a4
    8000666a:	4b9c                	lw	a5,16(a5)
    8000666c:	0007871b          	sext.w	a4,a5
    80006670:	fd843783          	ld	a5,-40(s0)
    80006674:	47dc                	lw	a5,12(a5)
    80006676:	02f70263          	beq	a4,a5,8000669a <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    8000667a:	fec42783          	lw	a5,-20(s0)
    8000667e:	2785                	addiw	a5,a5,1
    80006680:	fef42623          	sw	a5,-20(s0)
    80006684:	00067797          	auipc	a5,0x67
    80006688:	5cc78793          	addi	a5,a5,1484 # 8006dc50 <log>
    8000668c:	57d8                	lw	a4,44(a5)
    8000668e:	fec42783          	lw	a5,-20(s0)
    80006692:	2781                	sext.w	a5,a5
    80006694:	fce7c2e3          	blt	a5,a4,80006658 <log_write+0x7e>
    80006698:	a011                	j	8000669c <log_write+0xc2>
      break;
    8000669a:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000669c:	fd843783          	ld	a5,-40(s0)
    800066a0:	47dc                	lw	a5,12(a5)
    800066a2:	0007871b          	sext.w	a4,a5
    800066a6:	00067697          	auipc	a3,0x67
    800066aa:	5aa68693          	addi	a3,a3,1450 # 8006dc50 <log>
    800066ae:	fec42783          	lw	a5,-20(s0)
    800066b2:	07a1                	addi	a5,a5,8
    800066b4:	078a                	slli	a5,a5,0x2
    800066b6:	97b6                	add	a5,a5,a3
    800066b8:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    800066ba:	00067797          	auipc	a5,0x67
    800066be:	59678793          	addi	a5,a5,1430 # 8006dc50 <log>
    800066c2:	57d8                	lw	a4,44(a5)
    800066c4:	fec42783          	lw	a5,-20(s0)
    800066c8:	2781                	sext.w	a5,a5
    800066ca:	02e79563          	bne	a5,a4,800066f4 <log_write+0x11a>
    bpin(b);
    800066ce:	fd843503          	ld	a0,-40(s0)
    800066d2:	ffffe097          	auipc	ra,0xffffe
    800066d6:	36a080e7          	jalr	874(ra) # 80004a3c <bpin>
    log.lh.n++;
    800066da:	00067797          	auipc	a5,0x67
    800066de:	57678793          	addi	a5,a5,1398 # 8006dc50 <log>
    800066e2:	57dc                	lw	a5,44(a5)
    800066e4:	2785                	addiw	a5,a5,1
    800066e6:	0007871b          	sext.w	a4,a5
    800066ea:	00067797          	auipc	a5,0x67
    800066ee:	56678793          	addi	a5,a5,1382 # 8006dc50 <log>
    800066f2:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800066f4:	00067517          	auipc	a0,0x67
    800066f8:	55c50513          	addi	a0,a0,1372 # 8006dc50 <log>
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	be8080e7          	jalr	-1048(ra) # 800012e4 <release>
}
    80006704:	0001                	nop
    80006706:	70a2                	ld	ra,40(sp)
    80006708:	7402                	ld	s0,32(sp)
    8000670a:	6145                	addi	sp,sp,48
    8000670c:	8082                	ret

000000008000670e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000670e:	1101                	addi	sp,sp,-32
    80006710:	ec06                	sd	ra,24(sp)
    80006712:	e822                	sd	s0,16(sp)
    80006714:	1000                	addi	s0,sp,32
    80006716:	fea43423          	sd	a0,-24(s0)
    8000671a:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000671e:	fe843783          	ld	a5,-24(s0)
    80006722:	07a1                	addi	a5,a5,8
    80006724:	00005597          	auipc	a1,0x5
    80006728:	e4c58593          	addi	a1,a1,-436 # 8000b570 <etext+0x570>
    8000672c:	853e                	mv	a0,a5
    8000672e:	ffffb097          	auipc	ra,0xffffb
    80006732:	b22080e7          	jalr	-1246(ra) # 80001250 <initlock>
  lk->name = name;
    80006736:	fe843783          	ld	a5,-24(s0)
    8000673a:	fe043703          	ld	a4,-32(s0)
    8000673e:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006740:	fe843783          	ld	a5,-24(s0)
    80006744:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006748:	fe843783          	ld	a5,-24(s0)
    8000674c:	0207a423          	sw	zero,40(a5)
}
    80006750:	0001                	nop
    80006752:	60e2                	ld	ra,24(sp)
    80006754:	6442                	ld	s0,16(sp)
    80006756:	6105                	addi	sp,sp,32
    80006758:	8082                	ret

000000008000675a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8000675a:	1101                	addi	sp,sp,-32
    8000675c:	ec06                	sd	ra,24(sp)
    8000675e:	e822                	sd	s0,16(sp)
    80006760:	1000                	addi	s0,sp,32
    80006762:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006766:	fe843783          	ld	a5,-24(s0)
    8000676a:	07a1                	addi	a5,a5,8
    8000676c:	853e                	mv	a0,a5
    8000676e:	ffffb097          	auipc	ra,0xffffb
    80006772:	b12080e7          	jalr	-1262(ra) # 80001280 <acquire>
  while (lk->locked) {
    80006776:	a819                	j	8000678c <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006778:	fe843783          	ld	a5,-24(s0)
    8000677c:	07a1                	addi	a5,a5,8
    8000677e:	85be                	mv	a1,a5
    80006780:	fe843503          	ld	a0,-24(s0)
    80006784:	ffffd097          	auipc	ra,0xffffd
    80006788:	cb6080e7          	jalr	-842(ra) # 8000343a <sleep>
  while (lk->locked) {
    8000678c:	fe843783          	ld	a5,-24(s0)
    80006790:	439c                	lw	a5,0(a5)
    80006792:	f3fd                	bnez	a5,80006778 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006794:	fe843783          	ld	a5,-24(s0)
    80006798:	4705                	li	a4,1
    8000679a:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000679c:	ffffc097          	auipc	ra,0xffffc
    800067a0:	056080e7          	jalr	86(ra) # 800027f2 <myproc>
    800067a4:	87aa                	mv	a5,a0
    800067a6:	5f98                	lw	a4,56(a5)
    800067a8:	fe843783          	ld	a5,-24(s0)
    800067ac:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800067ae:	fe843783          	ld	a5,-24(s0)
    800067b2:	07a1                	addi	a5,a5,8
    800067b4:	853e                	mv	a0,a5
    800067b6:	ffffb097          	auipc	ra,0xffffb
    800067ba:	b2e080e7          	jalr	-1234(ra) # 800012e4 <release>
}
    800067be:	0001                	nop
    800067c0:	60e2                	ld	ra,24(sp)
    800067c2:	6442                	ld	s0,16(sp)
    800067c4:	6105                	addi	sp,sp,32
    800067c6:	8082                	ret

00000000800067c8 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    800067c8:	1101                	addi	sp,sp,-32
    800067ca:	ec06                	sd	ra,24(sp)
    800067cc:	e822                	sd	s0,16(sp)
    800067ce:	1000                	addi	s0,sp,32
    800067d0:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800067d4:	fe843783          	ld	a5,-24(s0)
    800067d8:	07a1                	addi	a5,a5,8
    800067da:	853e                	mv	a0,a5
    800067dc:	ffffb097          	auipc	ra,0xffffb
    800067e0:	aa4080e7          	jalr	-1372(ra) # 80001280 <acquire>
  lk->locked = 0;
    800067e4:	fe843783          	ld	a5,-24(s0)
    800067e8:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800067ec:	fe843783          	ld	a5,-24(s0)
    800067f0:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800067f4:	fe843503          	ld	a0,-24(s0)
    800067f8:	ffffd097          	auipc	ra,0xffffd
    800067fc:	cd6080e7          	jalr	-810(ra) # 800034ce <wakeup>
  release(&lk->lk);
    80006800:	fe843783          	ld	a5,-24(s0)
    80006804:	07a1                	addi	a5,a5,8
    80006806:	853e                	mv	a0,a5
    80006808:	ffffb097          	auipc	ra,0xffffb
    8000680c:	adc080e7          	jalr	-1316(ra) # 800012e4 <release>
}
    80006810:	0001                	nop
    80006812:	60e2                	ld	ra,24(sp)
    80006814:	6442                	ld	s0,16(sp)
    80006816:	6105                	addi	sp,sp,32
    80006818:	8082                	ret

000000008000681a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    8000681a:	7139                	addi	sp,sp,-64
    8000681c:	fc06                	sd	ra,56(sp)
    8000681e:	f822                	sd	s0,48(sp)
    80006820:	f426                	sd	s1,40(sp)
    80006822:	0080                	addi	s0,sp,64
    80006824:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006828:	fc843783          	ld	a5,-56(s0)
    8000682c:	07a1                	addi	a5,a5,8
    8000682e:	853e                	mv	a0,a5
    80006830:	ffffb097          	auipc	ra,0xffffb
    80006834:	a50080e7          	jalr	-1456(ra) # 80001280 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006838:	fc843783          	ld	a5,-56(s0)
    8000683c:	439c                	lw	a5,0(a5)
    8000683e:	cf99                	beqz	a5,8000685c <holdingsleep+0x42>
    80006840:	fc843783          	ld	a5,-56(s0)
    80006844:	5784                	lw	s1,40(a5)
    80006846:	ffffc097          	auipc	ra,0xffffc
    8000684a:	fac080e7          	jalr	-84(ra) # 800027f2 <myproc>
    8000684e:	87aa                	mv	a5,a0
    80006850:	5f9c                	lw	a5,56(a5)
    80006852:	8726                	mv	a4,s1
    80006854:	00f71463          	bne	a4,a5,8000685c <holdingsleep+0x42>
    80006858:	4785                	li	a5,1
    8000685a:	a011                	j	8000685e <holdingsleep+0x44>
    8000685c:	4781                	li	a5,0
    8000685e:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006862:	fc843783          	ld	a5,-56(s0)
    80006866:	07a1                	addi	a5,a5,8
    80006868:	853e                	mv	a0,a5
    8000686a:	ffffb097          	auipc	ra,0xffffb
    8000686e:	a7a080e7          	jalr	-1414(ra) # 800012e4 <release>
  return r;
    80006872:	fdc42783          	lw	a5,-36(s0)
}
    80006876:	853e                	mv	a0,a5
    80006878:	70e2                	ld	ra,56(sp)
    8000687a:	7442                	ld	s0,48(sp)
    8000687c:	74a2                	ld	s1,40(sp)
    8000687e:	6121                	addi	sp,sp,64
    80006880:	8082                	ret

0000000080006882 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006882:	1141                	addi	sp,sp,-16
    80006884:	e406                	sd	ra,8(sp)
    80006886:	e022                	sd	s0,0(sp)
    80006888:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    8000688a:	00005597          	auipc	a1,0x5
    8000688e:	cf658593          	addi	a1,a1,-778 # 8000b580 <etext+0x580>
    80006892:	00067517          	auipc	a0,0x67
    80006896:	50650513          	addi	a0,a0,1286 # 8006dd98 <ftable>
    8000689a:	ffffb097          	auipc	ra,0xffffb
    8000689e:	9b6080e7          	jalr	-1610(ra) # 80001250 <initlock>
}
    800068a2:	0001                	nop
    800068a4:	60a2                	ld	ra,8(sp)
    800068a6:	6402                	ld	s0,0(sp)
    800068a8:	0141                	addi	sp,sp,16
    800068aa:	8082                	ret

00000000800068ac <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800068ac:	1101                	addi	sp,sp,-32
    800068ae:	ec06                	sd	ra,24(sp)
    800068b0:	e822                	sd	s0,16(sp)
    800068b2:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    800068b4:	00067517          	auipc	a0,0x67
    800068b8:	4e450513          	addi	a0,a0,1252 # 8006dd98 <ftable>
    800068bc:	ffffb097          	auipc	ra,0xffffb
    800068c0:	9c4080e7          	jalr	-1596(ra) # 80001280 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800068c4:	00067797          	auipc	a5,0x67
    800068c8:	4ec78793          	addi	a5,a5,1260 # 8006ddb0 <ftable+0x18>
    800068cc:	fef43423          	sd	a5,-24(s0)
    800068d0:	a815                	j	80006904 <filealloc+0x58>
    if(f->ref == 0){
    800068d2:	fe843783          	ld	a5,-24(s0)
    800068d6:	43dc                	lw	a5,4(a5)
    800068d8:	e385                	bnez	a5,800068f8 <filealloc+0x4c>
      f->ref = 1;
    800068da:	fe843783          	ld	a5,-24(s0)
    800068de:	4705                	li	a4,1
    800068e0:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    800068e2:	00067517          	auipc	a0,0x67
    800068e6:	4b650513          	addi	a0,a0,1206 # 8006dd98 <ftable>
    800068ea:	ffffb097          	auipc	ra,0xffffb
    800068ee:	9fa080e7          	jalr	-1542(ra) # 800012e4 <release>
      return f;
    800068f2:	fe843783          	ld	a5,-24(s0)
    800068f6:	a805                	j	80006926 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800068f8:	fe843783          	ld	a5,-24(s0)
    800068fc:	02878793          	addi	a5,a5,40
    80006900:	fef43423          	sd	a5,-24(s0)
    80006904:	00068797          	auipc	a5,0x68
    80006908:	44c78793          	addi	a5,a5,1100 # 8006ed50 <ftable+0xfb8>
    8000690c:	fe843703          	ld	a4,-24(s0)
    80006910:	fcf761e3          	bltu	a4,a5,800068d2 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006914:	00067517          	auipc	a0,0x67
    80006918:	48450513          	addi	a0,a0,1156 # 8006dd98 <ftable>
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	9c8080e7          	jalr	-1592(ra) # 800012e4 <release>
  return 0;
    80006924:	4781                	li	a5,0
}
    80006926:	853e                	mv	a0,a5
    80006928:	60e2                	ld	ra,24(sp)
    8000692a:	6442                	ld	s0,16(sp)
    8000692c:	6105                	addi	sp,sp,32
    8000692e:	8082                	ret

0000000080006930 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006930:	1101                	addi	sp,sp,-32
    80006932:	ec06                	sd	ra,24(sp)
    80006934:	e822                	sd	s0,16(sp)
    80006936:	1000                	addi	s0,sp,32
    80006938:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    8000693c:	00067517          	auipc	a0,0x67
    80006940:	45c50513          	addi	a0,a0,1116 # 8006dd98 <ftable>
    80006944:	ffffb097          	auipc	ra,0xffffb
    80006948:	93c080e7          	jalr	-1732(ra) # 80001280 <acquire>
  if(f->ref < 1)
    8000694c:	fe843783          	ld	a5,-24(s0)
    80006950:	43dc                	lw	a5,4(a5)
    80006952:	00f04a63          	bgtz	a5,80006966 <filedup+0x36>
    panic("filedup");
    80006956:	00005517          	auipc	a0,0x5
    8000695a:	c3250513          	addi	a0,a0,-974 # 8000b588 <etext+0x588>
    8000695e:	ffffa097          	auipc	ra,0xffffa
    80006962:	2f4080e7          	jalr	756(ra) # 80000c52 <panic>
  f->ref++;
    80006966:	fe843783          	ld	a5,-24(s0)
    8000696a:	43dc                	lw	a5,4(a5)
    8000696c:	2785                	addiw	a5,a5,1
    8000696e:	0007871b          	sext.w	a4,a5
    80006972:	fe843783          	ld	a5,-24(s0)
    80006976:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006978:	00067517          	auipc	a0,0x67
    8000697c:	42050513          	addi	a0,a0,1056 # 8006dd98 <ftable>
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	964080e7          	jalr	-1692(ra) # 800012e4 <release>
  return f;
    80006988:	fe843783          	ld	a5,-24(s0)
}
    8000698c:	853e                	mv	a0,a5
    8000698e:	60e2                	ld	ra,24(sp)
    80006990:	6442                	ld	s0,16(sp)
    80006992:	6105                	addi	sp,sp,32
    80006994:	8082                	ret

0000000080006996 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006996:	715d                	addi	sp,sp,-80
    80006998:	e486                	sd	ra,72(sp)
    8000699a:	e0a2                	sd	s0,64(sp)
    8000699c:	0880                	addi	s0,sp,80
    8000699e:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    800069a2:	00067517          	auipc	a0,0x67
    800069a6:	3f650513          	addi	a0,a0,1014 # 8006dd98 <ftable>
    800069aa:	ffffb097          	auipc	ra,0xffffb
    800069ae:	8d6080e7          	jalr	-1834(ra) # 80001280 <acquire>
  if(f->ref < 1)
    800069b2:	fb843783          	ld	a5,-72(s0)
    800069b6:	43dc                	lw	a5,4(a5)
    800069b8:	00f04a63          	bgtz	a5,800069cc <fileclose+0x36>
    panic("fileclose");
    800069bc:	00005517          	auipc	a0,0x5
    800069c0:	bd450513          	addi	a0,a0,-1068 # 8000b590 <etext+0x590>
    800069c4:	ffffa097          	auipc	ra,0xffffa
    800069c8:	28e080e7          	jalr	654(ra) # 80000c52 <panic>
  if(--f->ref > 0){
    800069cc:	fb843783          	ld	a5,-72(s0)
    800069d0:	43dc                	lw	a5,4(a5)
    800069d2:	37fd                	addiw	a5,a5,-1
    800069d4:	0007871b          	sext.w	a4,a5
    800069d8:	fb843783          	ld	a5,-72(s0)
    800069dc:	c3d8                	sw	a4,4(a5)
    800069de:	fb843783          	ld	a5,-72(s0)
    800069e2:	43dc                	lw	a5,4(a5)
    800069e4:	00f05b63          	blez	a5,800069fa <fileclose+0x64>
    release(&ftable.lock);
    800069e8:	00067517          	auipc	a0,0x67
    800069ec:	3b050513          	addi	a0,a0,944 # 8006dd98 <ftable>
    800069f0:	ffffb097          	auipc	ra,0xffffb
    800069f4:	8f4080e7          	jalr	-1804(ra) # 800012e4 <release>
    800069f8:	a879                	j	80006a96 <fileclose+0x100>
    return;
  }
  ff = *f;
    800069fa:	fb843783          	ld	a5,-72(s0)
    800069fe:	638c                	ld	a1,0(a5)
    80006a00:	6790                	ld	a2,8(a5)
    80006a02:	6b94                	ld	a3,16(a5)
    80006a04:	6f98                	ld	a4,24(a5)
    80006a06:	739c                	ld	a5,32(a5)
    80006a08:	fcb43423          	sd	a1,-56(s0)
    80006a0c:	fcc43823          	sd	a2,-48(s0)
    80006a10:	fcd43c23          	sd	a3,-40(s0)
    80006a14:	fee43023          	sd	a4,-32(s0)
    80006a18:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006a1c:	fb843783          	ld	a5,-72(s0)
    80006a20:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006a24:	fb843783          	ld	a5,-72(s0)
    80006a28:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006a2c:	00067517          	auipc	a0,0x67
    80006a30:	36c50513          	addi	a0,a0,876 # 8006dd98 <ftable>
    80006a34:	ffffb097          	auipc	ra,0xffffb
    80006a38:	8b0080e7          	jalr	-1872(ra) # 800012e4 <release>

  if(ff.type == FD_PIPE){
    80006a3c:	fc842783          	lw	a5,-56(s0)
    80006a40:	873e                	mv	a4,a5
    80006a42:	4785                	li	a5,1
    80006a44:	00f71e63          	bne	a4,a5,80006a60 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006a48:	fd843783          	ld	a5,-40(s0)
    80006a4c:	fd144703          	lbu	a4,-47(s0)
    80006a50:	2701                	sext.w	a4,a4
    80006a52:	85ba                	mv	a1,a4
    80006a54:	853e                	mv	a0,a5
    80006a56:	00000097          	auipc	ra,0x0
    80006a5a:	5c4080e7          	jalr	1476(ra) # 8000701a <pipeclose>
    80006a5e:	a825                	j	80006a96 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006a60:	fc842783          	lw	a5,-56(s0)
    80006a64:	873e                	mv	a4,a5
    80006a66:	4789                	li	a5,2
    80006a68:	00f70863          	beq	a4,a5,80006a78 <fileclose+0xe2>
    80006a6c:	fc842783          	lw	a5,-56(s0)
    80006a70:	873e                	mv	a4,a5
    80006a72:	478d                	li	a5,3
    80006a74:	02f71163          	bne	a4,a5,80006a96 <fileclose+0x100>
    begin_op();
    80006a78:	00000097          	auipc	ra,0x0
    80006a7c:	884080e7          	jalr	-1916(ra) # 800062fc <begin_op>
    iput(ff.ip);
    80006a80:	fe043783          	ld	a5,-32(s0)
    80006a84:	853e                	mv	a0,a5
    80006a86:	fffff097          	auipc	ra,0xfffff
    80006a8a:	99c080e7          	jalr	-1636(ra) # 80005422 <iput>
    end_op();
    80006a8e:	00000097          	auipc	ra,0x0
    80006a92:	930080e7          	jalr	-1744(ra) # 800063be <end_op>
  }
}
    80006a96:	60a6                	ld	ra,72(sp)
    80006a98:	6406                	ld	s0,64(sp)
    80006a9a:	6161                	addi	sp,sp,80
    80006a9c:	8082                	ret

0000000080006a9e <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006a9e:	7139                	addi	sp,sp,-64
    80006aa0:	fc06                	sd	ra,56(sp)
    80006aa2:	f822                	sd	s0,48(sp)
    80006aa4:	0080                	addi	s0,sp,64
    80006aa6:	fca43423          	sd	a0,-56(s0)
    80006aaa:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006aae:	ffffc097          	auipc	ra,0xffffc
    80006ab2:	d44080e7          	jalr	-700(ra) # 800027f2 <myproc>
    80006ab6:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006aba:	fc843783          	ld	a5,-56(s0)
    80006abe:	439c                	lw	a5,0(a5)
    80006ac0:	873e                	mv	a4,a5
    80006ac2:	4789                	li	a5,2
    80006ac4:	00f70963          	beq	a4,a5,80006ad6 <filestat+0x38>
    80006ac8:	fc843783          	ld	a5,-56(s0)
    80006acc:	439c                	lw	a5,0(a5)
    80006ace:	873e                	mv	a4,a5
    80006ad0:	478d                	li	a5,3
    80006ad2:	06f71263          	bne	a4,a5,80006b36 <filestat+0x98>
    ilock(f->ip);
    80006ad6:	fc843783          	ld	a5,-56(s0)
    80006ada:	6f9c                	ld	a5,24(a5)
    80006adc:	853e                	mv	a0,a5
    80006ade:	ffffe097          	auipc	ra,0xffffe
    80006ae2:	7b6080e7          	jalr	1974(ra) # 80005294 <ilock>
    stati(f->ip, &st);
    80006ae6:	fc843783          	ld	a5,-56(s0)
    80006aea:	6f9c                	ld	a5,24(a5)
    80006aec:	fd040713          	addi	a4,s0,-48
    80006af0:	85ba                	mv	a1,a4
    80006af2:	853e                	mv	a0,a5
    80006af4:	fffff097          	auipc	ra,0xfffff
    80006af8:	cd2080e7          	jalr	-814(ra) # 800057c6 <stati>
    iunlock(f->ip);
    80006afc:	fc843783          	ld	a5,-56(s0)
    80006b00:	6f9c                	ld	a5,24(a5)
    80006b02:	853e                	mv	a0,a5
    80006b04:	fffff097          	auipc	ra,0xfffff
    80006b08:	8c4080e7          	jalr	-1852(ra) # 800053c8 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006b0c:	fe843783          	ld	a5,-24(s0)
    80006b10:	6bbc                	ld	a5,80(a5)
    80006b12:	fd040713          	addi	a4,s0,-48
    80006b16:	46e1                	li	a3,24
    80006b18:	863a                	mv	a2,a4
    80006b1a:	fc043583          	ld	a1,-64(s0)
    80006b1e:	853e                	mv	a0,a5
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	7b4080e7          	jalr	1972(ra) # 800022d4 <copyout>
    80006b28:	87aa                	mv	a5,a0
    80006b2a:	0007d463          	bgez	a5,80006b32 <filestat+0x94>
      return -1;
    80006b2e:	57fd                	li	a5,-1
    80006b30:	a021                	j	80006b38 <filestat+0x9a>
    return 0;
    80006b32:	4781                	li	a5,0
    80006b34:	a011                	j	80006b38 <filestat+0x9a>
  }
  return -1;
    80006b36:	57fd                	li	a5,-1
}
    80006b38:	853e                	mv	a0,a5
    80006b3a:	70e2                	ld	ra,56(sp)
    80006b3c:	7442                	ld	s0,48(sp)
    80006b3e:	6121                	addi	sp,sp,64
    80006b40:	8082                	ret

0000000080006b42 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006b42:	7139                	addi	sp,sp,-64
    80006b44:	fc06                	sd	ra,56(sp)
    80006b46:	f822                	sd	s0,48(sp)
    80006b48:	0080                	addi	s0,sp,64
    80006b4a:	fca43c23          	sd	a0,-40(s0)
    80006b4e:	fcb43823          	sd	a1,-48(s0)
    80006b52:	87b2                	mv	a5,a2
    80006b54:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006b58:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006b5c:	fd843783          	ld	a5,-40(s0)
    80006b60:	0087c783          	lbu	a5,8(a5)
    80006b64:	e399                	bnez	a5,80006b6a <fileread+0x28>
    return -1;
    80006b66:	57fd                	li	a5,-1
    80006b68:	aa1d                	j	80006c9e <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006b6a:	fd843783          	ld	a5,-40(s0)
    80006b6e:	439c                	lw	a5,0(a5)
    80006b70:	873e                	mv	a4,a5
    80006b72:	4785                	li	a5,1
    80006b74:	02f71363          	bne	a4,a5,80006b9a <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006b78:	fd843783          	ld	a5,-40(s0)
    80006b7c:	6b9c                	ld	a5,16(a5)
    80006b7e:	fcc42703          	lw	a4,-52(s0)
    80006b82:	863a                	mv	a2,a4
    80006b84:	fd043583          	ld	a1,-48(s0)
    80006b88:	853e                	mv	a0,a5
    80006b8a:	00000097          	auipc	ra,0x0
    80006b8e:	680080e7          	jalr	1664(ra) # 8000720a <piperead>
    80006b92:	87aa                	mv	a5,a0
    80006b94:	fef42623          	sw	a5,-20(s0)
    80006b98:	a209                	j	80006c9a <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006b9a:	fd843783          	ld	a5,-40(s0)
    80006b9e:	439c                	lw	a5,0(a5)
    80006ba0:	873e                	mv	a4,a5
    80006ba2:	478d                	li	a5,3
    80006ba4:	06f71863          	bne	a4,a5,80006c14 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006ba8:	fd843783          	ld	a5,-40(s0)
    80006bac:	02479783          	lh	a5,36(a5)
    80006bb0:	2781                	sext.w	a5,a5
    80006bb2:	0207c863          	bltz	a5,80006be2 <fileread+0xa0>
    80006bb6:	fd843783          	ld	a5,-40(s0)
    80006bba:	02479783          	lh	a5,36(a5)
    80006bbe:	0007871b          	sext.w	a4,a5
    80006bc2:	47a5                	li	a5,9
    80006bc4:	00e7cf63          	blt	a5,a4,80006be2 <fileread+0xa0>
    80006bc8:	fd843783          	ld	a5,-40(s0)
    80006bcc:	02479783          	lh	a5,36(a5)
    80006bd0:	2781                	sext.w	a5,a5
    80006bd2:	00067717          	auipc	a4,0x67
    80006bd6:	12670713          	addi	a4,a4,294 # 8006dcf8 <devsw>
    80006bda:	0792                	slli	a5,a5,0x4
    80006bdc:	97ba                	add	a5,a5,a4
    80006bde:	639c                	ld	a5,0(a5)
    80006be0:	e399                	bnez	a5,80006be6 <fileread+0xa4>
      return -1;
    80006be2:	57fd                	li	a5,-1
    80006be4:	a86d                	j	80006c9e <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006be6:	fd843783          	ld	a5,-40(s0)
    80006bea:	02479783          	lh	a5,36(a5)
    80006bee:	2781                	sext.w	a5,a5
    80006bf0:	00067717          	auipc	a4,0x67
    80006bf4:	10870713          	addi	a4,a4,264 # 8006dcf8 <devsw>
    80006bf8:	0792                	slli	a5,a5,0x4
    80006bfa:	97ba                	add	a5,a5,a4
    80006bfc:	6398                	ld	a4,0(a5)
    80006bfe:	fcc42783          	lw	a5,-52(s0)
    80006c02:	863e                	mv	a2,a5
    80006c04:	fd043583          	ld	a1,-48(s0)
    80006c08:	4505                	li	a0,1
    80006c0a:	9702                	jalr	a4
    80006c0c:	87aa                	mv	a5,a0
    80006c0e:	fef42623          	sw	a5,-20(s0)
    80006c12:	a061                	j	80006c9a <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006c14:	fd843783          	ld	a5,-40(s0)
    80006c18:	439c                	lw	a5,0(a5)
    80006c1a:	873e                	mv	a4,a5
    80006c1c:	4789                	li	a5,2
    80006c1e:	06f71663          	bne	a4,a5,80006c8a <fileread+0x148>
    ilock(f->ip);
    80006c22:	fd843783          	ld	a5,-40(s0)
    80006c26:	6f9c                	ld	a5,24(a5)
    80006c28:	853e                	mv	a0,a5
    80006c2a:	ffffe097          	auipc	ra,0xffffe
    80006c2e:	66a080e7          	jalr	1642(ra) # 80005294 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006c32:	fd843783          	ld	a5,-40(s0)
    80006c36:	6f88                	ld	a0,24(a5)
    80006c38:	fd843783          	ld	a5,-40(s0)
    80006c3c:	539c                	lw	a5,32(a5)
    80006c3e:	fcc42703          	lw	a4,-52(s0)
    80006c42:	86be                	mv	a3,a5
    80006c44:	fd043603          	ld	a2,-48(s0)
    80006c48:	4585                	li	a1,1
    80006c4a:	fffff097          	auipc	ra,0xfffff
    80006c4e:	be0080e7          	jalr	-1056(ra) # 8000582a <readi>
    80006c52:	87aa                	mv	a5,a0
    80006c54:	fef42623          	sw	a5,-20(s0)
    80006c58:	fec42783          	lw	a5,-20(s0)
    80006c5c:	2781                	sext.w	a5,a5
    80006c5e:	00f05d63          	blez	a5,80006c78 <fileread+0x136>
      f->off += r;
    80006c62:	fd843783          	ld	a5,-40(s0)
    80006c66:	5398                	lw	a4,32(a5)
    80006c68:	fec42783          	lw	a5,-20(s0)
    80006c6c:	9fb9                	addw	a5,a5,a4
    80006c6e:	0007871b          	sext.w	a4,a5
    80006c72:	fd843783          	ld	a5,-40(s0)
    80006c76:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006c78:	fd843783          	ld	a5,-40(s0)
    80006c7c:	6f9c                	ld	a5,24(a5)
    80006c7e:	853e                	mv	a0,a5
    80006c80:	ffffe097          	auipc	ra,0xffffe
    80006c84:	748080e7          	jalr	1864(ra) # 800053c8 <iunlock>
    80006c88:	a809                	j	80006c9a <fileread+0x158>
  } else {
    panic("fileread");
    80006c8a:	00005517          	auipc	a0,0x5
    80006c8e:	91650513          	addi	a0,a0,-1770 # 8000b5a0 <etext+0x5a0>
    80006c92:	ffffa097          	auipc	ra,0xffffa
    80006c96:	fc0080e7          	jalr	-64(ra) # 80000c52 <panic>
  }

  return r;
    80006c9a:	fec42783          	lw	a5,-20(s0)
}
    80006c9e:	853e                	mv	a0,a5
    80006ca0:	70e2                	ld	ra,56(sp)
    80006ca2:	7442                	ld	s0,48(sp)
    80006ca4:	6121                	addi	sp,sp,64
    80006ca6:	8082                	ret

0000000080006ca8 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006ca8:	715d                	addi	sp,sp,-80
    80006caa:	e486                	sd	ra,72(sp)
    80006cac:	e0a2                	sd	s0,64(sp)
    80006cae:	0880                	addi	s0,sp,80
    80006cb0:	fca43423          	sd	a0,-56(s0)
    80006cb4:	fcb43023          	sd	a1,-64(s0)
    80006cb8:	87b2                	mv	a5,a2
    80006cba:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006cbe:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006cc2:	fc843783          	ld	a5,-56(s0)
    80006cc6:	0097c783          	lbu	a5,9(a5)
    80006cca:	e399                	bnez	a5,80006cd0 <filewrite+0x28>
    return -1;
    80006ccc:	57fd                	li	a5,-1
    80006cce:	a2fd                	j	80006ebc <filewrite+0x214>

  if(f->type == FD_PIPE){
    80006cd0:	fc843783          	ld	a5,-56(s0)
    80006cd4:	439c                	lw	a5,0(a5)
    80006cd6:	873e                	mv	a4,a5
    80006cd8:	4785                	li	a5,1
    80006cda:	02f71363          	bne	a4,a5,80006d00 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006cde:	fc843783          	ld	a5,-56(s0)
    80006ce2:	6b9c                	ld	a5,16(a5)
    80006ce4:	fbc42703          	lw	a4,-68(s0)
    80006ce8:	863a                	mv	a2,a4
    80006cea:	fc043583          	ld	a1,-64(s0)
    80006cee:	853e                	mv	a0,a5
    80006cf0:	00000097          	auipc	ra,0x0
    80006cf4:	3d2080e7          	jalr	978(ra) # 800070c2 <pipewrite>
    80006cf8:	87aa                	mv	a5,a0
    80006cfa:	fef42623          	sw	a5,-20(s0)
    80006cfe:	aa6d                	j	80006eb8 <filewrite+0x210>
  } else if(f->type == FD_DEVICE){
    80006d00:	fc843783          	ld	a5,-56(s0)
    80006d04:	439c                	lw	a5,0(a5)
    80006d06:	873e                	mv	a4,a5
    80006d08:	478d                	li	a5,3
    80006d0a:	06f71863          	bne	a4,a5,80006d7a <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006d0e:	fc843783          	ld	a5,-56(s0)
    80006d12:	02479783          	lh	a5,36(a5)
    80006d16:	2781                	sext.w	a5,a5
    80006d18:	0207c863          	bltz	a5,80006d48 <filewrite+0xa0>
    80006d1c:	fc843783          	ld	a5,-56(s0)
    80006d20:	02479783          	lh	a5,36(a5)
    80006d24:	0007871b          	sext.w	a4,a5
    80006d28:	47a5                	li	a5,9
    80006d2a:	00e7cf63          	blt	a5,a4,80006d48 <filewrite+0xa0>
    80006d2e:	fc843783          	ld	a5,-56(s0)
    80006d32:	02479783          	lh	a5,36(a5)
    80006d36:	2781                	sext.w	a5,a5
    80006d38:	00067717          	auipc	a4,0x67
    80006d3c:	fc070713          	addi	a4,a4,-64 # 8006dcf8 <devsw>
    80006d40:	0792                	slli	a5,a5,0x4
    80006d42:	97ba                	add	a5,a5,a4
    80006d44:	679c                	ld	a5,8(a5)
    80006d46:	e399                	bnez	a5,80006d4c <filewrite+0xa4>
      return -1;
    80006d48:	57fd                	li	a5,-1
    80006d4a:	aa8d                	j	80006ebc <filewrite+0x214>
    ret = devsw[f->major].write(1, addr, n);
    80006d4c:	fc843783          	ld	a5,-56(s0)
    80006d50:	02479783          	lh	a5,36(a5)
    80006d54:	2781                	sext.w	a5,a5
    80006d56:	00067717          	auipc	a4,0x67
    80006d5a:	fa270713          	addi	a4,a4,-94 # 8006dcf8 <devsw>
    80006d5e:	0792                	slli	a5,a5,0x4
    80006d60:	97ba                	add	a5,a5,a4
    80006d62:	6798                	ld	a4,8(a5)
    80006d64:	fbc42783          	lw	a5,-68(s0)
    80006d68:	863e                	mv	a2,a5
    80006d6a:	fc043583          	ld	a1,-64(s0)
    80006d6e:	4505                	li	a0,1
    80006d70:	9702                	jalr	a4
    80006d72:	87aa                	mv	a5,a0
    80006d74:	fef42623          	sw	a5,-20(s0)
    80006d78:	a281                	j	80006eb8 <filewrite+0x210>
  } else if(f->type == FD_INODE){
    80006d7a:	fc843783          	ld	a5,-56(s0)
    80006d7e:	439c                	lw	a5,0(a5)
    80006d80:	873e                	mv	a4,a5
    80006d82:	4789                	li	a5,2
    80006d84:	12f71263          	bne	a4,a5,80006ea8 <filewrite+0x200>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006d88:	6785                	lui	a5,0x1
    80006d8a:	c0078793          	addi	a5,a5,-1024 # c00 <_entry-0x7ffff400>
    80006d8e:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006d92:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006d96:	a0c5                	j	80006e76 <filewrite+0x1ce>
      int n1 = n - i;
    80006d98:	fbc42703          	lw	a4,-68(s0)
    80006d9c:	fe842783          	lw	a5,-24(s0)
    80006da0:	40f707bb          	subw	a5,a4,a5
    80006da4:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006da8:	fe442703          	lw	a4,-28(s0)
    80006dac:	fe042783          	lw	a5,-32(s0)
    80006db0:	2701                	sext.w	a4,a4
    80006db2:	2781                	sext.w	a5,a5
    80006db4:	00e7d663          	bge	a5,a4,80006dc0 <filewrite+0x118>
        n1 = max;
    80006db8:	fe042783          	lw	a5,-32(s0)
    80006dbc:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006dc0:	fffff097          	auipc	ra,0xfffff
    80006dc4:	53c080e7          	jalr	1340(ra) # 800062fc <begin_op>
      ilock(f->ip);
    80006dc8:	fc843783          	ld	a5,-56(s0)
    80006dcc:	6f9c                	ld	a5,24(a5)
    80006dce:	853e                	mv	a0,a5
    80006dd0:	ffffe097          	auipc	ra,0xffffe
    80006dd4:	4c4080e7          	jalr	1220(ra) # 80005294 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006dd8:	fc843783          	ld	a5,-56(s0)
    80006ddc:	6f88                	ld	a0,24(a5)
    80006dde:	fe842703          	lw	a4,-24(s0)
    80006de2:	fc043783          	ld	a5,-64(s0)
    80006de6:	00f70633          	add	a2,a4,a5
    80006dea:	fc843783          	ld	a5,-56(s0)
    80006dee:	539c                	lw	a5,32(a5)
    80006df0:	fe442703          	lw	a4,-28(s0)
    80006df4:	86be                	mv	a3,a5
    80006df6:	4585                	li	a1,1
    80006df8:	fffff097          	auipc	ra,0xfffff
    80006dfc:	bbc080e7          	jalr	-1092(ra) # 800059b4 <writei>
    80006e00:	87aa                	mv	a5,a0
    80006e02:	fcf42e23          	sw	a5,-36(s0)
    80006e06:	fdc42783          	lw	a5,-36(s0)
    80006e0a:	2781                	sext.w	a5,a5
    80006e0c:	00f05d63          	blez	a5,80006e26 <filewrite+0x17e>
        f->off += r;
    80006e10:	fc843783          	ld	a5,-56(s0)
    80006e14:	5398                	lw	a4,32(a5)
    80006e16:	fdc42783          	lw	a5,-36(s0)
    80006e1a:	9fb9                	addw	a5,a5,a4
    80006e1c:	0007871b          	sext.w	a4,a5
    80006e20:	fc843783          	ld	a5,-56(s0)
    80006e24:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006e26:	fc843783          	ld	a5,-56(s0)
    80006e2a:	6f9c                	ld	a5,24(a5)
    80006e2c:	853e                	mv	a0,a5
    80006e2e:	ffffe097          	auipc	ra,0xffffe
    80006e32:	59a080e7          	jalr	1434(ra) # 800053c8 <iunlock>
      end_op();
    80006e36:	fffff097          	auipc	ra,0xfffff
    80006e3a:	588080e7          	jalr	1416(ra) # 800063be <end_op>

      if(r < 0)
    80006e3e:	fdc42783          	lw	a5,-36(s0)
    80006e42:	2781                	sext.w	a5,a5
    80006e44:	0407c263          	bltz	a5,80006e88 <filewrite+0x1e0>
        break;
      if(r != n1)
    80006e48:	fdc42703          	lw	a4,-36(s0)
    80006e4c:	fe442783          	lw	a5,-28(s0)
    80006e50:	2701                	sext.w	a4,a4
    80006e52:	2781                	sext.w	a5,a5
    80006e54:	00f70a63          	beq	a4,a5,80006e68 <filewrite+0x1c0>
        panic("short filewrite");
    80006e58:	00004517          	auipc	a0,0x4
    80006e5c:	75850513          	addi	a0,a0,1880 # 8000b5b0 <etext+0x5b0>
    80006e60:	ffffa097          	auipc	ra,0xffffa
    80006e64:	df2080e7          	jalr	-526(ra) # 80000c52 <panic>
      i += r;
    80006e68:	fe842703          	lw	a4,-24(s0)
    80006e6c:	fdc42783          	lw	a5,-36(s0)
    80006e70:	9fb9                	addw	a5,a5,a4
    80006e72:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006e76:	fe842703          	lw	a4,-24(s0)
    80006e7a:	fbc42783          	lw	a5,-68(s0)
    80006e7e:	2701                	sext.w	a4,a4
    80006e80:	2781                	sext.w	a5,a5
    80006e82:	f0f74be3          	blt	a4,a5,80006d98 <filewrite+0xf0>
    80006e86:	a011                	j	80006e8a <filewrite+0x1e2>
        break;
    80006e88:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006e8a:	fe842703          	lw	a4,-24(s0)
    80006e8e:	fbc42783          	lw	a5,-68(s0)
    80006e92:	2701                	sext.w	a4,a4
    80006e94:	2781                	sext.w	a5,a5
    80006e96:	00f71563          	bne	a4,a5,80006ea0 <filewrite+0x1f8>
    80006e9a:	fbc42783          	lw	a5,-68(s0)
    80006e9e:	a011                	j	80006ea2 <filewrite+0x1fa>
    80006ea0:	57fd                	li	a5,-1
    80006ea2:	fef42623          	sw	a5,-20(s0)
    80006ea6:	a809                	j	80006eb8 <filewrite+0x210>
  } else {
    panic("filewrite");
    80006ea8:	00004517          	auipc	a0,0x4
    80006eac:	71850513          	addi	a0,a0,1816 # 8000b5c0 <etext+0x5c0>
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	da2080e7          	jalr	-606(ra) # 80000c52 <panic>
  }

  return ret;
    80006eb8:	fec42783          	lw	a5,-20(s0)
}
    80006ebc:	853e                	mv	a0,a5
    80006ebe:	60a6                	ld	ra,72(sp)
    80006ec0:	6406                	ld	s0,64(sp)
    80006ec2:	6161                	addi	sp,sp,80
    80006ec4:	8082                	ret

0000000080006ec6 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006ec6:	7179                	addi	sp,sp,-48
    80006ec8:	f406                	sd	ra,40(sp)
    80006eca:	f022                	sd	s0,32(sp)
    80006ecc:	1800                	addi	s0,sp,48
    80006ece:	fca43c23          	sd	a0,-40(s0)
    80006ed2:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006ed6:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006eda:	fd043783          	ld	a5,-48(s0)
    80006ede:	0007b023          	sd	zero,0(a5)
    80006ee2:	fd043783          	ld	a5,-48(s0)
    80006ee6:	6398                	ld	a4,0(a5)
    80006ee8:	fd843783          	ld	a5,-40(s0)
    80006eec:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006eee:	00000097          	auipc	ra,0x0
    80006ef2:	9be080e7          	jalr	-1602(ra) # 800068ac <filealloc>
    80006ef6:	872a                	mv	a4,a0
    80006ef8:	fd843783          	ld	a5,-40(s0)
    80006efc:	e398                	sd	a4,0(a5)
    80006efe:	fd843783          	ld	a5,-40(s0)
    80006f02:	639c                	ld	a5,0(a5)
    80006f04:	c3e9                	beqz	a5,80006fc6 <pipealloc+0x100>
    80006f06:	00000097          	auipc	ra,0x0
    80006f0a:	9a6080e7          	jalr	-1626(ra) # 800068ac <filealloc>
    80006f0e:	872a                	mv	a4,a0
    80006f10:	fd043783          	ld	a5,-48(s0)
    80006f14:	e398                	sd	a4,0(a5)
    80006f16:	fd043783          	ld	a5,-48(s0)
    80006f1a:	639c                	ld	a5,0(a5)
    80006f1c:	c7cd                	beqz	a5,80006fc6 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006f1e:	ffffa097          	auipc	ra,0xffffa
    80006f22:	20e080e7          	jalr	526(ra) # 8000112c <kalloc>
    80006f26:	fea43423          	sd	a0,-24(s0)
    80006f2a:	fe843783          	ld	a5,-24(s0)
    80006f2e:	cfd1                	beqz	a5,80006fca <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006f30:	fe843783          	ld	a5,-24(s0)
    80006f34:	4705                	li	a4,1
    80006f36:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006f3a:	fe843783          	ld	a5,-24(s0)
    80006f3e:	4705                	li	a4,1
    80006f40:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006f44:	fe843783          	ld	a5,-24(s0)
    80006f48:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006f4c:	fe843783          	ld	a5,-24(s0)
    80006f50:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006f54:	fe843783          	ld	a5,-24(s0)
    80006f58:	00004597          	auipc	a1,0x4
    80006f5c:	67858593          	addi	a1,a1,1656 # 8000b5d0 <etext+0x5d0>
    80006f60:	853e                	mv	a0,a5
    80006f62:	ffffa097          	auipc	ra,0xffffa
    80006f66:	2ee080e7          	jalr	750(ra) # 80001250 <initlock>
  (*f0)->type = FD_PIPE;
    80006f6a:	fd843783          	ld	a5,-40(s0)
    80006f6e:	639c                	ld	a5,0(a5)
    80006f70:	4705                	li	a4,1
    80006f72:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006f74:	fd843783          	ld	a5,-40(s0)
    80006f78:	639c                	ld	a5,0(a5)
    80006f7a:	4705                	li	a4,1
    80006f7c:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006f80:	fd843783          	ld	a5,-40(s0)
    80006f84:	639c                	ld	a5,0(a5)
    80006f86:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006f8a:	fd843783          	ld	a5,-40(s0)
    80006f8e:	639c                	ld	a5,0(a5)
    80006f90:	fe843703          	ld	a4,-24(s0)
    80006f94:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006f96:	fd043783          	ld	a5,-48(s0)
    80006f9a:	639c                	ld	a5,0(a5)
    80006f9c:	4705                	li	a4,1
    80006f9e:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006fa0:	fd043783          	ld	a5,-48(s0)
    80006fa4:	639c                	ld	a5,0(a5)
    80006fa6:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006faa:	fd043783          	ld	a5,-48(s0)
    80006fae:	639c                	ld	a5,0(a5)
    80006fb0:	4705                	li	a4,1
    80006fb2:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006fb6:	fd043783          	ld	a5,-48(s0)
    80006fba:	639c                	ld	a5,0(a5)
    80006fbc:	fe843703          	ld	a4,-24(s0)
    80006fc0:	eb98                	sd	a4,16(a5)
  return 0;
    80006fc2:	4781                	li	a5,0
    80006fc4:	a0b1                	j	80007010 <pipealloc+0x14a>
    goto bad;
    80006fc6:	0001                	nop
    80006fc8:	a011                	j	80006fcc <pipealloc+0x106>
    goto bad;
    80006fca:	0001                	nop

 bad:
  if(pi)
    80006fcc:	fe843783          	ld	a5,-24(s0)
    80006fd0:	c799                	beqz	a5,80006fde <pipealloc+0x118>
    kfree((char*)pi);
    80006fd2:	fe843503          	ld	a0,-24(s0)
    80006fd6:	ffffa097          	auipc	ra,0xffffa
    80006fda:	0b2080e7          	jalr	178(ra) # 80001088 <kfree>
  if(*f0)
    80006fde:	fd843783          	ld	a5,-40(s0)
    80006fe2:	639c                	ld	a5,0(a5)
    80006fe4:	cb89                	beqz	a5,80006ff6 <pipealloc+0x130>
    fileclose(*f0);
    80006fe6:	fd843783          	ld	a5,-40(s0)
    80006fea:	639c                	ld	a5,0(a5)
    80006fec:	853e                	mv	a0,a5
    80006fee:	00000097          	auipc	ra,0x0
    80006ff2:	9a8080e7          	jalr	-1624(ra) # 80006996 <fileclose>
  if(*f1)
    80006ff6:	fd043783          	ld	a5,-48(s0)
    80006ffa:	639c                	ld	a5,0(a5)
    80006ffc:	cb89                	beqz	a5,8000700e <pipealloc+0x148>
    fileclose(*f1);
    80006ffe:	fd043783          	ld	a5,-48(s0)
    80007002:	639c                	ld	a5,0(a5)
    80007004:	853e                	mv	a0,a5
    80007006:	00000097          	auipc	ra,0x0
    8000700a:	990080e7          	jalr	-1648(ra) # 80006996 <fileclose>
  return -1;
    8000700e:	57fd                	li	a5,-1
}
    80007010:	853e                	mv	a0,a5
    80007012:	70a2                	ld	ra,40(sp)
    80007014:	7402                	ld	s0,32(sp)
    80007016:	6145                	addi	sp,sp,48
    80007018:	8082                	ret

000000008000701a <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    8000701a:	1101                	addi	sp,sp,-32
    8000701c:	ec06                	sd	ra,24(sp)
    8000701e:	e822                	sd	s0,16(sp)
    80007020:	1000                	addi	s0,sp,32
    80007022:	fea43423          	sd	a0,-24(s0)
    80007026:	87ae                	mv	a5,a1
    80007028:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    8000702c:	fe843783          	ld	a5,-24(s0)
    80007030:	853e                	mv	a0,a5
    80007032:	ffffa097          	auipc	ra,0xffffa
    80007036:	24e080e7          	jalr	590(ra) # 80001280 <acquire>
  if(writable){
    8000703a:	fe442783          	lw	a5,-28(s0)
    8000703e:	2781                	sext.w	a5,a5
    80007040:	cf99                	beqz	a5,8000705e <pipeclose+0x44>
    pi->writeopen = 0;
    80007042:	fe843783          	ld	a5,-24(s0)
    80007046:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    8000704a:	fe843783          	ld	a5,-24(s0)
    8000704e:	21878793          	addi	a5,a5,536
    80007052:	853e                	mv	a0,a5
    80007054:	ffffc097          	auipc	ra,0xffffc
    80007058:	47a080e7          	jalr	1146(ra) # 800034ce <wakeup>
    8000705c:	a831                	j	80007078 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    8000705e:	fe843783          	ld	a5,-24(s0)
    80007062:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80007066:	fe843783          	ld	a5,-24(s0)
    8000706a:	21c78793          	addi	a5,a5,540
    8000706e:	853e                	mv	a0,a5
    80007070:	ffffc097          	auipc	ra,0xffffc
    80007074:	45e080e7          	jalr	1118(ra) # 800034ce <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007078:	fe843783          	ld	a5,-24(s0)
    8000707c:	2207a783          	lw	a5,544(a5)
    80007080:	e785                	bnez	a5,800070a8 <pipeclose+0x8e>
    80007082:	fe843783          	ld	a5,-24(s0)
    80007086:	2247a783          	lw	a5,548(a5)
    8000708a:	ef99                	bnez	a5,800070a8 <pipeclose+0x8e>
    release(&pi->lock);
    8000708c:	fe843783          	ld	a5,-24(s0)
    80007090:	853e                	mv	a0,a5
    80007092:	ffffa097          	auipc	ra,0xffffa
    80007096:	252080e7          	jalr	594(ra) # 800012e4 <release>
    kfree((char*)pi);
    8000709a:	fe843503          	ld	a0,-24(s0)
    8000709e:	ffffa097          	auipc	ra,0xffffa
    800070a2:	fea080e7          	jalr	-22(ra) # 80001088 <kfree>
    800070a6:	a809                	j	800070b8 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800070a8:	fe843783          	ld	a5,-24(s0)
    800070ac:	853e                	mv	a0,a5
    800070ae:	ffffa097          	auipc	ra,0xffffa
    800070b2:	236080e7          	jalr	566(ra) # 800012e4 <release>
}
    800070b6:	0001                	nop
    800070b8:	0001                	nop
    800070ba:	60e2                	ld	ra,24(sp)
    800070bc:	6442                	ld	s0,16(sp)
    800070be:	6105                	addi	sp,sp,32
    800070c0:	8082                	ret

00000000800070c2 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    800070c2:	715d                	addi	sp,sp,-80
    800070c4:	e486                	sd	ra,72(sp)
    800070c6:	e0a2                	sd	s0,64(sp)
    800070c8:	0880                	addi	s0,sp,80
    800070ca:	fca43423          	sd	a0,-56(s0)
    800070ce:	fcb43023          	sd	a1,-64(s0)
    800070d2:	87b2                	mv	a5,a2
    800070d4:	faf42e23          	sw	a5,-68(s0)
  int i;
  char ch;
  struct proc *pr = myproc();
    800070d8:	ffffb097          	auipc	ra,0xffffb
    800070dc:	71a080e7          	jalr	1818(ra) # 800027f2 <myproc>
    800070e0:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    800070e4:	fc843783          	ld	a5,-56(s0)
    800070e8:	853e                	mv	a0,a5
    800070ea:	ffffa097          	auipc	ra,0xffffa
    800070ee:	196080e7          	jalr	406(ra) # 80001280 <acquire>
  for(i = 0; i < n; i++){
    800070f2:	fe042623          	sw	zero,-20(s0)
    800070f6:	a8c9                	j	800071c8 <pipewrite+0x106>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
    800070f8:	fc843783          	ld	a5,-56(s0)
    800070fc:	2207a783          	lw	a5,544(a5)
    80007100:	c789                	beqz	a5,8000710a <pipewrite+0x48>
    80007102:	fe043783          	ld	a5,-32(s0)
    80007106:	5b9c                	lw	a5,48(a5)
    80007108:	cb91                	beqz	a5,8000711c <pipewrite+0x5a>
        release(&pi->lock);
    8000710a:	fc843783          	ld	a5,-56(s0)
    8000710e:	853e                	mv	a0,a5
    80007110:	ffffa097          	auipc	ra,0xffffa
    80007114:	1d4080e7          	jalr	468(ra) # 800012e4 <release>
        return -1;
    80007118:	57fd                	li	a5,-1
    8000711a:	a0dd                	j	80007200 <pipewrite+0x13e>
      }
      wakeup(&pi->nread);
    8000711c:	fc843783          	ld	a5,-56(s0)
    80007120:	21878793          	addi	a5,a5,536
    80007124:	853e                	mv	a0,a5
    80007126:	ffffc097          	auipc	ra,0xffffc
    8000712a:	3a8080e7          	jalr	936(ra) # 800034ce <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8000712e:	fc843783          	ld	a5,-56(s0)
    80007132:	21c78793          	addi	a5,a5,540
    80007136:	fc843703          	ld	a4,-56(s0)
    8000713a:	85ba                	mv	a1,a4
    8000713c:	853e                	mv	a0,a5
    8000713e:	ffffc097          	auipc	ra,0xffffc
    80007142:	2fc080e7          	jalr	764(ra) # 8000343a <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80007146:	fc843783          	ld	a5,-56(s0)
    8000714a:	21c7a703          	lw	a4,540(a5)
    8000714e:	fc843783          	ld	a5,-56(s0)
    80007152:	2187a783          	lw	a5,536(a5)
    80007156:	2007879b          	addiw	a5,a5,512
    8000715a:	2781                	sext.w	a5,a5
    8000715c:	f8f70ee3          	beq	a4,a5,800070f8 <pipewrite+0x36>
    }
    if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007160:	fe043783          	ld	a5,-32(s0)
    80007164:	6ba8                	ld	a0,80(a5)
    80007166:	fec42703          	lw	a4,-20(s0)
    8000716a:	fc043783          	ld	a5,-64(s0)
    8000716e:	973e                	add	a4,a4,a5
    80007170:	fdf40793          	addi	a5,s0,-33
    80007174:	4685                	li	a3,1
    80007176:	863a                	mv	a2,a4
    80007178:	85be                	mv	a1,a5
    8000717a:	ffffb097          	auipc	ra,0xffffb
    8000717e:	228080e7          	jalr	552(ra) # 800023a2 <copyin>
    80007182:	87aa                	mv	a5,a0
    80007184:	873e                	mv	a4,a5
    80007186:	57fd                	li	a5,-1
    80007188:	04f70963          	beq	a4,a5,800071da <pipewrite+0x118>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000718c:	fc843783          	ld	a5,-56(s0)
    80007190:	21c7a783          	lw	a5,540(a5)
    80007194:	2781                	sext.w	a5,a5
    80007196:	0017871b          	addiw	a4,a5,1
    8000719a:	0007069b          	sext.w	a3,a4
    8000719e:	fc843703          	ld	a4,-56(s0)
    800071a2:	20d72e23          	sw	a3,540(a4)
    800071a6:	1ff7f793          	andi	a5,a5,511
    800071aa:	2781                	sext.w	a5,a5
    800071ac:	fdf44703          	lbu	a4,-33(s0)
    800071b0:	fc843683          	ld	a3,-56(s0)
    800071b4:	1782                	slli	a5,a5,0x20
    800071b6:	9381                	srli	a5,a5,0x20
    800071b8:	97b6                	add	a5,a5,a3
    800071ba:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    800071be:	fec42783          	lw	a5,-20(s0)
    800071c2:	2785                	addiw	a5,a5,1
    800071c4:	fef42623          	sw	a5,-20(s0)
    800071c8:	fec42703          	lw	a4,-20(s0)
    800071cc:	fbc42783          	lw	a5,-68(s0)
    800071d0:	2701                	sext.w	a4,a4
    800071d2:	2781                	sext.w	a5,a5
    800071d4:	f6f749e3          	blt	a4,a5,80007146 <pipewrite+0x84>
    800071d8:	a011                	j	800071dc <pipewrite+0x11a>
      break;
    800071da:	0001                	nop
  }
  wakeup(&pi->nread);
    800071dc:	fc843783          	ld	a5,-56(s0)
    800071e0:	21878793          	addi	a5,a5,536
    800071e4:	853e                	mv	a0,a5
    800071e6:	ffffc097          	auipc	ra,0xffffc
    800071ea:	2e8080e7          	jalr	744(ra) # 800034ce <wakeup>
  release(&pi->lock);
    800071ee:	fc843783          	ld	a5,-56(s0)
    800071f2:	853e                	mv	a0,a5
    800071f4:	ffffa097          	auipc	ra,0xffffa
    800071f8:	0f0080e7          	jalr	240(ra) # 800012e4 <release>
  return i;
    800071fc:	fec42783          	lw	a5,-20(s0)
}
    80007200:	853e                	mv	a0,a5
    80007202:	60a6                	ld	ra,72(sp)
    80007204:	6406                	ld	s0,64(sp)
    80007206:	6161                	addi	sp,sp,80
    80007208:	8082                	ret

000000008000720a <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8000720a:	715d                	addi	sp,sp,-80
    8000720c:	e486                	sd	ra,72(sp)
    8000720e:	e0a2                	sd	s0,64(sp)
    80007210:	0880                	addi	s0,sp,80
    80007212:	fca43423          	sd	a0,-56(s0)
    80007216:	fcb43023          	sd	a1,-64(s0)
    8000721a:	87b2                	mv	a5,a2
    8000721c:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007220:	ffffb097          	auipc	ra,0xffffb
    80007224:	5d2080e7          	jalr	1490(ra) # 800027f2 <myproc>
    80007228:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    8000722c:	fc843783          	ld	a5,-56(s0)
    80007230:	853e                	mv	a0,a5
    80007232:	ffffa097          	auipc	ra,0xffffa
    80007236:	04e080e7          	jalr	78(ra) # 80001280 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000723a:	a815                	j	8000726e <piperead+0x64>
    if(pr->killed){
    8000723c:	fe043783          	ld	a5,-32(s0)
    80007240:	5b9c                	lw	a5,48(a5)
    80007242:	cb91                	beqz	a5,80007256 <piperead+0x4c>
      release(&pi->lock);
    80007244:	fc843783          	ld	a5,-56(s0)
    80007248:	853e                	mv	a0,a5
    8000724a:	ffffa097          	auipc	ra,0xffffa
    8000724e:	09a080e7          	jalr	154(ra) # 800012e4 <release>
      return -1;
    80007252:	57fd                	li	a5,-1
    80007254:	a8dd                	j	8000734a <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80007256:	fc843783          	ld	a5,-56(s0)
    8000725a:	21878793          	addi	a5,a5,536
    8000725e:	fc843703          	ld	a4,-56(s0)
    80007262:	85ba                	mv	a1,a4
    80007264:	853e                	mv	a0,a5
    80007266:	ffffc097          	auipc	ra,0xffffc
    8000726a:	1d4080e7          	jalr	468(ra) # 8000343a <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000726e:	fc843783          	ld	a5,-56(s0)
    80007272:	2187a703          	lw	a4,536(a5)
    80007276:	fc843783          	ld	a5,-56(s0)
    8000727a:	21c7a783          	lw	a5,540(a5)
    8000727e:	00f71763          	bne	a4,a5,8000728c <piperead+0x82>
    80007282:	fc843783          	ld	a5,-56(s0)
    80007286:	2247a783          	lw	a5,548(a5)
    8000728a:	fbcd                	bnez	a5,8000723c <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000728c:	fe042623          	sw	zero,-20(s0)
    80007290:	a8bd                	j	8000730e <piperead+0x104>
    if(pi->nread == pi->nwrite)
    80007292:	fc843783          	ld	a5,-56(s0)
    80007296:	2187a703          	lw	a4,536(a5)
    8000729a:	fc843783          	ld	a5,-56(s0)
    8000729e:	21c7a783          	lw	a5,540(a5)
    800072a2:	06f70f63          	beq	a4,a5,80007320 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800072a6:	fc843783          	ld	a5,-56(s0)
    800072aa:	2187a783          	lw	a5,536(a5)
    800072ae:	2781                	sext.w	a5,a5
    800072b0:	0017871b          	addiw	a4,a5,1
    800072b4:	0007069b          	sext.w	a3,a4
    800072b8:	fc843703          	ld	a4,-56(s0)
    800072bc:	20d72c23          	sw	a3,536(a4)
    800072c0:	1ff7f793          	andi	a5,a5,511
    800072c4:	2781                	sext.w	a5,a5
    800072c6:	fc843703          	ld	a4,-56(s0)
    800072ca:	1782                	slli	a5,a5,0x20
    800072cc:	9381                	srli	a5,a5,0x20
    800072ce:	97ba                	add	a5,a5,a4
    800072d0:	0187c783          	lbu	a5,24(a5)
    800072d4:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    800072d8:	fe043783          	ld	a5,-32(s0)
    800072dc:	6ba8                	ld	a0,80(a5)
    800072de:	fec42703          	lw	a4,-20(s0)
    800072e2:	fc043783          	ld	a5,-64(s0)
    800072e6:	97ba                	add	a5,a5,a4
    800072e8:	fdf40713          	addi	a4,s0,-33
    800072ec:	4685                	li	a3,1
    800072ee:	863a                	mv	a2,a4
    800072f0:	85be                	mv	a1,a5
    800072f2:	ffffb097          	auipc	ra,0xffffb
    800072f6:	fe2080e7          	jalr	-30(ra) # 800022d4 <copyout>
    800072fa:	87aa                	mv	a5,a0
    800072fc:	873e                	mv	a4,a5
    800072fe:	57fd                	li	a5,-1
    80007300:	02f70263          	beq	a4,a5,80007324 <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007304:	fec42783          	lw	a5,-20(s0)
    80007308:	2785                	addiw	a5,a5,1
    8000730a:	fef42623          	sw	a5,-20(s0)
    8000730e:	fec42703          	lw	a4,-20(s0)
    80007312:	fbc42783          	lw	a5,-68(s0)
    80007316:	2701                	sext.w	a4,a4
    80007318:	2781                	sext.w	a5,a5
    8000731a:	f6f74ce3          	blt	a4,a5,80007292 <piperead+0x88>
    8000731e:	a021                	j	80007326 <piperead+0x11c>
      break;
    80007320:	0001                	nop
    80007322:	a011                	j	80007326 <piperead+0x11c>
      break;
    80007324:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80007326:	fc843783          	ld	a5,-56(s0)
    8000732a:	21c78793          	addi	a5,a5,540
    8000732e:	853e                	mv	a0,a5
    80007330:	ffffc097          	auipc	ra,0xffffc
    80007334:	19e080e7          	jalr	414(ra) # 800034ce <wakeup>
  release(&pi->lock);
    80007338:	fc843783          	ld	a5,-56(s0)
    8000733c:	853e                	mv	a0,a5
    8000733e:	ffffa097          	auipc	ra,0xffffa
    80007342:	fa6080e7          	jalr	-90(ra) # 800012e4 <release>
  return i;
    80007346:	fec42783          	lw	a5,-20(s0)
}
    8000734a:	853e                	mv	a0,a5
    8000734c:	60a6                	ld	ra,72(sp)
    8000734e:	6406                	ld	s0,64(sp)
    80007350:	6161                	addi	sp,sp,80
    80007352:	8082                	ret

0000000080007354 <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    80007354:	de010113          	addi	sp,sp,-544
    80007358:	20113c23          	sd	ra,536(sp)
    8000735c:	20813823          	sd	s0,528(sp)
    80007360:	20913423          	sd	s1,520(sp)
    80007364:	1400                	addi	s0,sp,544
    80007366:	dea43423          	sd	a0,-536(s0)
    8000736a:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8000736e:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007372:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007376:	ffffb097          	auipc	ra,0xffffb
    8000737a:	47c080e7          	jalr	1148(ra) # 800027f2 <myproc>
    8000737e:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007382:	fffff097          	auipc	ra,0xfffff
    80007386:	f7a080e7          	jalr	-134(ra) # 800062fc <begin_op>

  if((ip = namei(path)) == 0){
    8000738a:	de843503          	ld	a0,-536(s0)
    8000738e:	fffff097          	auipc	ra,0xfffff
    80007392:	c0a080e7          	jalr	-1014(ra) # 80005f98 <namei>
    80007396:	faa43423          	sd	a0,-88(s0)
    8000739a:	fa843783          	ld	a5,-88(s0)
    8000739e:	e799                	bnez	a5,800073ac <exec+0x58>
    end_op();
    800073a0:	fffff097          	auipc	ra,0xfffff
    800073a4:	01e080e7          	jalr	30(ra) # 800063be <end_op>
    return -1;
    800073a8:	57fd                	li	a5,-1
    800073aa:	a90d                	j	800077dc <exec+0x488>
  }
  ilock(ip);
    800073ac:	fa843503          	ld	a0,-88(s0)
    800073b0:	ffffe097          	auipc	ra,0xffffe
    800073b4:	ee4080e7          	jalr	-284(ra) # 80005294 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800073b8:	e2840793          	addi	a5,s0,-472
    800073bc:	04000713          	li	a4,64
    800073c0:	4681                	li	a3,0
    800073c2:	863e                	mv	a2,a5
    800073c4:	4581                	li	a1,0
    800073c6:	fa843503          	ld	a0,-88(s0)
    800073ca:	ffffe097          	auipc	ra,0xffffe
    800073ce:	460080e7          	jalr	1120(ra) # 8000582a <readi>
    800073d2:	87aa                	mv	a5,a0
    800073d4:	873e                	mv	a4,a5
    800073d6:	04000793          	li	a5,64
    800073da:	38f71b63          	bne	a4,a5,80007770 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    800073de:	e2842783          	lw	a5,-472(s0)
    800073e2:	873e                	mv	a4,a5
    800073e4:	464c47b7          	lui	a5,0x464c4
    800073e8:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800073ec:	38f71463          	bne	a4,a5,80007774 <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800073f0:	f9843503          	ld	a0,-104(s0)
    800073f4:	ffffb097          	auipc	ra,0xffffb
    800073f8:	6b4080e7          	jalr	1716(ra) # 80002aa8 <proc_pagetable>
    800073fc:	faa43023          	sd	a0,-96(s0)
    80007400:	fa043783          	ld	a5,-96(s0)
    80007404:	36078a63          	beqz	a5,80007778 <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007408:	fc042623          	sw	zero,-52(s0)
    8000740c:	e4843783          	ld	a5,-440(s0)
    80007410:	fcf42423          	sw	a5,-56(s0)
    80007414:	a8e1                	j	800074ec <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007416:	df040793          	addi	a5,s0,-528
    8000741a:	fc842683          	lw	a3,-56(s0)
    8000741e:	03800713          	li	a4,56
    80007422:	863e                	mv	a2,a5
    80007424:	4581                	li	a1,0
    80007426:	fa843503          	ld	a0,-88(s0)
    8000742a:	ffffe097          	auipc	ra,0xffffe
    8000742e:	400080e7          	jalr	1024(ra) # 8000582a <readi>
    80007432:	87aa                	mv	a5,a0
    80007434:	873e                	mv	a4,a5
    80007436:	03800793          	li	a5,56
    8000743a:	34f71163          	bne	a4,a5,8000777c <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000743e:	df042783          	lw	a5,-528(s0)
    80007442:	873e                	mv	a4,a5
    80007444:	4785                	li	a5,1
    80007446:	08f71663          	bne	a4,a5,800074d2 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    8000744a:	e1843703          	ld	a4,-488(s0)
    8000744e:	e1043783          	ld	a5,-496(s0)
    80007452:	32f76763          	bltu	a4,a5,80007780 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007456:	e0043703          	ld	a4,-512(s0)
    8000745a:	e1843783          	ld	a5,-488(s0)
    8000745e:	973e                	add	a4,a4,a5
    80007460:	e0043783          	ld	a5,-512(s0)
    80007464:	32f76063          	bltu	a4,a5,80007784 <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80007468:	e0043703          	ld	a4,-512(s0)
    8000746c:	e1843783          	ld	a5,-488(s0)
    80007470:	97ba                	add	a5,a5,a4
    80007472:	863e                	mv	a2,a5
    80007474:	fb843583          	ld	a1,-72(s0)
    80007478:	fa043503          	ld	a0,-96(s0)
    8000747c:	ffffb097          	auipc	ra,0xffffb
    80007480:	a7a080e7          	jalr	-1414(ra) # 80001ef6 <uvmalloc>
    80007484:	f6a43823          	sd	a0,-144(s0)
    80007488:	f7043783          	ld	a5,-144(s0)
    8000748c:	2e078e63          	beqz	a5,80007788 <exec+0x434>
      goto bad;
    sz = sz1;
    80007490:	f7043783          	ld	a5,-144(s0)
    80007494:	faf43c23          	sd	a5,-72(s0)
    if(ph.vaddr % PGSIZE != 0)
    80007498:	e0043703          	ld	a4,-512(s0)
    8000749c:	6785                	lui	a5,0x1
    8000749e:	17fd                	addi	a5,a5,-1
    800074a0:	8ff9                	and	a5,a5,a4
    800074a2:	2e079563          	bnez	a5,8000778c <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800074a6:	e0043783          	ld	a5,-512(s0)
    800074aa:	df843703          	ld	a4,-520(s0)
    800074ae:	0007069b          	sext.w	a3,a4
    800074b2:	e1043703          	ld	a4,-496(s0)
    800074b6:	2701                	sext.w	a4,a4
    800074b8:	fa843603          	ld	a2,-88(s0)
    800074bc:	85be                	mv	a1,a5
    800074be:	fa043503          	ld	a0,-96(s0)
    800074c2:	00000097          	auipc	ra,0x0
    800074c6:	32e080e7          	jalr	814(ra) # 800077f0 <loadseg>
    800074ca:	87aa                	mv	a5,a0
    800074cc:	2c07c263          	bltz	a5,80007790 <exec+0x43c>
    800074d0:	a011                	j	800074d4 <exec+0x180>
      continue;
    800074d2:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800074d4:	fcc42783          	lw	a5,-52(s0)
    800074d8:	2785                	addiw	a5,a5,1
    800074da:	fcf42623          	sw	a5,-52(s0)
    800074de:	fc842783          	lw	a5,-56(s0)
    800074e2:	0387879b          	addiw	a5,a5,56
    800074e6:	2781                	sext.w	a5,a5
    800074e8:	fcf42423          	sw	a5,-56(s0)
    800074ec:	e6045783          	lhu	a5,-416(s0)
    800074f0:	0007871b          	sext.w	a4,a5
    800074f4:	fcc42783          	lw	a5,-52(s0)
    800074f8:	2781                	sext.w	a5,a5
    800074fa:	f0e7cee3          	blt	a5,a4,80007416 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800074fe:	fa843503          	ld	a0,-88(s0)
    80007502:	ffffe097          	auipc	ra,0xffffe
    80007506:	ff0080e7          	jalr	-16(ra) # 800054f2 <iunlockput>
  end_op();
    8000750a:	fffff097          	auipc	ra,0xfffff
    8000750e:	eb4080e7          	jalr	-332(ra) # 800063be <end_op>
  ip = 0;
    80007512:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007516:	ffffb097          	auipc	ra,0xffffb
    8000751a:	2dc080e7          	jalr	732(ra) # 800027f2 <myproc>
    8000751e:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007522:	f9843783          	ld	a5,-104(s0)
    80007526:	67bc                	ld	a5,72(a5)
    80007528:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    8000752c:	fb843703          	ld	a4,-72(s0)
    80007530:	6785                	lui	a5,0x1
    80007532:	17fd                	addi	a5,a5,-1
    80007534:	973e                	add	a4,a4,a5
    80007536:	77fd                	lui	a5,0xfffff
    80007538:	8ff9                	and	a5,a5,a4
    8000753a:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    8000753e:	fb843703          	ld	a4,-72(s0)
    80007542:	6789                	lui	a5,0x2
    80007544:	97ba                	add	a5,a5,a4
    80007546:	863e                	mv	a2,a5
    80007548:	fb843583          	ld	a1,-72(s0)
    8000754c:	fa043503          	ld	a0,-96(s0)
    80007550:	ffffb097          	auipc	ra,0xffffb
    80007554:	9a6080e7          	jalr	-1626(ra) # 80001ef6 <uvmalloc>
    80007558:	f8a43423          	sd	a0,-120(s0)
    8000755c:	f8843783          	ld	a5,-120(s0)
    80007560:	22078a63          	beqz	a5,80007794 <exec+0x440>
    goto bad;
  sz = sz1;
    80007564:	f8843783          	ld	a5,-120(s0)
    80007568:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000756c:	fb843703          	ld	a4,-72(s0)
    80007570:	77f9                	lui	a5,0xffffe
    80007572:	97ba                	add	a5,a5,a4
    80007574:	85be                	mv	a1,a5
    80007576:	fa043503          	ld	a0,-96(s0)
    8000757a:	ffffb097          	auipc	ra,0xffffb
    8000757e:	d04080e7          	jalr	-764(ra) # 8000227e <uvmclear>
  sp = sz;
    80007582:	fb843783          	ld	a5,-72(s0)
    80007586:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    8000758a:	fb043703          	ld	a4,-80(s0)
    8000758e:	77fd                	lui	a5,0xfffff
    80007590:	97ba                	add	a5,a5,a4
    80007592:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007596:	fc043023          	sd	zero,-64(s0)
    8000759a:	a845                	j	8000764a <exec+0x2f6>
    if(argc >= MAXARG)
    8000759c:	fc043703          	ld	a4,-64(s0)
    800075a0:	47fd                	li	a5,31
    800075a2:	1ee7eb63          	bltu	a5,a4,80007798 <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800075a6:	fc043783          	ld	a5,-64(s0)
    800075aa:	078e                	slli	a5,a5,0x3
    800075ac:	de043703          	ld	a4,-544(s0)
    800075b0:	97ba                	add	a5,a5,a4
    800075b2:	639c                	ld	a5,0(a5)
    800075b4:	853e                	mv	a0,a5
    800075b6:	ffffa097          	auipc	ra,0xffffa
    800075ba:	20e080e7          	jalr	526(ra) # 800017c4 <strlen>
    800075be:	87aa                	mv	a5,a0
    800075c0:	2785                	addiw	a5,a5,1
    800075c2:	2781                	sext.w	a5,a5
    800075c4:	873e                	mv	a4,a5
    800075c6:	fb043783          	ld	a5,-80(s0)
    800075ca:	8f99                	sub	a5,a5,a4
    800075cc:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800075d0:	fb043783          	ld	a5,-80(s0)
    800075d4:	9bc1                	andi	a5,a5,-16
    800075d6:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800075da:	fb043703          	ld	a4,-80(s0)
    800075de:	f8043783          	ld	a5,-128(s0)
    800075e2:	1af76d63          	bltu	a4,a5,8000779c <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800075e6:	fc043783          	ld	a5,-64(s0)
    800075ea:	078e                	slli	a5,a5,0x3
    800075ec:	de043703          	ld	a4,-544(s0)
    800075f0:	97ba                	add	a5,a5,a4
    800075f2:	6384                	ld	s1,0(a5)
    800075f4:	fc043783          	ld	a5,-64(s0)
    800075f8:	078e                	slli	a5,a5,0x3
    800075fa:	de043703          	ld	a4,-544(s0)
    800075fe:	97ba                	add	a5,a5,a4
    80007600:	639c                	ld	a5,0(a5)
    80007602:	853e                	mv	a0,a5
    80007604:	ffffa097          	auipc	ra,0xffffa
    80007608:	1c0080e7          	jalr	448(ra) # 800017c4 <strlen>
    8000760c:	87aa                	mv	a5,a0
    8000760e:	2785                	addiw	a5,a5,1
    80007610:	2781                	sext.w	a5,a5
    80007612:	86be                	mv	a3,a5
    80007614:	8626                	mv	a2,s1
    80007616:	fb043583          	ld	a1,-80(s0)
    8000761a:	fa043503          	ld	a0,-96(s0)
    8000761e:	ffffb097          	auipc	ra,0xffffb
    80007622:	cb6080e7          	jalr	-842(ra) # 800022d4 <copyout>
    80007626:	87aa                	mv	a5,a0
    80007628:	1607cc63          	bltz	a5,800077a0 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    8000762c:	fc043783          	ld	a5,-64(s0)
    80007630:	078e                	slli	a5,a5,0x3
    80007632:	fe040713          	addi	a4,s0,-32
    80007636:	97ba                	add	a5,a5,a4
    80007638:	fb043703          	ld	a4,-80(s0)
    8000763c:	e8e7b423          	sd	a4,-376(a5) # ffffffffffffee88 <end+0xffffffff7ff8ce88>
  for(argc = 0; argv[argc]; argc++) {
    80007640:	fc043783          	ld	a5,-64(s0)
    80007644:	0785                	addi	a5,a5,1
    80007646:	fcf43023          	sd	a5,-64(s0)
    8000764a:	fc043783          	ld	a5,-64(s0)
    8000764e:	078e                	slli	a5,a5,0x3
    80007650:	de043703          	ld	a4,-544(s0)
    80007654:	97ba                	add	a5,a5,a4
    80007656:	639c                	ld	a5,0(a5)
    80007658:	f3b1                	bnez	a5,8000759c <exec+0x248>
  }
  ustack[argc] = 0;
    8000765a:	fc043783          	ld	a5,-64(s0)
    8000765e:	078e                	slli	a5,a5,0x3
    80007660:	fe040713          	addi	a4,s0,-32
    80007664:	97ba                	add	a5,a5,a4
    80007666:	e807b423          	sd	zero,-376(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    8000766a:	fc043783          	ld	a5,-64(s0)
    8000766e:	0785                	addi	a5,a5,1
    80007670:	078e                	slli	a5,a5,0x3
    80007672:	fb043703          	ld	a4,-80(s0)
    80007676:	40f707b3          	sub	a5,a4,a5
    8000767a:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    8000767e:	fb043783          	ld	a5,-80(s0)
    80007682:	9bc1                	andi	a5,a5,-16
    80007684:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007688:	fb043703          	ld	a4,-80(s0)
    8000768c:	f8043783          	ld	a5,-128(s0)
    80007690:	10f76a63          	bltu	a4,a5,800077a4 <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007694:	fc043783          	ld	a5,-64(s0)
    80007698:	0785                	addi	a5,a5,1
    8000769a:	00379713          	slli	a4,a5,0x3
    8000769e:	e6840793          	addi	a5,s0,-408
    800076a2:	86ba                	mv	a3,a4
    800076a4:	863e                	mv	a2,a5
    800076a6:	fb043583          	ld	a1,-80(s0)
    800076aa:	fa043503          	ld	a0,-96(s0)
    800076ae:	ffffb097          	auipc	ra,0xffffb
    800076b2:	c26080e7          	jalr	-986(ra) # 800022d4 <copyout>
    800076b6:	87aa                	mv	a5,a0
    800076b8:	0e07c863          	bltz	a5,800077a8 <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800076bc:	f9843783          	ld	a5,-104(s0)
    800076c0:	6fbc                	ld	a5,88(a5)
    800076c2:	fb043703          	ld	a4,-80(s0)
    800076c6:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800076c8:	de843783          	ld	a5,-536(s0)
    800076cc:	fcf43c23          	sd	a5,-40(s0)
    800076d0:	fd843783          	ld	a5,-40(s0)
    800076d4:	fcf43823          	sd	a5,-48(s0)
    800076d8:	a025                	j	80007700 <exec+0x3ac>
    if(*s == '/')
    800076da:	fd843783          	ld	a5,-40(s0)
    800076de:	0007c783          	lbu	a5,0(a5)
    800076e2:	873e                	mv	a4,a5
    800076e4:	02f00793          	li	a5,47
    800076e8:	00f71763          	bne	a4,a5,800076f6 <exec+0x3a2>
      last = s+1;
    800076ec:	fd843783          	ld	a5,-40(s0)
    800076f0:	0785                	addi	a5,a5,1
    800076f2:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800076f6:	fd843783          	ld	a5,-40(s0)
    800076fa:	0785                	addi	a5,a5,1
    800076fc:	fcf43c23          	sd	a5,-40(s0)
    80007700:	fd843783          	ld	a5,-40(s0)
    80007704:	0007c783          	lbu	a5,0(a5)
    80007708:	fbe9                	bnez	a5,800076da <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    8000770a:	f9843783          	ld	a5,-104(s0)
    8000770e:	15878793          	addi	a5,a5,344
    80007712:	4641                	li	a2,16
    80007714:	fd043583          	ld	a1,-48(s0)
    80007718:	853e                	mv	a0,a5
    8000771a:	ffffa097          	auipc	ra,0xffffa
    8000771e:	030080e7          	jalr	48(ra) # 8000174a <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007722:	f9843783          	ld	a5,-104(s0)
    80007726:	6bbc                	ld	a5,80(a5)
    80007728:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    8000772c:	f9843783          	ld	a5,-104(s0)
    80007730:	fa043703          	ld	a4,-96(s0)
    80007734:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007736:	f9843783          	ld	a5,-104(s0)
    8000773a:	fb843703          	ld	a4,-72(s0)
    8000773e:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007740:	f9843783          	ld	a5,-104(s0)
    80007744:	6fbc                	ld	a5,88(a5)
    80007746:	e4043703          	ld	a4,-448(s0)
    8000774a:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8000774c:	f9843783          	ld	a5,-104(s0)
    80007750:	6fbc                	ld	a5,88(a5)
    80007752:	fb043703          	ld	a4,-80(s0)
    80007756:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007758:	f9043583          	ld	a1,-112(s0)
    8000775c:	f7843503          	ld	a0,-136(s0)
    80007760:	ffffb097          	auipc	ra,0xffffb
    80007764:	408080e7          	jalr	1032(ra) # 80002b68 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007768:	fc043783          	ld	a5,-64(s0)
    8000776c:	2781                	sext.w	a5,a5
    8000776e:	a0bd                	j	800077dc <exec+0x488>
    goto bad;
    80007770:	0001                	nop
    80007772:	a825                	j	800077aa <exec+0x456>
    goto bad;
    80007774:	0001                	nop
    80007776:	a815                	j	800077aa <exec+0x456>
    goto bad;
    80007778:	0001                	nop
    8000777a:	a805                	j	800077aa <exec+0x456>
      goto bad;
    8000777c:	0001                	nop
    8000777e:	a035                	j	800077aa <exec+0x456>
      goto bad;
    80007780:	0001                	nop
    80007782:	a025                	j	800077aa <exec+0x456>
      goto bad;
    80007784:	0001                	nop
    80007786:	a015                	j	800077aa <exec+0x456>
      goto bad;
    80007788:	0001                	nop
    8000778a:	a005                	j	800077aa <exec+0x456>
      goto bad;
    8000778c:	0001                	nop
    8000778e:	a831                	j	800077aa <exec+0x456>
      goto bad;
    80007790:	0001                	nop
    80007792:	a821                	j	800077aa <exec+0x456>
    goto bad;
    80007794:	0001                	nop
    80007796:	a811                	j	800077aa <exec+0x456>
      goto bad;
    80007798:	0001                	nop
    8000779a:	a801                	j	800077aa <exec+0x456>
      goto bad;
    8000779c:	0001                	nop
    8000779e:	a031                	j	800077aa <exec+0x456>
      goto bad;
    800077a0:	0001                	nop
    800077a2:	a021                	j	800077aa <exec+0x456>
    goto bad;
    800077a4:	0001                	nop
    800077a6:	a011                	j	800077aa <exec+0x456>
    goto bad;
    800077a8:	0001                	nop

 bad:
  if(pagetable)
    800077aa:	fa043783          	ld	a5,-96(s0)
    800077ae:	cb89                	beqz	a5,800077c0 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    800077b0:	fb843583          	ld	a1,-72(s0)
    800077b4:	fa043503          	ld	a0,-96(s0)
    800077b8:	ffffb097          	auipc	ra,0xffffb
    800077bc:	3b0080e7          	jalr	944(ra) # 80002b68 <proc_freepagetable>
  if(ip){
    800077c0:	fa843783          	ld	a5,-88(s0)
    800077c4:	cb99                	beqz	a5,800077da <exec+0x486>
    iunlockput(ip);
    800077c6:	fa843503          	ld	a0,-88(s0)
    800077ca:	ffffe097          	auipc	ra,0xffffe
    800077ce:	d28080e7          	jalr	-728(ra) # 800054f2 <iunlockput>
    end_op();
    800077d2:	fffff097          	auipc	ra,0xfffff
    800077d6:	bec080e7          	jalr	-1044(ra) # 800063be <end_op>
  }
  return -1;
    800077da:	57fd                	li	a5,-1
}
    800077dc:	853e                	mv	a0,a5
    800077de:	21813083          	ld	ra,536(sp)
    800077e2:	21013403          	ld	s0,528(sp)
    800077e6:	20813483          	ld	s1,520(sp)
    800077ea:	22010113          	addi	sp,sp,544
    800077ee:	8082                	ret

00000000800077f0 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800077f0:	7139                	addi	sp,sp,-64
    800077f2:	fc06                	sd	ra,56(sp)
    800077f4:	f822                	sd	s0,48(sp)
    800077f6:	0080                	addi	s0,sp,64
    800077f8:	fca43c23          	sd	a0,-40(s0)
    800077fc:	fcb43823          	sd	a1,-48(s0)
    80007800:	fcc43423          	sd	a2,-56(s0)
    80007804:	87b6                	mv	a5,a3
    80007806:	fcf42223          	sw	a5,-60(s0)
    8000780a:	87ba                	mv	a5,a4
    8000780c:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  if((va % PGSIZE) != 0)
    80007810:	fd043703          	ld	a4,-48(s0)
    80007814:	6785                	lui	a5,0x1
    80007816:	17fd                	addi	a5,a5,-1
    80007818:	8ff9                	and	a5,a5,a4
    8000781a:	cb89                	beqz	a5,8000782c <loadseg+0x3c>
    panic("loadseg: va must be page aligned");
    8000781c:	00004517          	auipc	a0,0x4
    80007820:	dbc50513          	addi	a0,a0,-580 # 8000b5d8 <etext+0x5d8>
    80007824:	ffff9097          	auipc	ra,0xffff9
    80007828:	42e080e7          	jalr	1070(ra) # 80000c52 <panic>

  for(i = 0; i < sz; i += PGSIZE){
    8000782c:	fe042623          	sw	zero,-20(s0)
    80007830:	a05d                	j	800078d6 <loadseg+0xe6>
    pa = walkaddr(pagetable, va + i);
    80007832:	fec46703          	lwu	a4,-20(s0)
    80007836:	fd043783          	ld	a5,-48(s0)
    8000783a:	97ba                	add	a5,a5,a4
    8000783c:	85be                	mv	a1,a5
    8000783e:	fd843503          	ld	a0,-40(s0)
    80007842:	ffffa097          	auipc	ra,0xffffa
    80007846:	356080e7          	jalr	854(ra) # 80001b98 <walkaddr>
    8000784a:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000784e:	fe043783          	ld	a5,-32(s0)
    80007852:	eb89                	bnez	a5,80007864 <loadseg+0x74>
      panic("loadseg: address should exist");
    80007854:	00004517          	auipc	a0,0x4
    80007858:	dac50513          	addi	a0,a0,-596 # 8000b600 <etext+0x600>
    8000785c:	ffff9097          	auipc	ra,0xffff9
    80007860:	3f6080e7          	jalr	1014(ra) # 80000c52 <panic>
    if(sz - i < PGSIZE)
    80007864:	fc042703          	lw	a4,-64(s0)
    80007868:	fec42783          	lw	a5,-20(s0)
    8000786c:	40f707bb          	subw	a5,a4,a5
    80007870:	2781                	sext.w	a5,a5
    80007872:	873e                	mv	a4,a5
    80007874:	6785                	lui	a5,0x1
    80007876:	00f77b63          	bgeu	a4,a5,8000788c <loadseg+0x9c>
      n = sz - i;
    8000787a:	fc042703          	lw	a4,-64(s0)
    8000787e:	fec42783          	lw	a5,-20(s0)
    80007882:	40f707bb          	subw	a5,a4,a5
    80007886:	fef42423          	sw	a5,-24(s0)
    8000788a:	a021                	j	80007892 <loadseg+0xa2>
    else
      n = PGSIZE;
    8000788c:	6785                	lui	a5,0x1
    8000788e:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007892:	fc442703          	lw	a4,-60(s0)
    80007896:	fec42783          	lw	a5,-20(s0)
    8000789a:	9fb9                	addw	a5,a5,a4
    8000789c:	2781                	sext.w	a5,a5
    8000789e:	fe842703          	lw	a4,-24(s0)
    800078a2:	86be                	mv	a3,a5
    800078a4:	fe043603          	ld	a2,-32(s0)
    800078a8:	4581                	li	a1,0
    800078aa:	fc843503          	ld	a0,-56(s0)
    800078ae:	ffffe097          	auipc	ra,0xffffe
    800078b2:	f7c080e7          	jalr	-132(ra) # 8000582a <readi>
    800078b6:	87aa                	mv	a5,a0
    800078b8:	0007871b          	sext.w	a4,a5
    800078bc:	fe842783          	lw	a5,-24(s0)
    800078c0:	2781                	sext.w	a5,a5
    800078c2:	00e78463          	beq	a5,a4,800078ca <loadseg+0xda>
      return -1;
    800078c6:	57fd                	li	a5,-1
    800078c8:	a005                	j	800078e8 <loadseg+0xf8>
  for(i = 0; i < sz; i += PGSIZE){
    800078ca:	fec42703          	lw	a4,-20(s0)
    800078ce:	6785                	lui	a5,0x1
    800078d0:	9fb9                	addw	a5,a5,a4
    800078d2:	fef42623          	sw	a5,-20(s0)
    800078d6:	fec42703          	lw	a4,-20(s0)
    800078da:	fc042783          	lw	a5,-64(s0)
    800078de:	2701                	sext.w	a4,a4
    800078e0:	2781                	sext.w	a5,a5
    800078e2:	f4f768e3          	bltu	a4,a5,80007832 <loadseg+0x42>
  }
  
  return 0;
    800078e6:	4781                	li	a5,0
}
    800078e8:	853e                	mv	a0,a5
    800078ea:	70e2                	ld	ra,56(sp)
    800078ec:	7442                	ld	s0,48(sp)
    800078ee:	6121                	addi	sp,sp,64
    800078f0:	8082                	ret

00000000800078f2 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800078f2:	7139                	addi	sp,sp,-64
    800078f4:	fc06                	sd	ra,56(sp)
    800078f6:	f822                	sd	s0,48(sp)
    800078f8:	0080                	addi	s0,sp,64
    800078fa:	87aa                	mv	a5,a0
    800078fc:	fcb43823          	sd	a1,-48(s0)
    80007900:	fcc43423          	sd	a2,-56(s0)
    80007904:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007908:	fe440713          	addi	a4,s0,-28
    8000790c:	fdc42783          	lw	a5,-36(s0)
    80007910:	85ba                	mv	a1,a4
    80007912:	853e                	mv	a0,a5
    80007914:	ffffd097          	auipc	ra,0xffffd
    80007918:	9ae080e7          	jalr	-1618(ra) # 800042c2 <argint>
    8000791c:	87aa                	mv	a5,a0
    8000791e:	0007d463          	bgez	a5,80007926 <argfd+0x34>
    return -1;
    80007922:	57fd                	li	a5,-1
    80007924:	a8b1                	j	80007980 <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007926:	fe442783          	lw	a5,-28(s0)
    8000792a:	0207c863          	bltz	a5,8000795a <argfd+0x68>
    8000792e:	fe442783          	lw	a5,-28(s0)
    80007932:	873e                	mv	a4,a5
    80007934:	47bd                	li	a5,15
    80007936:	02e7c263          	blt	a5,a4,8000795a <argfd+0x68>
    8000793a:	ffffb097          	auipc	ra,0xffffb
    8000793e:	eb8080e7          	jalr	-328(ra) # 800027f2 <myproc>
    80007942:	872a                	mv	a4,a0
    80007944:	fe442783          	lw	a5,-28(s0)
    80007948:	07e9                	addi	a5,a5,26
    8000794a:	078e                	slli	a5,a5,0x3
    8000794c:	97ba                	add	a5,a5,a4
    8000794e:	639c                	ld	a5,0(a5)
    80007950:	fef43423          	sd	a5,-24(s0)
    80007954:	fe843783          	ld	a5,-24(s0)
    80007958:	e399                	bnez	a5,8000795e <argfd+0x6c>
    return -1;
    8000795a:	57fd                	li	a5,-1
    8000795c:	a015                	j	80007980 <argfd+0x8e>
  if(pfd)
    8000795e:	fd043783          	ld	a5,-48(s0)
    80007962:	c791                	beqz	a5,8000796e <argfd+0x7c>
    *pfd = fd;
    80007964:	fe442703          	lw	a4,-28(s0)
    80007968:	fd043783          	ld	a5,-48(s0)
    8000796c:	c398                	sw	a4,0(a5)
  if(pf)
    8000796e:	fc843783          	ld	a5,-56(s0)
    80007972:	c791                	beqz	a5,8000797e <argfd+0x8c>
    *pf = f;
    80007974:	fc843783          	ld	a5,-56(s0)
    80007978:	fe843703          	ld	a4,-24(s0)
    8000797c:	e398                	sd	a4,0(a5)
  return 0;
    8000797e:	4781                	li	a5,0
}
    80007980:	853e                	mv	a0,a5
    80007982:	70e2                	ld	ra,56(sp)
    80007984:	7442                	ld	s0,48(sp)
    80007986:	6121                	addi	sp,sp,64
    80007988:	8082                	ret

000000008000798a <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8000798a:	7179                	addi	sp,sp,-48
    8000798c:	f406                	sd	ra,40(sp)
    8000798e:	f022                	sd	s0,32(sp)
    80007990:	1800                	addi	s0,sp,48
    80007992:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007996:	ffffb097          	auipc	ra,0xffffb
    8000799a:	e5c080e7          	jalr	-420(ra) # 800027f2 <myproc>
    8000799e:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    800079a2:	fe042623          	sw	zero,-20(s0)
    800079a6:	a825                	j	800079de <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    800079a8:	fe043703          	ld	a4,-32(s0)
    800079ac:	fec42783          	lw	a5,-20(s0)
    800079b0:	07e9                	addi	a5,a5,26
    800079b2:	078e                	slli	a5,a5,0x3
    800079b4:	97ba                	add	a5,a5,a4
    800079b6:	639c                	ld	a5,0(a5)
    800079b8:	ef91                	bnez	a5,800079d4 <fdalloc+0x4a>
      p->ofile[fd] = f;
    800079ba:	fe043703          	ld	a4,-32(s0)
    800079be:	fec42783          	lw	a5,-20(s0)
    800079c2:	07e9                	addi	a5,a5,26
    800079c4:	078e                	slli	a5,a5,0x3
    800079c6:	97ba                	add	a5,a5,a4
    800079c8:	fd843703          	ld	a4,-40(s0)
    800079cc:	e398                	sd	a4,0(a5)
      return fd;
    800079ce:	fec42783          	lw	a5,-20(s0)
    800079d2:	a831                	j	800079ee <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    800079d4:	fec42783          	lw	a5,-20(s0)
    800079d8:	2785                	addiw	a5,a5,1
    800079da:	fef42623          	sw	a5,-20(s0)
    800079de:	fec42783          	lw	a5,-20(s0)
    800079e2:	0007871b          	sext.w	a4,a5
    800079e6:	47bd                	li	a5,15
    800079e8:	fce7d0e3          	bge	a5,a4,800079a8 <fdalloc+0x1e>
    }
  }
  return -1;
    800079ec:	57fd                	li	a5,-1
}
    800079ee:	853e                	mv	a0,a5
    800079f0:	70a2                	ld	ra,40(sp)
    800079f2:	7402                	ld	s0,32(sp)
    800079f4:	6145                	addi	sp,sp,48
    800079f6:	8082                	ret

00000000800079f8 <sys_dup>:

uint64
sys_dup(void)
{
    800079f8:	1101                	addi	sp,sp,-32
    800079fa:	ec06                	sd	ra,24(sp)
    800079fc:	e822                	sd	s0,16(sp)
    800079fe:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007a00:	fe040793          	addi	a5,s0,-32
    80007a04:	863e                	mv	a2,a5
    80007a06:	4581                	li	a1,0
    80007a08:	4501                	li	a0,0
    80007a0a:	00000097          	auipc	ra,0x0
    80007a0e:	ee8080e7          	jalr	-280(ra) # 800078f2 <argfd>
    80007a12:	87aa                	mv	a5,a0
    80007a14:	0007d463          	bgez	a5,80007a1c <sys_dup+0x24>
    return -1;
    80007a18:	57fd                	li	a5,-1
    80007a1a:	a81d                	j	80007a50 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007a1c:	fe043783          	ld	a5,-32(s0)
    80007a20:	853e                	mv	a0,a5
    80007a22:	00000097          	auipc	ra,0x0
    80007a26:	f68080e7          	jalr	-152(ra) # 8000798a <fdalloc>
    80007a2a:	87aa                	mv	a5,a0
    80007a2c:	fef42623          	sw	a5,-20(s0)
    80007a30:	fec42783          	lw	a5,-20(s0)
    80007a34:	2781                	sext.w	a5,a5
    80007a36:	0007d463          	bgez	a5,80007a3e <sys_dup+0x46>
    return -1;
    80007a3a:	57fd                	li	a5,-1
    80007a3c:	a811                	j	80007a50 <sys_dup+0x58>
  filedup(f);
    80007a3e:	fe043783          	ld	a5,-32(s0)
    80007a42:	853e                	mv	a0,a5
    80007a44:	fffff097          	auipc	ra,0xfffff
    80007a48:	eec080e7          	jalr	-276(ra) # 80006930 <filedup>
  return fd;
    80007a4c:	fec42783          	lw	a5,-20(s0)
}
    80007a50:	853e                	mv	a0,a5
    80007a52:	60e2                	ld	ra,24(sp)
    80007a54:	6442                	ld	s0,16(sp)
    80007a56:	6105                	addi	sp,sp,32
    80007a58:	8082                	ret

0000000080007a5a <sys_read>:

uint64
sys_read(void)
{
    80007a5a:	7179                	addi	sp,sp,-48
    80007a5c:	f406                	sd	ra,40(sp)
    80007a5e:	f022                	sd	s0,32(sp)
    80007a60:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007a62:	fe840793          	addi	a5,s0,-24
    80007a66:	863e                	mv	a2,a5
    80007a68:	4581                	li	a1,0
    80007a6a:	4501                	li	a0,0
    80007a6c:	00000097          	auipc	ra,0x0
    80007a70:	e86080e7          	jalr	-378(ra) # 800078f2 <argfd>
    80007a74:	87aa                	mv	a5,a0
    80007a76:	0207c863          	bltz	a5,80007aa6 <sys_read+0x4c>
    80007a7a:	fe440793          	addi	a5,s0,-28
    80007a7e:	85be                	mv	a1,a5
    80007a80:	4509                	li	a0,2
    80007a82:	ffffd097          	auipc	ra,0xffffd
    80007a86:	840080e7          	jalr	-1984(ra) # 800042c2 <argint>
    80007a8a:	87aa                	mv	a5,a0
    80007a8c:	0007cd63          	bltz	a5,80007aa6 <sys_read+0x4c>
    80007a90:	fd840793          	addi	a5,s0,-40
    80007a94:	85be                	mv	a1,a5
    80007a96:	4505                	li	a0,1
    80007a98:	ffffd097          	auipc	ra,0xffffd
    80007a9c:	862080e7          	jalr	-1950(ra) # 800042fa <argaddr>
    80007aa0:	87aa                	mv	a5,a0
    80007aa2:	0007d463          	bgez	a5,80007aaa <sys_read+0x50>
    return -1;
    80007aa6:	57fd                	li	a5,-1
    80007aa8:	a839                	j	80007ac6 <sys_read+0x6c>
  return fileread(f, p, n);
    80007aaa:	fe843783          	ld	a5,-24(s0)
    80007aae:	fd843703          	ld	a4,-40(s0)
    80007ab2:	fe442683          	lw	a3,-28(s0)
    80007ab6:	8636                	mv	a2,a3
    80007ab8:	85ba                	mv	a1,a4
    80007aba:	853e                	mv	a0,a5
    80007abc:	fffff097          	auipc	ra,0xfffff
    80007ac0:	086080e7          	jalr	134(ra) # 80006b42 <fileread>
    80007ac4:	87aa                	mv	a5,a0
}
    80007ac6:	853e                	mv	a0,a5
    80007ac8:	70a2                	ld	ra,40(sp)
    80007aca:	7402                	ld	s0,32(sp)
    80007acc:	6145                	addi	sp,sp,48
    80007ace:	8082                	ret

0000000080007ad0 <sys_write>:

uint64
sys_write(void)
{
    80007ad0:	7179                	addi	sp,sp,-48
    80007ad2:	f406                	sd	ra,40(sp)
    80007ad4:	f022                	sd	s0,32(sp)
    80007ad6:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007ad8:	fe840793          	addi	a5,s0,-24
    80007adc:	863e                	mv	a2,a5
    80007ade:	4581                	li	a1,0
    80007ae0:	4501                	li	a0,0
    80007ae2:	00000097          	auipc	ra,0x0
    80007ae6:	e10080e7          	jalr	-496(ra) # 800078f2 <argfd>
    80007aea:	87aa                	mv	a5,a0
    80007aec:	0207c863          	bltz	a5,80007b1c <sys_write+0x4c>
    80007af0:	fe440793          	addi	a5,s0,-28
    80007af4:	85be                	mv	a1,a5
    80007af6:	4509                	li	a0,2
    80007af8:	ffffc097          	auipc	ra,0xffffc
    80007afc:	7ca080e7          	jalr	1994(ra) # 800042c2 <argint>
    80007b00:	87aa                	mv	a5,a0
    80007b02:	0007cd63          	bltz	a5,80007b1c <sys_write+0x4c>
    80007b06:	fd840793          	addi	a5,s0,-40
    80007b0a:	85be                	mv	a1,a5
    80007b0c:	4505                	li	a0,1
    80007b0e:	ffffc097          	auipc	ra,0xffffc
    80007b12:	7ec080e7          	jalr	2028(ra) # 800042fa <argaddr>
    80007b16:	87aa                	mv	a5,a0
    80007b18:	0007d463          	bgez	a5,80007b20 <sys_write+0x50>
    return -1;
    80007b1c:	57fd                	li	a5,-1
    80007b1e:	a839                	j	80007b3c <sys_write+0x6c>

  return filewrite(f, p, n);
    80007b20:	fe843783          	ld	a5,-24(s0)
    80007b24:	fd843703          	ld	a4,-40(s0)
    80007b28:	fe442683          	lw	a3,-28(s0)
    80007b2c:	8636                	mv	a2,a3
    80007b2e:	85ba                	mv	a1,a4
    80007b30:	853e                	mv	a0,a5
    80007b32:	fffff097          	auipc	ra,0xfffff
    80007b36:	176080e7          	jalr	374(ra) # 80006ca8 <filewrite>
    80007b3a:	87aa                	mv	a5,a0
}
    80007b3c:	853e                	mv	a0,a5
    80007b3e:	70a2                	ld	ra,40(sp)
    80007b40:	7402                	ld	s0,32(sp)
    80007b42:	6145                	addi	sp,sp,48
    80007b44:	8082                	ret

0000000080007b46 <sys_close>:

uint64
sys_close(void)
{
    80007b46:	1101                	addi	sp,sp,-32
    80007b48:	ec06                	sd	ra,24(sp)
    80007b4a:	e822                	sd	s0,16(sp)
    80007b4c:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007b4e:	fe040713          	addi	a4,s0,-32
    80007b52:	fec40793          	addi	a5,s0,-20
    80007b56:	863a                	mv	a2,a4
    80007b58:	85be                	mv	a1,a5
    80007b5a:	4501                	li	a0,0
    80007b5c:	00000097          	auipc	ra,0x0
    80007b60:	d96080e7          	jalr	-618(ra) # 800078f2 <argfd>
    80007b64:	87aa                	mv	a5,a0
    80007b66:	0007d463          	bgez	a5,80007b6e <sys_close+0x28>
    return -1;
    80007b6a:	57fd                	li	a5,-1
    80007b6c:	a02d                	j	80007b96 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007b6e:	ffffb097          	auipc	ra,0xffffb
    80007b72:	c84080e7          	jalr	-892(ra) # 800027f2 <myproc>
    80007b76:	872a                	mv	a4,a0
    80007b78:	fec42783          	lw	a5,-20(s0)
    80007b7c:	07e9                	addi	a5,a5,26
    80007b7e:	078e                	slli	a5,a5,0x3
    80007b80:	97ba                	add	a5,a5,a4
    80007b82:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007b86:	fe043783          	ld	a5,-32(s0)
    80007b8a:	853e                	mv	a0,a5
    80007b8c:	fffff097          	auipc	ra,0xfffff
    80007b90:	e0a080e7          	jalr	-502(ra) # 80006996 <fileclose>
  return 0;
    80007b94:	4781                	li	a5,0
}
    80007b96:	853e                	mv	a0,a5
    80007b98:	60e2                	ld	ra,24(sp)
    80007b9a:	6442                	ld	s0,16(sp)
    80007b9c:	6105                	addi	sp,sp,32
    80007b9e:	8082                	ret

0000000080007ba0 <sys_fstat>:

uint64
sys_fstat(void)
{
    80007ba0:	1101                	addi	sp,sp,-32
    80007ba2:	ec06                	sd	ra,24(sp)
    80007ba4:	e822                	sd	s0,16(sp)
    80007ba6:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80007ba8:	fe840793          	addi	a5,s0,-24
    80007bac:	863e                	mv	a2,a5
    80007bae:	4581                	li	a1,0
    80007bb0:	4501                	li	a0,0
    80007bb2:	00000097          	auipc	ra,0x0
    80007bb6:	d40080e7          	jalr	-704(ra) # 800078f2 <argfd>
    80007bba:	87aa                	mv	a5,a0
    80007bbc:	0007cd63          	bltz	a5,80007bd6 <sys_fstat+0x36>
    80007bc0:	fe040793          	addi	a5,s0,-32
    80007bc4:	85be                	mv	a1,a5
    80007bc6:	4505                	li	a0,1
    80007bc8:	ffffc097          	auipc	ra,0xffffc
    80007bcc:	732080e7          	jalr	1842(ra) # 800042fa <argaddr>
    80007bd0:	87aa                	mv	a5,a0
    80007bd2:	0007d463          	bgez	a5,80007bda <sys_fstat+0x3a>
    return -1;
    80007bd6:	57fd                	li	a5,-1
    80007bd8:	a821                	j	80007bf0 <sys_fstat+0x50>
  return filestat(f, st);
    80007bda:	fe843783          	ld	a5,-24(s0)
    80007bde:	fe043703          	ld	a4,-32(s0)
    80007be2:	85ba                	mv	a1,a4
    80007be4:	853e                	mv	a0,a5
    80007be6:	fffff097          	auipc	ra,0xfffff
    80007bea:	eb8080e7          	jalr	-328(ra) # 80006a9e <filestat>
    80007bee:	87aa                	mv	a5,a0
}
    80007bf0:	853e                	mv	a0,a5
    80007bf2:	60e2                	ld	ra,24(sp)
    80007bf4:	6442                	ld	s0,16(sp)
    80007bf6:	6105                	addi	sp,sp,32
    80007bf8:	8082                	ret

0000000080007bfa <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007bfa:	7169                	addi	sp,sp,-304
    80007bfc:	f606                	sd	ra,296(sp)
    80007bfe:	f222                	sd	s0,288(sp)
    80007c00:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007c02:	ed040793          	addi	a5,s0,-304
    80007c06:	08000613          	li	a2,128
    80007c0a:	85be                	mv	a1,a5
    80007c0c:	4501                	li	a0,0
    80007c0e:	ffffc097          	auipc	ra,0xffffc
    80007c12:	720080e7          	jalr	1824(ra) # 8000432e <argstr>
    80007c16:	87aa                	mv	a5,a0
    80007c18:	0007cf63          	bltz	a5,80007c36 <sys_link+0x3c>
    80007c1c:	f5040793          	addi	a5,s0,-176
    80007c20:	08000613          	li	a2,128
    80007c24:	85be                	mv	a1,a5
    80007c26:	4505                	li	a0,1
    80007c28:	ffffc097          	auipc	ra,0xffffc
    80007c2c:	706080e7          	jalr	1798(ra) # 8000432e <argstr>
    80007c30:	87aa                	mv	a5,a0
    80007c32:	0007d463          	bgez	a5,80007c3a <sys_link+0x40>
    return -1;
    80007c36:	57fd                	li	a5,-1
    80007c38:	aab5                	j	80007db4 <sys_link+0x1ba>

  begin_op();
    80007c3a:	ffffe097          	auipc	ra,0xffffe
    80007c3e:	6c2080e7          	jalr	1730(ra) # 800062fc <begin_op>
  if((ip = namei(old)) == 0){
    80007c42:	ed040793          	addi	a5,s0,-304
    80007c46:	853e                	mv	a0,a5
    80007c48:	ffffe097          	auipc	ra,0xffffe
    80007c4c:	350080e7          	jalr	848(ra) # 80005f98 <namei>
    80007c50:	fea43423          	sd	a0,-24(s0)
    80007c54:	fe843783          	ld	a5,-24(s0)
    80007c58:	e799                	bnez	a5,80007c66 <sys_link+0x6c>
    end_op();
    80007c5a:	ffffe097          	auipc	ra,0xffffe
    80007c5e:	764080e7          	jalr	1892(ra) # 800063be <end_op>
    return -1;
    80007c62:	57fd                	li	a5,-1
    80007c64:	aa81                	j	80007db4 <sys_link+0x1ba>
  }

  ilock(ip);
    80007c66:	fe843503          	ld	a0,-24(s0)
    80007c6a:	ffffd097          	auipc	ra,0xffffd
    80007c6e:	62a080e7          	jalr	1578(ra) # 80005294 <ilock>
  if(ip->type == T_DIR){
    80007c72:	fe843783          	ld	a5,-24(s0)
    80007c76:	04479783          	lh	a5,68(a5)
    80007c7a:	0007871b          	sext.w	a4,a5
    80007c7e:	4785                	li	a5,1
    80007c80:	00f71e63          	bne	a4,a5,80007c9c <sys_link+0xa2>
    iunlockput(ip);
    80007c84:	fe843503          	ld	a0,-24(s0)
    80007c88:	ffffe097          	auipc	ra,0xffffe
    80007c8c:	86a080e7          	jalr	-1942(ra) # 800054f2 <iunlockput>
    end_op();
    80007c90:	ffffe097          	auipc	ra,0xffffe
    80007c94:	72e080e7          	jalr	1838(ra) # 800063be <end_op>
    return -1;
    80007c98:	57fd                	li	a5,-1
    80007c9a:	aa29                	j	80007db4 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007c9c:	fe843783          	ld	a5,-24(s0)
    80007ca0:	04a79783          	lh	a5,74(a5)
    80007ca4:	17c2                	slli	a5,a5,0x30
    80007ca6:	93c1                	srli	a5,a5,0x30
    80007ca8:	2785                	addiw	a5,a5,1
    80007caa:	17c2                	slli	a5,a5,0x30
    80007cac:	93c1                	srli	a5,a5,0x30
    80007cae:	0107971b          	slliw	a4,a5,0x10
    80007cb2:	4107571b          	sraiw	a4,a4,0x10
    80007cb6:	fe843783          	ld	a5,-24(s0)
    80007cba:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007cbe:	fe843503          	ld	a0,-24(s0)
    80007cc2:	ffffd097          	auipc	ra,0xffffd
    80007cc6:	382080e7          	jalr	898(ra) # 80005044 <iupdate>
  iunlock(ip);
    80007cca:	fe843503          	ld	a0,-24(s0)
    80007cce:	ffffd097          	auipc	ra,0xffffd
    80007cd2:	6fa080e7          	jalr	1786(ra) # 800053c8 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007cd6:	fd040713          	addi	a4,s0,-48
    80007cda:	f5040793          	addi	a5,s0,-176
    80007cde:	85ba                	mv	a1,a4
    80007ce0:	853e                	mv	a0,a5
    80007ce2:	ffffe097          	auipc	ra,0xffffe
    80007ce6:	2e2080e7          	jalr	738(ra) # 80005fc4 <nameiparent>
    80007cea:	fea43023          	sd	a0,-32(s0)
    80007cee:	fe043783          	ld	a5,-32(s0)
    80007cf2:	cba5                	beqz	a5,80007d62 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007cf4:	fe043503          	ld	a0,-32(s0)
    80007cf8:	ffffd097          	auipc	ra,0xffffd
    80007cfc:	59c080e7          	jalr	1436(ra) # 80005294 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007d00:	fe043783          	ld	a5,-32(s0)
    80007d04:	4398                	lw	a4,0(a5)
    80007d06:	fe843783          	ld	a5,-24(s0)
    80007d0a:	439c                	lw	a5,0(a5)
    80007d0c:	02f71263          	bne	a4,a5,80007d30 <sys_link+0x136>
    80007d10:	fe843783          	ld	a5,-24(s0)
    80007d14:	43d8                	lw	a4,4(a5)
    80007d16:	fd040793          	addi	a5,s0,-48
    80007d1a:	863a                	mv	a2,a4
    80007d1c:	85be                	mv	a1,a5
    80007d1e:	fe043503          	ld	a0,-32(s0)
    80007d22:	ffffe097          	auipc	ra,0xffffe
    80007d26:	f5c080e7          	jalr	-164(ra) # 80005c7e <dirlink>
    80007d2a:	87aa                	mv	a5,a0
    80007d2c:	0007d963          	bgez	a5,80007d3e <sys_link+0x144>
    iunlockput(dp);
    80007d30:	fe043503          	ld	a0,-32(s0)
    80007d34:	ffffd097          	auipc	ra,0xffffd
    80007d38:	7be080e7          	jalr	1982(ra) # 800054f2 <iunlockput>
    goto bad;
    80007d3c:	a025                	j	80007d64 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007d3e:	fe043503          	ld	a0,-32(s0)
    80007d42:	ffffd097          	auipc	ra,0xffffd
    80007d46:	7b0080e7          	jalr	1968(ra) # 800054f2 <iunlockput>
  iput(ip);
    80007d4a:	fe843503          	ld	a0,-24(s0)
    80007d4e:	ffffd097          	auipc	ra,0xffffd
    80007d52:	6d4080e7          	jalr	1748(ra) # 80005422 <iput>

  end_op();
    80007d56:	ffffe097          	auipc	ra,0xffffe
    80007d5a:	668080e7          	jalr	1640(ra) # 800063be <end_op>

  return 0;
    80007d5e:	4781                	li	a5,0
    80007d60:	a891                	j	80007db4 <sys_link+0x1ba>
    goto bad;
    80007d62:	0001                	nop

bad:
  ilock(ip);
    80007d64:	fe843503          	ld	a0,-24(s0)
    80007d68:	ffffd097          	auipc	ra,0xffffd
    80007d6c:	52c080e7          	jalr	1324(ra) # 80005294 <ilock>
  ip->nlink--;
    80007d70:	fe843783          	ld	a5,-24(s0)
    80007d74:	04a79783          	lh	a5,74(a5)
    80007d78:	17c2                	slli	a5,a5,0x30
    80007d7a:	93c1                	srli	a5,a5,0x30
    80007d7c:	37fd                	addiw	a5,a5,-1
    80007d7e:	17c2                	slli	a5,a5,0x30
    80007d80:	93c1                	srli	a5,a5,0x30
    80007d82:	0107971b          	slliw	a4,a5,0x10
    80007d86:	4107571b          	sraiw	a4,a4,0x10
    80007d8a:	fe843783          	ld	a5,-24(s0)
    80007d8e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d92:	fe843503          	ld	a0,-24(s0)
    80007d96:	ffffd097          	auipc	ra,0xffffd
    80007d9a:	2ae080e7          	jalr	686(ra) # 80005044 <iupdate>
  iunlockput(ip);
    80007d9e:	fe843503          	ld	a0,-24(s0)
    80007da2:	ffffd097          	auipc	ra,0xffffd
    80007da6:	750080e7          	jalr	1872(ra) # 800054f2 <iunlockput>
  end_op();
    80007daa:	ffffe097          	auipc	ra,0xffffe
    80007dae:	614080e7          	jalr	1556(ra) # 800063be <end_op>
  return -1;
    80007db2:	57fd                	li	a5,-1
}
    80007db4:	853e                	mv	a0,a5
    80007db6:	70b2                	ld	ra,296(sp)
    80007db8:	7412                	ld	s0,288(sp)
    80007dba:	6155                	addi	sp,sp,304
    80007dbc:	8082                	ret

0000000080007dbe <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007dbe:	7139                	addi	sp,sp,-64
    80007dc0:	fc06                	sd	ra,56(sp)
    80007dc2:	f822                	sd	s0,48(sp)
    80007dc4:	0080                	addi	s0,sp,64
    80007dc6:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007dca:	02000793          	li	a5,32
    80007dce:	fef42623          	sw	a5,-20(s0)
    80007dd2:	a0b1                	j	80007e1e <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007dd4:	fd840793          	addi	a5,s0,-40
    80007dd8:	fec42683          	lw	a3,-20(s0)
    80007ddc:	4741                	li	a4,16
    80007dde:	863e                	mv	a2,a5
    80007de0:	4581                	li	a1,0
    80007de2:	fc843503          	ld	a0,-56(s0)
    80007de6:	ffffe097          	auipc	ra,0xffffe
    80007dea:	a44080e7          	jalr	-1468(ra) # 8000582a <readi>
    80007dee:	87aa                	mv	a5,a0
    80007df0:	873e                	mv	a4,a5
    80007df2:	47c1                	li	a5,16
    80007df4:	00f70a63          	beq	a4,a5,80007e08 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007df8:	00004517          	auipc	a0,0x4
    80007dfc:	82850513          	addi	a0,a0,-2008 # 8000b620 <etext+0x620>
    80007e00:	ffff9097          	auipc	ra,0xffff9
    80007e04:	e52080e7          	jalr	-430(ra) # 80000c52 <panic>
    if(de.inum != 0)
    80007e08:	fd845783          	lhu	a5,-40(s0)
    80007e0c:	c399                	beqz	a5,80007e12 <isdirempty+0x54>
      return 0;
    80007e0e:	4781                	li	a5,0
    80007e10:	a839                	j	80007e2e <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e12:	fec42783          	lw	a5,-20(s0)
    80007e16:	27c1                	addiw	a5,a5,16
    80007e18:	2781                	sext.w	a5,a5
    80007e1a:	fef42623          	sw	a5,-20(s0)
    80007e1e:	fc843783          	ld	a5,-56(s0)
    80007e22:	47f8                	lw	a4,76(a5)
    80007e24:	fec42783          	lw	a5,-20(s0)
    80007e28:	fae7e6e3          	bltu	a5,a4,80007dd4 <isdirempty+0x16>
  }
  return 1;
    80007e2c:	4785                	li	a5,1
}
    80007e2e:	853e                	mv	a0,a5
    80007e30:	70e2                	ld	ra,56(sp)
    80007e32:	7442                	ld	s0,48(sp)
    80007e34:	6121                	addi	sp,sp,64
    80007e36:	8082                	ret

0000000080007e38 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007e38:	7155                	addi	sp,sp,-208
    80007e3a:	e586                	sd	ra,200(sp)
    80007e3c:	e1a2                	sd	s0,192(sp)
    80007e3e:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007e40:	f4040793          	addi	a5,s0,-192
    80007e44:	08000613          	li	a2,128
    80007e48:	85be                	mv	a1,a5
    80007e4a:	4501                	li	a0,0
    80007e4c:	ffffc097          	auipc	ra,0xffffc
    80007e50:	4e2080e7          	jalr	1250(ra) # 8000432e <argstr>
    80007e54:	87aa                	mv	a5,a0
    80007e56:	0007d463          	bgez	a5,80007e5e <sys_unlink+0x26>
    return -1;
    80007e5a:	57fd                	li	a5,-1
    80007e5c:	a2ed                	j	80008046 <sys_unlink+0x20e>

  begin_op();
    80007e5e:	ffffe097          	auipc	ra,0xffffe
    80007e62:	49e080e7          	jalr	1182(ra) # 800062fc <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007e66:	fc040713          	addi	a4,s0,-64
    80007e6a:	f4040793          	addi	a5,s0,-192
    80007e6e:	85ba                	mv	a1,a4
    80007e70:	853e                	mv	a0,a5
    80007e72:	ffffe097          	auipc	ra,0xffffe
    80007e76:	152080e7          	jalr	338(ra) # 80005fc4 <nameiparent>
    80007e7a:	fea43423          	sd	a0,-24(s0)
    80007e7e:	fe843783          	ld	a5,-24(s0)
    80007e82:	e799                	bnez	a5,80007e90 <sys_unlink+0x58>
    end_op();
    80007e84:	ffffe097          	auipc	ra,0xffffe
    80007e88:	53a080e7          	jalr	1338(ra) # 800063be <end_op>
    return -1;
    80007e8c:	57fd                	li	a5,-1
    80007e8e:	aa65                	j	80008046 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007e90:	fe843503          	ld	a0,-24(s0)
    80007e94:	ffffd097          	auipc	ra,0xffffd
    80007e98:	400080e7          	jalr	1024(ra) # 80005294 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007e9c:	fc040793          	addi	a5,s0,-64
    80007ea0:	00003597          	auipc	a1,0x3
    80007ea4:	79858593          	addi	a1,a1,1944 # 8000b638 <etext+0x638>
    80007ea8:	853e                	mv	a0,a5
    80007eaa:	ffffe097          	auipc	ra,0xffffe
    80007eae:	cbe080e7          	jalr	-834(ra) # 80005b68 <namecmp>
    80007eb2:	87aa                	mv	a5,a0
    80007eb4:	16078b63          	beqz	a5,8000802a <sys_unlink+0x1f2>
    80007eb8:	fc040793          	addi	a5,s0,-64
    80007ebc:	00003597          	auipc	a1,0x3
    80007ec0:	78458593          	addi	a1,a1,1924 # 8000b640 <etext+0x640>
    80007ec4:	853e                	mv	a0,a5
    80007ec6:	ffffe097          	auipc	ra,0xffffe
    80007eca:	ca2080e7          	jalr	-862(ra) # 80005b68 <namecmp>
    80007ece:	87aa                	mv	a5,a0
    80007ed0:	14078d63          	beqz	a5,8000802a <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007ed4:	f3c40713          	addi	a4,s0,-196
    80007ed8:	fc040793          	addi	a5,s0,-64
    80007edc:	863a                	mv	a2,a4
    80007ede:	85be                	mv	a1,a5
    80007ee0:	fe843503          	ld	a0,-24(s0)
    80007ee4:	ffffe097          	auipc	ra,0xffffe
    80007ee8:	cb2080e7          	jalr	-846(ra) # 80005b96 <dirlookup>
    80007eec:	fea43023          	sd	a0,-32(s0)
    80007ef0:	fe043783          	ld	a5,-32(s0)
    80007ef4:	12078d63          	beqz	a5,8000802e <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007ef8:	fe043503          	ld	a0,-32(s0)
    80007efc:	ffffd097          	auipc	ra,0xffffd
    80007f00:	398080e7          	jalr	920(ra) # 80005294 <ilock>

  if(ip->nlink < 1)
    80007f04:	fe043783          	ld	a5,-32(s0)
    80007f08:	04a79783          	lh	a5,74(a5)
    80007f0c:	2781                	sext.w	a5,a5
    80007f0e:	00f04a63          	bgtz	a5,80007f22 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007f12:	00003517          	auipc	a0,0x3
    80007f16:	73650513          	addi	a0,a0,1846 # 8000b648 <etext+0x648>
    80007f1a:	ffff9097          	auipc	ra,0xffff9
    80007f1e:	d38080e7          	jalr	-712(ra) # 80000c52 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007f22:	fe043783          	ld	a5,-32(s0)
    80007f26:	04479783          	lh	a5,68(a5)
    80007f2a:	0007871b          	sext.w	a4,a5
    80007f2e:	4785                	li	a5,1
    80007f30:	02f71163          	bne	a4,a5,80007f52 <sys_unlink+0x11a>
    80007f34:	fe043503          	ld	a0,-32(s0)
    80007f38:	00000097          	auipc	ra,0x0
    80007f3c:	e86080e7          	jalr	-378(ra) # 80007dbe <isdirempty>
    80007f40:	87aa                	mv	a5,a0
    80007f42:	eb81                	bnez	a5,80007f52 <sys_unlink+0x11a>
    iunlockput(ip);
    80007f44:	fe043503          	ld	a0,-32(s0)
    80007f48:	ffffd097          	auipc	ra,0xffffd
    80007f4c:	5aa080e7          	jalr	1450(ra) # 800054f2 <iunlockput>
    goto bad;
    80007f50:	a0c5                	j	80008030 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007f52:	fd040793          	addi	a5,s0,-48
    80007f56:	4641                	li	a2,16
    80007f58:	4581                	li	a1,0
    80007f5a:	853e                	mv	a0,a5
    80007f5c:	ffff9097          	auipc	ra,0xffff9
    80007f60:	4f8080e7          	jalr	1272(ra) # 80001454 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007f64:	fd040793          	addi	a5,s0,-48
    80007f68:	f3c42683          	lw	a3,-196(s0)
    80007f6c:	4741                	li	a4,16
    80007f6e:	863e                	mv	a2,a5
    80007f70:	4581                	li	a1,0
    80007f72:	fe843503          	ld	a0,-24(s0)
    80007f76:	ffffe097          	auipc	ra,0xffffe
    80007f7a:	a3e080e7          	jalr	-1474(ra) # 800059b4 <writei>
    80007f7e:	87aa                	mv	a5,a0
    80007f80:	873e                	mv	a4,a5
    80007f82:	47c1                	li	a5,16
    80007f84:	00f70a63          	beq	a4,a5,80007f98 <sys_unlink+0x160>
    panic("unlink: writei");
    80007f88:	00003517          	auipc	a0,0x3
    80007f8c:	6d850513          	addi	a0,a0,1752 # 8000b660 <etext+0x660>
    80007f90:	ffff9097          	auipc	ra,0xffff9
    80007f94:	cc2080e7          	jalr	-830(ra) # 80000c52 <panic>
  if(ip->type == T_DIR){
    80007f98:	fe043783          	ld	a5,-32(s0)
    80007f9c:	04479783          	lh	a5,68(a5)
    80007fa0:	0007871b          	sext.w	a4,a5
    80007fa4:	4785                	li	a5,1
    80007fa6:	02f71963          	bne	a4,a5,80007fd8 <sys_unlink+0x1a0>
    dp->nlink--;
    80007faa:	fe843783          	ld	a5,-24(s0)
    80007fae:	04a79783          	lh	a5,74(a5)
    80007fb2:	17c2                	slli	a5,a5,0x30
    80007fb4:	93c1                	srli	a5,a5,0x30
    80007fb6:	37fd                	addiw	a5,a5,-1
    80007fb8:	17c2                	slli	a5,a5,0x30
    80007fba:	93c1                	srli	a5,a5,0x30
    80007fbc:	0107971b          	slliw	a4,a5,0x10
    80007fc0:	4107571b          	sraiw	a4,a4,0x10
    80007fc4:	fe843783          	ld	a5,-24(s0)
    80007fc8:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007fcc:	fe843503          	ld	a0,-24(s0)
    80007fd0:	ffffd097          	auipc	ra,0xffffd
    80007fd4:	074080e7          	jalr	116(ra) # 80005044 <iupdate>
  }
  iunlockput(dp);
    80007fd8:	fe843503          	ld	a0,-24(s0)
    80007fdc:	ffffd097          	auipc	ra,0xffffd
    80007fe0:	516080e7          	jalr	1302(ra) # 800054f2 <iunlockput>

  ip->nlink--;
    80007fe4:	fe043783          	ld	a5,-32(s0)
    80007fe8:	04a79783          	lh	a5,74(a5)
    80007fec:	17c2                	slli	a5,a5,0x30
    80007fee:	93c1                	srli	a5,a5,0x30
    80007ff0:	37fd                	addiw	a5,a5,-1
    80007ff2:	17c2                	slli	a5,a5,0x30
    80007ff4:	93c1                	srli	a5,a5,0x30
    80007ff6:	0107971b          	slliw	a4,a5,0x10
    80007ffa:	4107571b          	sraiw	a4,a4,0x10
    80007ffe:	fe043783          	ld	a5,-32(s0)
    80008002:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008006:	fe043503          	ld	a0,-32(s0)
    8000800a:	ffffd097          	auipc	ra,0xffffd
    8000800e:	03a080e7          	jalr	58(ra) # 80005044 <iupdate>
  iunlockput(ip);
    80008012:	fe043503          	ld	a0,-32(s0)
    80008016:	ffffd097          	auipc	ra,0xffffd
    8000801a:	4dc080e7          	jalr	1244(ra) # 800054f2 <iunlockput>

  end_op();
    8000801e:	ffffe097          	auipc	ra,0xffffe
    80008022:	3a0080e7          	jalr	928(ra) # 800063be <end_op>

  return 0;
    80008026:	4781                	li	a5,0
    80008028:	a839                	j	80008046 <sys_unlink+0x20e>
    goto bad;
    8000802a:	0001                	nop
    8000802c:	a011                	j	80008030 <sys_unlink+0x1f8>
    goto bad;
    8000802e:	0001                	nop

bad:
  iunlockput(dp);
    80008030:	fe843503          	ld	a0,-24(s0)
    80008034:	ffffd097          	auipc	ra,0xffffd
    80008038:	4be080e7          	jalr	1214(ra) # 800054f2 <iunlockput>
  end_op();
    8000803c:	ffffe097          	auipc	ra,0xffffe
    80008040:	382080e7          	jalr	898(ra) # 800063be <end_op>
  return -1;
    80008044:	57fd                	li	a5,-1
}
    80008046:	853e                	mv	a0,a5
    80008048:	60ae                	ld	ra,200(sp)
    8000804a:	640e                	ld	s0,192(sp)
    8000804c:	6169                	addi	sp,sp,208
    8000804e:	8082                	ret

0000000080008050 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008050:	7139                	addi	sp,sp,-64
    80008052:	fc06                	sd	ra,56(sp)
    80008054:	f822                	sd	s0,48(sp)
    80008056:	0080                	addi	s0,sp,64
    80008058:	fca43423          	sd	a0,-56(s0)
    8000805c:	87ae                	mv	a5,a1
    8000805e:	8736                	mv	a4,a3
    80008060:	fcf41323          	sh	a5,-58(s0)
    80008064:	87b2                	mv	a5,a2
    80008066:	fcf41223          	sh	a5,-60(s0)
    8000806a:	87ba                	mv	a5,a4
    8000806c:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008070:	fd040793          	addi	a5,s0,-48
    80008074:	85be                	mv	a1,a5
    80008076:	fc843503          	ld	a0,-56(s0)
    8000807a:	ffffe097          	auipc	ra,0xffffe
    8000807e:	f4a080e7          	jalr	-182(ra) # 80005fc4 <nameiparent>
    80008082:	fea43423          	sd	a0,-24(s0)
    80008086:	fe843783          	ld	a5,-24(s0)
    8000808a:	e399                	bnez	a5,80008090 <create+0x40>
    return 0;
    8000808c:	4781                	li	a5,0
    8000808e:	a2d9                	j	80008254 <create+0x204>

  ilock(dp);
    80008090:	fe843503          	ld	a0,-24(s0)
    80008094:	ffffd097          	auipc	ra,0xffffd
    80008098:	200080e7          	jalr	512(ra) # 80005294 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    8000809c:	fd040793          	addi	a5,s0,-48
    800080a0:	4601                	li	a2,0
    800080a2:	85be                	mv	a1,a5
    800080a4:	fe843503          	ld	a0,-24(s0)
    800080a8:	ffffe097          	auipc	ra,0xffffe
    800080ac:	aee080e7          	jalr	-1298(ra) # 80005b96 <dirlookup>
    800080b0:	fea43023          	sd	a0,-32(s0)
    800080b4:	fe043783          	ld	a5,-32(s0)
    800080b8:	c3ad                	beqz	a5,8000811a <create+0xca>
    iunlockput(dp);
    800080ba:	fe843503          	ld	a0,-24(s0)
    800080be:	ffffd097          	auipc	ra,0xffffd
    800080c2:	434080e7          	jalr	1076(ra) # 800054f2 <iunlockput>
    ilock(ip);
    800080c6:	fe043503          	ld	a0,-32(s0)
    800080ca:	ffffd097          	auipc	ra,0xffffd
    800080ce:	1ca080e7          	jalr	458(ra) # 80005294 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    800080d2:	fc641783          	lh	a5,-58(s0)
    800080d6:	0007871b          	sext.w	a4,a5
    800080da:	4789                	li	a5,2
    800080dc:	02f71763          	bne	a4,a5,8000810a <create+0xba>
    800080e0:	fe043783          	ld	a5,-32(s0)
    800080e4:	04479783          	lh	a5,68(a5)
    800080e8:	0007871b          	sext.w	a4,a5
    800080ec:	4789                	li	a5,2
    800080ee:	00f70b63          	beq	a4,a5,80008104 <create+0xb4>
    800080f2:	fe043783          	ld	a5,-32(s0)
    800080f6:	04479783          	lh	a5,68(a5)
    800080fa:	0007871b          	sext.w	a4,a5
    800080fe:	478d                	li	a5,3
    80008100:	00f71563          	bne	a4,a5,8000810a <create+0xba>
      return ip;
    80008104:	fe043783          	ld	a5,-32(s0)
    80008108:	a2b1                	j	80008254 <create+0x204>
    iunlockput(ip);
    8000810a:	fe043503          	ld	a0,-32(s0)
    8000810e:	ffffd097          	auipc	ra,0xffffd
    80008112:	3e4080e7          	jalr	996(ra) # 800054f2 <iunlockput>
    return 0;
    80008116:	4781                	li	a5,0
    80008118:	aa35                	j	80008254 <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    8000811a:	fe843783          	ld	a5,-24(s0)
    8000811e:	439c                	lw	a5,0(a5)
    80008120:	fc641703          	lh	a4,-58(s0)
    80008124:	85ba                	mv	a1,a4
    80008126:	853e                	mv	a0,a5
    80008128:	ffffd097          	auipc	ra,0xffffd
    8000812c:	e20080e7          	jalr	-480(ra) # 80004f48 <ialloc>
    80008130:	fea43023          	sd	a0,-32(s0)
    80008134:	fe043783          	ld	a5,-32(s0)
    80008138:	eb89                	bnez	a5,8000814a <create+0xfa>
    panic("create: ialloc");
    8000813a:	00003517          	auipc	a0,0x3
    8000813e:	53650513          	addi	a0,a0,1334 # 8000b670 <etext+0x670>
    80008142:	ffff9097          	auipc	ra,0xffff9
    80008146:	b10080e7          	jalr	-1264(ra) # 80000c52 <panic>

  ilock(ip);
    8000814a:	fe043503          	ld	a0,-32(s0)
    8000814e:	ffffd097          	auipc	ra,0xffffd
    80008152:	146080e7          	jalr	326(ra) # 80005294 <ilock>
  ip->major = major;
    80008156:	fe043783          	ld	a5,-32(s0)
    8000815a:	fc445703          	lhu	a4,-60(s0)
    8000815e:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80008162:	fe043783          	ld	a5,-32(s0)
    80008166:	fc245703          	lhu	a4,-62(s0)
    8000816a:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    8000816e:	fe043783          	ld	a5,-32(s0)
    80008172:	4705                	li	a4,1
    80008174:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008178:	fe043503          	ld	a0,-32(s0)
    8000817c:	ffffd097          	auipc	ra,0xffffd
    80008180:	ec8080e7          	jalr	-312(ra) # 80005044 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008184:	fc641783          	lh	a5,-58(s0)
    80008188:	0007871b          	sext.w	a4,a5
    8000818c:	4785                	li	a5,1
    8000818e:	08f71363          	bne	a4,a5,80008214 <create+0x1c4>
    dp->nlink++;  // for ".."
    80008192:	fe843783          	ld	a5,-24(s0)
    80008196:	04a79783          	lh	a5,74(a5)
    8000819a:	17c2                	slli	a5,a5,0x30
    8000819c:	93c1                	srli	a5,a5,0x30
    8000819e:	2785                	addiw	a5,a5,1
    800081a0:	17c2                	slli	a5,a5,0x30
    800081a2:	93c1                	srli	a5,a5,0x30
    800081a4:	0107971b          	slliw	a4,a5,0x10
    800081a8:	4107571b          	sraiw	a4,a4,0x10
    800081ac:	fe843783          	ld	a5,-24(s0)
    800081b0:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800081b4:	fe843503          	ld	a0,-24(s0)
    800081b8:	ffffd097          	auipc	ra,0xffffd
    800081bc:	e8c080e7          	jalr	-372(ra) # 80005044 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800081c0:	fe043783          	ld	a5,-32(s0)
    800081c4:	43dc                	lw	a5,4(a5)
    800081c6:	863e                	mv	a2,a5
    800081c8:	00003597          	auipc	a1,0x3
    800081cc:	47058593          	addi	a1,a1,1136 # 8000b638 <etext+0x638>
    800081d0:	fe043503          	ld	a0,-32(s0)
    800081d4:	ffffe097          	auipc	ra,0xffffe
    800081d8:	aaa080e7          	jalr	-1366(ra) # 80005c7e <dirlink>
    800081dc:	87aa                	mv	a5,a0
    800081de:	0207c363          	bltz	a5,80008204 <create+0x1b4>
    800081e2:	fe843783          	ld	a5,-24(s0)
    800081e6:	43dc                	lw	a5,4(a5)
    800081e8:	863e                	mv	a2,a5
    800081ea:	00003597          	auipc	a1,0x3
    800081ee:	45658593          	addi	a1,a1,1110 # 8000b640 <etext+0x640>
    800081f2:	fe043503          	ld	a0,-32(s0)
    800081f6:	ffffe097          	auipc	ra,0xffffe
    800081fa:	a88080e7          	jalr	-1400(ra) # 80005c7e <dirlink>
    800081fe:	87aa                	mv	a5,a0
    80008200:	0007da63          	bgez	a5,80008214 <create+0x1c4>
      panic("create dots");
    80008204:	00003517          	auipc	a0,0x3
    80008208:	47c50513          	addi	a0,a0,1148 # 8000b680 <etext+0x680>
    8000820c:	ffff9097          	auipc	ra,0xffff9
    80008210:	a46080e7          	jalr	-1466(ra) # 80000c52 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008214:	fe043783          	ld	a5,-32(s0)
    80008218:	43d8                	lw	a4,4(a5)
    8000821a:	fd040793          	addi	a5,s0,-48
    8000821e:	863a                	mv	a2,a4
    80008220:	85be                	mv	a1,a5
    80008222:	fe843503          	ld	a0,-24(s0)
    80008226:	ffffe097          	auipc	ra,0xffffe
    8000822a:	a58080e7          	jalr	-1448(ra) # 80005c7e <dirlink>
    8000822e:	87aa                	mv	a5,a0
    80008230:	0007da63          	bgez	a5,80008244 <create+0x1f4>
    panic("create: dirlink");
    80008234:	00003517          	auipc	a0,0x3
    80008238:	45c50513          	addi	a0,a0,1116 # 8000b690 <etext+0x690>
    8000823c:	ffff9097          	auipc	ra,0xffff9
    80008240:	a16080e7          	jalr	-1514(ra) # 80000c52 <panic>

  iunlockput(dp);
    80008244:	fe843503          	ld	a0,-24(s0)
    80008248:	ffffd097          	auipc	ra,0xffffd
    8000824c:	2aa080e7          	jalr	682(ra) # 800054f2 <iunlockput>

  return ip;
    80008250:	fe043783          	ld	a5,-32(s0)
}
    80008254:	853e                	mv	a0,a5
    80008256:	70e2                	ld	ra,56(sp)
    80008258:	7442                	ld	s0,48(sp)
    8000825a:	6121                	addi	sp,sp,64
    8000825c:	8082                	ret

000000008000825e <sys_open>:

uint64
sys_open(void)
{
    8000825e:	7131                	addi	sp,sp,-192
    80008260:	fd06                	sd	ra,184(sp)
    80008262:	f922                	sd	s0,176(sp)
    80008264:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008266:	f5040793          	addi	a5,s0,-176
    8000826a:	08000613          	li	a2,128
    8000826e:	85be                	mv	a1,a5
    80008270:	4501                	li	a0,0
    80008272:	ffffc097          	auipc	ra,0xffffc
    80008276:	0bc080e7          	jalr	188(ra) # 8000432e <argstr>
    8000827a:	87aa                	mv	a5,a0
    8000827c:	fef42223          	sw	a5,-28(s0)
    80008280:	fe442783          	lw	a5,-28(s0)
    80008284:	2781                	sext.w	a5,a5
    80008286:	0007cd63          	bltz	a5,800082a0 <sys_open+0x42>
    8000828a:	f4c40793          	addi	a5,s0,-180
    8000828e:	85be                	mv	a1,a5
    80008290:	4505                	li	a0,1
    80008292:	ffffc097          	auipc	ra,0xffffc
    80008296:	030080e7          	jalr	48(ra) # 800042c2 <argint>
    8000829a:	87aa                	mv	a5,a0
    8000829c:	0007d463          	bgez	a5,800082a4 <sys_open+0x46>
    return -1;
    800082a0:	57fd                	li	a5,-1
    800082a2:	a429                	j	800084ac <sys_open+0x24e>

  begin_op();
    800082a4:	ffffe097          	auipc	ra,0xffffe
    800082a8:	058080e7          	jalr	88(ra) # 800062fc <begin_op>

  if(omode & O_CREATE){
    800082ac:	f4c42783          	lw	a5,-180(s0)
    800082b0:	2007f793          	andi	a5,a5,512
    800082b4:	2781                	sext.w	a5,a5
    800082b6:	c795                	beqz	a5,800082e2 <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    800082b8:	f5040793          	addi	a5,s0,-176
    800082bc:	4681                	li	a3,0
    800082be:	4601                	li	a2,0
    800082c0:	4589                	li	a1,2
    800082c2:	853e                	mv	a0,a5
    800082c4:	00000097          	auipc	ra,0x0
    800082c8:	d8c080e7          	jalr	-628(ra) # 80008050 <create>
    800082cc:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800082d0:	fe843783          	ld	a5,-24(s0)
    800082d4:	e7bd                	bnez	a5,80008342 <sys_open+0xe4>
      end_op();
    800082d6:	ffffe097          	auipc	ra,0xffffe
    800082da:	0e8080e7          	jalr	232(ra) # 800063be <end_op>
      return -1;
    800082de:	57fd                	li	a5,-1
    800082e0:	a2f1                	j	800084ac <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    800082e2:	f5040793          	addi	a5,s0,-176
    800082e6:	853e                	mv	a0,a5
    800082e8:	ffffe097          	auipc	ra,0xffffe
    800082ec:	cb0080e7          	jalr	-848(ra) # 80005f98 <namei>
    800082f0:	fea43423          	sd	a0,-24(s0)
    800082f4:	fe843783          	ld	a5,-24(s0)
    800082f8:	e799                	bnez	a5,80008306 <sys_open+0xa8>
      end_op();
    800082fa:	ffffe097          	auipc	ra,0xffffe
    800082fe:	0c4080e7          	jalr	196(ra) # 800063be <end_op>
      return -1;
    80008302:	57fd                	li	a5,-1
    80008304:	a265                	j	800084ac <sys_open+0x24e>
    }
    ilock(ip);
    80008306:	fe843503          	ld	a0,-24(s0)
    8000830a:	ffffd097          	auipc	ra,0xffffd
    8000830e:	f8a080e7          	jalr	-118(ra) # 80005294 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    80008312:	fe843783          	ld	a5,-24(s0)
    80008316:	04479783          	lh	a5,68(a5)
    8000831a:	0007871b          	sext.w	a4,a5
    8000831e:	4785                	li	a5,1
    80008320:	02f71163          	bne	a4,a5,80008342 <sys_open+0xe4>
    80008324:	f4c42783          	lw	a5,-180(s0)
    80008328:	cf89                	beqz	a5,80008342 <sys_open+0xe4>
      iunlockput(ip);
    8000832a:	fe843503          	ld	a0,-24(s0)
    8000832e:	ffffd097          	auipc	ra,0xffffd
    80008332:	1c4080e7          	jalr	452(ra) # 800054f2 <iunlockput>
      end_op();
    80008336:	ffffe097          	auipc	ra,0xffffe
    8000833a:	088080e7          	jalr	136(ra) # 800063be <end_op>
      return -1;
    8000833e:	57fd                	li	a5,-1
    80008340:	a2b5                	j	800084ac <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008342:	fe843783          	ld	a5,-24(s0)
    80008346:	04479783          	lh	a5,68(a5)
    8000834a:	0007871b          	sext.w	a4,a5
    8000834e:	478d                	li	a5,3
    80008350:	02f71e63          	bne	a4,a5,8000838c <sys_open+0x12e>
    80008354:	fe843783          	ld	a5,-24(s0)
    80008358:	04679783          	lh	a5,70(a5)
    8000835c:	2781                	sext.w	a5,a5
    8000835e:	0007cb63          	bltz	a5,80008374 <sys_open+0x116>
    80008362:	fe843783          	ld	a5,-24(s0)
    80008366:	04679783          	lh	a5,70(a5)
    8000836a:	0007871b          	sext.w	a4,a5
    8000836e:	47a5                	li	a5,9
    80008370:	00e7de63          	bge	a5,a4,8000838c <sys_open+0x12e>
    iunlockput(ip);
    80008374:	fe843503          	ld	a0,-24(s0)
    80008378:	ffffd097          	auipc	ra,0xffffd
    8000837c:	17a080e7          	jalr	378(ra) # 800054f2 <iunlockput>
    end_op();
    80008380:	ffffe097          	auipc	ra,0xffffe
    80008384:	03e080e7          	jalr	62(ra) # 800063be <end_op>
    return -1;
    80008388:	57fd                	li	a5,-1
    8000838a:	a20d                	j	800084ac <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000838c:	ffffe097          	auipc	ra,0xffffe
    80008390:	520080e7          	jalr	1312(ra) # 800068ac <filealloc>
    80008394:	fca43c23          	sd	a0,-40(s0)
    80008398:	fd843783          	ld	a5,-40(s0)
    8000839c:	cf99                	beqz	a5,800083ba <sys_open+0x15c>
    8000839e:	fd843503          	ld	a0,-40(s0)
    800083a2:	fffff097          	auipc	ra,0xfffff
    800083a6:	5e8080e7          	jalr	1512(ra) # 8000798a <fdalloc>
    800083aa:	87aa                	mv	a5,a0
    800083ac:	fcf42a23          	sw	a5,-44(s0)
    800083b0:	fd442783          	lw	a5,-44(s0)
    800083b4:	2781                	sext.w	a5,a5
    800083b6:	0207d763          	bgez	a5,800083e4 <sys_open+0x186>
    if(f)
    800083ba:	fd843783          	ld	a5,-40(s0)
    800083be:	c799                	beqz	a5,800083cc <sys_open+0x16e>
      fileclose(f);
    800083c0:	fd843503          	ld	a0,-40(s0)
    800083c4:	ffffe097          	auipc	ra,0xffffe
    800083c8:	5d2080e7          	jalr	1490(ra) # 80006996 <fileclose>
    iunlockput(ip);
    800083cc:	fe843503          	ld	a0,-24(s0)
    800083d0:	ffffd097          	auipc	ra,0xffffd
    800083d4:	122080e7          	jalr	290(ra) # 800054f2 <iunlockput>
    end_op();
    800083d8:	ffffe097          	auipc	ra,0xffffe
    800083dc:	fe6080e7          	jalr	-26(ra) # 800063be <end_op>
    return -1;
    800083e0:	57fd                	li	a5,-1
    800083e2:	a0e9                	j	800084ac <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    800083e4:	fe843783          	ld	a5,-24(s0)
    800083e8:	04479783          	lh	a5,68(a5)
    800083ec:	0007871b          	sext.w	a4,a5
    800083f0:	478d                	li	a5,3
    800083f2:	00f71f63          	bne	a4,a5,80008410 <sys_open+0x1b2>
    f->type = FD_DEVICE;
    800083f6:	fd843783          	ld	a5,-40(s0)
    800083fa:	470d                	li	a4,3
    800083fc:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800083fe:	fe843783          	ld	a5,-24(s0)
    80008402:	04679703          	lh	a4,70(a5)
    80008406:	fd843783          	ld	a5,-40(s0)
    8000840a:	02e79223          	sh	a4,36(a5)
    8000840e:	a809                	j	80008420 <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    80008410:	fd843783          	ld	a5,-40(s0)
    80008414:	4709                	li	a4,2
    80008416:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008418:	fd843783          	ld	a5,-40(s0)
    8000841c:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008420:	fd843783          	ld	a5,-40(s0)
    80008424:	fe843703          	ld	a4,-24(s0)
    80008428:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000842a:	f4c42783          	lw	a5,-180(s0)
    8000842e:	8b85                	andi	a5,a5,1
    80008430:	2781                	sext.w	a5,a5
    80008432:	0017b793          	seqz	a5,a5
    80008436:	0ff7f793          	andi	a5,a5,255
    8000843a:	873e                	mv	a4,a5
    8000843c:	fd843783          	ld	a5,-40(s0)
    80008440:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008444:	f4c42783          	lw	a5,-180(s0)
    80008448:	8b85                	andi	a5,a5,1
    8000844a:	2781                	sext.w	a5,a5
    8000844c:	e791                	bnez	a5,80008458 <sys_open+0x1fa>
    8000844e:	f4c42783          	lw	a5,-180(s0)
    80008452:	8b89                	andi	a5,a5,2
    80008454:	2781                	sext.w	a5,a5
    80008456:	c399                	beqz	a5,8000845c <sys_open+0x1fe>
    80008458:	4785                	li	a5,1
    8000845a:	a011                	j	8000845e <sys_open+0x200>
    8000845c:	4781                	li	a5,0
    8000845e:	0ff7f713          	andi	a4,a5,255
    80008462:	fd843783          	ld	a5,-40(s0)
    80008466:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000846a:	f4c42783          	lw	a5,-180(s0)
    8000846e:	4007f793          	andi	a5,a5,1024
    80008472:	2781                	sext.w	a5,a5
    80008474:	c385                	beqz	a5,80008494 <sys_open+0x236>
    80008476:	fe843783          	ld	a5,-24(s0)
    8000847a:	04479783          	lh	a5,68(a5)
    8000847e:	0007871b          	sext.w	a4,a5
    80008482:	4789                	li	a5,2
    80008484:	00f71863          	bne	a4,a5,80008494 <sys_open+0x236>
    itrunc(ip);
    80008488:	fe843503          	ld	a0,-24(s0)
    8000848c:	ffffd097          	auipc	ra,0xffffd
    80008490:	1f0080e7          	jalr	496(ra) # 8000567c <itrunc>
  }

  iunlock(ip);
    80008494:	fe843503          	ld	a0,-24(s0)
    80008498:	ffffd097          	auipc	ra,0xffffd
    8000849c:	f30080e7          	jalr	-208(ra) # 800053c8 <iunlock>
  end_op();
    800084a0:	ffffe097          	auipc	ra,0xffffe
    800084a4:	f1e080e7          	jalr	-226(ra) # 800063be <end_op>

  return fd;
    800084a8:	fd442783          	lw	a5,-44(s0)
}
    800084ac:	853e                	mv	a0,a5
    800084ae:	70ea                	ld	ra,184(sp)
    800084b0:	744a                	ld	s0,176(sp)
    800084b2:	6129                	addi	sp,sp,192
    800084b4:	8082                	ret

00000000800084b6 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800084b6:	7135                	addi	sp,sp,-160
    800084b8:	ed06                	sd	ra,152(sp)
    800084ba:	e922                	sd	s0,144(sp)
    800084bc:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800084be:	ffffe097          	auipc	ra,0xffffe
    800084c2:	e3e080e7          	jalr	-450(ra) # 800062fc <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800084c6:	f6840793          	addi	a5,s0,-152
    800084ca:	08000613          	li	a2,128
    800084ce:	85be                	mv	a1,a5
    800084d0:	4501                	li	a0,0
    800084d2:	ffffc097          	auipc	ra,0xffffc
    800084d6:	e5c080e7          	jalr	-420(ra) # 8000432e <argstr>
    800084da:	87aa                	mv	a5,a0
    800084dc:	0207c163          	bltz	a5,800084fe <sys_mkdir+0x48>
    800084e0:	f6840793          	addi	a5,s0,-152
    800084e4:	4681                	li	a3,0
    800084e6:	4601                	li	a2,0
    800084e8:	4585                	li	a1,1
    800084ea:	853e                	mv	a0,a5
    800084ec:	00000097          	auipc	ra,0x0
    800084f0:	b64080e7          	jalr	-1180(ra) # 80008050 <create>
    800084f4:	fea43423          	sd	a0,-24(s0)
    800084f8:	fe843783          	ld	a5,-24(s0)
    800084fc:	e799                	bnez	a5,8000850a <sys_mkdir+0x54>
    end_op();
    800084fe:	ffffe097          	auipc	ra,0xffffe
    80008502:	ec0080e7          	jalr	-320(ra) # 800063be <end_op>
    return -1;
    80008506:	57fd                	li	a5,-1
    80008508:	a821                	j	80008520 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    8000850a:	fe843503          	ld	a0,-24(s0)
    8000850e:	ffffd097          	auipc	ra,0xffffd
    80008512:	fe4080e7          	jalr	-28(ra) # 800054f2 <iunlockput>
  end_op();
    80008516:	ffffe097          	auipc	ra,0xffffe
    8000851a:	ea8080e7          	jalr	-344(ra) # 800063be <end_op>
  return 0;
    8000851e:	4781                	li	a5,0
}
    80008520:	853e                	mv	a0,a5
    80008522:	60ea                	ld	ra,152(sp)
    80008524:	644a                	ld	s0,144(sp)
    80008526:	610d                	addi	sp,sp,160
    80008528:	8082                	ret

000000008000852a <sys_mknod>:

uint64
sys_mknod(void)
{
    8000852a:	7135                	addi	sp,sp,-160
    8000852c:	ed06                	sd	ra,152(sp)
    8000852e:	e922                	sd	s0,144(sp)
    80008530:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008532:	ffffe097          	auipc	ra,0xffffe
    80008536:	dca080e7          	jalr	-566(ra) # 800062fc <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000853a:	f6840793          	addi	a5,s0,-152
    8000853e:	08000613          	li	a2,128
    80008542:	85be                	mv	a1,a5
    80008544:	4501                	li	a0,0
    80008546:	ffffc097          	auipc	ra,0xffffc
    8000854a:	de8080e7          	jalr	-536(ra) # 8000432e <argstr>
    8000854e:	87aa                	mv	a5,a0
    80008550:	0607c263          	bltz	a5,800085b4 <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    80008554:	f6440793          	addi	a5,s0,-156
    80008558:	85be                	mv	a1,a5
    8000855a:	4505                	li	a0,1
    8000855c:	ffffc097          	auipc	ra,0xffffc
    80008560:	d66080e7          	jalr	-666(ra) # 800042c2 <argint>
    80008564:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008566:	0407c763          	bltz	a5,800085b4 <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    8000856a:	f6040793          	addi	a5,s0,-160
    8000856e:	85be                	mv	a1,a5
    80008570:	4509                	li	a0,2
    80008572:	ffffc097          	auipc	ra,0xffffc
    80008576:	d50080e7          	jalr	-688(ra) # 800042c2 <argint>
    8000857a:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    8000857c:	0207cc63          	bltz	a5,800085b4 <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008580:	f6442783          	lw	a5,-156(s0)
    80008584:	0107971b          	slliw	a4,a5,0x10
    80008588:	4107571b          	sraiw	a4,a4,0x10
    8000858c:	f6042783          	lw	a5,-160(s0)
    80008590:	0107969b          	slliw	a3,a5,0x10
    80008594:	4106d69b          	sraiw	a3,a3,0x10
    80008598:	f6840793          	addi	a5,s0,-152
    8000859c:	863a                	mv	a2,a4
    8000859e:	458d                	li	a1,3
    800085a0:	853e                	mv	a0,a5
    800085a2:	00000097          	auipc	ra,0x0
    800085a6:	aae080e7          	jalr	-1362(ra) # 80008050 <create>
    800085aa:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    800085ae:	fe843783          	ld	a5,-24(s0)
    800085b2:	e799                	bnez	a5,800085c0 <sys_mknod+0x96>
    end_op();
    800085b4:	ffffe097          	auipc	ra,0xffffe
    800085b8:	e0a080e7          	jalr	-502(ra) # 800063be <end_op>
    return -1;
    800085bc:	57fd                	li	a5,-1
    800085be:	a821                	j	800085d6 <sys_mknod+0xac>
  }
  iunlockput(ip);
    800085c0:	fe843503          	ld	a0,-24(s0)
    800085c4:	ffffd097          	auipc	ra,0xffffd
    800085c8:	f2e080e7          	jalr	-210(ra) # 800054f2 <iunlockput>
  end_op();
    800085cc:	ffffe097          	auipc	ra,0xffffe
    800085d0:	df2080e7          	jalr	-526(ra) # 800063be <end_op>
  return 0;
    800085d4:	4781                	li	a5,0
}
    800085d6:	853e                	mv	a0,a5
    800085d8:	60ea                	ld	ra,152(sp)
    800085da:	644a                	ld	s0,144(sp)
    800085dc:	610d                	addi	sp,sp,160
    800085de:	8082                	ret

00000000800085e0 <sys_chdir>:

uint64
sys_chdir(void)
{
    800085e0:	7135                	addi	sp,sp,-160
    800085e2:	ed06                	sd	ra,152(sp)
    800085e4:	e922                	sd	s0,144(sp)
    800085e6:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800085e8:	ffffa097          	auipc	ra,0xffffa
    800085ec:	20a080e7          	jalr	522(ra) # 800027f2 <myproc>
    800085f0:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800085f4:	ffffe097          	auipc	ra,0xffffe
    800085f8:	d08080e7          	jalr	-760(ra) # 800062fc <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800085fc:	f6040793          	addi	a5,s0,-160
    80008600:	08000613          	li	a2,128
    80008604:	85be                	mv	a1,a5
    80008606:	4501                	li	a0,0
    80008608:	ffffc097          	auipc	ra,0xffffc
    8000860c:	d26080e7          	jalr	-730(ra) # 8000432e <argstr>
    80008610:	87aa                	mv	a5,a0
    80008612:	0007ce63          	bltz	a5,8000862e <sys_chdir+0x4e>
    80008616:	f6040793          	addi	a5,s0,-160
    8000861a:	853e                	mv	a0,a5
    8000861c:	ffffe097          	auipc	ra,0xffffe
    80008620:	97c080e7          	jalr	-1668(ra) # 80005f98 <namei>
    80008624:	fea43023          	sd	a0,-32(s0)
    80008628:	fe043783          	ld	a5,-32(s0)
    8000862c:	e799                	bnez	a5,8000863a <sys_chdir+0x5a>
    end_op();
    8000862e:	ffffe097          	auipc	ra,0xffffe
    80008632:	d90080e7          	jalr	-624(ra) # 800063be <end_op>
    return -1;
    80008636:	57fd                	li	a5,-1
    80008638:	a0b5                	j	800086a4 <sys_chdir+0xc4>
  }
  ilock(ip);
    8000863a:	fe043503          	ld	a0,-32(s0)
    8000863e:	ffffd097          	auipc	ra,0xffffd
    80008642:	c56080e7          	jalr	-938(ra) # 80005294 <ilock>
  if(ip->type != T_DIR){
    80008646:	fe043783          	ld	a5,-32(s0)
    8000864a:	04479783          	lh	a5,68(a5)
    8000864e:	0007871b          	sext.w	a4,a5
    80008652:	4785                	li	a5,1
    80008654:	00f70e63          	beq	a4,a5,80008670 <sys_chdir+0x90>
    iunlockput(ip);
    80008658:	fe043503          	ld	a0,-32(s0)
    8000865c:	ffffd097          	auipc	ra,0xffffd
    80008660:	e96080e7          	jalr	-362(ra) # 800054f2 <iunlockput>
    end_op();
    80008664:	ffffe097          	auipc	ra,0xffffe
    80008668:	d5a080e7          	jalr	-678(ra) # 800063be <end_op>
    return -1;
    8000866c:	57fd                	li	a5,-1
    8000866e:	a81d                	j	800086a4 <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008670:	fe043503          	ld	a0,-32(s0)
    80008674:	ffffd097          	auipc	ra,0xffffd
    80008678:	d54080e7          	jalr	-684(ra) # 800053c8 <iunlock>
  iput(p->cwd);
    8000867c:	fe843783          	ld	a5,-24(s0)
    80008680:	1507b783          	ld	a5,336(a5)
    80008684:	853e                	mv	a0,a5
    80008686:	ffffd097          	auipc	ra,0xffffd
    8000868a:	d9c080e7          	jalr	-612(ra) # 80005422 <iput>
  end_op();
    8000868e:	ffffe097          	auipc	ra,0xffffe
    80008692:	d30080e7          	jalr	-720(ra) # 800063be <end_op>
  p->cwd = ip;
    80008696:	fe843783          	ld	a5,-24(s0)
    8000869a:	fe043703          	ld	a4,-32(s0)
    8000869e:	14e7b823          	sd	a4,336(a5)
  return 0;
    800086a2:	4781                	li	a5,0
}
    800086a4:	853e                	mv	a0,a5
    800086a6:	60ea                	ld	ra,152(sp)
    800086a8:	644a                	ld	s0,144(sp)
    800086aa:	610d                	addi	sp,sp,160
    800086ac:	8082                	ret

00000000800086ae <sys_exec>:

uint64
sys_exec(void)
{
    800086ae:	7161                	addi	sp,sp,-432
    800086b0:	f706                	sd	ra,424(sp)
    800086b2:	f322                	sd	s0,416(sp)
    800086b4:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800086b6:	f6840793          	addi	a5,s0,-152
    800086ba:	08000613          	li	a2,128
    800086be:	85be                	mv	a1,a5
    800086c0:	4501                	li	a0,0
    800086c2:	ffffc097          	auipc	ra,0xffffc
    800086c6:	c6c080e7          	jalr	-916(ra) # 8000432e <argstr>
    800086ca:	87aa                	mv	a5,a0
    800086cc:	0007cd63          	bltz	a5,800086e6 <sys_exec+0x38>
    800086d0:	e6040793          	addi	a5,s0,-416
    800086d4:	85be                	mv	a1,a5
    800086d6:	4505                	li	a0,1
    800086d8:	ffffc097          	auipc	ra,0xffffc
    800086dc:	c22080e7          	jalr	-990(ra) # 800042fa <argaddr>
    800086e0:	87aa                	mv	a5,a0
    800086e2:	0007d463          	bgez	a5,800086ea <sys_exec+0x3c>
    return -1;
    800086e6:	57fd                	li	a5,-1
    800086e8:	a249                	j	8000886a <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    800086ea:	e6840793          	addi	a5,s0,-408
    800086ee:	10000613          	li	a2,256
    800086f2:	4581                	li	a1,0
    800086f4:	853e                	mv	a0,a5
    800086f6:	ffff9097          	auipc	ra,0xffff9
    800086fa:	d5e080e7          	jalr	-674(ra) # 80001454 <memset>
  for(i=0;; i++){
    800086fe:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008702:	fec42783          	lw	a5,-20(s0)
    80008706:	873e                	mv	a4,a5
    80008708:	47fd                	li	a5,31
    8000870a:	10e7e463          	bltu	a5,a4,80008812 <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8000870e:	fec42783          	lw	a5,-20(s0)
    80008712:	00379713          	slli	a4,a5,0x3
    80008716:	e6043783          	ld	a5,-416(s0)
    8000871a:	97ba                	add	a5,a5,a4
    8000871c:	e5840713          	addi	a4,s0,-424
    80008720:	85ba                	mv	a1,a4
    80008722:	853e                	mv	a0,a5
    80008724:	ffffc097          	auipc	ra,0xffffc
    80008728:	a20080e7          	jalr	-1504(ra) # 80004144 <fetchaddr>
    8000872c:	87aa                	mv	a5,a0
    8000872e:	0e07c463          	bltz	a5,80008816 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    80008732:	e5843783          	ld	a5,-424(s0)
    80008736:	eb95                	bnez	a5,8000876a <sys_exec+0xbc>
      argv[i] = 0;
    80008738:	fec42783          	lw	a5,-20(s0)
    8000873c:	078e                	slli	a5,a5,0x3
    8000873e:	ff040713          	addi	a4,s0,-16
    80008742:	97ba                	add	a5,a5,a4
    80008744:	e607bc23          	sd	zero,-392(a5)
      break;
    80008748:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    8000874a:	e6840713          	addi	a4,s0,-408
    8000874e:	f6840793          	addi	a5,s0,-152
    80008752:	85ba                	mv	a1,a4
    80008754:	853e                	mv	a0,a5
    80008756:	fffff097          	auipc	ra,0xfffff
    8000875a:	bfe080e7          	jalr	-1026(ra) # 80007354 <exec>
    8000875e:	87aa                	mv	a5,a0
    80008760:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008764:	fe042623          	sw	zero,-20(s0)
    80008768:	a059                	j	800087ee <sys_exec+0x140>
    argv[i] = kalloc();
    8000876a:	ffff9097          	auipc	ra,0xffff9
    8000876e:	9c2080e7          	jalr	-1598(ra) # 8000112c <kalloc>
    80008772:	872a                	mv	a4,a0
    80008774:	fec42783          	lw	a5,-20(s0)
    80008778:	078e                	slli	a5,a5,0x3
    8000877a:	ff040693          	addi	a3,s0,-16
    8000877e:	97b6                	add	a5,a5,a3
    80008780:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008784:	fec42783          	lw	a5,-20(s0)
    80008788:	078e                	slli	a5,a5,0x3
    8000878a:	ff040713          	addi	a4,s0,-16
    8000878e:	97ba                	add	a5,a5,a4
    80008790:	e787b783          	ld	a5,-392(a5)
    80008794:	c3d9                	beqz	a5,8000881a <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008796:	e5843703          	ld	a4,-424(s0)
    8000879a:	fec42783          	lw	a5,-20(s0)
    8000879e:	078e                	slli	a5,a5,0x3
    800087a0:	ff040693          	addi	a3,s0,-16
    800087a4:	97b6                	add	a5,a5,a3
    800087a6:	e787b783          	ld	a5,-392(a5)
    800087aa:	6605                	lui	a2,0x1
    800087ac:	85be                	mv	a1,a5
    800087ae:	853a                	mv	a0,a4
    800087b0:	ffffc097          	auipc	ra,0xffffc
    800087b4:	a02080e7          	jalr	-1534(ra) # 800041b2 <fetchstr>
    800087b8:	87aa                	mv	a5,a0
    800087ba:	0607c263          	bltz	a5,8000881e <sys_exec+0x170>
  for(i=0;; i++){
    800087be:	fec42783          	lw	a5,-20(s0)
    800087c2:	2785                	addiw	a5,a5,1
    800087c4:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800087c8:	bf2d                	j	80008702 <sys_exec+0x54>
    kfree(argv[i]);
    800087ca:	fec42783          	lw	a5,-20(s0)
    800087ce:	078e                	slli	a5,a5,0x3
    800087d0:	ff040713          	addi	a4,s0,-16
    800087d4:	97ba                	add	a5,a5,a4
    800087d6:	e787b783          	ld	a5,-392(a5)
    800087da:	853e                	mv	a0,a5
    800087dc:	ffff9097          	auipc	ra,0xffff9
    800087e0:	8ac080e7          	jalr	-1876(ra) # 80001088 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800087e4:	fec42783          	lw	a5,-20(s0)
    800087e8:	2785                	addiw	a5,a5,1
    800087ea:	fef42623          	sw	a5,-20(s0)
    800087ee:	fec42783          	lw	a5,-20(s0)
    800087f2:	873e                	mv	a4,a5
    800087f4:	47fd                	li	a5,31
    800087f6:	00e7eb63          	bltu	a5,a4,8000880c <sys_exec+0x15e>
    800087fa:	fec42783          	lw	a5,-20(s0)
    800087fe:	078e                	slli	a5,a5,0x3
    80008800:	ff040713          	addi	a4,s0,-16
    80008804:	97ba                	add	a5,a5,a4
    80008806:	e787b783          	ld	a5,-392(a5)
    8000880a:	f3e1                	bnez	a5,800087ca <sys_exec+0x11c>

  return ret;
    8000880c:	fe842783          	lw	a5,-24(s0)
    80008810:	a8a9                	j	8000886a <sys_exec+0x1bc>
      goto bad;
    80008812:	0001                	nop
    80008814:	a031                	j	80008820 <sys_exec+0x172>
      goto bad;
    80008816:	0001                	nop
    80008818:	a021                	j	80008820 <sys_exec+0x172>
      goto bad;
    8000881a:	0001                	nop
    8000881c:	a011                	j	80008820 <sys_exec+0x172>
      goto bad;
    8000881e:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008820:	fe042623          	sw	zero,-20(s0)
    80008824:	a01d                	j	8000884a <sys_exec+0x19c>
    kfree(argv[i]);
    80008826:	fec42783          	lw	a5,-20(s0)
    8000882a:	078e                	slli	a5,a5,0x3
    8000882c:	ff040713          	addi	a4,s0,-16
    80008830:	97ba                	add	a5,a5,a4
    80008832:	e787b783          	ld	a5,-392(a5)
    80008836:	853e                	mv	a0,a5
    80008838:	ffff9097          	auipc	ra,0xffff9
    8000883c:	850080e7          	jalr	-1968(ra) # 80001088 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008840:	fec42783          	lw	a5,-20(s0)
    80008844:	2785                	addiw	a5,a5,1
    80008846:	fef42623          	sw	a5,-20(s0)
    8000884a:	fec42783          	lw	a5,-20(s0)
    8000884e:	873e                	mv	a4,a5
    80008850:	47fd                	li	a5,31
    80008852:	00e7eb63          	bltu	a5,a4,80008868 <sys_exec+0x1ba>
    80008856:	fec42783          	lw	a5,-20(s0)
    8000885a:	078e                	slli	a5,a5,0x3
    8000885c:	ff040713          	addi	a4,s0,-16
    80008860:	97ba                	add	a5,a5,a4
    80008862:	e787b783          	ld	a5,-392(a5)
    80008866:	f3e1                	bnez	a5,80008826 <sys_exec+0x178>
  return -1;
    80008868:	57fd                	li	a5,-1
}
    8000886a:	853e                	mv	a0,a5
    8000886c:	70ba                	ld	ra,424(sp)
    8000886e:	741a                	ld	s0,416(sp)
    80008870:	615d                	addi	sp,sp,432
    80008872:	8082                	ret

0000000080008874 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008874:	7139                	addi	sp,sp,-64
    80008876:	fc06                	sd	ra,56(sp)
    80008878:	f822                	sd	s0,48(sp)
    8000887a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    8000887c:	ffffa097          	auipc	ra,0xffffa
    80008880:	f76080e7          	jalr	-138(ra) # 800027f2 <myproc>
    80008884:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008888:	fe040793          	addi	a5,s0,-32
    8000888c:	85be                	mv	a1,a5
    8000888e:	4501                	li	a0,0
    80008890:	ffffc097          	auipc	ra,0xffffc
    80008894:	a6a080e7          	jalr	-1430(ra) # 800042fa <argaddr>
    80008898:	87aa                	mv	a5,a0
    8000889a:	0007d463          	bgez	a5,800088a2 <sys_pipe+0x2e>
    return -1;
    8000889e:	57fd                	li	a5,-1
    800088a0:	a215                	j	800089c4 <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    800088a2:	fd040713          	addi	a4,s0,-48
    800088a6:	fd840793          	addi	a5,s0,-40
    800088aa:	85ba                	mv	a1,a4
    800088ac:	853e                	mv	a0,a5
    800088ae:	ffffe097          	auipc	ra,0xffffe
    800088b2:	618080e7          	jalr	1560(ra) # 80006ec6 <pipealloc>
    800088b6:	87aa                	mv	a5,a0
    800088b8:	0007d463          	bgez	a5,800088c0 <sys_pipe+0x4c>
    return -1;
    800088bc:	57fd                	li	a5,-1
    800088be:	a219                	j	800089c4 <sys_pipe+0x150>
  fd0 = -1;
    800088c0:	57fd                	li	a5,-1
    800088c2:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    800088c6:	fd843783          	ld	a5,-40(s0)
    800088ca:	853e                	mv	a0,a5
    800088cc:	fffff097          	auipc	ra,0xfffff
    800088d0:	0be080e7          	jalr	190(ra) # 8000798a <fdalloc>
    800088d4:	87aa                	mv	a5,a0
    800088d6:	fcf42623          	sw	a5,-52(s0)
    800088da:	fcc42783          	lw	a5,-52(s0)
    800088de:	0207c063          	bltz	a5,800088fe <sys_pipe+0x8a>
    800088e2:	fd043783          	ld	a5,-48(s0)
    800088e6:	853e                	mv	a0,a5
    800088e8:	fffff097          	auipc	ra,0xfffff
    800088ec:	0a2080e7          	jalr	162(ra) # 8000798a <fdalloc>
    800088f0:	87aa                	mv	a5,a0
    800088f2:	fcf42423          	sw	a5,-56(s0)
    800088f6:	fc842783          	lw	a5,-56(s0)
    800088fa:	0207df63          	bgez	a5,80008938 <sys_pipe+0xc4>
    if(fd0 >= 0)
    800088fe:	fcc42783          	lw	a5,-52(s0)
    80008902:	0007cb63          	bltz	a5,80008918 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008906:	fcc42783          	lw	a5,-52(s0)
    8000890a:	fe843703          	ld	a4,-24(s0)
    8000890e:	07e9                	addi	a5,a5,26
    80008910:	078e                	slli	a5,a5,0x3
    80008912:	97ba                	add	a5,a5,a4
    80008914:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008918:	fd843783          	ld	a5,-40(s0)
    8000891c:	853e                	mv	a0,a5
    8000891e:	ffffe097          	auipc	ra,0xffffe
    80008922:	078080e7          	jalr	120(ra) # 80006996 <fileclose>
    fileclose(wf);
    80008926:	fd043783          	ld	a5,-48(s0)
    8000892a:	853e                	mv	a0,a5
    8000892c:	ffffe097          	auipc	ra,0xffffe
    80008930:	06a080e7          	jalr	106(ra) # 80006996 <fileclose>
    return -1;
    80008934:	57fd                	li	a5,-1
    80008936:	a079                	j	800089c4 <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008938:	fe843783          	ld	a5,-24(s0)
    8000893c:	6bbc                	ld	a5,80(a5)
    8000893e:	fe043703          	ld	a4,-32(s0)
    80008942:	fcc40613          	addi	a2,s0,-52
    80008946:	4691                	li	a3,4
    80008948:	85ba                	mv	a1,a4
    8000894a:	853e                	mv	a0,a5
    8000894c:	ffffa097          	auipc	ra,0xffffa
    80008950:	988080e7          	jalr	-1656(ra) # 800022d4 <copyout>
    80008954:	87aa                	mv	a5,a0
    80008956:	0207c463          	bltz	a5,8000897e <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    8000895a:	fe843783          	ld	a5,-24(s0)
    8000895e:	6bb8                	ld	a4,80(a5)
    80008960:	fe043783          	ld	a5,-32(s0)
    80008964:	0791                	addi	a5,a5,4
    80008966:	fc840613          	addi	a2,s0,-56
    8000896a:	4691                	li	a3,4
    8000896c:	85be                	mv	a1,a5
    8000896e:	853a                	mv	a0,a4
    80008970:	ffffa097          	auipc	ra,0xffffa
    80008974:	964080e7          	jalr	-1692(ra) # 800022d4 <copyout>
    80008978:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8000897a:	0407d463          	bgez	a5,800089c2 <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    8000897e:	fcc42783          	lw	a5,-52(s0)
    80008982:	fe843703          	ld	a4,-24(s0)
    80008986:	07e9                	addi	a5,a5,26
    80008988:	078e                	slli	a5,a5,0x3
    8000898a:	97ba                	add	a5,a5,a4
    8000898c:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008990:	fc842783          	lw	a5,-56(s0)
    80008994:	fe843703          	ld	a4,-24(s0)
    80008998:	07e9                	addi	a5,a5,26
    8000899a:	078e                	slli	a5,a5,0x3
    8000899c:	97ba                	add	a5,a5,a4
    8000899e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800089a2:	fd843783          	ld	a5,-40(s0)
    800089a6:	853e                	mv	a0,a5
    800089a8:	ffffe097          	auipc	ra,0xffffe
    800089ac:	fee080e7          	jalr	-18(ra) # 80006996 <fileclose>
    fileclose(wf);
    800089b0:	fd043783          	ld	a5,-48(s0)
    800089b4:	853e                	mv	a0,a5
    800089b6:	ffffe097          	auipc	ra,0xffffe
    800089ba:	fe0080e7          	jalr	-32(ra) # 80006996 <fileclose>
    return -1;
    800089be:	57fd                	li	a5,-1
    800089c0:	a011                	j	800089c4 <sys_pipe+0x150>
  }
  return 0;
    800089c2:	4781                	li	a5,0
}
    800089c4:	853e                	mv	a0,a5
    800089c6:	70e2                	ld	ra,56(sp)
    800089c8:	7442                	ld	s0,48(sp)
    800089ca:	6121                	addi	sp,sp,64
    800089cc:	8082                	ret
	...

00000000800089d0 <kernelvec>:
    800089d0:	7111                	addi	sp,sp,-256
    800089d2:	e006                	sd	ra,0(sp)
    800089d4:	e40a                	sd	sp,8(sp)
    800089d6:	e80e                	sd	gp,16(sp)
    800089d8:	ec12                	sd	tp,24(sp)
    800089da:	f016                	sd	t0,32(sp)
    800089dc:	f41a                	sd	t1,40(sp)
    800089de:	f81e                	sd	t2,48(sp)
    800089e0:	fc22                	sd	s0,56(sp)
    800089e2:	e0a6                	sd	s1,64(sp)
    800089e4:	e4aa                	sd	a0,72(sp)
    800089e6:	e8ae                	sd	a1,80(sp)
    800089e8:	ecb2                	sd	a2,88(sp)
    800089ea:	f0b6                	sd	a3,96(sp)
    800089ec:	f4ba                	sd	a4,104(sp)
    800089ee:	f8be                	sd	a5,112(sp)
    800089f0:	fcc2                	sd	a6,120(sp)
    800089f2:	e146                	sd	a7,128(sp)
    800089f4:	e54a                	sd	s2,136(sp)
    800089f6:	e94e                	sd	s3,144(sp)
    800089f8:	ed52                	sd	s4,152(sp)
    800089fa:	f156                	sd	s5,160(sp)
    800089fc:	f55a                	sd	s6,168(sp)
    800089fe:	f95e                	sd	s7,176(sp)
    80008a00:	fd62                	sd	s8,184(sp)
    80008a02:	e1e6                	sd	s9,192(sp)
    80008a04:	e5ea                	sd	s10,200(sp)
    80008a06:	e9ee                	sd	s11,208(sp)
    80008a08:	edf2                	sd	t3,216(sp)
    80008a0a:	f1f6                	sd	t4,224(sp)
    80008a0c:	f5fa                	sd	t5,232(sp)
    80008a0e:	f9fe                	sd	t6,240(sp)
    80008a10:	be2fb0ef          	jal	ra,80003df2 <kerneltrap>
    80008a14:	6082                	ld	ra,0(sp)
    80008a16:	6122                	ld	sp,8(sp)
    80008a18:	61c2                	ld	gp,16(sp)
    80008a1a:	7282                	ld	t0,32(sp)
    80008a1c:	7322                	ld	t1,40(sp)
    80008a1e:	73c2                	ld	t2,48(sp)
    80008a20:	7462                	ld	s0,56(sp)
    80008a22:	6486                	ld	s1,64(sp)
    80008a24:	6526                	ld	a0,72(sp)
    80008a26:	65c6                	ld	a1,80(sp)
    80008a28:	6666                	ld	a2,88(sp)
    80008a2a:	7686                	ld	a3,96(sp)
    80008a2c:	7726                	ld	a4,104(sp)
    80008a2e:	77c6                	ld	a5,112(sp)
    80008a30:	7866                	ld	a6,120(sp)
    80008a32:	688a                	ld	a7,128(sp)
    80008a34:	692a                	ld	s2,136(sp)
    80008a36:	69ca                	ld	s3,144(sp)
    80008a38:	6a6a                	ld	s4,152(sp)
    80008a3a:	7a8a                	ld	s5,160(sp)
    80008a3c:	7b2a                	ld	s6,168(sp)
    80008a3e:	7bca                	ld	s7,176(sp)
    80008a40:	7c6a                	ld	s8,184(sp)
    80008a42:	6c8e                	ld	s9,192(sp)
    80008a44:	6d2e                	ld	s10,200(sp)
    80008a46:	6dce                	ld	s11,208(sp)
    80008a48:	6e6e                	ld	t3,216(sp)
    80008a4a:	7e8e                	ld	t4,224(sp)
    80008a4c:	7f2e                	ld	t5,232(sp)
    80008a4e:	7fce                	ld	t6,240(sp)
    80008a50:	6111                	addi	sp,sp,256
    80008a52:	10200073          	sret
    80008a56:	00000013          	nop
    80008a5a:	00000013          	nop
    80008a5e:	0001                	nop

0000000080008a60 <timervec>:
    80008a60:	34051573          	csrrw	a0,mscratch,a0
    80008a64:	e10c                	sd	a1,0(a0)
    80008a66:	e510                	sd	a2,8(a0)
    80008a68:	e914                	sd	a3,16(a0)
    80008a6a:	6d0c                	ld	a1,24(a0)
    80008a6c:	7110                	ld	a2,32(a0)
    80008a6e:	6194                	ld	a3,0(a1)
    80008a70:	96b2                	add	a3,a3,a2
    80008a72:	e194                	sd	a3,0(a1)
    80008a74:	4589                	li	a1,2
    80008a76:	14459073          	csrw	sip,a1
    80008a7a:	6914                	ld	a3,16(a0)
    80008a7c:	6510                	ld	a2,8(a0)
    80008a7e:	610c                	ld	a1,0(a0)
    80008a80:	34051573          	csrrw	a0,mscratch,a0
    80008a84:	30200073          	mret
	...

0000000080008a8a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008a8a:	1141                	addi	sp,sp,-16
    80008a8c:	e422                	sd	s0,8(sp)
    80008a8e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008a90:	0c0007b7          	lui	a5,0xc000
    80008a94:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008a98:	4705                	li	a4,1
    80008a9a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008a9c:	0c0007b7          	lui	a5,0xc000
    80008aa0:	0791                	addi	a5,a5,4
    80008aa2:	4705                	li	a4,1
    80008aa4:	c398                	sw	a4,0(a5)
}
    80008aa6:	0001                	nop
    80008aa8:	6422                	ld	s0,8(sp)
    80008aaa:	0141                	addi	sp,sp,16
    80008aac:	8082                	ret

0000000080008aae <plicinithart>:

void
plicinithart(void)
{
    80008aae:	1101                	addi	sp,sp,-32
    80008ab0:	ec06                	sd	ra,24(sp)
    80008ab2:	e822                	sd	s0,16(sp)
    80008ab4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008ab6:	ffffa097          	auipc	ra,0xffffa
    80008aba:	cde080e7          	jalr	-802(ra) # 80002794 <cpuid>
    80008abe:	87aa                	mv	a5,a0
    80008ac0:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008ac4:	fec42783          	lw	a5,-20(s0)
    80008ac8:	0087979b          	slliw	a5,a5,0x8
    80008acc:	2781                	sext.w	a5,a5
    80008ace:	873e                	mv	a4,a5
    80008ad0:	0c0027b7          	lui	a5,0xc002
    80008ad4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008ad8:	97ba                	add	a5,a5,a4
    80008ada:	873e                	mv	a4,a5
    80008adc:	40200793          	li	a5,1026
    80008ae0:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008ae2:	fec42783          	lw	a5,-20(s0)
    80008ae6:	00d7979b          	slliw	a5,a5,0xd
    80008aea:	2781                	sext.w	a5,a5
    80008aec:	873e                	mv	a4,a5
    80008aee:	0c2017b7          	lui	a5,0xc201
    80008af2:	97ba                	add	a5,a5,a4
    80008af4:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008af8:	0001                	nop
    80008afa:	60e2                	ld	ra,24(sp)
    80008afc:	6442                	ld	s0,16(sp)
    80008afe:	6105                	addi	sp,sp,32
    80008b00:	8082                	ret

0000000080008b02 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008b02:	1101                	addi	sp,sp,-32
    80008b04:	ec06                	sd	ra,24(sp)
    80008b06:	e822                	sd	s0,16(sp)
    80008b08:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b0a:	ffffa097          	auipc	ra,0xffffa
    80008b0e:	c8a080e7          	jalr	-886(ra) # 80002794 <cpuid>
    80008b12:	87aa                	mv	a5,a0
    80008b14:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008b18:	fec42783          	lw	a5,-20(s0)
    80008b1c:	00d7979b          	slliw	a5,a5,0xd
    80008b20:	2781                	sext.w	a5,a5
    80008b22:	873e                	mv	a4,a5
    80008b24:	0c2017b7          	lui	a5,0xc201
    80008b28:	0791                	addi	a5,a5,4
    80008b2a:	97ba                	add	a5,a5,a4
    80008b2c:	439c                	lw	a5,0(a5)
    80008b2e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008b32:	fe842783          	lw	a5,-24(s0)
}
    80008b36:	853e                	mv	a0,a5
    80008b38:	60e2                	ld	ra,24(sp)
    80008b3a:	6442                	ld	s0,16(sp)
    80008b3c:	6105                	addi	sp,sp,32
    80008b3e:	8082                	ret

0000000080008b40 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008b40:	7179                	addi	sp,sp,-48
    80008b42:	f406                	sd	ra,40(sp)
    80008b44:	f022                	sd	s0,32(sp)
    80008b46:	1800                	addi	s0,sp,48
    80008b48:	87aa                	mv	a5,a0
    80008b4a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008b4e:	ffffa097          	auipc	ra,0xffffa
    80008b52:	c46080e7          	jalr	-954(ra) # 80002794 <cpuid>
    80008b56:	87aa                	mv	a5,a0
    80008b58:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008b5c:	fec42783          	lw	a5,-20(s0)
    80008b60:	00d7979b          	slliw	a5,a5,0xd
    80008b64:	2781                	sext.w	a5,a5
    80008b66:	873e                	mv	a4,a5
    80008b68:	0c2017b7          	lui	a5,0xc201
    80008b6c:	0791                	addi	a5,a5,4
    80008b6e:	97ba                	add	a5,a5,a4
    80008b70:	873e                	mv	a4,a5
    80008b72:	fdc42783          	lw	a5,-36(s0)
    80008b76:	c31c                	sw	a5,0(a4)
}
    80008b78:	0001                	nop
    80008b7a:	70a2                	ld	ra,40(sp)
    80008b7c:	7402                	ld	s0,32(sp)
    80008b7e:	6145                	addi	sp,sp,48
    80008b80:	8082                	ret

0000000080008b82 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80008b82:	7179                	addi	sp,sp,-48
    80008b84:	f406                	sd	ra,40(sp)
    80008b86:	f022                	sd	s0,32(sp)
    80008b88:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80008b8a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80008b8e:	00003597          	auipc	a1,0x3
    80008b92:	b1258593          	addi	a1,a1,-1262 # 8000b6a0 <etext+0x6a0>
    80008b96:	00068517          	auipc	a0,0x68
    80008b9a:	59250513          	addi	a0,a0,1426 # 80071128 <disk+0x2128>
    80008b9e:	ffff8097          	auipc	ra,0xffff8
    80008ba2:	6b2080e7          	jalr	1714(ra) # 80001250 <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008ba6:	100017b7          	lui	a5,0x10001
    80008baa:	439c                	lw	a5,0(a5)
    80008bac:	2781                	sext.w	a5,a5
    80008bae:	873e                	mv	a4,a5
    80008bb0:	747277b7          	lui	a5,0x74727
    80008bb4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008bb8:	04f71063          	bne	a4,a5,80008bf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008bbc:	100017b7          	lui	a5,0x10001
    80008bc0:	0791                	addi	a5,a5,4
    80008bc2:	439c                	lw	a5,0(a5)
    80008bc4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008bc6:	873e                	mv	a4,a5
    80008bc8:	4785                	li	a5,1
    80008bca:	02f71763          	bne	a4,a5,80008bf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008bce:	100017b7          	lui	a5,0x10001
    80008bd2:	07a1                	addi	a5,a5,8
    80008bd4:	439c                	lw	a5,0(a5)
    80008bd6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008bd8:	873e                	mv	a4,a5
    80008bda:	4789                	li	a5,2
    80008bdc:	00f71e63          	bne	a4,a5,80008bf8 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008be0:	100017b7          	lui	a5,0x10001
    80008be4:	07b1                	addi	a5,a5,12
    80008be6:	439c                	lw	a5,0(a5)
    80008be8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008bea:	873e                	mv	a4,a5
    80008bec:	554d47b7          	lui	a5,0x554d4
    80008bf0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008bf4:	00f70a63          	beq	a4,a5,80008c08 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008bf8:	00003517          	auipc	a0,0x3
    80008bfc:	ab850513          	addi	a0,a0,-1352 # 8000b6b0 <etext+0x6b0>
    80008c00:	ffff8097          	auipc	ra,0xffff8
    80008c04:	052080e7          	jalr	82(ra) # 80000c52 <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008c08:	fe842783          	lw	a5,-24(s0)
    80008c0c:	0017e793          	ori	a5,a5,1
    80008c10:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008c14:	100017b7          	lui	a5,0x10001
    80008c18:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008c1c:	fe842703          	lw	a4,-24(s0)
    80008c20:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80008c22:	fe842783          	lw	a5,-24(s0)
    80008c26:	0027e793          	ori	a5,a5,2
    80008c2a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008c2e:	100017b7          	lui	a5,0x10001
    80008c32:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008c36:	fe842703          	lw	a4,-24(s0)
    80008c3a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008c3c:	100017b7          	lui	a5,0x10001
    80008c40:	07c1                	addi	a5,a5,16
    80008c42:	439c                	lw	a5,0(a5)
    80008c44:	2781                	sext.w	a5,a5
    80008c46:	1782                	slli	a5,a5,0x20
    80008c48:	9381                	srli	a5,a5,0x20
    80008c4a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008c4e:	fe043783          	ld	a5,-32(s0)
    80008c52:	fdf7f793          	andi	a5,a5,-33
    80008c56:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008c5a:	fe043783          	ld	a5,-32(s0)
    80008c5e:	f7f7f793          	andi	a5,a5,-129
    80008c62:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008c66:	fe043703          	ld	a4,-32(s0)
    80008c6a:	77fd                	lui	a5,0xfffff
    80008c6c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ff8d7ff>
    80008c70:	8ff9                	and	a5,a5,a4
    80008c72:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008c76:	fe043703          	ld	a4,-32(s0)
    80008c7a:	77fd                	lui	a5,0xfffff
    80008c7c:	17fd                	addi	a5,a5,-1
    80008c7e:	8ff9                	and	a5,a5,a4
    80008c80:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008c84:	fe043703          	ld	a4,-32(s0)
    80008c88:	f80007b7          	lui	a5,0xf8000
    80008c8c:	17fd                	addi	a5,a5,-1
    80008c8e:	8ff9                	and	a5,a5,a4
    80008c90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008c94:	fe043703          	ld	a4,-32(s0)
    80008c98:	e00007b7          	lui	a5,0xe0000
    80008c9c:	17fd                	addi	a5,a5,-1
    80008c9e:	8ff9                	and	a5,a5,a4
    80008ca0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008ca4:	fe043703          	ld	a4,-32(s0)
    80008ca8:	f00007b7          	lui	a5,0xf0000
    80008cac:	17fd                	addi	a5,a5,-1
    80008cae:	8ff9                	and	a5,a5,a4
    80008cb0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008cb4:	100017b7          	lui	a5,0x10001
    80008cb8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008cbc:	fe043703          	ld	a4,-32(s0)
    80008cc0:	2701                	sext.w	a4,a4
    80008cc2:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008cc4:	fe842783          	lw	a5,-24(s0)
    80008cc8:	0087e793          	ori	a5,a5,8
    80008ccc:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008cd0:	100017b7          	lui	a5,0x10001
    80008cd4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008cd8:	fe842703          	lw	a4,-24(s0)
    80008cdc:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008cde:	fe842783          	lw	a5,-24(s0)
    80008ce2:	0047e793          	ori	a5,a5,4
    80008ce6:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008cea:	100017b7          	lui	a5,0x10001
    80008cee:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008cf2:	fe842703          	lw	a4,-24(s0)
    80008cf6:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008cf8:	100017b7          	lui	a5,0x10001
    80008cfc:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008d00:	6705                	lui	a4,0x1
    80008d02:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008d04:	100017b7          	lui	a5,0x10001
    80008d08:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008d0c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008d10:	100017b7          	lui	a5,0x10001
    80008d14:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008d18:	439c                	lw	a5,0(a5)
    80008d1a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008d1e:	fdc42783          	lw	a5,-36(s0)
    80008d22:	2781                	sext.w	a5,a5
    80008d24:	eb89                	bnez	a5,80008d36 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008d26:	00003517          	auipc	a0,0x3
    80008d2a:	9aa50513          	addi	a0,a0,-1622 # 8000b6d0 <etext+0x6d0>
    80008d2e:	ffff8097          	auipc	ra,0xffff8
    80008d32:	f24080e7          	jalr	-220(ra) # 80000c52 <panic>
  if(max < NUM)
    80008d36:	fdc42783          	lw	a5,-36(s0)
    80008d3a:	0007871b          	sext.w	a4,a5
    80008d3e:	479d                	li	a5,7
    80008d40:	00e7ea63          	bltu	a5,a4,80008d54 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008d44:	00003517          	auipc	a0,0x3
    80008d48:	9ac50513          	addi	a0,a0,-1620 # 8000b6f0 <etext+0x6f0>
    80008d4c:	ffff8097          	auipc	ra,0xffff8
    80008d50:	f06080e7          	jalr	-250(ra) # 80000c52 <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008d54:	100017b7          	lui	a5,0x10001
    80008d58:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008d5c:	4721                	li	a4,8
    80008d5e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008d60:	6609                	lui	a2,0x2
    80008d62:	4581                	li	a1,0
    80008d64:	00066517          	auipc	a0,0x66
    80008d68:	29c50513          	addi	a0,a0,668 # 8006f000 <disk>
    80008d6c:	ffff8097          	auipc	ra,0xffff8
    80008d70:	6e8080e7          	jalr	1768(ra) # 80001454 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008d74:	00066797          	auipc	a5,0x66
    80008d78:	28c78793          	addi	a5,a5,652 # 8006f000 <disk>
    80008d7c:	00c7d713          	srli	a4,a5,0xc
    80008d80:	100017b7          	lui	a5,0x10001
    80008d84:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008d88:	2701                	sext.w	a4,a4
    80008d8a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008d8c:	00066717          	auipc	a4,0x66
    80008d90:	27470713          	addi	a4,a4,628 # 8006f000 <disk>
    80008d94:	6789                	lui	a5,0x2
    80008d96:	97ba                	add	a5,a5,a4
    80008d98:	00066717          	auipc	a4,0x66
    80008d9c:	26870713          	addi	a4,a4,616 # 8006f000 <disk>
    80008da0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008da2:	00066717          	auipc	a4,0x66
    80008da6:	2de70713          	addi	a4,a4,734 # 8006f080 <disk+0x80>
    80008daa:	00066697          	auipc	a3,0x66
    80008dae:	25668693          	addi	a3,a3,598 # 8006f000 <disk>
    80008db2:	6789                	lui	a5,0x2
    80008db4:	97b6                	add	a5,a5,a3
    80008db6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008db8:	00067717          	auipc	a4,0x67
    80008dbc:	24870713          	addi	a4,a4,584 # 80070000 <disk+0x1000>
    80008dc0:	00066697          	auipc	a3,0x66
    80008dc4:	24068693          	addi	a3,a3,576 # 8006f000 <disk>
    80008dc8:	6789                	lui	a5,0x2
    80008dca:	97b6                	add	a5,a5,a3
    80008dcc:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008dce:	fe042623          	sw	zero,-20(s0)
    80008dd2:	a015                	j	80008df6 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008dd4:	00066717          	auipc	a4,0x66
    80008dd8:	22c70713          	addi	a4,a4,556 # 8006f000 <disk>
    80008ddc:	fec42783          	lw	a5,-20(s0)
    80008de0:	97ba                	add	a5,a5,a4
    80008de2:	6709                	lui	a4,0x2
    80008de4:	97ba                	add	a5,a5,a4
    80008de6:	4705                	li	a4,1
    80008de8:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008dec:	fec42783          	lw	a5,-20(s0)
    80008df0:	2785                	addiw	a5,a5,1
    80008df2:	fef42623          	sw	a5,-20(s0)
    80008df6:	fec42783          	lw	a5,-20(s0)
    80008dfa:	0007871b          	sext.w	a4,a5
    80008dfe:	479d                	li	a5,7
    80008e00:	fce7dae3          	bge	a5,a4,80008dd4 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008e04:	0001                	nop
    80008e06:	0001                	nop
    80008e08:	70a2                	ld	ra,40(sp)
    80008e0a:	7402                	ld	s0,32(sp)
    80008e0c:	6145                	addi	sp,sp,48
    80008e0e:	8082                	ret

0000000080008e10 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008e10:	1101                	addi	sp,sp,-32
    80008e12:	ec22                	sd	s0,24(sp)
    80008e14:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008e16:	fe042623          	sw	zero,-20(s0)
    80008e1a:	a081                	j	80008e5a <alloc_desc+0x4a>
    if(disk.free[i]){
    80008e1c:	00066717          	auipc	a4,0x66
    80008e20:	1e470713          	addi	a4,a4,484 # 8006f000 <disk>
    80008e24:	fec42783          	lw	a5,-20(s0)
    80008e28:	97ba                	add	a5,a5,a4
    80008e2a:	6709                	lui	a4,0x2
    80008e2c:	97ba                	add	a5,a5,a4
    80008e2e:	0187c783          	lbu	a5,24(a5)
    80008e32:	cf99                	beqz	a5,80008e50 <alloc_desc+0x40>
      disk.free[i] = 0;
    80008e34:	00066717          	auipc	a4,0x66
    80008e38:	1cc70713          	addi	a4,a4,460 # 8006f000 <disk>
    80008e3c:	fec42783          	lw	a5,-20(s0)
    80008e40:	97ba                	add	a5,a5,a4
    80008e42:	6709                	lui	a4,0x2
    80008e44:	97ba                	add	a5,a5,a4
    80008e46:	00078c23          	sb	zero,24(a5)
      return i;
    80008e4a:	fec42783          	lw	a5,-20(s0)
    80008e4e:	a831                	j	80008e6a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80008e50:	fec42783          	lw	a5,-20(s0)
    80008e54:	2785                	addiw	a5,a5,1
    80008e56:	fef42623          	sw	a5,-20(s0)
    80008e5a:	fec42783          	lw	a5,-20(s0)
    80008e5e:	0007871b          	sext.w	a4,a5
    80008e62:	479d                	li	a5,7
    80008e64:	fae7dce3          	bge	a5,a4,80008e1c <alloc_desc+0xc>
    }
  }
  return -1;
    80008e68:	57fd                	li	a5,-1
}
    80008e6a:	853e                	mv	a0,a5
    80008e6c:	6462                	ld	s0,24(sp)
    80008e6e:	6105                	addi	sp,sp,32
    80008e70:	8082                	ret

0000000080008e72 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008e72:	1101                	addi	sp,sp,-32
    80008e74:	ec06                	sd	ra,24(sp)
    80008e76:	e822                	sd	s0,16(sp)
    80008e78:	1000                	addi	s0,sp,32
    80008e7a:	87aa                	mv	a5,a0
    80008e7c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008e80:	fec42783          	lw	a5,-20(s0)
    80008e84:	0007871b          	sext.w	a4,a5
    80008e88:	479d                	li	a5,7
    80008e8a:	00e7da63          	bge	a5,a4,80008e9e <free_desc+0x2c>
    panic("free_desc 1");
    80008e8e:	00003517          	auipc	a0,0x3
    80008e92:	88250513          	addi	a0,a0,-1918 # 8000b710 <etext+0x710>
    80008e96:	ffff8097          	auipc	ra,0xffff8
    80008e9a:	dbc080e7          	jalr	-580(ra) # 80000c52 <panic>
  if(disk.free[i])
    80008e9e:	00066717          	auipc	a4,0x66
    80008ea2:	16270713          	addi	a4,a4,354 # 8006f000 <disk>
    80008ea6:	fec42783          	lw	a5,-20(s0)
    80008eaa:	97ba                	add	a5,a5,a4
    80008eac:	6709                	lui	a4,0x2
    80008eae:	97ba                	add	a5,a5,a4
    80008eb0:	0187c783          	lbu	a5,24(a5)
    80008eb4:	cb89                	beqz	a5,80008ec6 <free_desc+0x54>
    panic("free_desc 2");
    80008eb6:	00003517          	auipc	a0,0x3
    80008eba:	86a50513          	addi	a0,a0,-1942 # 8000b720 <etext+0x720>
    80008ebe:	ffff8097          	auipc	ra,0xffff8
    80008ec2:	d94080e7          	jalr	-620(ra) # 80000c52 <panic>
  disk.desc[i].addr = 0;
    80008ec6:	00066717          	auipc	a4,0x66
    80008eca:	13a70713          	addi	a4,a4,314 # 8006f000 <disk>
    80008ece:	6789                	lui	a5,0x2
    80008ed0:	97ba                	add	a5,a5,a4
    80008ed2:	6398                	ld	a4,0(a5)
    80008ed4:	fec42783          	lw	a5,-20(s0)
    80008ed8:	0792                	slli	a5,a5,0x4
    80008eda:	97ba                	add	a5,a5,a4
    80008edc:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    80008ee0:	00066717          	auipc	a4,0x66
    80008ee4:	12070713          	addi	a4,a4,288 # 8006f000 <disk>
    80008ee8:	6789                	lui	a5,0x2
    80008eea:	97ba                	add	a5,a5,a4
    80008eec:	6398                	ld	a4,0(a5)
    80008eee:	fec42783          	lw	a5,-20(s0)
    80008ef2:	0792                	slli	a5,a5,0x4
    80008ef4:	97ba                	add	a5,a5,a4
    80008ef6:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    80008efa:	00066717          	auipc	a4,0x66
    80008efe:	10670713          	addi	a4,a4,262 # 8006f000 <disk>
    80008f02:	6789                	lui	a5,0x2
    80008f04:	97ba                	add	a5,a5,a4
    80008f06:	6398                	ld	a4,0(a5)
    80008f08:	fec42783          	lw	a5,-20(s0)
    80008f0c:	0792                	slli	a5,a5,0x4
    80008f0e:	97ba                	add	a5,a5,a4
    80008f10:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80008f14:	00066717          	auipc	a4,0x66
    80008f18:	0ec70713          	addi	a4,a4,236 # 8006f000 <disk>
    80008f1c:	6789                	lui	a5,0x2
    80008f1e:	97ba                	add	a5,a5,a4
    80008f20:	6398                	ld	a4,0(a5)
    80008f22:	fec42783          	lw	a5,-20(s0)
    80008f26:	0792                	slli	a5,a5,0x4
    80008f28:	97ba                	add	a5,a5,a4
    80008f2a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    80008f2e:	00066717          	auipc	a4,0x66
    80008f32:	0d270713          	addi	a4,a4,210 # 8006f000 <disk>
    80008f36:	fec42783          	lw	a5,-20(s0)
    80008f3a:	97ba                	add	a5,a5,a4
    80008f3c:	6709                	lui	a4,0x2
    80008f3e:	97ba                	add	a5,a5,a4
    80008f40:	4705                	li	a4,1
    80008f42:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80008f46:	00068517          	auipc	a0,0x68
    80008f4a:	0d250513          	addi	a0,a0,210 # 80071018 <disk+0x2018>
    80008f4e:	ffffa097          	auipc	ra,0xffffa
    80008f52:	580080e7          	jalr	1408(ra) # 800034ce <wakeup>
}
    80008f56:	0001                	nop
    80008f58:	60e2                	ld	ra,24(sp)
    80008f5a:	6442                	ld	s0,16(sp)
    80008f5c:	6105                	addi	sp,sp,32
    80008f5e:	8082                	ret

0000000080008f60 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80008f60:	7179                	addi	sp,sp,-48
    80008f62:	f406                	sd	ra,40(sp)
    80008f64:	f022                	sd	s0,32(sp)
    80008f66:	1800                	addi	s0,sp,48
    80008f68:	87aa                	mv	a5,a0
    80008f6a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    80008f6e:	00066717          	auipc	a4,0x66
    80008f72:	09270713          	addi	a4,a4,146 # 8006f000 <disk>
    80008f76:	6789                	lui	a5,0x2
    80008f78:	97ba                	add	a5,a5,a4
    80008f7a:	6398                	ld	a4,0(a5)
    80008f7c:	fdc42783          	lw	a5,-36(s0)
    80008f80:	0792                	slli	a5,a5,0x4
    80008f82:	97ba                	add	a5,a5,a4
    80008f84:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80008f88:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    80008f8c:	00066717          	auipc	a4,0x66
    80008f90:	07470713          	addi	a4,a4,116 # 8006f000 <disk>
    80008f94:	6789                	lui	a5,0x2
    80008f96:	97ba                	add	a5,a5,a4
    80008f98:	6398                	ld	a4,0(a5)
    80008f9a:	fdc42783          	lw	a5,-36(s0)
    80008f9e:	0792                	slli	a5,a5,0x4
    80008fa0:	97ba                	add	a5,a5,a4
    80008fa2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    80008fa6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    80008faa:	fdc42783          	lw	a5,-36(s0)
    80008fae:	853e                	mv	a0,a5
    80008fb0:	00000097          	auipc	ra,0x0
    80008fb4:	ec2080e7          	jalr	-318(ra) # 80008e72 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80008fb8:	fec42783          	lw	a5,-20(s0)
    80008fbc:	8b85                	andi	a5,a5,1
    80008fbe:	2781                	sext.w	a5,a5
    80008fc0:	c791                	beqz	a5,80008fcc <free_chain+0x6c>
      i = nxt;
    80008fc2:	fe842783          	lw	a5,-24(s0)
    80008fc6:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    80008fca:	b755                	j	80008f6e <free_chain+0xe>
    else
      break;
    80008fcc:	0001                	nop
  }
}
    80008fce:	0001                	nop
    80008fd0:	70a2                	ld	ra,40(sp)
    80008fd2:	7402                	ld	s0,32(sp)
    80008fd4:	6145                	addi	sp,sp,48
    80008fd6:	8082                	ret

0000000080008fd8 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80008fd8:	7139                	addi	sp,sp,-64
    80008fda:	fc06                	sd	ra,56(sp)
    80008fdc:	f822                	sd	s0,48(sp)
    80008fde:	f426                	sd	s1,40(sp)
    80008fe0:	0080                	addi	s0,sp,64
    80008fe2:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80008fe6:	fc042e23          	sw	zero,-36(s0)
    80008fea:	a895                	j	8000905e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    80008fec:	fdc42783          	lw	a5,-36(s0)
    80008ff0:	078a                	slli	a5,a5,0x2
    80008ff2:	fc843703          	ld	a4,-56(s0)
    80008ff6:	00f704b3          	add	s1,a4,a5
    80008ffa:	00000097          	auipc	ra,0x0
    80008ffe:	e16080e7          	jalr	-490(ra) # 80008e10 <alloc_desc>
    80009002:	87aa                	mv	a5,a0
    80009004:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009006:	fdc42783          	lw	a5,-36(s0)
    8000900a:	078a                	slli	a5,a5,0x2
    8000900c:	fc843703          	ld	a4,-56(s0)
    80009010:	97ba                	add	a5,a5,a4
    80009012:	439c                	lw	a5,0(a5)
    80009014:	0407d063          	bgez	a5,80009054 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80009018:	fc042c23          	sw	zero,-40(s0)
    8000901c:	a015                	j	80009040 <alloc3_desc+0x68>
        free_desc(idx[j]);
    8000901e:	fd842783          	lw	a5,-40(s0)
    80009022:	078a                	slli	a5,a5,0x2
    80009024:	fc843703          	ld	a4,-56(s0)
    80009028:	97ba                	add	a5,a5,a4
    8000902a:	439c                	lw	a5,0(a5)
    8000902c:	853e                	mv	a0,a5
    8000902e:	00000097          	auipc	ra,0x0
    80009032:	e44080e7          	jalr	-444(ra) # 80008e72 <free_desc>
      for(int j = 0; j < i; j++)
    80009036:	fd842783          	lw	a5,-40(s0)
    8000903a:	2785                	addiw	a5,a5,1
    8000903c:	fcf42c23          	sw	a5,-40(s0)
    80009040:	fd842703          	lw	a4,-40(s0)
    80009044:	fdc42783          	lw	a5,-36(s0)
    80009048:	2701                	sext.w	a4,a4
    8000904a:	2781                	sext.w	a5,a5
    8000904c:	fcf749e3          	blt	a4,a5,8000901e <alloc3_desc+0x46>
      return -1;
    80009050:	57fd                	li	a5,-1
    80009052:	a831                	j	8000906e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80009054:	fdc42783          	lw	a5,-36(s0)
    80009058:	2785                	addiw	a5,a5,1
    8000905a:	fcf42e23          	sw	a5,-36(s0)
    8000905e:	fdc42783          	lw	a5,-36(s0)
    80009062:	0007871b          	sext.w	a4,a5
    80009066:	4789                	li	a5,2
    80009068:	f8e7d2e3          	bge	a5,a4,80008fec <alloc3_desc+0x14>
    }
  }
  return 0;
    8000906c:	4781                	li	a5,0
}
    8000906e:	853e                	mv	a0,a5
    80009070:	70e2                	ld	ra,56(sp)
    80009072:	7442                	ld	s0,48(sp)
    80009074:	74a2                	ld	s1,40(sp)
    80009076:	6121                	addi	sp,sp,64
    80009078:	8082                	ret

000000008000907a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000907a:	7139                	addi	sp,sp,-64
    8000907c:	fc06                	sd	ra,56(sp)
    8000907e:	f822                	sd	s0,48(sp)
    80009080:	0080                	addi	s0,sp,64
    80009082:	fca43423          	sd	a0,-56(s0)
    80009086:	87ae                	mv	a5,a1
    80009088:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000908c:	fc843783          	ld	a5,-56(s0)
    80009090:	47dc                	lw	a5,12(a5)
    80009092:	0017979b          	slliw	a5,a5,0x1
    80009096:	2781                	sext.w	a5,a5
    80009098:	1782                	slli	a5,a5,0x20
    8000909a:	9381                	srli	a5,a5,0x20
    8000909c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    800090a0:	00068517          	auipc	a0,0x68
    800090a4:	08850513          	addi	a0,a0,136 # 80071128 <disk+0x2128>
    800090a8:	ffff8097          	auipc	ra,0xffff8
    800090ac:	1d8080e7          	jalr	472(ra) # 80001280 <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    800090b0:	fd040793          	addi	a5,s0,-48
    800090b4:	853e                	mv	a0,a5
    800090b6:	00000097          	auipc	ra,0x0
    800090ba:	f22080e7          	jalr	-222(ra) # 80008fd8 <alloc3_desc>
    800090be:	87aa                	mv	a5,a0
    800090c0:	cf91                	beqz	a5,800090dc <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    800090c2:	00068597          	auipc	a1,0x68
    800090c6:	06658593          	addi	a1,a1,102 # 80071128 <disk+0x2128>
    800090ca:	00068517          	auipc	a0,0x68
    800090ce:	f4e50513          	addi	a0,a0,-178 # 80071018 <disk+0x2018>
    800090d2:	ffffa097          	auipc	ra,0xffffa
    800090d6:	368080e7          	jalr	872(ra) # 8000343a <sleep>
    if(alloc3_desc(idx) == 0) {
    800090da:	bfd9                	j	800090b0 <virtio_disk_rw+0x36>
      break;
    800090dc:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    800090de:	fd042783          	lw	a5,-48(s0)
    800090e2:	20078793          	addi	a5,a5,512
    800090e6:	00479713          	slli	a4,a5,0x4
    800090ea:	00066797          	auipc	a5,0x66
    800090ee:	f1678793          	addi	a5,a5,-234 # 8006f000 <disk>
    800090f2:	97ba                	add	a5,a5,a4
    800090f4:	0a878793          	addi	a5,a5,168
    800090f8:	fef43023          	sd	a5,-32(s0)

  if(write)
    800090fc:	fc442783          	lw	a5,-60(s0)
    80009100:	2781                	sext.w	a5,a5
    80009102:	c791                	beqz	a5,8000910e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009104:	fe043783          	ld	a5,-32(s0)
    80009108:	4705                	li	a4,1
    8000910a:	c398                	sw	a4,0(a5)
    8000910c:	a029                	j	80009116 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000910e:	fe043783          	ld	a5,-32(s0)
    80009112:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009116:	fe043783          	ld	a5,-32(s0)
    8000911a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000911e:	fe043783          	ld	a5,-32(s0)
    80009122:	fe843703          	ld	a4,-24(s0)
    80009126:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80009128:	00066717          	auipc	a4,0x66
    8000912c:	ed870713          	addi	a4,a4,-296 # 8006f000 <disk>
    80009130:	6789                	lui	a5,0x2
    80009132:	97ba                	add	a5,a5,a4
    80009134:	6398                	ld	a4,0(a5)
    80009136:	fd042783          	lw	a5,-48(s0)
    8000913a:	0792                	slli	a5,a5,0x4
    8000913c:	97ba                	add	a5,a5,a4
    8000913e:	fe043703          	ld	a4,-32(s0)
    80009142:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009144:	00066717          	auipc	a4,0x66
    80009148:	ebc70713          	addi	a4,a4,-324 # 8006f000 <disk>
    8000914c:	6789                	lui	a5,0x2
    8000914e:	97ba                	add	a5,a5,a4
    80009150:	6398                	ld	a4,0(a5)
    80009152:	fd042783          	lw	a5,-48(s0)
    80009156:	0792                	slli	a5,a5,0x4
    80009158:	97ba                	add	a5,a5,a4
    8000915a:	4741                	li	a4,16
    8000915c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000915e:	00066717          	auipc	a4,0x66
    80009162:	ea270713          	addi	a4,a4,-350 # 8006f000 <disk>
    80009166:	6789                	lui	a5,0x2
    80009168:	97ba                	add	a5,a5,a4
    8000916a:	6398                	ld	a4,0(a5)
    8000916c:	fd042783          	lw	a5,-48(s0)
    80009170:	0792                	slli	a5,a5,0x4
    80009172:	97ba                	add	a5,a5,a4
    80009174:	4705                	li	a4,1
    80009176:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000917a:	fd442683          	lw	a3,-44(s0)
    8000917e:	00066717          	auipc	a4,0x66
    80009182:	e8270713          	addi	a4,a4,-382 # 8006f000 <disk>
    80009186:	6789                	lui	a5,0x2
    80009188:	97ba                	add	a5,a5,a4
    8000918a:	6398                	ld	a4,0(a5)
    8000918c:	fd042783          	lw	a5,-48(s0)
    80009190:	0792                	slli	a5,a5,0x4
    80009192:	97ba                	add	a5,a5,a4
    80009194:	03069713          	slli	a4,a3,0x30
    80009198:	9341                	srli	a4,a4,0x30
    8000919a:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000919e:	fc843783          	ld	a5,-56(s0)
    800091a2:	05878693          	addi	a3,a5,88
    800091a6:	00066717          	auipc	a4,0x66
    800091aa:	e5a70713          	addi	a4,a4,-422 # 8006f000 <disk>
    800091ae:	6789                	lui	a5,0x2
    800091b0:	97ba                	add	a5,a5,a4
    800091b2:	6398                	ld	a4,0(a5)
    800091b4:	fd442783          	lw	a5,-44(s0)
    800091b8:	0792                	slli	a5,a5,0x4
    800091ba:	97ba                	add	a5,a5,a4
    800091bc:	8736                	mv	a4,a3
    800091be:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    800091c0:	00066717          	auipc	a4,0x66
    800091c4:	e4070713          	addi	a4,a4,-448 # 8006f000 <disk>
    800091c8:	6789                	lui	a5,0x2
    800091ca:	97ba                	add	a5,a5,a4
    800091cc:	6398                	ld	a4,0(a5)
    800091ce:	fd442783          	lw	a5,-44(s0)
    800091d2:	0792                	slli	a5,a5,0x4
    800091d4:	97ba                	add	a5,a5,a4
    800091d6:	40000713          	li	a4,1024
    800091da:	c798                	sw	a4,8(a5)
  if(write)
    800091dc:	fc442783          	lw	a5,-60(s0)
    800091e0:	2781                	sext.w	a5,a5
    800091e2:	cf99                	beqz	a5,80009200 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    800091e4:	00066717          	auipc	a4,0x66
    800091e8:	e1c70713          	addi	a4,a4,-484 # 8006f000 <disk>
    800091ec:	6789                	lui	a5,0x2
    800091ee:	97ba                	add	a5,a5,a4
    800091f0:	6398                	ld	a4,0(a5)
    800091f2:	fd442783          	lw	a5,-44(s0)
    800091f6:	0792                	slli	a5,a5,0x4
    800091f8:	97ba                	add	a5,a5,a4
    800091fa:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    800091fe:	a839                	j	8000921c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009200:	00066717          	auipc	a4,0x66
    80009204:	e0070713          	addi	a4,a4,-512 # 8006f000 <disk>
    80009208:	6789                	lui	a5,0x2
    8000920a:	97ba                	add	a5,a5,a4
    8000920c:	6398                	ld	a4,0(a5)
    8000920e:	fd442783          	lw	a5,-44(s0)
    80009212:	0792                	slli	a5,a5,0x4
    80009214:	97ba                	add	a5,a5,a4
    80009216:	4709                	li	a4,2
    80009218:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000921c:	00066717          	auipc	a4,0x66
    80009220:	de470713          	addi	a4,a4,-540 # 8006f000 <disk>
    80009224:	6789                	lui	a5,0x2
    80009226:	97ba                	add	a5,a5,a4
    80009228:	6398                	ld	a4,0(a5)
    8000922a:	fd442783          	lw	a5,-44(s0)
    8000922e:	0792                	slli	a5,a5,0x4
    80009230:	97ba                	add	a5,a5,a4
    80009232:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80009236:	00066697          	auipc	a3,0x66
    8000923a:	dca68693          	addi	a3,a3,-566 # 8006f000 <disk>
    8000923e:	6789                	lui	a5,0x2
    80009240:	97b6                	add	a5,a5,a3
    80009242:	6394                	ld	a3,0(a5)
    80009244:	fd442783          	lw	a5,-44(s0)
    80009248:	0792                	slli	a5,a5,0x4
    8000924a:	97b6                	add	a5,a5,a3
    8000924c:	00176713          	ori	a4,a4,1
    80009250:	1742                	slli	a4,a4,0x30
    80009252:	9341                	srli	a4,a4,0x30
    80009254:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80009258:	fd842683          	lw	a3,-40(s0)
    8000925c:	00066717          	auipc	a4,0x66
    80009260:	da470713          	addi	a4,a4,-604 # 8006f000 <disk>
    80009264:	6789                	lui	a5,0x2
    80009266:	97ba                	add	a5,a5,a4
    80009268:	6398                	ld	a4,0(a5)
    8000926a:	fd442783          	lw	a5,-44(s0)
    8000926e:	0792                	slli	a5,a5,0x4
    80009270:	97ba                	add	a5,a5,a4
    80009272:	03069713          	slli	a4,a3,0x30
    80009276:	9341                	srli	a4,a4,0x30
    80009278:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000927c:	fd042783          	lw	a5,-48(s0)
    80009280:	00066717          	auipc	a4,0x66
    80009284:	d8070713          	addi	a4,a4,-640 # 8006f000 <disk>
    80009288:	20078793          	addi	a5,a5,512
    8000928c:	0792                	slli	a5,a5,0x4
    8000928e:	97ba                	add	a5,a5,a4
    80009290:	577d                	li	a4,-1
    80009292:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009296:	fd042783          	lw	a5,-48(s0)
    8000929a:	20078793          	addi	a5,a5,512
    8000929e:	00479713          	slli	a4,a5,0x4
    800092a2:	00066797          	auipc	a5,0x66
    800092a6:	d5e78793          	addi	a5,a5,-674 # 8006f000 <disk>
    800092aa:	97ba                	add	a5,a5,a4
    800092ac:	03078693          	addi	a3,a5,48
    800092b0:	00066717          	auipc	a4,0x66
    800092b4:	d5070713          	addi	a4,a4,-688 # 8006f000 <disk>
    800092b8:	6789                	lui	a5,0x2
    800092ba:	97ba                	add	a5,a5,a4
    800092bc:	6398                	ld	a4,0(a5)
    800092be:	fd842783          	lw	a5,-40(s0)
    800092c2:	0792                	slli	a5,a5,0x4
    800092c4:	97ba                	add	a5,a5,a4
    800092c6:	8736                	mv	a4,a3
    800092c8:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    800092ca:	00066717          	auipc	a4,0x66
    800092ce:	d3670713          	addi	a4,a4,-714 # 8006f000 <disk>
    800092d2:	6789                	lui	a5,0x2
    800092d4:	97ba                	add	a5,a5,a4
    800092d6:	6398                	ld	a4,0(a5)
    800092d8:	fd842783          	lw	a5,-40(s0)
    800092dc:	0792                	slli	a5,a5,0x4
    800092de:	97ba                	add	a5,a5,a4
    800092e0:	4705                	li	a4,1
    800092e2:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    800092e4:	00066717          	auipc	a4,0x66
    800092e8:	d1c70713          	addi	a4,a4,-740 # 8006f000 <disk>
    800092ec:	6789                	lui	a5,0x2
    800092ee:	97ba                	add	a5,a5,a4
    800092f0:	6398                	ld	a4,0(a5)
    800092f2:	fd842783          	lw	a5,-40(s0)
    800092f6:	0792                	slli	a5,a5,0x4
    800092f8:	97ba                	add	a5,a5,a4
    800092fa:	4709                	li	a4,2
    800092fc:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009300:	00066717          	auipc	a4,0x66
    80009304:	d0070713          	addi	a4,a4,-768 # 8006f000 <disk>
    80009308:	6789                	lui	a5,0x2
    8000930a:	97ba                	add	a5,a5,a4
    8000930c:	6398                	ld	a4,0(a5)
    8000930e:	fd842783          	lw	a5,-40(s0)
    80009312:	0792                	slli	a5,a5,0x4
    80009314:	97ba                	add	a5,a5,a4
    80009316:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000931a:	fc843783          	ld	a5,-56(s0)
    8000931e:	4705                	li	a4,1
    80009320:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    80009322:	fd042783          	lw	a5,-48(s0)
    80009326:	00066717          	auipc	a4,0x66
    8000932a:	cda70713          	addi	a4,a4,-806 # 8006f000 <disk>
    8000932e:	20078793          	addi	a5,a5,512
    80009332:	0792                	slli	a5,a5,0x4
    80009334:	97ba                	add	a5,a5,a4
    80009336:	fc843703          	ld	a4,-56(s0)
    8000933a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000933c:	fd042603          	lw	a2,-48(s0)
    80009340:	00066717          	auipc	a4,0x66
    80009344:	cc070713          	addi	a4,a4,-832 # 8006f000 <disk>
    80009348:	6789                	lui	a5,0x2
    8000934a:	97ba                	add	a5,a5,a4
    8000934c:	6794                	ld	a3,8(a5)
    8000934e:	00066717          	auipc	a4,0x66
    80009352:	cb270713          	addi	a4,a4,-846 # 8006f000 <disk>
    80009356:	6789                	lui	a5,0x2
    80009358:	97ba                	add	a5,a5,a4
    8000935a:	679c                	ld	a5,8(a5)
    8000935c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009360:	2781                	sext.w	a5,a5
    80009362:	8b9d                	andi	a5,a5,7
    80009364:	2781                	sext.w	a5,a5
    80009366:	03061713          	slli	a4,a2,0x30
    8000936a:	9341                	srli	a4,a4,0x30
    8000936c:	0786                	slli	a5,a5,0x1
    8000936e:	97b6                	add	a5,a5,a3
    80009370:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009374:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009378:	00066717          	auipc	a4,0x66
    8000937c:	c8870713          	addi	a4,a4,-888 # 8006f000 <disk>
    80009380:	6789                	lui	a5,0x2
    80009382:	97ba                	add	a5,a5,a4
    80009384:	679c                	ld	a5,8(a5)
    80009386:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000938a:	00066697          	auipc	a3,0x66
    8000938e:	c7668693          	addi	a3,a3,-906 # 8006f000 <disk>
    80009392:	6789                	lui	a5,0x2
    80009394:	97b6                	add	a5,a5,a3
    80009396:	679c                	ld	a5,8(a5)
    80009398:	2705                	addiw	a4,a4,1
    8000939a:	1742                	slli	a4,a4,0x30
    8000939c:	9341                	srli	a4,a4,0x30
    8000939e:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    800093a2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    800093a6:	100017b7          	lui	a5,0x10001
    800093aa:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    800093ae:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    800093b2:	a819                	j	800093c8 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    800093b4:	00068597          	auipc	a1,0x68
    800093b8:	d7458593          	addi	a1,a1,-652 # 80071128 <disk+0x2128>
    800093bc:	fc843503          	ld	a0,-56(s0)
    800093c0:	ffffa097          	auipc	ra,0xffffa
    800093c4:	07a080e7          	jalr	122(ra) # 8000343a <sleep>
  while(b->disk == 1) {
    800093c8:	fc843783          	ld	a5,-56(s0)
    800093cc:	43dc                	lw	a5,4(a5)
    800093ce:	873e                	mv	a4,a5
    800093d0:	4785                	li	a5,1
    800093d2:	fef701e3          	beq	a4,a5,800093b4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    800093d6:	fd042783          	lw	a5,-48(s0)
    800093da:	00066717          	auipc	a4,0x66
    800093de:	c2670713          	addi	a4,a4,-986 # 8006f000 <disk>
    800093e2:	20078793          	addi	a5,a5,512
    800093e6:	0792                	slli	a5,a5,0x4
    800093e8:	97ba                	add	a5,a5,a4
    800093ea:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    800093ee:	fd042783          	lw	a5,-48(s0)
    800093f2:	853e                	mv	a0,a5
    800093f4:	00000097          	auipc	ra,0x0
    800093f8:	b6c080e7          	jalr	-1172(ra) # 80008f60 <free_chain>

  release(&disk.vdisk_lock);
    800093fc:	00068517          	auipc	a0,0x68
    80009400:	d2c50513          	addi	a0,a0,-724 # 80071128 <disk+0x2128>
    80009404:	ffff8097          	auipc	ra,0xffff8
    80009408:	ee0080e7          	jalr	-288(ra) # 800012e4 <release>
}
    8000940c:	0001                	nop
    8000940e:	70e2                	ld	ra,56(sp)
    80009410:	7442                	ld	s0,48(sp)
    80009412:	6121                	addi	sp,sp,64
    80009414:	8082                	ret

0000000080009416 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009416:	1101                	addi	sp,sp,-32
    80009418:	ec06                	sd	ra,24(sp)
    8000941a:	e822                	sd	s0,16(sp)
    8000941c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000941e:	00068517          	auipc	a0,0x68
    80009422:	d0a50513          	addi	a0,a0,-758 # 80071128 <disk+0x2128>
    80009426:	ffff8097          	auipc	ra,0xffff8
    8000942a:	e5a080e7          	jalr	-422(ra) # 80001280 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000942e:	100017b7          	lui	a5,0x10001
    80009432:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    80009436:	439c                	lw	a5,0(a5)
    80009438:	0007871b          	sext.w	a4,a5
    8000943c:	100017b7          	lui	a5,0x10001
    80009440:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    80009444:	8b0d                	andi	a4,a4,3
    80009446:	2701                	sext.w	a4,a4
    80009448:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000944a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000944e:	a855                	j	80009502 <virtio_disk_intr+0xec>
    __sync_synchronize();
    80009450:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80009454:	00066717          	auipc	a4,0x66
    80009458:	bac70713          	addi	a4,a4,-1108 # 8006f000 <disk>
    8000945c:	6789                	lui	a5,0x2
    8000945e:	97ba                	add	a5,a5,a4
    80009460:	6b98                	ld	a4,16(a5)
    80009462:	00066697          	auipc	a3,0x66
    80009466:	b9e68693          	addi	a3,a3,-1122 # 8006f000 <disk>
    8000946a:	6789                	lui	a5,0x2
    8000946c:	97b6                	add	a5,a5,a3
    8000946e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009472:	2781                	sext.w	a5,a5
    80009474:	8b9d                	andi	a5,a5,7
    80009476:	2781                	sext.w	a5,a5
    80009478:	078e                	slli	a5,a5,0x3
    8000947a:	97ba                	add	a5,a5,a4
    8000947c:	43dc                	lw	a5,4(a5)
    8000947e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009482:	00066717          	auipc	a4,0x66
    80009486:	b7e70713          	addi	a4,a4,-1154 # 8006f000 <disk>
    8000948a:	fec42783          	lw	a5,-20(s0)
    8000948e:	20078793          	addi	a5,a5,512
    80009492:	0792                	slli	a5,a5,0x4
    80009494:	97ba                	add	a5,a5,a4
    80009496:	0307c783          	lbu	a5,48(a5)
    8000949a:	cb89                	beqz	a5,800094ac <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000949c:	00002517          	auipc	a0,0x2
    800094a0:	29450513          	addi	a0,a0,660 # 8000b730 <etext+0x730>
    800094a4:	ffff7097          	auipc	ra,0xffff7
    800094a8:	7ae080e7          	jalr	1966(ra) # 80000c52 <panic>

    struct buf *b = disk.info[id].b;
    800094ac:	00066717          	auipc	a4,0x66
    800094b0:	b5470713          	addi	a4,a4,-1196 # 8006f000 <disk>
    800094b4:	fec42783          	lw	a5,-20(s0)
    800094b8:	20078793          	addi	a5,a5,512
    800094bc:	0792                	slli	a5,a5,0x4
    800094be:	97ba                	add	a5,a5,a4
    800094c0:	779c                	ld	a5,40(a5)
    800094c2:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    800094c6:	fe043783          	ld	a5,-32(s0)
    800094ca:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    800094ce:	fe043503          	ld	a0,-32(s0)
    800094d2:	ffffa097          	auipc	ra,0xffffa
    800094d6:	ffc080e7          	jalr	-4(ra) # 800034ce <wakeup>

    disk.used_idx += 1;
    800094da:	00066717          	auipc	a4,0x66
    800094de:	b2670713          	addi	a4,a4,-1242 # 8006f000 <disk>
    800094e2:	6789                	lui	a5,0x2
    800094e4:	97ba                	add	a5,a5,a4
    800094e6:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    800094ea:	2785                	addiw	a5,a5,1
    800094ec:	03079713          	slli	a4,a5,0x30
    800094f0:	9341                	srli	a4,a4,0x30
    800094f2:	00066697          	auipc	a3,0x66
    800094f6:	b0e68693          	addi	a3,a3,-1266 # 8006f000 <disk>
    800094fa:	6789                	lui	a5,0x2
    800094fc:	97b6                	add	a5,a5,a3
    800094fe:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009502:	00066717          	auipc	a4,0x66
    80009506:	afe70713          	addi	a4,a4,-1282 # 8006f000 <disk>
    8000950a:	6789                	lui	a5,0x2
    8000950c:	97ba                	add	a5,a5,a4
    8000950e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009512:	00066717          	auipc	a4,0x66
    80009516:	aee70713          	addi	a4,a4,-1298 # 8006f000 <disk>
    8000951a:	6789                	lui	a5,0x2
    8000951c:	97ba                	add	a5,a5,a4
    8000951e:	6b9c                	ld	a5,16(a5)
    80009520:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009524:	0006871b          	sext.w	a4,a3
    80009528:	2781                	sext.w	a5,a5
    8000952a:	f2f713e3          	bne	a4,a5,80009450 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000952e:	00068517          	auipc	a0,0x68
    80009532:	bfa50513          	addi	a0,a0,-1030 # 80071128 <disk+0x2128>
    80009536:	ffff8097          	auipc	ra,0xffff8
    8000953a:	dae080e7          	jalr	-594(ra) # 800012e4 <release>
}
    8000953e:	0001                	nop
    80009540:	60e2                	ld	ra,24(sp)
    80009542:	6442                	ld	s0,16(sp)
    80009544:	6105                	addi	sp,sp,32
    80009546:	8082                	ret

0000000080009548 <sys_thrdstop>:
#include "proc.h"

// for mp3
uint64
sys_thrdstop(void)
{
    80009548:	7139                	addi	sp,sp,-64
    8000954a:	fc06                	sd	ra,56(sp)
    8000954c:	f822                	sd	s0,48(sp)
    8000954e:	0080                	addi	s0,sp,64
  int delay;
  uint64 context_id_ptr;
  uint64 handler, handler_arg;
  if (argint(0, &delay) < 0)
    80009550:	fe840793          	addi	a5,s0,-24
    80009554:	85be                	mv	a1,a5
    80009556:	4501                	li	a0,0
    80009558:	ffffb097          	auipc	ra,0xffffb
    8000955c:	d6a080e7          	jalr	-662(ra) # 800042c2 <argint>
    80009560:	87aa                	mv	a5,a0
    80009562:	0007d463          	bgez	a5,8000956a <sys_thrdstop+0x22>
    return -1;
    80009566:	57fd                	li	a5,-1
    80009568:	aabd                	j	800096e6 <sys_thrdstop+0x19e>
  if (argaddr(1, &context_id_ptr) < 0)
    8000956a:	fe040793          	addi	a5,s0,-32
    8000956e:	85be                	mv	a1,a5
    80009570:	4505                	li	a0,1
    80009572:	ffffb097          	auipc	ra,0xffffb
    80009576:	d88080e7          	jalr	-632(ra) # 800042fa <argaddr>
    8000957a:	87aa                	mv	a5,a0
    8000957c:	0007d463          	bgez	a5,80009584 <sys_thrdstop+0x3c>
    return -1;
    80009580:	57fd                	li	a5,-1
    80009582:	a295                	j	800096e6 <sys_thrdstop+0x19e>
  if (argaddr(2, &handler) < 0)
    80009584:	fd840793          	addi	a5,s0,-40
    80009588:	85be                	mv	a1,a5
    8000958a:	4509                	li	a0,2
    8000958c:	ffffb097          	auipc	ra,0xffffb
    80009590:	d6e080e7          	jalr	-658(ra) # 800042fa <argaddr>
    80009594:	87aa                	mv	a5,a0
    80009596:	0007d463          	bgez	a5,8000959e <sys_thrdstop+0x56>
    return -1;
    8000959a:	57fd                	li	a5,-1
    8000959c:	a2a9                	j	800096e6 <sys_thrdstop+0x19e>
  if (argaddr(3, &handler_arg) < 0)
    8000959e:	fd040793          	addi	a5,s0,-48
    800095a2:	85be                	mv	a1,a5
    800095a4:	450d                	li	a0,3
    800095a6:	ffffb097          	auipc	ra,0xffffb
    800095aa:	d54080e7          	jalr	-684(ra) # 800042fa <argaddr>
    800095ae:	87aa                	mv	a5,a0
    800095b0:	0007d463          	bgez	a5,800095b8 <sys_thrdstop+0x70>
    return -1;
    800095b4:	57fd                	li	a5,-1
    800095b6:	aa05                	j	800096e6 <sys_thrdstop+0x19e>

  // check if the context ID is valid
  //struct proc *proc = myproc();
  int context_id;
  copyin(myproc()->pagetable, (char *)&context_id, context_id_ptr, sizeof(int));
    800095b8:	ffff9097          	auipc	ra,0xffff9
    800095bc:	23a080e7          	jalr	570(ra) # 800027f2 <myproc>
    800095c0:	87aa                	mv	a5,a0
    800095c2:	6bbc                	ld	a5,80(a5)
    800095c4:	fe043603          	ld	a2,-32(s0)
    800095c8:	fcc40713          	addi	a4,s0,-52
    800095cc:	4691                	li	a3,4
    800095ce:	85ba                	mv	a1,a4
    800095d0:	853e                	mv	a0,a5
    800095d2:	ffff9097          	auipc	ra,0xffff9
    800095d6:	dd0080e7          	jalr	-560(ra) # 800023a2 <copyin>
  //context_id = -1;
  if (context_id == -1) {
    800095da:	fcc42783          	lw	a5,-52(s0)
    800095de:	873e                	mv	a4,a5
    800095e0:	57fd                	li	a5,-1
    800095e2:	06f71b63          	bne	a4,a5,80009658 <sys_thrdstop+0x110>
    // find a free context ID
    for (int i = 0; i < MAX_THRD_NUM; i++) {
    800095e6:	fe042623          	sw	zero,-20(s0)
    800095ea:	a881                	j	8000963a <sys_thrdstop+0xf2>
      if (myproc()->valid[i] == 1) {
    800095ec:	ffff9097          	auipc	ra,0xffff9
    800095f0:	206080e7          	jalr	518(ra) # 800027f2 <myproc>
    800095f4:	872a                	mv	a4,a0
    800095f6:	fec42783          	lw	a5,-20(s0)
    800095fa:	05878793          	addi	a5,a5,88
    800095fe:	078a                	slli	a5,a5,0x2
    80009600:	97ba                	add	a5,a5,a4
    80009602:	479c                	lw	a5,8(a5)
    80009604:	873e                	mv	a4,a5
    80009606:	4785                	li	a5,1
    80009608:	02f71463          	bne	a4,a5,80009630 <sys_thrdstop+0xe8>
        context_id = i;
    8000960c:	fec42783          	lw	a5,-20(s0)
    80009610:	fcf42623          	sw	a5,-52(s0)
        myproc()->valid[i] = 0;
    80009614:	ffff9097          	auipc	ra,0xffff9
    80009618:	1de080e7          	jalr	478(ra) # 800027f2 <myproc>
    8000961c:	872a                	mv	a4,a0
    8000961e:	fec42783          	lw	a5,-20(s0)
    80009622:	05878793          	addi	a5,a5,88
    80009626:	078a                	slli	a5,a5,0x2
    80009628:	97ba                	add	a5,a5,a4
    8000962a:	0007a423          	sw	zero,8(a5)
        break;
    8000962e:	a829                	j	80009648 <sys_thrdstop+0x100>
    for (int i = 0; i < MAX_THRD_NUM; i++) {
    80009630:	fec42783          	lw	a5,-20(s0)
    80009634:	2785                	addiw	a5,a5,1
    80009636:	fef42623          	sw	a5,-20(s0)
    8000963a:	fec42783          	lw	a5,-20(s0)
    8000963e:	0007871b          	sext.w	a4,a5
    80009642:	47bd                	li	a5,15
    80009644:	fae7d4e3          	bge	a5,a4,800095ec <sys_thrdstop+0xa4>
      }
    }
    if (context_id == -1) {
    80009648:	fcc42783          	lw	a5,-52(s0)
    8000964c:	873e                	mv	a4,a5
    8000964e:	57fd                	li	a5,-1
    80009650:	00f71463          	bne	a4,a5,80009658 <sys_thrdstop+0x110>
      return -1; // no free context ID available
    80009654:	57fd                	li	a5,-1
    80009656:	a841                	j	800096e6 <sys_thrdstop+0x19e>
    }
  }
  copyout(myproc()->pagetable, context_id_ptr, (char *)&context_id, sizeof(int));
    80009658:	ffff9097          	auipc	ra,0xffff9
    8000965c:	19a080e7          	jalr	410(ra) # 800027f2 <myproc>
    80009660:	87aa                	mv	a5,a0
    80009662:	6bbc                	ld	a5,80(a5)
    80009664:	fe043703          	ld	a4,-32(s0)
    80009668:	fcc40613          	addi	a2,s0,-52
    8000966c:	4691                	li	a3,4
    8000966e:	85ba                	mv	a1,a4
    80009670:	853e                	mv	a0,a5
    80009672:	ffff9097          	auipc	ra,0xffff9
    80009676:	c62080e7          	jalr	-926(ra) # 800022d4 <copyout>
  
  myproc()->delay = delay;
    8000967a:	ffff9097          	auipc	ra,0xffff9
    8000967e:	178080e7          	jalr	376(ra) # 800027f2 <myproc>
    80009682:	86aa                	mv	a3,a0
    80009684:	fe842703          	lw	a4,-24(s0)
    80009688:	6785                	lui	a5,0x1
    8000968a:	97b6                	add	a5,a5,a3
    8000968c:	3ae7a423          	sw	a4,936(a5) # 13a8 <_entry-0x7fffec58>
  myproc()->context_id = context_id;
    80009690:	ffff9097          	auipc	ra,0xffff9
    80009694:	162080e7          	jalr	354(ra) # 800027f2 <myproc>
    80009698:	86aa                	mv	a3,a0
    8000969a:	fcc42703          	lw	a4,-52(s0)
    8000969e:	6785                	lui	a5,0x1
    800096a0:	97b6                	add	a5,a5,a3
    800096a2:	3ae7a823          	sw	a4,944(a5) # 13b0 <_entry-0x7fffec50>
  myproc()->handler = handler;
    800096a6:	ffff9097          	auipc	ra,0xffff9
    800096aa:	14c080e7          	jalr	332(ra) # 800027f2 <myproc>
    800096ae:	86aa                	mv	a3,a0
    800096b0:	fd843703          	ld	a4,-40(s0)
    800096b4:	6785                	lui	a5,0x1
    800096b6:	97b6                	add	a5,a5,a3
    800096b8:	3ce7b023          	sd	a4,960(a5) # 13c0 <_entry-0x7fffec40>
  myproc()->handler_arg = handler_arg;
    800096bc:	ffff9097          	auipc	ra,0xffff9
    800096c0:	136080e7          	jalr	310(ra) # 800027f2 <myproc>
    800096c4:	86aa                	mv	a3,a0
    800096c6:	fd043703          	ld	a4,-48(s0)
    800096ca:	6785                	lui	a5,0x1
    800096cc:	97b6                	add	a5,a5,a3
    800096ce:	3ce7b423          	sd	a4,968(a5) # 13c8 <_entry-0x7fffec38>
  myproc()->ticks = 0;
    800096d2:	ffff9097          	auipc	ra,0xffff9
    800096d6:	120080e7          	jalr	288(ra) # 800027f2 <myproc>
    800096da:	872a                	mv	a4,a0
    800096dc:	6785                	lui	a5,0x1
    800096de:	97ba                	add	a5,a5,a4
    800096e0:	3a07a623          	sw	zero,940(a5) # 13ac <_entry-0x7fffec54>
  //memmove(&myproc()->stored_frame[myproc()->context_id], myproc()->trapframe, sizeof(struct trapframe));

  //TODO: mp3

  return 0;
    800096e4:	4781                	li	a5,0
}
    800096e6:	853e                	mv	a0,a5
    800096e8:	70e2                	ld	ra,56(sp)
    800096ea:	7442                	ld	s0,48(sp)
    800096ec:	6121                	addi	sp,sp,64
    800096ee:	8082                	ret

00000000800096f0 <sys_cancelthrdstop>:

// for mp3
uint64
sys_cancelthrdstop(void)
{
    800096f0:	7179                	addi	sp,sp,-48
    800096f2:	f406                	sd	ra,40(sp)
    800096f4:	f022                	sd	s0,32(sp)
    800096f6:	ec26                	sd	s1,24(sp)
    800096f8:	1800                	addi	s0,sp,48
  int context_id, is_exit;
  if (argint(0, &context_id) < 0)
    800096fa:	fdc40793          	addi	a5,s0,-36
    800096fe:	85be                	mv	a1,a5
    80009700:	4501                	li	a0,0
    80009702:	ffffb097          	auipc	ra,0xffffb
    80009706:	bc0080e7          	jalr	-1088(ra) # 800042c2 <argint>
    8000970a:	87aa                	mv	a5,a0
    8000970c:	0007d463          	bgez	a5,80009714 <sys_cancelthrdstop+0x24>
    return -1;
    80009710:	57fd                	li	a5,-1
    80009712:	a0c9                	j	800097d4 <sys_cancelthrdstop+0xe4>
  if (argint(1, &is_exit) < 0)
    80009714:	fd840793          	addi	a5,s0,-40
    80009718:	85be                	mv	a1,a5
    8000971a:	4505                	li	a0,1
    8000971c:	ffffb097          	auipc	ra,0xffffb
    80009720:	ba6080e7          	jalr	-1114(ra) # 800042c2 <argint>
    80009724:	87aa                	mv	a5,a0
    80009726:	0007d463          	bgez	a5,8000972e <sys_cancelthrdstop+0x3e>
    return -1;
    8000972a:	57fd                	li	a5,-1
    8000972c:	a065                	j	800097d4 <sys_cancelthrdstop+0xe4>

  if (context_id < 0 || context_id >= MAX_THRD_NUM) {
    8000972e:	fdc42783          	lw	a5,-36(s0)
    80009732:	0007c863          	bltz	a5,80009742 <sys_cancelthrdstop+0x52>
    80009736:	fdc42783          	lw	a5,-36(s0)
    8000973a:	873e                	mv	a4,a5
    8000973c:	47bd                	li	a5,15
    8000973e:	00e7d463          	bge	a5,a4,80009746 <sys_cancelthrdstop+0x56>
    return -1;
    80009742:	57fd                	li	a5,-1
    80009744:	a841                	j	800097d4 <sys_cancelthrdstop+0xe4>
  }
  //struct proc *proc = myproc();
  if(is_exit == 0){
    80009746:	fd842783          	lw	a5,-40(s0)
    8000974a:	e3a1                	bnez	a5,8000978a <sys_cancelthrdstop+0x9a>
    // if(context_id==-1)
    //   return myproc()->ticks;
    //myproc()->stored_frame[context_id]=*(myproc()->trapframe);
    memmove(myproc()->stored_frame + context_id, myproc()->trapframe, sizeof(struct trapframe));
    8000974c:	ffff9097          	auipc	ra,0xffff9
    80009750:	0a6080e7          	jalr	166(ra) # 800027f2 <myproc>
    80009754:	87aa                	mv	a5,a0
    80009756:	1a878713          	addi	a4,a5,424
    8000975a:	fdc42783          	lw	a5,-36(s0)
    8000975e:	86be                	mv	a3,a5
    80009760:	87b6                	mv	a5,a3
    80009762:	078e                	slli	a5,a5,0x3
    80009764:	97b6                	add	a5,a5,a3
    80009766:	0796                	slli	a5,a5,0x5
    80009768:	00f704b3          	add	s1,a4,a5
    8000976c:	ffff9097          	auipc	ra,0xffff9
    80009770:	086080e7          	jalr	134(ra) # 800027f2 <myproc>
    80009774:	87aa                	mv	a5,a0
    80009776:	6fbc                	ld	a5,88(a5)
    80009778:	12000613          	li	a2,288
    8000977c:	85be                	mv	a1,a5
    8000977e:	8526                	mv	a0,s1
    80009780:	ffff8097          	auipc	ra,0xffff8
    80009784:	db8080e7          	jalr	-584(ra) # 80001538 <memmove>
    80009788:	a025                	j	800097b0 <sys_cancelthrdstop+0xc0>
  }
  else if(is_exit == 1){
    8000978a:	fd842783          	lw	a5,-40(s0)
    8000978e:	873e                	mv	a4,a5
    80009790:	4785                	li	a5,1
    80009792:	00f71f63          	bne	a4,a5,800097b0 <sys_cancelthrdstop+0xc0>
    myproc()->valid[context_id] = 1;
    80009796:	ffff9097          	auipc	ra,0xffff9
    8000979a:	05c080e7          	jalr	92(ra) # 800027f2 <myproc>
    8000979e:	872a                	mv	a4,a0
    800097a0:	fdc42783          	lw	a5,-36(s0)
    800097a4:	05878793          	addi	a5,a5,88
    800097a8:	078a                	slli	a5,a5,0x2
    800097aa:	97ba                	add	a5,a5,a4
    800097ac:	4705                	li	a4,1
    800097ae:	c798                	sw	a4,8(a5)
  }
  myproc()->delay = 0;
    800097b0:	ffff9097          	auipc	ra,0xffff9
    800097b4:	042080e7          	jalr	66(ra) # 800027f2 <myproc>
    800097b8:	872a                	mv	a4,a0
    800097ba:	6785                	lui	a5,0x1
    800097bc:	97ba                	add	a5,a5,a4
    800097be:	3a07a423          	sw	zero,936(a5) # 13a8 <_entry-0x7fffec58>
  return myproc()->ticks;
    800097c2:	ffff9097          	auipc	ra,0xffff9
    800097c6:	030080e7          	jalr	48(ra) # 800027f2 <myproc>
    800097ca:	872a                	mv	a4,a0
    800097cc:	6785                	lui	a5,0x1
    800097ce:	97ba                	add	a5,a5,a4
    800097d0:	3ac7a783          	lw	a5,940(a5) # 13ac <_entry-0x7fffec54>
  

  //TODO: mp3

  return 0;
}
    800097d4:	853e                	mv	a0,a5
    800097d6:	70a2                	ld	ra,40(sp)
    800097d8:	7402                	ld	s0,32(sp)
    800097da:	64e2                	ld	s1,24(sp)
    800097dc:	6145                	addi	sp,sp,48
    800097de:	8082                	ret

00000000800097e0 <sys_thrdresume>:

// for mp3
uint64
sys_thrdresume(void)
{
    800097e0:	7179                	addi	sp,sp,-48
    800097e2:	f406                	sd	ra,40(sp)
    800097e4:	f022                	sd	s0,32(sp)
    800097e6:	ec26                	sd	s1,24(sp)
    800097e8:	1800                	addi	s0,sp,48
  int context_id;
  if (argint(0, &context_id) < 0)
    800097ea:	fdc40793          	addi	a5,s0,-36
    800097ee:	85be                	mv	a1,a5
    800097f0:	4501                	li	a0,0
    800097f2:	ffffb097          	auipc	ra,0xffffb
    800097f6:	ad0080e7          	jalr	-1328(ra) # 800042c2 <argint>
    800097fa:	87aa                	mv	a5,a0
    800097fc:	0007d463          	bgez	a5,80009804 <sys_thrdresume+0x24>
    return -1;
    80009800:	57fd                	li	a5,-1
    80009802:	a885                	j	80009872 <sys_thrdresume+0x92>

  //struct proc *proc = myproc();
  if(context_id >= 0 && context_id <= 15 && myproc()->valid[context_id] == 0){
    80009804:	fdc42783          	lw	a5,-36(s0)
    80009808:	0607c463          	bltz	a5,80009870 <sys_thrdresume+0x90>
    8000980c:	fdc42783          	lw	a5,-36(s0)
    80009810:	873e                	mv	a4,a5
    80009812:	47bd                	li	a5,15
    80009814:	04e7ce63          	blt	a5,a4,80009870 <sys_thrdresume+0x90>
    80009818:	ffff9097          	auipc	ra,0xffff9
    8000981c:	fda080e7          	jalr	-38(ra) # 800027f2 <myproc>
    80009820:	872a                	mv	a4,a0
    80009822:	fdc42783          	lw	a5,-36(s0)
    80009826:	05878793          	addi	a5,a5,88
    8000982a:	078a                	slli	a5,a5,0x2
    8000982c:	97ba                	add	a5,a5,a4
    8000982e:	479c                	lw	a5,8(a5)
    80009830:	e3a1                	bnez	a5,80009870 <sys_thrdresume+0x90>
    //*(myproc()->trapframe) = myproc()->stored_frame[context_id];
    //panic("re");
    memmove(myproc()->trapframe, myproc()->stored_frame + context_id, sizeof(struct trapframe));
    80009832:	ffff9097          	auipc	ra,0xffff9
    80009836:	fc0080e7          	jalr	-64(ra) # 800027f2 <myproc>
    8000983a:	87aa                	mv	a5,a0
    8000983c:	6fa4                	ld	s1,88(a5)
    8000983e:	ffff9097          	auipc	ra,0xffff9
    80009842:	fb4080e7          	jalr	-76(ra) # 800027f2 <myproc>
    80009846:	87aa                	mv	a5,a0
    80009848:	1a878713          	addi	a4,a5,424
    8000984c:	fdc42783          	lw	a5,-36(s0)
    80009850:	86be                	mv	a3,a5
    80009852:	87b6                	mv	a5,a3
    80009854:	078e                	slli	a5,a5,0x3
    80009856:	97b6                	add	a5,a5,a3
    80009858:	0796                	slli	a5,a5,0x5
    8000985a:	97ba                	add	a5,a5,a4
    8000985c:	12000613          	li	a2,288
    80009860:	85be                	mv	a1,a5
    80009862:	8526                	mv	a0,s1
    80009864:	ffff8097          	auipc	ra,0xffff8
    80009868:	cd4080e7          	jalr	-812(ra) # 80001538 <memmove>
    return 0;
    8000986c:	4781                	li	a5,0
    8000986e:	a011                	j	80009872 <sys_thrdresume+0x92>
  }
  else return -1;
    80009870:	57fd                	li	a5,-1
  //TODO: mp3

  return 0;
}
    80009872:	853e                	mv	a0,a5
    80009874:	70a2                	ld	ra,40(sp)
    80009876:	7402                	ld	s0,32(sp)
    80009878:	64e2                	ld	s1,24(sp)
    8000987a:	6145                	addi	sp,sp,48
    8000987c:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
