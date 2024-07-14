
user/_setjmp:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <setjmp>:
       0:	e100                	sd	s0,0(a0)
       2:	e504                	sd	s1,8(a0)
       4:	01253823          	sd	s2,16(a0)
       8:	01353c23          	sd	s3,24(a0)
       c:	03453023          	sd	s4,32(a0)
      10:	03553423          	sd	s5,40(a0)
      14:	03653823          	sd	s6,48(a0)
      18:	03753c23          	sd	s7,56(a0)
      1c:	05853023          	sd	s8,64(a0)
      20:	05953423          	sd	s9,72(a0)
      24:	05a53823          	sd	s10,80(a0)
      28:	05b53c23          	sd	s11,88(a0)
      2c:	06153023          	sd	ra,96(a0)
      30:	06253423          	sd	sp,104(a0)
      34:	4501                	li	a0,0
      36:	8082                	ret

0000000000000038 <longjmp>:
      38:	6100                	ld	s0,0(a0)
      3a:	6504                	ld	s1,8(a0)
      3c:	01053903          	ld	s2,16(a0)
      40:	01853983          	ld	s3,24(a0)
      44:	02053a03          	ld	s4,32(a0)
      48:	02853a83          	ld	s5,40(a0)
      4c:	03053b03          	ld	s6,48(a0)
      50:	03853b83          	ld	s7,56(a0)
      54:	04053c03          	ld	s8,64(a0)
      58:	04853c83          	ld	s9,72(a0)
      5c:	05053d03          	ld	s10,80(a0)
      60:	05853d83          	ld	s11,88(a0)
      64:	06053083          	ld	ra,96(a0)
      68:	06853103          	ld	sp,104(a0)
      6c:	c199                	beqz	a1,72 <longjmp_1>
      6e:	852e                	mv	a0,a1
      70:	8082                	ret

0000000000000072 <longjmp_1>:
      72:	4505                	li	a0,1
      74:	8082                	ret

0000000000000076 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      76:	7179                	addi	sp,sp,-48
      78:	f422                	sd	s0,40(sp)
      7a:	1800                	addi	s0,sp,48
      7c:	fca43c23          	sd	a0,-40(s0)
      80:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      84:	fd843783          	ld	a5,-40(s0)
      88:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      8c:	0001                	nop
      8e:	fd043703          	ld	a4,-48(s0)
      92:	00170793          	addi	a5,a4,1
      96:	fcf43823          	sd	a5,-48(s0)
      9a:	fd843783          	ld	a5,-40(s0)
      9e:	00178693          	addi	a3,a5,1
      a2:	fcd43c23          	sd	a3,-40(s0)
      a6:	00074703          	lbu	a4,0(a4)
      aa:	00e78023          	sb	a4,0(a5)
      ae:	0007c783          	lbu	a5,0(a5)
      b2:	fff1                	bnez	a5,8e <strcpy+0x18>
    ;
  return os;
      b4:	fe843783          	ld	a5,-24(s0)
}
      b8:	853e                	mv	a0,a5
      ba:	7422                	ld	s0,40(sp)
      bc:	6145                	addi	sp,sp,48
      be:	8082                	ret

00000000000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      c0:	1101                	addi	sp,sp,-32
      c2:	ec22                	sd	s0,24(sp)
      c4:	1000                	addi	s0,sp,32
      c6:	fea43423          	sd	a0,-24(s0)
      ca:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      ce:	a819                	j	e4 <strcmp+0x24>
    p++, q++;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	0785                	addi	a5,a5,1
      d6:	fef43423          	sd	a5,-24(s0)
      da:	fe043783          	ld	a5,-32(s0)
      de:	0785                	addi	a5,a5,1
      e0:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      e4:	fe843783          	ld	a5,-24(s0)
      e8:	0007c783          	lbu	a5,0(a5)
      ec:	cb99                	beqz	a5,102 <strcmp+0x42>
      ee:	fe843783          	ld	a5,-24(s0)
      f2:	0007c703          	lbu	a4,0(a5)
      f6:	fe043783          	ld	a5,-32(s0)
      fa:	0007c783          	lbu	a5,0(a5)
      fe:	fcf709e3          	beq	a4,a5,d0 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     102:	fe843783          	ld	a5,-24(s0)
     106:	0007c783          	lbu	a5,0(a5)
     10a:	0007871b          	sext.w	a4,a5
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	2781                	sext.w	a5,a5
     118:	40f707bb          	subw	a5,a4,a5
     11c:	2781                	sext.w	a5,a5
}
     11e:	853e                	mv	a0,a5
     120:	6462                	ld	s0,24(sp)
     122:	6105                	addi	sp,sp,32
     124:	8082                	ret

0000000000000126 <strlen>:

uint
strlen(const char *s)
{
     126:	7179                	addi	sp,sp,-48
     128:	f422                	sd	s0,40(sp)
     12a:	1800                	addi	s0,sp,48
     12c:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     130:	fe042623          	sw	zero,-20(s0)
     134:	a031                	j	140 <strlen+0x1a>
     136:	fec42783          	lw	a5,-20(s0)
     13a:	2785                	addiw	a5,a5,1
     13c:	fef42623          	sw	a5,-20(s0)
     140:	fec42783          	lw	a5,-20(s0)
     144:	fd843703          	ld	a4,-40(s0)
     148:	97ba                	add	a5,a5,a4
     14a:	0007c783          	lbu	a5,0(a5)
     14e:	f7e5                	bnez	a5,136 <strlen+0x10>
    ;
  return n;
     150:	fec42783          	lw	a5,-20(s0)
}
     154:	853e                	mv	a0,a5
     156:	7422                	ld	s0,40(sp)
     158:	6145                	addi	sp,sp,48
     15a:	8082                	ret

000000000000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
     15c:	7179                	addi	sp,sp,-48
     15e:	f422                	sd	s0,40(sp)
     160:	1800                	addi	s0,sp,48
     162:	fca43c23          	sd	a0,-40(s0)
     166:	87ae                	mv	a5,a1
     168:	8732                	mv	a4,a2
     16a:	fcf42a23          	sw	a5,-44(s0)
     16e:	87ba                	mv	a5,a4
     170:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     174:	fd843783          	ld	a5,-40(s0)
     178:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     17c:	fe042623          	sw	zero,-20(s0)
     180:	a00d                	j	1a2 <memset+0x46>
    cdst[i] = c;
     182:	fec42783          	lw	a5,-20(s0)
     186:	fe043703          	ld	a4,-32(s0)
     18a:	97ba                	add	a5,a5,a4
     18c:	fd442703          	lw	a4,-44(s0)
     190:	0ff77713          	andi	a4,a4,255
     194:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     198:	fec42783          	lw	a5,-20(s0)
     19c:	2785                	addiw	a5,a5,1
     19e:	fef42623          	sw	a5,-20(s0)
     1a2:	fec42703          	lw	a4,-20(s0)
     1a6:	fd042783          	lw	a5,-48(s0)
     1aa:	2781                	sext.w	a5,a5
     1ac:	fcf76be3          	bltu	a4,a5,182 <memset+0x26>
  }
  return dst;
     1b0:	fd843783          	ld	a5,-40(s0)
}
     1b4:	853e                	mv	a0,a5
     1b6:	7422                	ld	s0,40(sp)
     1b8:	6145                	addi	sp,sp,48
     1ba:	8082                	ret

00000000000001bc <strchr>:

char*
strchr(const char *s, char c)
{
     1bc:	1101                	addi	sp,sp,-32
     1be:	ec22                	sd	s0,24(sp)
     1c0:	1000                	addi	s0,sp,32
     1c2:	fea43423          	sd	a0,-24(s0)
     1c6:	87ae                	mv	a5,a1
     1c8:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1cc:	a01d                	j	1f2 <strchr+0x36>
    if(*s == c)
     1ce:	fe843783          	ld	a5,-24(s0)
     1d2:	0007c703          	lbu	a4,0(a5)
     1d6:	fe744783          	lbu	a5,-25(s0)
     1da:	0ff7f793          	andi	a5,a5,255
     1de:	00e79563          	bne	a5,a4,1e8 <strchr+0x2c>
      return (char*)s;
     1e2:	fe843783          	ld	a5,-24(s0)
     1e6:	a821                	j	1fe <strchr+0x42>
  for(; *s; s++)
     1e8:	fe843783          	ld	a5,-24(s0)
     1ec:	0785                	addi	a5,a5,1
     1ee:	fef43423          	sd	a5,-24(s0)
     1f2:	fe843783          	ld	a5,-24(s0)
     1f6:	0007c783          	lbu	a5,0(a5)
     1fa:	fbf1                	bnez	a5,1ce <strchr+0x12>
  return 0;
     1fc:	4781                	li	a5,0
}
     1fe:	853e                	mv	a0,a5
     200:	6462                	ld	s0,24(sp)
     202:	6105                	addi	sp,sp,32
     204:	8082                	ret

0000000000000206 <gets>:

char*
gets(char *buf, int max)
{
     206:	7179                	addi	sp,sp,-48
     208:	f406                	sd	ra,40(sp)
     20a:	f022                	sd	s0,32(sp)
     20c:	1800                	addi	s0,sp,48
     20e:	fca43c23          	sd	a0,-40(s0)
     212:	87ae                	mv	a5,a1
     214:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     218:	fe042623          	sw	zero,-20(s0)
     21c:	a8a1                	j	274 <gets+0x6e>
    cc = read(0, &c, 1);
     21e:	fe740793          	addi	a5,s0,-25
     222:	4605                	li	a2,1
     224:	85be                	mv	a1,a5
     226:	4501                	li	a0,0
     228:	00000097          	auipc	ra,0x0
     22c:	2f6080e7          	jalr	758(ra) # 51e <read>
     230:	87aa                	mv	a5,a0
     232:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     236:	fe842783          	lw	a5,-24(s0)
     23a:	2781                	sext.w	a5,a5
     23c:	04f05763          	blez	a5,28a <gets+0x84>
      break;
    buf[i++] = c;
     240:	fec42783          	lw	a5,-20(s0)
     244:	0017871b          	addiw	a4,a5,1
     248:	fee42623          	sw	a4,-20(s0)
     24c:	873e                	mv	a4,a5
     24e:	fd843783          	ld	a5,-40(s0)
     252:	97ba                	add	a5,a5,a4
     254:	fe744703          	lbu	a4,-25(s0)
     258:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     25c:	fe744783          	lbu	a5,-25(s0)
     260:	873e                	mv	a4,a5
     262:	47a9                	li	a5,10
     264:	02f70463          	beq	a4,a5,28c <gets+0x86>
     268:	fe744783          	lbu	a5,-25(s0)
     26c:	873e                	mv	a4,a5
     26e:	47b5                	li	a5,13
     270:	00f70e63          	beq	a4,a5,28c <gets+0x86>
  for(i=0; i+1 < max; ){
     274:	fec42783          	lw	a5,-20(s0)
     278:	2785                	addiw	a5,a5,1
     27a:	0007871b          	sext.w	a4,a5
     27e:	fd442783          	lw	a5,-44(s0)
     282:	2781                	sext.w	a5,a5
     284:	f8f74de3          	blt	a4,a5,21e <gets+0x18>
     288:	a011                	j	28c <gets+0x86>
      break;
     28a:	0001                	nop
      break;
  }
  buf[i] = '\0';
     28c:	fec42783          	lw	a5,-20(s0)
     290:	fd843703          	ld	a4,-40(s0)
     294:	97ba                	add	a5,a5,a4
     296:	00078023          	sb	zero,0(a5)
  return buf;
     29a:	fd843783          	ld	a5,-40(s0)
}
     29e:	853e                	mv	a0,a5
     2a0:	70a2                	ld	ra,40(sp)
     2a2:	7402                	ld	s0,32(sp)
     2a4:	6145                	addi	sp,sp,48
     2a6:	8082                	ret

