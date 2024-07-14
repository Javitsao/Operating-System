
user/_ln:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	1000                	addi	s0,sp,32
       8:	87aa                	mv	a5,a0
       a:	feb43023          	sd	a1,-32(s0)
       e:	fef42623          	sw	a5,-20(s0)
  if(argc != 3){
      12:	fec42783          	lw	a5,-20(s0)
      16:	0007871b          	sext.w	a4,a5
      1a:	478d                	li	a5,3
      1c:	02f70063          	beq	a4,a5,3c <main+0x3c>
    fprintf(2, "Usage: ln old new\n");
      20:	00001597          	auipc	a1,0x1
      24:	43858593          	addi	a1,a1,1080 # 1458 <schedule_rm+0x2ba>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9e2080e7          	jalr	-1566(ra) # a0c <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	4ea080e7          	jalr	1258(ra) # 51e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
      3c:	fe043783          	ld	a5,-32(s0)
      40:	07a1                	addi	a5,a5,8
      42:	6398                	ld	a4,0(a5)
      44:	fe043783          	ld	a5,-32(s0)
      48:	07c1                	addi	a5,a5,16
      4a:	639c                	ld	a5,0(a5)
      4c:	85be                	mv	a1,a5
      4e:	853a                	mv	a0,a4
      50:	00000097          	auipc	ra,0x0
      54:	52e080e7          	jalr	1326(ra) # 57e <link>
      58:	87aa                	mv	a5,a0
      5a:	0207d563          	bgez	a5,84 <main+0x84>
    fprintf(2, "link %s %s: failed\n", argv[1], argv[2]);
      5e:	fe043783          	ld	a5,-32(s0)
      62:	07a1                	addi	a5,a5,8
      64:	6398                	ld	a4,0(a5)
      66:	fe043783          	ld	a5,-32(s0)
      6a:	07c1                	addi	a5,a5,16
      6c:	639c                	ld	a5,0(a5)
      6e:	86be                	mv	a3,a5
      70:	863a                	mv	a2,a4
      72:	00001597          	auipc	a1,0x1
      76:	3fe58593          	addi	a1,a1,1022 # 1470 <schedule_rm+0x2d2>
      7a:	4509                	li	a0,2
      7c:	00001097          	auipc	ra,0x1
      80:	990080e7          	jalr	-1648(ra) # a0c <fprintf>
  exit(0);
      84:	4501                	li	a0,0
      86:	00000097          	auipc	ra,0x0
      8a:	498080e7          	jalr	1176(ra) # 51e <exit>

000000000000008e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      8e:	7179                	addi	sp,sp,-48
      90:	f422                	sd	s0,40(sp)
      92:	1800                	addi	s0,sp,48
      94:	fca43c23          	sd	a0,-40(s0)
      98:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      9c:	fd843783          	ld	a5,-40(s0)
      a0:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      a4:	0001                	nop
      a6:	fd043703          	ld	a4,-48(s0)
      aa:	00170793          	addi	a5,a4,1
      ae:	fcf43823          	sd	a5,-48(s0)
      b2:	fd843783          	ld	a5,-40(s0)
      b6:	00178693          	addi	a3,a5,1
      ba:	fcd43c23          	sd	a3,-40(s0)
      be:	00074703          	lbu	a4,0(a4)
      c2:	00e78023          	sb	a4,0(a5)
      c6:	0007c783          	lbu	a5,0(a5)
      ca:	fff1                	bnez	a5,a6 <strcpy+0x18>
    ;
  return os;
      cc:	fe843783          	ld	a5,-24(s0)
}
      d0:	853e                	mv	a0,a5
      d2:	7422                	ld	s0,40(sp)
      d4:	6145                	addi	sp,sp,48
      d6:	8082                	ret

00000000000000d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      d8:	1101                	addi	sp,sp,-32
      da:	ec22                	sd	s0,24(sp)
      dc:	1000                	addi	s0,sp,32
      de:	fea43423          	sd	a0,-24(s0)
      e2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      e6:	a819                	j	fc <strcmp+0x24>
    p++, q++;
      e8:	fe843783          	ld	a5,-24(s0)
      ec:	0785                	addi	a5,a5,1
      ee:	fef43423          	sd	a5,-24(s0)
      f2:	fe043783          	ld	a5,-32(s0)
      f6:	0785                	addi	a5,a5,1
      f8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      fc:	fe843783          	ld	a5,-24(s0)
     100:	0007c783          	lbu	a5,0(a5)
     104:	cb99                	beqz	a5,11a <strcmp+0x42>
     106:	fe843783          	ld	a5,-24(s0)
     10a:	0007c703          	lbu	a4,0(a5)
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	fcf709e3          	beq	a4,a5,e8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     11a:	fe843783          	ld	a5,-24(s0)
     11e:	0007c783          	lbu	a5,0(a5)
     122:	0007871b          	sext.w	a4,a5
     126:	fe043783          	ld	a5,-32(s0)
     12a:	0007c783          	lbu	a5,0(a5)
     12e:	2781                	sext.w	a5,a5
     130:	40f707bb          	subw	a5,a4,a5
     134:	2781                	sext.w	a5,a5
}
     136:	853e                	mv	a0,a5
     138:	6462                	ld	s0,24(sp)
     13a:	6105                	addi	sp,sp,32
     13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
     13e:	7179                	addi	sp,sp,-48
     140:	f422                	sd	s0,40(sp)
     142:	1800                	addi	s0,sp,48
     144:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     148:	fe042623          	sw	zero,-20(s0)
     14c:	a031                	j	158 <strlen+0x1a>
     14e:	fec42783          	lw	a5,-20(s0)
     152:	2785                	addiw	a5,a5,1
     154:	fef42623          	sw	a5,-20(s0)
     158:	fec42783          	lw	a5,-20(s0)
     15c:	fd843703          	ld	a4,-40(s0)
     160:	97ba                	add	a5,a5,a4
     162:	0007c783          	lbu	a5,0(a5)
     166:	f7e5                	bnez	a5,14e <strlen+0x10>
    ;
  return n;
     168:	fec42783          	lw	a5,-20(s0)
}
     16c:	853e                	mv	a0,a5
     16e:	7422                	ld	s0,40(sp)
     170:	6145                	addi	sp,sp,48
     172:	8082                	ret

0000000000000174 <memset>:

void*
memset(void *dst, int c, uint n)
{
     174:	7179                	addi	sp,sp,-48
     176:	f422                	sd	s0,40(sp)
     178:	1800                	addi	s0,sp,48
     17a:	fca43c23          	sd	a0,-40(s0)
     17e:	87ae                	mv	a5,a1
     180:	8732                	mv	a4,a2
     182:	fcf42a23          	sw	a5,-44(s0)
     186:	87ba                	mv	a5,a4
     188:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     18c:	fd843783          	ld	a5,-40(s0)
     190:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     194:	fe042623          	sw	zero,-20(s0)
     198:	a00d                	j	1ba <memset+0x46>
    cdst[i] = c;
     19a:	fec42783          	lw	a5,-20(s0)
     19e:	fe043703          	ld	a4,-32(s0)
     1a2:	97ba                	add	a5,a5,a4
     1a4:	fd442703          	lw	a4,-44(s0)
     1a8:	0ff77713          	andi	a4,a4,255
     1ac:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1b0:	fec42783          	lw	a5,-20(s0)
     1b4:	2785                	addiw	a5,a5,1
     1b6:	fef42623          	sw	a5,-20(s0)
     1ba:	fec42703          	lw	a4,-20(s0)
     1be:	fd042783          	lw	a5,-48(s0)
     1c2:	2781                	sext.w	a5,a5
     1c4:	fcf76be3          	bltu	a4,a5,19a <memset+0x26>
  }
  return dst;
     1c8:	fd843783          	ld	a5,-40(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
     1d4:	1101                	addi	sp,sp,-32
     1d6:	ec22                	sd	s0,24(sp)
     1d8:	1000                	addi	s0,sp,32
     1da:	fea43423          	sd	a0,-24(s0)
     1de:	87ae                	mv	a5,a1
     1e0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1e4:	a01d                	j	20a <strchr+0x36>
    if(*s == c)
     1e6:	fe843783          	ld	a5,-24(s0)
     1ea:	0007c703          	lbu	a4,0(a5)
     1ee:	fe744783          	lbu	a5,-25(s0)
     1f2:	0ff7f793          	andi	a5,a5,255
     1f6:	00e79563          	bne	a5,a4,200 <strchr+0x2c>
      return (char*)s;
     1fa:	fe843783          	ld	a5,-24(s0)
     1fe:	a821                	j	216 <strchr+0x42>
  for(; *s; s++)
     200:	fe843783          	ld	a5,-24(s0)
     204:	0785                	addi	a5,a5,1
     206:	fef43423          	sd	a5,-24(s0)
     20a:	fe843783          	ld	a5,-24(s0)
     20e:	0007c783          	lbu	a5,0(a5)
     212:	fbf1                	bnez	a5,1e6 <strchr+0x12>
  return 0;
     214:	4781                	li	a5,0
}
     216:	853e                	mv	a0,a5
     218:	6462                	ld	s0,24(sp)
     21a:	6105                	addi	sp,sp,32
     21c:	8082                	ret

000000000000021e <gets>:

