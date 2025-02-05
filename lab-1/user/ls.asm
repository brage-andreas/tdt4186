
user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	fca43423          	sd	a0,-56(s0)
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       e:	fc843503          	ld	a0,-56(s0)
      12:	00000097          	auipc	ra,0x0
      16:	456080e7          	jalr	1110(ra) # 468 <strlen>
      1a:	87aa                	mv	a5,a0
      1c:	2781                	sext.w	a5,a5
      1e:	1782                	slli	a5,a5,0x20
      20:	9381                	srli	a5,a5,0x20
      22:	fc843703          	ld	a4,-56(s0)
      26:	97ba                	add	a5,a5,a4
      28:	fcf43c23          	sd	a5,-40(s0)
      2c:	a031                	j	38 <fmtname+0x38>
      2e:	fd843783          	ld	a5,-40(s0)
      32:	17fd                	addi	a5,a5,-1
      34:	fcf43c23          	sd	a5,-40(s0)
      38:	fd843703          	ld	a4,-40(s0)
      3c:	fc843783          	ld	a5,-56(s0)
      40:	00f76b63          	bltu	a4,a5,56 <fmtname+0x56>
      44:	fd843783          	ld	a5,-40(s0)
      48:	0007c783          	lbu	a5,0(a5)
      4c:	873e                	mv	a4,a5
      4e:	02f00793          	li	a5,47
      52:	fcf71ee3          	bne	a4,a5,2e <fmtname+0x2e>
    ;
  p++;
      56:	fd843783          	ld	a5,-40(s0)
      5a:	0785                	addi	a5,a5,1
      5c:	fcf43c23          	sd	a5,-40(s0)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      60:	fd843503          	ld	a0,-40(s0)
      64:	00000097          	auipc	ra,0x0
      68:	404080e7          	jalr	1028(ra) # 468 <strlen>
      6c:	87aa                	mv	a5,a0
      6e:	2781                	sext.w	a5,a5
      70:	873e                	mv	a4,a5
      72:	47b5                	li	a5,13
      74:	00e7f563          	bgeu	a5,a4,7e <fmtname+0x7e>
    return p;
      78:	fd843783          	ld	a5,-40(s0)
      7c:	a8b5                	j	f8 <fmtname+0xf8>
  memmove(buf, p, strlen(p));
      7e:	fd843503          	ld	a0,-40(s0)
      82:	00000097          	auipc	ra,0x0
      86:	3e6080e7          	jalr	998(ra) # 468 <strlen>
      8a:	87aa                	mv	a5,a0
      8c:	2781                	sext.w	a5,a5
      8e:	2781                	sext.w	a5,a5
      90:	863e                	mv	a2,a5
      92:	fd843583          	ld	a1,-40(s0)
      96:	00002517          	auipc	a0,0x2
      9a:	f8a50513          	addi	a0,a0,-118 # 2020 <buf.0>
      9e:	00000097          	auipc	ra,0x0
      a2:	626080e7          	jalr	1574(ra) # 6c4 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a6:	fd843503          	ld	a0,-40(s0)
      aa:	00000097          	auipc	ra,0x0
      ae:	3be080e7          	jalr	958(ra) # 468 <strlen>
      b2:	87aa                	mv	a5,a0
      b4:	2781                	sext.w	a5,a5
      b6:	02079713          	slli	a4,a5,0x20
      ba:	9301                	srli	a4,a4,0x20
      bc:	00002797          	auipc	a5,0x2
      c0:	f6478793          	addi	a5,a5,-156 # 2020 <buf.0>
      c4:	00f704b3          	add	s1,a4,a5
      c8:	fd843503          	ld	a0,-40(s0)
      cc:	00000097          	auipc	ra,0x0
      d0:	39c080e7          	jalr	924(ra) # 468 <strlen>
      d4:	87aa                	mv	a5,a0
      d6:	2781                	sext.w	a5,a5
      d8:	4739                	li	a4,14
      da:	40f707bb          	subw	a5,a4,a5
      de:	2781                	sext.w	a5,a5
      e0:	863e                	mv	a2,a5
      e2:	02000593          	li	a1,32
      e6:	8526                	mv	a0,s1
      e8:	00000097          	auipc	ra,0x0
      ec:	3b6080e7          	jalr	950(ra) # 49e <memset>
  return buf;
      f0:	00002797          	auipc	a5,0x2
      f4:	f3078793          	addi	a5,a5,-208 # 2020 <buf.0>
}
      f8:	853e                	mv	a0,a5
      fa:	70e2                	ld	ra,56(sp)
      fc:	7442                	ld	s0,48(sp)
      fe:	74a2                	ld	s1,40(sp)
     100:	6121                	addi	sp,sp,64
     102:	8082                	ret

0000000000000104 <ls>:

void
ls(char *path)
{
     104:	da010113          	addi	sp,sp,-608
     108:	24113c23          	sd	ra,600(sp)
     10c:	24813823          	sd	s0,592(sp)
     110:	1480                	addi	s0,sp,608
     112:	daa43423          	sd	a0,-600(s0)
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     116:	4581                	li	a1,0
     118:	da843503          	ld	a0,-600(s0)
     11c:	00000097          	auipc	ra,0x0
     120:	76e080e7          	jalr	1902(ra) # 88a <open>
     124:	87aa                	mv	a5,a0
     126:	fef42623          	sw	a5,-20(s0)
     12a:	fec42783          	lw	a5,-20(s0)
     12e:	2781                	sext.w	a5,a5
     130:	0007de63          	bgez	a5,14c <ls+0x48>
    fprintf(2, "ls: cannot open %s\n", path);
     134:	da843603          	ld	a2,-600(s0)
     138:	00001597          	auipc	a1,0x1
     13c:	f6858593          	addi	a1,a1,-152 # 10a0 <malloc+0x13c>
     140:	4509                	li	a0,2
     142:	00001097          	auipc	ra,0x1
     146:	bd8080e7          	jalr	-1064(ra) # d1a <fprintf>
    return;
     14a:	a2d9                	j	310 <ls+0x20c>
  }

  if(fstat(fd, &st) < 0){
     14c:	db840713          	addi	a4,s0,-584
     150:	fec42783          	lw	a5,-20(s0)
     154:	85ba                	mv	a1,a4
     156:	853e                	mv	a0,a5
     158:	00000097          	auipc	ra,0x0
     15c:	74a080e7          	jalr	1866(ra) # 8a2 <fstat>
     160:	87aa                	mv	a5,a0
     162:	0207d563          	bgez	a5,18c <ls+0x88>
    fprintf(2, "ls: cannot stat %s\n", path);
     166:	da843603          	ld	a2,-600(s0)
     16a:	00001597          	auipc	a1,0x1
     16e:	f4e58593          	addi	a1,a1,-178 # 10b8 <malloc+0x154>
     172:	4509                	li	a0,2
     174:	00001097          	auipc	ra,0x1
     178:	ba6080e7          	jalr	-1114(ra) # d1a <fprintf>
    close(fd);
     17c:	fec42783          	lw	a5,-20(s0)
     180:	853e                	mv	a0,a5
     182:	00000097          	auipc	ra,0x0
     186:	6f0080e7          	jalr	1776(ra) # 872 <close>
    return;
     18a:	a259                	j	310 <ls+0x20c>
  }

  switch(st.type){
     18c:	dc041783          	lh	a5,-576(s0)
     190:	2781                	sext.w	a5,a5
     192:	86be                	mv	a3,a5
     194:	4705                	li	a4,1
     196:	04e68463          	beq	a3,a4,1de <ls+0xda>
     19a:	873e                	mv	a4,a5
     19c:	16e05363          	blez	a4,302 <ls+0x1fe>
     1a0:	2781                	sext.w	a5,a5
     1a2:	37f9                	addiw	a5,a5,-2
     1a4:	2781                	sext.w	a5,a5
     1a6:	873e                	mv	a4,a5
     1a8:	4785                	li	a5,1
     1aa:	14e7ec63          	bltu	a5,a4,302 <ls+0x1fe>
  case T_DEVICE:
  case T_FILE:
    printf("%s %d %d %l\n", fmtname(path), st.type, st.ino, st.size);
     1ae:	da843503          	ld	a0,-600(s0)
     1b2:	00000097          	auipc	ra,0x0
     1b6:	e4e080e7          	jalr	-434(ra) # 0 <fmtname>
     1ba:	85aa                	mv	a1,a0
     1bc:	dc041783          	lh	a5,-576(s0)
     1c0:	2781                	sext.w	a5,a5
     1c2:	dbc42683          	lw	a3,-580(s0)
     1c6:	dc843703          	ld	a4,-568(s0)
     1ca:	863e                	mv	a2,a5
     1cc:	00001517          	auipc	a0,0x1
     1d0:	f0450513          	addi	a0,a0,-252 # 10d0 <malloc+0x16c>
     1d4:	00001097          	auipc	ra,0x1
     1d8:	b9e080e7          	jalr	-1122(ra) # d72 <printf>
    break;
     1dc:	a21d                	j	302 <ls+0x1fe>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1de:	da843503          	ld	a0,-600(s0)
     1e2:	00000097          	auipc	ra,0x0
     1e6:	286080e7          	jalr	646(ra) # 468 <strlen>
     1ea:	87aa                	mv	a5,a0
     1ec:	2781                	sext.w	a5,a5
     1ee:	27c1                	addiw	a5,a5,16
     1f0:	2781                	sext.w	a5,a5
     1f2:	873e                	mv	a4,a5
     1f4:	20000793          	li	a5,512
     1f8:	00e7fb63          	bgeu	a5,a4,20e <ls+0x10a>
      printf("ls: path too long\n");
     1fc:	00001517          	auipc	a0,0x1
     200:	ee450513          	addi	a0,a0,-284 # 10e0 <malloc+0x17c>
     204:	00001097          	auipc	ra,0x1
     208:	b6e080e7          	jalr	-1170(ra) # d72 <printf>
      break;
     20c:	a8dd                	j	302 <ls+0x1fe>
    }
    strcpy(buf, path);
     20e:	de040793          	addi	a5,s0,-544
     212:	da843583          	ld	a1,-600(s0)
     216:	853e                	mv	a0,a5
     218:	00000097          	auipc	ra,0x0
     21c:	1a0080e7          	jalr	416(ra) # 3b8 <strcpy>
    p = buf+strlen(buf);
     220:	de040793          	addi	a5,s0,-544
     224:	853e                	mv	a0,a5
     226:	00000097          	auipc	ra,0x0
     22a:	242080e7          	jalr	578(ra) # 468 <strlen>
     22e:	87aa                	mv	a5,a0
     230:	2781                	sext.w	a5,a5
     232:	1782                	slli	a5,a5,0x20
     234:	9381                	srli	a5,a5,0x20
     236:	de040713          	addi	a4,s0,-544
     23a:	97ba                	add	a5,a5,a4
     23c:	fef43023          	sd	a5,-32(s0)
    *p++ = '/';
     240:	fe043783          	ld	a5,-32(s0)
     244:	00178713          	addi	a4,a5,1
     248:	fee43023          	sd	a4,-32(s0)
     24c:	02f00713          	li	a4,47
     250:	00e78023          	sb	a4,0(a5)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     254:	a071                	j	2e0 <ls+0x1dc>
      if(de.inum == 0)
     256:	dd045783          	lhu	a5,-560(s0)
     25a:	e391                	bnez	a5,25e <ls+0x15a>
        continue;
     25c:	a051                	j	2e0 <ls+0x1dc>
      memmove(p, de.name, DIRSIZ);
     25e:	dd040793          	addi	a5,s0,-560
     262:	0789                	addi	a5,a5,2
     264:	4639                	li	a2,14
     266:	85be                	mv	a1,a5
     268:	fe043503          	ld	a0,-32(s0)
     26c:	00000097          	auipc	ra,0x0
     270:	458080e7          	jalr	1112(ra) # 6c4 <memmove>
      p[DIRSIZ] = 0;
     274:	fe043783          	ld	a5,-32(s0)
     278:	07b9                	addi	a5,a5,14
     27a:	00078023          	sb	zero,0(a5)
      if(stat(buf, &st) < 0){
     27e:	db840713          	addi	a4,s0,-584
     282:	de040793          	addi	a5,s0,-544
     286:	85ba                	mv	a1,a4
     288:	853e                	mv	a0,a5
     28a:	00000097          	auipc	ra,0x0
     28e:	360080e7          	jalr	864(ra) # 5ea <stat>
     292:	87aa                	mv	a5,a0
     294:	0007de63          	bgez	a5,2b0 <ls+0x1ac>
        printf("ls: cannot stat %s\n", buf);
     298:	de040793          	addi	a5,s0,-544
     29c:	85be                	mv	a1,a5
     29e:	00001517          	auipc	a0,0x1
     2a2:	e1a50513          	addi	a0,a0,-486 # 10b8 <malloc+0x154>
     2a6:	00001097          	auipc	ra,0x1
     2aa:	acc080e7          	jalr	-1332(ra) # d72 <printf>
        continue;
     2ae:	a80d                	j	2e0 <ls+0x1dc>
      }
      printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2b0:	de040793          	addi	a5,s0,-544
     2b4:	853e                	mv	a0,a5
     2b6:	00000097          	auipc	ra,0x0
     2ba:	d4a080e7          	jalr	-694(ra) # 0 <fmtname>
     2be:	85aa                	mv	a1,a0
     2c0:	dc041783          	lh	a5,-576(s0)
     2c4:	2781                	sext.w	a5,a5
     2c6:	dbc42683          	lw	a3,-580(s0)
     2ca:	dc843703          	ld	a4,-568(s0)
     2ce:	863e                	mv	a2,a5
     2d0:	00001517          	auipc	a0,0x1
     2d4:	e2850513          	addi	a0,a0,-472 # 10f8 <malloc+0x194>
     2d8:	00001097          	auipc	ra,0x1
     2dc:	a9a080e7          	jalr	-1382(ra) # d72 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2e0:	dd040713          	addi	a4,s0,-560
     2e4:	fec42783          	lw	a5,-20(s0)
     2e8:	4641                	li	a2,16
     2ea:	85ba                	mv	a1,a4
     2ec:	853e                	mv	a0,a5
     2ee:	00000097          	auipc	ra,0x0
     2f2:	574080e7          	jalr	1396(ra) # 862 <read>
     2f6:	87aa                	mv	a5,a0
     2f8:	873e                	mv	a4,a5
     2fa:	47c1                	li	a5,16
     2fc:	f4f70de3          	beq	a4,a5,256 <ls+0x152>
    }
    break;
     300:	0001                	nop
  }
  close(fd);
     302:	fec42783          	lw	a5,-20(s0)
     306:	853e                	mv	a0,a5
     308:	00000097          	auipc	ra,0x0
     30c:	56a080e7          	jalr	1386(ra) # 872 <close>
}
     310:	25813083          	ld	ra,600(sp)
     314:	25013403          	ld	s0,592(sp)
     318:	26010113          	addi	sp,sp,608
     31c:	8082                	ret

000000000000031e <main>:

int
main(int argc, char *argv[])
{
     31e:	7179                	addi	sp,sp,-48
     320:	f406                	sd	ra,40(sp)
     322:	f022                	sd	s0,32(sp)
     324:	1800                	addi	s0,sp,48
     326:	87aa                	mv	a5,a0
     328:	fcb43823          	sd	a1,-48(s0)
     32c:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
     330:	fdc42783          	lw	a5,-36(s0)
     334:	0007871b          	sext.w	a4,a5
     338:	4785                	li	a5,1
     33a:	00e7cf63          	blt	a5,a4,358 <main+0x3a>
    ls(".");
     33e:	00001517          	auipc	a0,0x1
     342:	dca50513          	addi	a0,a0,-566 # 1108 <malloc+0x1a4>
     346:	00000097          	auipc	ra,0x0
     34a:	dbe080e7          	jalr	-578(ra) # 104 <ls>
    exit(0);
     34e:	4501                	li	a0,0
     350:	00000097          	auipc	ra,0x0
     354:	4fa080e7          	jalr	1274(ra) # 84a <exit>
  }
  for(i=1; i<argc; i++)
     358:	4785                	li	a5,1
     35a:	fef42623          	sw	a5,-20(s0)
     35e:	a015                	j	382 <main+0x64>
    ls(argv[i]);
     360:	fec42783          	lw	a5,-20(s0)
     364:	078e                	slli	a5,a5,0x3
     366:	fd043703          	ld	a4,-48(s0)
     36a:	97ba                	add	a5,a5,a4
     36c:	639c                	ld	a5,0(a5)
     36e:	853e                	mv	a0,a5
     370:	00000097          	auipc	ra,0x0
     374:	d94080e7          	jalr	-620(ra) # 104 <ls>
  for(i=1; i<argc; i++)
     378:	fec42783          	lw	a5,-20(s0)
     37c:	2785                	addiw	a5,a5,1
     37e:	fef42623          	sw	a5,-20(s0)
     382:	fec42783          	lw	a5,-20(s0)
     386:	873e                	mv	a4,a5
     388:	fdc42783          	lw	a5,-36(s0)
     38c:	2701                	sext.w	a4,a4
     38e:	2781                	sext.w	a5,a5
     390:	fcf748e3          	blt	a4,a5,360 <main+0x42>
  exit(0);
     394:	4501                	li	a0,0
     396:	00000097          	auipc	ra,0x0
     39a:	4b4080e7          	jalr	1204(ra) # 84a <exit>

000000000000039e <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
     39e:	1141                	addi	sp,sp,-16
     3a0:	e406                	sd	ra,8(sp)
     3a2:	e022                	sd	s0,0(sp)
     3a4:	0800                	addi	s0,sp,16
  extern int main();
  main();
     3a6:	00000097          	auipc	ra,0x0
     3aa:	f78080e7          	jalr	-136(ra) # 31e <main>
  exit(0);
     3ae:	4501                	li	a0,0
     3b0:	00000097          	auipc	ra,0x0
     3b4:	49a080e7          	jalr	1178(ra) # 84a <exit>

00000000000003b8 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     3b8:	7179                	addi	sp,sp,-48
     3ba:	f422                	sd	s0,40(sp)
     3bc:	1800                	addi	s0,sp,48
     3be:	fca43c23          	sd	a0,-40(s0)
     3c2:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     3c6:	fd843783          	ld	a5,-40(s0)
     3ca:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     3ce:	0001                	nop
     3d0:	fd043703          	ld	a4,-48(s0)
     3d4:	00170793          	addi	a5,a4,1
     3d8:	fcf43823          	sd	a5,-48(s0)
     3dc:	fd843783          	ld	a5,-40(s0)
     3e0:	00178693          	addi	a3,a5,1
     3e4:	fcd43c23          	sd	a3,-40(s0)
     3e8:	00074703          	lbu	a4,0(a4)
     3ec:	00e78023          	sb	a4,0(a5)
     3f0:	0007c783          	lbu	a5,0(a5)
     3f4:	fff1                	bnez	a5,3d0 <strcpy+0x18>
    ;
  return os;
     3f6:	fe843783          	ld	a5,-24(s0)
}
     3fa:	853e                	mv	a0,a5
     3fc:	7422                	ld	s0,40(sp)
     3fe:	6145                	addi	sp,sp,48
     400:	8082                	ret