00000000000002a8 <stat>:

int
stat(const char *n, struct stat *st)
{
     2a8:	7179                	addi	sp,sp,-48
     2aa:	f406                	sd	ra,40(sp)
     2ac:	f022                	sd	s0,32(sp)
     2ae:	1800                	addi	s0,sp,48
     2b0:	fca43c23          	sd	a0,-40(s0)
     2b4:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2b8:	4581                	li	a1,0
     2ba:	fd843503          	ld	a0,-40(s0)
     2be:	00000097          	auipc	ra,0x0
     2c2:	288080e7          	jalr	648(ra) # 546 <open>
     2c6:	87aa                	mv	a5,a0
     2c8:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2cc:	fec42783          	lw	a5,-20(s0)
     2d0:	2781                	sext.w	a5,a5
     2d2:	0007d463          	bgez	a5,2da <stat+0x32>
    return -1;
     2d6:	57fd                	li	a5,-1
     2d8:	a035                	j	304 <stat+0x5c>
  r = fstat(fd, st);
     2da:	fec42783          	lw	a5,-20(s0)
     2de:	fd043583          	ld	a1,-48(s0)
     2e2:	853e                	mv	a0,a5
     2e4:	00000097          	auipc	ra,0x0
     2e8:	27a080e7          	jalr	634(ra) # 55e <fstat>
     2ec:	87aa                	mv	a5,a0
     2ee:	fef42423          	sw	a5,-24(s0)
  close(fd);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	853e                	mv	a0,a5
     2f8:	00000097          	auipc	ra,0x0
     2fc:	236080e7          	jalr	566(ra) # 52e <close>
  return r;
     300:	fe842783          	lw	a5,-24(s0)
}
     304:	853e                	mv	a0,a5
     306:	70a2                	ld	ra,40(sp)
     308:	7402                	ld	s0,32(sp)
     30a:	6145                	addi	sp,sp,48
     30c:	8082                	ret

000000000000030e <atoi>:

int
atoi(const char *s)
{
     30e:	7179                	addi	sp,sp,-48
     310:	f422                	sd	s0,40(sp)
     312:	1800                	addi	s0,sp,48
     314:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     318:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     31c:	a815                	j	350 <atoi+0x42>
    n = n*10 + *s++ - '0';
     31e:	fec42703          	lw	a4,-20(s0)
     322:	87ba                	mv	a5,a4
     324:	0027979b          	slliw	a5,a5,0x2
     328:	9fb9                	addw	a5,a5,a4
     32a:	0017979b          	slliw	a5,a5,0x1
     32e:	0007871b          	sext.w	a4,a5
     332:	fd843783          	ld	a5,-40(s0)
     336:	00178693          	addi	a3,a5,1
     33a:	fcd43c23          	sd	a3,-40(s0)
     33e:	0007c783          	lbu	a5,0(a5)
     342:	2781                	sext.w	a5,a5
     344:	9fb9                	addw	a5,a5,a4
     346:	2781                	sext.w	a5,a5
     348:	fd07879b          	addiw	a5,a5,-48
     34c:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     350:	fd843783          	ld	a5,-40(s0)
     354:	0007c783          	lbu	a5,0(a5)
     358:	873e                	mv	a4,a5
     35a:	02f00793          	li	a5,47
     35e:	00e7fb63          	bgeu	a5,a4,374 <atoi+0x66>
     362:	fd843783          	ld	a5,-40(s0)
     366:	0007c783          	lbu	a5,0(a5)
     36a:	873e                	mv	a4,a5
     36c:	03900793          	li	a5,57
     370:	fae7f7e3          	bgeu	a5,a4,31e <atoi+0x10>
  return n;
     374:	fec42783          	lw	a5,-20(s0)
}
     378:	853e                	mv	a0,a5
     37a:	7422                	ld	s0,40(sp)
     37c:	6145                	addi	sp,sp,48
     37e:	8082                	ret

0000000000000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     380:	7139                	addi	sp,sp,-64
     382:	fc22                	sd	s0,56(sp)
     384:	0080                	addi	s0,sp,64
     386:	fca43c23          	sd	a0,-40(s0)
     38a:	fcb43823          	sd	a1,-48(s0)
     38e:	87b2                	mv	a5,a2
     390:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     394:	fd843783          	ld	a5,-40(s0)
     398:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     39c:	fd043783          	ld	a5,-48(s0)
     3a0:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3a4:	fe043703          	ld	a4,-32(s0)
     3a8:	fe843783          	ld	a5,-24(s0)
     3ac:	02e7fc63          	bgeu	a5,a4,3e4 <memmove+0x64>
    while(n-- > 0)
     3b0:	a00d                	j	3d2 <memmove+0x52>
      *dst++ = *src++;
     3b2:	fe043703          	ld	a4,-32(s0)
     3b6:	00170793          	addi	a5,a4,1
     3ba:	fef43023          	sd	a5,-32(s0)
     3be:	fe843783          	ld	a5,-24(s0)
     3c2:	00178693          	addi	a3,a5,1
     3c6:	fed43423          	sd	a3,-24(s0)
     3ca:	00074703          	lbu	a4,0(a4)
     3ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3d2:	fcc42783          	lw	a5,-52(s0)
     3d6:	fff7871b          	addiw	a4,a5,-1
     3da:	fce42623          	sw	a4,-52(s0)
     3de:	fcf04ae3          	bgtz	a5,3b2 <memmove+0x32>
     3e2:	a891                	j	436 <memmove+0xb6>
  } else {
    dst += n;
     3e4:	fcc42783          	lw	a5,-52(s0)
     3e8:	fe843703          	ld	a4,-24(s0)
     3ec:	97ba                	add	a5,a5,a4
     3ee:	fef43423          	sd	a5,-24(s0)
    src += n;
     3f2:	fcc42783          	lw	a5,-52(s0)
     3f6:	fe043703          	ld	a4,-32(s0)
     3fa:	97ba                	add	a5,a5,a4
     3fc:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     400:	a01d                	j	426 <memmove+0xa6>
      *--dst = *--src;
     402:	fe043783          	ld	a5,-32(s0)
     406:	17fd                	addi	a5,a5,-1
     408:	fef43023          	sd	a5,-32(s0)
     40c:	fe843783          	ld	a5,-24(s0)
     410:	17fd                	addi	a5,a5,-1
     412:	fef43423          	sd	a5,-24(s0)
     416:	fe043783          	ld	a5,-32(s0)
     41a:	0007c703          	lbu	a4,0(a5)
     41e:	fe843783          	ld	a5,-24(s0)
     422:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fff7871b          	addiw	a4,a5,-1
     42e:	fce42623          	sw	a4,-52(s0)
     432:	fcf048e3          	bgtz	a5,402 <memmove+0x82>
  }
  return vdst;
     436:	fd843783          	ld	a5,-40(s0)
}
     43a:	853e                	mv	a0,a5
     43c:	7462                	ld	s0,56(sp)
     43e:	6121                	addi	sp,sp,64
     440:	8082                	ret

0000000000000442 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     442:	7139                	addi	sp,sp,-64
     444:	fc22                	sd	s0,56(sp)
     446:	0080                	addi	s0,sp,64
     448:	fca43c23          	sd	a0,-40(s0)
     44c:	fcb43823          	sd	a1,-48(s0)
     450:	87b2                	mv	a5,a2
     452:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     456:	fd843783          	ld	a5,-40(s0)
     45a:	fef43423          	sd	a5,-24(s0)
     45e:	fd043783          	ld	a5,-48(s0)
     462:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     466:	a0a1                	j	4ae <memcmp+0x6c>
    if (*p1 != *p2) {
     468:	fe843783          	ld	a5,-24(s0)
     46c:	0007c703          	lbu	a4,0(a5)
     470:	fe043783          	ld	a5,-32(s0)
     474:	0007c783          	lbu	a5,0(a5)
     478:	02f70163          	beq	a4,a5,49a <memcmp+0x58>
      return *p1 - *p2;
     47c:	fe843783          	ld	a5,-24(s0)
     480:	0007c783          	lbu	a5,0(a5)
     484:	0007871b          	sext.w	a4,a5
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	2781                	sext.w	a5,a5
     492:	40f707bb          	subw	a5,a4,a5
     496:	2781                	sext.w	a5,a5
     498:	a01d                	j	4be <memcmp+0x7c>
    }
    p1++;
     49a:	fe843783          	ld	a5,-24(s0)
     49e:	0785                	addi	a5,a5,1
     4a0:	fef43423          	sd	a5,-24(s0)
    p2++;
     4a4:	fe043783          	ld	a5,-32(s0)
     4a8:	0785                	addi	a5,a5,1
     4aa:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4ae:	fcc42783          	lw	a5,-52(s0)
     4b2:	fff7871b          	addiw	a4,a5,-1
     4b6:	fce42623          	sw	a4,-52(s0)
     4ba:	f7dd                	bnez	a5,468 <memcmp+0x26>
  }
  return 0;
     4bc:	4781                	li	a5,0
}
     4be:	853e                	mv	a0,a5
     4c0:	7462                	ld	s0,56(sp)
     4c2:	6121                	addi	sp,sp,64
     4c4:	8082                	ret