char*
gets(char *buf, int max)
{
     21e:	7179                	addi	sp,sp,-48
     220:	f406                	sd	ra,40(sp)
     222:	f022                	sd	s0,32(sp)
     224:	1800                	addi	s0,sp,48
     226:	fca43c23          	sd	a0,-40(s0)
     22a:	87ae                	mv	a5,a1
     22c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     230:	fe042623          	sw	zero,-20(s0)
     234:	a8a1                	j	28c <gets+0x6e>
    cc = read(0, &c, 1);
     236:	fe740793          	addi	a5,s0,-25
     23a:	4605                	li	a2,1
     23c:	85be                	mv	a1,a5
     23e:	4501                	li	a0,0
     240:	00000097          	auipc	ra,0x0
     244:	2f6080e7          	jalr	758(ra) # 536 <read>
     248:	87aa                	mv	a5,a0
     24a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     24e:	fe842783          	lw	a5,-24(s0)
     252:	2781                	sext.w	a5,a5
     254:	04f05763          	blez	a5,2a2 <gets+0x84>
      break;
    buf[i++] = c;
     258:	fec42783          	lw	a5,-20(s0)
     25c:	0017871b          	addiw	a4,a5,1
     260:	fee42623          	sw	a4,-20(s0)
     264:	873e                	mv	a4,a5
     266:	fd843783          	ld	a5,-40(s0)
     26a:	97ba                	add	a5,a5,a4
     26c:	fe744703          	lbu	a4,-25(s0)
     270:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     274:	fe744783          	lbu	a5,-25(s0)
     278:	873e                	mv	a4,a5
     27a:	47a9                	li	a5,10
     27c:	02f70463          	beq	a4,a5,2a4 <gets+0x86>
     280:	fe744783          	lbu	a5,-25(s0)
     284:	873e                	mv	a4,a5
     286:	47b5                	li	a5,13
     288:	00f70e63          	beq	a4,a5,2a4 <gets+0x86>
  for(i=0; i+1 < max; ){
     28c:	fec42783          	lw	a5,-20(s0)
     290:	2785                	addiw	a5,a5,1
     292:	0007871b          	sext.w	a4,a5
     296:	fd442783          	lw	a5,-44(s0)
     29a:	2781                	sext.w	a5,a5
     29c:	f8f74de3          	blt	a4,a5,236 <gets+0x18>
     2a0:	a011                	j	2a4 <gets+0x86>
      break;
     2a2:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2a4:	fec42783          	lw	a5,-20(s0)
     2a8:	fd843703          	ld	a4,-40(s0)
     2ac:	97ba                	add	a5,a5,a4
     2ae:	00078023          	sb	zero,0(a5)
  return buf;
     2b2:	fd843783          	ld	a5,-40(s0)
}
     2b6:	853e                	mv	a0,a5
     2b8:	70a2                	ld	ra,40(sp)
     2ba:	7402                	ld	s0,32(sp)
     2bc:	6145                	addi	sp,sp,48
     2be:	8082                	ret

00000000000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
     2c0:	7179                	addi	sp,sp,-48
     2c2:	f406                	sd	ra,40(sp)
     2c4:	f022                	sd	s0,32(sp)
     2c6:	1800                	addi	s0,sp,48
     2c8:	fca43c23          	sd	a0,-40(s0)
     2cc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2d0:	4581                	li	a1,0
     2d2:	fd843503          	ld	a0,-40(s0)
     2d6:	00000097          	auipc	ra,0x0
     2da:	288080e7          	jalr	648(ra) # 55e <open>
     2de:	87aa                	mv	a5,a0
     2e0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2e4:	fec42783          	lw	a5,-20(s0)
     2e8:	2781                	sext.w	a5,a5
     2ea:	0007d463          	bgez	a5,2f2 <stat+0x32>
    return -1;
     2ee:	57fd                	li	a5,-1
     2f0:	a035                	j	31c <stat+0x5c>
  r = fstat(fd, st);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	fd043583          	ld	a1,-48(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	27a080e7          	jalr	634(ra) # 576 <fstat>
     304:	87aa                	mv	a5,a0
     306:	fef42423          	sw	a5,-24(s0)
  close(fd);
     30a:	fec42783          	lw	a5,-20(s0)
     30e:	853e                	mv	a0,a5
     310:	00000097          	auipc	ra,0x0
     314:	236080e7          	jalr	566(ra) # 546 <close>
  return r;
     318:	fe842783          	lw	a5,-24(s0)
}
     31c:	853e                	mv	a0,a5
     31e:	70a2                	ld	ra,40(sp)
     320:	7402                	ld	s0,32(sp)
     322:	6145                	addi	sp,sp,48
     324:	8082                	ret

0000000000000326 <atoi>:

int
atoi(const char *s)
{
     326:	7179                	addi	sp,sp,-48
     328:	f422                	sd	s0,40(sp)
     32a:	1800                	addi	s0,sp,48
     32c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     330:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     334:	a815                	j	368 <atoi+0x42>
    n = n*10 + *s++ - '0';
     336:	fec42703          	lw	a4,-20(s0)
     33a:	87ba                	mv	a5,a4
     33c:	0027979b          	slliw	a5,a5,0x2
     340:	9fb9                	addw	a5,a5,a4
     342:	0017979b          	slliw	a5,a5,0x1
     346:	0007871b          	sext.w	a4,a5
     34a:	fd843783          	ld	a5,-40(s0)
     34e:	00178693          	addi	a3,a5,1
     352:	fcd43c23          	sd	a3,-40(s0)
     356:	0007c783          	lbu	a5,0(a5)
     35a:	2781                	sext.w	a5,a5
     35c:	9fb9                	addw	a5,a5,a4
     35e:	2781                	sext.w	a5,a5
     360:	fd07879b          	addiw	a5,a5,-48
     364:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     368:	fd843783          	ld	a5,-40(s0)
     36c:	0007c783          	lbu	a5,0(a5)
     370:	873e                	mv	a4,a5
     372:	02f00793          	li	a5,47
     376:	00e7fb63          	bgeu	a5,a4,38c <atoi+0x66>
     37a:	fd843783          	ld	a5,-40(s0)
     37e:	0007c783          	lbu	a5,0(a5)
     382:	873e                	mv	a4,a5
     384:	03900793          	li	a5,57
     388:	fae7f7e3          	bgeu	a5,a4,336 <atoi+0x10>
  return n;
     38c:	fec42783          	lw	a5,-20(s0)
}
     390:	853e                	mv	a0,a5
     392:	7422                	ld	s0,40(sp)
     394:	6145                	addi	sp,sp,48
     396:	8082                	ret

0000000000000398 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     398:	7139                	addi	sp,sp,-64
     39a:	fc22                	sd	s0,56(sp)
     39c:	0080                	addi	s0,sp,64
     39e:	fca43c23          	sd	a0,-40(s0)
     3a2:	fcb43823          	sd	a1,-48(s0)
     3a6:	87b2                	mv	a5,a2
     3a8:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3ac:	fd843783          	ld	a5,-40(s0)
     3b0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3b4:	fd043783          	ld	a5,-48(s0)
     3b8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3bc:	fe043703          	ld	a4,-32(s0)
     3c0:	fe843783          	ld	a5,-24(s0)
     3c4:	02e7fc63          	bgeu	a5,a4,3fc <memmove+0x64>
    while(n-- > 0)
     3c8:	a00d                	j	3ea <memmove+0x52>
      *dst++ = *src++;
     3ca:	fe043703          	ld	a4,-32(s0)
     3ce:	00170793          	addi	a5,a4,1
     3d2:	fef43023          	sd	a5,-32(s0)
     3d6:	fe843783          	ld	a5,-24(s0)
     3da:	00178693          	addi	a3,a5,1
     3de:	fed43423          	sd	a3,-24(s0)
     3e2:	00074703          	lbu	a4,0(a4)
     3e6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3ea:	fcc42783          	lw	a5,-52(s0)
     3ee:	fff7871b          	addiw	a4,a5,-1
     3f2:	fce42623          	sw	a4,-52(s0)
     3f6:	fcf04ae3          	bgtz	a5,3ca <memmove+0x32>
     3fa:	a891                	j	44e <memmove+0xb6>
  } else {
    dst += n;
     3fc:	fcc42783          	lw	a5,-52(s0)
     400:	fe843703          	ld	a4,-24(s0)
     404:	97ba                	add	a5,a5,a4
     406:	fef43423          	sd	a5,-24(s0)
    src += n;
     40a:	fcc42783          	lw	a5,-52(s0)
     40e:	fe043703          	ld	a4,-32(s0)
     412:	97ba                	add	a5,a5,a4
     414:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     418:	a01d                	j	43e <memmove+0xa6>
      *--dst = *--src;
     41a:	fe043783          	ld	a5,-32(s0)
     41e:	17fd                	addi	a5,a5,-1
     420:	fef43023          	sd	a5,-32(s0)
     424:	fe843783          	ld	a5,-24(s0)
     428:	17fd                	addi	a5,a5,-1
     42a:	fef43423          	sd	a5,-24(s0)
     42e:	fe043783          	ld	a5,-32(s0)
     432:	0007c703          	lbu	a4,0(a5)
     436:	fe843783          	ld	a5,-24(s0)
     43a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     43e:	fcc42783          	lw	a5,-52(s0)
     442:	fff7871b          	addiw	a4,a5,-1
     446:	fce42623          	sw	a4,-52(s0)
     44a:	fcf048e3          	bgtz	a5,41a <memmove+0x82>
  }
  return vdst;
     44e:	fd843783          	ld	a5,-40(s0)
}
     452:	853e                	mv	a0,a5
     454:	7462                	ld	s0,56(sp)
     456:	6121                	addi	sp,sp,64
     458:	8082                	ret

000000000000045a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     45a:	7139                	addi	sp,sp,-64
     45c:	fc22                	sd	s0,56(sp)
     45e:	0080                	addi	s0,sp,64
     460:	fca43c23          	sd	a0,-40(s0)
     464:	fcb43823          	sd	a1,-48(s0)
     468:	87b2                	mv	a5,a2
     46a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     46e:	fd843783          	ld	a5,-40(s0)
     472:	fef43423          	sd	a5,-24(s0)
     476:	fd043783          	ld	a5,-48(s0)
     47a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     47e:	a0a1                	j	4c6 <memcmp+0x6c>
    if (*p1 != *p2) {
     480:	fe843783          	ld	a5,-24(s0)
     484:	0007c703          	lbu	a4,0(a5)
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	02f70163          	beq	a4,a5,4b2 <memcmp+0x58>
      return *p1 - *p2;
     494:	fe843783          	ld	a5,-24(s0)
     498:	0007c783          	lbu	a5,0(a5)
     49c:	0007871b          	sext.w	a4,a5
     4a0:	fe043783          	ld	a5,-32(s0)
     4a4:	0007c783          	lbu	a5,0(a5)
     4a8:	2781                	sext.w	a5,a5
     4aa:	40f707bb          	subw	a5,a4,a5
     4ae:	2781                	sext.w	a5,a5
     4b0:	a01d                	j	4d6 <memcmp+0x7c>
    }
    p1++;
     4b2:	fe843783          	ld	a5,-24(s0)
     4b6:	0785                	addi	a5,a5,1
     4b8:	fef43423          	sd	a5,-24(s0)
    p2++;
     4bc:	fe043783          	ld	a5,-32(s0)
     4c0:	0785                	addi	a5,a5,1
     4c2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c6:	fcc42783          	lw	a5,-52(s0)
     4ca:	fff7871b          	addiw	a4,a5,-1
     4ce:	fce42623          	sw	a4,-52(s0)
     4d2:	f7dd                	bnez	a5,480 <memcmp+0x26>
  }
  return 0;
     4d4:	4781                	li	a5,0
}
     4d6:	853e                	mv	a0,a5
     4d8:	7462                	ld	s0,56(sp)
     4da:	6121                	addi	sp,sp,64
     4dc:	8082                	ret

00000000000004de <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4de:	7179                	addi	sp,sp,-48
     4e0:	f406                	sd	ra,40(sp)
     4e2:	f022                	sd	s0,32(sp)
     4e4:	1800                	addi	s0,sp,48
     4e6:	fea43423          	sd	a0,-24(s0)
     4ea:	feb43023          	sd	a1,-32(s0)
     4ee:	87b2                	mv	a5,a2
     4f0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4f4:	fdc42783          	lw	a5,-36(s0)
     4f8:	863e                	mv	a2,a5
     4fa:	fe043583          	ld	a1,-32(s0)
     4fe:	fe843503          	ld	a0,-24(s0)
     502:	00000097          	auipc	ra,0x0
     506:	e96080e7          	jalr	-362(ra) # 398 <memmove>
     50a:	87aa                	mv	a5,a0
}
     50c:	853e                	mv	a0,a5
     50e:	70a2                	ld	ra,40(sp)
     510:	7402                	ld	s0,32(sp)
     512:	6145                	addi	sp,sp,48
     514:	8082                	ret