0000000000000402 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     402:	1101                	addi	sp,sp,-32
     404:	ec22                	sd	s0,24(sp)
     406:	1000                	addi	s0,sp,32
     408:	fea43423          	sd	a0,-24(s0)
     40c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     410:	a819                	j	426 <strcmp+0x24>
    p++, q++;
     412:	fe843783          	ld	a5,-24(s0)
     416:	0785                	addi	a5,a5,1
     418:	fef43423          	sd	a5,-24(s0)
     41c:	fe043783          	ld	a5,-32(s0)
     420:	0785                	addi	a5,a5,1
     422:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     426:	fe843783          	ld	a5,-24(s0)
     42a:	0007c783          	lbu	a5,0(a5)
     42e:	cb99                	beqz	a5,444 <strcmp+0x42>
     430:	fe843783          	ld	a5,-24(s0)
     434:	0007c703          	lbu	a4,0(a5)
     438:	fe043783          	ld	a5,-32(s0)
     43c:	0007c783          	lbu	a5,0(a5)
     440:	fcf709e3          	beq	a4,a5,412 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     444:	fe843783          	ld	a5,-24(s0)
     448:	0007c783          	lbu	a5,0(a5)
     44c:	0007871b          	sext.w	a4,a5
     450:	fe043783          	ld	a5,-32(s0)
     454:	0007c783          	lbu	a5,0(a5)
     458:	2781                	sext.w	a5,a5
     45a:	40f707bb          	subw	a5,a4,a5
     45e:	2781                	sext.w	a5,a5
}
     460:	853e                	mv	a0,a5
     462:	6462                	ld	s0,24(sp)
     464:	6105                	addi	sp,sp,32
     466:	8082                	ret

0000000000000468 <strlen>:

uint
strlen(const char *s)
{
     468:	7179                	addi	sp,sp,-48
     46a:	f422                	sd	s0,40(sp)
     46c:	1800                	addi	s0,sp,48
     46e:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     472:	fe042623          	sw	zero,-20(s0)
     476:	a031                	j	482 <strlen+0x1a>
     478:	fec42783          	lw	a5,-20(s0)
     47c:	2785                	addiw	a5,a5,1
     47e:	fef42623          	sw	a5,-20(s0)
     482:	fec42783          	lw	a5,-20(s0)
     486:	fd843703          	ld	a4,-40(s0)
     48a:	97ba                	add	a5,a5,a4
     48c:	0007c783          	lbu	a5,0(a5)
     490:	f7e5                	bnez	a5,478 <strlen+0x10>
    ;
  return n;
     492:	fec42783          	lw	a5,-20(s0)
}
     496:	853e                	mv	a0,a5
     498:	7422                	ld	s0,40(sp)
     49a:	6145                	addi	sp,sp,48
     49c:	8082                	ret

000000000000049e <memset>:

void*
memset(void *dst, int c, uint n)
{
     49e:	7179                	addi	sp,sp,-48
     4a0:	f422                	sd	s0,40(sp)
     4a2:	1800                	addi	s0,sp,48
     4a4:	fca43c23          	sd	a0,-40(s0)
     4a8:	87ae                	mv	a5,a1
     4aa:	8732                	mv	a4,a2
     4ac:	fcf42a23          	sw	a5,-44(s0)
     4b0:	87ba                	mv	a5,a4
     4b2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     4b6:	fd843783          	ld	a5,-40(s0)
     4ba:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     4be:	fe042623          	sw	zero,-20(s0)
     4c2:	a00d                	j	4e4 <memset+0x46>
    cdst[i] = c;
     4c4:	fec42783          	lw	a5,-20(s0)
     4c8:	fe043703          	ld	a4,-32(s0)
     4cc:	97ba                	add	a5,a5,a4
     4ce:	fd442703          	lw	a4,-44(s0)
     4d2:	0ff77713          	zext.b	a4,a4
     4d6:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     4da:	fec42783          	lw	a5,-20(s0)
     4de:	2785                	addiw	a5,a5,1
     4e0:	fef42623          	sw	a5,-20(s0)
     4e4:	fec42703          	lw	a4,-20(s0)
     4e8:	fd042783          	lw	a5,-48(s0)
     4ec:	2781                	sext.w	a5,a5
     4ee:	fcf76be3          	bltu	a4,a5,4c4 <memset+0x26>
  }
  return dst;
     4f2:	fd843783          	ld	a5,-40(s0)
}
     4f6:	853e                	mv	a0,a5
     4f8:	7422                	ld	s0,40(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <strchr>:

char*
strchr(const char *s, char c)
{
     4fe:	1101                	addi	sp,sp,-32
     500:	ec22                	sd	s0,24(sp)
     502:	1000                	addi	s0,sp,32
     504:	fea43423          	sd	a0,-24(s0)
     508:	87ae                	mv	a5,a1
     50a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     50e:	a01d                	j	534 <strchr+0x36>
    if(*s == c)
     510:	fe843783          	ld	a5,-24(s0)
     514:	0007c703          	lbu	a4,0(a5)
     518:	fe744783          	lbu	a5,-25(s0)
     51c:	0ff7f793          	zext.b	a5,a5
     520:	00e79563          	bne	a5,a4,52a <strchr+0x2c>
      return (char*)s;
     524:	fe843783          	ld	a5,-24(s0)
     528:	a821                	j	540 <strchr+0x42>
  for(; *s; s++)
     52a:	fe843783          	ld	a5,-24(s0)
     52e:	0785                	addi	a5,a5,1
     530:	fef43423          	sd	a5,-24(s0)
     534:	fe843783          	ld	a5,-24(s0)
     538:	0007c783          	lbu	a5,0(a5)
     53c:	fbf1                	bnez	a5,510 <strchr+0x12>
  return 0;
     53e:	4781                	li	a5,0
}
     540:	853e                	mv	a0,a5
     542:	6462                	ld	s0,24(sp)
     544:	6105                	addi	sp,sp,32
     546:	8082                	ret

0000000000000548 <gets>:

char*
gets(char *buf, int max)
{
     548:	7179                	addi	sp,sp,-48
     54a:	f406                	sd	ra,40(sp)
     54c:	f022                	sd	s0,32(sp)
     54e:	1800                	addi	s0,sp,48
     550:	fca43c23          	sd	a0,-40(s0)
     554:	87ae                	mv	a5,a1
     556:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     55a:	fe042623          	sw	zero,-20(s0)
     55e:	a8a1                	j	5b6 <gets+0x6e>
    cc = read(0, &c, 1);
     560:	fe740793          	addi	a5,s0,-25
     564:	4605                	li	a2,1
     566:	85be                	mv	a1,a5
     568:	4501                	li	a0,0
     56a:	00000097          	auipc	ra,0x0
     56e:	2f8080e7          	jalr	760(ra) # 862 <read>
     572:	87aa                	mv	a5,a0
     574:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     578:	fe842783          	lw	a5,-24(s0)
     57c:	2781                	sext.w	a5,a5
     57e:	04f05763          	blez	a5,5cc <gets+0x84>
      break;
    buf[i++] = c;
     582:	fec42783          	lw	a5,-20(s0)
     586:	0017871b          	addiw	a4,a5,1
     58a:	fee42623          	sw	a4,-20(s0)
     58e:	873e                	mv	a4,a5
     590:	fd843783          	ld	a5,-40(s0)
     594:	97ba                	add	a5,a5,a4
     596:	fe744703          	lbu	a4,-25(s0)
     59a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     59e:	fe744783          	lbu	a5,-25(s0)
     5a2:	873e                	mv	a4,a5
     5a4:	47a9                	li	a5,10
     5a6:	02f70463          	beq	a4,a5,5ce <gets+0x86>
     5aa:	fe744783          	lbu	a5,-25(s0)
     5ae:	873e                	mv	a4,a5
     5b0:	47b5                	li	a5,13
     5b2:	00f70e63          	beq	a4,a5,5ce <gets+0x86>
  for(i=0; i+1 < max; ){
     5b6:	fec42783          	lw	a5,-20(s0)
     5ba:	2785                	addiw	a5,a5,1
     5bc:	0007871b          	sext.w	a4,a5
     5c0:	fd442783          	lw	a5,-44(s0)
     5c4:	2781                	sext.w	a5,a5
     5c6:	f8f74de3          	blt	a4,a5,560 <gets+0x18>
     5ca:	a011                	j	5ce <gets+0x86>
      break;
     5cc:	0001                	nop
      break;
  }
  buf[i] = '\0';
     5ce:	fec42783          	lw	a5,-20(s0)
     5d2:	fd843703          	ld	a4,-40(s0)
     5d6:	97ba                	add	a5,a5,a4
     5d8:	00078023          	sb	zero,0(a5)
  return buf;
     5dc:	fd843783          	ld	a5,-40(s0)
}
     5e0:	853e                	mv	a0,a5
     5e2:	70a2                	ld	ra,40(sp)
     5e4:	7402                	ld	s0,32(sp)
     5e6:	6145                	addi	sp,sp,48
     5e8:	8082                	ret

00000000000005ea <stat>:

int
stat(const char *n, struct stat *st)
{
     5ea:	7179                	addi	sp,sp,-48
     5ec:	f406                	sd	ra,40(sp)
     5ee:	f022                	sd	s0,32(sp)
     5f0:	1800                	addi	s0,sp,48
     5f2:	fca43c23          	sd	a0,-40(s0)
     5f6:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     5fa:	4581                	li	a1,0
     5fc:	fd843503          	ld	a0,-40(s0)
     600:	00000097          	auipc	ra,0x0
     604:	28a080e7          	jalr	650(ra) # 88a <open>
     608:	87aa                	mv	a5,a0
     60a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     60e:	fec42783          	lw	a5,-20(s0)
     612:	2781                	sext.w	a5,a5
     614:	0007d463          	bgez	a5,61c <stat+0x32>
    return -1;
     618:	57fd                	li	a5,-1
     61a:	a035                	j	646 <stat+0x5c>
  r = fstat(fd, st);
     61c:	fec42783          	lw	a5,-20(s0)
     620:	fd043583          	ld	a1,-48(s0)
     624:	853e                	mv	a0,a5
     626:	00000097          	auipc	ra,0x0
     62a:	27c080e7          	jalr	636(ra) # 8a2 <fstat>
     62e:	87aa                	mv	a5,a0
     630:	fef42423          	sw	a5,-24(s0)
  close(fd);
     634:	fec42783          	lw	a5,-20(s0)
     638:	853e                	mv	a0,a5
     63a:	00000097          	auipc	ra,0x0
     63e:	238080e7          	jalr	568(ra) # 872 <close>
  return r;
     642:	fe842783          	lw	a5,-24(s0)
}
     646:	853e                	mv	a0,a5
     648:	70a2                	ld	ra,40(sp)
     64a:	7402                	ld	s0,32(sp)
     64c:	6145                	addi	sp,sp,48
     64e:	8082                	ret

0000000000000650 <atoi>:

int
atoi(const char *s)
{
     650:	7179                	addi	sp,sp,-48
     652:	f422                	sd	s0,40(sp)
     654:	1800                	addi	s0,sp,48
     656:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     65a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     65e:	a81d                	j	694 <atoi+0x44>
    n = n*10 + *s++ - '0';
     660:	fec42783          	lw	a5,-20(s0)
     664:	873e                	mv	a4,a5
     666:	87ba                	mv	a5,a4
     668:	0027979b          	slliw	a5,a5,0x2
     66c:	9fb9                	addw	a5,a5,a4
     66e:	0017979b          	slliw	a5,a5,0x1
     672:	0007871b          	sext.w	a4,a5
     676:	fd843783          	ld	a5,-40(s0)
     67a:	00178693          	addi	a3,a5,1
     67e:	fcd43c23          	sd	a3,-40(s0)
     682:	0007c783          	lbu	a5,0(a5)
     686:	2781                	sext.w	a5,a5
     688:	9fb9                	addw	a5,a5,a4
     68a:	2781                	sext.w	a5,a5
     68c:	fd07879b          	addiw	a5,a5,-48
     690:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     694:	fd843783          	ld	a5,-40(s0)
     698:	0007c783          	lbu	a5,0(a5)
     69c:	873e                	mv	a4,a5
     69e:	02f00793          	li	a5,47
     6a2:	00e7fb63          	bgeu	a5,a4,6b8 <atoi+0x68>
     6a6:	fd843783          	ld	a5,-40(s0)
     6aa:	0007c783          	lbu	a5,0(a5)
     6ae:	873e                	mv	a4,a5
     6b0:	03900793          	li	a5,57
     6b4:	fae7f6e3          	bgeu	a5,a4,660 <atoi+0x10>
  return n;
     6b8:	fec42783          	lw	a5,-20(s0)
}
     6bc:	853e                	mv	a0,a5
     6be:	7422                	ld	s0,40(sp)
     6c0:	6145                	addi	sp,sp,48
     6c2:	8082                	ret

00000000000006c4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     6c4:	7139                	addi	sp,sp,-64
     6c6:	fc22                	sd	s0,56(sp)
     6c8:	0080                	addi	s0,sp,64
     6ca:	fca43c23          	sd	a0,-40(s0)
     6ce:	fcb43823          	sd	a1,-48(s0)
     6d2:	87b2                	mv	a5,a2
     6d4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     6d8:	fd843783          	ld	a5,-40(s0)
     6dc:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     6e0:	fd043783          	ld	a5,-48(s0)
     6e4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     6e8:	fe043703          	ld	a4,-32(s0)
     6ec:	fe843783          	ld	a5,-24(s0)
     6f0:	02e7fc63          	bgeu	a5,a4,728 <memmove+0x64>
    while(n-- > 0)
     6f4:	a00d                	j	716 <memmove+0x52>
      *dst++ = *src++;
     6f6:	fe043703          	ld	a4,-32(s0)
     6fa:	00170793          	addi	a5,a4,1
     6fe:	fef43023          	sd	a5,-32(s0)
     702:	fe843783          	ld	a5,-24(s0)
     706:	00178693          	addi	a3,a5,1
     70a:	fed43423          	sd	a3,-24(s0)
     70e:	00074703          	lbu	a4,0(a4)
     712:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     716:	fcc42783          	lw	a5,-52(s0)
     71a:	fff7871b          	addiw	a4,a5,-1
     71e:	fce42623          	sw	a4,-52(s0)
     722:	fcf04ae3          	bgtz	a5,6f6 <memmove+0x32>
     726:	a891                	j	77a <memmove+0xb6>
  } else {
    dst += n;
     728:	fcc42783          	lw	a5,-52(s0)
     72c:	fe843703          	ld	a4,-24(s0)
     730:	97ba                	add	a5,a5,a4
     732:	fef43423          	sd	a5,-24(s0)
    src += n;
     736:	fcc42783          	lw	a5,-52(s0)
     73a:	fe043703          	ld	a4,-32(s0)
     73e:	97ba                	add	a5,a5,a4
     740:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     744:	a01d                	j	76a <memmove+0xa6>
      *--dst = *--src;
     746:	fe043783          	ld	a5,-32(s0)
     74a:	17fd                	addi	a5,a5,-1
     74c:	fef43023          	sd	a5,-32(s0)
     750:	fe843783          	ld	a5,-24(s0)
     754:	17fd                	addi	a5,a5,-1
     756:	fef43423          	sd	a5,-24(s0)
     75a:	fe043783          	ld	a5,-32(s0)
     75e:	0007c703          	lbu	a4,0(a5)
     762:	fe843783          	ld	a5,-24(s0)
     766:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     76a:	fcc42783          	lw	a5,-52(s0)
     76e:	fff7871b          	addiw	a4,a5,-1
     772:	fce42623          	sw	a4,-52(s0)
     776:	fcf048e3          	bgtz	a5,746 <memmove+0x82>
  }
  return vdst;
     77a:	fd843783          	ld	a5,-40(s0)
}
     77e:	853e                	mv	a0,a5
     780:	7462                	ld	s0,56(sp)
     782:	6121                	addi	sp,sp,64
     784:	8082                	ret