00000000000004c6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4c6:	7179                	addi	sp,sp,-48
     4c8:	f406                	sd	ra,40(sp)
     4ca:	f022                	sd	s0,32(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fea43423          	sd	a0,-24(s0)
     4d2:	feb43023          	sd	a1,-32(s0)
     4d6:	87b2                	mv	a5,a2
     4d8:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4dc:	fdc42783          	lw	a5,-36(s0)
     4e0:	863e                	mv	a2,a5
     4e2:	fe043583          	ld	a1,-32(s0)
     4e6:	fe843503          	ld	a0,-24(s0)
     4ea:	00000097          	auipc	ra,0x0
     4ee:	e96080e7          	jalr	-362(ra) # 380 <memmove>
     4f2:	87aa                	mv	a5,a0
}
     4f4:	853e                	mv	a0,a5
     4f6:	70a2                	ld	ra,40(sp)
     4f8:	7402                	ld	s0,32(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     4fe:	4885                	li	a7,1
 ecall
     500:	00000073          	ecall
 ret
     504:	8082                	ret

0000000000000506 <exit>:
.global exit
exit:
 li a7, SYS_exit
     506:	4889                	li	a7,2
 ecall
     508:	00000073          	ecall
 ret
     50c:	8082                	ret

000000000000050e <wait>:
.global wait
wait:
 li a7, SYS_wait
     50e:	488d                	li	a7,3
 ecall
     510:	00000073          	ecall
 ret
     514:	8082                	ret

0000000000000516 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     516:	4891                	li	a7,4
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <read>:
.global read
read:
 li a7, SYS_read
     51e:	4895                	li	a7,5
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <write>:
.global write
write:
 li a7, SYS_write
     526:	48c1                	li	a7,16
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <close>:
.global close
close:
 li a7, SYS_close
     52e:	48d5                	li	a7,21
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <kill>:
.global kill
kill:
 li a7, SYS_kill
     536:	4899                	li	a7,6
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <exec>:
.global exec
exec:
 li a7, SYS_exec
     53e:	489d                	li	a7,7
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <open>:
.global open
open:
 li a7, SYS_open
     546:	48bd                	li	a7,15
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     54e:	48c5                	li	a7,17
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     556:	48c9                	li	a7,18
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     55e:	48a1                	li	a7,8
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <link>:
.global link
link:
 li a7, SYS_link
     566:	48cd                	li	a7,19
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     56e:	48d1                	li	a7,20
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     576:	48a5                	li	a7,9
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <dup>:
.global dup
dup:
 li a7, SYS_dup
     57e:	48a9                	li	a7,10
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     586:	48ad                	li	a7,11
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     58e:	48b1                	li	a7,12
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     596:	48b5                	li	a7,13
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     59e:	48b9                	li	a7,14
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5a6:	48d9                	li	a7,22
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5ae:	48dd                	li	a7,23
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5b6:	48e1                	li	a7,24
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5be:	1101                	addi	sp,sp,-32
     5c0:	ec06                	sd	ra,24(sp)
     5c2:	e822                	sd	s0,16(sp)
     5c4:	1000                	addi	s0,sp,32
     5c6:	87aa                	mv	a5,a0
     5c8:	872e                	mv	a4,a1
     5ca:	fef42623          	sw	a5,-20(s0)
     5ce:	87ba                	mv	a5,a4
     5d0:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5d4:	feb40713          	addi	a4,s0,-21
     5d8:	fec42783          	lw	a5,-20(s0)
     5dc:	4605                	li	a2,1
     5de:	85ba                	mv	a1,a4
     5e0:	853e                	mv	a0,a5
     5e2:	00000097          	auipc	ra,0x0
     5e6:	f44080e7          	jalr	-188(ra) # 526 <write>
}
     5ea:	0001                	nop
     5ec:	60e2                	ld	ra,24(sp)
     5ee:	6442                	ld	s0,16(sp)
     5f0:	6105                	addi	sp,sp,32
     5f2:	8082                	ret

00000000000005f4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     5f4:	7139                	addi	sp,sp,-64
     5f6:	fc06                	sd	ra,56(sp)
     5f8:	f822                	sd	s0,48(sp)
     5fa:	0080                	addi	s0,sp,64
     5fc:	87aa                	mv	a5,a0
     5fe:	8736                	mv	a4,a3
     600:	fcf42623          	sw	a5,-52(s0)
     604:	87ae                	mv	a5,a1
     606:	fcf42423          	sw	a5,-56(s0)
     60a:	87b2                	mv	a5,a2
     60c:	fcf42223          	sw	a5,-60(s0)
     610:	87ba                	mv	a5,a4
     612:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     616:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     61a:	fc042783          	lw	a5,-64(s0)
     61e:	2781                	sext.w	a5,a5
     620:	c38d                	beqz	a5,642 <printint+0x4e>
     622:	fc842783          	lw	a5,-56(s0)
     626:	2781                	sext.w	a5,a5
     628:	0007dd63          	bgez	a5,642 <printint+0x4e>
    neg = 1;
     62c:	4785                	li	a5,1
     62e:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     632:	fc842783          	lw	a5,-56(s0)
     636:	40f007bb          	negw	a5,a5
     63a:	2781                	sext.w	a5,a5
     63c:	fef42223          	sw	a5,-28(s0)
     640:	a029                	j	64a <printint+0x56>
  } else {
    x = xx;
     642:	fc842783          	lw	a5,-56(s0)
     646:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     64a:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     64e:	fc442783          	lw	a5,-60(s0)
     652:	fe442703          	lw	a4,-28(s0)
     656:	02f777bb          	remuw	a5,a4,a5
     65a:	0007861b          	sext.w	a2,a5
     65e:	fec42783          	lw	a5,-20(s0)
     662:	0017871b          	addiw	a4,a5,1
     666:	fee42623          	sw	a4,-20(s0)
     66a:	00001697          	auipc	a3,0x1
     66e:	d6668693          	addi	a3,a3,-666 # 13d0 <digits>
     672:	02061713          	slli	a4,a2,0x20
     676:	9301                	srli	a4,a4,0x20
     678:	9736                	add	a4,a4,a3
     67a:	00074703          	lbu	a4,0(a4)
     67e:	ff040693          	addi	a3,s0,-16
     682:	97b6                	add	a5,a5,a3
     684:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     688:	fc442783          	lw	a5,-60(s0)
     68c:	fe442703          	lw	a4,-28(s0)
     690:	02f757bb          	divuw	a5,a4,a5
     694:	fef42223          	sw	a5,-28(s0)
     698:	fe442783          	lw	a5,-28(s0)
     69c:	2781                	sext.w	a5,a5
     69e:	fbc5                	bnez	a5,64e <printint+0x5a>
  if(neg)
     6a0:	fe842783          	lw	a5,-24(s0)
     6a4:	2781                	sext.w	a5,a5
     6a6:	cf95                	beqz	a5,6e2 <printint+0xee>
    buf[i++] = '-';
     6a8:	fec42783          	lw	a5,-20(s0)
     6ac:	0017871b          	addiw	a4,a5,1
     6b0:	fee42623          	sw	a4,-20(s0)
     6b4:	ff040713          	addi	a4,s0,-16
     6b8:	97ba                	add	a5,a5,a4
     6ba:	02d00713          	li	a4,45
     6be:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6c2:	a005                	j	6e2 <printint+0xee>
    putc(fd, buf[i]);
     6c4:	fec42783          	lw	a5,-20(s0)
     6c8:	ff040713          	addi	a4,s0,-16
     6cc:	97ba                	add	a5,a5,a4
     6ce:	fe07c703          	lbu	a4,-32(a5)
     6d2:	fcc42783          	lw	a5,-52(s0)
     6d6:	85ba                	mv	a1,a4
     6d8:	853e                	mv	a0,a5
     6da:	00000097          	auipc	ra,0x0
     6de:	ee4080e7          	jalr	-284(ra) # 5be <putc>
  while(--i >= 0)
     6e2:	fec42783          	lw	a5,-20(s0)
     6e6:	37fd                	addiw	a5,a5,-1
     6e8:	fef42623          	sw	a5,-20(s0)
     6ec:	fec42783          	lw	a5,-20(s0)
     6f0:	2781                	sext.w	a5,a5
     6f2:	fc07d9e3          	bgez	a5,6c4 <printint+0xd0>
}
     6f6:	0001                	nop
     6f8:	0001                	nop
     6fa:	70e2                	ld	ra,56(sp)
     6fc:	7442                	ld	s0,48(sp)
     6fe:	6121                	addi	sp,sp,64
     700:	8082                	ret

0000000000000702 <printptr>:

static void
printptr(int fd, uint64 x) {
     702:	7179                	addi	sp,sp,-48
     704:	f406                	sd	ra,40(sp)
     706:	f022                	sd	s0,32(sp)
     708:	1800                	addi	s0,sp,48
     70a:	87aa                	mv	a5,a0
     70c:	fcb43823          	sd	a1,-48(s0)
     710:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     714:	fdc42783          	lw	a5,-36(s0)
     718:	03000593          	li	a1,48
     71c:	853e                	mv	a0,a5
     71e:	00000097          	auipc	ra,0x0
     722:	ea0080e7          	jalr	-352(ra) # 5be <putc>
  putc(fd, 'x');
     726:	fdc42783          	lw	a5,-36(s0)
     72a:	07800593          	li	a1,120
     72e:	853e                	mv	a0,a5
     730:	00000097          	auipc	ra,0x0
     734:	e8e080e7          	jalr	-370(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     738:	fe042623          	sw	zero,-20(s0)
     73c:	a82d                	j	776 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     73e:	fd043783          	ld	a5,-48(s0)
     742:	93f1                	srli	a5,a5,0x3c
     744:	00001717          	auipc	a4,0x1
     748:	c8c70713          	addi	a4,a4,-884 # 13d0 <digits>
     74c:	97ba                	add	a5,a5,a4
     74e:	0007c703          	lbu	a4,0(a5)
     752:	fdc42783          	lw	a5,-36(s0)
     756:	85ba                	mv	a1,a4
     758:	853e                	mv	a0,a5
     75a:	00000097          	auipc	ra,0x0
     75e:	e64080e7          	jalr	-412(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     762:	fec42783          	lw	a5,-20(s0)
     766:	2785                	addiw	a5,a5,1
     768:	fef42623          	sw	a5,-20(s0)
     76c:	fd043783          	ld	a5,-48(s0)
     770:	0792                	slli	a5,a5,0x4
     772:	fcf43823          	sd	a5,-48(s0)
     776:	fec42783          	lw	a5,-20(s0)
     77a:	873e                	mv	a4,a5
     77c:	47bd                	li	a5,15
     77e:	fce7f0e3          	bgeu	a5,a4,73e <printptr+0x3c>
}
     782:	0001                	nop
     784:	0001                	nop
     786:	70a2                	ld	ra,40(sp)
     788:	7402                	ld	s0,32(sp)
     78a:	6145                	addi	sp,sp,48
     78c:	8082                	ret

000000000000078e <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     78e:	715d                	addi	sp,sp,-80
     790:	e486                	sd	ra,72(sp)
     792:	e0a2                	sd	s0,64(sp)
     794:	0880                	addi	s0,sp,80
     796:	87aa                	mv	a5,a0
     798:	fcb43023          	sd	a1,-64(s0)
     79c:	fac43c23          	sd	a2,-72(s0)
     7a0:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7a4:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7a8:	fe042223          	sw	zero,-28(s0)
     7ac:	a42d                	j	9d6 <vprintf+0x248>
    c = fmt[i] & 0xff;
     7ae:	fe442783          	lw	a5,-28(s0)
     7b2:	fc043703          	ld	a4,-64(s0)
     7b6:	97ba                	add	a5,a5,a4
     7b8:	0007c783          	lbu	a5,0(a5)
     7bc:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7c0:	fe042783          	lw	a5,-32(s0)
     7c4:	2781                	sext.w	a5,a5
     7c6:	eb9d                	bnez	a5,7fc <vprintf+0x6e>
      if(c == '%'){
     7c8:	fdc42783          	lw	a5,-36(s0)
     7cc:	0007871b          	sext.w	a4,a5
     7d0:	02500793          	li	a5,37
     7d4:	00f71763          	bne	a4,a5,7e2 <vprintf+0x54>
        state = '%';
     7d8:	02500793          	li	a5,37
     7dc:	fef42023          	sw	a5,-32(s0)
     7e0:	a2f5                	j	9cc <vprintf+0x23e>
      } else {
        putc(fd, c);
     7e2:	fdc42783          	lw	a5,-36(s0)
     7e6:	0ff7f713          	andi	a4,a5,255
     7ea:	fcc42783          	lw	a5,-52(s0)
     7ee:	85ba                	mv	a1,a4
     7f0:	853e                	mv	a0,a5
     7f2:	00000097          	auipc	ra,0x0
     7f6:	dcc080e7          	jalr	-564(ra) # 5be <putc>
     7fa:	aac9                	j	9cc <vprintf+0x23e>
      }
    } else if(state == '%'){
     7fc:	fe042783          	lw	a5,-32(s0)
     800:	0007871b          	sext.w	a4,a5
     804:	02500793          	li	a5,37
     808:	1cf71263          	bne	a4,a5,9cc <vprintf+0x23e>
      if(c == 'd'){
     80c:	fdc42783          	lw	a5,-36(s0)
     810:	0007871b          	sext.w	a4,a5
     814:	06400793          	li	a5,100
     818:	02f71463          	bne	a4,a5,840 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     81c:	fb843783          	ld	a5,-72(s0)
     820:	00878713          	addi	a4,a5,8
     824:	fae43c23          	sd	a4,-72(s0)
     828:	4398                	lw	a4,0(a5)
     82a:	fcc42783          	lw	a5,-52(s0)
     82e:	4685                	li	a3,1
     830:	4629                	li	a2,10
     832:	85ba                	mv	a1,a4
     834:	853e                	mv	a0,a5
     836:	00000097          	auipc	ra,0x0
     83a:	dbe080e7          	jalr	-578(ra) # 5f4 <printint>
     83e:	a269                	j	9c8 <vprintf+0x23a>
      } else if(c == 'l') {
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	06c00793          	li	a5,108
     84c:	02f71663          	bne	a4,a5,878 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     850:	fb843783          	ld	a5,-72(s0)
     854:	00878713          	addi	a4,a5,8
     858:	fae43c23          	sd	a4,-72(s0)
     85c:	639c                	ld	a5,0(a5)
     85e:	0007871b          	sext.w	a4,a5
     862:	fcc42783          	lw	a5,-52(s0)
     866:	4681                	li	a3,0
     868:	4629                	li	a2,10
     86a:	85ba                	mv	a1,a4
     86c:	853e                	mv	a0,a5
     86e:	00000097          	auipc	ra,0x0
     872:	d86080e7          	jalr	-634(ra) # 5f4 <printint>
     876:	aa89                	j	9c8 <vprintf+0x23a>
      } else if(c == 'x') {
     878:	fdc42783          	lw	a5,-36(s0)
     87c:	0007871b          	sext.w	a4,a5
     880:	07800793          	li	a5,120
     884:	02f71463          	bne	a4,a5,8ac <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     888:	fb843783          	ld	a5,-72(s0)
     88c:	00878713          	addi	a4,a5,8
     890:	fae43c23          	sd	a4,-72(s0)
     894:	4398                	lw	a4,0(a5)
     896:	fcc42783          	lw	a5,-52(s0)
     89a:	4681                	li	a3,0
     89c:	4641                	li	a2,16
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	d52080e7          	jalr	-686(ra) # 5f4 <printint>
     8aa:	aa39                	j	9c8 <vprintf+0x23a>
      } else if(c == 'p') {
     8ac:	fdc42783          	lw	a5,-36(s0)
     8b0:	0007871b          	sext.w	a4,a5
     8b4:	07000793          	li	a5,112
     8b8:	02f71263          	bne	a4,a5,8dc <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8bc:	fb843783          	ld	a5,-72(s0)
     8c0:	00878713          	addi	a4,a5,8
     8c4:	fae43c23          	sd	a4,-72(s0)
     8c8:	6398                	ld	a4,0(a5)
     8ca:	fcc42783          	lw	a5,-52(s0)
     8ce:	85ba                	mv	a1,a4
     8d0:	853e                	mv	a0,a5
     8d2:	00000097          	auipc	ra,0x0
     8d6:	e30080e7          	jalr	-464(ra) # 702 <printptr>
     8da:	a0fd                	j	9c8 <vprintf+0x23a>
      } else if(c == 's'){
     8dc:	fdc42783          	lw	a5,-36(s0)
     8e0:	0007871b          	sext.w	a4,a5
     8e4:	07300793          	li	a5,115
     8e8:	04f71c63          	bne	a4,a5,940 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     8ec:	fb843783          	ld	a5,-72(s0)
     8f0:	00878713          	addi	a4,a5,8
     8f4:	fae43c23          	sd	a4,-72(s0)
     8f8:	639c                	ld	a5,0(a5)
     8fa:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     8fe:	fe843783          	ld	a5,-24(s0)
     902:	eb8d                	bnez	a5,934 <vprintf+0x1a6>
          s = "(null)";
     904:	00001797          	auipc	a5,0x1
     908:	ac478793          	addi	a5,a5,-1340 # 13c8 <schedule_rm+0x2b8>
     90c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     910:	a015                	j	934 <vprintf+0x1a6>
          putc(fd, *s);
     912:	fe843783          	ld	a5,-24(s0)
     916:	0007c703          	lbu	a4,0(a5)
     91a:	fcc42783          	lw	a5,-52(s0)
     91e:	85ba                	mv	a1,a4
     920:	853e                	mv	a0,a5
     922:	00000097          	auipc	ra,0x0
     926:	c9c080e7          	jalr	-868(ra) # 5be <putc>
          s++;
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0785                	addi	a5,a5,1
     930:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     934:	fe843783          	ld	a5,-24(s0)
     938:	0007c783          	lbu	a5,0(a5)
     93c:	fbf9                	bnez	a5,912 <vprintf+0x184>
     93e:	a069                	j	9c8 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     940:	fdc42783          	lw	a5,-36(s0)
     944:	0007871b          	sext.w	a4,a5
     948:	06300793          	li	a5,99
     94c:	02f71463          	bne	a4,a5,974 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     950:	fb843783          	ld	a5,-72(s0)
     954:	00878713          	addi	a4,a5,8
     958:	fae43c23          	sd	a4,-72(s0)
     95c:	439c                	lw	a5,0(a5)
     95e:	0ff7f713          	andi	a4,a5,255
     962:	fcc42783          	lw	a5,-52(s0)
     966:	85ba                	mv	a1,a4
     968:	853e                	mv	a0,a5
     96a:	00000097          	auipc	ra,0x0
     96e:	c54080e7          	jalr	-940(ra) # 5be <putc>
     972:	a899                	j	9c8 <vprintf+0x23a>
      } else if(c == '%'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	02500793          	li	a5,37
     980:	00f71f63          	bne	a4,a5,99e <vprintf+0x210>
        putc(fd, c);
     984:	fdc42783          	lw	a5,-36(s0)
     988:	0ff7f713          	andi	a4,a5,255
     98c:	fcc42783          	lw	a5,-52(s0)
     990:	85ba                	mv	a1,a4
     992:	853e                	mv	a0,a5
     994:	00000097          	auipc	ra,0x0
     998:	c2a080e7          	jalr	-982(ra) # 5be <putc>
     99c:	a035                	j	9c8 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     99e:	fcc42783          	lw	a5,-52(s0)
     9a2:	02500593          	li	a1,37
     9a6:	853e                	mv	a0,a5
     9a8:	00000097          	auipc	ra,0x0
     9ac:	c16080e7          	jalr	-1002(ra) # 5be <putc>
        putc(fd, c);
     9b0:	fdc42783          	lw	a5,-36(s0)
     9b4:	0ff7f713          	andi	a4,a5,255
     9b8:	fcc42783          	lw	a5,-52(s0)
     9bc:	85ba                	mv	a1,a4
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	bfe080e7          	jalr	-1026(ra) # 5be <putc>
      }
      state = 0;
     9c8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9cc:	fe442783          	lw	a5,-28(s0)
     9d0:	2785                	addiw	a5,a5,1
     9d2:	fef42223          	sw	a5,-28(s0)
     9d6:	fe442783          	lw	a5,-28(s0)
     9da:	fc043703          	ld	a4,-64(s0)
     9de:	97ba                	add	a5,a5,a4
     9e0:	0007c783          	lbu	a5,0(a5)
     9e4:	dc0795e3          	bnez	a5,7ae <vprintf+0x20>
    }
  }
}
     9e8:	0001                	nop
     9ea:	0001                	nop
     9ec:	60a6                	ld	ra,72(sp)
     9ee:	6406                	ld	s0,64(sp)
     9f0:	6161                	addi	sp,sp,80
     9f2:	8082                	ret

00000000000009f4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     9f4:	7159                	addi	sp,sp,-112
     9f6:	fc06                	sd	ra,56(sp)
     9f8:	f822                	sd	s0,48(sp)
     9fa:	0080                	addi	s0,sp,64
     9fc:	fcb43823          	sd	a1,-48(s0)
     a00:	e010                	sd	a2,0(s0)
     a02:	e414                	sd	a3,8(s0)
     a04:	e818                	sd	a4,16(s0)
     a06:	ec1c                	sd	a5,24(s0)
     a08:	03043023          	sd	a6,32(s0)
     a0c:	03143423          	sd	a7,40(s0)
     a10:	87aa                	mv	a5,a0
     a12:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a16:	03040793          	addi	a5,s0,48
     a1a:	fcf43423          	sd	a5,-56(s0)
     a1e:	fc843783          	ld	a5,-56(s0)
     a22:	fd078793          	addi	a5,a5,-48
     a26:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a2a:	fe843703          	ld	a4,-24(s0)
     a2e:	fdc42783          	lw	a5,-36(s0)
     a32:	863a                	mv	a2,a4
     a34:	fd043583          	ld	a1,-48(s0)
     a38:	853e                	mv	a0,a5
     a3a:	00000097          	auipc	ra,0x0
     a3e:	d54080e7          	jalr	-684(ra) # 78e <vprintf>
}
     a42:	0001                	nop
     a44:	70e2                	ld	ra,56(sp)
     a46:	7442                	ld	s0,48(sp)
     a48:	6165                	addi	sp,sp,112
     a4a:	8082                	ret

0000000000000a4c <printf>:

void
printf(const char *fmt, ...)
{
     a4c:	7159                	addi	sp,sp,-112
     a4e:	f406                	sd	ra,40(sp)
     a50:	f022                	sd	s0,32(sp)
     a52:	1800                	addi	s0,sp,48
     a54:	fca43c23          	sd	a0,-40(s0)
     a58:	e40c                	sd	a1,8(s0)
     a5a:	e810                	sd	a2,16(s0)
     a5c:	ec14                	sd	a3,24(s0)
     a5e:	f018                	sd	a4,32(s0)
     a60:	f41c                	sd	a5,40(s0)
     a62:	03043823          	sd	a6,48(s0)
     a66:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a6a:	04040793          	addi	a5,s0,64
     a6e:	fcf43823          	sd	a5,-48(s0)
     a72:	fd043783          	ld	a5,-48(s0)
     a76:	fc878793          	addi	a5,a5,-56
     a7a:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a7e:	fe843783          	ld	a5,-24(s0)
     a82:	863e                	mv	a2,a5
     a84:	fd843583          	ld	a1,-40(s0)
     a88:	4505                	li	a0,1
     a8a:	00000097          	auipc	ra,0x0
     a8e:	d04080e7          	jalr	-764(ra) # 78e <vprintf>
}
     a92:	0001                	nop
     a94:	70a2                	ld	ra,40(sp)
     a96:	7402                	ld	s0,32(sp)
     a98:	6165                	addi	sp,sp,112
     a9a:	8082                	ret