0000000000000516 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     516:	4885                	li	a7,1
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <exit>:
.global exit
exit:
 li a7, SYS_exit
     51e:	4889                	li	a7,2
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <wait>:
.global wait
wait:
 li a7, SYS_wait
     526:	488d                	li	a7,3
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     52e:	4891                	li	a7,4
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <read>:
.global read
read:
 li a7, SYS_read
     536:	4895                	li	a7,5
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <write>:
.global write
write:
 li a7, SYS_write
     53e:	48c1                	li	a7,16
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <close>:
.global close
close:
 li a7, SYS_close
     546:	48d5                	li	a7,21
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <kill>:
.global kill
kill:
 li a7, SYS_kill
     54e:	4899                	li	a7,6
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <exec>:
.global exec
exec:
 li a7, SYS_exec
     556:	489d                	li	a7,7
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <open>:
.global open
open:
 li a7, SYS_open
     55e:	48bd                	li	a7,15
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     566:	48c5                	li	a7,17
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     56e:	48c9                	li	a7,18
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     576:	48a1                	li	a7,8
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <link>:
.global link
link:
 li a7, SYS_link
     57e:	48cd                	li	a7,19
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     586:	48d1                	li	a7,20
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     58e:	48a5                	li	a7,9
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <dup>:
.global dup
dup:
 li a7, SYS_dup
     596:	48a9                	li	a7,10
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     59e:	48ad                	li	a7,11
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5a6:	48b1                	li	a7,12
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ae:	48b5                	li	a7,13
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5b6:	48b9                	li	a7,14
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5be:	48d9                	li	a7,22
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5c6:	48dd                	li	a7,23
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5ce:	48e1                	li	a7,24
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5d6:	1101                	addi	sp,sp,-32
     5d8:	ec06                	sd	ra,24(sp)
     5da:	e822                	sd	s0,16(sp)
     5dc:	1000                	addi	s0,sp,32
     5de:	87aa                	mv	a5,a0
     5e0:	872e                	mv	a4,a1
     5e2:	fef42623          	sw	a5,-20(s0)
     5e6:	87ba                	mv	a5,a4
     5e8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5ec:	feb40713          	addi	a4,s0,-21
     5f0:	fec42783          	lw	a5,-20(s0)
     5f4:	4605                	li	a2,1
     5f6:	85ba                	mv	a1,a4
     5f8:	853e                	mv	a0,a5
     5fa:	00000097          	auipc	ra,0x0
     5fe:	f44080e7          	jalr	-188(ra) # 53e <write>
}
     602:	0001                	nop
     604:	60e2                	ld	ra,24(sp)
     606:	6442                	ld	s0,16(sp)
     608:	6105                	addi	sp,sp,32
     60a:	8082                	ret

000000000000060c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     60c:	7139                	addi	sp,sp,-64
     60e:	fc06                	sd	ra,56(sp)
     610:	f822                	sd	s0,48(sp)
     612:	0080                	addi	s0,sp,64
     614:	87aa                	mv	a5,a0
     616:	8736                	mv	a4,a3
     618:	fcf42623          	sw	a5,-52(s0)
     61c:	87ae                	mv	a5,a1
     61e:	fcf42423          	sw	a5,-56(s0)
     622:	87b2                	mv	a5,a2
     624:	fcf42223          	sw	a5,-60(s0)
     628:	87ba                	mv	a5,a4
     62a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     62e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     632:	fc042783          	lw	a5,-64(s0)
     636:	2781                	sext.w	a5,a5
     638:	c38d                	beqz	a5,65a <printint+0x4e>
     63a:	fc842783          	lw	a5,-56(s0)
     63e:	2781                	sext.w	a5,a5
     640:	0007dd63          	bgez	a5,65a <printint+0x4e>
    neg = 1;
     644:	4785                	li	a5,1
     646:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     64a:	fc842783          	lw	a5,-56(s0)
     64e:	40f007bb          	negw	a5,a5
     652:	2781                	sext.w	a5,a5
     654:	fef42223          	sw	a5,-28(s0)
     658:	a029                	j	662 <printint+0x56>
  } else {
    x = xx;
     65a:	fc842783          	lw	a5,-56(s0)
     65e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     662:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     666:	fc442783          	lw	a5,-60(s0)
     66a:	fe442703          	lw	a4,-28(s0)
     66e:	02f777bb          	remuw	a5,a4,a5
     672:	0007861b          	sext.w	a2,a5
     676:	fec42783          	lw	a5,-20(s0)
     67a:	0017871b          	addiw	a4,a5,1
     67e:	fee42623          	sw	a4,-20(s0)
     682:	00001697          	auipc	a3,0x1
     686:	e0e68693          	addi	a3,a3,-498 # 1490 <digits>
     68a:	02061713          	slli	a4,a2,0x20
     68e:	9301                	srli	a4,a4,0x20
     690:	9736                	add	a4,a4,a3
     692:	00074703          	lbu	a4,0(a4)
     696:	ff040693          	addi	a3,s0,-16
     69a:	97b6                	add	a5,a5,a3
     69c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6a0:	fc442783          	lw	a5,-60(s0)
     6a4:	fe442703          	lw	a4,-28(s0)
     6a8:	02f757bb          	divuw	a5,a4,a5
     6ac:	fef42223          	sw	a5,-28(s0)
     6b0:	fe442783          	lw	a5,-28(s0)
     6b4:	2781                	sext.w	a5,a5
     6b6:	fbc5                	bnez	a5,666 <printint+0x5a>
  if(neg)
     6b8:	fe842783          	lw	a5,-24(s0)
     6bc:	2781                	sext.w	a5,a5
     6be:	cf95                	beqz	a5,6fa <printint+0xee>
    buf[i++] = '-';
     6c0:	fec42783          	lw	a5,-20(s0)
     6c4:	0017871b          	addiw	a4,a5,1
     6c8:	fee42623          	sw	a4,-20(s0)
     6cc:	ff040713          	addi	a4,s0,-16
     6d0:	97ba                	add	a5,a5,a4
     6d2:	02d00713          	li	a4,45
     6d6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6da:	a005                	j	6fa <printint+0xee>
    putc(fd, buf[i]);
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	ff040713          	addi	a4,s0,-16
     6e4:	97ba                	add	a5,a5,a4
     6e6:	fe07c703          	lbu	a4,-32(a5)
     6ea:	fcc42783          	lw	a5,-52(s0)
     6ee:	85ba                	mv	a1,a4
     6f0:	853e                	mv	a0,a5
     6f2:	00000097          	auipc	ra,0x0
     6f6:	ee4080e7          	jalr	-284(ra) # 5d6 <putc>
  while(--i >= 0)
     6fa:	fec42783          	lw	a5,-20(s0)
     6fe:	37fd                	addiw	a5,a5,-1
     700:	fef42623          	sw	a5,-20(s0)
     704:	fec42783          	lw	a5,-20(s0)
     708:	2781                	sext.w	a5,a5
     70a:	fc07d9e3          	bgez	a5,6dc <printint+0xd0>
}
     70e:	0001                	nop
     710:	0001                	nop
     712:	70e2                	ld	ra,56(sp)
     714:	7442                	ld	s0,48(sp)
     716:	6121                	addi	sp,sp,64
     718:	8082                	ret

000000000000071a <printptr>:

static void
printptr(int fd, uint64 x) {
     71a:	7179                	addi	sp,sp,-48
     71c:	f406                	sd	ra,40(sp)
     71e:	f022                	sd	s0,32(sp)
     720:	1800                	addi	s0,sp,48
     722:	87aa                	mv	a5,a0
     724:	fcb43823          	sd	a1,-48(s0)
     728:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     72c:	fdc42783          	lw	a5,-36(s0)
     730:	03000593          	li	a1,48
     734:	853e                	mv	a0,a5
     736:	00000097          	auipc	ra,0x0
     73a:	ea0080e7          	jalr	-352(ra) # 5d6 <putc>
  putc(fd, 'x');
     73e:	fdc42783          	lw	a5,-36(s0)
     742:	07800593          	li	a1,120
     746:	853e                	mv	a0,a5
     748:	00000097          	auipc	ra,0x0
     74c:	e8e080e7          	jalr	-370(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     750:	fe042623          	sw	zero,-20(s0)
     754:	a82d                	j	78e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     756:	fd043783          	ld	a5,-48(s0)
     75a:	93f1                	srli	a5,a5,0x3c
     75c:	00001717          	auipc	a4,0x1
     760:	d3470713          	addi	a4,a4,-716 # 1490 <digits>
     764:	97ba                	add	a5,a5,a4
     766:	0007c703          	lbu	a4,0(a5)
     76a:	fdc42783          	lw	a5,-36(s0)
     76e:	85ba                	mv	a1,a4
     770:	853e                	mv	a0,a5
     772:	00000097          	auipc	ra,0x0
     776:	e64080e7          	jalr	-412(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     77a:	fec42783          	lw	a5,-20(s0)
     77e:	2785                	addiw	a5,a5,1
     780:	fef42623          	sw	a5,-20(s0)
     784:	fd043783          	ld	a5,-48(s0)
     788:	0792                	slli	a5,a5,0x4
     78a:	fcf43823          	sd	a5,-48(s0)
     78e:	fec42783          	lw	a5,-20(s0)
     792:	873e                	mv	a4,a5
     794:	47bd                	li	a5,15
     796:	fce7f0e3          	bgeu	a5,a4,756 <printptr+0x3c>
}
     79a:	0001                	nop
     79c:	0001                	nop
     79e:	70a2                	ld	ra,40(sp)
     7a0:	7402                	ld	s0,32(sp)
     7a2:	6145                	addi	sp,sp,48
     7a4:	8082                	ret

00000000000007a6 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7a6:	715d                	addi	sp,sp,-80
     7a8:	e486                	sd	ra,72(sp)
     7aa:	e0a2                	sd	s0,64(sp)
     7ac:	0880                	addi	s0,sp,80
     7ae:	87aa                	mv	a5,a0
     7b0:	fcb43023          	sd	a1,-64(s0)
     7b4:	fac43c23          	sd	a2,-72(s0)
     7b8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7bc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7c0:	fe042223          	sw	zero,-28(s0)
     7c4:	a42d                	j	9ee <vprintf+0x248>
    c = fmt[i] & 0xff;
     7c6:	fe442783          	lw	a5,-28(s0)
     7ca:	fc043703          	ld	a4,-64(s0)
     7ce:	97ba                	add	a5,a5,a4
     7d0:	0007c783          	lbu	a5,0(a5)
     7d4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7d8:	fe042783          	lw	a5,-32(s0)
     7dc:	2781                	sext.w	a5,a5
     7de:	eb9d                	bnez	a5,814 <vprintf+0x6e>
      if(c == '%'){
     7e0:	fdc42783          	lw	a5,-36(s0)
     7e4:	0007871b          	sext.w	a4,a5
     7e8:	02500793          	li	a5,37
     7ec:	00f71763          	bne	a4,a5,7fa <vprintf+0x54>
        state = '%';
     7f0:	02500793          	li	a5,37
     7f4:	fef42023          	sw	a5,-32(s0)
     7f8:	a2f5                	j	9e4 <vprintf+0x23e>
      } else {
        putc(fd, c);
     7fa:	fdc42783          	lw	a5,-36(s0)
     7fe:	0ff7f713          	andi	a4,a5,255
     802:	fcc42783          	lw	a5,-52(s0)
     806:	85ba                	mv	a1,a4
     808:	853e                	mv	a0,a5
     80a:	00000097          	auipc	ra,0x0
     80e:	dcc080e7          	jalr	-564(ra) # 5d6 <putc>
     812:	aac9                	j	9e4 <vprintf+0x23e>
      }
    } else if(state == '%'){
     814:	fe042783          	lw	a5,-32(s0)
     818:	0007871b          	sext.w	a4,a5
     81c:	02500793          	li	a5,37
     820:	1cf71263          	bne	a4,a5,9e4 <vprintf+0x23e>
      if(c == 'd'){
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0007871b          	sext.w	a4,a5
     82c:	06400793          	li	a5,100
     830:	02f71463          	bne	a4,a5,858 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     834:	fb843783          	ld	a5,-72(s0)
     838:	00878713          	addi	a4,a5,8
     83c:	fae43c23          	sd	a4,-72(s0)
     840:	4398                	lw	a4,0(a5)
     842:	fcc42783          	lw	a5,-52(s0)
     846:	4685                	li	a3,1
     848:	4629                	li	a2,10
     84a:	85ba                	mv	a1,a4
     84c:	853e                	mv	a0,a5
     84e:	00000097          	auipc	ra,0x0
     852:	dbe080e7          	jalr	-578(ra) # 60c <printint>
     856:	a269                	j	9e0 <vprintf+0x23a>
      } else if(c == 'l') {
     858:	fdc42783          	lw	a5,-36(s0)
     85c:	0007871b          	sext.w	a4,a5
     860:	06c00793          	li	a5,108
     864:	02f71663          	bne	a4,a5,890 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     868:	fb843783          	ld	a5,-72(s0)
     86c:	00878713          	addi	a4,a5,8
     870:	fae43c23          	sd	a4,-72(s0)
     874:	639c                	ld	a5,0(a5)
     876:	0007871b          	sext.w	a4,a5
     87a:	fcc42783          	lw	a5,-52(s0)
     87e:	4681                	li	a3,0
     880:	4629                	li	a2,10
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	d86080e7          	jalr	-634(ra) # 60c <printint>
     88e:	aa89                	j	9e0 <vprintf+0x23a>
      } else if(c == 'x') {
     890:	fdc42783          	lw	a5,-36(s0)
     894:	0007871b          	sext.w	a4,a5
     898:	07800793          	li	a5,120
     89c:	02f71463          	bne	a4,a5,8c4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8a0:	fb843783          	ld	a5,-72(s0)
     8a4:	00878713          	addi	a4,a5,8
     8a8:	fae43c23          	sd	a4,-72(s0)
     8ac:	4398                	lw	a4,0(a5)
     8ae:	fcc42783          	lw	a5,-52(s0)
     8b2:	4681                	li	a3,0
     8b4:	4641                	li	a2,16
     8b6:	85ba                	mv	a1,a4
     8b8:	853e                	mv	a0,a5
     8ba:	00000097          	auipc	ra,0x0
     8be:	d52080e7          	jalr	-686(ra) # 60c <printint>
     8c2:	aa39                	j	9e0 <vprintf+0x23a>
      } else if(c == 'p') {
     8c4:	fdc42783          	lw	a5,-36(s0)
     8c8:	0007871b          	sext.w	a4,a5
     8cc:	07000793          	li	a5,112
     8d0:	02f71263          	bne	a4,a5,8f4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8d4:	fb843783          	ld	a5,-72(s0)
     8d8:	00878713          	addi	a4,a5,8
     8dc:	fae43c23          	sd	a4,-72(s0)
     8e0:	6398                	ld	a4,0(a5)
     8e2:	fcc42783          	lw	a5,-52(s0)
     8e6:	85ba                	mv	a1,a4
     8e8:	853e                	mv	a0,a5
     8ea:	00000097          	auipc	ra,0x0
     8ee:	e30080e7          	jalr	-464(ra) # 71a <printptr>
     8f2:	a0fd                	j	9e0 <vprintf+0x23a>
      } else if(c == 's'){
     8f4:	fdc42783          	lw	a5,-36(s0)
     8f8:	0007871b          	sext.w	a4,a5
     8fc:	07300793          	li	a5,115
     900:	04f71c63          	bne	a4,a5,958 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     904:	fb843783          	ld	a5,-72(s0)
     908:	00878713          	addi	a4,a5,8
     90c:	fae43c23          	sd	a4,-72(s0)
     910:	639c                	ld	a5,0(a5)
     912:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     916:	fe843783          	ld	a5,-24(s0)
     91a:	eb8d                	bnez	a5,94c <vprintf+0x1a6>
          s = "(null)";
     91c:	00001797          	auipc	a5,0x1
     920:	b6c78793          	addi	a5,a5,-1172 # 1488 <schedule_rm+0x2ea>
     924:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     928:	a015                	j	94c <vprintf+0x1a6>
          putc(fd, *s);
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0007c703          	lbu	a4,0(a5)
     932:	fcc42783          	lw	a5,-52(s0)
     936:	85ba                	mv	a1,a4
     938:	853e                	mv	a0,a5
     93a:	00000097          	auipc	ra,0x0
     93e:	c9c080e7          	jalr	-868(ra) # 5d6 <putc>
          s++;
     942:	fe843783          	ld	a5,-24(s0)
     946:	0785                	addi	a5,a5,1
     948:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     94c:	fe843783          	ld	a5,-24(s0)
     950:	0007c783          	lbu	a5,0(a5)
     954:	fbf9                	bnez	a5,92a <vprintf+0x184>
     956:	a069                	j	9e0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     958:	fdc42783          	lw	a5,-36(s0)
     95c:	0007871b          	sext.w	a4,a5
     960:	06300793          	li	a5,99
     964:	02f71463          	bne	a4,a5,98c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     968:	fb843783          	ld	a5,-72(s0)
     96c:	00878713          	addi	a4,a5,8
     970:	fae43c23          	sd	a4,-72(s0)
     974:	439c                	lw	a5,0(a5)
     976:	0ff7f713          	andi	a4,a5,255
     97a:	fcc42783          	lw	a5,-52(s0)
     97e:	85ba                	mv	a1,a4
     980:	853e                	mv	a0,a5
     982:	00000097          	auipc	ra,0x0
     986:	c54080e7          	jalr	-940(ra) # 5d6 <putc>
     98a:	a899                	j	9e0 <vprintf+0x23a>
      } else if(c == '%'){
     98c:	fdc42783          	lw	a5,-36(s0)
     990:	0007871b          	sext.w	a4,a5
     994:	02500793          	li	a5,37
     998:	00f71f63          	bne	a4,a5,9b6 <vprintf+0x210>
        putc(fd, c);
     99c:	fdc42783          	lw	a5,-36(s0)
     9a0:	0ff7f713          	andi	a4,a5,255
     9a4:	fcc42783          	lw	a5,-52(s0)
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00000097          	auipc	ra,0x0
     9b0:	c2a080e7          	jalr	-982(ra) # 5d6 <putc>
     9b4:	a035                	j	9e0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9b6:	fcc42783          	lw	a5,-52(s0)
     9ba:	02500593          	li	a1,37
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	c16080e7          	jalr	-1002(ra) # 5d6 <putc>
        putc(fd, c);
     9c8:	fdc42783          	lw	a5,-36(s0)
     9cc:	0ff7f713          	andi	a4,a5,255
     9d0:	fcc42783          	lw	a5,-52(s0)
     9d4:	85ba                	mv	a1,a4
     9d6:	853e                	mv	a0,a5
     9d8:	00000097          	auipc	ra,0x0
     9dc:	bfe080e7          	jalr	-1026(ra) # 5d6 <putc>
      }
      state = 0;
     9e0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9e4:	fe442783          	lw	a5,-28(s0)
     9e8:	2785                	addiw	a5,a5,1
     9ea:	fef42223          	sw	a5,-28(s0)
     9ee:	fe442783          	lw	a5,-28(s0)
     9f2:	fc043703          	ld	a4,-64(s0)
     9f6:	97ba                	add	a5,a5,a4
     9f8:	0007c783          	lbu	a5,0(a5)
     9fc:	dc0795e3          	bnez	a5,7c6 <vprintf+0x20>
    }
  }
}
     a00:	0001                	nop
     a02:	0001                	nop
     a04:	60a6                	ld	ra,72(sp)
     a06:	6406                	ld	s0,64(sp)
     a08:	6161                	addi	sp,sp,80
     a0a:	8082                	ret

0000000000000a0c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a0c:	7159                	addi	sp,sp,-112
     a0e:	fc06                	sd	ra,56(sp)
     a10:	f822                	sd	s0,48(sp)
     a12:	0080                	addi	s0,sp,64
     a14:	fcb43823          	sd	a1,-48(s0)
     a18:	e010                	sd	a2,0(s0)
     a1a:	e414                	sd	a3,8(s0)
     a1c:	e818                	sd	a4,16(s0)
     a1e:	ec1c                	sd	a5,24(s0)
     a20:	03043023          	sd	a6,32(s0)
     a24:	03143423          	sd	a7,40(s0)
     a28:	87aa                	mv	a5,a0
     a2a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a2e:	03040793          	addi	a5,s0,48
     a32:	fcf43423          	sd	a5,-56(s0)
     a36:	fc843783          	ld	a5,-56(s0)
     a3a:	fd078793          	addi	a5,a5,-48
     a3e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a42:	fe843703          	ld	a4,-24(s0)
     a46:	fdc42783          	lw	a5,-36(s0)
     a4a:	863a                	mv	a2,a4
     a4c:	fd043583          	ld	a1,-48(s0)
     a50:	853e                	mv	a0,a5
     a52:	00000097          	auipc	ra,0x0
     a56:	d54080e7          	jalr	-684(ra) # 7a6 <vprintf>
}
     a5a:	0001                	nop
     a5c:	70e2                	ld	ra,56(sp)
     a5e:	7442                	ld	s0,48(sp)
     a60:	6165                	addi	sp,sp,112
     a62:	8082                	ret

0000000000000a64 <printf>:

void
printf(const char *fmt, ...)
{
     a64:	7159                	addi	sp,sp,-112
     a66:	f406                	sd	ra,40(sp)
     a68:	f022                	sd	s0,32(sp)
     a6a:	1800                	addi	s0,sp,48
     a6c:	fca43c23          	sd	a0,-40(s0)
     a70:	e40c                	sd	a1,8(s0)
     a72:	e810                	sd	a2,16(s0)
     a74:	ec14                	sd	a3,24(s0)
     a76:	f018                	sd	a4,32(s0)
     a78:	f41c                	sd	a5,40(s0)
     a7a:	03043823          	sd	a6,48(s0)
     a7e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a82:	04040793          	addi	a5,s0,64
     a86:	fcf43823          	sd	a5,-48(s0)
     a8a:	fd043783          	ld	a5,-48(s0)
     a8e:	fc878793          	addi	a5,a5,-56
     a92:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a96:	fe843783          	ld	a5,-24(s0)
     a9a:	863e                	mv	a2,a5
     a9c:	fd843583          	ld	a1,-40(s0)
     aa0:	4505                	li	a0,1
     aa2:	00000097          	auipc	ra,0x0
     aa6:	d04080e7          	jalr	-764(ra) # 7a6 <vprintf>
}
     aaa:	0001                	nop
     aac:	70a2                	ld	ra,40(sp)
     aae:	7402                	ld	s0,32(sp)
     ab0:	6165                	addi	sp,sp,112
     ab2:	8082                	ret