0000000000000786 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     786:	7139                	addi	sp,sp,-64
     788:	fc22                	sd	s0,56(sp)
     78a:	0080                	addi	s0,sp,64
     78c:	fca43c23          	sd	a0,-40(s0)
     790:	fcb43823          	sd	a1,-48(s0)
     794:	87b2                	mv	a5,a2
     796:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     79a:	fd843783          	ld	a5,-40(s0)
     79e:	fef43423          	sd	a5,-24(s0)
     7a2:	fd043783          	ld	a5,-48(s0)
     7a6:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7aa:	a0a1                	j	7f2 <memcmp+0x6c>
    if (*p1 != *p2) {
     7ac:	fe843783          	ld	a5,-24(s0)
     7b0:	0007c703          	lbu	a4,0(a5)
     7b4:	fe043783          	ld	a5,-32(s0)
     7b8:	0007c783          	lbu	a5,0(a5)
     7bc:	02f70163          	beq	a4,a5,7de <memcmp+0x58>
      return *p1 - *p2;
     7c0:	fe843783          	ld	a5,-24(s0)
     7c4:	0007c783          	lbu	a5,0(a5)
     7c8:	0007871b          	sext.w	a4,a5
     7cc:	fe043783          	ld	a5,-32(s0)
     7d0:	0007c783          	lbu	a5,0(a5)
     7d4:	2781                	sext.w	a5,a5
     7d6:	40f707bb          	subw	a5,a4,a5
     7da:	2781                	sext.w	a5,a5
     7dc:	a01d                	j	802 <memcmp+0x7c>
    }
    p1++;
     7de:	fe843783          	ld	a5,-24(s0)
     7e2:	0785                	addi	a5,a5,1
     7e4:	fef43423          	sd	a5,-24(s0)
    p2++;
     7e8:	fe043783          	ld	a5,-32(s0)
     7ec:	0785                	addi	a5,a5,1
     7ee:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7f2:	fcc42783          	lw	a5,-52(s0)
     7f6:	fff7871b          	addiw	a4,a5,-1
     7fa:	fce42623          	sw	a4,-52(s0)
     7fe:	f7dd                	bnez	a5,7ac <memcmp+0x26>
  }
  return 0;
     800:	4781                	li	a5,0
}
     802:	853e                	mv	a0,a5
     804:	7462                	ld	s0,56(sp)
     806:	6121                	addi	sp,sp,64
     808:	8082                	ret

000000000000080a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     80a:	7179                	addi	sp,sp,-48
     80c:	f406                	sd	ra,40(sp)
     80e:	f022                	sd	s0,32(sp)
     810:	1800                	addi	s0,sp,48
     812:	fea43423          	sd	a0,-24(s0)
     816:	feb43023          	sd	a1,-32(s0)
     81a:	87b2                	mv	a5,a2
     81c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     820:	fdc42783          	lw	a5,-36(s0)
     824:	863e                	mv	a2,a5
     826:	fe043583          	ld	a1,-32(s0)
     82a:	fe843503          	ld	a0,-24(s0)
     82e:	00000097          	auipc	ra,0x0
     832:	e96080e7          	jalr	-362(ra) # 6c4 <memmove>
     836:	87aa                	mv	a5,a0
}
     838:	853e                	mv	a0,a5
     83a:	70a2                	ld	ra,40(sp)
     83c:	7402                	ld	s0,32(sp)
     83e:	6145                	addi	sp,sp,48
     840:	8082                	ret

0000000000000842 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     842:	4885                	li	a7,1
 ecall
     844:	00000073          	ecall
 ret
     848:	8082                	ret

000000000000084a <exit>:
.global exit
exit:
 li a7, SYS_exit
     84a:	4889                	li	a7,2
 ecall
     84c:	00000073          	ecall
 ret
     850:	8082                	ret