0000000000000a9c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a9c:	7179                	addi	sp,sp,-48
     a9e:	f422                	sd	s0,40(sp)
     aa0:	1800                	addi	s0,sp,48
     aa2:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     aa6:	fd843783          	ld	a5,-40(s0)
     aaa:	17c1                	addi	a5,a5,-16
     aac:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ab0:	00001797          	auipc	a5,0x1
     ab4:	94878793          	addi	a5,a5,-1720 # 13f8 <freep>
     ab8:	639c                	ld	a5,0(a5)
     aba:	fef43423          	sd	a5,-24(s0)
     abe:	a815                	j	af2 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ac0:	fe843783          	ld	a5,-24(s0)
     ac4:	639c                	ld	a5,0(a5)
     ac6:	fe843703          	ld	a4,-24(s0)
     aca:	00f76f63          	bltu	a4,a5,ae8 <free+0x4c>
     ace:	fe043703          	ld	a4,-32(s0)
     ad2:	fe843783          	ld	a5,-24(s0)
     ad6:	02e7eb63          	bltu	a5,a4,b0c <free+0x70>
     ada:	fe843783          	ld	a5,-24(s0)
     ade:	639c                	ld	a5,0(a5)
     ae0:	fe043703          	ld	a4,-32(s0)
     ae4:	02f76463          	bltu	a4,a5,b0c <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ae8:	fe843783          	ld	a5,-24(s0)
     aec:	639c                	ld	a5,0(a5)
     aee:	fef43423          	sd	a5,-24(s0)
     af2:	fe043703          	ld	a4,-32(s0)
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	fce7f3e3          	bgeu	a5,a4,ac0 <free+0x24>
     afe:	fe843783          	ld	a5,-24(s0)
     b02:	639c                	ld	a5,0(a5)
     b04:	fe043703          	ld	a4,-32(s0)
     b08:	faf77ce3          	bgeu	a4,a5,ac0 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b0c:	fe043783          	ld	a5,-32(s0)
     b10:	479c                	lw	a5,8(a5)
     b12:	1782                	slli	a5,a5,0x20
     b14:	9381                	srli	a5,a5,0x20
     b16:	0792                	slli	a5,a5,0x4
     b18:	fe043703          	ld	a4,-32(s0)
     b1c:	973e                	add	a4,a4,a5
     b1e:	fe843783          	ld	a5,-24(s0)
     b22:	639c                	ld	a5,0(a5)
     b24:	02f71763          	bne	a4,a5,b52 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b28:	fe043783          	ld	a5,-32(s0)
     b2c:	4798                	lw	a4,8(a5)
     b2e:	fe843783          	ld	a5,-24(s0)
     b32:	639c                	ld	a5,0(a5)
     b34:	479c                	lw	a5,8(a5)
     b36:	9fb9                	addw	a5,a5,a4
     b38:	0007871b          	sext.w	a4,a5
     b3c:	fe043783          	ld	a5,-32(s0)
     b40:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b42:	fe843783          	ld	a5,-24(s0)
     b46:	639c                	ld	a5,0(a5)
     b48:	6398                	ld	a4,0(a5)
     b4a:	fe043783          	ld	a5,-32(s0)
     b4e:	e398                	sd	a4,0(a5)
     b50:	a039                	j	b5e <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	6398                	ld	a4,0(a5)
     b58:	fe043783          	ld	a5,-32(s0)
     b5c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b5e:	fe843783          	ld	a5,-24(s0)
     b62:	479c                	lw	a5,8(a5)
     b64:	1782                	slli	a5,a5,0x20
     b66:	9381                	srli	a5,a5,0x20
     b68:	0792                	slli	a5,a5,0x4
     b6a:	fe843703          	ld	a4,-24(s0)
     b6e:	97ba                	add	a5,a5,a4
     b70:	fe043703          	ld	a4,-32(s0)
     b74:	02f71563          	bne	a4,a5,b9e <free+0x102>
    p->s.size += bp->s.size;
     b78:	fe843783          	ld	a5,-24(s0)
     b7c:	4798                	lw	a4,8(a5)
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	479c                	lw	a5,8(a5)
     b84:	9fb9                	addw	a5,a5,a4
     b86:	0007871b          	sext.w	a4,a5
     b8a:	fe843783          	ld	a5,-24(s0)
     b8e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     b90:	fe043783          	ld	a5,-32(s0)
     b94:	6398                	ld	a4,0(a5)
     b96:	fe843783          	ld	a5,-24(s0)
     b9a:	e398                	sd	a4,0(a5)
     b9c:	a031                	j	ba8 <free+0x10c>
  } else
    p->s.ptr = bp;
     b9e:	fe843783          	ld	a5,-24(s0)
     ba2:	fe043703          	ld	a4,-32(s0)
     ba6:	e398                	sd	a4,0(a5)
  freep = p;
     ba8:	00001797          	auipc	a5,0x1
     bac:	85078793          	addi	a5,a5,-1968 # 13f8 <freep>
     bb0:	fe843703          	ld	a4,-24(s0)
     bb4:	e398                	sd	a4,0(a5)
}
     bb6:	0001                	nop
     bb8:	7422                	ld	s0,40(sp)
     bba:	6145                	addi	sp,sp,48
     bbc:	8082                	ret

0000000000000bbe <morecore>:

static Header*
morecore(uint nu)
{
     bbe:	7179                	addi	sp,sp,-48
     bc0:	f406                	sd	ra,40(sp)
     bc2:	f022                	sd	s0,32(sp)
     bc4:	1800                	addi	s0,sp,48
     bc6:	87aa                	mv	a5,a0
     bc8:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0007871b          	sext.w	a4,a5
     bd4:	6785                	lui	a5,0x1
     bd6:	00f77563          	bgeu	a4,a5,be0 <morecore+0x22>
    nu = 4096;
     bda:	6785                	lui	a5,0x1
     bdc:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     be0:	fdc42783          	lw	a5,-36(s0)
     be4:	0047979b          	slliw	a5,a5,0x4
     be8:	2781                	sext.w	a5,a5
     bea:	2781                	sext.w	a5,a5
     bec:	853e                	mv	a0,a5
     bee:	00000097          	auipc	ra,0x0
     bf2:	9a0080e7          	jalr	-1632(ra) # 58e <sbrk>
     bf6:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     bfa:	fe843703          	ld	a4,-24(s0)
     bfe:	57fd                	li	a5,-1
     c00:	00f71463          	bne	a4,a5,c08 <morecore+0x4a>
    return 0;
     c04:	4781                	li	a5,0
     c06:	a03d                	j	c34 <morecore+0x76>
  hp = (Header*)p;
     c08:	fe843783          	ld	a5,-24(s0)
     c0c:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c10:	fe043783          	ld	a5,-32(s0)
     c14:	fdc42703          	lw	a4,-36(s0)
     c18:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c1a:	fe043783          	ld	a5,-32(s0)
     c1e:	07c1                	addi	a5,a5,16
     c20:	853e                	mv	a0,a5
     c22:	00000097          	auipc	ra,0x0
     c26:	e7a080e7          	jalr	-390(ra) # a9c <free>
  return freep;
     c2a:	00000797          	auipc	a5,0x0
     c2e:	7ce78793          	addi	a5,a5,1998 # 13f8 <freep>
     c32:	639c                	ld	a5,0(a5)
}
     c34:	853e                	mv	a0,a5
     c36:	70a2                	ld	ra,40(sp)
     c38:	7402                	ld	s0,32(sp)
     c3a:	6145                	addi	sp,sp,48
     c3c:	8082                	ret

0000000000000c3e <malloc>:

void*
malloc(uint nbytes)
{
     c3e:	7139                	addi	sp,sp,-64
     c40:	fc06                	sd	ra,56(sp)
     c42:	f822                	sd	s0,48(sp)
     c44:	0080                	addi	s0,sp,64
     c46:	87aa                	mv	a5,a0
     c48:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c4c:	fcc46783          	lwu	a5,-52(s0)
     c50:	07bd                	addi	a5,a5,15
     c52:	8391                	srli	a5,a5,0x4
     c54:	2781                	sext.w	a5,a5
     c56:	2785                	addiw	a5,a5,1
     c58:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c5c:	00000797          	auipc	a5,0x0
     c60:	79c78793          	addi	a5,a5,1948 # 13f8 <freep>
     c64:	639c                	ld	a5,0(a5)
     c66:	fef43023          	sd	a5,-32(s0)
     c6a:	fe043783          	ld	a5,-32(s0)
     c6e:	ef95                	bnez	a5,caa <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c70:	00000797          	auipc	a5,0x0
     c74:	77878793          	addi	a5,a5,1912 # 13e8 <base>
     c78:	fef43023          	sd	a5,-32(s0)
     c7c:	00000797          	auipc	a5,0x0
     c80:	77c78793          	addi	a5,a5,1916 # 13f8 <freep>
     c84:	fe043703          	ld	a4,-32(s0)
     c88:	e398                	sd	a4,0(a5)
     c8a:	00000797          	auipc	a5,0x0
     c8e:	76e78793          	addi	a5,a5,1902 # 13f8 <freep>
     c92:	6398                	ld	a4,0(a5)
     c94:	00000797          	auipc	a5,0x0
     c98:	75478793          	addi	a5,a5,1876 # 13e8 <base>
     c9c:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     c9e:	00000797          	auipc	a5,0x0
     ca2:	74a78793          	addi	a5,a5,1866 # 13e8 <base>
     ca6:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     caa:	fe043783          	ld	a5,-32(s0)
     cae:	639c                	ld	a5,0(a5)
     cb0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cb4:	fe843783          	ld	a5,-24(s0)
     cb8:	4798                	lw	a4,8(a5)
     cba:	fdc42783          	lw	a5,-36(s0)
     cbe:	2781                	sext.w	a5,a5
     cc0:	06f76863          	bltu	a4,a5,d30 <malloc+0xf2>
      if(p->s.size == nunits)
     cc4:	fe843783          	ld	a5,-24(s0)
     cc8:	4798                	lw	a4,8(a5)
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	2781                	sext.w	a5,a5
     cd0:	00e79963          	bne	a5,a4,ce2 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cd4:	fe843783          	ld	a5,-24(s0)
     cd8:	6398                	ld	a4,0(a5)
     cda:	fe043783          	ld	a5,-32(s0)
     cde:	e398                	sd	a4,0(a5)
     ce0:	a82d                	j	d1a <malloc+0xdc>
      else {
        p->s.size -= nunits;
     ce2:	fe843783          	ld	a5,-24(s0)
     ce6:	4798                	lw	a4,8(a5)
     ce8:	fdc42783          	lw	a5,-36(s0)
     cec:	40f707bb          	subw	a5,a4,a5
     cf0:	0007871b          	sext.w	a4,a5
     cf4:	fe843783          	ld	a5,-24(s0)
     cf8:	c798                	sw	a4,8(a5)
        p += p->s.size;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	479c                	lw	a5,8(a5)
     d00:	1782                	slli	a5,a5,0x20
     d02:	9381                	srli	a5,a5,0x20
     d04:	0792                	slli	a5,a5,0x4
     d06:	fe843703          	ld	a4,-24(s0)
     d0a:	97ba                	add	a5,a5,a4
     d0c:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	fdc42703          	lw	a4,-36(s0)
     d18:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d1a:	00000797          	auipc	a5,0x0
     d1e:	6de78793          	addi	a5,a5,1758 # 13f8 <freep>
     d22:	fe043703          	ld	a4,-32(s0)
     d26:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	07c1                	addi	a5,a5,16
     d2e:	a091                	j	d72 <malloc+0x134>
    }
    if(p == freep)
     d30:	00000797          	auipc	a5,0x0
     d34:	6c878793          	addi	a5,a5,1736 # 13f8 <freep>
     d38:	639c                	ld	a5,0(a5)
     d3a:	fe843703          	ld	a4,-24(s0)
     d3e:	02f71063          	bne	a4,a5,d5e <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	853e                	mv	a0,a5
     d48:	00000097          	auipc	ra,0x0
     d4c:	e76080e7          	jalr	-394(ra) # bbe <morecore>
     d50:	fea43423          	sd	a0,-24(s0)
     d54:	fe843783          	ld	a5,-24(s0)
     d58:	e399                	bnez	a5,d5e <malloc+0x120>
        return 0;
     d5a:	4781                	li	a5,0
     d5c:	a819                	j	d72 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d5e:	fe843783          	ld	a5,-24(s0)
     d62:	fef43023          	sd	a5,-32(s0)
     d66:	fe843783          	ld	a5,-24(s0)
     d6a:	639c                	ld	a5,0(a5)
     d6c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d70:	b791                	j	cb4 <malloc+0x76>
  }
}
     d72:	853e                	mv	a0,a5
     d74:	70e2                	ld	ra,56(sp)
     d76:	7442                	ld	s0,48(sp)
     d78:	6121                	addi	sp,sp,64
     d7a:	8082                	ret