0000000000000ab4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ab4:	7179                	addi	sp,sp,-48
     ab6:	f422                	sd	s0,40(sp)
     ab8:	1800                	addi	s0,sp,48
     aba:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     abe:	fd843783          	ld	a5,-40(s0)
     ac2:	17c1                	addi	a5,a5,-16
     ac4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ac8:	00001797          	auipc	a5,0x1
     acc:	9f078793          	addi	a5,a5,-1552 # 14b8 <freep>
     ad0:	639c                	ld	a5,0(a5)
     ad2:	fef43423          	sd	a5,-24(s0)
     ad6:	a815                	j	b0a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ad8:	fe843783          	ld	a5,-24(s0)
     adc:	639c                	ld	a5,0(a5)
     ade:	fe843703          	ld	a4,-24(s0)
     ae2:	00f76f63          	bltu	a4,a5,b00 <free+0x4c>
     ae6:	fe043703          	ld	a4,-32(s0)
     aea:	fe843783          	ld	a5,-24(s0)
     aee:	02e7eb63          	bltu	a5,a4,b24 <free+0x70>
     af2:	fe843783          	ld	a5,-24(s0)
     af6:	639c                	ld	a5,0(a5)
     af8:	fe043703          	ld	a4,-32(s0)
     afc:	02f76463          	bltu	a4,a5,b24 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b00:	fe843783          	ld	a5,-24(s0)
     b04:	639c                	ld	a5,0(a5)
     b06:	fef43423          	sd	a5,-24(s0)
     b0a:	fe043703          	ld	a4,-32(s0)
     b0e:	fe843783          	ld	a5,-24(s0)
     b12:	fce7f3e3          	bgeu	a5,a4,ad8 <free+0x24>
     b16:	fe843783          	ld	a5,-24(s0)
     b1a:	639c                	ld	a5,0(a5)
     b1c:	fe043703          	ld	a4,-32(s0)
     b20:	faf77ce3          	bgeu	a4,a5,ad8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b24:	fe043783          	ld	a5,-32(s0)
     b28:	479c                	lw	a5,8(a5)
     b2a:	1782                	slli	a5,a5,0x20
     b2c:	9381                	srli	a5,a5,0x20
     b2e:	0792                	slli	a5,a5,0x4
     b30:	fe043703          	ld	a4,-32(s0)
     b34:	973e                	add	a4,a4,a5
     b36:	fe843783          	ld	a5,-24(s0)
     b3a:	639c                	ld	a5,0(a5)
     b3c:	02f71763          	bne	a4,a5,b6a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b40:	fe043783          	ld	a5,-32(s0)
     b44:	4798                	lw	a4,8(a5)
     b46:	fe843783          	ld	a5,-24(s0)
     b4a:	639c                	ld	a5,0(a5)
     b4c:	479c                	lw	a5,8(a5)
     b4e:	9fb9                	addw	a5,a5,a4
     b50:	0007871b          	sext.w	a4,a5
     b54:	fe043783          	ld	a5,-32(s0)
     b58:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b5a:	fe843783          	ld	a5,-24(s0)
     b5e:	639c                	ld	a5,0(a5)
     b60:	6398                	ld	a4,0(a5)
     b62:	fe043783          	ld	a5,-32(s0)
     b66:	e398                	sd	a4,0(a5)
     b68:	a039                	j	b76 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b6a:	fe843783          	ld	a5,-24(s0)
     b6e:	6398                	ld	a4,0(a5)
     b70:	fe043783          	ld	a5,-32(s0)
     b74:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	479c                	lw	a5,8(a5)
     b7c:	1782                	slli	a5,a5,0x20
     b7e:	9381                	srli	a5,a5,0x20
     b80:	0792                	slli	a5,a5,0x4
     b82:	fe843703          	ld	a4,-24(s0)
     b86:	97ba                	add	a5,a5,a4
     b88:	fe043703          	ld	a4,-32(s0)
     b8c:	02f71563          	bne	a4,a5,bb6 <free+0x102>
    p->s.size += bp->s.size;
     b90:	fe843783          	ld	a5,-24(s0)
     b94:	4798                	lw	a4,8(a5)
     b96:	fe043783          	ld	a5,-32(s0)
     b9a:	479c                	lw	a5,8(a5)
     b9c:	9fb9                	addw	a5,a5,a4
     b9e:	0007871b          	sext.w	a4,a5
     ba2:	fe843783          	ld	a5,-24(s0)
     ba6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ba8:	fe043783          	ld	a5,-32(s0)
     bac:	6398                	ld	a4,0(a5)
     bae:	fe843783          	ld	a5,-24(s0)
     bb2:	e398                	sd	a4,0(a5)
     bb4:	a031                	j	bc0 <free+0x10c>
  } else
    p->s.ptr = bp;
     bb6:	fe843783          	ld	a5,-24(s0)
     bba:	fe043703          	ld	a4,-32(s0)
     bbe:	e398                	sd	a4,0(a5)
  freep = p;
     bc0:	00001797          	auipc	a5,0x1
     bc4:	8f878793          	addi	a5,a5,-1800 # 14b8 <freep>
     bc8:	fe843703          	ld	a4,-24(s0)
     bcc:	e398                	sd	a4,0(a5)
}
     bce:	0001                	nop
     bd0:	7422                	ld	s0,40(sp)
     bd2:	6145                	addi	sp,sp,48
     bd4:	8082                	ret

0000000000000bd6 <morecore>:

static Header*
morecore(uint nu)
{
     bd6:	7179                	addi	sp,sp,-48
     bd8:	f406                	sd	ra,40(sp)
     bda:	f022                	sd	s0,32(sp)
     bdc:	1800                	addi	s0,sp,48
     bde:	87aa                	mv	a5,a0
     be0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     be4:	fdc42783          	lw	a5,-36(s0)
     be8:	0007871b          	sext.w	a4,a5
     bec:	6785                	lui	a5,0x1
     bee:	00f77563          	bgeu	a4,a5,bf8 <morecore+0x22>
    nu = 4096;
     bf2:	6785                	lui	a5,0x1
     bf4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     bf8:	fdc42783          	lw	a5,-36(s0)
     bfc:	0047979b          	slliw	a5,a5,0x4
     c00:	2781                	sext.w	a5,a5
     c02:	2781                	sext.w	a5,a5
     c04:	853e                	mv	a0,a5
     c06:	00000097          	auipc	ra,0x0
     c0a:	9a0080e7          	jalr	-1632(ra) # 5a6 <sbrk>
     c0e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c12:	fe843703          	ld	a4,-24(s0)
     c16:	57fd                	li	a5,-1
     c18:	00f71463          	bne	a4,a5,c20 <morecore+0x4a>
    return 0;
     c1c:	4781                	li	a5,0
     c1e:	a03d                	j	c4c <morecore+0x76>
  hp = (Header*)p;
     c20:	fe843783          	ld	a5,-24(s0)
     c24:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c28:	fe043783          	ld	a5,-32(s0)
     c2c:	fdc42703          	lw	a4,-36(s0)
     c30:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c32:	fe043783          	ld	a5,-32(s0)
     c36:	07c1                	addi	a5,a5,16
     c38:	853e                	mv	a0,a5
     c3a:	00000097          	auipc	ra,0x0
     c3e:	e7a080e7          	jalr	-390(ra) # ab4 <free>
  return freep;
     c42:	00001797          	auipc	a5,0x1
     c46:	87678793          	addi	a5,a5,-1930 # 14b8 <freep>
     c4a:	639c                	ld	a5,0(a5)
}
     c4c:	853e                	mv	a0,a5
     c4e:	70a2                	ld	ra,40(sp)
     c50:	7402                	ld	s0,32(sp)
     c52:	6145                	addi	sp,sp,48
     c54:	8082                	ret

0000000000000c56 <malloc>:

void*
malloc(uint nbytes)
{
     c56:	7139                	addi	sp,sp,-64
     c58:	fc06                	sd	ra,56(sp)
     c5a:	f822                	sd	s0,48(sp)
     c5c:	0080                	addi	s0,sp,64
     c5e:	87aa                	mv	a5,a0
     c60:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c64:	fcc46783          	lwu	a5,-52(s0)
     c68:	07bd                	addi	a5,a5,15
     c6a:	8391                	srli	a5,a5,0x4
     c6c:	2781                	sext.w	a5,a5
     c6e:	2785                	addiw	a5,a5,1
     c70:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c74:	00001797          	auipc	a5,0x1
     c78:	84478793          	addi	a5,a5,-1980 # 14b8 <freep>
     c7c:	639c                	ld	a5,0(a5)
     c7e:	fef43023          	sd	a5,-32(s0)
     c82:	fe043783          	ld	a5,-32(s0)
     c86:	ef95                	bnez	a5,cc2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c88:	00001797          	auipc	a5,0x1
     c8c:	82078793          	addi	a5,a5,-2016 # 14a8 <base>
     c90:	fef43023          	sd	a5,-32(s0)
     c94:	00001797          	auipc	a5,0x1
     c98:	82478793          	addi	a5,a5,-2012 # 14b8 <freep>
     c9c:	fe043703          	ld	a4,-32(s0)
     ca0:	e398                	sd	a4,0(a5)
     ca2:	00001797          	auipc	a5,0x1
     ca6:	81678793          	addi	a5,a5,-2026 # 14b8 <freep>
     caa:	6398                	ld	a4,0(a5)
     cac:	00000797          	auipc	a5,0x0
     cb0:	7fc78793          	addi	a5,a5,2044 # 14a8 <base>
     cb4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cb6:	00000797          	auipc	a5,0x0
     cba:	7f278793          	addi	a5,a5,2034 # 14a8 <base>
     cbe:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cc2:	fe043783          	ld	a5,-32(s0)
     cc6:	639c                	ld	a5,0(a5)
     cc8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     ccc:	fe843783          	ld	a5,-24(s0)
     cd0:	4798                	lw	a4,8(a5)
     cd2:	fdc42783          	lw	a5,-36(s0)
     cd6:	2781                	sext.w	a5,a5
     cd8:	06f76863          	bltu	a4,a5,d48 <malloc+0xf2>
      if(p->s.size == nunits)
     cdc:	fe843783          	ld	a5,-24(s0)
     ce0:	4798                	lw	a4,8(a5)
     ce2:	fdc42783          	lw	a5,-36(s0)
     ce6:	2781                	sext.w	a5,a5
     ce8:	00e79963          	bne	a5,a4,cfa <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cec:	fe843783          	ld	a5,-24(s0)
     cf0:	6398                	ld	a4,0(a5)
     cf2:	fe043783          	ld	a5,-32(s0)
     cf6:	e398                	sd	a4,0(a5)
     cf8:	a82d                	j	d32 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	4798                	lw	a4,8(a5)
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	40f707bb          	subw	a5,a4,a5
     d08:	0007871b          	sext.w	a4,a5
     d0c:	fe843783          	ld	a5,-24(s0)
     d10:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d12:	fe843783          	ld	a5,-24(s0)
     d16:	479c                	lw	a5,8(a5)
     d18:	1782                	slli	a5,a5,0x20
     d1a:	9381                	srli	a5,a5,0x20
     d1c:	0792                	slli	a5,a5,0x4
     d1e:	fe843703          	ld	a4,-24(s0)
     d22:	97ba                	add	a5,a5,a4
     d24:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	fdc42703          	lw	a4,-36(s0)
     d30:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d32:	00000797          	auipc	a5,0x0
     d36:	78678793          	addi	a5,a5,1926 # 14b8 <freep>
     d3a:	fe043703          	ld	a4,-32(s0)
     d3e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d40:	fe843783          	ld	a5,-24(s0)
     d44:	07c1                	addi	a5,a5,16
     d46:	a091                	j	d8a <malloc+0x134>
    }
    if(p == freep)
     d48:	00000797          	auipc	a5,0x0
     d4c:	77078793          	addi	a5,a5,1904 # 14b8 <freep>
     d50:	639c                	ld	a5,0(a5)
     d52:	fe843703          	ld	a4,-24(s0)
     d56:	02f71063          	bne	a4,a5,d76 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d5a:	fdc42783          	lw	a5,-36(s0)
     d5e:	853e                	mv	a0,a5
     d60:	00000097          	auipc	ra,0x0
     d64:	e76080e7          	jalr	-394(ra) # bd6 <morecore>
     d68:	fea43423          	sd	a0,-24(s0)
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	e399                	bnez	a5,d76 <malloc+0x120>
        return 0;
     d72:	4781                	li	a5,0
     d74:	a819                	j	d8a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d76:	fe843783          	ld	a5,-24(s0)
     d7a:	fef43023          	sd	a5,-32(s0)
     d7e:	fe843783          	ld	a5,-24(s0)
     d82:	639c                	ld	a5,0(a5)
     d84:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d88:	b791                	j	ccc <malloc+0x76>
  }
}
     d8a:	853e                	mv	a0,a5
     d8c:	70e2                	ld	ra,56(sp)
     d8e:	7442                	ld	s0,48(sp)
     d90:	6121                	addi	sp,sp,64
     d92:	8082                	ret