0000000000000852 <wait>:
.global wait
wait:
 li a7, SYS_wait
     852:	488d                	li	a7,3
 ecall
     854:	00000073          	ecall
 ret
     858:	8082                	ret

000000000000085a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     85a:	4891                	li	a7,4
 ecall
     85c:	00000073          	ecall
 ret
     860:	8082                	ret

0000000000000862 <read>:
.global read
read:
 li a7, SYS_read
     862:	4895                	li	a7,5
 ecall
     864:	00000073          	ecall
 ret
     868:	8082                	ret

000000000000086a <write>:
.global write
write:
 li a7, SYS_write
     86a:	48c1                	li	a7,16
 ecall
     86c:	00000073          	ecall
 ret
     870:	8082                	ret

0000000000000872 <close>:
.global close
close:
 li a7, SYS_close
     872:	48d5                	li	a7,21
 ecall
     874:	00000073          	ecall
 ret
     878:	8082                	ret

000000000000087a <kill>:
.global kill
kill:
 li a7, SYS_kill
     87a:	4899                	li	a7,6
 ecall
     87c:	00000073          	ecall
 ret
     880:	8082                	ret

0000000000000882 <exec>:
.global exec
exec:
 li a7, SYS_exec
     882:	489d                	li	a7,7
 ecall
     884:	00000073          	ecall
 ret
     888:	8082                	ret

000000000000088a <open>:
.global open
open:
 li a7, SYS_open
     88a:	48bd                	li	a7,15
 ecall
     88c:	00000073          	ecall
 ret
     890:	8082                	ret

0000000000000892 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     892:	48c5                	li	a7,17
 ecall
     894:	00000073          	ecall
 ret
     898:	8082                	ret

000000000000089a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     89a:	48c9                	li	a7,18
 ecall
     89c:	00000073          	ecall
 ret
     8a0:	8082                	ret

00000000000008a2 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     8a2:	48a1                	li	a7,8
 ecall
     8a4:	00000073          	ecall
 ret
     8a8:	8082                	ret

00000000000008aa <link>:
.global link
link:
 li a7, SYS_link
     8aa:	48cd                	li	a7,19
 ecall
     8ac:	00000073          	ecall
 ret
     8b0:	8082                	ret

00000000000008b2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     8b2:	48d1                	li	a7,20
 ecall
     8b4:	00000073          	ecall
 ret
     8b8:	8082                	ret

00000000000008ba <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     8ba:	48a5                	li	a7,9
 ecall
     8bc:	00000073          	ecall
 ret
     8c0:	8082                	ret

00000000000008c2 <dup>:
.global dup
dup:
 li a7, SYS_dup
     8c2:	48a9                	li	a7,10
 ecall
     8c4:	00000073          	ecall
 ret
     8c8:	8082                	ret

00000000000008ca <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     8ca:	48ad                	li	a7,11
 ecall
     8cc:	00000073          	ecall
 ret
     8d0:	8082                	ret

00000000000008d2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     8d2:	48b1                	li	a7,12
 ecall
     8d4:	00000073          	ecall
 ret
     8d8:	8082                	ret

00000000000008da <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     8da:	48b5                	li	a7,13
 ecall
     8dc:	00000073          	ecall
 ret
     8e0:	8082                	ret

00000000000008e2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     8e2:	48b9                	li	a7,14
 ecall
     8e4:	00000073          	ecall
 ret
     8e8:	8082                	ret

00000000000008ea <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     8ea:	1101                	addi	sp,sp,-32
     8ec:	ec06                	sd	ra,24(sp)
     8ee:	e822                	sd	s0,16(sp)
     8f0:	1000                	addi	s0,sp,32
     8f2:	87aa                	mv	a5,a0
     8f4:	872e                	mv	a4,a1
     8f6:	fef42623          	sw	a5,-20(s0)
     8fa:	87ba                	mv	a5,a4
     8fc:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     900:	feb40713          	addi	a4,s0,-21
     904:	fec42783          	lw	a5,-20(s0)
     908:	4605                	li	a2,1
     90a:	85ba                	mv	a1,a4
     90c:	853e                	mv	a0,a5
     90e:	00000097          	auipc	ra,0x0
     912:	f5c080e7          	jalr	-164(ra) # 86a <write>
}
     916:	0001                	nop
     918:	60e2                	ld	ra,24(sp)
     91a:	6442                	ld	s0,16(sp)
     91c:	6105                	addi	sp,sp,32
     91e:	8082                	ret

0000000000000920 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     920:	7139                	addi	sp,sp,-64
     922:	fc06                	sd	ra,56(sp)
     924:	f822                	sd	s0,48(sp)
     926:	0080                	addi	s0,sp,64
     928:	87aa                	mv	a5,a0
     92a:	8736                	mv	a4,a3
     92c:	fcf42623          	sw	a5,-52(s0)
     930:	87ae                	mv	a5,a1
     932:	fcf42423          	sw	a5,-56(s0)
     936:	87b2                	mv	a5,a2
     938:	fcf42223          	sw	a5,-60(s0)
     93c:	87ba                	mv	a5,a4
     93e:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     942:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     946:	fc042783          	lw	a5,-64(s0)
     94a:	2781                	sext.w	a5,a5
     94c:	c38d                	beqz	a5,96e <printint+0x4e>
     94e:	fc842783          	lw	a5,-56(s0)
     952:	2781                	sext.w	a5,a5
     954:	0007dd63          	bgez	a5,96e <printint+0x4e>
    neg = 1;
     958:	4785                	li	a5,1
     95a:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     95e:	fc842783          	lw	a5,-56(s0)
     962:	40f007bb          	negw	a5,a5
     966:	2781                	sext.w	a5,a5
     968:	fef42223          	sw	a5,-28(s0)
     96c:	a029                	j	976 <printint+0x56>
  } else {
    x = xx;
     96e:	fc842783          	lw	a5,-56(s0)
     972:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     976:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     97a:	fc442783          	lw	a5,-60(s0)
     97e:	fe442703          	lw	a4,-28(s0)
     982:	02f777bb          	remuw	a5,a4,a5
     986:	0007861b          	sext.w	a2,a5
     98a:	fec42783          	lw	a5,-20(s0)
     98e:	0017871b          	addiw	a4,a5,1
     992:	fee42623          	sw	a4,-20(s0)
     996:	00001697          	auipc	a3,0x1
     99a:	66a68693          	addi	a3,a3,1642 # 2000 <digits>
     99e:	02061713          	slli	a4,a2,0x20
     9a2:	9301                	srli	a4,a4,0x20
     9a4:	9736                	add	a4,a4,a3
     9a6:	00074703          	lbu	a4,0(a4)
     9aa:	17c1                	addi	a5,a5,-16
     9ac:	97a2                	add	a5,a5,s0
     9ae:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     9b2:	fc442783          	lw	a5,-60(s0)
     9b6:	fe442703          	lw	a4,-28(s0)
     9ba:	02f757bb          	divuw	a5,a4,a5
     9be:	fef42223          	sw	a5,-28(s0)
     9c2:	fe442783          	lw	a5,-28(s0)
     9c6:	2781                	sext.w	a5,a5
     9c8:	fbcd                	bnez	a5,97a <printint+0x5a>
  if(neg)
     9ca:	fe842783          	lw	a5,-24(s0)
     9ce:	2781                	sext.w	a5,a5
     9d0:	cf85                	beqz	a5,a08 <printint+0xe8>
    buf[i++] = '-';
     9d2:	fec42783          	lw	a5,-20(s0)
     9d6:	0017871b          	addiw	a4,a5,1
     9da:	fee42623          	sw	a4,-20(s0)
     9de:	17c1                	addi	a5,a5,-16
     9e0:	97a2                	add	a5,a5,s0
     9e2:	02d00713          	li	a4,45
     9e6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     9ea:	a839                	j	a08 <printint+0xe8>
    putc(fd, buf[i]);
     9ec:	fec42783          	lw	a5,-20(s0)
     9f0:	17c1                	addi	a5,a5,-16
     9f2:	97a2                	add	a5,a5,s0
     9f4:	fe07c703          	lbu	a4,-32(a5)
     9f8:	fcc42783          	lw	a5,-52(s0)
     9fc:	85ba                	mv	a1,a4
     9fe:	853e                	mv	a0,a5
     a00:	00000097          	auipc	ra,0x0
     a04:	eea080e7          	jalr	-278(ra) # 8ea <putc>
  while(--i >= 0)
     a08:	fec42783          	lw	a5,-20(s0)
     a0c:	37fd                	addiw	a5,a5,-1
     a0e:	fef42623          	sw	a5,-20(s0)
     a12:	fec42783          	lw	a5,-20(s0)
     a16:	2781                	sext.w	a5,a5
     a18:	fc07dae3          	bgez	a5,9ec <printint+0xcc>
}
     a1c:	0001                	nop
     a1e:	0001                	nop
     a20:	70e2                	ld	ra,56(sp)
     a22:	7442                	ld	s0,48(sp)
     a24:	6121                	addi	sp,sp,64
     a26:	8082                	ret

0000000000000a28 <printptr>:

static void
printptr(int fd, uint64 x) {
     a28:	7179                	addi	sp,sp,-48
     a2a:	f406                	sd	ra,40(sp)
     a2c:	f022                	sd	s0,32(sp)
     a2e:	1800                	addi	s0,sp,48
     a30:	87aa                	mv	a5,a0
     a32:	fcb43823          	sd	a1,-48(s0)
     a36:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a3a:	fdc42783          	lw	a5,-36(s0)
     a3e:	03000593          	li	a1,48
     a42:	853e                	mv	a0,a5
     a44:	00000097          	auipc	ra,0x0
     a48:	ea6080e7          	jalr	-346(ra) # 8ea <putc>
  putc(fd, 'x');
     a4c:	fdc42783          	lw	a5,-36(s0)
     a50:	07800593          	li	a1,120
     a54:	853e                	mv	a0,a5
     a56:	00000097          	auipc	ra,0x0
     a5a:	e94080e7          	jalr	-364(ra) # 8ea <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a5e:	fe042623          	sw	zero,-20(s0)
     a62:	a82d                	j	a9c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a64:	fd043783          	ld	a5,-48(s0)
     a68:	93f1                	srli	a5,a5,0x3c
     a6a:	00001717          	auipc	a4,0x1
     a6e:	59670713          	addi	a4,a4,1430 # 2000 <digits>
     a72:	97ba                	add	a5,a5,a4
     a74:	0007c703          	lbu	a4,0(a5)
     a78:	fdc42783          	lw	a5,-36(s0)
     a7c:	85ba                	mv	a1,a4
     a7e:	853e                	mv	a0,a5
     a80:	00000097          	auipc	ra,0x0
     a84:	e6a080e7          	jalr	-406(ra) # 8ea <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a88:	fec42783          	lw	a5,-20(s0)
     a8c:	2785                	addiw	a5,a5,1
     a8e:	fef42623          	sw	a5,-20(s0)
     a92:	fd043783          	ld	a5,-48(s0)
     a96:	0792                	slli	a5,a5,0x4
     a98:	fcf43823          	sd	a5,-48(s0)
     a9c:	fec42783          	lw	a5,-20(s0)
     aa0:	873e                	mv	a4,a5
     aa2:	47bd                	li	a5,15
     aa4:	fce7f0e3          	bgeu	a5,a4,a64 <printptr+0x3c>
}
     aa8:	0001                	nop
     aaa:	0001                	nop
     aac:	70a2                	ld	ra,40(sp)
     aae:	7402                	ld	s0,32(sp)
     ab0:	6145                	addi	sp,sp,48
     ab2:	8082                	ret

0000000000000ab4 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     ab4:	715d                	addi	sp,sp,-80
     ab6:	e486                	sd	ra,72(sp)
     ab8:	e0a2                	sd	s0,64(sp)
     aba:	0880                	addi	s0,sp,80
     abc:	87aa                	mv	a5,a0
     abe:	fcb43023          	sd	a1,-64(s0)
     ac2:	fac43c23          	sd	a2,-72(s0)
     ac6:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     aca:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ace:	fe042223          	sw	zero,-28(s0)
     ad2:	a42d                	j	cfc <vprintf+0x248>
    c = fmt[i] & 0xff;
     ad4:	fe442783          	lw	a5,-28(s0)
     ad8:	fc043703          	ld	a4,-64(s0)
     adc:	97ba                	add	a5,a5,a4
     ade:	0007c783          	lbu	a5,0(a5)
     ae2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     ae6:	fe042783          	lw	a5,-32(s0)
     aea:	2781                	sext.w	a5,a5
     aec:	eb9d                	bnez	a5,b22 <vprintf+0x6e>
      if(c == '%'){
     aee:	fdc42783          	lw	a5,-36(s0)
     af2:	0007871b          	sext.w	a4,a5
     af6:	02500793          	li	a5,37
     afa:	00f71763          	bne	a4,a5,b08 <vprintf+0x54>
        state = '%';
     afe:	02500793          	li	a5,37
     b02:	fef42023          	sw	a5,-32(s0)
     b06:	a2f5                	j	cf2 <vprintf+0x23e>
      } else {
        putc(fd, c);
     b08:	fdc42783          	lw	a5,-36(s0)
     b0c:	0ff7f713          	zext.b	a4,a5
     b10:	fcc42783          	lw	a5,-52(s0)
     b14:	85ba                	mv	a1,a4
     b16:	853e                	mv	a0,a5
     b18:	00000097          	auipc	ra,0x0
     b1c:	dd2080e7          	jalr	-558(ra) # 8ea <putc>
     b20:	aac9                	j	cf2 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b22:	fe042783          	lw	a5,-32(s0)
     b26:	0007871b          	sext.w	a4,a5
     b2a:	02500793          	li	a5,37
     b2e:	1cf71263          	bne	a4,a5,cf2 <vprintf+0x23e>
      if(c == 'd'){
     b32:	fdc42783          	lw	a5,-36(s0)
     b36:	0007871b          	sext.w	a4,a5
     b3a:	06400793          	li	a5,100
     b3e:	02f71463          	bne	a4,a5,b66 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     b42:	fb843783          	ld	a5,-72(s0)
     b46:	00878713          	addi	a4,a5,8
     b4a:	fae43c23          	sd	a4,-72(s0)
     b4e:	4398                	lw	a4,0(a5)
     b50:	fcc42783          	lw	a5,-52(s0)
     b54:	4685                	li	a3,1
     b56:	4629                	li	a2,10
     b58:	85ba                	mv	a1,a4
     b5a:	853e                	mv	a0,a5
     b5c:	00000097          	auipc	ra,0x0
     b60:	dc4080e7          	jalr	-572(ra) # 920 <printint>
     b64:	a269                	j	cee <vprintf+0x23a>
      } else if(c == 'l') {
     b66:	fdc42783          	lw	a5,-36(s0)
     b6a:	0007871b          	sext.w	a4,a5
     b6e:	06c00793          	li	a5,108
     b72:	02f71663          	bne	a4,a5,b9e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b76:	fb843783          	ld	a5,-72(s0)
     b7a:	00878713          	addi	a4,a5,8
     b7e:	fae43c23          	sd	a4,-72(s0)
     b82:	639c                	ld	a5,0(a5)
     b84:	0007871b          	sext.w	a4,a5
     b88:	fcc42783          	lw	a5,-52(s0)
     b8c:	4681                	li	a3,0
     b8e:	4629                	li	a2,10
     b90:	85ba                	mv	a1,a4
     b92:	853e                	mv	a0,a5
     b94:	00000097          	auipc	ra,0x0
     b98:	d8c080e7          	jalr	-628(ra) # 920 <printint>
     b9c:	aa89                	j	cee <vprintf+0x23a>
      } else if(c == 'x') {
     b9e:	fdc42783          	lw	a5,-36(s0)
     ba2:	0007871b          	sext.w	a4,a5
     ba6:	07800793          	li	a5,120
     baa:	02f71463          	bne	a4,a5,bd2 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     bae:	fb843783          	ld	a5,-72(s0)
     bb2:	00878713          	addi	a4,a5,8
     bb6:	fae43c23          	sd	a4,-72(s0)
     bba:	4398                	lw	a4,0(a5)
     bbc:	fcc42783          	lw	a5,-52(s0)
     bc0:	4681                	li	a3,0
     bc2:	4641                	li	a2,16
     bc4:	85ba                	mv	a1,a4
     bc6:	853e                	mv	a0,a5
     bc8:	00000097          	auipc	ra,0x0
     bcc:	d58080e7          	jalr	-680(ra) # 920 <printint>
     bd0:	aa39                	j	cee <vprintf+0x23a>
      } else if(c == 'p') {
     bd2:	fdc42783          	lw	a5,-36(s0)
     bd6:	0007871b          	sext.w	a4,a5
     bda:	07000793          	li	a5,112
     bde:	02f71263          	bne	a4,a5,c02 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     be2:	fb843783          	ld	a5,-72(s0)
     be6:	00878713          	addi	a4,a5,8
     bea:	fae43c23          	sd	a4,-72(s0)
     bee:	6398                	ld	a4,0(a5)
     bf0:	fcc42783          	lw	a5,-52(s0)
     bf4:	85ba                	mv	a1,a4
     bf6:	853e                	mv	a0,a5
     bf8:	00000097          	auipc	ra,0x0
     bfc:	e30080e7          	jalr	-464(ra) # a28 <printptr>
     c00:	a0fd                	j	cee <vprintf+0x23a>
      } else if(c == 's'){
     c02:	fdc42783          	lw	a5,-36(s0)
     c06:	0007871b          	sext.w	a4,a5
     c0a:	07300793          	li	a5,115
     c0e:	04f71c63          	bne	a4,a5,c66 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c12:	fb843783          	ld	a5,-72(s0)
     c16:	00878713          	addi	a4,a5,8
     c1a:	fae43c23          	sd	a4,-72(s0)
     c1e:	639c                	ld	a5,0(a5)
     c20:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c24:	fe843783          	ld	a5,-24(s0)
     c28:	eb8d                	bnez	a5,c5a <vprintf+0x1a6>
          s = "(null)";
     c2a:	00000797          	auipc	a5,0x0
     c2e:	4e678793          	addi	a5,a5,1254 # 1110 <malloc+0x1ac>
     c32:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c36:	a015                	j	c5a <vprintf+0x1a6>
          putc(fd, *s);
     c38:	fe843783          	ld	a5,-24(s0)
     c3c:	0007c703          	lbu	a4,0(a5)
     c40:	fcc42783          	lw	a5,-52(s0)
     c44:	85ba                	mv	a1,a4
     c46:	853e                	mv	a0,a5
     c48:	00000097          	auipc	ra,0x0
     c4c:	ca2080e7          	jalr	-862(ra) # 8ea <putc>
          s++;
     c50:	fe843783          	ld	a5,-24(s0)
     c54:	0785                	addi	a5,a5,1
     c56:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c5a:	fe843783          	ld	a5,-24(s0)
     c5e:	0007c783          	lbu	a5,0(a5)
     c62:	fbf9                	bnez	a5,c38 <vprintf+0x184>
     c64:	a069                	j	cee <vprintf+0x23a>
        }
      } else if(c == 'c'){
     c66:	fdc42783          	lw	a5,-36(s0)
     c6a:	0007871b          	sext.w	a4,a5
     c6e:	06300793          	li	a5,99
     c72:	02f71463          	bne	a4,a5,c9a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     c76:	fb843783          	ld	a5,-72(s0)
     c7a:	00878713          	addi	a4,a5,8
     c7e:	fae43c23          	sd	a4,-72(s0)
     c82:	439c                	lw	a5,0(a5)
     c84:	0ff7f713          	zext.b	a4,a5
     c88:	fcc42783          	lw	a5,-52(s0)
     c8c:	85ba                	mv	a1,a4
     c8e:	853e                	mv	a0,a5
     c90:	00000097          	auipc	ra,0x0
     c94:	c5a080e7          	jalr	-934(ra) # 8ea <putc>
     c98:	a899                	j	cee <vprintf+0x23a>
      } else if(c == '%'){
     c9a:	fdc42783          	lw	a5,-36(s0)
     c9e:	0007871b          	sext.w	a4,a5
     ca2:	02500793          	li	a5,37
     ca6:	00f71f63          	bne	a4,a5,cc4 <vprintf+0x210>
        putc(fd, c);
     caa:	fdc42783          	lw	a5,-36(s0)
     cae:	0ff7f713          	zext.b	a4,a5
     cb2:	fcc42783          	lw	a5,-52(s0)
     cb6:	85ba                	mv	a1,a4
     cb8:	853e                	mv	a0,a5
     cba:	00000097          	auipc	ra,0x0
     cbe:	c30080e7          	jalr	-976(ra) # 8ea <putc>
     cc2:	a035                	j	cee <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     cc4:	fcc42783          	lw	a5,-52(s0)
     cc8:	02500593          	li	a1,37
     ccc:	853e                	mv	a0,a5
     cce:	00000097          	auipc	ra,0x0
     cd2:	c1c080e7          	jalr	-996(ra) # 8ea <putc>
        putc(fd, c);
     cd6:	fdc42783          	lw	a5,-36(s0)
     cda:	0ff7f713          	zext.b	a4,a5
     cde:	fcc42783          	lw	a5,-52(s0)
     ce2:	85ba                	mv	a1,a4
     ce4:	853e                	mv	a0,a5
     ce6:	00000097          	auipc	ra,0x0
     cea:	c04080e7          	jalr	-1020(ra) # 8ea <putc>
      }
      state = 0;
     cee:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     cf2:	fe442783          	lw	a5,-28(s0)
     cf6:	2785                	addiw	a5,a5,1
     cf8:	fef42223          	sw	a5,-28(s0)
     cfc:	fe442783          	lw	a5,-28(s0)
     d00:	fc043703          	ld	a4,-64(s0)
     d04:	97ba                	add	a5,a5,a4
     d06:	0007c783          	lbu	a5,0(a5)
     d0a:	dc0795e3          	bnez	a5,ad4 <vprintf+0x20>
    }
  }
}
     d0e:	0001                	nop
     d10:	0001                	nop
     d12:	60a6                	ld	ra,72(sp)
     d14:	6406                	ld	s0,64(sp)
     d16:	6161                	addi	sp,sp,80
     d18:	8082                	ret

