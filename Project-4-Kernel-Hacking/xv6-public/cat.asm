
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;

  if(argc <= 1){
  1c:	48                   	dec    %eax
  1d:	7e 54                	jle    73 <main+0x73>
  1f:	83 c3 04             	add    $0x4,%ebx
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	6a 00                	push   $0x0
  2d:	ff 33                	pushl  (%ebx)
  2f:	e8 c1 02 00 00       	call   2f5 <open>
  34:	89 c7                	mov    %eax,%edi
  36:	83 c4 10             	add    $0x10,%esp
  39:	85 c0                	test   %eax,%eax
  3b:	78 22                	js     5f <main+0x5f>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	50                   	push   %eax
  41:	e8 3e 00 00 00       	call   84 <cat>
    close(fd);
  46:	89 3c 24             	mov    %edi,(%esp)
  49:	e8 8f 02 00 00       	call   2dd <close>
  for(i = 1; i < argc; i++){
  4e:	46                   	inc    %esi
  4f:	83 c3 04             	add    $0x4,%ebx
  52:	83 c4 10             	add    $0x10,%esp
  55:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  58:	75 ce                	jne    28 <main+0x28>
  }
  exit();
  5a:	e8 56 02 00 00       	call   2b5 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  5f:	50                   	push   %eax
  60:	ff 33                	pushl  (%ebx)
  62:	68 42 07 00 00       	push   $0x742
  67:	6a 01                	push   $0x1
  69:	e8 7a 03 00 00       	call   3e8 <printf>
      exit();
  6e:	e8 42 02 00 00       	call   2b5 <exit>
    cat(0);
  73:	83 ec 0c             	sub    $0xc,%esp
  76:	6a 00                	push   $0x0
  78:	e8 07 00 00 00       	call   84 <cat>
    exit();
  7d:	e8 33 02 00 00       	call   2b5 <exit>
  82:	66 90                	xchg   %ax,%ax

00000084 <cat>:
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	56                   	push   %esi
  88:	53                   	push   %ebx
  89:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  8c:	eb 2c                	jmp    ba <cat+0x36>
  8e:	66 90                	xchg   %ax,%ax
    printf(1, "\n\nRead function has been called %d times\n\n", getreadcount());
  90:	e8 c0 02 00 00       	call   355 <getreadcount>
  95:	51                   	push   %ecx
  96:	50                   	push   %eax
  97:	68 f4 06 00 00       	push   $0x6f4
  9c:	6a 01                	push   $0x1
  9e:	e8 45 03 00 00       	call   3e8 <printf>
    if (write(1, buf, n) != n) {
  a3:	83 c4 0c             	add    $0xc,%esp
  a6:	53                   	push   %ebx
  a7:	68 60 0a 00 00       	push   $0xa60
  ac:	6a 01                	push   $0x1
  ae:	e8 22 02 00 00       	call   2d5 <write>
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	39 d8                	cmp    %ebx,%eax
  b8:	75 23                	jne    dd <cat+0x59>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  ba:	52                   	push   %edx
  bb:	68 00 02 00 00       	push   $0x200
  c0:	68 60 0a 00 00       	push   $0xa60
  c5:	56                   	push   %esi
  c6:	e8 02 02 00 00       	call   2cd <read>
  cb:	89 c3                	mov    %eax,%ebx
  cd:	83 c4 10             	add    $0x10,%esp
  d0:	85 c0                	test   %eax,%eax
  d2:	7f bc                	jg     90 <cat+0xc>
  if(n < 0){
  d4:	75 1b                	jne    f1 <cat+0x6d>
}
  d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
      printf(1, "cat: write error\n");
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	68 1f 07 00 00       	push   $0x71f
  e5:	6a 01                	push   $0x1
  e7:	e8 fc 02 00 00       	call   3e8 <printf>
      exit();
  ec:	e8 c4 01 00 00       	call   2b5 <exit>
    printf(1, "cat: read error\n");
  f1:	50                   	push   %eax
  f2:	50                   	push   %eax
  f3:	68 31 07 00 00       	push   $0x731
  f8:	6a 01                	push   $0x1
  fa:	e8 e9 02 00 00       	call   3e8 <printf>
    exit();
  ff:	e8 b1 01 00 00       	call   2b5 <exit>

00000104 <strcpy>:
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	53                   	push   %ebx
 108:	8b 4d 08             	mov    0x8(%ebp),%ecx
 10b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10e:	31 c0                	xor    %eax,%eax
 110:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 113:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 116:	40                   	inc    %eax
 117:	84 d2                	test   %dl,%dl
 119:	75 f5                	jne    110 <strcpy+0xc>
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5b                   	pop    %ebx
 11e:	5d                   	pop    %ebp
 11f:	c3                   	ret    

00000120 <strcmp>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 5d 08             	mov    0x8(%ebp),%ebx
 127:	8b 55 0c             	mov    0xc(%ebp),%edx
 12a:	0f b6 03             	movzbl (%ebx),%eax
 12d:	0f b6 0a             	movzbl (%edx),%ecx
 130:	84 c0                	test   %al,%al
 132:	75 10                	jne    144 <strcmp+0x24>
 134:	eb 1a                	jmp    150 <strcmp+0x30>
 136:	66 90                	xchg   %ax,%ax
 138:	43                   	inc    %ebx
 139:	42                   	inc    %edx
 13a:	0f b6 03             	movzbl (%ebx),%eax
 13d:	0f b6 0a             	movzbl (%edx),%ecx
 140:	84 c0                	test   %al,%al
 142:	74 0c                	je     150 <strcmp+0x30>
 144:	38 c8                	cmp    %cl,%al
 146:	74 f0                	je     138 <strcmp+0x18>
 148:	29 c8                	sub    %ecx,%eax
 14a:	5b                   	pop    %ebx
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	31 c0                	xor    %eax,%eax
 152:	29 c8                	sub    %ecx,%eax
 154:	5b                   	pop    %ebx
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	90                   	nop

00000158 <strlen>:
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	8b 55 08             	mov    0x8(%ebp),%edx
 15e:	80 3a 00             	cmpb   $0x0,(%edx)
 161:	74 15                	je     178 <strlen+0x20>
 163:	31 c0                	xor    %eax,%eax
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	40                   	inc    %eax
 169:	89 c1                	mov    %eax,%ecx
 16b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 16f:	75 f7                	jne    168 <strlen+0x10>
 171:	89 c8                	mov    %ecx,%eax
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi
 178:	31 c9                	xor    %ecx,%ecx
 17a:	89 c8                	mov    %ecx,%eax
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	66 90                	xchg   %ax,%ax

00000180 <memset>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 7d 08             	mov    0x8(%ebp),%edi
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	fc                   	cld    
 18e:	f3 aa                	rep stos %al,%es:(%edi)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	5f                   	pop    %edi
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    
 196:	66 90                	xchg   %ax,%ax

00000198 <strchr>:
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1a1:	8a 10                	mov    (%eax),%dl
 1a3:	84 d2                	test   %dl,%dl
 1a5:	75 0c                	jne    1b3 <strchr+0x1b>
 1a7:	eb 13                	jmp    1bc <strchr+0x24>
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	40                   	inc    %eax
 1ad:	8a 10                	mov    (%eax),%dl
 1af:	84 d2                	test   %dl,%dl
 1b1:	74 09                	je     1bc <strchr+0x24>
 1b3:	38 d1                	cmp    %dl,%cl
 1b5:	75 f5                	jne    1ac <strchr+0x14>
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d 76 00             	lea    0x0(%esi),%esi
 1bc:	31 c0                	xor    %eax,%eax
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <gets>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	83 ec 1c             	sub    $0x1c,%esp
 1c9:	8b 75 08             	mov    0x8(%ebp),%esi
 1cc:	bb 01 00 00 00       	mov    $0x1,%ebx
 1d1:	29 f3                	sub    %esi,%ebx
 1d3:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1d6:	eb 20                	jmp    1f8 <gets+0x38>
 1d8:	50                   	push   %eax
 1d9:	6a 01                	push   $0x1
 1db:	57                   	push   %edi
 1dc:	6a 00                	push   $0x0
 1de:	e8 ea 00 00 00       	call   2cd <read>
 1e3:	83 c4 10             	add    $0x10,%esp
 1e6:	85 c0                	test   %eax,%eax
 1e8:	7e 16                	jle    200 <gets+0x40>
 1ea:	8a 45 e7             	mov    -0x19(%ebp),%al
 1ed:	88 06                	mov    %al,(%esi)
 1ef:	46                   	inc    %esi
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 0c                	je     200 <gets+0x40>
 1f4:	3c 0d                	cmp    $0xd,%al
 1f6:	74 08                	je     200 <gets+0x40>
 1f8:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 1fb:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1fe:	7f d8                	jg     1d8 <gets+0x18>
 200:	c6 06 00             	movb   $0x0,(%esi)
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 65 f4             	lea    -0xc(%ebp),%esp
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5f                   	pop    %edi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax

00000210 <stat>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	pushl  0x8(%ebp)
 21d:	e8 d3 00 00 00       	call   2f5 <open>
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
 229:	89 c3                	mov    %eax,%ebx
 22b:	83 ec 08             	sub    $0x8,%esp
 22e:	ff 75 0c             	pushl  0xc(%ebp)
 231:	50                   	push   %eax
 232:	e8 d6 00 00 00       	call   30d <fstat>
 237:	89 c6                	mov    %eax,%esi
 239:	89 1c 24             	mov    %ebx,(%esp)
 23c:	e8 9c 00 00 00       	call   2dd <close>
 241:	83 c4 10             	add    $0x10,%esp
 244:	89 f0                	mov    %esi,%eax
 246:	8d 65 f8             	lea    -0x8(%ebp),%esp
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	90                   	nop

00000258 <atoi>:
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	53                   	push   %ebx
 25c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 25f:	0f be 01             	movsbl (%ecx),%eax
 262:	8d 50 d0             	lea    -0x30(%eax),%edx
 265:	80 fa 09             	cmp    $0x9,%dl
 268:	ba 00 00 00 00       	mov    $0x0,%edx
 26d:	77 16                	ja     285 <atoi+0x2d>
 26f:	90                   	nop
 270:	41                   	inc    %ecx
 271:	8d 14 92             	lea    (%edx,%edx,4),%edx
 274:	01 d2                	add    %edx,%edx
 276:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 27a:	0f be 01             	movsbl (%ecx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x18>
 285:	89 d0                	mov    %edx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	66 90                	xchg   %ax,%ax

0000028c <memmove>:
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	57                   	push   %edi
 290:	56                   	push   %esi
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	8b 75 0c             	mov    0xc(%ebp),%esi
 297:	8b 55 10             	mov    0x10(%ebp),%edx
 29a:	85 d2                	test   %edx,%edx
 29c:	7e 0b                	jle    2a9 <memmove+0x1d>
 29e:	01 c2                	add    %eax,%edx
 2a0:	89 c7                	mov    %eax,%edi
 2a2:	66 90                	xchg   %ax,%ax
 2a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2a5:	39 fa                	cmp    %edi,%edx
 2a7:	75 fb                	jne    2a4 <memmove+0x18>
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    

000002ad <fork>:
 2ad:	b8 01 00 00 00       	mov    $0x1,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <exit>:
 2b5:	b8 02 00 00 00       	mov    $0x2,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <wait>:
 2bd:	b8 03 00 00 00       	mov    $0x3,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <pipe>:
 2c5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <read>:
 2cd:	b8 05 00 00 00       	mov    $0x5,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <write>:
 2d5:	b8 10 00 00 00       	mov    $0x10,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <close>:
 2dd:	b8 15 00 00 00       	mov    $0x15,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <kill>:
 2e5:	b8 06 00 00 00       	mov    $0x6,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <exec>:
 2ed:	b8 07 00 00 00       	mov    $0x7,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <open>:
 2f5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <mknod>:
 2fd:	b8 11 00 00 00       	mov    $0x11,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <unlink>:
 305:	b8 12 00 00 00       	mov    $0x12,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <fstat>:
 30d:	b8 08 00 00 00       	mov    $0x8,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <link>:
 315:	b8 13 00 00 00       	mov    $0x13,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <mkdir>:
 31d:	b8 14 00 00 00       	mov    $0x14,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <chdir>:
 325:	b8 09 00 00 00       	mov    $0x9,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <dup>:
 32d:	b8 0a 00 00 00       	mov    $0xa,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <getpid>:
 335:	b8 0b 00 00 00       	mov    $0xb,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <sbrk>:
 33d:	b8 0c 00 00 00       	mov    $0xc,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <sleep>:
 345:	b8 0d 00 00 00       	mov    $0xd,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <uptime>:
 34d:	b8 0e 00 00 00       	mov    $0xe,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <getreadcount>:
 355:	b8 16 00 00 00       	mov    $0x16,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 3c             	sub    $0x3c,%esp
 369:	89 45 bc             	mov    %eax,-0x44(%ebp)
 36c:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 36f:	89 d1                	mov    %edx,%ecx
 371:	8b 5d 08             	mov    0x8(%ebp),%ebx
 374:	85 db                	test   %ebx,%ebx
 376:	74 04                	je     37c <printint+0x1c>
 378:	85 d2                	test   %edx,%edx
 37a:	78 68                	js     3e4 <printint+0x84>
 37c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 383:	31 ff                	xor    %edi,%edi
 385:	8d 75 d7             	lea    -0x29(%ebp),%esi
 388:	89 c8                	mov    %ecx,%eax
 38a:	31 d2                	xor    %edx,%edx
 38c:	f7 75 c4             	divl   -0x3c(%ebp)
 38f:	89 fb                	mov    %edi,%ebx
 391:	8d 7f 01             	lea    0x1(%edi),%edi
 394:	8a 92 60 07 00 00    	mov    0x760(%edx),%dl
 39a:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
 39e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 3a1:	89 c1                	mov    %eax,%ecx
 3a3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3a6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 3a9:	76 dd                	jbe    388 <printint+0x28>
 3ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3ae:	85 c9                	test   %ecx,%ecx
 3b0:	74 09                	je     3bb <printint+0x5b>
 3b2:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3b7:	89 fb                	mov    %edi,%ebx
 3b9:	b2 2d                	mov    $0x2d,%dl
 3bb:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 3bf:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3c2:	eb 03                	jmp    3c7 <printint+0x67>
 3c4:	8a 13                	mov    (%ebx),%dl
 3c6:	4b                   	dec    %ebx
 3c7:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ca:	50                   	push   %eax
 3cb:	6a 01                	push   $0x1
 3cd:	56                   	push   %esi
 3ce:	57                   	push   %edi
 3cf:	e8 01 ff ff ff       	call   2d5 <write>
 3d4:	83 c4 10             	add    $0x10,%esp
 3d7:	39 de                	cmp    %ebx,%esi
 3d9:	75 e9                	jne    3c4 <printint+0x64>
 3db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3de:	5b                   	pop    %ebx
 3df:	5e                   	pop    %esi
 3e0:	5f                   	pop    %edi
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	90                   	nop
 3e4:	f7 d9                	neg    %ecx
 3e6:	eb 9b                	jmp    383 <printint+0x23>

000003e8 <printf>:
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	57                   	push   %edi
 3ec:	56                   	push   %esi
 3ed:	53                   	push   %ebx
 3ee:	83 ec 2c             	sub    $0x2c,%esp
 3f1:	8b 75 0c             	mov    0xc(%ebp),%esi
 3f4:	8a 1e                	mov    (%esi),%bl
 3f6:	84 db                	test   %bl,%bl
 3f8:	0f 84 a3 00 00 00    	je     4a1 <printf+0xb9>
 3fe:	46                   	inc    %esi
 3ff:	8d 45 10             	lea    0x10(%ebp),%eax
 402:	89 45 d0             	mov    %eax,-0x30(%ebp)
 405:	31 d2                	xor    %edx,%edx
 407:	8d 7d e7             	lea    -0x19(%ebp),%edi
 40a:	eb 29                	jmp    435 <printf+0x4d>
 40c:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 40f:	83 f8 25             	cmp    $0x25,%eax
 412:	0f 84 94 00 00 00    	je     4ac <printf+0xc4>
 418:	88 5d e7             	mov    %bl,-0x19(%ebp)
 41b:	50                   	push   %eax
 41c:	6a 01                	push   $0x1
 41e:	57                   	push   %edi
 41f:	ff 75 08             	pushl  0x8(%ebp)
 422:	e8 ae fe ff ff       	call   2d5 <write>
 427:	83 c4 10             	add    $0x10,%esp
 42a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 42d:	46                   	inc    %esi
 42e:	8a 5e ff             	mov    -0x1(%esi),%bl
 431:	84 db                	test   %bl,%bl
 433:	74 6c                	je     4a1 <printf+0xb9>
 435:	0f be cb             	movsbl %bl,%ecx
 438:	0f b6 c3             	movzbl %bl,%eax
 43b:	85 d2                	test   %edx,%edx
 43d:	74 cd                	je     40c <printf+0x24>
 43f:	83 fa 25             	cmp    $0x25,%edx
 442:	75 e9                	jne    42d <printf+0x45>
 444:	83 f8 64             	cmp    $0x64,%eax
 447:	0f 84 97 00 00 00    	je     4e4 <printf+0xfc>
 44d:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 453:	83 f9 70             	cmp    $0x70,%ecx
 456:	74 60                	je     4b8 <printf+0xd0>
 458:	83 f8 73             	cmp    $0x73,%eax
 45b:	0f 84 8f 00 00 00    	je     4f0 <printf+0x108>
 461:	83 f8 63             	cmp    $0x63,%eax
 464:	0f 84 d6 00 00 00    	je     540 <printf+0x158>
 46a:	83 f8 25             	cmp    $0x25,%eax
 46d:	0f 84 c1 00 00 00    	je     534 <printf+0x14c>
 473:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 477:	50                   	push   %eax
 478:	6a 01                	push   $0x1
 47a:	57                   	push   %edi
 47b:	ff 75 08             	pushl  0x8(%ebp)
 47e:	e8 52 fe ff ff       	call   2d5 <write>
 483:	88 5d e7             	mov    %bl,-0x19(%ebp)
 486:	83 c4 0c             	add    $0xc,%esp
 489:	6a 01                	push   $0x1
 48b:	57                   	push   %edi
 48c:	ff 75 08             	pushl  0x8(%ebp)
 48f:	e8 41 fe ff ff       	call   2d5 <write>
 494:	83 c4 10             	add    $0x10,%esp
 497:	31 d2                	xor    %edx,%edx
 499:	46                   	inc    %esi
 49a:	8a 5e ff             	mov    -0x1(%esi),%bl
 49d:	84 db                	test   %bl,%bl
 49f:	75 94                	jne    435 <printf+0x4d>
 4a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a4:	5b                   	pop    %ebx
 4a5:	5e                   	pop    %esi
 4a6:	5f                   	pop    %edi
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret    
 4a9:	8d 76 00             	lea    0x0(%esi),%esi
 4ac:	ba 25 00 00 00       	mov    $0x25,%edx
 4b1:	e9 77 ff ff ff       	jmp    42d <printf+0x45>
 4b6:	66 90                	xchg   %ax,%ax
 4b8:	83 ec 0c             	sub    $0xc,%esp
 4bb:	6a 00                	push   $0x0
 4bd:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c2:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4c5:	8b 13                	mov    (%ebx),%edx
 4c7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ca:	e8 91 fe ff ff       	call   360 <printint>
 4cf:	89 d8                	mov    %ebx,%eax
 4d1:	83 c0 04             	add    $0x4,%eax
 4d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d7:	83 c4 10             	add    $0x10,%esp
 4da:	31 d2                	xor    %edx,%edx
 4dc:	e9 4c ff ff ff       	jmp    42d <printf+0x45>
 4e1:	8d 76 00             	lea    0x0(%esi),%esi
 4e4:	83 ec 0c             	sub    $0xc,%esp
 4e7:	6a 01                	push   $0x1
 4e9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ee:	eb d2                	jmp    4c2 <printf+0xda>
 4f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4f3:	8b 18                	mov    (%eax),%ebx
 4f5:	83 c0 04             	add    $0x4,%eax
 4f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4fb:	85 db                	test   %ebx,%ebx
 4fd:	74 65                	je     564 <printf+0x17c>
 4ff:	8a 03                	mov    (%ebx),%al
 501:	84 c0                	test   %al,%al
 503:	74 70                	je     575 <printf+0x18d>
 505:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 508:	89 de                	mov    %ebx,%esi
 50a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	88 45 e7             	mov    %al,-0x19(%ebp)
 513:	50                   	push   %eax
 514:	6a 01                	push   $0x1
 516:	57                   	push   %edi
 517:	53                   	push   %ebx
 518:	e8 b8 fd ff ff       	call   2d5 <write>
 51d:	46                   	inc    %esi
 51e:	8a 06                	mov    (%esi),%al
 520:	83 c4 10             	add    $0x10,%esp
 523:	84 c0                	test   %al,%al
 525:	75 e9                	jne    510 <printf+0x128>
 527:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 52a:	31 d2                	xor    %edx,%edx
 52c:	e9 fc fe ff ff       	jmp    42d <printf+0x45>
 531:	8d 76 00             	lea    0x0(%esi),%esi
 534:	88 5d e7             	mov    %bl,-0x19(%ebp)
 537:	52                   	push   %edx
 538:	e9 4c ff ff ff       	jmp    489 <printf+0xa1>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 543:	8b 03                	mov    (%ebx),%eax
 545:	88 45 e7             	mov    %al,-0x19(%ebp)
 548:	51                   	push   %ecx
 549:	6a 01                	push   $0x1
 54b:	57                   	push   %edi
 54c:	ff 75 08             	pushl  0x8(%ebp)
 54f:	e8 81 fd ff ff       	call   2d5 <write>
 554:	83 c3 04             	add    $0x4,%ebx
 557:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	31 d2                	xor    %edx,%edx
 55f:	e9 c9 fe ff ff       	jmp    42d <printf+0x45>
 564:	bb 57 07 00 00       	mov    $0x757,%ebx
 569:	b0 28                	mov    $0x28,%al
 56b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 56e:	89 de                	mov    %ebx,%esi
 570:	8b 5d 08             	mov    0x8(%ebp),%ebx
 573:	eb 9b                	jmp    510 <printf+0x128>
 575:	31 d2                	xor    %edx,%edx
 577:	e9 b1 fe ff ff       	jmp    42d <printf+0x45>

0000057c <free>:
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	57                   	push   %edi
 580:	56                   	push   %esi
 581:	53                   	push   %ebx
 582:	8b 5d 08             	mov    0x8(%ebp),%ebx
 585:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 588:	a1 40 0a 00 00       	mov    0xa40,%eax
 58d:	8b 10                	mov    (%eax),%edx
 58f:	39 c8                	cmp    %ecx,%eax
 591:	73 11                	jae    5a4 <free+0x28>
 593:	90                   	nop
 594:	39 d1                	cmp    %edx,%ecx
 596:	72 14                	jb     5ac <free+0x30>
 598:	39 d0                	cmp    %edx,%eax
 59a:	73 10                	jae    5ac <free+0x30>
 59c:	89 d0                	mov    %edx,%eax
 59e:	8b 10                	mov    (%eax),%edx
 5a0:	39 c8                	cmp    %ecx,%eax
 5a2:	72 f0                	jb     594 <free+0x18>
 5a4:	39 d0                	cmp    %edx,%eax
 5a6:	72 f4                	jb     59c <free+0x20>
 5a8:	39 d1                	cmp    %edx,%ecx
 5aa:	73 f0                	jae    59c <free+0x20>
 5ac:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5af:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5b2:	39 fa                	cmp    %edi,%edx
 5b4:	74 1a                	je     5d0 <free+0x54>
 5b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5b9:	8b 50 04             	mov    0x4(%eax),%edx
 5bc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5bf:	39 f1                	cmp    %esi,%ecx
 5c1:	74 24                	je     5e7 <free+0x6b>
 5c3:	89 08                	mov    %ecx,(%eax)
 5c5:	a3 40 0a 00 00       	mov    %eax,0xa40
 5ca:	5b                   	pop    %ebx
 5cb:	5e                   	pop    %esi
 5cc:	5f                   	pop    %edi
 5cd:	5d                   	pop    %ebp
 5ce:	c3                   	ret    
 5cf:	90                   	nop
 5d0:	03 72 04             	add    0x4(%edx),%esi
 5d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5d6:	8b 10                	mov    (%eax),%edx
 5d8:	8b 12                	mov    (%edx),%edx
 5da:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5dd:	8b 50 04             	mov    0x4(%eax),%edx
 5e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5e3:	39 f1                	cmp    %esi,%ecx
 5e5:	75 dc                	jne    5c3 <free+0x47>
 5e7:	03 53 fc             	add    -0x4(%ebx),%edx
 5ea:	89 50 04             	mov    %edx,0x4(%eax)
 5ed:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5f0:	89 10                	mov    %edx,(%eax)
 5f2:	a3 40 0a 00 00       	mov    %eax,0xa40
 5f7:	5b                   	pop    %ebx
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    

000005fc <malloc>:
 5fc:	55                   	push   %ebp
 5fd:	89 e5                	mov    %esp,%ebp
 5ff:	57                   	push   %edi
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	83 ec 1c             	sub    $0x1c,%esp
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	8d 70 07             	lea    0x7(%eax),%esi
 60b:	c1 ee 03             	shr    $0x3,%esi
 60e:	46                   	inc    %esi
 60f:	8b 3d 40 0a 00 00    	mov    0xa40,%edi
 615:	85 ff                	test   %edi,%edi
 617:	0f 84 a3 00 00 00    	je     6c0 <malloc+0xc4>
 61d:	8b 07                	mov    (%edi),%eax
 61f:	8b 48 04             	mov    0x4(%eax),%ecx
 622:	39 f1                	cmp    %esi,%ecx
 624:	73 67                	jae    68d <malloc+0x91>
 626:	89 f3                	mov    %esi,%ebx
 628:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 62e:	0f 82 80 00 00 00    	jb     6b4 <malloc+0xb8>
 634:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 63b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 63e:	eb 11                	jmp    651 <malloc+0x55>
 640:	8b 10                	mov    (%eax),%edx
 642:	8b 4a 04             	mov    0x4(%edx),%ecx
 645:	39 f1                	cmp    %esi,%ecx
 647:	73 4b                	jae    694 <malloc+0x98>
 649:	8b 3d 40 0a 00 00    	mov    0xa40,%edi
 64f:	89 d0                	mov    %edx,%eax
 651:	39 c7                	cmp    %eax,%edi
 653:	75 eb                	jne    640 <malloc+0x44>
 655:	83 ec 0c             	sub    $0xc,%esp
 658:	ff 75 e4             	pushl  -0x1c(%ebp)
 65b:	e8 dd fc ff ff       	call   33d <sbrk>
 660:	83 c4 10             	add    $0x10,%esp
 663:	83 f8 ff             	cmp    $0xffffffff,%eax
 666:	74 1b                	je     683 <malloc+0x87>
 668:	89 58 04             	mov    %ebx,0x4(%eax)
 66b:	83 ec 0c             	sub    $0xc,%esp
 66e:	83 c0 08             	add    $0x8,%eax
 671:	50                   	push   %eax
 672:	e8 05 ff ff ff       	call   57c <free>
 677:	a1 40 0a 00 00       	mov    0xa40,%eax
 67c:	83 c4 10             	add    $0x10,%esp
 67f:	85 c0                	test   %eax,%eax
 681:	75 bd                	jne    640 <malloc+0x44>
 683:	31 c0                	xor    %eax,%eax
 685:	8d 65 f4             	lea    -0xc(%ebp),%esp
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5f                   	pop    %edi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	89 c2                	mov    %eax,%edx
 68f:	89 f8                	mov    %edi,%eax
 691:	8d 76 00             	lea    0x0(%esi),%esi
 694:	39 ce                	cmp    %ecx,%esi
 696:	74 54                	je     6ec <malloc+0xf0>
 698:	29 f1                	sub    %esi,%ecx
 69a:	89 4a 04             	mov    %ecx,0x4(%edx)
 69d:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
 6a0:	89 72 04             	mov    %esi,0x4(%edx)
 6a3:	a3 40 0a 00 00       	mov    %eax,0xa40
 6a8:	8d 42 08             	lea    0x8(%edx),%eax
 6ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5f                   	pop    %edi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	90                   	nop
 6b4:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6b9:	e9 76 ff ff ff       	jmp    634 <malloc+0x38>
 6be:	66 90                	xchg   %ax,%ax
 6c0:	c7 05 40 0a 00 00 44 	movl   $0xa44,0xa40
 6c7:	0a 00 00 
 6ca:	c7 05 44 0a 00 00 44 	movl   $0xa44,0xa44
 6d1:	0a 00 00 
 6d4:	c7 05 48 0a 00 00 00 	movl   $0x0,0xa48
 6db:	00 00 00 
 6de:	bf 44 0a 00 00       	mov    $0xa44,%edi
 6e3:	89 f8                	mov    %edi,%eax
 6e5:	e9 3c ff ff ff       	jmp    626 <malloc+0x2a>
 6ea:	66 90                	xchg   %ax,%ax
 6ec:	8b 0a                	mov    (%edx),%ecx
 6ee:	89 08                	mov    %ecx,(%eax)
 6f0:	eb b1                	jmp    6a3 <malloc+0xa7>