0000000000000d94 <setjmp>:
     d94:	e100                	sd	s0,0(a0)
     d96:	e504                	sd	s1,8(a0)
     d98:	01253823          	sd	s2,16(a0)
     d9c:	01353c23          	sd	s3,24(a0)
     da0:	03453023          	sd	s4,32(a0)
     da4:	03553423          	sd	s5,40(a0)
     da8:	03653823          	sd	s6,48(a0)
     dac:	03753c23          	sd	s7,56(a0)
     db0:	05853023          	sd	s8,64(a0)
     db4:	05953423          	sd	s9,72(a0)
     db8:	05a53823          	sd	s10,80(a0)
     dbc:	05b53c23          	sd	s11,88(a0)
     dc0:	06153023          	sd	ra,96(a0)
     dc4:	06253423          	sd	sp,104(a0)
     dc8:	4501                	li	a0,0
     dca:	8082                	ret

0000000000000dcc <longjmp>:
     dcc:	6100                	ld	s0,0(a0)
     dce:	6504                	ld	s1,8(a0)
     dd0:	01053903          	ld	s2,16(a0)
     dd4:	01853983          	ld	s3,24(a0)
     dd8:	02053a03          	ld	s4,32(a0)
     ddc:	02853a83          	ld	s5,40(a0)
     de0:	03053b03          	ld	s6,48(a0)
     de4:	03853b83          	ld	s7,56(a0)
     de8:	04053c03          	ld	s8,64(a0)
     dec:	04853c83          	ld	s9,72(a0)
     df0:	05053d03          	ld	s10,80(a0)
     df4:	05853d83          	ld	s11,88(a0)
     df8:	06053083          	ld	ra,96(a0)
     dfc:	06853103          	ld	sp,104(a0)
     e00:	c199                	beqz	a1,e06 <longjmp_1>
     e02:	852e                	mv	a0,a1
     e04:	8082                	ret

0000000000000e06 <longjmp_1>:
     e06:	4505                	li	a0,1
     e08:	8082                	ret

0000000000000e0a <schedule_default>:

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
     e0a:	715d                	addi	sp,sp,-80
     e0c:	e4a2                	sd	s0,72(sp)
     e0e:	e0a6                	sd	s1,64(sp)
     e10:	0880                	addi	s0,sp,80
     e12:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
     e14:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
     e18:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     e1c:	649c                	ld	a5,8(s1)
     e1e:	639c                	ld	a5,0(a5)
     e20:	fcf43c23          	sd	a5,-40(s0)
     e24:	fd843783          	ld	a5,-40(s0)
     e28:	fd878793          	addi	a5,a5,-40
     e2c:	fef43023          	sd	a5,-32(s0)
     e30:	a81d                	j	e66 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID) {
     e32:	fe843783          	ld	a5,-24(s0)
     e36:	cb89                	beqz	a5,e48 <schedule_default+0x3e>
     e38:	fe043783          	ld	a5,-32(s0)
     e3c:	5398                	lw	a4,32(a5)
     e3e:	fe843783          	ld	a5,-24(s0)
     e42:	539c                	lw	a5,32(a5)
     e44:	00f75663          	bge	a4,a5,e50 <schedule_default+0x46>
            thread_with_smallest_id = th;
     e48:	fe043783          	ld	a5,-32(s0)
     e4c:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     e50:	fe043783          	ld	a5,-32(s0)
     e54:	779c                	ld	a5,40(a5)
     e56:	fcf43823          	sd	a5,-48(s0)
     e5a:	fd043783          	ld	a5,-48(s0)
     e5e:	fd878793          	addi	a5,a5,-40
     e62:	fef43023          	sd	a5,-32(s0)
     e66:	fe043783          	ld	a5,-32(s0)
     e6a:	02878713          	addi	a4,a5,40
     e6e:	649c                	ld	a5,8(s1)
     e70:	fcf711e3          	bne	a4,a5,e32 <schedule_default+0x28>
        }
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
     e74:	fe843783          	ld	a5,-24(s0)
     e78:	cf89                	beqz	a5,e92 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
     e7a:	fe843783          	ld	a5,-24(s0)
     e7e:	02878793          	addi	a5,a5,40
     e82:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
     e86:	fe843783          	ld	a5,-24(s0)
     e8a:	47fc                	lw	a5,76(a5)
     e8c:	faf42c23          	sw	a5,-72(s0)
     e90:	a039                	j	e9e <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
     e92:	649c                	ld	a5,8(s1)
     e94:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
     e98:	4785                	li	a5,1
     e9a:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
     e9e:	fb043783          	ld	a5,-80(s0)
     ea2:	fcf43023          	sd	a5,-64(s0)
     ea6:	fb843783          	ld	a5,-72(s0)
     eaa:	fcf43423          	sd	a5,-56(s0)
     eae:	fc043703          	ld	a4,-64(s0)
     eb2:	fc843783          	ld	a5,-56(s0)
     eb6:	863a                	mv	a2,a4
     eb8:	86be                	mv	a3,a5
     eba:	8732                	mv	a4,a2
     ebc:	87b6                	mv	a5,a3

}
     ebe:	853a                	mv	a0,a4
     ec0:	85be                	mv	a1,a5
     ec2:	6426                	ld	s0,72(sp)
     ec4:	6486                	ld	s1,64(sp)
     ec6:	6161                	addi	sp,sp,80
     ec8:	8082                	ret

0000000000000eca <schedule_edf>:

/* Earliest-Deadline-First scheduling */
struct threads_sched_result schedule_edf(struct threads_sched_args args)
{   
     eca:	7171                	addi	sp,sp,-176
     ecc:	f522                	sd	s0,168(sp)
     ece:	f126                	sd	s1,160(sp)
     ed0:	1900                	addi	s0,sp,176
     ed2:	84aa                	mv	s1,a0
    int is_miss = 0;
     ed4:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_deadline = NULL, *tws_id = NULL;
     ed8:	fe043023          	sd	zero,-32(s0)
     edc:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
     ee0:	fc043823          	sd	zero,-48(s0)
    