0000000000000d1a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d1a:	7159                	addi	sp,sp,-112
     d1c:	fc06                	sd	ra,56(sp)
     d1e:	f822                	sd	s0,48(sp)
     d20:	0080                	addi	s0,sp,64
     d22:	fcb43823          	sd	a1,-48(s0)
     d26:	e010                	sd	a2,0(s0)
     d28:	e414                	sd	a3,8(s0)
     d2a:	e818                	sd	a4,16(s0)
     d2c:	ec1c                	sd	a5,24(s0)
     d2e:	03043023          	sd	a6,32(s0)
     d32:	03143423          	sd	a7,40(s0)
     d36:	87aa                	mv	a5,a0
     d38:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     d3c:	03040793          	addi	a5,s0,48
     d40:	fcf43423          	sd	a5,-56(s0)
     d44:	fc843783          	ld	a5,-56(s0)
     d48:	fd078793          	addi	a5,a5,-48
     d4c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     d50:	fe843703          	ld	a4,-24(s0)
     d54:	fdc42783          	lw	a5,-36(s0)
     d58:	863a                	mv	a2,a4
     d5a:	fd043583          	ld	a1,-48(s0)
     d5e:	853e                	mv	a0,a5
     d60:	00000097          	auipc	ra,0x0
     d64:	d54080e7          	jalr	-684(ra) # ab4 <vprintf>
}
     d68:	0001                	nop
     d6a:	70e2                	ld	ra,56(sp)
     d6c:	7442                	ld	s0,48(sp)
     d6e:	6165                	addi	sp,sp,112
     d70:	8082                	ret

0000000000000d72 <printf>:

void
printf(const char *fmt, ...)
{
     d72:	7159                	addi	sp,sp,-112
     d74:	f406                	sd	ra,40(sp)
     d76:	f022                	sd	s0,32(sp)
     d78:	1800                	addi	s0,sp,48
     d7a:	fca43c23          	sd	a0,-40(s0)
     d7e:	e40c                	sd	a1,8(s0)
     d80:	e810                	sd	a2,16(s0)
     d82:	ec14                	sd	a3,24(s0)
     d84:	f018                	sd	a4,32(s0)
     d86:	f41c                	sd	a5,40(s0)
     d88:	03043823          	sd	a6,48(s0)
     d8c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     d90:	04040793          	addi	a5,s0,64
     d94:	fcf43823          	sd	a5,-48(s0)
     d98:	fd043783          	ld	a5,-48(s0)
     d9c:	fc878793          	addi	a5,a5,-56
     da0:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     da4:	fe843783          	ld	a5,-24(s0)
     da8:	863e                	mv	a2,a5
     daa:	fd843583          	ld	a1,-40(s0)
     dae:	4505                	li	a0,1
     db0:	00000097          	auipc	ra,0x0
     db4:	d04080e7          	jalr	-764(ra) # ab4 <vprintf>
}
     db8:	0001                	nop
     dba:	70a2                	ld	ra,40(sp)
     dbc:	7402                	ld	s0,32(sp)
     dbe:	6165                	addi	sp,sp,112
     dc0:	8082                	ret

0000000000000dc2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     dc2:	7179                	addi	sp,sp,-48
     dc4:	f422                	sd	s0,40(sp)
     dc6:	1800                	addi	s0,sp,48
     dc8:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     dcc:	fd843783          	ld	a5,-40(s0)
     dd0:	17c1                	addi	a5,a5,-16
     dd2:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dd6:	00001797          	auipc	a5,0x1
     dda:	26a78793          	addi	a5,a5,618 # 2040 <freep>
     dde:	639c                	ld	a5,0(a5)
     de0:	fef43423          	sd	a5,-24(s0)
     de4:	a815                	j	e18 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     de6:	fe843783          	ld	a5,-24(s0)
     dea:	639c                	ld	a5,0(a5)
     dec:	fe843703          	ld	a4,-24(s0)
     df0:	00f76f63          	bltu	a4,a5,e0e <free+0x4c>
     df4:	fe043703          	ld	a4,-32(s0)
     df8:	fe843783          	ld	a5,-24(s0)
     dfc:	02e7eb63          	bltu	a5,a4,e32 <free+0x70>
     e00:	fe843783          	ld	a5,-24(s0)
     e04:	639c                	ld	a5,0(a5)
     e06:	fe043703          	ld	a4,-32(s0)
     e0a:	02f76463          	bltu	a4,a5,e32 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e0e:	fe843783          	ld	a5,-24(s0)
     e12:	639c                	ld	a5,0(a5)
     e14:	fef43423          	sd	a5,-24(s0)
     e18:	fe043703          	ld	a4,-32(s0)
     e1c:	fe843783          	ld	a5,-24(s0)
     e20:	fce7f3e3          	bgeu	a5,a4,de6 <free+0x24>
     e24:	fe843783          	ld	a5,-24(s0)
     e28:	639c                	ld	a5,0(a5)
     e2a:	fe043703          	ld	a4,-32(s0)
     e2e:	faf77ce3          	bgeu	a4,a5,de6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e32:	fe043783          	ld	a5,-32(s0)
     e36:	479c                	lw	a5,8(a5)
     e38:	1782                	slli	a5,a5,0x20
     e3a:	9381                	srli	a5,a5,0x20
     e3c:	0792                	slli	a5,a5,0x4
     e3e:	fe043703          	ld	a4,-32(s0)
     e42:	973e                	add	a4,a4,a5
     e44:	fe843783          	ld	a5,-24(s0)
     e48:	639c                	ld	a5,0(a5)
     e4a:	02f71763          	bne	a4,a5,e78 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     e4e:	fe043783          	ld	a5,-32(s0)
     e52:	4798                	lw	a4,8(a5)
     e54:	fe843783          	ld	a5,-24(s0)
     e58:	639c                	ld	a5,0(a5)
     e5a:	479c                	lw	a5,8(a5)
     e5c:	9fb9                	addw	a5,a5,a4
     e5e:	0007871b          	sext.w	a4,a5
     e62:	fe043783          	ld	a5,-32(s0)
     e66:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     e68:	fe843783          	ld	a5,-24(s0)
     e6c:	639c                	ld	a5,0(a5)
     e6e:	6398                	ld	a4,0(a5)
     e70:	fe043783          	ld	a5,-32(s0)
     e74:	e398                	sd	a4,0(a5)
     e76:	a039                	j	e84 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     e78:	fe843783          	ld	a5,-24(s0)
     e7c:	6398                	ld	a4,0(a5)
     e7e:	fe043783          	ld	a5,-32(s0)
     e82:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     e84:	fe843783          	ld	a5,-24(s0)
     e88:	479c                	lw	a5,8(a5)
     e8a:	1782                	slli	a5,a5,0x20
     e8c:	9381                	srli	a5,a5,0x20
     e8e:	0792                	slli	a5,a5,0x4
     e90:	fe843703          	ld	a4,-24(s0)
     e94:	97ba                	add	a5,a5,a4
     e96:	fe043703          	ld	a4,-32(s0)
     e9a:	02f71563          	bne	a4,a5,ec4 <free+0x102>
    p->s.size += bp->s.size;
     e9e:	fe843783          	ld	a5,-24(s0)
     ea2:	4798                	lw	a4,8(a5)
     ea4:	fe043783          	ld	a5,-32(s0)
     ea8:	479c                	lw	a5,8(a5)
     eaa:	9fb9                	addw	a5,a5,a4
     eac:	0007871b          	sext.w	a4,a5
     eb0:	fe843783          	ld	a5,-24(s0)
     eb4:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     eb6:	fe043783          	ld	a5,-32(s0)
     eba:	6398                	ld	a4,0(a5)
     ebc:	fe843783          	ld	a5,-24(s0)
     ec0:	e398                	sd	a4,0(a5)
     ec2:	a031                	j	ece <free+0x10c>
  } else
    p->s.ptr = bp;
     ec4:	fe843783          	ld	a5,-24(s0)
     ec8:	fe043703          	ld	a4,-32(s0)
     ecc:	e398                	sd	a4,0(a5)
  freep = p;
     ece:	00001797          	auipc	a5,0x1
     ed2:	17278793          	addi	a5,a5,370 # 2040 <freep>
     ed6:	fe843703          	ld	a4,-24(s0)
     eda:	e398                	sd	a4,0(a5)
}
     edc:	0001                	nop
     ede:	7422                	ld	s0,40(sp)
     ee0:	6145                	addi	sp,sp,48
     ee2:	8082                	ret