0000000000000d7c <schedule_default>:

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     d7c:	715d                	addi	sp,sp,-80
     d7e:	e4a2                	sd	s0,72(sp)
     d80:	e0a6                	sd	s1,64(sp)
     d82:	0880                	addi	s0,sp,80
     d84:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     d86:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     d8a:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     d8e:	649c                	ld	a5,8(s1)
     d90:	639c                	ld	a5,0(a5)
     d92:	fcf43c23          	sd	a5,-40(s0)
     d96:	fd843783          	ld	a5,-40(s0)
     d9a:	fd878793          	addi	a5,a5,-40
     d9e:	fef43023          	sd	a5,-32(s0)
     da2:	a81d                	j	dd8 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID) {
     da4:	fe843783          	ld	a5,-24(s0)
     da8:	cb89                	beqz	a5,dba <schedule_default+0x3e>
     daa:	fe043783          	ld	a5,-32(s0)
     dae:	5398                	lw	a4,32(a5)
     db0:	fe843783          	ld	a5,-24(s0)
     db4:	539c                	lw	a5,32(a5)
     db6:	00f75663          	bge	a4,a5,dc2 <schedule_default+0x46>
            thread_with_smallest_id = th;
     dba:	fe043783          	ld	a5,-32(s0)
     dbe:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     dc2:	fe043783          	ld	a5,-32(s0)
     dc6:	779c                	ld	a5,40(a5)
     dc8:	fcf43823          	sd	a5,-48(s0)
     dcc:	fd043783          	ld	a5,-48(s0)
     dd0:	fd878793          	addi	a5,a5,-40
     dd4:	fef43023          	sd	a5,-32(s0)
     dd8:	fe043783          	ld	a5,-32(s0)
     ddc:	02878713          	addi	a4,a5,40
     de0:	649c                	ld	a5,8(s1)
     de2:	fcf711e3          	bne	a4,a5,da4 <schedule_default+0x28>
        }
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     de6:	fe843783          	ld	a5,-24(s0)
     dea:	cf89                	beqz	a5,e04 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     dec:	fe843783          	ld	a5,-24(s0)
     df0:	02878793          	addi	a5,a5,40
     df4:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     df8:	fe843783          	ld	a5,-24(s0)
     dfc:	47fc                	lw	a5,76(a5)
     dfe:	faf42c23          	sw	a5,-72(s0)
     e02:	a039                	j	e10 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     e04:	649c                	ld	a5,8(s1)
     e06:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     e0a:	4785                	li	a5,1
     e0c:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     e10:	fb043783          	ld	a5,-80(s0)
     e14:	fcf43023          	sd	a5,-64(s0)
     e18:	fb843783          	ld	a5,-72(s0)
     e1c:	fcf43423          	sd	a5,-56(s0)
     e20:	fc043703          	ld	a4,-64(s0)
     e24:	fc843783          	ld	a5,-56(s0)
     e28:	863a                	mv	a2,a4
     e2a:	86be                	mv	a3,a5
     e2c:	8732                	mv	a4,a2
     e2e:	87b6                	mv	a5,a3

}
     e30:	853a                	mv	a0,a4
     e32:	85be                	mv	a1,a5
     e34:	6426                	ld	s0,72(sp)
     e36:	6486                	ld	s1,64(sp)
     e38:	6161                	addi	sp,sp,80
     e3a:	8082                	ret

0000000000000e3c <schedule_edf>:

/* Earliest-Deadline-First scheduling */
struct threads_sched_result schedule_edf(struct threads_sched_args args)
{   
     e3c:	7171                	addi	sp,sp,-176
     e3e:	f522                	sd	s0,168(sp)
     e40:	f126                	sd	s1,160(sp)
     e42:	1900                	addi	s0,sp,176
     e44:	84aa                	mv	s1,a0
    int is_miss = 0;
     e46:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_deadline = NULL, *tws_id = NULL;
     e4a:	fe043023          	sd	zero,-32(s0)
     e4e:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
     e52:	fc043823          	sd	zero,-48(s0)
    