    list_for_each_entry(th, args.run_queue, thread_list) {
     ee4:	649c                	ld	a5,8(s1)
     ee6:	639c                	ld	a5,0(a5)
     ee8:	faf43423          	sd	a5,-88(s0)
     eec:	fa843783          	ld	a5,-88(s0)
     ef0:	fd878793          	addi	a5,a5,-40
     ef4:	fcf43823          	sd	a5,-48(s0)
     ef8:	a895                	j	f6c <schedule_edf+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
     efa:	4098                	lw	a4,0(s1)
     efc:	fd043783          	ld	a5,-48(s0)
     f00:	47fc                	lw	a5,76(a5)
     f02:	9fb9                	addw	a5,a5,a4
     f04:	0007871b          	sext.w	a4,a5
     f08:	fd043783          	ld	a5,-48(s0)
     f0c:	4bbc                	lw	a5,80(a5)
     f0e:	00e7d563          	bge	a5,a4,f18 <schedule_edf+0x4e>
            is_miss = 1;
     f12:	4785                	li	a5,1
     f14:	fef42623          	sw	a5,-20(s0)
        }
        if (tws_deadline == NULL || (th->current_deadline < tws_deadline->current_deadline) || (th->current_deadline == tws_deadline->current_deadline && th->ID < tws_deadline->ID)) {
     f18:	fe043783          	ld	a5,-32(s0)
     f1c:	cb8d                	beqz	a5,f4e <schedule_edf+0x84>
     f1e:	fd043783          	ld	a5,-48(s0)
     f22:	4bb8                	lw	a4,80(a5)
     f24:	fe043783          	ld	a5,-32(s0)
     f28:	4bbc                	lw	a5,80(a5)
     f2a:	02f74263          	blt	a4,a5,f4e <schedule_edf+0x84>
     f2e:	fd043783          	ld	a5,-48(s0)
     f32:	4bb8                	lw	a4,80(a5)
     f34:	fe043783          	ld	a5,-32(s0)
     f38:	4bbc                	lw	a5,80(a5)
     f3a:	00f71e63          	bne	a4,a5,f56 <schedule_edf+0x8c>
     f3e:	fd043783          	ld	a5,-48(s0)
     f42:	5398                	lw	a4,32(a5)
     f44:	fe043783          	ld	a5,-32(s0)
     f48:	539c                	lw	a5,32(a5)
     f4a:	00f75663          	bge	a4,a5,f56 <schedule_edf+0x8c>
            tws_deadline = th;
     f4e:	fd043783          	ld	a5,-48(s0)
     f52:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
     f56:	fd043783          	ld	a5,-48(s0)
     f5a:	779c                	ld	a5,40(a5)
     f5c:	f6f43823          	sd	a5,-144(s0)
     f60:	f7043783          	ld	a5,-144(s0)
     f64:	fd878793          	addi	a5,a5,-40
     f68:	fcf43823          	sd	a5,-48(s0)
     f6c:	fd043783          	ld	a5,-48(s0)
     f70:	02878713          	addi	a4,a5,40
     f74:	649c                	ld	a5,8(s1)
     f76:	f8f712e3          	bne	a4,a5,efa <schedule_edf+0x30>
        }
    }
    
    struct threads_sched_result r;
    if (tws_deadline != NULL) {
     f7a:	fe043783          	ld	a5,-32(s0)
     f7e:	18078063          	beqz	a5,10fe <schedule_edf+0x234>
        if(!is_miss){
     f82:	fec42783          	lw	a5,-20(s0)
     f86:	2781                	sext.w	a5,a5
     f88:	e3ed                	bnez	a5,106a <schedule_edf+0x1a0>
            r.scheduled_thread_list_member = &tws_deadline->thread_list;
     f8a:	fe043783          	ld	a5,-32(s0)
     f8e:	02878793          	addi	a5,a5,40
     f92:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
     f96:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
     f9a:	689c                	ld	a5,16(s1)
     f9c:	639c                	ld	a5,0(a5)
     f9e:	f8f43023          	sd	a5,-128(s0)
     fa2:	f8043783          	ld	a5,-128(s0)
     fa6:	17e1                	addi	a5,a5,-8
     fa8:	fcf43423          	sd	a5,-56(s0)
     fac:	a88d                	j	101e <schedule_edf+0x154>
                if (rth->thrd->current_deadline + rth->thrd->period < tws_deadline->current_deadline && (find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period)) {
     fae:	fc843783          	ld	a5,-56(s0)
     fb2:	639c                	ld	a5,0(a5)
     fb4:	4bb8                	lw	a4,80(a5)
     fb6:	fc843783          	ld	a5,-56(s0)
     fba:	639c                	ld	a5,0(a5)
     fbc:	43fc                	lw	a5,68(a5)
     fbe:	9fb9                	addw	a5,a5,a4
     fc0:	0007871b          	sext.w	a4,a5
     fc4:	fe043783          	ld	a5,-32(s0)
     fc8:	4bbc                	lw	a5,80(a5)
     fca:	04f75063          	bge	a4,a5,100a <schedule_edf+0x140>
     fce:	fc043783          	ld	a5,-64(s0)
     fd2:	c79d                	beqz	a5,1000 <schedule_edf+0x136>
     fd4:	fc843783          	ld	a5,-56(s0)
     fd8:	639c                	ld	a5,0(a5)
     fda:	4bb8                	lw	a4,80(a5)
     fdc:	fc843783          	ld	a5,-56(s0)
     fe0:	639c                	ld	a5,0(a5)
     fe2:	43fc                	lw	a5,68(a5)
     fe4:	9fb9                	addw	a5,a5,a4
     fe6:	0007859b          	sext.w	a1,a5
     fea:	fc043783          	ld	a5,-64(s0)
     fee:	4bb8                	lw	a4,80(a5)
     ff0:	fc043783          	ld	a5,-64(s0)
     ff4:	43fc                	lw	a5,68(a5)
     ff6:	9fb9                	addw	a5,a5,a4
     ff8:	2781                	sext.w	a5,a5
     ffa:	872e                	mv	a4,a1
     ffc:	00f75763          	bge	a4,a5,100a <schedule_edf+0x140>
                    find = rth->thrd;
    1000:	fc843783          	ld	a5,-56(s0)
    1004:	639c                	ld	a5,0(a5)
    1006:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    100a:	fc843783          	ld	a5,-56(s0)
    100e:	679c                	ld	a5,8(a5)
    1010:	f6f43c23          	sd	a5,-136(s0)
    1014:	f7843783          	ld	a5,-136(s0)
    1018:	17e1                	addi	a5,a5,-8
    101a:	fcf43423          	sd	a5,-56(s0)
    101e:	fc843783          	ld	a5,-56(s0)
    1022:	00878713          	addi	a4,a5,8
    1026:	689c                	ld	a5,16(s1)
    1028:	f8f713e3          	bne	a4,a5,fae <schedule_edf+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_deadline->remaining_time <= find->current_deadline) r.allocated_time = tws_deadline->remaining_time;
    102c:	fc043783          	ld	a5,-64(s0)
    1030:	cf89                	beqz	a5,104a <schedule_edf+0x180>
    1032:	4098                	lw	a4,0(s1)
    1034:	fe043783          	ld	a5,-32(s0)
    1038:	47fc                	lw	a5,76(a5)
    103a:	9fb9                	addw	a5,a5,a4
    103c:	0007871b          	sext.w	a4,a5
    1040:	fc043783          	ld	a5,-64(s0)
    1044:	4bbc                	lw	a5,80(a5)
    1046:	00e7c863          	blt	a5,a4,1056 <schedule_edf+0x18c>
    104a:	fe043783          	ld	a5,-32(s0)
    104e:	47fc                	lw	a5,76(a5)
    1050:	f4f42c23          	sw	a5,-168(s0)
    1054:	aa39                	j	1172 <schedule_edf+0x2a8>
            else{
                //r.allocated_time = tws_deadline->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
    1056:	fc043783          	ld	a5,-64(s0)
    105a:	4bb8                	lw	a4,80(a5)
    105c:	409c                	lw	a5,0(s1)
    105e:	40f707bb          	subw	a5,a4,a5
    1062:	2781                	sext.w	a5,a5
    1064:	f4f42c23          	sw	a5,-168(s0)
    1068:	a229                	j	1172 <schedule_edf+0x2a8>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
    106a:	649c                	ld	a5,8(s1)
    106c:	639c                	ld	a5,0(a5)
    106e:	f8f43823          	sd	a5,-112(s0)
    1072:	f9043783          	ld	a5,-112(s0)
    1076:	fd878793          	addi	a5,a5,-40
    107a:	fcf43823          	sd	a5,-48(s0)
    107e:	a089                	j	10c0 <schedule_edf+0x1f6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
    1080:	fd843783          	ld	a5,-40(s0)
    1084:	cf99                	beqz	a5,10a2 <schedule_edf+0x1d8>
    1086:	4098                	lw	a4,0(s1)
    1088:	fd043783          	ld	a5,-48(s0)
    108c:	4bbc                	lw	a5,80(a5)
    108e:	00f74e63          	blt	a4,a5,10aa <schedule_edf+0x1e0>
    1092:	fd043783          	ld	a5,-48(s0)
    1096:	5398                	lw	a4,32(a5)
    1098:	fd843783          	ld	a5,-40(s0)
    109c:	539c                	lw	a5,32(a5)
    109e:	00f75663          	bge	a4,a5,10aa <schedule_edf+0x1e0>
                    tws_id = th;
    10a2:	fd043783          	ld	a5,-48(s0)
    10a6:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    10aa:	fd043783          	ld	a5,-48(s0)
    10ae:	779c                	ld	a5,40(a5)
    10b0:	f8f43423          	sd	a5,-120(s0)
    10b4:	f8843783          	ld	a5,-120(s0)
    10b8:	fd878793          	addi	a5,a5,-40
    10bc:	fcf43823          	sd	a5,-48(s0)
    10c0:	fd043783          	ld	a5,-48(s0)
    10c4:	02878713          	addi	a4,a5,40
    10c8:	649c                	ld	a5,8(s1)
    10ca:	faf71be3          	bne	a4,a5,1080 <schedule_edf+0x1b6>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    10ce:	fd843783          	ld	a5,-40(s0)
    10d2:	02878793          	addi	a5,a5,40
    10d6:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    10da:	fd843783          	ld	a5,-40(s0)
    10de:	4bb8                	lw	a4,80(a5)
    10e0:	409c                	lw	a5,0(s1)
    10e2:	40f707bb          	subw	a5,a4,a5
    10e6:	2781                	sext.w	a5,a5
    10e8:	873e                	mv	a4,a5
    10ea:	0007079b          	sext.w	a5,a4
    10ee:	0007d363          	bgez	a5,10f4 <schedule_edf+0x22a>
    10f2:	4701                	li	a4,0
    10f4:	0007079b          	sext.w	a5,a4
    10f8:	f4f42c23          	sw	a5,-168(s0)
    10fc:	a89d                	j	1172 <schedule_edf+0x2a8>
        }
        
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    10fe:	649c                	ld	a5,8(s1)
    1100:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1104:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1108:	689c                	ld	a5,16(s1)
    110a:	639c                	ld	a5,0(a5)
    110c:	faf43023          	sd	a5,-96(s0)
    1110:	fa043783          	ld	a5,-96(s0)
    1114:	17e1                	addi	a5,a5,-8
    1116:	faf43c23          	sd	a5,-72(s0)
    111a:	a825                	j	1152 <schedule_edf+0x288>
            if (find == NULL || (rth->thrd->current_deadline < find->current_deadline)) {
    111c:	fb043783          	ld	a5,-80(s0)
    1120:	cb91                	beqz	a5,1134 <schedule_edf+0x26a>
    1122:	fb843783          	ld	a5,-72(s0)
    1126:	639c                	ld	a5,0(a5)
    1128:	4bb8                	lw	a4,80(a5)
    112a:	fb043783          	ld	a5,-80(s0)
    112e:	4bbc                	lw	a5,80(a5)
    1130:	00f75763          	bge	a4,a5,113e <schedule_edf+0x274>
                find = rth->thrd;
    1134:	fb843783          	ld	a5,-72(s0)
    1138:	639c                	ld	a5,0(a5)
    113a:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    113e:	fb843783          	ld	a5,-72(s0)
    1142:	679c                	ld	a5,8(a5)
    1144:	f8f43c23          	sd	a5,-104(s0)
    1148:	f9843783          	ld	a5,-104(s0)
    114c:	17e1                	addi	a5,a5,-8
    114e:	faf43c23          	sd	a5,-72(s0)
    1152:	fb843783          	ld	a5,-72(s0)
    1156:	00878713          	addi	a4,a5,8
    115a:	689c                	ld	a5,16(s1)
    115c:	fcf710e3          	bne	a4,a5,111c <schedule_edf+0x252>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    1160:	fb043783          	ld	a5,-80(s0)
    1164:	4bb8                	lw	a4,80(a5)
    1166:	409c                	lw	a5,0(s1)
    1168:	40f707bb          	subw	a5,a4,a5
    116c:	2781                	sext.w	a5,a5
    116e:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    1172:	f5043783          	ld	a5,-176(s0)
    1176:	f6f43023          	sd	a5,-160(s0)
    117a:	f5843783          	ld	a5,-168(s0)
    117e:	f6f43423          	sd	a5,-152(s0)
    1182:	f6043703          	ld	a4,-160(s0)
    1186:	f6843783          	ld	a5,-152(s0)
    118a:	863a                	mv	a2,a4
    118c:	86be                	mv	a3,a5
    118e:	8732                	mv	a4,a2
    1190:	87b6                	mv	a5,a3
}
    1192:	853a                	mv	a0,a4
    1194:	85be                	mv	a1,a5
    1196:	742a                	ld	s0,168(sp)
    1198:	748a                	ld	s1,160(sp)
    119a:	614d                	addi	sp,sp,176
    119c:	8082                	ret

000000000000119e <schedule_rm>:

/* Rate-Monotonic Scheduling */
struct threads_sched_result schedule_rm(struct threads_sched_args args)
{
    119e:	7171                	addi	sp,sp,-176
    11a0:	f522                	sd	s0,168(sp)
    11a2:	f126                	sd	s1,160(sp)
    11a4:	1900                	addi	s0,sp,176
    11a6:	84aa                	mv	s1,a0
    int is_miss = 0;
    11a8:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_period = NULL, *tws_id = NULL;
    11ac:	fe043023          	sd	zero,-32(s0)
    11b0:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
    11b4:	fc043823          	sd	zero,-48(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    11b8:	649c                	ld	a5,8(s1)
    11ba:	639c                	ld	a5,0(a5)
    11bc:	faf43423          	sd	a5,-88(s0)
    11c0:	fa843783          	ld	a5,-88(s0)
    11c4:	fd878793          	addi	a5,a5,-40
    11c8:	fcf43823          	sd	a5,-48(s0)
    11cc:	a895                	j	1240 <schedule_rm+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
    11ce:	4098                	lw	a4,0(s1)
    11d0:	fd043783          	ld	a5,-48(s0)
    11d4:	47fc                	lw	a5,76(a5)
    11d6:	9fb9                	addw	a5,a5,a4
    11d8:	0007871b          	sext.w	a4,a5
    11dc:	fd043783          	ld	a5,-48(s0)
    11e0:	4bbc                	lw	a5,80(a5)
    11e2:	00e7d563          	bge	a5,a4,11ec <schedule_rm+0x4e>
            is_miss = 1;
    11e6:	4785                	li	a5,1
    11e8:	fef42623          	sw	a5,-20(s0)
            //break;
        }
        if (tws_period == NULL || (th->period < tws_period->period) || (th->period == tws_period->period && th->ID < tws_period->ID)) {
    11ec:	fe043783          	ld	a5,-32(s0)
    11f0:	cb8d                	beqz	a5,1222 <schedule_rm+0x84>
    11f2:	fd043783          	ld	a5,-48(s0)
    11f6:	43f8                	lw	a4,68(a5)
    11f8:	fe043783          	ld	a5,-32(s0)
    11fc:	43fc                	lw	a5,68(a5)
    11fe:	02f74263          	blt	a4,a5,1222 <schedule_rm+0x84>
    1202:	fd043783          	ld	a5,-48(s0)
    1206:	43f8                	lw	a4,68(a5)
    1208:	fe043783          	ld	a5,-32(s0)
    120c:	43fc                	lw	a5,68(a5)
    120e:	00f71e63          	bne	a4,a5,122a <schedule_rm+0x8c>
    1212:	fd043783          	ld	a5,-48(s0)
    1216:	5398                	lw	a4,32(a5)
    1218:	fe043783          	ld	a5,-32(s0)
    121c:	539c                	lw	a5,32(a5)
    121e:	00f75663          	bge	a4,a5,122a <schedule_rm+0x8c>
            tws_period = th;
    1222:	fd043783          	ld	a5,-48(s0)
    1226:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    122a:	fd043783          	ld	a5,-48(s0)
    122e:	779c                	ld	a5,40(a5)
    1230:	f6f43823          	sd	a5,-144(s0)
    1234:	f7043783          	ld	a5,-144(s0)
    1238:	fd878793          	addi	a5,a5,-40
    123c:	fcf43823          	sd	a5,-48(s0)
    1240:	fd043783          	ld	a5,-48(s0)
    1244:	02878713          	addi	a4,a5,40
    1248:	649c                	ld	a5,8(s1)
    124a:	f8f712e3          	bne	a4,a5,11ce <schedule_rm+0x30>
        }
    }

    struct threads_sched_result r; 
    if (tws_period != NULL) {
    124e:	fe043783          	ld	a5,-32(s0)
    1252:	16078063          	beqz	a5,13b2 <schedule_rm+0x214>
        if(!is_miss){
    1256:	fec42783          	lw	a5,-20(s0)
    125a:	2781                	sext.w	a5,a5
    125c:	e3e9                	bnez	a5,131e <schedule_rm+0x180>
            r.scheduled_thread_list_member = &tws_period->thread_list;
    125e:	fe043783          	ld	a5,-32(s0)
    1262:	02878793          	addi	a5,a5,40
    1266:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    126a:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    126e:	689c                	ld	a5,16(s1)
    1270:	639c                	ld	a5,0(a5)
    1272:	f8f43023          	sd	a5,-128(s0)
    1276:	f8043783          	ld	a5,-128(s0)
    127a:	17e1                	addi	a5,a5,-8
    127c:	fcf43423          	sd	a5,-56(s0)
    1280:	a889                	j	12d2 <schedule_rm+0x134>
                if(find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period) {
    1282:	fc043783          	ld	a5,-64(s0)
    1286:	c79d                	beqz	a5,12b4 <schedule_rm+0x116>
    1288:	fc843783          	ld	a5,-56(s0)
    128c:	639c                	ld	a5,0(a5)
    128e:	4bb8                	lw	a4,80(a5)
    1290:	fc843783          	ld	a5,-56(s0)
    1294:	639c                	ld	a5,0(a5)
    1296:	43fc                	lw	a5,68(a5)
    1298:	9fb9                	addw	a5,a5,a4
    129a:	0007859b          	sext.w	a1,a5
    129e:	fc043783          	ld	a5,-64(s0)
    12a2:	4bb8                	lw	a4,80(a5)
    12a4:	fc043783          	ld	a5,-64(s0)
    12a8:	43fc                	lw	a5,68(a5)
    12aa:	9fb9                	addw	a5,a5,a4
    12ac:	2781                	sext.w	a5,a5
    12ae:	872e                	mv	a4,a1
    12b0:	00f75763          	bge	a4,a5,12be <schedule_rm+0x120>
                    find = rth->thrd;
    12b4:	fc843783          	ld	a5,-56(s0)
    12b8:	639c                	ld	a5,0(a5)
    12ba:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    12be:	fc843783          	ld	a5,-56(s0)
    12c2:	679c                	ld	a5,8(a5)
    12c4:	f6f43c23          	sd	a5,-136(s0)
    12c8:	f7843783          	ld	a5,-136(s0)
    12cc:	17e1                	addi	a5,a5,-8
    12ce:	fcf43423          	sd	a5,-56(s0)
    12d2:	fc843783          	ld	a5,-56(s0)
    12d6:	00878713          	addi	a4,a5,8
    12da:	689c                	ld	a5,16(s1)
    12dc:	faf713e3          	bne	a4,a5,1282 <schedule_rm+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_period->remaining_time <= find->current_deadline) r.allocated_time = tws_period->remaining_time;
    12e0:	fc043783          	ld	a5,-64(s0)
    12e4:	cf89                	beqz	a5,12fe <schedule_rm+0x160>
    12e6:	4098                	lw	a4,0(s1)
    12e8:	fe043783          	ld	a5,-32(s0)
    12ec:	47fc                	lw	a5,76(a5)
    12ee:	9fb9                	addw	a5,a5,a4
    12f0:	0007871b          	sext.w	a4,a5
    12f4:	fc043783          	ld	a5,-64(s0)
    12f8:	4bbc                	lw	a5,80(a5)
    12fa:	00e7c863          	blt	a5,a4,130a <schedule_rm+0x16c>
    12fe:	fe043783          	ld	a5,-32(s0)
    1302:	47fc                	lw	a5,76(a5)
    1304:	f4f42c23          	sw	a5,-168(s0)
    1308:	aa39                	j	1426 <schedule_rm+0x288>
            else{
                //r.allocated_time = tws_period->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
    130a:	fc043783          	ld	a5,-64(s0)
    130e:	4bb8                	lw	a4,80(a5)
    1310:	409c                	lw	a5,0(s1)
    1312:	40f707bb          	subw	a5,a4,a5
    1316:	2781                	sext.w	a5,a5
    1318:	f4f42c23          	sw	a5,-168(s0)
    131c:	a229                	j	1426 <schedule_rm+0x288>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
    131e:	649c                	ld	a5,8(s1)
    1320:	639c                	ld	a5,0(a5)
    1322:	f8f43823          	sd	a5,-112(s0)
    1326:	f9043783          	ld	a5,-112(s0)
    132a:	fd878793          	addi	a5,a5,-40
    132e:	fcf43823          	sd	a5,-48(s0)
    1332:	a089                	j	1374 <schedule_rm+0x1d6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
    1334:	fd843783          	ld	a5,-40(s0)
    1338:	cf99                	beqz	a5,1356 <schedule_rm+0x1b8>
    133a:	4098                	lw	a4,0(s1)
    133c:	fd043783          	ld	a5,-48(s0)
    1340:	4bbc                	lw	a5,80(a5)
    1342:	00f74e63          	blt	a4,a5,135e <schedule_rm+0x1c0>
    1346:	fd043783          	ld	a5,-48(s0)
    134a:	5398                	lw	a4,32(a5)
    134c:	fd843783          	ld	a5,-40(s0)
    1350:	539c                	lw	a5,32(a5)
    1352:	00f75663          	bge	a4,a5,135e <schedule_rm+0x1c0>
                    tws_id = th;
    1356:	fd043783          	ld	a5,-48(s0)
    135a:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    135e:	fd043783          	ld	a5,-48(s0)
    1362:	779c                	ld	a5,40(a5)
    1364:	f8f43423          	sd	a5,-120(s0)
    1368:	f8843783          	ld	a5,-120(s0)
    136c:	fd878793          	addi	a5,a5,-40
    1370:	fcf43823          	sd	a5,-48(s0)
    1374:	fd043783          	ld	a5,-48(s0)
    1378:	02878713          	addi	a4,a5,40
    137c:	649c                	ld	a5,8(s1)
    137e:	faf71be3          	bne	a4,a5,1334 <schedule_rm+0x196>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    1382:	fd843783          	ld	a5,-40(s0)
    1386:	02878793          	addi	a5,a5,40
    138a:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    138e:	fd843783          	ld	a5,-40(s0)
    1392:	4bb8                	lw	a4,80(a5)
    1394:	409c                	lw	a5,0(s1)
    1396:	40f707bb          	subw	a5,a4,a5
    139a:	2781                	sext.w	a5,a5
    139c:	873e                	mv	a4,a5
    139e:	0007079b          	sext.w	a5,a4
    13a2:	0007d363          	bgez	a5,13a8 <schedule_rm+0x20a>
    13a6:	4701                	li	a4,0
    13a8:	0007079b          	sext.w	a5,a4
    13ac:	f4f42c23          	sw	a5,-168(s0)
    13b0:	a89d                	j	1426 <schedule_rm+0x288>
        }
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    13b2:	649c                	ld	a5,8(s1)
    13b4:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    13b8:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    13bc:	689c                	ld	a5,16(s1)
    13be:	639c                	ld	a5,0(a5)
    13c0:	faf43023          	sd	a5,-96(s0)
    13c4:	fa043783          	ld	a5,-96(s0)
    13c8:	17e1                	addi	a5,a5,-8
    13ca:	faf43c23          	sd	a5,-72(s0)
    13ce:	a825                	j	1406 <schedule_rm+0x268>
            if (find == NULL || (rth->thrd->period < find->period)) {
    13d0:	fb043783          	ld	a5,-80(s0)
    13d4:	cb91                	beqz	a5,13e8 <schedule_rm+0x24a>
    13d6:	fb843783          	ld	a5,-72(s0)
    13da:	639c                	ld	a5,0(a5)
    13dc:	43f8                	lw	a4,68(a5)
    13de:	fb043783          	ld	a5,-80(s0)
    13e2:	43fc                	lw	a5,68(a5)
    13e4:	00f75763          	bge	a4,a5,13f2 <schedule_rm+0x254>
                find = rth->thrd;
    13e8:	fb843783          	ld	a5,-72(s0)
    13ec:	639c                	ld	a5,0(a5)
    13ee:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    13f2:	fb843783          	ld	a5,-72(s0)
    13f6:	679c                	ld	a5,8(a5)
    13f8:	f8f43c23          	sd	a5,-104(s0)
    13fc:	f9843783          	ld	a5,-104(s0)
    1400:	17e1                	addi	a5,a5,-8
    1402:	faf43c23          	sd	a5,-72(s0)
    1406:	fb843783          	ld	a5,-72(s0)
    140a:	00878713          	addi	a4,a5,8
    140e:	689c                	ld	a5,16(s1)
    1410:	fcf710e3          	bne	a4,a5,13d0 <schedule_rm+0x232>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    1414:	fb043783          	ld	a5,-80(s0)
    1418:	4bb8                	lw	a4,80(a5)
    141a:	409c                	lw	a5,0(s1)
    141c:	40f707bb          	subw	a5,a4,a5
    1420:	2781                	sext.w	a5,a5
    1422:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    1426:	f5043783          	ld	a5,-176(s0)
    142a:	f6f43023          	sd	a5,-160(s0)
    142e:	f5843783          	ld	a5,-168(s0)
    1432:	f6f43423          	sd	a5,-152(s0)
    1436:	f6043703          	ld	a4,-160(s0)
    143a:	f6843783          	ld	a5,-152(s0)
    143e:	863a                	mv	a2,a4
    1440:	86be                	mv	a3,a5
    1442:	8732                	mv	a4,a2
    1444:	87b6                	mv	a5,a3
}
    1446:	853a                	mv	a0,a4
    1448:	85be                	mv	a1,a5
    144a:	742a                	ld	s0,168(sp)
    144c:	748a                	ld	s1,160(sp)
    144e:	614d                	addi	sp,sp,176
    1450:	8082                	ret