0000000000000ee4 <morecore>:

static Header*
morecore(uint nu)
{
     ee4:	7179                	addi	sp,sp,-48
     ee6:	f406                	sd	ra,40(sp)
     ee8:	f022                	sd	s0,32(sp)
     eea:	1800                	addi	s0,sp,48
     eec:	87aa                	mv	a5,a0
     eee:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     ef2:	fdc42783          	lw	a5,-36(s0)
     ef6:	0007871b          	sext.w	a4,a5
     efa:	6785                	lui	a5,0x1
     efc:	00f77563          	bgeu	a4,a5,f06 <morecore+0x22>
    nu = 4096;
     f00:	6785                	lui	a5,0x1
     f02:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f06:	fdc42783          	lw	a5,-36(s0)
     f0a:	0047979b          	slliw	a5,a5,0x4
     f0e:	2781                	sext.w	a5,a5
     f10:	2781                	sext.w	a5,a5
     f12:	853e                	mv	a0,a5
     f14:	00000097          	auipc	ra,0x0
     f18:	9be080e7          	jalr	-1602(ra) # 8d2 <sbrk>
     f1c:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f20:	fe843703          	ld	a4,-24(s0)
     f24:	57fd                	li	a5,-1
     f26:	00f71463          	bne	a4,a5,f2e <morecore+0x4a>
    return 0;
     f2a:	4781                	li	a5,0
     f2c:	a03d                	j	f5a <morecore+0x76>
  hp = (Header*)p;
     f2e:	fe843783          	ld	a5,-24(s0)
     f32:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f36:	fe043783          	ld	a5,-32(s0)
     f3a:	fdc42703          	lw	a4,-36(s0)
     f3e:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     f40:	fe043783          	ld	a5,-32(s0)
     f44:	07c1                	addi	a5,a5,16 # 1010 <malloc+0xac>
     f46:	853e                	mv	a0,a5
     f48:	00000097          	auipc	ra,0x0
     f4c:	e7a080e7          	jalr	-390(ra) # dc2 <free>
  return freep;
     f50:	00001797          	auipc	a5,0x1
     f54:	0f078793          	addi	a5,a5,240 # 2040 <freep>
     f58:	639c                	ld	a5,0(a5)
}
     f5a:	853e                	mv	a0,a5
     f5c:	70a2                	ld	ra,40(sp)
     f5e:	7402                	ld	s0,32(sp)
     f60:	6145                	addi	sp,sp,48
     f62:	8082                	ret

0000000000000f64 <malloc>:

void*
malloc(uint nbytes)
{
     f64:	7139                	addi	sp,sp,-64
     f66:	fc06                	sd	ra,56(sp)
     f68:	f822                	sd	s0,48(sp)
     f6a:	0080                	addi	s0,sp,64
     f6c:	87aa                	mv	a5,a0
     f6e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f72:	fcc46783          	lwu	a5,-52(s0)
     f76:	07bd                	addi	a5,a5,15
     f78:	8391                	srli	a5,a5,0x4
     f7a:	2781                	sext.w	a5,a5
     f7c:	2785                	addiw	a5,a5,1
     f7e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     f82:	00001797          	auipc	a5,0x1
     f86:	0be78793          	addi	a5,a5,190 # 2040 <freep>
     f8a:	639c                	ld	a5,0(a5)
     f8c:	fef43023          	sd	a5,-32(s0)
     f90:	fe043783          	ld	a5,-32(s0)
     f94:	ef95                	bnez	a5,fd0 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     f96:	00001797          	auipc	a5,0x1
     f9a:	09a78793          	addi	a5,a5,154 # 2030 <base>
     f9e:	fef43023          	sd	a5,-32(s0)
     fa2:	00001797          	auipc	a5,0x1
     fa6:	09e78793          	addi	a5,a5,158 # 2040 <freep>
     faa:	fe043703          	ld	a4,-32(s0)
     fae:	e398                	sd	a4,0(a5)
     fb0:	00001797          	auipc	a5,0x1
     fb4:	09078793          	addi	a5,a5,144 # 2040 <freep>
     fb8:	6398                	ld	a4,0(a5)
     fba:	00001797          	auipc	a5,0x1
     fbe:	07678793          	addi	a5,a5,118 # 2030 <base>
     fc2:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     fc4:	00001797          	auipc	a5,0x1
     fc8:	06c78793          	addi	a5,a5,108 # 2030 <base>
     fcc:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fd0:	fe043783          	ld	a5,-32(s0)
     fd4:	639c                	ld	a5,0(a5)
     fd6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     fda:	fe843783          	ld	a5,-24(s0)
     fde:	4798                	lw	a4,8(a5)
     fe0:	fdc42783          	lw	a5,-36(s0)
     fe4:	2781                	sext.w	a5,a5
     fe6:	06f76763          	bltu	a4,a5,1054 <malloc+0xf0>
      if(p->s.size == nunits)
     fea:	fe843783          	ld	a5,-24(s0)
     fee:	4798                	lw	a4,8(a5)
     ff0:	fdc42783          	lw	a5,-36(s0)
     ff4:	2781                	sext.w	a5,a5
     ff6:	00e79963          	bne	a5,a4,1008 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     ffa:	fe843783          	ld	a5,-24(s0)
     ffe:	6398                	ld	a4,0(a5)
    1000:	fe043783          	ld	a5,-32(s0)
    1004:	e398                	sd	a4,0(a5)
    1006:	a825                	j	103e <malloc+0xda>
      else {
        p->s.size -= nunits;
    1008:	fe843783          	ld	a5,-24(s0)
    100c:	479c                	lw	a5,8(a5)
    100e:	fdc42703          	lw	a4,-36(s0)
    1012:	9f99                	subw	a5,a5,a4
    1014:	0007871b          	sext.w	a4,a5
    1018:	fe843783          	ld	a5,-24(s0)
    101c:	c798                	sw	a4,8(a5)
        p += p->s.size;
    101e:	fe843783          	ld	a5,-24(s0)
    1022:	479c                	lw	a5,8(a5)
    1024:	1782                	slli	a5,a5,0x20
    1026:	9381                	srli	a5,a5,0x20
    1028:	0792                	slli	a5,a5,0x4
    102a:	fe843703          	ld	a4,-24(s0)
    102e:	97ba                	add	a5,a5,a4
    1030:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1034:	fe843783          	ld	a5,-24(s0)
    1038:	fdc42703          	lw	a4,-36(s0)
    103c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    103e:	00001797          	auipc	a5,0x1
    1042:	00278793          	addi	a5,a5,2 # 2040 <freep>
    1046:	fe043703          	ld	a4,-32(s0)
    104a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    104c:	fe843783          	ld	a5,-24(s0)
    1050:	07c1                	addi	a5,a5,16
    1052:	a091                	j	1096 <malloc+0x132>
    }
    if(p == freep)
    1054:	00001797          	auipc	a5,0x1
    1058:	fec78793          	addi	a5,a5,-20 # 2040 <freep>
    105c:	639c                	ld	a5,0(a5)
    105e:	fe843703          	ld	a4,-24(s0)
    1062:	02f71063          	bne	a4,a5,1082 <malloc+0x11e>
      if((p = morecore(nunits)) == 0)
    1066:	fdc42783          	lw	a5,-36(s0)
    106a:	853e                	mv	a0,a5
    106c:	00000097          	auipc	ra,0x0
    1070:	e78080e7          	jalr	-392(ra) # ee4 <morecore>
    1074:	fea43423          	sd	a0,-24(s0)
    1078:	fe843783          	ld	a5,-24(s0)
    107c:	e399                	bnez	a5,1082 <malloc+0x11e>
        return 0;
    107e:	4781                	li	a5,0
    1080:	a819                	j	1096 <malloc+0x132>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1082:	fe843783          	ld	a5,-24(s0)
    1086:	fef43023          	sd	a5,-32(s0)
    108a:	fe843783          	ld	a5,-24(s0)
    108e:	639c                	ld	a5,0(a5)
    1090:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1094:	b799                	j	fda <malloc+0x76>
  }
}
    1096:	853e                	mv	a0,a5
    1098:	70e2                	ld	ra,56(sp)
    109a:	7442                	ld	s0,48(sp)
    109c:	6121                	addi	sp,sp,64
    109e:	8082                	ret