    list_for_each_entry(th, args.run_queue, thread_list) {
     e56:	649c                	ld	a5,8(s1)
     e58:	639c                	ld	a5,0(a5)
     e5a:	faf43423          	sd	a5,-88(s0)
     e5e:	fa843783          	ld	a5,-88(s0)
     e62:	fd878793          	addi	a5,a5,-40
     e66:	fcf43823          	sd	a5,-48(s0)
     e6a:	a895                	j	ede <schedule_edf+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
     e6c:	4098                	lw	a4,0(s1)
     e6e:	fd043783          	ld	a5,-48(s0)
     e72:	47fc                	lw	a5,76(a5)
     e74:	9fb9                	addw	a5,a5,a4
     e76:	0007871b          	sext.w	a4,a5
     e7a:	fd043783          	ld	a5,-48(s0)
     e7e:	4bbc                	lw	a5,80(a5)
     e80:	00e7d563          	bge	a5,a4,e8a <schedule_edf+0x4e>
            is_miss = 1;
     e84:	4785                	li	a5,1
     e86:	fef42623          	sw	a5,-20(s0)
        }
        if (tws_deadline == NULL || (th->current_deadline < tws_deadline->current_deadline) || (th->current_deadline == tws_deadline->current_deadline && th->ID < tws_deadline->ID)) {
     e8a:	fe043783          	ld	a5,-32(s0)
     e8e:	cb8d                	beqz	a5,ec0 <schedule_edf+0x84>
     e90:	fd043783          	ld	a5,-48(s0)
     e94:	4bb8                	lw	a4,80(a5)
     e96:	fe043783          	ld	a5,-32(s0)
     e9a:	4bbc                	lw	a5,80(a5)
     e9c:	02f74263          	blt	a4,a5,ec0 <schedule_edf+0x84>
     ea0:	fd043783          	ld	a5,-48(s0)
     ea4:	4bb8                	lw	a4,80(a5)
     ea6:	fe043783          	ld	a5,-32(s0)
     eaa:	4bbc                	lw	a5,80(a5)
     eac:	00f71e63          	bne	a4,a5,ec8 <schedule_edf+0x8c>
     eb0:	fd043783          	ld	a5,-48(s0)
     eb4:	5398                	lw	a4,32(a5)
     eb6:	fe043783          	ld	a5,-32(s0)
     eba:	539c                	lw	a5,32(a5)
     ebc:	00f75663          	bge	a4,a5,ec8 <schedule_edf+0x8c>
            tws_deadline = th;
     ec0:	fd043783          	ld	a5,-48(s0)
     ec4:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     ec8:	fd043783          	ld	a5,-48(s0)
     ecc:	779c                	ld	a5,40(a5)
     ece:	f6f43823          	sd	a5,-144(s0)
     ed2:	f7043783          	ld	a5,-144(s0)
     ed6:	fd878793          	addi	a5,a5,-40
     eda:	fcf43823          	sd	a5,-48(s0)
     ede:	fd043783          	ld	a5,-48(s0)
     ee2:	02878713          	addi	a4,a5,40
     ee6:	649c                	ld	a5,8(s1)
     ee8:	f8f712e3          	bne	a4,a5,e6c <schedule_edf+0x30>
        }
    }
    
    struct threads_sched_result r;
    if (tws_deadline != NULL) {
     eec:	fe043783          	ld	a5,-32(s0)
     ef0:	18078063          	beqz	a5,1070 <schedule_edf+0x234>
        if(!is_miss){
     ef4:	fec42783          	lw	a5,-20(s0)
     ef8:	2781                	sext.w	a5,a5
     efa:	e3ed                	bnez	a5,fdc <schedule_edf+0x1a0>
            r.scheduled_thread_list_member = &tws_deadline->thread_list;
     efc:	fe043783          	ld	a5,-32(s0)
     f00:	02878793          	addi	a5,a5,40
     f04:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
     f08:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
     f0c:	689c                	ld	a5,16(s1)
     f0e:	639c                	ld	a5,0(a5)
     f10:	f8f43023          	sd	a5,-128(s0)
     f14:	f8043783          	ld	a5,-128(s0)
     f18:	17e1                	addi	a5,a5,-8
     f1a:	fcf43423          	sd	a5,-56(s0)
     f1e:	a88d                	j	f90 <schedule_edf+0x154>
                if (rth->thrd->current_deadline + rth->thrd->period < tws_deadline->current_deadline && (find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period)) {
     f20:	fc843783          	ld	a5,-56(s0)
     f24:	639c                	ld	a5,0(a5)
     f26:	4bb8                	lw	a4,80(a5)
     f28:	fc843783          	ld	a5,-56(s0)
     f2c:	639c                	ld	a5,0(a5)
     f2e:	43fc                	lw	a5,68(a5)
     f30:	9fb9                	addw	a5,a5,a4
     f32:	0007871b          	sext.w	a4,a5
     f36:	fe043783          	ld	a5,-32(s0)
     f3a:	4bbc                	lw	a5,80(a5)
     f3c:	04f75063          	bge	a4,a5,f7c <schedule_edf+0x140>
     f40:	fc043783          	ld	a5,-64(s0)
     f44:	c79d                	beqz	a5,f72 <schedule_edf+0x136>
     f46:	fc843783          	ld	a5,-56(s0)
     f4a:	639c                	ld	a5,0(a5)
     f4c:	4bb8                	lw	a4,80(a5)
     f4e:	fc843783          	ld	a5,-56(s0)
     f52:	639c                	ld	a5,0(a5)
     f54:	43fc                	lw	a5,68(a5)
     f56:	9fb9                	addw	a5,a5,a4
     f58:	0007859b          	sext.w	a1,a5
     f5c:	fc043783          	ld	a5,-64(s0)
     f60:	4bb8                	lw	a4,80(a5)
     f62:	fc043783          	ld	a5,-64(s0)
     f66:	43fc                	lw	a5,68(a5)
     f68:	9fb9                	addw	a5,a5,a4
     f6a:	2781                	sext.w	a5,a5
     f6c:	872e                	mv	a4,a1
     f6e:	00f75763          	bge	a4,a5,f7c <schedule_edf+0x140>
                    find = rth->thrd;
     f72:	fc843783          	ld	a5,-56(s0)
     f76:	639c                	ld	a5,0(a5)
     f78:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
     f7c:	fc843783          	ld	a5,-56(s0)
     f80:	679c                	ld	a5,8(a5)
     f82:	f6f43c23          	sd	a5,-136(s0)
     f86:	f7843783          	ld	a5,-136(s0)
     f8a:	17e1                	addi	a5,a5,-8
     f8c:	fcf43423          	sd	a5,-56(s0)
     f90:	fc843783          	ld	a5,-56(s0)
     f94:	00878713          	addi	a4,a5,8
     f98:	689c                	ld	a5,16(s1)
     f9a:	f8f713e3          	bne	a4,a5,f20 <schedule_edf+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_deadline->remaining_time <= find->current_deadline) r.allocated_time = tws_deadline->remaining_time;
     f9e:	fc043783          	ld	a5,-64(s0)
     fa2:	cf89                	beqz	a5,fbc <schedule_edf+0x180>
     fa4:	4098                	lw	a4,0(s1)
     fa6:	fe043783          	ld	a5,-32(s0)
     faa:	47fc                	lw	a5,76(a5)
     fac:	9fb9                	addw	a5,a5,a4
     fae:	0007871b          	sext.w	a4,a5
     fb2:	fc043783          	ld	a5,-64(s0)
     fb6:	4bbc                	lw	a5,80(a5)
     fb8:	00e7c863          	blt	a5,a4,fc8 <schedule_edf+0x18c>
     fbc:	fe043783          	ld	a5,-32(s0)
     fc0:	47fc                	lw	a5,76(a5)
     fc2:	f4f42c23          	sw	a5,-168(s0)
     fc6:	aa39                	j	10e4 <schedule_edf+0x2a8>
            else{
                //r.allocated_time = tws_deadline->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
     fc8:	fc043783          	ld	a5,-64(s0)
     fcc:	4bb8                	lw	a4,80(a5)
     fce:	409c                	lw	a5,0(s1)
     fd0:	40f707bb          	subw	a5,a4,a5
     fd4:	2781                	sext.w	a5,a5
     fd6:	f4f42c23          	sw	a5,-168(s0)
     fda:	a229                	j	10e4 <schedule_edf+0x2a8>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
     fdc:	649c                	ld	a5,8(s1)
     fde:	639c                	ld	a5,0(a5)
     fe0:	f8f43823          	sd	a5,-112(s0)
     fe4:	f9043783          	ld	a5,-112(s0)
     fe8:	fd878793          	addi	a5,a5,-40
     fec:	fcf43823          	sd	a5,-48(s0)
     ff0:	a089                	j	1032 <schedule_edf+0x1f6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
     ff2:	fd843783          	ld	a5,-40(s0)
     ff6:	cf99                	beqz	a5,1014 <schedule_edf+0x1d8>
     ff8:	4098                	lw	a4,0(s1)
     ffa:	fd043783          	ld	a5,-48(s0)
     ffe:	4bbc                	lw	a5,80(a5)
    1000:	00f74e63          	blt	a4,a5,101c <schedule_edf+0x1e0>
    1004:	fd043783          	ld	a5,-48(s0)
    1008:	5398                	lw	a4,32(a5)
    100a:	fd843783          	ld	a5,-40(s0)
    100e:	539c                	lw	a5,32(a5)
    1010:	00f75663          	bge	a4,a5,101c <schedule_edf+0x1e0>
                    tws_id = th;
    1014:	fd043783          	ld	a5,-48(s0)
    1018:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    101c:	fd043783          	ld	a5,-48(s0)
    1020:	779c                	ld	a5,40(a5)
    1022:	f8f43423          	sd	a5,-120(s0)
    1026:	f8843783          	ld	a5,-120(s0)
    102a:	fd878793          	addi	a5,a5,-40
    102e:	fcf43823          	sd	a5,-48(s0)
    1032:	fd043783          	ld	a5,-48(s0)
    1036:	02878713          	addi	a4,a5,40
    103a:	649c                	ld	a5,8(s1)
    103c:	faf71be3          	bne	a4,a5,ff2 <schedule_edf+0x1b6>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    1040:	fd843783          	ld	a5,-40(s0)
    1044:	02878793          	addi	a5,a5,40
    1048:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    104c:	fd843783          	ld	a5,-40(s0)
    1050:	4bb8                	lw	a4,80(a5)
    1052:	409c                	lw	a5,0(s1)
    1054:	40f707bb          	subw	a5,a4,a5
    1058:	2781                	sext.w	a5,a5
    105a:	873e                	mv	a4,a5
    105c:	0007079b          	sext.w	a5,a4
    1060:	0007d363          	bgez	a5,1066 <schedule_edf+0x22a>
    1064:	4701                	li	a4,0
    1066:	0007079b          	sext.w	a5,a4
    106a:	f4f42c23          	sw	a5,-168(s0)
    106e:	a89d                	j	10e4 <schedule_edf+0x2a8>
        }
        
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1070:	649c                	ld	a5,8(s1)
    1072:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1076:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    107a:	689c                	ld	a5,16(s1)
    107c:	639c                	ld	a5,0(a5)
    107e:	faf43023          	sd	a5,-96(s0)
    1082:	fa043783          	ld	a5,-96(s0)
    1086:	17e1                	addi	a5,a5,-8
    1088:	faf43c23          	sd	a5,-72(s0)
    108c:	a825                	j	10c4 <schedule_edf+0x288>
            if (find == NULL || (rth->thrd->current_deadline < find->current_deadline)) {
    108e:	fb043783          	ld	a5,-80(s0)
    1092:	cb91                	beqz	a5,10a6 <schedule_edf+0x26a>
    1094:	fb843783          	ld	a5,-72(s0)
    1098:	639c                	ld	a5,0(a5)
    109a:	4bb8                	lw	a4,80(a5)
    109c:	fb043783          	ld	a5,-80(s0)
    10a0:	4bbc                	lw	a5,80(a5)
    10a2:	00f75763          	bge	a4,a5,10b0 <schedule_edf+0x274>
                find = rth->thrd;
    10a6:	fb843783          	ld	a5,-72(s0)
    10aa:	639c                	ld	a5,0(a5)
    10ac:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    10b0:	fb843783          	ld	a5,-72(s0)
    10b4:	679c                	ld	a5,8(a5)
    10b6:	f8f43c23          	sd	a5,-104(s0)
    10ba:	f9843783          	ld	a5,-104(s0)
    10be:	17e1                	addi	a5,a5,-8
    10c0:	faf43c23          	sd	a5,-72(s0)
    10c4:	fb843783          	ld	a5,-72(s0)
    10c8:	00878713          	addi	a4,a5,8
    10cc:	689c                	ld	a5,16(s1)
    10ce:	fcf710e3          	bne	a4,a5,108e <schedule_edf+0x252>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    10d2:	fb043783          	ld	a5,-80(s0)
    10d6:	4bb8                	lw	a4,80(a5)
    10d8:	409c                	lw	a5,0(s1)
    10da:	40f707bb          	subw	a5,a4,a5
    10de:	2781                	sext.w	a5,a5
    10e0:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    10e4:	f5043783          	ld	a5,-176(s0)
    10e8:	f6f43023          	sd	a5,-160(s0)
    10ec:	f5843783          	ld	a5,-168(s0)
    10f0:	f6f43423          	sd	a5,-152(s0)
    10f4:	f6043703          	ld	a4,-160(s0)
    10f8:	f6843783          	ld	a5,-152(s0)
    10fc:	863a                	mv	a2,a4
    10fe:	86be                	mv	a3,a5
    1100:	8732                	mv	a4,a2
    1102:	87b6                	mv	a5,a3
}
    1104:	853a                	mv	a0,a4
    1106:	85be                	mv	a1,a5
    1108:	742a                	ld	s0,168(sp)
    110a:	748a                	ld	s1,160(sp)
    110c:	614d                	addi	sp,sp,176
    110e:	8082                	ret

0000000000001110 <schedule_rm>:

/* Rate-Monotonic Scheduling */
struct threads_sched_result schedule_rm(struct threads_sched_args args)
{
    1110:	7171                	addi	sp,sp,-176
    1112:	f522                	sd	s0,168(sp)
    1114:	f126                	sd	s1,160(sp)
    1116:	1900                	addi	s0,sp,176
    1118:	84aa                	mv	s1,a0
    int is_miss = 0;
    111a:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_period = NULL, *tws_id = NULL;
    111e:	fe043023          	sd	zero,-32(s0)
    1122:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
    1126:	fc043823          	sd	zero,-48(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    112a:	649c                	ld	a5,8(s1)
    112c:	639c                	ld	a5,0(a5)
    112e:	faf43423          	sd	a5,-88(s0)
    1132:	fa843783          	ld	a5,-88(s0)
    1136:	fd878793          	addi	a5,a5,-40
    113a:	fcf43823          	sd	a5,-48(s0)
    113e:	a895                	j	11b2 <schedule_rm+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
    1140:	4098                	lw	a4,0(s1)
    1142:	fd043783          	ld	a5,-48(s0)
    1146:	47fc                	lw	a5,76(a5)
    1148:	9fb9                	addw	a5,a5,a4
    114a:	0007871b          	sext.w	a4,a5
    114e:	fd043783          	ld	a5,-48(s0)
    1152:	4bbc                	lw	a5,80(a5)
    1154:	00e7d563          	bge	a5,a4,115e <schedule_rm+0x4e>
            is_miss = 1;
    1158:	4785                	li	a5,1
    115a:	fef42623          	sw	a5,-20(s0)
            //break;
        }
        if (tws_period == NULL || (th->period < tws_period->period) || (th->period == tws_period->period && th->ID < tws_period->ID)) {
    115e:	fe043783          	ld	a5,-32(s0)
    1162:	cb8d                	beqz	a5,1194 <schedule_rm+0x84>
    1164:	fd043783          	ld	a5,-48(s0)
    1168:	43f8                	lw	a4,68(a5)
    116a:	fe043783          	ld	a5,-32(s0)
    116e:	43fc                	lw	a5,68(a5)
    1170:	02f74263          	blt	a4,a5,1194 <schedule_rm+0x84>
    1174:	fd043783          	ld	a5,-48(s0)
    1178:	43f8                	lw	a4,68(a5)
    117a:	fe043783          	ld	a5,-32(s0)
    117e:	43fc                	lw	a5,68(a5)
    1180:	00f71e63          	bne	a4,a5,119c <schedule_rm+0x8c>
    1184:	fd043783          	ld	a5,-48(s0)
    1188:	5398                	lw	a4,32(a5)
    118a:	fe043783          	ld	a5,-32(s0)
    118e:	539c                	lw	a5,32(a5)
    1190:	00f75663          	bge	a4,a5,119c <schedule_rm+0x8c>
            tws_period = th;
    1194:	fd043783          	ld	a5,-48(s0)
    1198:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    119c:	fd043783          	ld	a5,-48(s0)
    11a0:	779c                	ld	a5,40(a5)
    11a2:	f6f43823          	sd	a5,-144(s0)
    11a6:	f7043783          	ld	a5,-144(s0)
    11aa:	fd878793          	addi	a5,a5,-40
    11ae:	fcf43823          	sd	a5,-48(s0)
    11b2:	fd043783          	ld	a5,-48(s0)
    11b6:	02878713          	addi	a4,a5,40
    11ba:	649c                	ld	a5,8(s1)
    11bc:	f8f712e3          	bne	a4,a5,1140 <schedule_rm+0x30>
        }
    }

    struct threads_sched_result r; 
    if (tws_period != NULL) {
    11c0:	fe043783          	ld	a5,-32(s0)
    11c4:	16078063          	beqz	a5,1324 <schedule_rm+0x214>
        if(!is_miss){
    11c8:	fec42783          	lw	a5,-20(s0)
    11cc:	2781                	sext.w	a5,a5
    11ce:	e3e9                	bnez	a5,1290 <schedule_rm+0x180>
            r.scheduled_thread_list_member = &tws_period->thread_list;
    11d0:	fe043783          	ld	a5,-32(s0)
    11d4:	02878793          	addi	a5,a5,40
    11d8:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    11dc:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    11e0:	689c                	ld	a5,16(s1)
    11e2:	639c                	ld	a5,0(a5)
    11e4:	f8f43023          	sd	a5,-128(s0)
    11e8:	f8043783          	ld	a5,-128(s0)
    11ec:	17e1                	addi	a5,a5,-8
    11ee:	fcf43423          	sd	a5,-56(s0)
    11f2:	a889                	j	1244 <schedule_rm+0x134>
                if(find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period) {
    11f4:	fc043783          	ld	a5,-64(s0)
    11f8:	c79d                	beqz	a5,1226 <schedule_rm+0x116>
    11fa:	fc843783          	ld	a5,-56(s0)
    11fe:	639c                	ld	a5,0(a5)
    1200:	4bb8                	lw	a4,80(a5)
    1202:	fc843783          	ld	a5,-56(s0)
    1206:	639c                	ld	a5,0(a5)
    1208:	43fc                	lw	a5,68(a5)
    120a:	9fb9                	addw	a5,a5,a4
    120c:	0007859b          	sext.w	a1,a5
    1210:	fc043783          	ld	a5,-64(s0)
    1214:	4bb8                	lw	a4,80(a5)
    1216:	fc043783          	ld	a5,-64(s0)
    121a:	43fc                	lw	a5,68(a5)
    121c:	9fb9                	addw	a5,a5,a4
    121e:	2781                	sext.w	a5,a5
    1220:	872e                	mv	a4,a1
    1222:	00f75763          	bge	a4,a5,1230 <schedule_rm+0x120>
                    find = rth->thrd;
    1226:	fc843783          	ld	a5,-56(s0)
    122a:	639c                	ld	a5,0(a5)
    122c:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    1230:	fc843783          	ld	a5,-56(s0)
    1234:	679c                	ld	a5,8(a5)
    1236:	f6f43c23          	sd	a5,-136(s0)
    123a:	f7843783          	ld	a5,-136(s0)
    123e:	17e1                	addi	a5,a5,-8
    1240:	fcf43423          	sd	a5,-56(s0)
    1244:	fc843783          	ld	a5,-56(s0)
    1248:	00878713          	addi	a4,a5,8
    124c:	689c                	ld	a5,16(s1)
    124e:	faf713e3          	bne	a4,a5,11f4 <schedule_rm+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_period->remaining_time <= find->current_deadline) r.allocated_time = tws_period->remaining_time;
    1252:	fc043783          	ld	a5,-64(s0)
    1256:	cf89                	beqz	a5,1270 <schedule_rm+0x160>
    1258:	4098                	lw	a4,0(s1)
    125a:	fe043783          	ld	a5,-32(s0)
    125e:	47fc                	lw	a5,76(a5)
    1260:	9fb9                	addw	a5,a5,a4
    1262:	0007871b          	sext.w	a4,a5
    1266:	fc043783          	ld	a5,-64(s0)
    126a:	4bbc                	lw	a5,80(a5)
    126c:	00e7c863          	blt	a5,a4,127c <schedule_rm+0x16c>
    1270:	fe043783          	ld	a5,-32(s0)
    1274:	47fc                	lw	a5,76(a5)
    1276:	f4f42c23          	sw	a5,-168(s0)
    127a:	aa39                	j	1398 <schedule_rm+0x288>
            else{
                //r.allocated_time = tws_period->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
    127c:	fc043783          	ld	a5,-64(s0)
    1280:	4bb8                	lw	a4,80(a5)
    1282:	409c                	lw	a5,0(s1)
    1284:	40f707bb          	subw	a5,a4,a5
    1288:	2781                	sext.w	a5,a5
    128a:	f4f42c23          	sw	a5,-168(s0)
    128e:	a229                	j	1398 <schedule_rm+0x288>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
    1290:	649c                	ld	a5,8(s1)
    1292:	639c                	ld	a5,0(a5)
    1294:	f8f43823          	sd	a5,-112(s0)
    1298:	f9043783          	ld	a5,-112(s0)
    129c:	fd878793          	addi	a5,a5,-40
    12a0:	fcf43823          	sd	a5,-48(s0)
    12a4:	a089                	j	12e6 <schedule_rm+0x1d6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
    12a6:	fd843783          	ld	a5,-40(s0)
    12aa:	cf99                	beqz	a5,12c8 <schedule_rm+0x1b8>
    12ac:	4098                	lw	a4,0(s1)
    12ae:	fd043783          	ld	a5,-48(s0)
    12b2:	4bbc                	lw	a5,80(a5)
    12b4:	00f74e63          	blt	a4,a5,12d0 <schedule_rm+0x1c0>
    12b8:	fd043783          	ld	a5,-48(s0)
    12bc:	5398                	lw	a4,32(a5)
    12be:	fd843783          	ld	a5,-40(s0)
    12c2:	539c                	lw	a5,32(a5)
    12c4:	00f75663          	bge	a4,a5,12d0 <schedule_rm+0x1c0>
                    tws_id = th;
    12c8:	fd043783          	ld	a5,-48(s0)
    12cc:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    12d0:	fd043783          	ld	a5,-48(s0)
    12d4:	779c                	ld	a5,40(a5)
    12d6:	f8f43423          	sd	a5,-120(s0)
    12da:	f8843783          	ld	a5,-120(s0)
    12de:	fd878793          	addi	a5,a5,-40
    12e2:	fcf43823          	sd	a5,-48(s0)
    12e6:	fd043783          	ld	a5,-48(s0)
    12ea:	02878713          	addi	a4,a5,40
    12ee:	649c                	ld	a5,8(s1)
    12f0:	faf71be3          	bne	a4,a5,12a6 <schedule_rm+0x196>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    12f4:	fd843783          	ld	a5,-40(s0)
    12f8:	02878793          	addi	a5,a5,40
    12fc:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    1300:	fd843783          	ld	a5,-40(s0)
    1304:	4bb8                	lw	a4,80(a5)
    1306:	409c                	lw	a5,0(s1)
    1308:	40f707bb          	subw	a5,a4,a5
    130c:	2781                	sext.w	a5,a5
    130e:	873e                	mv	a4,a5
    1310:	0007079b          	sext.w	a5,a4
    1314:	0007d363          	bgez	a5,131a <schedule_rm+0x20a>
    1318:	4701                	li	a4,0
    131a:	0007079b          	sext.w	a5,a4
    131e:	f4f42c23          	sw	a5,-168(s0)
    1322:	a89d                	j	1398 <schedule_rm+0x288>
        }
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1324:	649c                	ld	a5,8(s1)
    1326:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    132a:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    132e:	689c                	ld	a5,16(s1)
    1330:	639c                	ld	a5,0(a5)
    1332:	faf43023          	sd	a5,-96(s0)
    1336:	fa043783          	ld	a5,-96(s0)
    133a:	17e1                	addi	a5,a5,-8
    133c:	faf43c23          	sd	a5,-72(s0)
    1340:	a825                	j	1378 <schedule_rm+0x268>
            if (find == NULL || (rth->thrd->period < find->period)) {
    1342:	fb043783          	ld	a5,-80(s0)
    1346:	cb91                	beqz	a5,135a <schedule_rm+0x24a>
    1348:	fb843783          	ld	a5,-72(s0)
    134c:	639c                	ld	a5,0(a5)
    134e:	43f8                	lw	a4,68(a5)
    1350:	fb043783          	ld	a5,-80(s0)
    1354:	43fc                	lw	a5,68(a5)
    1356:	00f75763          	bge	a4,a5,1364 <schedule_rm+0x254>
                find = rth->thrd;
    135a:	fb843783          	ld	a5,-72(s0)
    135e:	639c                	ld	a5,0(a5)
    1360:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1364:	fb843783          	ld	a5,-72(s0)
    1368:	679c                	ld	a5,8(a5)
    136a:	f8f43c23          	sd	a5,-104(s0)
    136e:	f9843783          	ld	a5,-104(s0)
    1372:	17e1                	addi	a5,a5,-8
    1374:	faf43c23          	sd	a5,-72(s0)
    1378:	fb843783          	ld	a5,-72(s0)
    137c:	00878713          	addi	a4,a5,8
    1380:	689c                	ld	a5,16(s1)
    1382:	fcf710e3          	bne	a4,a5,1342 <schedule_rm+0x232>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    1386:	fb043783          	ld	a5,-80(s0)
    138a:	4bb8                	lw	a4,80(a5)
    138c:	409c                	lw	a5,0(s1)
    138e:	40f707bb          	subw	a5,a4,a5
    1392:	2781                	sext.w	a5,a5
    1394:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    1398:	f5043783          	ld	a5,-176(s0)
    139c:	f6f43023          	sd	a5,-160(s0)
    13a0:	f5843783          	ld	a5,-168(s0)
    13a4:	f6f43423          	sd	a5,-152(s0)
    13a8:	f6043703          	ld	a4,-160(s0)
    13ac:	f6843783          	ld	a5,-152(s0)
    13b0:	863a                	mv	a2,a4
    13b2:	86be                	mv	a3,a5
    13b4:	8732                	mv	a4,a2
    13b6:	87b6                	mv	a5,a3
}
    13b8:	853a                	mv	a0,a4
    13ba:	85be                	mv	a1,a5
    13bc:	742a                	ld	s0,168(sp)
    13be:	748a                	ld	s1,160(sp)
    13c0:	614d                	addi	sp,sp,176
    13c2:	8082                	ret
