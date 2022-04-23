
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 80 10 00       	mov    $0x108000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 a5 10 80       	mov    $0x8010a5c0,%esp
8010002d:	b8 f8 2a 10 80       	mov    $0x80102af8,%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	53                   	push   %ebx
80100038:	83 ec 0c             	sub    $0xc,%esp
8010003b:	68 80 65 10 80       	push   $0x80106580
80100040:	68 c0 a5 10 80       	push   $0x8010a5c0
80100045:	e8 82 3c 00 00       	call   80103ccc <initlock>
8010004a:	c7 05 0c ed 10 80 bc 	movl   $0x8010ecbc,0x8010ed0c
80100051:	ec 10 80 
80100054:	c7 05 10 ed 10 80 bc 	movl   $0x8010ecbc,0x8010ed10
8010005b:	ec 10 80 
8010005e:	83 c4 10             	add    $0x10,%esp
80100061:	b8 bc ec 10 80       	mov    $0x8010ecbc,%eax
80100066:	bb f4 a5 10 80       	mov    $0x8010a5f4,%ebx
8010006b:	eb 05                	jmp    80100072 <binit+0x3e>
8010006d:	8d 76 00             	lea    0x0(%esi),%esi
80100070:	89 d3                	mov    %edx,%ebx
80100072:	89 43 54             	mov    %eax,0x54(%ebx)
80100075:	c7 43 50 bc ec 10 80 	movl   $0x8010ecbc,0x50(%ebx)
8010007c:	83 ec 08             	sub    $0x8,%esp
8010007f:	68 87 65 10 80       	push   $0x80106587
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
80100087:	50                   	push   %eax
80100088:	e8 2f 3b 00 00       	call   80103bbc <initsleeplock>
8010008d:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
80100092:	89 58 50             	mov    %ebx,0x50(%eax)
80100095:	89 1d 10 ed 10 80    	mov    %ebx,0x8010ed10
8010009b:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a1:	89 d8                	mov    %ebx,%eax
801000a3:	83 c4 10             	add    $0x10,%esp
801000a6:	81 fb 60 ea 10 80    	cmp    $0x8010ea60,%ebx
801000ac:	75 c2                	jne    80100070 <binit+0x3c>
801000ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000b1:	c9                   	leave  
801000b2:	c3                   	ret    
801000b3:	90                   	nop

801000b4 <bread>:
801000b4:	55                   	push   %ebp
801000b5:	89 e5                	mov    %esp,%ebp
801000b7:	57                   	push   %edi
801000b8:	56                   	push   %esi
801000b9:	53                   	push   %ebx
801000ba:	83 ec 18             	sub    $0x18,%esp
801000bd:	8b 7d 08             	mov    0x8(%ebp),%edi
801000c0:	8b 75 0c             	mov    0xc(%ebp),%esi
801000c3:	68 c0 a5 10 80       	push   $0x8010a5c0
801000c8:	e8 3f 3d 00 00       	call   80103e0c <acquire>
801000cd:	8b 1d 10 ed 10 80    	mov    0x8010ed10,%ebx
801000d3:	83 c4 10             	add    $0x10,%esp
801000d6:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
801000dc:	75 0d                	jne    801000eb <bread+0x37>
801000de:	eb 1c                	jmp    801000fc <bread+0x48>
801000e0:	8b 5b 54             	mov    0x54(%ebx),%ebx
801000e3:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
801000e9:	74 11                	je     801000fc <bread+0x48>
801000eb:	3b 7b 04             	cmp    0x4(%ebx),%edi
801000ee:	75 f0                	jne    801000e0 <bread+0x2c>
801000f0:	3b 73 08             	cmp    0x8(%ebx),%esi
801000f3:	75 eb                	jne    801000e0 <bread+0x2c>
801000f5:	ff 43 4c             	incl   0x4c(%ebx)
801000f8:	eb 3c                	jmp    80100136 <bread+0x82>
801000fa:	66 90                	xchg   %ax,%ax
801000fc:	8b 1d 0c ed 10 80    	mov    0x8010ed0c,%ebx
80100102:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
80100108:	75 0d                	jne    80100117 <bread+0x63>
8010010a:	eb 6c                	jmp    80100178 <bread+0xc4>
8010010c:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010010f:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
80100115:	74 61                	je     80100178 <bread+0xc4>
80100117:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010011a:	85 c0                	test   %eax,%eax
8010011c:	75 ee                	jne    8010010c <bread+0x58>
8010011e:	f6 03 04             	testb  $0x4,(%ebx)
80100121:	75 e9                	jne    8010010c <bread+0x58>
80100123:	89 7b 04             	mov    %edi,0x4(%ebx)
80100126:	89 73 08             	mov    %esi,0x8(%ebx)
80100129:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010012f:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80100136:	83 ec 0c             	sub    $0xc,%esp
80100139:	68 c0 a5 10 80       	push   $0x8010a5c0
8010013e:	e8 61 3d 00 00       	call   80103ea4 <release>
80100143:	8d 43 0c             	lea    0xc(%ebx),%eax
80100146:	89 04 24             	mov    %eax,(%esp)
80100149:	e8 a2 3a 00 00       	call   80103bf0 <acquiresleep>
8010014e:	83 c4 10             	add    $0x10,%esp
80100151:	f6 03 02             	testb  $0x2,(%ebx)
80100154:	74 0a                	je     80100160 <bread+0xac>
80100156:	89 d8                	mov    %ebx,%eax
80100158:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010015b:	5b                   	pop    %ebx
8010015c:	5e                   	pop    %esi
8010015d:	5f                   	pop    %edi
8010015e:	5d                   	pop    %ebp
8010015f:	c3                   	ret    
80100160:	83 ec 0c             	sub    $0xc,%esp
80100163:	53                   	push   %ebx
80100164:	e8 83 1d 00 00       	call   80101eec <iderw>
80100169:	83 c4 10             	add    $0x10,%esp
8010016c:	89 d8                	mov    %ebx,%eax
8010016e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100171:	5b                   	pop    %ebx
80100172:	5e                   	pop    %esi
80100173:	5f                   	pop    %edi
80100174:	5d                   	pop    %ebp
80100175:	c3                   	ret    
80100176:	66 90                	xchg   %ax,%ax
80100178:	83 ec 0c             	sub    $0xc,%esp
8010017b:	68 8e 65 10 80       	push   $0x8010658e
80100180:	e8 bb 01 00 00       	call   80100340 <panic>
80100185:	8d 76 00             	lea    0x0(%esi),%esi

80100188 <bwrite>:
80100188:	55                   	push   %ebp
80100189:	89 e5                	mov    %esp,%ebp
8010018b:	53                   	push   %ebx
8010018c:	83 ec 10             	sub    $0x10,%esp
8010018f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100192:	8d 43 0c             	lea    0xc(%ebx),%eax
80100195:	50                   	push   %eax
80100196:	e8 e5 3a 00 00       	call   80103c80 <holdingsleep>
8010019b:	83 c4 10             	add    $0x10,%esp
8010019e:	85 c0                	test   %eax,%eax
801001a0:	74 0f                	je     801001b1 <bwrite+0x29>
801001a2:	83 0b 04             	orl    $0x4,(%ebx)
801001a5:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001ab:	c9                   	leave  
801001ac:	e9 3b 1d 00 00       	jmp    80101eec <iderw>
801001b1:	83 ec 0c             	sub    $0xc,%esp
801001b4:	68 9f 65 10 80       	push   $0x8010659f
801001b9:	e8 82 01 00 00       	call   80100340 <panic>
801001be:	66 90                	xchg   %ax,%ax

801001c0 <brelse>:
801001c0:	55                   	push   %ebp
801001c1:	89 e5                	mov    %esp,%ebp
801001c3:	56                   	push   %esi
801001c4:	53                   	push   %ebx
801001c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001c8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001cb:	83 ec 0c             	sub    $0xc,%esp
801001ce:	56                   	push   %esi
801001cf:	e8 ac 3a 00 00       	call   80103c80 <holdingsleep>
801001d4:	83 c4 10             	add    $0x10,%esp
801001d7:	85 c0                	test   %eax,%eax
801001d9:	74 64                	je     8010023f <brelse+0x7f>
801001db:	83 ec 0c             	sub    $0xc,%esp
801001de:	56                   	push   %esi
801001df:	e8 60 3a 00 00       	call   80103c44 <releasesleep>
801001e4:	c7 04 24 c0 a5 10 80 	movl   $0x8010a5c0,(%esp)
801001eb:	e8 1c 3c 00 00       	call   80103e0c <acquire>
801001f0:	8b 43 4c             	mov    0x4c(%ebx),%eax
801001f3:	48                   	dec    %eax
801001f4:	89 43 4c             	mov    %eax,0x4c(%ebx)
801001f7:	83 c4 10             	add    $0x10,%esp
801001fa:	85 c0                	test   %eax,%eax
801001fc:	75 2f                	jne    8010022d <brelse+0x6d>
801001fe:	8b 43 54             	mov    0x54(%ebx),%eax
80100201:	8b 53 50             	mov    0x50(%ebx),%edx
80100204:	89 50 50             	mov    %edx,0x50(%eax)
80100207:	8b 43 50             	mov    0x50(%ebx),%eax
8010020a:	8b 53 54             	mov    0x54(%ebx),%edx
8010020d:	89 50 54             	mov    %edx,0x54(%eax)
80100210:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
80100215:	89 43 54             	mov    %eax,0x54(%ebx)
80100218:	c7 43 50 bc ec 10 80 	movl   $0x8010ecbc,0x50(%ebx)
8010021f:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
80100224:	89 58 50             	mov    %ebx,0x50(%eax)
80100227:	89 1d 10 ed 10 80    	mov    %ebx,0x8010ed10
8010022d:	c7 45 08 c0 a5 10 80 	movl   $0x8010a5c0,0x8(%ebp)
80100234:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100237:	5b                   	pop    %ebx
80100238:	5e                   	pop    %esi
80100239:	5d                   	pop    %ebp
8010023a:	e9 65 3c 00 00       	jmp    80103ea4 <release>
8010023f:	83 ec 0c             	sub    $0xc,%esp
80100242:	68 a6 65 10 80       	push   $0x801065a6
80100247:	e8 f4 00 00 00       	call   80100340 <panic>

8010024c <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
8010024c:	55                   	push   %ebp
8010024d:	89 e5                	mov    %esp,%ebp
8010024f:	57                   	push   %edi
80100250:	56                   	push   %esi
80100251:	53                   	push   %ebx
80100252:	83 ec 18             	sub    $0x18,%esp
80100255:	8b 5d 10             	mov    0x10(%ebp),%ebx
  uint target;
  int c;

  iunlock(ip);
80100258:	ff 75 08             	pushl  0x8(%ebp)
8010025b:	e8 c4 13 00 00       	call   80101624 <iunlock>
  target = n;
80100260:	89 de                	mov    %ebx,%esi
  acquire(&cons.lock);
80100262:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
80100269:	e8 9e 3b 00 00       	call   80103e0c <acquire>
  while(n > 0){
8010026e:	83 c4 10             	add    $0x10,%esp
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100271:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100274:	01 df                	add    %ebx,%edi
  while(n > 0){
80100276:	85 db                	test   %ebx,%ebx
80100278:	0f 8e 91 00 00 00    	jle    8010030f <consoleread+0xc3>
    while(input.r == input.w){
8010027e:	a1 a0 ef 10 80       	mov    0x8010efa0,%eax
80100283:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
80100289:	74 27                	je     801002b2 <consoleread+0x66>
8010028b:	eb 57                	jmp    801002e4 <consoleread+0x98>
8010028d:	8d 76 00             	lea    0x0(%esi),%esi
      sleep(&input.r, &cons.lock);
80100290:	83 ec 08             	sub    $0x8,%esp
80100293:	68 20 95 10 80       	push   $0x80109520
80100298:	68 a0 ef 10 80       	push   $0x8010efa0
8010029d:	e8 f2 35 00 00       	call   80103894 <sleep>
    while(input.r == input.w){
801002a2:	a1 a0 ef 10 80       	mov    0x8010efa0,%eax
801002a7:	83 c4 10             	add    $0x10,%esp
801002aa:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
801002b0:	75 32                	jne    801002e4 <consoleread+0x98>
      if(myproc()->killed){
801002b2:	e8 a9 30 00 00       	call   80103360 <myproc>
801002b7:	8b 48 28             	mov    0x28(%eax),%ecx
801002ba:	85 c9                	test   %ecx,%ecx
801002bc:	74 d2                	je     80100290 <consoleread+0x44>
        release(&cons.lock);
801002be:	83 ec 0c             	sub    $0xc,%esp
801002c1:	68 20 95 10 80       	push   $0x80109520
801002c6:	e8 d9 3b 00 00       	call   80103ea4 <release>
        ilock(ip);
801002cb:	5a                   	pop    %edx
801002cc:	ff 75 08             	pushl  0x8(%ebp)
801002cf:	e8 88 12 00 00       	call   8010155c <ilock>
        return -1;
801002d4:	83 c4 10             	add    $0x10,%esp
801002d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002df:	5b                   	pop    %ebx
801002e0:	5e                   	pop    %esi
801002e1:	5f                   	pop    %edi
801002e2:	5d                   	pop    %ebp
801002e3:	c3                   	ret    
    c = input.buf[input.r++ % INPUT_BUF];
801002e4:	8d 50 01             	lea    0x1(%eax),%edx
801002e7:	89 15 a0 ef 10 80    	mov    %edx,0x8010efa0
801002ed:	89 c2                	mov    %eax,%edx
801002ef:	83 e2 7f             	and    $0x7f,%edx
801002f2:	0f be 8a 20 ef 10 80 	movsbl -0x7fef10e0(%edx),%ecx
    if(c == C('D')){  // EOF
801002f9:	80 f9 04             	cmp    $0x4,%cl
801002fc:	74 36                	je     80100334 <consoleread+0xe8>
    *dst++ = c;
801002fe:	89 d8                	mov    %ebx,%eax
80100300:	f7 d8                	neg    %eax
80100302:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    --n;
80100305:	4b                   	dec    %ebx
    if(c == '\n')
80100306:	83 f9 0a             	cmp    $0xa,%ecx
80100309:	0f 85 67 ff ff ff    	jne    80100276 <consoleread+0x2a>
  release(&cons.lock);
8010030f:	83 ec 0c             	sub    $0xc,%esp
80100312:	68 20 95 10 80       	push   $0x80109520
80100317:	e8 88 3b 00 00       	call   80103ea4 <release>
  ilock(ip);
8010031c:	58                   	pop    %eax
8010031d:	ff 75 08             	pushl  0x8(%ebp)
80100320:	e8 37 12 00 00       	call   8010155c <ilock>
  return target - n;
80100325:	89 f0                	mov    %esi,%eax
80100327:	29 d8                	sub    %ebx,%eax
80100329:	83 c4 10             	add    $0x10,%esp
}
8010032c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010032f:	5b                   	pop    %ebx
80100330:	5e                   	pop    %esi
80100331:	5f                   	pop    %edi
80100332:	5d                   	pop    %ebp
80100333:	c3                   	ret    
      if(n < target){
80100334:	39 f3                	cmp    %esi,%ebx
80100336:	73 d7                	jae    8010030f <consoleread+0xc3>
        input.r--;
80100338:	a3 a0 ef 10 80       	mov    %eax,0x8010efa0
8010033d:	eb d0                	jmp    8010030f <consoleread+0xc3>
8010033f:	90                   	nop

80100340 <panic>:
{
80100340:	55                   	push   %ebp
80100341:	89 e5                	mov    %esp,%ebp
80100343:	56                   	push   %esi
80100344:	53                   	push   %ebx
80100345:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100348:	fa                   	cli    
  cons.locking = 0;
80100349:	c7 05 54 95 10 80 00 	movl   $0x0,0x80109554
80100350:	00 00 00 
  cprintf("lapicid %d: panic: ", lapicid());
80100353:	e8 04 21 00 00       	call   8010245c <lapicid>
80100358:	83 ec 08             	sub    $0x8,%esp
8010035b:	50                   	push   %eax
8010035c:	68 ad 65 10 80       	push   $0x801065ad
80100361:	e8 ba 02 00 00       	call   80100620 <cprintf>
  cprintf(s);
80100366:	58                   	pop    %eax
80100367:	ff 75 08             	pushl  0x8(%ebp)
8010036a:	e8 b1 02 00 00       	call   80100620 <cprintf>
  cprintf("\n");
8010036f:	c7 04 24 db 6e 10 80 	movl   $0x80106edb,(%esp)
80100376:	e8 a5 02 00 00       	call   80100620 <cprintf>
  getcallerpcs(&s, pcs);
8010037b:	5a                   	pop    %edx
8010037c:	59                   	pop    %ecx
8010037d:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100380:	53                   	push   %ebx
80100381:	8d 45 08             	lea    0x8(%ebp),%eax
80100384:	50                   	push   %eax
80100385:	e8 5e 39 00 00       	call   80103ce8 <getcallerpcs>
  for(i=0; i<10; i++)
8010038a:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010038d:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
80100390:	83 ec 08             	sub    $0x8,%esp
80100393:	ff 33                	pushl  (%ebx)
80100395:	68 c1 65 10 80       	push   $0x801065c1
8010039a:	e8 81 02 00 00       	call   80100620 <cprintf>
  for(i=0; i<10; i++)
8010039f:	83 c3 04             	add    $0x4,%ebx
801003a2:	83 c4 10             	add    $0x10,%esp
801003a5:	39 f3                	cmp    %esi,%ebx
801003a7:	75 e7                	jne    80100390 <panic+0x50>
  panicked = 1; // freeze other CPU
801003a9:	c7 05 58 95 10 80 01 	movl   $0x1,0x80109558
801003b0:	00 00 00 
  for(;;)
801003b3:	eb fe                	jmp    801003b3 <panic+0x73>
801003b5:	8d 76 00             	lea    0x0(%esi),%esi

801003b8 <consputc.part.0>:
consputc(int c)
801003b8:	55                   	push   %ebp
801003b9:	89 e5                	mov    %esp,%ebp
801003bb:	57                   	push   %edi
801003bc:	56                   	push   %esi
801003bd:	53                   	push   %ebx
801003be:	83 ec 1c             	sub    $0x1c,%esp
801003c1:	89 c6                	mov    %eax,%esi
  if(c == BACKSPACE){
801003c3:	3d 00 01 00 00       	cmp    $0x100,%eax
801003c8:	0f 84 ce 00 00 00    	je     8010049c <consputc.part.0+0xe4>
    uartputc(c);
801003ce:	83 ec 0c             	sub    $0xc,%esp
801003d1:	50                   	push   %eax
801003d2:	e8 95 4e 00 00       	call   8010526c <uartputc>
801003d7:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801003da:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
801003df:	b0 0e                	mov    $0xe,%al
801003e1:	89 ca                	mov    %ecx,%edx
801003e3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801003e4:	bb d5 03 00 00       	mov    $0x3d5,%ebx
801003e9:	89 da                	mov    %ebx,%edx
801003eb:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
801003ec:	0f b6 f8             	movzbl %al,%edi
801003ef:	c1 e7 08             	shl    $0x8,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801003f2:	b0 0f                	mov    $0xf,%al
801003f4:	89 ca                	mov    %ecx,%edx
801003f6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801003f7:	89 da                	mov    %ebx,%edx
801003f9:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
801003fa:	0f b6 c8             	movzbl %al,%ecx
801003fd:	09 f9                	or     %edi,%ecx
  if(c == '\n')
801003ff:	83 fe 0a             	cmp    $0xa,%esi
80100402:	0f 84 84 00 00 00    	je     8010048c <consputc.part.0+0xd4>
  else if(c == BACKSPACE){
80100408:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010040e:	74 6c                	je     8010047c <consputc.part.0+0xc4>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100410:	8d 59 01             	lea    0x1(%ecx),%ebx
80100413:	89 f0                	mov    %esi,%eax
80100415:	0f b6 f0             	movzbl %al,%esi
80100418:	81 ce 00 07 00 00    	or     $0x700,%esi
8010041e:	66 89 b4 09 00 80 0b 	mov    %si,-0x7ff48000(%ecx,%ecx,1)
80100425:	80 
  if(pos < 0 || pos > 25*80)
80100426:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010042c:	0f 8f ee 00 00 00    	jg     80100520 <consputc.part.0+0x168>
  if((pos/80) >= 24){  // Scroll up.
80100432:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
80100438:	0f 8f 8a 00 00 00    	jg     801004c8 <consputc.part.0+0x110>
8010043e:	0f b6 c7             	movzbl %bh,%eax
80100441:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100444:	89 de                	mov    %ebx,%esi
80100446:	01 db                	add    %ebx,%ebx
80100448:	8d bb 00 80 0b 80    	lea    -0x7ff48000(%ebx),%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010044e:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100453:	b0 0e                	mov    $0xe,%al
80100455:	89 da                	mov    %ebx,%edx
80100457:	ee                   	out    %al,(%dx)
80100458:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
8010045d:	8a 45 e4             	mov    -0x1c(%ebp),%al
80100460:	89 ca                	mov    %ecx,%edx
80100462:	ee                   	out    %al,(%dx)
80100463:	b0 0f                	mov    $0xf,%al
80100465:	89 da                	mov    %ebx,%edx
80100467:	ee                   	out    %al,(%dx)
80100468:	89 f0                	mov    %esi,%eax
8010046a:	89 ca                	mov    %ecx,%edx
8010046c:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
8010046d:	66 c7 07 20 07       	movw   $0x720,(%edi)
}
80100472:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100475:	5b                   	pop    %ebx
80100476:	5e                   	pop    %esi
80100477:	5f                   	pop    %edi
80100478:	5d                   	pop    %ebp
80100479:	c3                   	ret    
8010047a:	66 90                	xchg   %ax,%ax
    if(pos > 0) --pos;
8010047c:	85 c9                	test   %ecx,%ecx
8010047e:	0f 84 8c 00 00 00    	je     80100510 <consputc.part.0+0x158>
80100484:	8d 59 ff             	lea    -0x1(%ecx),%ebx
80100487:	eb 9d                	jmp    80100426 <consputc.part.0+0x6e>
80100489:	8d 76 00             	lea    0x0(%esi),%esi
    pos += 80 - pos%80;
8010048c:	bb 50 00 00 00       	mov    $0x50,%ebx
80100491:	89 c8                	mov    %ecx,%eax
80100493:	99                   	cltd   
80100494:	f7 fb                	idiv   %ebx
80100496:	29 d3                	sub    %edx,%ebx
80100498:	01 cb                	add    %ecx,%ebx
8010049a:	eb 8a                	jmp    80100426 <consputc.part.0+0x6e>
    uartputc('\b'); uartputc(' '); uartputc('\b');
8010049c:	83 ec 0c             	sub    $0xc,%esp
8010049f:	6a 08                	push   $0x8
801004a1:	e8 c6 4d 00 00       	call   8010526c <uartputc>
801004a6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004ad:	e8 ba 4d 00 00       	call   8010526c <uartputc>
801004b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004b9:	e8 ae 4d 00 00       	call   8010526c <uartputc>
801004be:	83 c4 10             	add    $0x10,%esp
801004c1:	e9 14 ff ff ff       	jmp    801003da <consputc.part.0+0x22>
801004c6:	66 90                	xchg   %ax,%ax
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004c8:	50                   	push   %eax
801004c9:	68 60 0e 00 00       	push   $0xe60
801004ce:	68 a0 80 0b 80       	push   $0x800b80a0
801004d3:	68 00 80 0b 80       	push   $0x800b8000
801004d8:	e8 93 3a 00 00       	call   80103f70 <memmove>
    pos -= 80;
801004dd:	8d 73 b0             	lea    -0x50(%ebx),%esi
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004e0:	8d 84 1b 60 ff ff ff 	lea    -0xa0(%ebx,%ebx,1),%eax
801004e7:	8d b8 00 80 0b 80    	lea    -0x7ff48000(%eax),%edi
801004ed:	83 c4 0c             	add    $0xc,%esp
801004f0:	b8 80 07 00 00       	mov    $0x780,%eax
801004f5:	29 f0                	sub    %esi,%eax
801004f7:	01 c0                	add    %eax,%eax
801004f9:	50                   	push   %eax
801004fa:	6a 00                	push   $0x0
801004fc:	57                   	push   %edi
801004fd:	e8 ea 39 00 00       	call   80103eec <memset>
80100502:	83 c4 10             	add    $0x10,%esp
80100505:	c6 45 e4 07          	movb   $0x7,-0x1c(%ebp)
80100509:	e9 40 ff ff ff       	jmp    8010044e <consputc.part.0+0x96>
8010050e:	66 90                	xchg   %ax,%ax
80100510:	bf 00 80 0b 80       	mov    $0x800b8000,%edi
80100515:	31 f6                	xor    %esi,%esi
80100517:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
8010051b:	e9 2e ff ff ff       	jmp    8010044e <consputc.part.0+0x96>
    panic("pos under/overflow");
80100520:	83 ec 0c             	sub    $0xc,%esp
80100523:	68 c5 65 10 80       	push   $0x801065c5
80100528:	e8 13 fe ff ff       	call   80100340 <panic>
8010052d:	8d 76 00             	lea    0x0(%esi),%esi

80100530 <printint>:
{
80100530:	55                   	push   %ebp
80100531:	89 e5                	mov    %esp,%ebp
80100533:	57                   	push   %edi
80100534:	56                   	push   %esi
80100535:	53                   	push   %ebx
80100536:	83 ec 2c             	sub    $0x2c,%esp
80100539:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
8010053c:	85 c9                	test   %ecx,%ecx
8010053e:	74 04                	je     80100544 <printint+0x14>
80100540:	85 c0                	test   %eax,%eax
80100542:	78 5e                	js     801005a2 <printint+0x72>
    x = xx;
80100544:	89 c1                	mov    %eax,%ecx
80100546:	31 db                	xor    %ebx,%ebx
  i = 0;
80100548:	31 ff                	xor    %edi,%edi
    buf[i++] = digits[x % base];
8010054a:	89 c8                	mov    %ecx,%eax
8010054c:	31 d2                	xor    %edx,%edx
8010054e:	f7 75 d4             	divl   -0x2c(%ebp)
80100551:	89 fe                	mov    %edi,%esi
80100553:	8d 7f 01             	lea    0x1(%edi),%edi
80100556:	8a 92 f0 65 10 80    	mov    -0x7fef9a10(%edx),%dl
8010055c:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
80100560:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80100563:	89 c1                	mov    %eax,%ecx
80100565:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80100568:	39 45 d0             	cmp    %eax,-0x30(%ebp)
8010056b:	73 dd                	jae    8010054a <printint+0x1a>
  if(sign)
8010056d:	85 db                	test   %ebx,%ebx
8010056f:	74 09                	je     8010057a <printint+0x4a>
    buf[i++] = '-';
80100571:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
80100576:	89 fe                	mov    %edi,%esi
    buf[i++] = '-';
80100578:	b2 2d                	mov    $0x2d,%dl
  while(--i >= 0)
8010057a:	8d 5c 35 d7          	lea    -0x29(%ebp,%esi,1),%ebx
8010057e:	0f be c2             	movsbl %dl,%eax
  if(panicked){
80100581:	8b 15 58 95 10 80    	mov    0x80109558,%edx
80100587:	85 d2                	test   %edx,%edx
80100589:	74 05                	je     80100590 <printint+0x60>
  asm volatile("cli");
8010058b:	fa                   	cli    
    for(;;)
8010058c:	eb fe                	jmp    8010058c <printint+0x5c>
8010058e:	66 90                	xchg   %ax,%ax
80100590:	e8 23 fe ff ff       	call   801003b8 <consputc.part.0>
  while(--i >= 0)
80100595:	8d 45 d7             	lea    -0x29(%ebp),%eax
80100598:	39 c3                	cmp    %eax,%ebx
8010059a:	74 0e                	je     801005aa <printint+0x7a>
8010059c:	0f be 03             	movsbl (%ebx),%eax
8010059f:	4b                   	dec    %ebx
801005a0:	eb df                	jmp    80100581 <printint+0x51>
801005a2:	89 cb                	mov    %ecx,%ebx
    x = -xx;
801005a4:	f7 d8                	neg    %eax
801005a6:	89 c1                	mov    %eax,%ecx
801005a8:	eb 9e                	jmp    80100548 <printint+0x18>
}
801005aa:	83 c4 2c             	add    $0x2c,%esp
801005ad:	5b                   	pop    %ebx
801005ae:	5e                   	pop    %esi
801005af:	5f                   	pop    %edi
801005b0:	5d                   	pop    %ebp
801005b1:	c3                   	ret    
801005b2:	66 90                	xchg   %ax,%ax

801005b4 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005b4:	55                   	push   %ebp
801005b5:	89 e5                	mov    %esp,%ebp
801005b7:	57                   	push   %edi
801005b8:	56                   	push   %esi
801005b9:	53                   	push   %ebx
801005ba:	83 ec 18             	sub    $0x18,%esp
801005bd:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i;

  iunlock(ip);
801005c0:	ff 75 08             	pushl  0x8(%ebp)
801005c3:	e8 5c 10 00 00       	call   80101624 <iunlock>
  acquire(&cons.lock);
801005c8:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
801005cf:	e8 38 38 00 00       	call   80103e0c <acquire>
  for(i = 0; i < n; i++)
801005d4:	83 c4 10             	add    $0x10,%esp
801005d7:	85 ff                	test   %edi,%edi
801005d9:	7e 22                	jle    801005fd <consolewrite+0x49>
801005db:	8b 75 0c             	mov    0xc(%ebp),%esi
801005de:	8d 1c 3e             	lea    (%esi,%edi,1),%ebx
  if(panicked){
801005e1:	8b 15 58 95 10 80    	mov    0x80109558,%edx
801005e7:	85 d2                	test   %edx,%edx
801005e9:	74 05                	je     801005f0 <consolewrite+0x3c>
801005eb:	fa                   	cli    
    for(;;)
801005ec:	eb fe                	jmp    801005ec <consolewrite+0x38>
801005ee:	66 90                	xchg   %ax,%ax
    consputc(buf[i] & 0xff);
801005f0:	0f b6 06             	movzbl (%esi),%eax
801005f3:	e8 c0 fd ff ff       	call   801003b8 <consputc.part.0>
  for(i = 0; i < n; i++)
801005f8:	46                   	inc    %esi
801005f9:	39 f3                	cmp    %esi,%ebx
801005fb:	75 e4                	jne    801005e1 <consolewrite+0x2d>
  release(&cons.lock);
801005fd:	83 ec 0c             	sub    $0xc,%esp
80100600:	68 20 95 10 80       	push   $0x80109520
80100605:	e8 9a 38 00 00       	call   80103ea4 <release>
  ilock(ip);
8010060a:	58                   	pop    %eax
8010060b:	ff 75 08             	pushl  0x8(%ebp)
8010060e:	e8 49 0f 00 00       	call   8010155c <ilock>

  return n;
}
80100613:	89 f8                	mov    %edi,%eax
80100615:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100618:	5b                   	pop    %ebx
80100619:	5e                   	pop    %esi
8010061a:	5f                   	pop    %edi
8010061b:	5d                   	pop    %ebp
8010061c:	c3                   	ret    
8010061d:	8d 76 00             	lea    0x0(%esi),%esi

80100620 <cprintf>:
{
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	57                   	push   %edi
80100624:	56                   	push   %esi
80100625:	53                   	push   %ebx
80100626:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100629:	a1 54 95 10 80       	mov    0x80109554,%eax
8010062e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100631:	85 c0                	test   %eax,%eax
80100633:	0f 85 dc 00 00 00    	jne    80100715 <cprintf+0xf5>
  if (fmt == 0)
80100639:	8b 75 08             	mov    0x8(%ebp),%esi
8010063c:	85 f6                	test   %esi,%esi
8010063e:	0f 84 49 01 00 00    	je     8010078d <cprintf+0x16d>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100644:	0f b6 06             	movzbl (%esi),%eax
80100647:	85 c0                	test   %eax,%eax
80100649:	74 35                	je     80100680 <cprintf+0x60>
  argp = (uint*)(void*)(&fmt + 1);
8010064b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010064e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    if(c != '%'){
80100655:	83 f8 25             	cmp    $0x25,%eax
80100658:	74 3a                	je     80100694 <cprintf+0x74>
  if(panicked){
8010065a:	8b 0d 58 95 10 80    	mov    0x80109558,%ecx
80100660:	85 c9                	test   %ecx,%ecx
80100662:	74 09                	je     8010066d <cprintf+0x4d>
80100664:	fa                   	cli    
    for(;;)
80100665:	eb fe                	jmp    80100665 <cprintf+0x45>
80100667:	90                   	nop
80100668:	b8 25 00 00 00       	mov    $0x25,%eax
8010066d:	e8 46 fd ff ff       	call   801003b8 <consputc.part.0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100672:	ff 45 e4             	incl   -0x1c(%ebp)
80100675:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100678:	0f b6 04 06          	movzbl (%esi,%eax,1),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	75 d5                	jne    80100655 <cprintf+0x35>
  if(locking)
80100680:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100683:	85 c0                	test   %eax,%eax
80100685:	0f 85 ed 00 00 00    	jne    80100778 <cprintf+0x158>
}
8010068b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010068e:	5b                   	pop    %ebx
8010068f:	5e                   	pop    %esi
80100690:	5f                   	pop    %edi
80100691:	5d                   	pop    %ebp
80100692:	c3                   	ret    
80100693:	90                   	nop
    c = fmt[++i] & 0xff;
80100694:	ff 45 e4             	incl   -0x1c(%ebp)
80100697:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010069a:	0f b6 3c 06          	movzbl (%esi,%eax,1),%edi
    if(c == 0)
8010069e:	85 ff                	test   %edi,%edi
801006a0:	74 de                	je     80100680 <cprintf+0x60>
    switch(c){
801006a2:	83 ff 70             	cmp    $0x70,%edi
801006a5:	74 56                	je     801006fd <cprintf+0xdd>
801006a7:	7f 2a                	jg     801006d3 <cprintf+0xb3>
801006a9:	83 ff 25             	cmp    $0x25,%edi
801006ac:	0f 84 8c 00 00 00    	je     8010073e <cprintf+0x11e>
801006b2:	83 ff 64             	cmp    $0x64,%edi
801006b5:	0f 85 95 00 00 00    	jne    80100750 <cprintf+0x130>
      printint(*argp++, 10, 1);
801006bb:	8d 7b 04             	lea    0x4(%ebx),%edi
801006be:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c3:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c8:	8b 03                	mov    (%ebx),%eax
801006ca:	e8 61 fe ff ff       	call   80100530 <printint>
801006cf:	89 fb                	mov    %edi,%ebx
      break;
801006d1:	eb 9f                	jmp    80100672 <cprintf+0x52>
    switch(c){
801006d3:	83 ff 73             	cmp    $0x73,%edi
801006d6:	75 20                	jne    801006f8 <cprintf+0xd8>
      if((s = (char*)*argp++) == 0)
801006d8:	8d 7b 04             	lea    0x4(%ebx),%edi
801006db:	8b 1b                	mov    (%ebx),%ebx
801006dd:	85 db                	test   %ebx,%ebx
801006df:	75 4f                	jne    80100730 <cprintf+0x110>
        s = "(null)";
801006e1:	bb d8 65 10 80       	mov    $0x801065d8,%ebx
      for(; *s; s++)
801006e6:	b8 28 00 00 00       	mov    $0x28,%eax
  if(panicked){
801006eb:	8b 15 58 95 10 80    	mov    0x80109558,%edx
801006f1:	85 d2                	test   %edx,%edx
801006f3:	74 35                	je     8010072a <cprintf+0x10a>
801006f5:	fa                   	cli    
    for(;;)
801006f6:	eb fe                	jmp    801006f6 <cprintf+0xd6>
    switch(c){
801006f8:	83 ff 78             	cmp    $0x78,%edi
801006fb:	75 53                	jne    80100750 <cprintf+0x130>
      printint(*argp++, 16, 0);
801006fd:	8d 7b 04             	lea    0x4(%ebx),%edi
80100700:	31 c9                	xor    %ecx,%ecx
80100702:	ba 10 00 00 00       	mov    $0x10,%edx
80100707:	8b 03                	mov    (%ebx),%eax
80100709:	e8 22 fe ff ff       	call   80100530 <printint>
8010070e:	89 fb                	mov    %edi,%ebx
      break;
80100710:	e9 5d ff ff ff       	jmp    80100672 <cprintf+0x52>
    acquire(&cons.lock);
80100715:	83 ec 0c             	sub    $0xc,%esp
80100718:	68 20 95 10 80       	push   $0x80109520
8010071d:	e8 ea 36 00 00       	call   80103e0c <acquire>
80100722:	83 c4 10             	add    $0x10,%esp
80100725:	e9 0f ff ff ff       	jmp    80100639 <cprintf+0x19>
8010072a:	e8 89 fc ff ff       	call   801003b8 <consputc.part.0>
      for(; *s; s++)
8010072f:	43                   	inc    %ebx
80100730:	0f be 03             	movsbl (%ebx),%eax
80100733:	84 c0                	test   %al,%al
80100735:	75 b4                	jne    801006eb <cprintf+0xcb>
      if((s = (char*)*argp++) == 0)
80100737:	89 fb                	mov    %edi,%ebx
80100739:	e9 34 ff ff ff       	jmp    80100672 <cprintf+0x52>
  if(panicked){
8010073e:	8b 3d 58 95 10 80    	mov    0x80109558,%edi
80100744:	85 ff                	test   %edi,%edi
80100746:	0f 84 1c ff ff ff    	je     80100668 <cprintf+0x48>
8010074c:	fa                   	cli    
    for(;;)
8010074d:	eb fe                	jmp    8010074d <cprintf+0x12d>
8010074f:	90                   	nop
  if(panicked){
80100750:	8b 0d 58 95 10 80    	mov    0x80109558,%ecx
80100756:	85 c9                	test   %ecx,%ecx
80100758:	74 06                	je     80100760 <cprintf+0x140>
8010075a:	fa                   	cli    
    for(;;)
8010075b:	eb fe                	jmp    8010075b <cprintf+0x13b>
8010075d:	8d 76 00             	lea    0x0(%esi),%esi
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 4e fc ff ff       	call   801003b8 <consputc.part.0>
  if(panicked){
8010076a:	8b 15 58 95 10 80    	mov    0x80109558,%edx
80100770:	85 d2                	test   %edx,%edx
80100772:	74 28                	je     8010079c <cprintf+0x17c>
80100774:	fa                   	cli    
    for(;;)
80100775:	eb fe                	jmp    80100775 <cprintf+0x155>
80100777:	90                   	nop
    release(&cons.lock);
80100778:	83 ec 0c             	sub    $0xc,%esp
8010077b:	68 20 95 10 80       	push   $0x80109520
80100780:	e8 1f 37 00 00       	call   80103ea4 <release>
80100785:	83 c4 10             	add    $0x10,%esp
}
80100788:	e9 fe fe ff ff       	jmp    8010068b <cprintf+0x6b>
    panic("null fmt");
8010078d:	83 ec 0c             	sub    $0xc,%esp
80100790:	68 df 65 10 80       	push   $0x801065df
80100795:	e8 a6 fb ff ff       	call   80100340 <panic>
8010079a:	66 90                	xchg   %ax,%ax
8010079c:	89 f8                	mov    %edi,%eax
8010079e:	e8 15 fc ff ff       	call   801003b8 <consputc.part.0>
801007a3:	e9 ca fe ff ff       	jmp    80100672 <cprintf+0x52>

801007a8 <consoleintr>:
{
801007a8:	55                   	push   %ebp
801007a9:	89 e5                	mov    %esp,%ebp
801007ab:	57                   	push   %edi
801007ac:	56                   	push   %esi
801007ad:	53                   	push   %ebx
801007ae:	83 ec 18             	sub    $0x18,%esp
801007b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  acquire(&cons.lock);
801007b4:	68 20 95 10 80       	push   $0x80109520
801007b9:	e8 4e 36 00 00       	call   80103e0c <acquire>
  while((c = getc()) >= 0){
801007be:	83 c4 10             	add    $0x10,%esp
  int c, doprocdump = 0;
801007c1:	31 f6                	xor    %esi,%esi
  while((c = getc()) >= 0){
801007c3:	eb 17                	jmp    801007dc <consoleintr+0x34>
    switch(c){
801007c5:	83 fb 08             	cmp    $0x8,%ebx
801007c8:	0f 84 02 01 00 00    	je     801008d0 <consoleintr+0x128>
801007ce:	83 fb 10             	cmp    $0x10,%ebx
801007d1:	0f 85 1d 01 00 00    	jne    801008f4 <consoleintr+0x14c>
801007d7:	be 01 00 00 00       	mov    $0x1,%esi
  while((c = getc()) >= 0){
801007dc:	ff d7                	call   *%edi
801007de:	89 c3                	mov    %eax,%ebx
801007e0:	85 c0                	test   %eax,%eax
801007e2:	0f 88 2b 01 00 00    	js     80100913 <consoleintr+0x16b>
    switch(c){
801007e8:	83 fb 15             	cmp    $0x15,%ebx
801007eb:	0f 84 8b 00 00 00    	je     8010087c <consoleintr+0xd4>
801007f1:	7e d2                	jle    801007c5 <consoleintr+0x1d>
801007f3:	83 fb 7f             	cmp    $0x7f,%ebx
801007f6:	0f 84 d4 00 00 00    	je     801008d0 <consoleintr+0x128>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801007fc:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
80100801:	89 c2                	mov    %eax,%edx
80100803:	2b 15 a0 ef 10 80    	sub    0x8010efa0,%edx
80100809:	83 fa 7f             	cmp    $0x7f,%edx
8010080c:	77 ce                	ja     801007dc <consoleintr+0x34>
        c = (c == '\r') ? '\n' : c;
8010080e:	8b 15 58 95 10 80    	mov    0x80109558,%edx
80100814:	8d 48 01             	lea    0x1(%eax),%ecx
80100817:	83 e0 7f             	and    $0x7f,%eax
        input.buf[input.e++ % INPUT_BUF] = c;
8010081a:	89 0d a8 ef 10 80    	mov    %ecx,0x8010efa8
        c = (c == '\r') ? '\n' : c;
80100820:	83 fb 0d             	cmp    $0xd,%ebx
80100823:	0f 84 06 01 00 00    	je     8010092f <consoleintr+0x187>
        input.buf[input.e++ % INPUT_BUF] = c;
80100829:	88 98 20 ef 10 80    	mov    %bl,-0x7fef10e0(%eax)
  if(panicked){
8010082f:	85 d2                	test   %edx,%edx
80100831:	0f 85 03 01 00 00    	jne    8010093a <consoleintr+0x192>
80100837:	89 d8                	mov    %ebx,%eax
80100839:	e8 7a fb ff ff       	call   801003b8 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
8010083e:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
80100843:	83 fb 0a             	cmp    $0xa,%ebx
80100846:	74 19                	je     80100861 <consoleintr+0xb9>
80100848:	83 fb 04             	cmp    $0x4,%ebx
8010084b:	74 14                	je     80100861 <consoleintr+0xb9>
8010084d:	8b 0d a0 ef 10 80    	mov    0x8010efa0,%ecx
80100853:	8d 91 80 00 00 00    	lea    0x80(%ecx),%edx
80100859:	39 c2                	cmp    %eax,%edx
8010085b:	0f 85 7b ff ff ff    	jne    801007dc <consoleintr+0x34>
          input.w = input.e;
80100861:	a3 a4 ef 10 80       	mov    %eax,0x8010efa4
          wakeup(&input.r);
80100866:	83 ec 0c             	sub    $0xc,%esp
80100869:	68 a0 ef 10 80       	push   $0x8010efa0
8010086e:	e8 cd 31 00 00       	call   80103a40 <wakeup>
80100873:	83 c4 10             	add    $0x10,%esp
80100876:	e9 61 ff ff ff       	jmp    801007dc <consoleintr+0x34>
8010087b:	90                   	nop
      while(input.e != input.w &&
8010087c:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
80100881:	39 05 a4 ef 10 80    	cmp    %eax,0x8010efa4
80100887:	0f 84 4f ff ff ff    	je     801007dc <consoleintr+0x34>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
8010088d:	48                   	dec    %eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100893:	80 ba 20 ef 10 80 0a 	cmpb   $0xa,-0x7fef10e0(%edx)
8010089a:	0f 84 3c ff ff ff    	je     801007dc <consoleintr+0x34>
        input.e--;
801008a0:	a3 a8 ef 10 80       	mov    %eax,0x8010efa8
  if(panicked){
801008a5:	8b 15 58 95 10 80    	mov    0x80109558,%edx
801008ab:	85 d2                	test   %edx,%edx
801008ad:	74 05                	je     801008b4 <consoleintr+0x10c>
801008af:	fa                   	cli    
    for(;;)
801008b0:	eb fe                	jmp    801008b0 <consoleintr+0x108>
801008b2:	66 90                	xchg   %ax,%ax
801008b4:	b8 00 01 00 00       	mov    $0x100,%eax
801008b9:	e8 fa fa ff ff       	call   801003b8 <consputc.part.0>
      while(input.e != input.w &&
801008be:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
801008c3:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
801008c9:	75 c2                	jne    8010088d <consoleintr+0xe5>
801008cb:	e9 0c ff ff ff       	jmp    801007dc <consoleintr+0x34>
      if(input.e != input.w){
801008d0:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
801008d5:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
801008db:	0f 84 fb fe ff ff    	je     801007dc <consoleintr+0x34>
        input.e--;
801008e1:	48                   	dec    %eax
801008e2:	a3 a8 ef 10 80       	mov    %eax,0x8010efa8
  if(panicked){
801008e7:	a1 58 95 10 80       	mov    0x80109558,%eax
801008ec:	85 c0                	test   %eax,%eax
801008ee:	74 14                	je     80100904 <consoleintr+0x15c>
801008f0:	fa                   	cli    
    for(;;)
801008f1:	eb fe                	jmp    801008f1 <consoleintr+0x149>
801008f3:	90                   	nop
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008f4:	85 db                	test   %ebx,%ebx
801008f6:	0f 84 e0 fe ff ff    	je     801007dc <consoleintr+0x34>
801008fc:	e9 fb fe ff ff       	jmp    801007fc <consoleintr+0x54>
80100901:	8d 76 00             	lea    0x0(%esi),%esi
80100904:	b8 00 01 00 00       	mov    $0x100,%eax
80100909:	e8 aa fa ff ff       	call   801003b8 <consputc.part.0>
8010090e:	e9 c9 fe ff ff       	jmp    801007dc <consoleintr+0x34>
  release(&cons.lock);
80100913:	83 ec 0c             	sub    $0xc,%esp
80100916:	68 20 95 10 80       	push   $0x80109520
8010091b:	e8 84 35 00 00       	call   80103ea4 <release>
  if(doprocdump) {
80100920:	83 c4 10             	add    $0x10,%esp
80100923:	85 f6                	test   %esi,%esi
80100925:	75 19                	jne    80100940 <consoleintr+0x198>
}
80100927:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010092a:	5b                   	pop    %ebx
8010092b:	5e                   	pop    %esi
8010092c:	5f                   	pop    %edi
8010092d:	5d                   	pop    %ebp
8010092e:	c3                   	ret    
        input.buf[input.e++ % INPUT_BUF] = c;
8010092f:	c6 80 20 ef 10 80 0a 	movb   $0xa,-0x7fef10e0(%eax)
  if(panicked){
80100936:	85 d2                	test   %edx,%edx
80100938:	74 12                	je     8010094c <consoleintr+0x1a4>
8010093a:	fa                   	cli    
    for(;;)
8010093b:	eb fe                	jmp    8010093b <consoleintr+0x193>
8010093d:	8d 76 00             	lea    0x0(%esi),%esi
}
80100940:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100943:	5b                   	pop    %ebx
80100944:	5e                   	pop    %esi
80100945:	5f                   	pop    %edi
80100946:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100947:	e9 c4 31 00 00       	jmp    80103b10 <procdump>
8010094c:	b8 0a 00 00 00       	mov    $0xa,%eax
80100951:	e8 62 fa ff ff       	call   801003b8 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100956:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
8010095b:	e9 01 ff ff ff       	jmp    80100861 <consoleintr+0xb9>

80100960 <consoleinit>:

void
consoleinit(void)
{
80100960:	55                   	push   %ebp
80100961:	89 e5                	mov    %esp,%ebp
80100963:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100966:	68 e8 65 10 80       	push   $0x801065e8
8010096b:	68 20 95 10 80       	push   $0x80109520
80100970:	e8 57 33 00 00       	call   80103ccc <initlock>

  devsw[CONSOLE].write = consolewrite;
80100975:	c7 05 6c f9 10 80 b4 	movl   $0x801005b4,0x8010f96c
8010097c:	05 10 80 
  devsw[CONSOLE].read = consoleread;
8010097f:	c7 05 68 f9 10 80 4c 	movl   $0x8010024c,0x8010f968
80100986:	02 10 80 
  cons.locking = 1;
80100989:	c7 05 54 95 10 80 01 	movl   $0x1,0x80109554
80100990:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
80100993:	58                   	pop    %eax
80100994:	5a                   	pop    %edx
80100995:	6a 00                	push   $0x0
80100997:	6a 01                	push   $0x1
80100999:	e8 d2 16 00 00       	call   80102070 <ioapicenable>
}
8010099e:	83 c4 10             	add    $0x10,%esp
801009a1:	c9                   	leave  
801009a2:	c3                   	ret    
801009a3:	90                   	nop

801009a4 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009a4:	55                   	push   %ebp
801009a5:	89 e5                	mov    %esp,%ebp
801009a7:	57                   	push   %edi
801009a8:	56                   	push   %esi
801009a9:	53                   	push   %ebx
801009aa:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009b0:	e8 ab 29 00 00       	call   80103360 <myproc>
801009b5:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
801009bb:	e8 7c 1e 00 00       	call   8010283c <begin_op>

  if((ip = namei(path)) == 0){
801009c0:	83 ec 0c             	sub    $0xc,%esp
801009c3:	ff 75 08             	pushl  0x8(%ebp)
801009c6:	e8 45 13 00 00       	call   80101d10 <namei>
801009cb:	83 c4 10             	add    $0x10,%esp
801009ce:	85 c0                	test   %eax,%eax
801009d0:	0f 84 da 02 00 00    	je     80100cb0 <exec+0x30c>
801009d6:	89 c3                	mov    %eax,%ebx
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
801009d8:	83 ec 0c             	sub    $0xc,%esp
801009db:	50                   	push   %eax
801009dc:	e8 7b 0b 00 00       	call   8010155c <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
801009e1:	6a 34                	push   $0x34
801009e3:	6a 00                	push   $0x0
801009e5:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
801009eb:	50                   	push   %eax
801009ec:	53                   	push   %ebx
801009ed:	e8 0e 0e 00 00       	call   80101800 <readi>
801009f2:	83 c4 20             	add    $0x20,%esp
801009f5:	83 f8 34             	cmp    $0x34,%eax
801009f8:	74 1e                	je     80100a18 <exec+0x74>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
801009fa:	83 ec 0c             	sub    $0xc,%esp
801009fd:	53                   	push   %ebx
801009fe:	e8 b1 0d 00 00       	call   801017b4 <iunlockput>
    end_op();
80100a03:	e8 9c 1e 00 00       	call   801028a4 <end_op>
80100a08:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a13:	5b                   	pop    %ebx
80100a14:	5e                   	pop    %esi
80100a15:	5f                   	pop    %edi
80100a16:	5d                   	pop    %ebp
80100a17:	c3                   	ret    
  if(elf.magic != ELF_MAGIC)
80100a18:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a1f:	45 4c 46 
80100a22:	75 d6                	jne    801009fa <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100a24:	e8 f3 58 00 00       	call   8010631c <setupkvm>
80100a29:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a2f:	85 c0                	test   %eax,%eax
80100a31:	74 c7                	je     801009fa <exec+0x56>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a33:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
  sz = 0;
80100a39:	31 ff                	xor    %edi,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a3b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a42:	00 
80100a43:	0f 84 86 02 00 00    	je     80100ccf <exec+0x32b>
80100a49:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
80100a50:	00 00 00 
80100a53:	e9 84 00 00 00       	jmp    80100adc <exec+0x138>
    if(ph.type != ELF_PROG_LOAD)
80100a58:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100a5f:	75 61                	jne    80100ac2 <exec+0x11e>
    if(ph.memsz < ph.filesz)
80100a61:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100a67:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100a6d:	0f 82 85 00 00 00    	jb     80100af8 <exec+0x154>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100a73:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100a79:	72 7d                	jb     80100af8 <exec+0x154>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100a7b:	51                   	push   %ecx
80100a7c:	50                   	push   %eax
80100a7d:	57                   	push   %edi
80100a7e:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100a84:	e8 df 56 00 00       	call   80106168 <allocuvm>
80100a89:	89 c7                	mov    %eax,%edi
80100a8b:	83 c4 10             	add    $0x10,%esp
80100a8e:	85 c0                	test   %eax,%eax
80100a90:	74 66                	je     80100af8 <exec+0x154>
    if(ph.vaddr % PGSIZE != 0)
80100a92:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100a98:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100a9d:	75 59                	jne    80100af8 <exec+0x154>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100a9f:	83 ec 0c             	sub    $0xc,%esp
80100aa2:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100aa8:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100aae:	53                   	push   %ebx
80100aaf:	50                   	push   %eax
80100ab0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100ab6:	e8 f1 55 00 00       	call   801060ac <loaduvm>
80100abb:	83 c4 20             	add    $0x20,%esp
80100abe:	85 c0                	test   %eax,%eax
80100ac0:	78 36                	js     80100af8 <exec+0x154>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100ac2:	ff 85 f4 fe ff ff    	incl   -0x10c(%ebp)
80100ac8:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100ace:	83 c6 20             	add    $0x20,%esi
80100ad1:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100ad8:	39 c8                	cmp    %ecx,%eax
80100ada:	7e 34                	jle    80100b10 <exec+0x16c>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100adc:	6a 20                	push   $0x20
80100ade:	56                   	push   %esi
80100adf:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ae5:	50                   	push   %eax
80100ae6:	53                   	push   %ebx
80100ae7:	e8 14 0d 00 00       	call   80101800 <readi>
80100aec:	83 c4 10             	add    $0x10,%esp
80100aef:	83 f8 20             	cmp    $0x20,%eax
80100af2:	0f 84 60 ff ff ff    	je     80100a58 <exec+0xb4>
    freevm(pgdir);
80100af8:	83 ec 0c             	sub    $0xc,%esp
80100afb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b01:	e8 a6 57 00 00       	call   801062ac <freevm>
  if(ip){
80100b06:	83 c4 10             	add    $0x10,%esp
80100b09:	e9 ec fe ff ff       	jmp    801009fa <exec+0x56>
80100b0e:	66 90                	xchg   %ax,%ax
80100b10:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b16:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b1c:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100b22:	83 ec 0c             	sub    $0xc,%esp
80100b25:	53                   	push   %ebx
80100b26:	e8 89 0c 00 00       	call   801017b4 <iunlockput>
  end_op();
80100b2b:	e8 74 1d 00 00       	call   801028a4 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b30:	83 c4 0c             	add    $0xc,%esp
80100b33:	56                   	push   %esi
80100b34:	57                   	push   %edi
80100b35:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b3b:	56                   	push   %esi
80100b3c:	e8 27 56 00 00       	call   80106168 <allocuvm>
80100b41:	89 c7                	mov    %eax,%edi
80100b43:	83 c4 10             	add    $0x10,%esp
80100b46:	85 c0                	test   %eax,%eax
80100b48:	0f 84 8a 00 00 00    	je     80100bd8 <exec+0x234>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100b4e:	83 ec 08             	sub    $0x8,%esp
80100b51:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100b57:	50                   	push   %eax
80100b58:	56                   	push   %esi
80100b59:	e8 4e 58 00 00       	call   801063ac <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100b5e:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b61:	8b 00                	mov    (%eax),%eax
80100b63:	83 c4 10             	add    $0x10,%esp
80100b66:	89 fb                	mov    %edi,%ebx
80100b68:	31 f6                	xor    %esi,%esi
80100b6a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100b70:	85 c0                	test   %eax,%eax
80100b72:	0f 84 81 00 00 00    	je     80100bf9 <exec+0x255>
80100b78:	89 bd f4 fe ff ff    	mov    %edi,-0x10c(%ebp)
80100b7e:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100b84:	eb 1f                	jmp    80100ba5 <exec+0x201>
80100b86:	66 90                	xchg   %ax,%ax
    ustack[3+argc] = sp;
80100b88:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100b8e:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
  for(argc = 0; argv[argc]; argc++) {
80100b95:	46                   	inc    %esi
80100b96:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b99:	8b 04 b0             	mov    (%eax,%esi,4),%eax
80100b9c:	85 c0                	test   %eax,%eax
80100b9e:	74 53                	je     80100bf3 <exec+0x24f>
    if(argc >= MAXARG)
80100ba0:	83 fe 20             	cmp    $0x20,%esi
80100ba3:	74 33                	je     80100bd8 <exec+0x234>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ba5:	83 ec 0c             	sub    $0xc,%esp
80100ba8:	50                   	push   %eax
80100ba9:	e8 c6 34 00 00       	call   80104074 <strlen>
80100bae:	f7 d0                	not    %eax
80100bb0:	01 c3                	add    %eax,%ebx
80100bb2:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bb5:	5a                   	pop    %edx
80100bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bb9:	ff 34 b0             	pushl  (%eax,%esi,4)
80100bbc:	e8 b3 34 00 00       	call   80104074 <strlen>
80100bc1:	40                   	inc    %eax
80100bc2:	50                   	push   %eax
80100bc3:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bc6:	ff 34 b0             	pushl  (%eax,%esi,4)
80100bc9:	53                   	push   %ebx
80100bca:	57                   	push   %edi
80100bcb:	e8 1c 59 00 00       	call   801064ec <copyout>
80100bd0:	83 c4 20             	add    $0x20,%esp
80100bd3:	85 c0                	test   %eax,%eax
80100bd5:	79 b1                	jns    80100b88 <exec+0x1e4>
80100bd7:	90                   	nop
    freevm(pgdir);
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100be1:	e8 c6 56 00 00       	call   801062ac <freevm>
80100be6:	83 c4 10             	add    $0x10,%esp
  return -1;
80100be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bee:	e9 1d fe ff ff       	jmp    80100a10 <exec+0x6c>
80100bf3:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
  ustack[3+argc] = 0;
80100bf9:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80100c00:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100c04:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c0b:	ff ff ff 
  ustack[1] = argc;
80100c0e:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c14:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100c1b:	89 d9                	mov    %ebx,%ecx
80100c1d:	29 c1                	sub    %eax,%ecx
80100c1f:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  sp -= (3+argc+1) * 4;
80100c25:	83 c0 0c             	add    $0xc,%eax
80100c28:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c2a:	50                   	push   %eax
80100c2b:	52                   	push   %edx
80100c2c:	53                   	push   %ebx
80100c2d:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c33:	e8 b4 58 00 00       	call   801064ec <copyout>
80100c38:	83 c4 10             	add    $0x10,%esp
80100c3b:	85 c0                	test   %eax,%eax
80100c3d:	78 99                	js     80100bd8 <exec+0x234>
  for(last=s=path; *s; s++)
80100c3f:	8b 45 08             	mov    0x8(%ebp),%eax
80100c42:	8a 00                	mov    (%eax),%al
80100c44:	8b 55 08             	mov    0x8(%ebp),%edx
80100c47:	84 c0                	test   %al,%al
80100c49:	74 12                	je     80100c5d <exec+0x2b9>
80100c4b:	89 d1                	mov    %edx,%ecx
80100c4d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*s == '/')
80100c50:	41                   	inc    %ecx
80100c51:	3c 2f                	cmp    $0x2f,%al
80100c53:	75 02                	jne    80100c57 <exec+0x2b3>
80100c55:	89 ca                	mov    %ecx,%edx
  for(last=s=path; *s; s++)
80100c57:	8a 01                	mov    (%ecx),%al
80100c59:	84 c0                	test   %al,%al
80100c5b:	75 f3                	jne    80100c50 <exec+0x2ac>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100c5d:	50                   	push   %eax
80100c5e:	6a 10                	push   $0x10
80100c60:	52                   	push   %edx
80100c61:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c67:	89 f0                	mov    %esi,%eax
80100c69:	83 c0 70             	add    $0x70,%eax
80100c6c:	50                   	push   %eax
80100c6d:	e8 ce 33 00 00       	call   80104040 <safestrcpy>
  oldpgdir = curproc->pgdir;
80100c72:	89 f0                	mov    %esi,%eax
80100c74:	8b 76 04             	mov    0x4(%esi),%esi
  curproc->pgdir = pgdir;
80100c77:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100c7d:	89 50 04             	mov    %edx,0x4(%eax)
  curproc->sz = sz;
80100c80:	89 38                	mov    %edi,(%eax)
  curproc->tf->eip = elf.entry;  // main
80100c82:	89 c7                	mov    %eax,%edi
80100c84:	8b 40 18             	mov    0x18(%eax),%eax
80100c87:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100c8d:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100c90:	8b 47 18             	mov    0x18(%edi),%eax
80100c93:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100c96:	89 3c 24             	mov    %edi,(%esp)
80100c99:	e8 9e 52 00 00       	call   80105f3c <switchuvm>
  freevm(oldpgdir);
80100c9e:	89 34 24             	mov    %esi,(%esp)
80100ca1:	e8 06 56 00 00       	call   801062ac <freevm>
  return 0;
80100ca6:	83 c4 10             	add    $0x10,%esp
80100ca9:	31 c0                	xor    %eax,%eax
80100cab:	e9 60 fd ff ff       	jmp    80100a10 <exec+0x6c>
    end_op();
80100cb0:	e8 ef 1b 00 00       	call   801028a4 <end_op>
    cprintf("exec: fail\n");
80100cb5:	83 ec 0c             	sub    $0xc,%esp
80100cb8:	68 01 66 10 80       	push   $0x80106601
80100cbd:	e8 5e f9 ff ff       	call   80100620 <cprintf>
    return -1;
80100cc2:	83 c4 10             	add    $0x10,%esp
80100cc5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100cca:	e9 41 fd ff ff       	jmp    80100a10 <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100ccf:	be 00 20 00 00       	mov    $0x2000,%esi
80100cd4:	e9 49 fe ff ff       	jmp    80100b22 <exec+0x17e>
80100cd9:	66 90                	xchg   %ax,%ax
80100cdb:	90                   	nop

80100cdc <fileinit>:
80100cdc:	55                   	push   %ebp
80100cdd:	89 e5                	mov    %esp,%ebp
80100cdf:	83 ec 10             	sub    $0x10,%esp
80100ce2:	68 0d 66 10 80       	push   $0x8010660d
80100ce7:	68 c0 ef 10 80       	push   $0x8010efc0
80100cec:	e8 db 2f 00 00       	call   80103ccc <initlock>
80100cf1:	83 c4 10             	add    $0x10,%esp
80100cf4:	c9                   	leave  
80100cf5:	c3                   	ret    
80100cf6:	66 90                	xchg   %ax,%ax

80100cf8 <filealloc>:
80100cf8:	55                   	push   %ebp
80100cf9:	89 e5                	mov    %esp,%ebp
80100cfb:	83 ec 24             	sub    $0x24,%esp
80100cfe:	68 c0 ef 10 80       	push   $0x8010efc0
80100d03:	e8 04 31 00 00       	call   80103e0c <acquire>
80100d08:	83 c4 10             	add    $0x10,%esp
80100d0b:	b8 f4 ef 10 80       	mov    $0x8010eff4,%eax
80100d10:	eb 0c                	jmp    80100d1e <filealloc+0x26>
80100d12:	66 90                	xchg   %ax,%ax
80100d14:	83 c0 18             	add    $0x18,%eax
80100d17:	3d 54 f9 10 80       	cmp    $0x8010f954,%eax
80100d1c:	74 26                	je     80100d44 <filealloc+0x4c>
80100d1e:	8b 50 04             	mov    0x4(%eax),%edx
80100d21:	85 d2                	test   %edx,%edx
80100d23:	75 ef                	jne    80100d14 <filealloc+0x1c>
80100d25:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
80100d2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100d2f:	83 ec 0c             	sub    $0xc,%esp
80100d32:	68 c0 ef 10 80       	push   $0x8010efc0
80100d37:	e8 68 31 00 00       	call   80103ea4 <release>
80100d3c:	83 c4 10             	add    $0x10,%esp
80100d3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100d42:	c9                   	leave  
80100d43:	c3                   	ret    
80100d44:	83 ec 0c             	sub    $0xc,%esp
80100d47:	68 c0 ef 10 80       	push   $0x8010efc0
80100d4c:	e8 53 31 00 00       	call   80103ea4 <release>
80100d51:	83 c4 10             	add    $0x10,%esp
80100d54:	31 c0                	xor    %eax,%eax
80100d56:	c9                   	leave  
80100d57:	c3                   	ret    

80100d58 <filedup>:
80100d58:	55                   	push   %ebp
80100d59:	89 e5                	mov    %esp,%ebp
80100d5b:	53                   	push   %ebx
80100d5c:	83 ec 10             	sub    $0x10,%esp
80100d5f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100d62:	68 c0 ef 10 80       	push   $0x8010efc0
80100d67:	e8 a0 30 00 00       	call   80103e0c <acquire>
80100d6c:	8b 43 04             	mov    0x4(%ebx),%eax
80100d6f:	83 c4 10             	add    $0x10,%esp
80100d72:	85 c0                	test   %eax,%eax
80100d74:	7e 18                	jle    80100d8e <filedup+0x36>
80100d76:	40                   	inc    %eax
80100d77:	89 43 04             	mov    %eax,0x4(%ebx)
80100d7a:	83 ec 0c             	sub    $0xc,%esp
80100d7d:	68 c0 ef 10 80       	push   $0x8010efc0
80100d82:	e8 1d 31 00 00       	call   80103ea4 <release>
80100d87:	89 d8                	mov    %ebx,%eax
80100d89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d8c:	c9                   	leave  
80100d8d:	c3                   	ret    
80100d8e:	83 ec 0c             	sub    $0xc,%esp
80100d91:	68 14 66 10 80       	push   $0x80106614
80100d96:	e8 a5 f5 ff ff       	call   80100340 <panic>
80100d9b:	90                   	nop

80100d9c <fileclose>:
80100d9c:	55                   	push   %ebp
80100d9d:	89 e5                	mov    %esp,%ebp
80100d9f:	57                   	push   %edi
80100da0:	56                   	push   %esi
80100da1:	53                   	push   %ebx
80100da2:	83 ec 28             	sub    $0x28,%esp
80100da5:	8b 7d 08             	mov    0x8(%ebp),%edi
80100da8:	68 c0 ef 10 80       	push   $0x8010efc0
80100dad:	e8 5a 30 00 00       	call   80103e0c <acquire>
80100db2:	8b 57 04             	mov    0x4(%edi),%edx
80100db5:	83 c4 10             	add    $0x10,%esp
80100db8:	85 d2                	test   %edx,%edx
80100dba:	0f 8e 8d 00 00 00    	jle    80100e4d <fileclose+0xb1>
80100dc0:	4a                   	dec    %edx
80100dc1:	89 57 04             	mov    %edx,0x4(%edi)
80100dc4:	75 3a                	jne    80100e00 <fileclose+0x64>
80100dc6:	8b 1f                	mov    (%edi),%ebx
80100dc8:	8a 47 09             	mov    0x9(%edi),%al
80100dcb:	88 45 e7             	mov    %al,-0x19(%ebp)
80100dce:	8b 77 0c             	mov    0xc(%edi),%esi
80100dd1:	8b 47 10             	mov    0x10(%edi),%eax
80100dd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100dd7:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100ddd:	83 ec 0c             	sub    $0xc,%esp
80100de0:	68 c0 ef 10 80       	push   $0x8010efc0
80100de5:	e8 ba 30 00 00       	call   80103ea4 <release>
80100dea:	83 c4 10             	add    $0x10,%esp
80100ded:	83 fb 01             	cmp    $0x1,%ebx
80100df0:	74 42                	je     80100e34 <fileclose+0x98>
80100df2:	83 fb 02             	cmp    $0x2,%ebx
80100df5:	74 1d                	je     80100e14 <fileclose+0x78>
80100df7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100dfa:	5b                   	pop    %ebx
80100dfb:	5e                   	pop    %esi
80100dfc:	5f                   	pop    %edi
80100dfd:	5d                   	pop    %ebp
80100dfe:	c3                   	ret    
80100dff:	90                   	nop
80100e00:	c7 45 08 c0 ef 10 80 	movl   $0x8010efc0,0x8(%ebp)
80100e07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e0a:	5b                   	pop    %ebx
80100e0b:	5e                   	pop    %esi
80100e0c:	5f                   	pop    %edi
80100e0d:	5d                   	pop    %ebp
80100e0e:	e9 91 30 00 00       	jmp    80103ea4 <release>
80100e13:	90                   	nop
80100e14:	e8 23 1a 00 00       	call   8010283c <begin_op>
80100e19:	83 ec 0c             	sub    $0xc,%esp
80100e1c:	ff 75 e0             	pushl  -0x20(%ebp)
80100e1f:	e8 44 08 00 00       	call   80101668 <iput>
80100e24:	83 c4 10             	add    $0x10,%esp
80100e27:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e2a:	5b                   	pop    %ebx
80100e2b:	5e                   	pop    %esi
80100e2c:	5f                   	pop    %edi
80100e2d:	5d                   	pop    %ebp
80100e2e:	e9 71 1a 00 00       	jmp    801028a4 <end_op>
80100e33:	90                   	nop
80100e34:	83 ec 08             	sub    $0x8,%esp
80100e37:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80100e3b:	50                   	push   %eax
80100e3c:	56                   	push   %esi
80100e3d:	e8 ee 20 00 00       	call   80102f30 <pipeclose>
80100e42:	83 c4 10             	add    $0x10,%esp
80100e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e48:	5b                   	pop    %ebx
80100e49:	5e                   	pop    %esi
80100e4a:	5f                   	pop    %edi
80100e4b:	5d                   	pop    %ebp
80100e4c:	c3                   	ret    
80100e4d:	83 ec 0c             	sub    $0xc,%esp
80100e50:	68 1c 66 10 80       	push   $0x8010661c
80100e55:	e8 e6 f4 ff ff       	call   80100340 <panic>
80100e5a:	66 90                	xchg   %ax,%ax

80100e5c <filestat>:
80100e5c:	55                   	push   %ebp
80100e5d:	89 e5                	mov    %esp,%ebp
80100e5f:	53                   	push   %ebx
80100e60:	53                   	push   %ebx
80100e61:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e64:	83 3b 02             	cmpl   $0x2,(%ebx)
80100e67:	75 2b                	jne    80100e94 <filestat+0x38>
80100e69:	83 ec 0c             	sub    $0xc,%esp
80100e6c:	ff 73 10             	pushl  0x10(%ebx)
80100e6f:	e8 e8 06 00 00       	call   8010155c <ilock>
80100e74:	58                   	pop    %eax
80100e75:	5a                   	pop    %edx
80100e76:	ff 75 0c             	pushl  0xc(%ebp)
80100e79:	ff 73 10             	pushl  0x10(%ebx)
80100e7c:	e8 53 09 00 00       	call   801017d4 <stati>
80100e81:	59                   	pop    %ecx
80100e82:	ff 73 10             	pushl  0x10(%ebx)
80100e85:	e8 9a 07 00 00       	call   80101624 <iunlock>
80100e8a:	83 c4 10             	add    $0x10,%esp
80100e8d:	31 c0                	xor    %eax,%eax
80100e8f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e92:	c9                   	leave  
80100e93:	c3                   	ret    
80100e94:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100e99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e9c:	c9                   	leave  
80100e9d:	c3                   	ret    
80100e9e:	66 90                	xchg   %ax,%ax

80100ea0 <fileread>:
80100ea0:	55                   	push   %ebp
80100ea1:	89 e5                	mov    %esp,%ebp
80100ea3:	57                   	push   %edi
80100ea4:	56                   	push   %esi
80100ea5:	53                   	push   %ebx
80100ea6:	83 ec 1c             	sub    $0x1c,%esp
80100ea9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eac:	8b 75 0c             	mov    0xc(%ebp),%esi
80100eaf:	8b 7d 10             	mov    0x10(%ebp),%edi
80100eb2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100eb6:	74 60                	je     80100f18 <fileread+0x78>
80100eb8:	8b 03                	mov    (%ebx),%eax
80100eba:	83 f8 01             	cmp    $0x1,%eax
80100ebd:	74 45                	je     80100f04 <fileread+0x64>
80100ebf:	83 f8 02             	cmp    $0x2,%eax
80100ec2:	75 5b                	jne    80100f1f <fileread+0x7f>
80100ec4:	83 ec 0c             	sub    $0xc,%esp
80100ec7:	ff 73 10             	pushl  0x10(%ebx)
80100eca:	e8 8d 06 00 00       	call   8010155c <ilock>
80100ecf:	57                   	push   %edi
80100ed0:	ff 73 14             	pushl  0x14(%ebx)
80100ed3:	56                   	push   %esi
80100ed4:	ff 73 10             	pushl  0x10(%ebx)
80100ed7:	e8 24 09 00 00       	call   80101800 <readi>
80100edc:	83 c4 20             	add    $0x20,%esp
80100edf:	85 c0                	test   %eax,%eax
80100ee1:	7e 03                	jle    80100ee6 <fileread+0x46>
80100ee3:	01 43 14             	add    %eax,0x14(%ebx)
80100ee6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ee9:	83 ec 0c             	sub    $0xc,%esp
80100eec:	ff 73 10             	pushl  0x10(%ebx)
80100eef:	e8 30 07 00 00       	call   80101624 <iunlock>
80100ef4:	83 c4 10             	add    $0x10,%esp
80100ef7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100efa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100efd:	5b                   	pop    %ebx
80100efe:	5e                   	pop    %esi
80100eff:	5f                   	pop    %edi
80100f00:	5d                   	pop    %ebp
80100f01:	c3                   	ret    
80100f02:	66 90                	xchg   %ax,%ax
80100f04:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f07:	89 45 08             	mov    %eax,0x8(%ebp)
80100f0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f0d:	5b                   	pop    %ebx
80100f0e:	5e                   	pop    %esi
80100f0f:	5f                   	pop    %edi
80100f10:	5d                   	pop    %ebp
80100f11:	e9 a2 21 00 00       	jmp    801030b8 <piperead>
80100f16:	66 90                	xchg   %ax,%ax
80100f18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f1d:	eb db                	jmp    80100efa <fileread+0x5a>
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	68 26 66 10 80       	push   $0x80106626
80100f27:	e8 14 f4 ff ff       	call   80100340 <panic>

80100f2c <filewrite>:
80100f2c:	55                   	push   %ebp
80100f2d:	89 e5                	mov    %esp,%ebp
80100f2f:	57                   	push   %edi
80100f30:	56                   	push   %esi
80100f31:	53                   	push   %ebx
80100f32:	83 ec 1c             	sub    $0x1c,%esp
80100f35:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f38:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f3b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100f3e:	8b 45 10             	mov    0x10(%ebp),%eax
80100f41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100f44:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100f48:	0f 84 ae 00 00 00    	je     80100ffc <filewrite+0xd0>
80100f4e:	8b 03                	mov    (%ebx),%eax
80100f50:	83 f8 01             	cmp    $0x1,%eax
80100f53:	0f 84 c2 00 00 00    	je     8010101b <filewrite+0xef>
80100f59:	83 f8 02             	cmp    $0x2,%eax
80100f5c:	0f 85 cb 00 00 00    	jne    8010102d <filewrite+0x101>
80100f62:	31 ff                	xor    %edi,%edi
80100f64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100f67:	85 c0                	test   %eax,%eax
80100f69:	7f 2c                	jg     80100f97 <filewrite+0x6b>
80100f6b:	e9 9c 00 00 00       	jmp    8010100c <filewrite+0xe0>
80100f70:	01 43 14             	add    %eax,0x14(%ebx)
80100f73:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f76:	83 ec 0c             	sub    $0xc,%esp
80100f79:	ff 73 10             	pushl  0x10(%ebx)
80100f7c:	e8 a3 06 00 00       	call   80101624 <iunlock>
80100f81:	e8 1e 19 00 00       	call   801028a4 <end_op>
80100f86:	83 c4 10             	add    $0x10,%esp
80100f89:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100f8c:	39 c6                	cmp    %eax,%esi
80100f8e:	75 5f                	jne    80100fef <filewrite+0xc3>
80100f90:	01 f7                	add    %esi,%edi
80100f92:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80100f95:	7e 75                	jle    8010100c <filewrite+0xe0>
80100f97:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100f9a:	29 fe                	sub    %edi,%esi
80100f9c:	81 fe 00 06 00 00    	cmp    $0x600,%esi
80100fa2:	7e 05                	jle    80100fa9 <filewrite+0x7d>
80100fa4:	be 00 06 00 00       	mov    $0x600,%esi
80100fa9:	e8 8e 18 00 00       	call   8010283c <begin_op>
80100fae:	83 ec 0c             	sub    $0xc,%esp
80100fb1:	ff 73 10             	pushl  0x10(%ebx)
80100fb4:	e8 a3 05 00 00       	call   8010155c <ilock>
80100fb9:	56                   	push   %esi
80100fba:	ff 73 14             	pushl  0x14(%ebx)
80100fbd:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100fc0:	01 f8                	add    %edi,%eax
80100fc2:	50                   	push   %eax
80100fc3:	ff 73 10             	pushl  0x10(%ebx)
80100fc6:	e8 2d 09 00 00       	call   801018f8 <writei>
80100fcb:	83 c4 20             	add    $0x20,%esp
80100fce:	85 c0                	test   %eax,%eax
80100fd0:	7f 9e                	jg     80100f70 <filewrite+0x44>
80100fd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fd5:	83 ec 0c             	sub    $0xc,%esp
80100fd8:	ff 73 10             	pushl  0x10(%ebx)
80100fdb:	e8 44 06 00 00       	call   80101624 <iunlock>
80100fe0:	e8 bf 18 00 00       	call   801028a4 <end_op>
80100fe5:	83 c4 10             	add    $0x10,%esp
80100fe8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100feb:	85 c0                	test   %eax,%eax
80100fed:	75 0d                	jne    80100ffc <filewrite+0xd0>
80100fef:	83 ec 0c             	sub    $0xc,%esp
80100ff2:	68 2f 66 10 80       	push   $0x8010662f
80100ff7:	e8 44 f3 ff ff       	call   80100340 <panic>
80100ffc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101001:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101004:	5b                   	pop    %ebx
80101005:	5e                   	pop    %esi
80101006:	5f                   	pop    %edi
80101007:	5d                   	pop    %ebp
80101008:	c3                   	ret    
80101009:	8d 76 00             	lea    0x0(%esi),%esi
8010100c:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
8010100f:	75 eb                	jne    80100ffc <filewrite+0xd0>
80101011:	89 f8                	mov    %edi,%eax
80101013:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101016:	5b                   	pop    %ebx
80101017:	5e                   	pop    %esi
80101018:	5f                   	pop    %edi
80101019:	5d                   	pop    %ebp
8010101a:	c3                   	ret    
8010101b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010101e:	89 45 08             	mov    %eax,0x8(%ebp)
80101021:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101024:	5b                   	pop    %ebx
80101025:	5e                   	pop    %esi
80101026:	5f                   	pop    %edi
80101027:	5d                   	pop    %ebp
80101028:	e9 9b 1f 00 00       	jmp    80102fc8 <pipewrite>
8010102d:	83 ec 0c             	sub    $0xc,%esp
80101030:	68 35 66 10 80       	push   $0x80106635
80101035:	e8 06 f3 ff ff       	call   80100340 <panic>
8010103a:	66 90                	xchg   %ax,%ax

8010103c <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
8010103c:	55                   	push   %ebp
8010103d:	89 e5                	mov    %esp,%ebp
8010103f:	56                   	push   %esi
80101040:	53                   	push   %ebx
80101041:	89 c1                	mov    %eax,%ecx
80101043:	89 d3                	mov    %edx,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101045:	83 ec 08             	sub    $0x8,%esp
80101048:	89 d0                	mov    %edx,%eax
8010104a:	c1 e8 0c             	shr    $0xc,%eax
8010104d:	03 05 d8 f9 10 80    	add    0x8010f9d8,%eax
80101053:	50                   	push   %eax
80101054:	51                   	push   %ecx
80101055:	e8 5a f0 ff ff       	call   801000b4 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010105a:	89 d9                	mov    %ebx,%ecx
8010105c:	83 e1 07             	and    $0x7,%ecx
8010105f:	ba 01 00 00 00       	mov    $0x1,%edx
80101064:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101066:	c1 fb 03             	sar    $0x3,%ebx
80101069:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010106f:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101074:	83 c4 10             	add    $0x10,%esp
80101077:	85 d1                	test   %edx,%ecx
80101079:	74 25                	je     801010a0 <bfree+0x64>
8010107b:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010107d:	f7 d2                	not    %edx
8010107f:	21 ca                	and    %ecx,%edx
80101081:	88 54 18 5c          	mov    %dl,0x5c(%eax,%ebx,1)
  log_write(bp);
80101085:	83 ec 0c             	sub    $0xc,%esp
80101088:	50                   	push   %eax
80101089:	e8 6a 19 00 00       	call   801029f8 <log_write>
  brelse(bp);
8010108e:	89 34 24             	mov    %esi,(%esp)
80101091:	e8 2a f1 ff ff       	call   801001c0 <brelse>
}
80101096:	83 c4 10             	add    $0x10,%esp
80101099:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010109c:	5b                   	pop    %ebx
8010109d:	5e                   	pop    %esi
8010109e:	5d                   	pop    %ebp
8010109f:	c3                   	ret    
    panic("freeing free block");
801010a0:	83 ec 0c             	sub    $0xc,%esp
801010a3:	68 3f 66 10 80       	push   $0x8010663f
801010a8:	e8 93 f2 ff ff       	call   80100340 <panic>
801010ad:	8d 76 00             	lea    0x0(%esi),%esi

801010b0 <balloc>:
{
801010b0:	55                   	push   %ebp
801010b1:	89 e5                	mov    %esp,%ebp
801010b3:	57                   	push   %edi
801010b4:	56                   	push   %esi
801010b5:	53                   	push   %ebx
801010b6:	83 ec 1c             	sub    $0x1c,%esp
801010b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801010bc:	8b 0d c0 f9 10 80    	mov    0x8010f9c0,%ecx
801010c2:	85 c9                	test   %ecx,%ecx
801010c4:	74 7e                	je     80101144 <balloc+0x94>
801010c6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801010cd:	83 ec 08             	sub    $0x8,%esp
801010d0:	8b 75 dc             	mov    -0x24(%ebp),%esi
801010d3:	89 f0                	mov    %esi,%eax
801010d5:	c1 f8 0c             	sar    $0xc,%eax
801010d8:	03 05 d8 f9 10 80    	add    0x8010f9d8,%eax
801010de:	50                   	push   %eax
801010df:	ff 75 d8             	pushl  -0x28(%ebp)
801010e2:	e8 cd ef ff ff       	call   801000b4 <bread>
801010e7:	89 c3                	mov    %eax,%ebx
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801010e9:	a1 c0 f9 10 80       	mov    0x8010f9c0,%eax
801010ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010f1:	83 c4 10             	add    $0x10,%esp
801010f4:	31 c0                	xor    %eax,%eax
801010f6:	eb 29                	jmp    80101121 <balloc+0x71>
      m = 1 << (bi % 8);
801010f8:	89 c1                	mov    %eax,%ecx
801010fa:	83 e1 07             	and    $0x7,%ecx
801010fd:	bf 01 00 00 00       	mov    $0x1,%edi
80101102:	d3 e7                	shl    %cl,%edi
80101104:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101107:	89 c1                	mov    %eax,%ecx
80101109:	c1 f9 03             	sar    $0x3,%ecx
8010110c:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101111:	89 fa                	mov    %edi,%edx
80101113:	85 7d e4             	test   %edi,-0x1c(%ebp)
80101116:	74 3c                	je     80101154 <balloc+0xa4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101118:	40                   	inc    %eax
80101119:	46                   	inc    %esi
8010111a:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010111f:	74 05                	je     80101126 <balloc+0x76>
80101121:	39 75 e0             	cmp    %esi,-0x20(%ebp)
80101124:	77 d2                	ja     801010f8 <balloc+0x48>
    brelse(bp);
80101126:	83 ec 0c             	sub    $0xc,%esp
80101129:	53                   	push   %ebx
8010112a:	e8 91 f0 ff ff       	call   801001c0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010112f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101136:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101139:	83 c4 10             	add    $0x10,%esp
8010113c:	39 05 c0 f9 10 80    	cmp    %eax,0x8010f9c0
80101142:	77 89                	ja     801010cd <balloc+0x1d>
  panic("balloc: out of blocks");
80101144:	83 ec 0c             	sub    $0xc,%esp
80101147:	68 52 66 10 80       	push   $0x80106652
8010114c:	e8 ef f1 ff ff       	call   80100340 <panic>
80101151:	8d 76 00             	lea    0x0(%esi),%esi
        bp->data[bi/8] |= m;  // Mark block in use.
80101154:	0b 55 e4             	or     -0x1c(%ebp),%edx
80101157:	88 54 0b 5c          	mov    %dl,0x5c(%ebx,%ecx,1)
        log_write(bp);
8010115b:	83 ec 0c             	sub    $0xc,%esp
8010115e:	53                   	push   %ebx
8010115f:	e8 94 18 00 00       	call   801029f8 <log_write>
        brelse(bp);
80101164:	89 1c 24             	mov    %ebx,(%esp)
80101167:	e8 54 f0 ff ff       	call   801001c0 <brelse>
  bp = bread(dev, bno);
8010116c:	58                   	pop    %eax
8010116d:	5a                   	pop    %edx
8010116e:	56                   	push   %esi
8010116f:	ff 75 d8             	pushl  -0x28(%ebp)
80101172:	e8 3d ef ff ff       	call   801000b4 <bread>
80101177:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101179:	83 c4 0c             	add    $0xc,%esp
8010117c:	68 00 02 00 00       	push   $0x200
80101181:	6a 00                	push   $0x0
80101183:	8d 40 5c             	lea    0x5c(%eax),%eax
80101186:	50                   	push   %eax
80101187:	e8 60 2d 00 00       	call   80103eec <memset>
  log_write(bp);
8010118c:	89 1c 24             	mov    %ebx,(%esp)
8010118f:	e8 64 18 00 00       	call   801029f8 <log_write>
  brelse(bp);
80101194:	89 1c 24             	mov    %ebx,(%esp)
80101197:	e8 24 f0 ff ff       	call   801001c0 <brelse>
}
8010119c:	89 f0                	mov    %esi,%eax
8010119e:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a1:	5b                   	pop    %ebx
801011a2:	5e                   	pop    %esi
801011a3:	5f                   	pop    %edi
801011a4:	5d                   	pop    %ebp
801011a5:	c3                   	ret    
801011a6:	66 90                	xchg   %ax,%ax

801011a8 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011a8:	55                   	push   %ebp
801011a9:	89 e5                	mov    %esp,%ebp
801011ab:	57                   	push   %edi
801011ac:	56                   	push   %esi
801011ad:	53                   	push   %ebx
801011ae:	83 ec 28             	sub    $0x28,%esp
801011b1:	89 c6                	mov    %eax,%esi
801011b3:	89 d7                	mov    %edx,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);
801011b5:	68 e0 f9 10 80       	push   $0x8010f9e0
801011ba:	e8 4d 2c 00 00       	call   80103e0c <acquire>
801011bf:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
801011c2:	31 c0                	xor    %eax,%eax
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011c4:	bb 14 fa 10 80       	mov    $0x8010fa14,%ebx
801011c9:	eb 13                	jmp    801011de <iget+0x36>
801011cb:	90                   	nop
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801011cc:	39 33                	cmp    %esi,(%ebx)
801011ce:	74 68                	je     80101238 <iget+0x90>
801011d0:	81 c3 90 00 00 00    	add    $0x90,%ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011d6:	81 fb 34 16 11 80    	cmp    $0x80111634,%ebx
801011dc:	73 22                	jae    80101200 <iget+0x58>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801011de:	8b 4b 08             	mov    0x8(%ebx),%ecx
801011e1:	85 c9                	test   %ecx,%ecx
801011e3:	7f e7                	jg     801011cc <iget+0x24>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801011e5:	85 c0                	test   %eax,%eax
801011e7:	75 e7                	jne    801011d0 <iget+0x28>
801011e9:	89 da                	mov    %ebx,%edx
801011eb:	81 c3 90 00 00 00    	add    $0x90,%ebx
801011f1:	85 c9                	test   %ecx,%ecx
801011f3:	75 66                	jne    8010125b <iget+0xb3>
801011f5:	89 d0                	mov    %edx,%eax
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011f7:	81 fb 34 16 11 80    	cmp    $0x80111634,%ebx
801011fd:	72 df                	jb     801011de <iget+0x36>
801011ff:	90                   	nop
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101200:	85 c0                	test   %eax,%eax
80101202:	74 6f                	je     80101273 <iget+0xcb>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101204:	89 30                	mov    %esi,(%eax)
  ip->inum = inum;
80101206:	89 78 04             	mov    %edi,0x4(%eax)
  ip->ref = 1;
80101209:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->valid = 0;
80101210:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
80101217:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  release(&icache.lock);
8010121a:	83 ec 0c             	sub    $0xc,%esp
8010121d:	68 e0 f9 10 80       	push   $0x8010f9e0
80101222:	e8 7d 2c 00 00       	call   80103ea4 <release>

  return ip;
80101227:	83 c4 10             	add    $0x10,%esp
8010122a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
8010122d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101230:	5b                   	pop    %ebx
80101231:	5e                   	pop    %esi
80101232:	5f                   	pop    %edi
80101233:	5d                   	pop    %ebp
80101234:	c3                   	ret    
80101235:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101238:	39 7b 04             	cmp    %edi,0x4(%ebx)
8010123b:	75 93                	jne    801011d0 <iget+0x28>
      ip->ref++;
8010123d:	41                   	inc    %ecx
8010123e:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	68 e0 f9 10 80       	push   $0x8010f9e0
80101249:	e8 56 2c 00 00       	call   80103ea4 <release>
      return ip;
8010124e:	83 c4 10             	add    $0x10,%esp
80101251:	89 d8                	mov    %ebx,%eax
}
80101253:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101256:	5b                   	pop    %ebx
80101257:	5e                   	pop    %esi
80101258:	5f                   	pop    %edi
80101259:	5d                   	pop    %ebp
8010125a:	c3                   	ret    
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010125b:	81 fb 34 16 11 80    	cmp    $0x80111634,%ebx
80101261:	73 10                	jae    80101273 <iget+0xcb>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101263:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101266:	85 c9                	test   %ecx,%ecx
80101268:	0f 8f 5e ff ff ff    	jg     801011cc <iget+0x24>
8010126e:	e9 76 ff ff ff       	jmp    801011e9 <iget+0x41>
    panic("iget: no inodes");
80101273:	83 ec 0c             	sub    $0xc,%esp
80101276:	68 68 66 10 80       	push   $0x80106668
8010127b:	e8 c0 f0 ff ff       	call   80100340 <panic>

80101280 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101280:	55                   	push   %ebp
80101281:	89 e5                	mov    %esp,%ebp
80101283:	57                   	push   %edi
80101284:	56                   	push   %esi
80101285:	53                   	push   %ebx
80101286:	83 ec 1c             	sub    $0x1c,%esp
80101289:	89 c6                	mov    %eax,%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010128b:	83 fa 0b             	cmp    $0xb,%edx
8010128e:	0f 86 80 00 00 00    	jbe    80101314 <bmap+0x94>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101294:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
80101297:	83 fb 7f             	cmp    $0x7f,%ebx
8010129a:	0f 87 90 00 00 00    	ja     80101330 <bmap+0xb0>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801012a0:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012a6:	8b 16                	mov    (%esi),%edx
801012a8:	85 c0                	test   %eax,%eax
801012aa:	74 54                	je     80101300 <bmap+0x80>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801012ac:	83 ec 08             	sub    $0x8,%esp
801012af:	50                   	push   %eax
801012b0:	52                   	push   %edx
801012b1:	e8 fe ed ff ff       	call   801000b4 <bread>
801012b6:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801012b8:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
801012bc:	8b 03                	mov    (%ebx),%eax
801012be:	83 c4 10             	add    $0x10,%esp
801012c1:	85 c0                	test   %eax,%eax
801012c3:	74 1b                	je     801012e0 <bmap+0x60>
801012c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
801012c8:	83 ec 0c             	sub    $0xc,%esp
801012cb:	57                   	push   %edi
801012cc:	e8 ef ee ff ff       	call   801001c0 <brelse>
    return addr;
801012d1:	83 c4 10             	add    $0x10,%esp
801012d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }

  panic("bmap: out of range");
}
801012d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
801012df:	90                   	nop
      a[bn] = addr = balloc(ip->dev);
801012e0:	8b 06                	mov    (%esi),%eax
801012e2:	e8 c9 fd ff ff       	call   801010b0 <balloc>
801012e7:	89 03                	mov    %eax,(%ebx)
801012e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      log_write(bp);
801012ec:	83 ec 0c             	sub    $0xc,%esp
801012ef:	57                   	push   %edi
801012f0:	e8 03 17 00 00       	call   801029f8 <log_write>
801012f5:	83 c4 10             	add    $0x10,%esp
801012f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801012fb:	eb c8                	jmp    801012c5 <bmap+0x45>
801012fd:	8d 76 00             	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101300:	89 d0                	mov    %edx,%eax
80101302:	e8 a9 fd ff ff       	call   801010b0 <balloc>
80101307:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010130d:	8b 16                	mov    (%esi),%edx
8010130f:	eb 9b                	jmp    801012ac <bmap+0x2c>
80101311:	8d 76 00             	lea    0x0(%esi),%esi
    if((addr = ip->addrs[bn]) == 0)
80101314:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80101317:	8b 43 5c             	mov    0x5c(%ebx),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	75 b9                	jne    801012d7 <bmap+0x57>
      ip->addrs[bn] = addr = balloc(ip->dev);
8010131e:	8b 06                	mov    (%esi),%eax
80101320:	e8 8b fd ff ff       	call   801010b0 <balloc>
80101325:	89 43 5c             	mov    %eax,0x5c(%ebx)
}
80101328:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010132b:	5b                   	pop    %ebx
8010132c:	5e                   	pop    %esi
8010132d:	5f                   	pop    %edi
8010132e:	5d                   	pop    %ebp
8010132f:	c3                   	ret    
  panic("bmap: out of range");
80101330:	83 ec 0c             	sub    $0xc,%esp
80101333:	68 78 66 10 80       	push   $0x80106678
80101338:	e8 03 f0 ff ff       	call   80100340 <panic>
8010133d:	8d 76 00             	lea    0x0(%esi),%esi

80101340 <readsb>:
{
80101340:	55                   	push   %ebp
80101341:	89 e5                	mov    %esp,%ebp
80101343:	56                   	push   %esi
80101344:	53                   	push   %ebx
80101345:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101348:	83 ec 08             	sub    $0x8,%esp
8010134b:	6a 01                	push   $0x1
8010134d:	ff 75 08             	pushl  0x8(%ebp)
80101350:	e8 5f ed ff ff       	call   801000b4 <bread>
80101355:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101357:	83 c4 0c             	add    $0xc,%esp
8010135a:	6a 1c                	push   $0x1c
8010135c:	8d 40 5c             	lea    0x5c(%eax),%eax
8010135f:	50                   	push   %eax
80101360:	56                   	push   %esi
80101361:	e8 0a 2c 00 00       	call   80103f70 <memmove>
  brelse(bp);
80101366:	83 c4 10             	add    $0x10,%esp
80101369:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010136c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010136f:	5b                   	pop    %ebx
80101370:	5e                   	pop    %esi
80101371:	5d                   	pop    %ebp
  brelse(bp);
80101372:	e9 49 ee ff ff       	jmp    801001c0 <brelse>
80101377:	90                   	nop

80101378 <iinit>:
{
80101378:	55                   	push   %ebp
80101379:	89 e5                	mov    %esp,%ebp
8010137b:	53                   	push   %ebx
8010137c:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010137f:	68 8b 66 10 80       	push   $0x8010668b
80101384:	68 e0 f9 10 80       	push   $0x8010f9e0
80101389:	e8 3e 29 00 00       	call   80103ccc <initlock>
  for(i = 0; i < NINODE; i++) {
8010138e:	bb 20 fa 10 80       	mov    $0x8010fa20,%ebx
80101393:	83 c4 10             	add    $0x10,%esp
80101396:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101398:	83 ec 08             	sub    $0x8,%esp
8010139b:	68 92 66 10 80       	push   $0x80106692
801013a0:	53                   	push   %ebx
801013a1:	e8 16 28 00 00       	call   80103bbc <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801013a6:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013ac:	83 c4 10             	add    $0x10,%esp
801013af:	81 fb 40 16 11 80    	cmp    $0x80111640,%ebx
801013b5:	75 e1                	jne    80101398 <iinit+0x20>
  readsb(dev, &sb);
801013b7:	83 ec 08             	sub    $0x8,%esp
801013ba:	68 c0 f9 10 80       	push   $0x8010f9c0
801013bf:	ff 75 08             	pushl  0x8(%ebp)
801013c2:	e8 79 ff ff ff       	call   80101340 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801013c7:	ff 35 d8 f9 10 80    	pushl  0x8010f9d8
801013cd:	ff 35 d4 f9 10 80    	pushl  0x8010f9d4
801013d3:	ff 35 d0 f9 10 80    	pushl  0x8010f9d0
801013d9:	ff 35 cc f9 10 80    	pushl  0x8010f9cc
801013df:	ff 35 c8 f9 10 80    	pushl  0x8010f9c8
801013e5:	ff 35 c4 f9 10 80    	pushl  0x8010f9c4
801013eb:	ff 35 c0 f9 10 80    	pushl  0x8010f9c0
801013f1:	68 f8 66 10 80       	push   $0x801066f8
801013f6:	e8 25 f2 ff ff       	call   80100620 <cprintf>
}
801013fb:	83 c4 30             	add    $0x30,%esp
801013fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101401:	c9                   	leave  
80101402:	c3                   	ret    
80101403:	90                   	nop

80101404 <ialloc>:
{
80101404:	55                   	push   %ebp
80101405:	89 e5                	mov    %esp,%ebp
80101407:	57                   	push   %edi
80101408:	56                   	push   %esi
80101409:	53                   	push   %ebx
8010140a:	83 ec 1c             	sub    $0x1c,%esp
8010140d:	8b 75 08             	mov    0x8(%ebp),%esi
80101410:	8b 45 0c             	mov    0xc(%ebp),%eax
80101413:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101416:	83 3d c8 f9 10 80 01 	cmpl   $0x1,0x8010f9c8
8010141d:	0f 86 84 00 00 00    	jbe    801014a7 <ialloc+0xa3>
80101423:	bf 01 00 00 00       	mov    $0x1,%edi
80101428:	eb 17                	jmp    80101441 <ialloc+0x3d>
8010142a:	66 90                	xchg   %ax,%ax
    brelse(bp);
8010142c:	83 ec 0c             	sub    $0xc,%esp
8010142f:	53                   	push   %ebx
80101430:	e8 8b ed ff ff       	call   801001c0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
80101435:	47                   	inc    %edi
80101436:	83 c4 10             	add    $0x10,%esp
80101439:	3b 3d c8 f9 10 80    	cmp    0x8010f9c8,%edi
8010143f:	73 66                	jae    801014a7 <ialloc+0xa3>
    bp = bread(dev, IBLOCK(inum, sb));
80101441:	83 ec 08             	sub    $0x8,%esp
80101444:	89 f8                	mov    %edi,%eax
80101446:	c1 e8 03             	shr    $0x3,%eax
80101449:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
8010144f:	50                   	push   %eax
80101450:	56                   	push   %esi
80101451:	e8 5e ec ff ff       	call   801000b4 <bread>
80101456:	89 c3                	mov    %eax,%ebx
    dip = (struct dinode*)bp->data + inum%IPB;
80101458:	89 f8                	mov    %edi,%eax
8010145a:	83 e0 07             	and    $0x7,%eax
8010145d:	c1 e0 06             	shl    $0x6,%eax
80101460:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
80101464:	83 c4 10             	add    $0x10,%esp
80101467:	66 83 39 00          	cmpw   $0x0,(%ecx)
8010146b:	75 bf                	jne    8010142c <ialloc+0x28>
      memset(dip, 0, sizeof(*dip));
8010146d:	50                   	push   %eax
8010146e:	6a 40                	push   $0x40
80101470:	6a 00                	push   $0x0
80101472:	51                   	push   %ecx
80101473:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101476:	e8 71 2a 00 00       	call   80103eec <memset>
      dip->type = type;
8010147b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010147e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101481:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
80101484:	89 1c 24             	mov    %ebx,(%esp)
80101487:	e8 6c 15 00 00       	call   801029f8 <log_write>
      brelse(bp);
8010148c:	89 1c 24             	mov    %ebx,(%esp)
8010148f:	e8 2c ed ff ff       	call   801001c0 <brelse>
      return iget(dev, inum);
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	89 fa                	mov    %edi,%edx
80101499:	89 f0                	mov    %esi,%eax
}
8010149b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010149e:	5b                   	pop    %ebx
8010149f:	5e                   	pop    %esi
801014a0:	5f                   	pop    %edi
801014a1:	5d                   	pop    %ebp
      return iget(dev, inum);
801014a2:	e9 01 fd ff ff       	jmp    801011a8 <iget>
  panic("ialloc: no inodes");
801014a7:	83 ec 0c             	sub    $0xc,%esp
801014aa:	68 98 66 10 80       	push   $0x80106698
801014af:	e8 8c ee ff ff       	call   80100340 <panic>

801014b4 <iupdate>:
{
801014b4:	55                   	push   %ebp
801014b5:	89 e5                	mov    %esp,%ebp
801014b7:	56                   	push   %esi
801014b8:	53                   	push   %ebx
801014b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801014bc:	83 ec 08             	sub    $0x8,%esp
801014bf:	8b 43 04             	mov    0x4(%ebx),%eax
801014c2:	c1 e8 03             	shr    $0x3,%eax
801014c5:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
801014cb:	50                   	push   %eax
801014cc:	ff 33                	pushl  (%ebx)
801014ce:	e8 e1 eb ff ff       	call   801000b4 <bread>
801014d3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801014d5:	8b 43 04             	mov    0x4(%ebx),%eax
801014d8:	83 e0 07             	and    $0x7,%eax
801014db:	c1 e0 06             	shl    $0x6,%eax
801014de:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801014e2:	8b 53 50             	mov    0x50(%ebx),%edx
801014e5:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801014e8:	66 8b 53 52          	mov    0x52(%ebx),%dx
801014ec:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
801014f0:	8b 53 54             	mov    0x54(%ebx),%edx
801014f3:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
801014f7:	66 8b 53 56          	mov    0x56(%ebx),%dx
801014fb:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
801014ff:	8b 53 58             	mov    0x58(%ebx),%edx
80101502:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101505:	83 c4 0c             	add    $0xc,%esp
80101508:	6a 34                	push   $0x34
8010150a:	83 c3 5c             	add    $0x5c,%ebx
8010150d:	53                   	push   %ebx
8010150e:	83 c0 0c             	add    $0xc,%eax
80101511:	50                   	push   %eax
80101512:	e8 59 2a 00 00       	call   80103f70 <memmove>
  log_write(bp);
80101517:	89 34 24             	mov    %esi,(%esp)
8010151a:	e8 d9 14 00 00       	call   801029f8 <log_write>
  brelse(bp);
8010151f:	83 c4 10             	add    $0x10,%esp
80101522:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101525:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101528:	5b                   	pop    %ebx
80101529:	5e                   	pop    %esi
8010152a:	5d                   	pop    %ebp
  brelse(bp);
8010152b:	e9 90 ec ff ff       	jmp    801001c0 <brelse>

80101530 <idup>:
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	53                   	push   %ebx
80101534:	83 ec 10             	sub    $0x10,%esp
80101537:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010153a:	68 e0 f9 10 80       	push   $0x8010f9e0
8010153f:	e8 c8 28 00 00       	call   80103e0c <acquire>
  ip->ref++;
80101544:	ff 43 08             	incl   0x8(%ebx)
  release(&icache.lock);
80101547:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
8010154e:	e8 51 29 00 00       	call   80103ea4 <release>
}
80101553:	89 d8                	mov    %ebx,%eax
80101555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101558:	c9                   	leave  
80101559:	c3                   	ret    
8010155a:	66 90                	xchg   %ax,%ax

8010155c <ilock>:
{
8010155c:	55                   	push   %ebp
8010155d:	89 e5                	mov    %esp,%ebp
8010155f:	56                   	push   %esi
80101560:	53                   	push   %ebx
80101561:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101564:	85 db                	test   %ebx,%ebx
80101566:	0f 84 a9 00 00 00    	je     80101615 <ilock+0xb9>
8010156c:	8b 53 08             	mov    0x8(%ebx),%edx
8010156f:	85 d2                	test   %edx,%edx
80101571:	0f 8e 9e 00 00 00    	jle    80101615 <ilock+0xb9>
  acquiresleep(&ip->lock);
80101577:	83 ec 0c             	sub    $0xc,%esp
8010157a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010157d:	50                   	push   %eax
8010157e:	e8 6d 26 00 00       	call   80103bf0 <acquiresleep>
  if(ip->valid == 0){
80101583:	83 c4 10             	add    $0x10,%esp
80101586:	8b 43 4c             	mov    0x4c(%ebx),%eax
80101589:	85 c0                	test   %eax,%eax
8010158b:	74 07                	je     80101594 <ilock+0x38>
}
8010158d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101590:	5b                   	pop    %ebx
80101591:	5e                   	pop    %esi
80101592:	5d                   	pop    %ebp
80101593:	c3                   	ret    
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101594:	83 ec 08             	sub    $0x8,%esp
80101597:	8b 43 04             	mov    0x4(%ebx),%eax
8010159a:	c1 e8 03             	shr    $0x3,%eax
8010159d:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
801015a3:	50                   	push   %eax
801015a4:	ff 33                	pushl  (%ebx)
801015a6:	e8 09 eb ff ff       	call   801000b4 <bread>
801015ab:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ad:	8b 43 04             	mov    0x4(%ebx),%eax
801015b0:	83 e0 07             	and    $0x7,%eax
801015b3:	c1 e0 06             	shl    $0x6,%eax
801015b6:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801015ba:	8b 10                	mov    (%eax),%edx
801015bc:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801015c0:	66 8b 50 02          	mov    0x2(%eax),%dx
801015c4:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801015c8:	8b 50 04             	mov    0x4(%eax),%edx
801015cb:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801015cf:	66 8b 50 06          	mov    0x6(%eax),%dx
801015d3:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801015d7:	8b 50 08             	mov    0x8(%eax),%edx
801015da:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801015dd:	83 c4 0c             	add    $0xc,%esp
801015e0:	6a 34                	push   $0x34
801015e2:	83 c0 0c             	add    $0xc,%eax
801015e5:	50                   	push   %eax
801015e6:	8d 43 5c             	lea    0x5c(%ebx),%eax
801015e9:	50                   	push   %eax
801015ea:	e8 81 29 00 00       	call   80103f70 <memmove>
    brelse(bp);
801015ef:	89 34 24             	mov    %esi,(%esp)
801015f2:	e8 c9 eb ff ff       	call   801001c0 <brelse>
    ip->valid = 1;
801015f7:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
801015fe:	83 c4 10             	add    $0x10,%esp
80101601:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101606:	75 85                	jne    8010158d <ilock+0x31>
      panic("ilock: no type");
80101608:	83 ec 0c             	sub    $0xc,%esp
8010160b:	68 b0 66 10 80       	push   $0x801066b0
80101610:	e8 2b ed ff ff       	call   80100340 <panic>
    panic("ilock");
80101615:	83 ec 0c             	sub    $0xc,%esp
80101618:	68 aa 66 10 80       	push   $0x801066aa
8010161d:	e8 1e ed ff ff       	call   80100340 <panic>
80101622:	66 90                	xchg   %ax,%ax

80101624 <iunlock>:
{
80101624:	55                   	push   %ebp
80101625:	89 e5                	mov    %esp,%ebp
80101627:	56                   	push   %esi
80101628:	53                   	push   %ebx
80101629:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010162c:	85 db                	test   %ebx,%ebx
8010162e:	74 28                	je     80101658 <iunlock+0x34>
80101630:	8d 73 0c             	lea    0xc(%ebx),%esi
80101633:	83 ec 0c             	sub    $0xc,%esp
80101636:	56                   	push   %esi
80101637:	e8 44 26 00 00       	call   80103c80 <holdingsleep>
8010163c:	83 c4 10             	add    $0x10,%esp
8010163f:	85 c0                	test   %eax,%eax
80101641:	74 15                	je     80101658 <iunlock+0x34>
80101643:	8b 43 08             	mov    0x8(%ebx),%eax
80101646:	85 c0                	test   %eax,%eax
80101648:	7e 0e                	jle    80101658 <iunlock+0x34>
  releasesleep(&ip->lock);
8010164a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010164d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101650:	5b                   	pop    %ebx
80101651:	5e                   	pop    %esi
80101652:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
80101653:	e9 ec 25 00 00       	jmp    80103c44 <releasesleep>
    panic("iunlock");
80101658:	83 ec 0c             	sub    $0xc,%esp
8010165b:	68 bf 66 10 80       	push   $0x801066bf
80101660:	e8 db ec ff ff       	call   80100340 <panic>
80101665:	8d 76 00             	lea    0x0(%esi),%esi

80101668 <iput>:
{
80101668:	55                   	push   %ebp
80101669:	89 e5                	mov    %esp,%ebp
8010166b:	57                   	push   %edi
8010166c:	56                   	push   %esi
8010166d:	53                   	push   %ebx
8010166e:	83 ec 28             	sub    $0x28,%esp
80101671:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
80101674:	8d 73 0c             	lea    0xc(%ebx),%esi
80101677:	56                   	push   %esi
80101678:	e8 73 25 00 00       	call   80103bf0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
8010167d:	83 c4 10             	add    $0x10,%esp
80101680:	8b 43 4c             	mov    0x4c(%ebx),%eax
80101683:	85 c0                	test   %eax,%eax
80101685:	74 07                	je     8010168e <iput+0x26>
80101687:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010168c:	74 2e                	je     801016bc <iput+0x54>
  releasesleep(&ip->lock);
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	56                   	push   %esi
80101692:	e8 ad 25 00 00       	call   80103c44 <releasesleep>
  acquire(&icache.lock);
80101697:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
8010169e:	e8 69 27 00 00       	call   80103e0c <acquire>
  ip->ref--;
801016a3:	ff 4b 08             	decl   0x8(%ebx)
  release(&icache.lock);
801016a6:	83 c4 10             	add    $0x10,%esp
801016a9:	c7 45 08 e0 f9 10 80 	movl   $0x8010f9e0,0x8(%ebp)
}
801016b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016b3:	5b                   	pop    %ebx
801016b4:	5e                   	pop    %esi
801016b5:	5f                   	pop    %edi
801016b6:	5d                   	pop    %ebp
  release(&icache.lock);
801016b7:	e9 e8 27 00 00       	jmp    80103ea4 <release>
    acquire(&icache.lock);
801016bc:	83 ec 0c             	sub    $0xc,%esp
801016bf:	68 e0 f9 10 80       	push   $0x8010f9e0
801016c4:	e8 43 27 00 00       	call   80103e0c <acquire>
    int r = ip->ref;
801016c9:	8b 7b 08             	mov    0x8(%ebx),%edi
    release(&icache.lock);
801016cc:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
801016d3:	e8 cc 27 00 00       	call   80103ea4 <release>
    if(r == 1){
801016d8:	83 c4 10             	add    $0x10,%esp
801016db:	4f                   	dec    %edi
801016dc:	75 b0                	jne    8010168e <iput+0x26>
801016de:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801016e1:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
801016e7:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801016ea:	89 fe                	mov    %edi,%esi
801016ec:	89 c7                	mov    %eax,%edi
801016ee:	eb 07                	jmp    801016f7 <iput+0x8f>
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801016f0:	83 c6 04             	add    $0x4,%esi
801016f3:	39 fe                	cmp    %edi,%esi
801016f5:	74 15                	je     8010170c <iput+0xa4>
    if(ip->addrs[i]){
801016f7:	8b 16                	mov    (%esi),%edx
801016f9:	85 d2                	test   %edx,%edx
801016fb:	74 f3                	je     801016f0 <iput+0x88>
      bfree(ip->dev, ip->addrs[i]);
801016fd:	8b 03                	mov    (%ebx),%eax
801016ff:	e8 38 f9 ff ff       	call   8010103c <bfree>
      ip->addrs[i] = 0;
80101704:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010170a:	eb e4                	jmp    801016f0 <iput+0x88>
8010170c:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
8010170f:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101715:	85 c0                	test   %eax,%eax
80101717:	75 2f                	jne    80101748 <iput+0xe0>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101719:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101720:	83 ec 0c             	sub    $0xc,%esp
80101723:	53                   	push   %ebx
80101724:	e8 8b fd ff ff       	call   801014b4 <iupdate>
      ip->type = 0;
80101729:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
      iupdate(ip);
8010172f:	89 1c 24             	mov    %ebx,(%esp)
80101732:	e8 7d fd ff ff       	call   801014b4 <iupdate>
      ip->valid = 0;
80101737:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
8010173e:	83 c4 10             	add    $0x10,%esp
80101741:	e9 48 ff ff ff       	jmp    8010168e <iput+0x26>
80101746:	66 90                	xchg   %ax,%ax
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101748:	83 ec 08             	sub    $0x8,%esp
8010174b:	50                   	push   %eax
8010174c:	ff 33                	pushl  (%ebx)
8010174e:	e8 61 e9 ff ff       	call   801000b4 <bread>
80101753:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
80101756:	8d 78 5c             	lea    0x5c(%eax),%edi
80101759:	05 5c 02 00 00       	add    $0x25c,%eax
8010175e:	83 c4 10             	add    $0x10,%esp
80101761:	89 75 e0             	mov    %esi,-0x20(%ebp)
80101764:	89 fe                	mov    %edi,%esi
80101766:	89 c7                	mov    %eax,%edi
80101768:	eb 09                	jmp    80101773 <iput+0x10b>
8010176a:	66 90                	xchg   %ax,%ax
8010176c:	83 c6 04             	add    $0x4,%esi
8010176f:	39 f7                	cmp    %esi,%edi
80101771:	74 11                	je     80101784 <iput+0x11c>
      if(a[j])
80101773:	8b 16                	mov    (%esi),%edx
80101775:	85 d2                	test   %edx,%edx
80101777:	74 f3                	je     8010176c <iput+0x104>
        bfree(ip->dev, a[j]);
80101779:	8b 03                	mov    (%ebx),%eax
8010177b:	e8 bc f8 ff ff       	call   8010103c <bfree>
80101780:	eb ea                	jmp    8010176c <iput+0x104>
80101782:	66 90                	xchg   %ax,%ax
80101784:	8b 75 e0             	mov    -0x20(%ebp),%esi
    brelse(bp);
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010178d:	e8 2e ea ff ff       	call   801001c0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101792:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101798:	8b 03                	mov    (%ebx),%eax
8010179a:	e8 9d f8 ff ff       	call   8010103c <bfree>
    ip->addrs[NDIRECT] = 0;
8010179f:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801017a6:	00 00 00 
801017a9:	83 c4 10             	add    $0x10,%esp
801017ac:	e9 68 ff ff ff       	jmp    80101719 <iput+0xb1>
801017b1:	8d 76 00             	lea    0x0(%esi),%esi

801017b4 <iunlockput>:
{
801017b4:	55                   	push   %ebp
801017b5:	89 e5                	mov    %esp,%ebp
801017b7:	53                   	push   %ebx
801017b8:	83 ec 10             	sub    $0x10,%esp
801017bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801017be:	53                   	push   %ebx
801017bf:	e8 60 fe ff ff       	call   80101624 <iunlock>
  iput(ip);
801017c4:	83 c4 10             	add    $0x10,%esp
801017c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801017ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801017cd:	c9                   	leave  
  iput(ip);
801017ce:	e9 95 fe ff ff       	jmp    80101668 <iput>
801017d3:	90                   	nop

801017d4 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
801017d4:	55                   	push   %ebp
801017d5:	89 e5                	mov    %esp,%ebp
801017d7:	8b 55 08             	mov    0x8(%ebp),%edx
801017da:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801017dd:	8b 0a                	mov    (%edx),%ecx
801017df:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801017e2:	8b 4a 04             	mov    0x4(%edx),%ecx
801017e5:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
801017e8:	8b 4a 50             	mov    0x50(%edx),%ecx
801017eb:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
801017ee:	66 8b 4a 56          	mov    0x56(%edx),%cx
801017f2:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
801017f6:	8b 52 58             	mov    0x58(%edx),%edx
801017f9:	89 50 10             	mov    %edx,0x10(%eax)
}
801017fc:	5d                   	pop    %ebp
801017fd:	c3                   	ret    
801017fe:	66 90                	xchg   %ax,%ax

80101800 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101800:	55                   	push   %ebp
80101801:	89 e5                	mov    %esp,%ebp
80101803:	57                   	push   %edi
80101804:	56                   	push   %esi
80101805:	53                   	push   %ebx
80101806:	83 ec 1c             	sub    $0x1c,%esp
80101809:	8b 7d 08             	mov    0x8(%ebp),%edi
8010180c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010180f:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101812:	8b 45 10             	mov    0x10(%ebp),%eax
80101815:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101818:	8b 45 14             	mov    0x14(%ebp),%eax
8010181b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
8010181e:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)
80101823:	0f 84 a3 00 00 00    	je     801018cc <readi+0xcc>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101829:	8b 47 58             	mov    0x58(%edi),%eax
8010182c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
8010182f:	39 c3                	cmp    %eax,%ebx
80101831:	0f 87 b9 00 00 00    	ja     801018f0 <readi+0xf0>
80101837:	89 da                	mov    %ebx,%edx
80101839:	31 c9                	xor    %ecx,%ecx
8010183b:	03 55 e4             	add    -0x1c(%ebp),%edx
8010183e:	0f 92 c1             	setb   %cl
80101841:	89 ce                	mov    %ecx,%esi
80101843:	0f 82 a7 00 00 00    	jb     801018f0 <readi+0xf0>
    return -1;
  if(off + n > ip->size)
80101849:	39 d0                	cmp    %edx,%eax
8010184b:	72 77                	jb     801018c4 <readi+0xc4>
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010184d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101850:	85 db                	test   %ebx,%ebx
80101852:	74 65                	je     801018b9 <readi+0xb9>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101854:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101857:	89 da                	mov    %ebx,%edx
80101859:	c1 ea 09             	shr    $0x9,%edx
8010185c:	89 f8                	mov    %edi,%eax
8010185e:	e8 1d fa ff ff       	call   80101280 <bmap>
80101863:	83 ec 08             	sub    $0x8,%esp
80101866:	50                   	push   %eax
80101867:	ff 37                	pushl  (%edi)
80101869:	e8 46 e8 ff ff       	call   801000b4 <bread>
8010186e:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101870:	89 d8                	mov    %ebx,%eax
80101872:	25 ff 01 00 00       	and    $0x1ff,%eax
80101877:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010187a:	29 f1                	sub    %esi,%ecx
8010187c:	bb 00 02 00 00       	mov    $0x200,%ebx
80101881:	29 c3                	sub    %eax,%ebx
80101883:	83 c4 10             	add    $0x10,%esp
80101886:	39 cb                	cmp    %ecx,%ebx
80101888:	76 02                	jbe    8010188c <readi+0x8c>
8010188a:	89 cb                	mov    %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
8010188c:	51                   	push   %ecx
8010188d:	53                   	push   %ebx
8010188e:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101892:	89 55 d8             	mov    %edx,-0x28(%ebp)
80101895:	50                   	push   %eax
80101896:	ff 75 dc             	pushl  -0x24(%ebp)
80101899:	e8 d2 26 00 00       	call   80103f70 <memmove>
    brelse(bp);
8010189e:	8b 55 d8             	mov    -0x28(%ebp),%edx
801018a1:	89 14 24             	mov    %edx,(%esp)
801018a4:	e8 17 e9 ff ff       	call   801001c0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801018a9:	01 de                	add    %ebx,%esi
801018ab:	01 5d e0             	add    %ebx,-0x20(%ebp)
801018ae:	01 5d dc             	add    %ebx,-0x24(%ebp)
801018b1:	83 c4 10             	add    $0x10,%esp
801018b4:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801018b7:	77 9b                	ja     80101854 <readi+0x54>
  }
  return n;
801018b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801018bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018bf:	5b                   	pop    %ebx
801018c0:	5e                   	pop    %esi
801018c1:	5f                   	pop    %edi
801018c2:	5d                   	pop    %ebp
801018c3:	c3                   	ret    
    n = ip->size - off;
801018c4:	29 d8                	sub    %ebx,%eax
801018c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018c9:	eb 82                	jmp    8010184d <readi+0x4d>
801018cb:	90                   	nop
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801018cc:	0f bf 47 52          	movswl 0x52(%edi),%eax
801018d0:	66 83 f8 09          	cmp    $0x9,%ax
801018d4:	77 1a                	ja     801018f0 <readi+0xf0>
801018d6:	8b 04 c5 60 f9 10 80 	mov    -0x7fef06a0(,%eax,8),%eax
801018dd:	85 c0                	test   %eax,%eax
801018df:	74 0f                	je     801018f0 <readi+0xf0>
    return devsw[ip->major].read(ip, dst, n);
801018e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018e4:	89 7d 10             	mov    %edi,0x10(%ebp)
}
801018e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018ea:	5b                   	pop    %ebx
801018eb:	5e                   	pop    %esi
801018ec:	5f                   	pop    %edi
801018ed:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
801018ee:	ff e0                	jmp    *%eax
      return -1;
801018f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801018f5:	eb c5                	jmp    801018bc <readi+0xbc>
801018f7:	90                   	nop

801018f8 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
801018f8:	55                   	push   %ebp
801018f9:	89 e5                	mov    %esp,%ebp
801018fb:	57                   	push   %edi
801018fc:	56                   	push   %esi
801018fd:	53                   	push   %ebx
801018fe:	83 ec 1c             	sub    $0x1c,%esp
80101901:	8b 45 08             	mov    0x8(%ebp),%eax
80101904:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101907:	8b 75 0c             	mov    0xc(%ebp),%esi
8010190a:	89 75 dc             	mov    %esi,-0x24(%ebp)
8010190d:	8b 75 10             	mov    0x10(%ebp),%esi
80101910:	89 75 e0             	mov    %esi,-0x20(%ebp)
80101913:	8b 75 14             	mov    0x14(%ebp),%esi
80101916:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101919:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
8010191e:	0f 84 b0 00 00 00    	je     801019d4 <writei+0xdc>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101924:	8b 75 d8             	mov    -0x28(%ebp),%esi
80101927:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010192a:	39 46 58             	cmp    %eax,0x58(%esi)
8010192d:	0f 82 dc 00 00 00    	jb     80101a0f <writei+0x117>
80101933:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101936:	31 c9                	xor    %ecx,%ecx
80101938:	01 d0                	add    %edx,%eax
8010193a:	0f 92 c1             	setb   %cl
8010193d:	89 ce                	mov    %ecx,%esi
8010193f:	0f 82 ca 00 00 00    	jb     80101a0f <writei+0x117>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101945:	3d 00 18 01 00       	cmp    $0x11800,%eax
8010194a:	0f 87 bf 00 00 00    	ja     80101a0f <writei+0x117>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101950:	85 d2                	test   %edx,%edx
80101952:	74 75                	je     801019c9 <writei+0xd1>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101954:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101957:	89 da                	mov    %ebx,%edx
80101959:	c1 ea 09             	shr    $0x9,%edx
8010195c:	8b 7d d8             	mov    -0x28(%ebp),%edi
8010195f:	89 f8                	mov    %edi,%eax
80101961:	e8 1a f9 ff ff       	call   80101280 <bmap>
80101966:	83 ec 08             	sub    $0x8,%esp
80101969:	50                   	push   %eax
8010196a:	ff 37                	pushl  (%edi)
8010196c:	e8 43 e7 ff ff       	call   801000b4 <bread>
80101971:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101973:	89 d8                	mov    %ebx,%eax
80101975:	25 ff 01 00 00       	and    $0x1ff,%eax
8010197a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010197d:	29 f1                	sub    %esi,%ecx
8010197f:	bb 00 02 00 00       	mov    $0x200,%ebx
80101984:	29 c3                	sub    %eax,%ebx
80101986:	83 c4 10             	add    $0x10,%esp
80101989:	39 cb                	cmp    %ecx,%ebx
8010198b:	76 02                	jbe    8010198f <writei+0x97>
8010198d:	89 cb                	mov    %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
8010198f:	52                   	push   %edx
80101990:	53                   	push   %ebx
80101991:	ff 75 dc             	pushl  -0x24(%ebp)
80101994:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101998:	50                   	push   %eax
80101999:	e8 d2 25 00 00       	call   80103f70 <memmove>
    log_write(bp);
8010199e:	89 3c 24             	mov    %edi,(%esp)
801019a1:	e8 52 10 00 00       	call   801029f8 <log_write>
    brelse(bp);
801019a6:	89 3c 24             	mov    %edi,(%esp)
801019a9:	e8 12 e8 ff ff       	call   801001c0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
801019ae:	01 de                	add    %ebx,%esi
801019b0:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019b3:	01 5d dc             	add    %ebx,-0x24(%ebp)
801019b6:	83 c4 10             	add    $0x10,%esp
801019b9:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801019bc:	77 96                	ja     80101954 <writei+0x5c>
  }

  if(n > 0 && off > ip->size){
801019be:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019c1:	8b 75 e0             	mov    -0x20(%ebp),%esi
801019c4:	3b 70 58             	cmp    0x58(%eax),%esi
801019c7:	77 2f                	ja     801019f8 <writei+0x100>
    ip->size = off;
    iupdate(ip);
  }
  return n;
801019c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801019cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019cf:	5b                   	pop    %ebx
801019d0:	5e                   	pop    %esi
801019d1:	5f                   	pop    %edi
801019d2:	5d                   	pop    %ebp
801019d3:	c3                   	ret    
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
801019d4:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019d8:	66 83 f8 09          	cmp    $0x9,%ax
801019dc:	77 31                	ja     80101a0f <writei+0x117>
801019de:	8b 04 c5 64 f9 10 80 	mov    -0x7fef069c(,%eax,8),%eax
801019e5:	85 c0                	test   %eax,%eax
801019e7:	74 26                	je     80101a0f <writei+0x117>
    return devsw[ip->major].write(ip, src, n);
801019e9:	89 75 10             	mov    %esi,0x10(%ebp)
}
801019ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019ef:	5b                   	pop    %ebx
801019f0:	5e                   	pop    %esi
801019f1:	5f                   	pop    %edi
801019f2:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
801019f3:	ff e0                	jmp    *%eax
801019f5:	8d 76 00             	lea    0x0(%esi),%esi
    ip->size = off;
801019f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019fb:	8b 75 e0             	mov    -0x20(%ebp),%esi
801019fe:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101a01:	83 ec 0c             	sub    $0xc,%esp
80101a04:	50                   	push   %eax
80101a05:	e8 aa fa ff ff       	call   801014b4 <iupdate>
80101a0a:	83 c4 10             	add    $0x10,%esp
80101a0d:	eb ba                	jmp    801019c9 <writei+0xd1>
      return -1;
80101a0f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a14:	eb b6                	jmp    801019cc <writei+0xd4>
80101a16:	66 90                	xchg   %ax,%ax

80101a18 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101a18:	55                   	push   %ebp
80101a19:	89 e5                	mov    %esp,%ebp
80101a1b:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101a1e:	6a 0e                	push   $0xe
80101a20:	ff 75 0c             	pushl  0xc(%ebp)
80101a23:	ff 75 08             	pushl  0x8(%ebp)
80101a26:	e8 95 25 00 00       	call   80103fc0 <strncmp>
}
80101a2b:	c9                   	leave  
80101a2c:	c3                   	ret    
80101a2d:	8d 76 00             	lea    0x0(%esi),%esi

80101a30 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101a30:	55                   	push   %ebp
80101a31:	89 e5                	mov    %esp,%ebp
80101a33:	57                   	push   %edi
80101a34:	56                   	push   %esi
80101a35:	53                   	push   %ebx
80101a36:	83 ec 1c             	sub    $0x1c,%esp
80101a39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101a3c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101a41:	75 7d                	jne    80101ac0 <dirlookup+0x90>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101a43:	8b 4b 58             	mov    0x58(%ebx),%ecx
80101a46:	85 c9                	test   %ecx,%ecx
80101a48:	74 3d                	je     80101a87 <dirlookup+0x57>
80101a4a:	31 ff                	xor    %edi,%edi
80101a4c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101a4f:	90                   	nop
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101a50:	6a 10                	push   $0x10
80101a52:	57                   	push   %edi
80101a53:	56                   	push   %esi
80101a54:	53                   	push   %ebx
80101a55:	e8 a6 fd ff ff       	call   80101800 <readi>
80101a5a:	83 c4 10             	add    $0x10,%esp
80101a5d:	83 f8 10             	cmp    $0x10,%eax
80101a60:	75 51                	jne    80101ab3 <dirlookup+0x83>
      panic("dirlookup read");
    if(de.inum == 0)
80101a62:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101a67:	74 16                	je     80101a7f <dirlookup+0x4f>
  return strncmp(s, t, DIRSIZ);
80101a69:	52                   	push   %edx
80101a6a:	6a 0e                	push   $0xe
80101a6c:	8d 45 da             	lea    -0x26(%ebp),%eax
80101a6f:	50                   	push   %eax
80101a70:	ff 75 0c             	pushl  0xc(%ebp)
80101a73:	e8 48 25 00 00       	call   80103fc0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101a78:	83 c4 10             	add    $0x10,%esp
80101a7b:	85 c0                	test   %eax,%eax
80101a7d:	74 15                	je     80101a94 <dirlookup+0x64>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101a7f:	83 c7 10             	add    $0x10,%edi
80101a82:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101a85:	72 c9                	jb     80101a50 <dirlookup+0x20>
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101a87:	31 c0                	xor    %eax,%eax
}
80101a89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a8c:	5b                   	pop    %ebx
80101a8d:	5e                   	pop    %esi
80101a8e:	5f                   	pop    %edi
80101a8f:	5d                   	pop    %ebp
80101a90:	c3                   	ret    
80101a91:	8d 76 00             	lea    0x0(%esi),%esi
      if(poff)
80101a94:	8b 45 10             	mov    0x10(%ebp),%eax
80101a97:	85 c0                	test   %eax,%eax
80101a99:	74 05                	je     80101aa0 <dirlookup+0x70>
        *poff = off;
80101a9b:	8b 45 10             	mov    0x10(%ebp),%eax
80101a9e:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101aa0:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101aa4:	8b 03                	mov    (%ebx),%eax
80101aa6:	e8 fd f6 ff ff       	call   801011a8 <iget>
}
80101aab:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101aae:	5b                   	pop    %ebx
80101aaf:	5e                   	pop    %esi
80101ab0:	5f                   	pop    %edi
80101ab1:	5d                   	pop    %ebp
80101ab2:	c3                   	ret    
      panic("dirlookup read");
80101ab3:	83 ec 0c             	sub    $0xc,%esp
80101ab6:	68 d9 66 10 80       	push   $0x801066d9
80101abb:	e8 80 e8 ff ff       	call   80100340 <panic>
    panic("dirlookup not DIR");
80101ac0:	83 ec 0c             	sub    $0xc,%esp
80101ac3:	68 c7 66 10 80       	push   $0x801066c7
80101ac8:	e8 73 e8 ff ff       	call   80100340 <panic>
80101acd:	8d 76 00             	lea    0x0(%esi),%esi

80101ad0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101ad0:	55                   	push   %ebp
80101ad1:	89 e5                	mov    %esp,%ebp
80101ad3:	57                   	push   %edi
80101ad4:	56                   	push   %esi
80101ad5:	53                   	push   %ebx
80101ad6:	83 ec 1c             	sub    $0x1c,%esp
80101ad9:	89 c3                	mov    %eax,%ebx
80101adb:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101ade:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101ae1:	80 38 2f             	cmpb   $0x2f,(%eax)
80101ae4:	0f 84 36 01 00 00    	je     80101c20 <namex+0x150>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101aea:	e8 71 18 00 00       	call   80103360 <myproc>
80101aef:	8b 70 6c             	mov    0x6c(%eax),%esi
  acquire(&icache.lock);
80101af2:	83 ec 0c             	sub    $0xc,%esp
80101af5:	68 e0 f9 10 80       	push   $0x8010f9e0
80101afa:	e8 0d 23 00 00       	call   80103e0c <acquire>
  ip->ref++;
80101aff:	ff 46 08             	incl   0x8(%esi)
  release(&icache.lock);
80101b02:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
80101b09:	e8 96 23 00 00       	call   80103ea4 <release>
80101b0e:	83 c4 10             	add    $0x10,%esp
80101b11:	89 df                	mov    %ebx,%edi
80101b13:	eb 04                	jmp    80101b19 <namex+0x49>
80101b15:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
80101b18:	47                   	inc    %edi
  while(*path == '/')
80101b19:	8a 07                	mov    (%edi),%al
80101b1b:	3c 2f                	cmp    $0x2f,%al
80101b1d:	74 f9                	je     80101b18 <namex+0x48>
  if(*path == 0)
80101b1f:	84 c0                	test   %al,%al
80101b21:	0f 84 b9 00 00 00    	je     80101be0 <namex+0x110>
  while(*path != '/' && *path != 0)
80101b27:	8a 07                	mov    (%edi),%al
80101b29:	89 fb                	mov    %edi,%ebx
80101b2b:	3c 2f                	cmp    $0x2f,%al
80101b2d:	75 0c                	jne    80101b3b <namex+0x6b>
80101b2f:	e9 e0 00 00 00       	jmp    80101c14 <namex+0x144>
    path++;
80101b34:	43                   	inc    %ebx
  while(*path != '/' && *path != 0)
80101b35:	8a 03                	mov    (%ebx),%al
80101b37:	3c 2f                	cmp    $0x2f,%al
80101b39:	74 04                	je     80101b3f <namex+0x6f>
80101b3b:	84 c0                	test   %al,%al
80101b3d:	75 f5                	jne    80101b34 <namex+0x64>
  len = path - s;
80101b3f:	89 d8                	mov    %ebx,%eax
80101b41:	29 f8                	sub    %edi,%eax
  if(len >= DIRSIZ)
80101b43:	83 f8 0d             	cmp    $0xd,%eax
80101b46:	7e 74                	jle    80101bbc <namex+0xec>
    memmove(name, s, DIRSIZ);
80101b48:	51                   	push   %ecx
80101b49:	6a 0e                	push   $0xe
80101b4b:	57                   	push   %edi
80101b4c:	ff 75 e4             	pushl  -0x1c(%ebp)
80101b4f:	e8 1c 24 00 00       	call   80103f70 <memmove>
80101b54:	83 c4 10             	add    $0x10,%esp
80101b57:	89 df                	mov    %ebx,%edi
  while(*path == '/')
80101b59:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101b5c:	75 08                	jne    80101b66 <namex+0x96>
80101b5e:	66 90                	xchg   %ax,%ax
    path++;
80101b60:	47                   	inc    %edi
  while(*path == '/')
80101b61:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101b64:	74 fa                	je     80101b60 <namex+0x90>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101b66:	83 ec 0c             	sub    $0xc,%esp
80101b69:	56                   	push   %esi
80101b6a:	e8 ed f9 ff ff       	call   8010155c <ilock>
    if(ip->type != T_DIR){
80101b6f:	83 c4 10             	add    $0x10,%esp
80101b72:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101b77:	75 7b                	jne    80101bf4 <namex+0x124>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101b79:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b7c:	85 c0                	test   %eax,%eax
80101b7e:	74 09                	je     80101b89 <namex+0xb9>
80101b80:	80 3f 00             	cmpb   $0x0,(%edi)
80101b83:	0f 84 af 00 00 00    	je     80101c38 <namex+0x168>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101b89:	50                   	push   %eax
80101b8a:	6a 00                	push   $0x0
80101b8c:	ff 75 e4             	pushl  -0x1c(%ebp)
80101b8f:	56                   	push   %esi
80101b90:	e8 9b fe ff ff       	call   80101a30 <dirlookup>
80101b95:	89 c3                	mov    %eax,%ebx
80101b97:	83 c4 10             	add    $0x10,%esp
80101b9a:	85 c0                	test   %eax,%eax
80101b9c:	74 56                	je     80101bf4 <namex+0x124>
  iunlock(ip);
80101b9e:	83 ec 0c             	sub    $0xc,%esp
80101ba1:	56                   	push   %esi
80101ba2:	e8 7d fa ff ff       	call   80101624 <iunlock>
  iput(ip);
80101ba7:	89 34 24             	mov    %esi,(%esp)
80101baa:	e8 b9 fa ff ff       	call   80101668 <iput>
80101baf:	83 c4 10             	add    $0x10,%esp
80101bb2:	89 de                	mov    %ebx,%esi
  while(*path == '/')
80101bb4:	e9 60 ff ff ff       	jmp    80101b19 <namex+0x49>
80101bb9:	8d 76 00             	lea    0x0(%esi),%esi
80101bbc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101bbf:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80101bc2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
    memmove(name, s, len);
80101bc5:	52                   	push   %edx
80101bc6:	50                   	push   %eax
80101bc7:	57                   	push   %edi
80101bc8:	ff 75 e4             	pushl  -0x1c(%ebp)
80101bcb:	e8 a0 23 00 00       	call   80103f70 <memmove>
    name[len] = 0;
80101bd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101bd3:	c6 00 00             	movb   $0x0,(%eax)
80101bd6:	83 c4 10             	add    $0x10,%esp
80101bd9:	89 df                	mov    %ebx,%edi
80101bdb:	e9 79 ff ff ff       	jmp    80101b59 <namex+0x89>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101be0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101be3:	85 db                	test   %ebx,%ebx
80101be5:	75 69                	jne    80101c50 <namex+0x180>
    iput(ip);
    return 0;
  }
  return ip;
}
80101be7:	89 f0                	mov    %esi,%eax
80101be9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bec:	5b                   	pop    %ebx
80101bed:	5e                   	pop    %esi
80101bee:	5f                   	pop    %edi
80101bef:	5d                   	pop    %ebp
80101bf0:	c3                   	ret    
80101bf1:	8d 76 00             	lea    0x0(%esi),%esi
  iunlock(ip);
80101bf4:	83 ec 0c             	sub    $0xc,%esp
80101bf7:	56                   	push   %esi
80101bf8:	e8 27 fa ff ff       	call   80101624 <iunlock>
  iput(ip);
80101bfd:	89 34 24             	mov    %esi,(%esp)
80101c00:	e8 63 fa ff ff       	call   80101668 <iput>
      return 0;
80101c05:	83 c4 10             	add    $0x10,%esp
80101c08:	31 f6                	xor    %esi,%esi
}
80101c0a:	89 f0                	mov    %esi,%eax
80101c0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0f:	5b                   	pop    %ebx
80101c10:	5e                   	pop    %esi
80101c11:	5f                   	pop    %edi
80101c12:	5d                   	pop    %ebp
80101c13:	c3                   	ret    
  while(*path != '/' && *path != 0)
80101c14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c17:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101c1a:	31 c0                	xor    %eax,%eax
80101c1c:	eb a7                	jmp    80101bc5 <namex+0xf5>
80101c1e:	66 90                	xchg   %ax,%ax
    ip = iget(ROOTDEV, ROOTINO);
80101c20:	ba 01 00 00 00       	mov    $0x1,%edx
80101c25:	b8 01 00 00 00       	mov    $0x1,%eax
80101c2a:	e8 79 f5 ff ff       	call   801011a8 <iget>
80101c2f:	89 c6                	mov    %eax,%esi
80101c31:	89 df                	mov    %ebx,%edi
80101c33:	e9 e1 fe ff ff       	jmp    80101b19 <namex+0x49>
      iunlock(ip);
80101c38:	83 ec 0c             	sub    $0xc,%esp
80101c3b:	56                   	push   %esi
80101c3c:	e8 e3 f9 ff ff       	call   80101624 <iunlock>
      return ip;
80101c41:	83 c4 10             	add    $0x10,%esp
}
80101c44:	89 f0                	mov    %esi,%eax
80101c46:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c49:	5b                   	pop    %ebx
80101c4a:	5e                   	pop    %esi
80101c4b:	5f                   	pop    %edi
80101c4c:	5d                   	pop    %ebp
80101c4d:	c3                   	ret    
80101c4e:	66 90                	xchg   %ax,%ax
    iput(ip);
80101c50:	83 ec 0c             	sub    $0xc,%esp
80101c53:	56                   	push   %esi
80101c54:	e8 0f fa ff ff       	call   80101668 <iput>
    return 0;
80101c59:	83 c4 10             	add    $0x10,%esp
80101c5c:	31 f6                	xor    %esi,%esi
80101c5e:	eb 87                	jmp    80101be7 <namex+0x117>

80101c60 <dirlink>:
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	56                   	push   %esi
80101c65:	53                   	push   %ebx
80101c66:	83 ec 20             	sub    $0x20,%esp
80101c69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101c6c:	6a 00                	push   $0x0
80101c6e:	ff 75 0c             	pushl  0xc(%ebp)
80101c71:	53                   	push   %ebx
80101c72:	e8 b9 fd ff ff       	call   80101a30 <dirlookup>
80101c77:	83 c4 10             	add    $0x10,%esp
80101c7a:	85 c0                	test   %eax,%eax
80101c7c:	75 65                	jne    80101ce3 <dirlink+0x83>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c7e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101c81:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c84:	85 ff                	test   %edi,%edi
80101c86:	74 29                	je     80101cb1 <dirlink+0x51>
80101c88:	31 ff                	xor    %edi,%edi
80101c8a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c8d:	eb 09                	jmp    80101c98 <dirlink+0x38>
80101c8f:	90                   	nop
80101c90:	83 c7 10             	add    $0x10,%edi
80101c93:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c96:	73 19                	jae    80101cb1 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c98:	6a 10                	push   $0x10
80101c9a:	57                   	push   %edi
80101c9b:	56                   	push   %esi
80101c9c:	53                   	push   %ebx
80101c9d:	e8 5e fb ff ff       	call   80101800 <readi>
80101ca2:	83 c4 10             	add    $0x10,%esp
80101ca5:	83 f8 10             	cmp    $0x10,%eax
80101ca8:	75 4c                	jne    80101cf6 <dirlink+0x96>
    if(de.inum == 0)
80101caa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101caf:	75 df                	jne    80101c90 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101cb1:	50                   	push   %eax
80101cb2:	6a 0e                	push   $0xe
80101cb4:	ff 75 0c             	pushl  0xc(%ebp)
80101cb7:	8d 45 da             	lea    -0x26(%ebp),%eax
80101cba:	50                   	push   %eax
80101cbb:	e8 3c 23 00 00       	call   80103ffc <strncpy>
  de.inum = inum;
80101cc0:	8b 45 10             	mov    0x10(%ebp),%eax
80101cc3:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101cc7:	6a 10                	push   $0x10
80101cc9:	57                   	push   %edi
80101cca:	56                   	push   %esi
80101ccb:	53                   	push   %ebx
80101ccc:	e8 27 fc ff ff       	call   801018f8 <writei>
80101cd1:	83 c4 20             	add    $0x20,%esp
80101cd4:	83 f8 10             	cmp    $0x10,%eax
80101cd7:	75 2a                	jne    80101d03 <dirlink+0xa3>
  return 0;
80101cd9:	31 c0                	xor    %eax,%eax
}
80101cdb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101cde:	5b                   	pop    %ebx
80101cdf:	5e                   	pop    %esi
80101ce0:	5f                   	pop    %edi
80101ce1:	5d                   	pop    %ebp
80101ce2:	c3                   	ret    
    iput(ip);
80101ce3:	83 ec 0c             	sub    $0xc,%esp
80101ce6:	50                   	push   %eax
80101ce7:	e8 7c f9 ff ff       	call   80101668 <iput>
    return -1;
80101cec:	83 c4 10             	add    $0x10,%esp
80101cef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cf4:	eb e5                	jmp    80101cdb <dirlink+0x7b>
      panic("dirlink read");
80101cf6:	83 ec 0c             	sub    $0xc,%esp
80101cf9:	68 e8 66 10 80       	push   $0x801066e8
80101cfe:	e8 3d e6 ff ff       	call   80100340 <panic>
    panic("dirlink");
80101d03:	83 ec 0c             	sub    $0xc,%esp
80101d06:	68 c2 6c 10 80       	push   $0x80106cc2
80101d0b:	e8 30 e6 ff ff       	call   80100340 <panic>

80101d10 <namei>:

struct inode*
namei(char *path)
{
80101d10:	55                   	push   %ebp
80101d11:	89 e5                	mov    %esp,%ebp
80101d13:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101d16:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101d19:	31 d2                	xor    %edx,%edx
80101d1b:	8b 45 08             	mov    0x8(%ebp),%eax
80101d1e:	e8 ad fd ff ff       	call   80101ad0 <namex>
}
80101d23:	c9                   	leave  
80101d24:	c3                   	ret    
80101d25:	8d 76 00             	lea    0x0(%esi),%esi

80101d28 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101d28:	55                   	push   %ebp
80101d29:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101d2b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101d2e:	ba 01 00 00 00       	mov    $0x1,%edx
80101d33:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101d36:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101d37:	e9 94 fd ff ff       	jmp    80101ad0 <namex>

80101d3c <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101d3c:	55                   	push   %ebp
80101d3d:	89 e5                	mov    %esp,%ebp
80101d3f:	57                   	push   %edi
80101d40:	56                   	push   %esi
80101d41:	53                   	push   %ebx
80101d42:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101d45:	85 c0                	test   %eax,%eax
80101d47:	0f 84 99 00 00 00    	je     80101de6 <idestart+0xaa>
80101d4d:	89 c3                	mov    %eax,%ebx
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101d4f:	8b 70 08             	mov    0x8(%eax),%esi
80101d52:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
80101d58:	77 7f                	ja     80101dd9 <idestart+0x9d>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101d5a:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101d5f:	90                   	nop
80101d60:	89 ca                	mov    %ecx,%edx
80101d62:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101d63:	83 e0 c0             	and    $0xffffffc0,%eax
80101d66:	3c 40                	cmp    $0x40,%al
80101d68:	75 f6                	jne    80101d60 <idestart+0x24>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101d6a:	31 ff                	xor    %edi,%edi
80101d6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101d71:	89 f8                	mov    %edi,%eax
80101d73:	ee                   	out    %al,(%dx)
80101d74:	b0 01                	mov    $0x1,%al
80101d76:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101d7b:	ee                   	out    %al,(%dx)
80101d7c:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101d81:	89 f0                	mov    %esi,%eax
80101d83:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101d84:	89 f0                	mov    %esi,%eax
80101d86:	c1 f8 08             	sar    $0x8,%eax
80101d89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101d8e:	ee                   	out    %al,(%dx)
80101d8f:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101d94:	89 f8                	mov    %edi,%eax
80101d96:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101d97:	8a 43 04             	mov    0x4(%ebx),%al
80101d9a:	c1 e0 04             	shl    $0x4,%eax
80101d9d:	83 e0 10             	and    $0x10,%eax
80101da0:	83 c8 e0             	or     $0xffffffe0,%eax
80101da3:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101da8:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101da9:	f6 03 04             	testb  $0x4,(%ebx)
80101dac:	75 0e                	jne    80101dbc <idestart+0x80>
80101dae:	b0 20                	mov    $0x20,%al
80101db0:	89 ca                	mov    %ecx,%edx
80101db2:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101db3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db6:	5b                   	pop    %ebx
80101db7:	5e                   	pop    %esi
80101db8:	5f                   	pop    %edi
80101db9:	5d                   	pop    %ebp
80101dba:	c3                   	ret    
80101dbb:	90                   	nop
80101dbc:	b0 30                	mov    $0x30,%al
80101dbe:	89 ca                	mov    %ecx,%edx
80101dc0:	ee                   	out    %al,(%dx)
    outsl(0x1f0, b->data, BSIZE/4);
80101dc1:	8d 73 5c             	lea    0x5c(%ebx),%esi
  asm volatile("cld; rep outsl" :
80101dc4:	b9 80 00 00 00       	mov    $0x80,%ecx
80101dc9:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101dce:	fc                   	cld    
80101dcf:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101dd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dd4:	5b                   	pop    %ebx
80101dd5:	5e                   	pop    %esi
80101dd6:	5f                   	pop    %edi
80101dd7:	5d                   	pop    %ebp
80101dd8:	c3                   	ret    
    panic("incorrect blockno");
80101dd9:	83 ec 0c             	sub    $0xc,%esp
80101ddc:	68 54 67 10 80       	push   $0x80106754
80101de1:	e8 5a e5 ff ff       	call   80100340 <panic>
    panic("idestart");
80101de6:	83 ec 0c             	sub    $0xc,%esp
80101de9:	68 4b 67 10 80       	push   $0x8010674b
80101dee:	e8 4d e5 ff ff       	call   80100340 <panic>
80101df3:	90                   	nop

80101df4 <ideinit>:
{
80101df4:	55                   	push   %ebp
80101df5:	89 e5                	mov    %esp,%ebp
80101df7:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80101dfa:	68 66 67 10 80       	push   $0x80106766
80101dff:	68 80 95 10 80       	push   $0x80109580
80101e04:	e8 c3 1e 00 00       	call   80103ccc <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101e09:	58                   	pop    %eax
80101e0a:	5a                   	pop    %edx
80101e0b:	a1 00 1d 11 80       	mov    0x80111d00,%eax
80101e10:	48                   	dec    %eax
80101e11:	50                   	push   %eax
80101e12:	6a 0e                	push   $0xe
80101e14:	e8 57 02 00 00       	call   80102070 <ioapicenable>
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101e19:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101e1c:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101e21:	8d 76 00             	lea    0x0(%esi),%esi
80101e24:	ec                   	in     (%dx),%al
80101e25:	83 e0 c0             	and    $0xffffffc0,%eax
80101e28:	3c 40                	cmp    $0x40,%al
80101e2a:	75 f8                	jne    80101e24 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101e2c:	b0 f0                	mov    $0xf0,%al
80101e2e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101e33:	ee                   	out    %al,(%dx)
80101e34:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101e39:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101e3e:	eb 03                	jmp    80101e43 <ideinit+0x4f>
  for(i=0; i<1000; i++){
80101e40:	49                   	dec    %ecx
80101e41:	74 0f                	je     80101e52 <ideinit+0x5e>
80101e43:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80101e44:	84 c0                	test   %al,%al
80101e46:	74 f8                	je     80101e40 <ideinit+0x4c>
      havedisk1 = 1;
80101e48:	c7 05 60 95 10 80 01 	movl   $0x1,0x80109560
80101e4f:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101e52:	b0 e0                	mov    $0xe0,%al
80101e54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101e59:	ee                   	out    %al,(%dx)
}
80101e5a:	c9                   	leave  
80101e5b:	c3                   	ret    

80101e5c <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80101e5c:	55                   	push   %ebp
80101e5d:	89 e5                	mov    %esp,%ebp
80101e5f:	57                   	push   %edi
80101e60:	56                   	push   %esi
80101e61:	53                   	push   %ebx
80101e62:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80101e65:	68 80 95 10 80       	push   $0x80109580
80101e6a:	e8 9d 1f 00 00       	call   80103e0c <acquire>

  if((b = idequeue) == 0){
80101e6f:	8b 1d 64 95 10 80    	mov    0x80109564,%ebx
80101e75:	83 c4 10             	add    $0x10,%esp
80101e78:	85 db                	test   %ebx,%ebx
80101e7a:	74 5b                	je     80101ed7 <ideintr+0x7b>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80101e7c:	8b 43 58             	mov    0x58(%ebx),%eax
80101e7f:	a3 64 95 10 80       	mov    %eax,0x80109564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80101e84:	8b 33                	mov    (%ebx),%esi
80101e86:	f7 c6 04 00 00 00    	test   $0x4,%esi
80101e8c:	75 27                	jne    80101eb5 <ideintr+0x59>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101e8e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101e93:	90                   	nop
80101e94:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101e95:	88 c1                	mov    %al,%cl
80101e97:	83 e1 c0             	and    $0xffffffc0,%ecx
80101e9a:	80 f9 40             	cmp    $0x40,%cl
80101e9d:	75 f5                	jne    80101e94 <ideintr+0x38>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80101e9f:	a8 21                	test   $0x21,%al
80101ea1:	75 12                	jne    80101eb5 <ideintr+0x59>
    insl(0x1f0, b->data, BSIZE/4);
80101ea3:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80101ea6:	b9 80 00 00 00       	mov    $0x80,%ecx
80101eab:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101eb0:	fc                   	cld    
80101eb1:	f3 6d                	rep insl (%dx),%es:(%edi)
80101eb3:	8b 33                	mov    (%ebx),%esi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80101eb5:	83 e6 fb             	and    $0xfffffffb,%esi
80101eb8:	83 ce 02             	or     $0x2,%esi
80101ebb:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
80101ebd:	83 ec 0c             	sub    $0xc,%esp
80101ec0:	53                   	push   %ebx
80101ec1:	e8 7a 1b 00 00       	call   80103a40 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80101ec6:	a1 64 95 10 80       	mov    0x80109564,%eax
80101ecb:	83 c4 10             	add    $0x10,%esp
80101ece:	85 c0                	test   %eax,%eax
80101ed0:	74 05                	je     80101ed7 <ideintr+0x7b>
    idestart(idequeue);
80101ed2:	e8 65 fe ff ff       	call   80101d3c <idestart>
    release(&idelock);
80101ed7:	83 ec 0c             	sub    $0xc,%esp
80101eda:	68 80 95 10 80       	push   $0x80109580
80101edf:	e8 c0 1f 00 00       	call   80103ea4 <release>

  release(&idelock);
}
80101ee4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ee7:	5b                   	pop    %ebx
80101ee8:	5e                   	pop    %esi
80101ee9:	5f                   	pop    %edi
80101eea:	5d                   	pop    %ebp
80101eeb:	c3                   	ret    

80101eec <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80101eec:	55                   	push   %ebp
80101eed:	89 e5                	mov    %esp,%ebp
80101eef:	53                   	push   %ebx
80101ef0:	83 ec 10             	sub    $0x10,%esp
80101ef3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
80101ef6:	8d 43 0c             	lea    0xc(%ebx),%eax
80101ef9:	50                   	push   %eax
80101efa:	e8 81 1d 00 00       	call   80103c80 <holdingsleep>
80101eff:	83 c4 10             	add    $0x10,%esp
80101f02:	85 c0                	test   %eax,%eax
80101f04:	0f 84 b7 00 00 00    	je     80101fc1 <iderw+0xd5>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
80101f0a:	8b 03                	mov    (%ebx),%eax
80101f0c:	83 e0 06             	and    $0x6,%eax
80101f0f:	83 f8 02             	cmp    $0x2,%eax
80101f12:	0f 84 9c 00 00 00    	je     80101fb4 <iderw+0xc8>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
80101f18:	8b 53 04             	mov    0x4(%ebx),%edx
80101f1b:	85 d2                	test   %edx,%edx
80101f1d:	74 09                	je     80101f28 <iderw+0x3c>
80101f1f:	a1 60 95 10 80       	mov    0x80109560,%eax
80101f24:	85 c0                	test   %eax,%eax
80101f26:	74 7f                	je     80101fa7 <iderw+0xbb>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80101f28:	83 ec 0c             	sub    $0xc,%esp
80101f2b:	68 80 95 10 80       	push   $0x80109580
80101f30:	e8 d7 1e 00 00       	call   80103e0c <acquire>

  // Append b to idequeue.
  b->qnext = 0;
80101f35:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80101f3c:	a1 64 95 10 80       	mov    0x80109564,%eax
80101f41:	83 c4 10             	add    $0x10,%esp
80101f44:	85 c0                	test   %eax,%eax
80101f46:	74 58                	je     80101fa0 <iderw+0xb4>
80101f48:	89 c2                	mov    %eax,%edx
80101f4a:	8b 40 58             	mov    0x58(%eax),%eax
80101f4d:	85 c0                	test   %eax,%eax
80101f4f:	75 f7                	jne    80101f48 <iderw+0x5c>
80101f51:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80101f54:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80101f56:	39 1d 64 95 10 80    	cmp    %ebx,0x80109564
80101f5c:	74 36                	je     80101f94 <iderw+0xa8>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80101f5e:	8b 03                	mov    (%ebx),%eax
80101f60:	83 e0 06             	and    $0x6,%eax
80101f63:	83 f8 02             	cmp    $0x2,%eax
80101f66:	74 1b                	je     80101f83 <iderw+0x97>
    sleep(b, &idelock);
80101f68:	83 ec 08             	sub    $0x8,%esp
80101f6b:	68 80 95 10 80       	push   $0x80109580
80101f70:	53                   	push   %ebx
80101f71:	e8 1e 19 00 00       	call   80103894 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80101f76:	8b 03                	mov    (%ebx),%eax
80101f78:	83 e0 06             	and    $0x6,%eax
80101f7b:	83 c4 10             	add    $0x10,%esp
80101f7e:	83 f8 02             	cmp    $0x2,%eax
80101f81:	75 e5                	jne    80101f68 <iderw+0x7c>
  }


  release(&idelock);
80101f83:	c7 45 08 80 95 10 80 	movl   $0x80109580,0x8(%ebp)
}
80101f8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101f8d:	c9                   	leave  
  release(&idelock);
80101f8e:	e9 11 1f 00 00       	jmp    80103ea4 <release>
80101f93:	90                   	nop
    idestart(b);
80101f94:	89 d8                	mov    %ebx,%eax
80101f96:	e8 a1 fd ff ff       	call   80101d3c <idestart>
80101f9b:	eb c1                	jmp    80101f5e <iderw+0x72>
80101f9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80101fa0:	ba 64 95 10 80       	mov    $0x80109564,%edx
80101fa5:	eb ad                	jmp    80101f54 <iderw+0x68>
    panic("iderw: ide disk 1 not present");
80101fa7:	83 ec 0c             	sub    $0xc,%esp
80101faa:	68 95 67 10 80       	push   $0x80106795
80101faf:	e8 8c e3 ff ff       	call   80100340 <panic>
    panic("iderw: nothing to do");
80101fb4:	83 ec 0c             	sub    $0xc,%esp
80101fb7:	68 80 67 10 80       	push   $0x80106780
80101fbc:	e8 7f e3 ff ff       	call   80100340 <panic>
    panic("iderw: buf not locked");
80101fc1:	83 ec 0c             	sub    $0xc,%esp
80101fc4:	68 6a 67 10 80       	push   $0x8010676a
80101fc9:	e8 72 e3 ff ff       	call   80100340 <panic>
80101fce:	66 90                	xchg   %ax,%ax

80101fd0 <ioapicinit>:
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	56                   	push   %esi
80101fd4:	53                   	push   %ebx
80101fd5:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
80101fdc:	00 c0 fe 
80101fdf:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80101fe6:	00 00 00 
80101fe9:	8b 15 34 16 11 80    	mov    0x80111634,%edx
80101fef:	8b 72 10             	mov    0x10(%edx),%esi
80101ff2:	c1 ee 10             	shr    $0x10,%esi
80101ff5:	89 f0                	mov    %esi,%eax
80101ff7:	0f b6 f0             	movzbl %al,%esi
80101ffa:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102000:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102006:	8b 41 10             	mov    0x10(%ecx),%eax
80102009:	0f b6 15 60 17 11 80 	movzbl 0x80111760,%edx
80102010:	c1 e8 18             	shr    $0x18,%eax
80102013:	39 c2                	cmp    %eax,%edx
80102015:	74 16                	je     8010202d <ioapicinit+0x5d>
80102017:	83 ec 0c             	sub    $0xc,%esp
8010201a:	68 b4 67 10 80       	push   $0x801067b4
8010201f:	e8 fc e5 ff ff       	call   80100620 <cprintf>
80102024:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010202a:	83 c4 10             	add    $0x10,%esp
8010202d:	83 c6 21             	add    $0x21,%esi
80102030:	ba 10 00 00 00       	mov    $0x10,%edx
80102035:	b8 20 00 00 00       	mov    $0x20,%eax
8010203a:	66 90                	xchg   %ax,%ax
8010203c:	89 c3                	mov    %eax,%ebx
8010203e:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102044:	89 11                	mov    %edx,(%ecx)
80102046:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010204c:	89 59 10             	mov    %ebx,0x10(%ecx)
8010204f:	8d 5a 01             	lea    0x1(%edx),%ebx
80102052:	89 19                	mov    %ebx,(%ecx)
80102054:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010205a:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
80102061:	40                   	inc    %eax
80102062:	83 c2 02             	add    $0x2,%edx
80102065:	39 f0                	cmp    %esi,%eax
80102067:	75 d3                	jne    8010203c <ioapicinit+0x6c>
80102069:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010206c:	5b                   	pop    %ebx
8010206d:	5e                   	pop    %esi
8010206e:	5d                   	pop    %ebp
8010206f:	c3                   	ret    

80102070 <ioapicenable>:
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	8b 45 08             	mov    0x8(%ebp),%eax
80102076:	8d 50 20             	lea    0x20(%eax),%edx
80102079:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
8010207d:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102083:	89 01                	mov    %eax,(%ecx)
80102085:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010208b:	89 51 10             	mov    %edx,0x10(%ecx)
8010208e:	8b 55 0c             	mov    0xc(%ebp),%edx
80102091:	c1 e2 18             	shl    $0x18,%edx
80102094:	40                   	inc    %eax
80102095:	89 01                	mov    %eax,(%ecx)
80102097:	a1 34 16 11 80       	mov    0x80111634,%eax
8010209c:	89 50 10             	mov    %edx,0x10(%eax)
8010209f:	5d                   	pop    %ebp
801020a0:	c3                   	ret    
801020a1:	66 90                	xchg   %ax,%ax
801020a3:	90                   	nop

801020a4 <kfree>:
801020a4:	55                   	push   %ebp
801020a5:	89 e5                	mov    %esp,%ebp
801020a7:	53                   	push   %ebx
801020a8:	53                   	push   %ebx
801020a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020ac:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801020b2:	75 70                	jne    80102124 <kfree+0x80>
801020b4:	81 fb a8 45 11 80    	cmp    $0x801145a8,%ebx
801020ba:	72 68                	jb     80102124 <kfree+0x80>
801020bc:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801020c2:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801020c7:	77 5b                	ja     80102124 <kfree+0x80>
801020c9:	52                   	push   %edx
801020ca:	68 00 10 00 00       	push   $0x1000
801020cf:	6a 01                	push   $0x1
801020d1:	53                   	push   %ebx
801020d2:	e8 15 1e 00 00       	call   80103eec <memset>
801020d7:	83 c4 10             	add    $0x10,%esp
801020da:	8b 0d 74 16 11 80    	mov    0x80111674,%ecx
801020e0:	85 c9                	test   %ecx,%ecx
801020e2:	75 1c                	jne    80102100 <kfree+0x5c>
801020e4:	a1 78 16 11 80       	mov    0x80111678,%eax
801020e9:	89 03                	mov    %eax,(%ebx)
801020eb:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
801020f1:	a1 74 16 11 80       	mov    0x80111674,%eax
801020f6:	85 c0                	test   %eax,%eax
801020f8:	75 1a                	jne    80102114 <kfree+0x70>
801020fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801020fd:	c9                   	leave  
801020fe:	c3                   	ret    
801020ff:	90                   	nop
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 40 16 11 80       	push   $0x80111640
80102108:	e8 ff 1c 00 00       	call   80103e0c <acquire>
8010210d:	83 c4 10             	add    $0x10,%esp
80102110:	eb d2                	jmp    801020e4 <kfree+0x40>
80102112:	66 90                	xchg   %ax,%ax
80102114:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
8010211b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010211e:	c9                   	leave  
8010211f:	e9 80 1d 00 00       	jmp    80103ea4 <release>
80102124:	83 ec 0c             	sub    $0xc,%esp
80102127:	68 e6 67 10 80       	push   $0x801067e6
8010212c:	e8 0f e2 ff ff       	call   80100340 <panic>
80102131:	8d 76 00             	lea    0x0(%esi),%esi

80102134 <freerange>:
80102134:	55                   	push   %ebp
80102135:	89 e5                	mov    %esp,%ebp
80102137:	56                   	push   %esi
80102138:	53                   	push   %ebx
80102139:	8b 75 0c             	mov    0xc(%ebp),%esi
8010213c:	8b 45 08             	mov    0x8(%ebp),%eax
8010213f:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102145:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010214b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102151:	39 de                	cmp    %ebx,%esi
80102153:	72 1f                	jb     80102174 <freerange+0x40>
80102155:	8d 76 00             	lea    0x0(%esi),%esi
80102158:	83 ec 0c             	sub    $0xc,%esp
8010215b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102161:	50                   	push   %eax
80102162:	e8 3d ff ff ff       	call   801020a4 <kfree>
80102167:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010216d:	83 c4 10             	add    $0x10,%esp
80102170:	39 f3                	cmp    %esi,%ebx
80102172:	76 e4                	jbe    80102158 <freerange+0x24>
80102174:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102177:	5b                   	pop    %ebx
80102178:	5e                   	pop    %esi
80102179:	5d                   	pop    %ebp
8010217a:	c3                   	ret    
8010217b:	90                   	nop

8010217c <kinit1>:
8010217c:	55                   	push   %ebp
8010217d:	89 e5                	mov    %esp,%ebp
8010217f:	56                   	push   %esi
80102180:	53                   	push   %ebx
80102181:	8b 75 0c             	mov    0xc(%ebp),%esi
80102184:	83 ec 08             	sub    $0x8,%esp
80102187:	68 ec 67 10 80       	push   $0x801067ec
8010218c:	68 40 16 11 80       	push   $0x80111640
80102191:	e8 36 1b 00 00       	call   80103ccc <initlock>
80102196:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
8010219d:	00 00 00 
801021a0:	8b 45 08             	mov    0x8(%ebp),%eax
801021a3:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801021a9:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801021af:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801021b5:	83 c4 10             	add    $0x10,%esp
801021b8:	39 de                	cmp    %ebx,%esi
801021ba:	72 1c                	jb     801021d8 <kinit1+0x5c>
801021bc:	83 ec 0c             	sub    $0xc,%esp
801021bf:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801021c5:	50                   	push   %eax
801021c6:	e8 d9 fe ff ff       	call   801020a4 <kfree>
801021cb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801021d1:	83 c4 10             	add    $0x10,%esp
801021d4:	39 de                	cmp    %ebx,%esi
801021d6:	73 e4                	jae    801021bc <kinit1+0x40>
801021d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801021db:	5b                   	pop    %ebx
801021dc:	5e                   	pop    %esi
801021dd:	5d                   	pop    %ebp
801021de:	c3                   	ret    
801021df:	90                   	nop

801021e0 <kinit2>:
801021e0:	55                   	push   %ebp
801021e1:	89 e5                	mov    %esp,%ebp
801021e3:	56                   	push   %esi
801021e4:	53                   	push   %ebx
801021e5:	8b 75 0c             	mov    0xc(%ebp),%esi
801021e8:	8b 45 08             	mov    0x8(%ebp),%eax
801021eb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801021f1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801021f7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801021fd:	39 de                	cmp    %ebx,%esi
801021ff:	72 1f                	jb     80102220 <kinit2+0x40>
80102201:	8d 76 00             	lea    0x0(%esi),%esi
80102204:	83 ec 0c             	sub    $0xc,%esp
80102207:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010220d:	50                   	push   %eax
8010220e:	e8 91 fe ff ff       	call   801020a4 <kfree>
80102213:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102219:	83 c4 10             	add    $0x10,%esp
8010221c:	39 de                	cmp    %ebx,%esi
8010221e:	73 e4                	jae    80102204 <kinit2+0x24>
80102220:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
80102227:	00 00 00 
8010222a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010222d:	5b                   	pop    %ebx
8010222e:	5e                   	pop    %esi
8010222f:	5d                   	pop    %ebp
80102230:	c3                   	ret    
80102231:	8d 76 00             	lea    0x0(%esi),%esi

80102234 <kalloc>:
80102234:	a1 74 16 11 80       	mov    0x80111674,%eax
80102239:	85 c0                	test   %eax,%eax
8010223b:	75 17                	jne    80102254 <kalloc+0x20>
8010223d:	a1 78 16 11 80       	mov    0x80111678,%eax
80102242:	85 c0                	test   %eax,%eax
80102244:	74 0a                	je     80102250 <kalloc+0x1c>
80102246:	8b 10                	mov    (%eax),%edx
80102248:	89 15 78 16 11 80    	mov    %edx,0x80111678
8010224e:	c3                   	ret    
8010224f:	90                   	nop
80102250:	c3                   	ret    
80102251:	8d 76 00             	lea    0x0(%esi),%esi
80102254:	55                   	push   %ebp
80102255:	89 e5                	mov    %esp,%ebp
80102257:	83 ec 24             	sub    $0x24,%esp
8010225a:	68 40 16 11 80       	push   $0x80111640
8010225f:	e8 a8 1b 00 00       	call   80103e0c <acquire>
80102264:	a1 78 16 11 80       	mov    0x80111678,%eax
80102269:	83 c4 10             	add    $0x10,%esp
8010226c:	8b 15 74 16 11 80    	mov    0x80111674,%edx
80102272:	85 c0                	test   %eax,%eax
80102274:	74 08                	je     8010227e <kalloc+0x4a>
80102276:	8b 08                	mov    (%eax),%ecx
80102278:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
8010227e:	85 d2                	test   %edx,%edx
80102280:	74 16                	je     80102298 <kalloc+0x64>
80102282:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102285:	83 ec 0c             	sub    $0xc,%esp
80102288:	68 40 16 11 80       	push   $0x80111640
8010228d:	e8 12 1c 00 00       	call   80103ea4 <release>
80102292:	83 c4 10             	add    $0x10,%esp
80102295:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102298:	c9                   	leave  
80102299:	c3                   	ret    
8010229a:	66 90                	xchg   %ax,%ax

8010229c <kbdgetc>:
8010229c:	ba 64 00 00 00       	mov    $0x64,%edx
801022a1:	ec                   	in     (%dx),%al
801022a2:	a8 01                	test   $0x1,%al
801022a4:	0f 84 ae 00 00 00    	je     80102358 <kbdgetc+0xbc>
801022aa:	55                   	push   %ebp
801022ab:	89 e5                	mov    %esp,%ebp
801022ad:	53                   	push   %ebx
801022ae:	ba 60 00 00 00       	mov    $0x60,%edx
801022b3:	ec                   	in     (%dx),%al
801022b4:	0f b6 d8             	movzbl %al,%ebx
801022b7:	8b 15 b4 95 10 80    	mov    0x801095b4,%edx
801022bd:	3c e0                	cmp    $0xe0,%al
801022bf:	74 5b                	je     8010231c <kbdgetc+0x80>
801022c1:	89 d1                	mov    %edx,%ecx
801022c3:	83 e1 40             	and    $0x40,%ecx
801022c6:	84 c0                	test   %al,%al
801022c8:	78 62                	js     8010232c <kbdgetc+0x90>
801022ca:	85 c9                	test   %ecx,%ecx
801022cc:	74 09                	je     801022d7 <kbdgetc+0x3b>
801022ce:	83 c8 80             	or     $0xffffff80,%eax
801022d1:	0f b6 d8             	movzbl %al,%ebx
801022d4:	83 e2 bf             	and    $0xffffffbf,%edx
801022d7:	0f b6 8b 20 69 10 80 	movzbl -0x7fef96e0(%ebx),%ecx
801022de:	09 d1                	or     %edx,%ecx
801022e0:	0f b6 83 20 68 10 80 	movzbl -0x7fef97e0(%ebx),%eax
801022e7:	31 c1                	xor    %eax,%ecx
801022e9:	89 0d b4 95 10 80    	mov    %ecx,0x801095b4
801022ef:	89 c8                	mov    %ecx,%eax
801022f1:	83 e0 03             	and    $0x3,%eax
801022f4:	8b 04 85 00 68 10 80 	mov    -0x7fef9800(,%eax,4),%eax
801022fb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
801022ff:	83 e1 08             	and    $0x8,%ecx
80102302:	74 13                	je     80102317 <kbdgetc+0x7b>
80102304:	8d 50 9f             	lea    -0x61(%eax),%edx
80102307:	83 fa 19             	cmp    $0x19,%edx
8010230a:	76 44                	jbe    80102350 <kbdgetc+0xb4>
8010230c:	8d 50 bf             	lea    -0x41(%eax),%edx
8010230f:	83 fa 19             	cmp    $0x19,%edx
80102312:	77 03                	ja     80102317 <kbdgetc+0x7b>
80102314:	83 c0 20             	add    $0x20,%eax
80102317:	5b                   	pop    %ebx
80102318:	5d                   	pop    %ebp
80102319:	c3                   	ret    
8010231a:	66 90                	xchg   %ax,%ax
8010231c:	83 ca 40             	or     $0x40,%edx
8010231f:	89 15 b4 95 10 80    	mov    %edx,0x801095b4
80102325:	31 c0                	xor    %eax,%eax
80102327:	5b                   	pop    %ebx
80102328:	5d                   	pop    %ebp
80102329:	c3                   	ret    
8010232a:	66 90                	xchg   %ax,%ax
8010232c:	85 c9                	test   %ecx,%ecx
8010232e:	75 05                	jne    80102335 <kbdgetc+0x99>
80102330:	89 c3                	mov    %eax,%ebx
80102332:	83 e3 7f             	and    $0x7f,%ebx
80102335:	8a 8b 20 69 10 80    	mov    -0x7fef96e0(%ebx),%cl
8010233b:	83 c9 40             	or     $0x40,%ecx
8010233e:	0f b6 c9             	movzbl %cl,%ecx
80102341:	f7 d1                	not    %ecx
80102343:	21 d1                	and    %edx,%ecx
80102345:	89 0d b4 95 10 80    	mov    %ecx,0x801095b4
8010234b:	31 c0                	xor    %eax,%eax
8010234d:	5b                   	pop    %ebx
8010234e:	5d                   	pop    %ebp
8010234f:	c3                   	ret    
80102350:	83 e8 20             	sub    $0x20,%eax
80102353:	5b                   	pop    %ebx
80102354:	5d                   	pop    %ebp
80102355:	c3                   	ret    
80102356:	66 90                	xchg   %ax,%ax
80102358:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010235d:	c3                   	ret    
8010235e:	66 90                	xchg   %ax,%ax

80102360 <kbdintr>:
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	83 ec 14             	sub    $0x14,%esp
80102366:	68 9c 22 10 80       	push   $0x8010229c
8010236b:	e8 38 e4 ff ff       	call   801007a8 <consoleintr>
80102370:	83 c4 10             	add    $0x10,%esp
80102373:	c9                   	leave  
80102374:	c3                   	ret    
80102375:	66 90                	xchg   %ax,%ax
80102377:	90                   	nop

80102378 <lapicinit>:
80102378:	a1 7c 16 11 80       	mov    0x8011167c,%eax
8010237d:	85 c0                	test   %eax,%eax
8010237f:	0f 84 c3 00 00 00    	je     80102448 <lapicinit+0xd0>
80102385:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
8010238c:	01 00 00 
8010238f:	8b 50 20             	mov    0x20(%eax),%edx
80102392:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102399:	00 00 00 
8010239c:	8b 50 20             	mov    0x20(%eax),%edx
8010239f:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801023a6:	00 02 00 
801023a9:	8b 50 20             	mov    0x20(%eax),%edx
801023ac:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801023b3:	96 98 00 
801023b6:	8b 50 20             	mov    0x20(%eax),%edx
801023b9:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801023c0:	00 01 00 
801023c3:	8b 50 20             	mov    0x20(%eax),%edx
801023c6:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801023cd:	00 01 00 
801023d0:	8b 50 20             	mov    0x20(%eax),%edx
801023d3:	8b 50 30             	mov    0x30(%eax),%edx
801023d6:	c1 ea 10             	shr    $0x10,%edx
801023d9:	81 e2 fc 00 00 00    	and    $0xfc,%edx
801023df:	75 6b                	jne    8010244c <lapicinit+0xd4>
801023e1:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801023e8:	00 00 00 
801023eb:	8b 50 20             	mov    0x20(%eax),%edx
801023ee:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801023f5:	00 00 00 
801023f8:	8b 50 20             	mov    0x20(%eax),%edx
801023fb:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102402:	00 00 00 
80102405:	8b 50 20             	mov    0x20(%eax),%edx
80102408:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
8010240f:	00 00 00 
80102412:	8b 50 20             	mov    0x20(%eax),%edx
80102415:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
8010241c:	00 00 00 
8010241f:	8b 50 20             	mov    0x20(%eax),%edx
80102422:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102429:	85 08 00 
8010242c:	8b 50 20             	mov    0x20(%eax),%edx
8010242f:	90                   	nop
80102430:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102436:	80 e6 10             	and    $0x10,%dh
80102439:	75 f5                	jne    80102430 <lapicinit+0xb8>
8010243b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102442:	00 00 00 
80102445:	8b 40 20             	mov    0x20(%eax),%eax
80102448:	c3                   	ret    
80102449:	8d 76 00             	lea    0x0(%esi),%esi
8010244c:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102453:	00 01 00 
80102456:	8b 50 20             	mov    0x20(%eax),%edx
80102459:	eb 86                	jmp    801023e1 <lapicinit+0x69>
8010245b:	90                   	nop

8010245c <lapicid>:
8010245c:	a1 7c 16 11 80       	mov    0x8011167c,%eax
80102461:	85 c0                	test   %eax,%eax
80102463:	74 07                	je     8010246c <lapicid+0x10>
80102465:	8b 40 20             	mov    0x20(%eax),%eax
80102468:	c1 e8 18             	shr    $0x18,%eax
8010246b:	c3                   	ret    
8010246c:	31 c0                	xor    %eax,%eax
8010246e:	c3                   	ret    
8010246f:	90                   	nop

80102470 <lapiceoi>:
80102470:	a1 7c 16 11 80       	mov    0x8011167c,%eax
80102475:	85 c0                	test   %eax,%eax
80102477:	74 0d                	je     80102486 <lapiceoi+0x16>
80102479:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102480:	00 00 00 
80102483:	8b 40 20             	mov    0x20(%eax),%eax
80102486:	c3                   	ret    
80102487:	90                   	nop

80102488 <microdelay>:
80102488:	c3                   	ret    
80102489:	8d 76 00             	lea    0x0(%esi),%esi

8010248c <lapicstartap>:
8010248c:	55                   	push   %ebp
8010248d:	89 e5                	mov    %esp,%ebp
8010248f:	53                   	push   %ebx
80102490:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102493:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102496:	b0 0f                	mov    $0xf,%al
80102498:	ba 70 00 00 00       	mov    $0x70,%edx
8010249d:	ee                   	out    %al,(%dx)
8010249e:	b0 0a                	mov    $0xa,%al
801024a0:	ba 71 00 00 00       	mov    $0x71,%edx
801024a5:	ee                   	out    %al,(%dx)
801024a6:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
801024ad:	00 00 
801024af:	89 c8                	mov    %ecx,%eax
801024b1:	c1 e8 04             	shr    $0x4,%eax
801024b4:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801024ba:	a1 7c 16 11 80       	mov    0x8011167c,%eax
801024bf:	c1 e3 18             	shl    $0x18,%ebx
801024c2:	89 da                	mov    %ebx,%edx
801024c4:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801024ca:	8b 58 20             	mov    0x20(%eax),%ebx
801024cd:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801024d4:	c5 00 00 
801024d7:	8b 58 20             	mov    0x20(%eax),%ebx
801024da:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801024e1:	85 00 00 
801024e4:	8b 58 20             	mov    0x20(%eax),%ebx
801024e7:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801024ed:	8b 58 20             	mov    0x20(%eax),%ebx
801024f0:	c1 e9 0c             	shr    $0xc,%ecx
801024f3:	80 cd 06             	or     $0x6,%ch
801024f6:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801024fc:	8b 58 20             	mov    0x20(%eax),%ebx
801024ff:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
80102505:	8b 50 20             	mov    0x20(%eax),%edx
80102508:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010250e:	8b 40 20             	mov    0x20(%eax),%eax
80102511:	5b                   	pop    %ebx
80102512:	5d                   	pop    %ebp
80102513:	c3                   	ret    

80102514 <cmostime>:
80102514:	55                   	push   %ebp
80102515:	89 e5                	mov    %esp,%ebp
80102517:	57                   	push   %edi
80102518:	56                   	push   %esi
80102519:	53                   	push   %ebx
8010251a:	83 ec 4c             	sub    $0x4c,%esp
8010251d:	b0 0b                	mov    $0xb,%al
8010251f:	ba 70 00 00 00       	mov    $0x70,%edx
80102524:	ee                   	out    %al,(%dx)
80102525:	ba 71 00 00 00       	mov    $0x71,%edx
8010252a:	ec                   	in     (%dx),%al
8010252b:	83 e0 04             	and    $0x4,%eax
8010252e:	88 45 b2             	mov    %al,-0x4e(%ebp)
80102531:	be 70 00 00 00       	mov    $0x70,%esi
80102536:	66 90                	xchg   %ax,%ax
80102538:	31 c0                	xor    %eax,%eax
8010253a:	89 f2                	mov    %esi,%edx
8010253c:	ee                   	out    %al,(%dx)
8010253d:	bb 71 00 00 00       	mov    $0x71,%ebx
80102542:	89 da                	mov    %ebx,%edx
80102544:	ec                   	in     (%dx),%al
80102545:	88 45 b7             	mov    %al,-0x49(%ebp)
80102548:	bf 02 00 00 00       	mov    $0x2,%edi
8010254d:	89 f8                	mov    %edi,%eax
8010254f:	89 f2                	mov    %esi,%edx
80102551:	ee                   	out    %al,(%dx)
80102552:	89 da                	mov    %ebx,%edx
80102554:	ec                   	in     (%dx),%al
80102555:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102558:	b0 04                	mov    $0x4,%al
8010255a:	89 f2                	mov    %esi,%edx
8010255c:	ee                   	out    %al,(%dx)
8010255d:	89 da                	mov    %ebx,%edx
8010255f:	ec                   	in     (%dx),%al
80102560:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102563:	b0 07                	mov    $0x7,%al
80102565:	89 f2                	mov    %esi,%edx
80102567:	ee                   	out    %al,(%dx)
80102568:	89 da                	mov    %ebx,%edx
8010256a:	ec                   	in     (%dx),%al
8010256b:	88 45 b4             	mov    %al,-0x4c(%ebp)
8010256e:	b0 08                	mov    $0x8,%al
80102570:	89 f2                	mov    %esi,%edx
80102572:	ee                   	out    %al,(%dx)
80102573:	89 da                	mov    %ebx,%edx
80102575:	ec                   	in     (%dx),%al
80102576:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102579:	b0 09                	mov    $0x9,%al
8010257b:	89 f2                	mov    %esi,%edx
8010257d:	ee                   	out    %al,(%dx)
8010257e:	89 da                	mov    %ebx,%edx
80102580:	ec                   	in     (%dx),%al
80102581:	0f b6 c8             	movzbl %al,%ecx
80102584:	b0 0a                	mov    $0xa,%al
80102586:	89 f2                	mov    %esi,%edx
80102588:	ee                   	out    %al,(%dx)
80102589:	89 da                	mov    %ebx,%edx
8010258b:	ec                   	in     (%dx),%al
8010258c:	84 c0                	test   %al,%al
8010258e:	78 a8                	js     80102538 <cmostime+0x24>
80102590:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102594:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102597:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
8010259b:	89 45 bc             	mov    %eax,-0x44(%ebp)
8010259e:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801025a2:	89 45 c0             	mov    %eax,-0x40(%ebp)
801025a5:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801025a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801025ac:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
801025b0:	89 45 c8             	mov    %eax,-0x38(%ebp)
801025b3:	89 4d cc             	mov    %ecx,-0x34(%ebp)
801025b6:	31 c0                	xor    %eax,%eax
801025b8:	89 f2                	mov    %esi,%edx
801025ba:	ee                   	out    %al,(%dx)
801025bb:	89 da                	mov    %ebx,%edx
801025bd:	ec                   	in     (%dx),%al
801025be:	0f b6 c0             	movzbl %al,%eax
801025c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
801025c4:	89 f8                	mov    %edi,%eax
801025c6:	89 f2                	mov    %esi,%edx
801025c8:	ee                   	out    %al,(%dx)
801025c9:	89 da                	mov    %ebx,%edx
801025cb:	ec                   	in     (%dx),%al
801025cc:	0f b6 c0             	movzbl %al,%eax
801025cf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801025d2:	b0 04                	mov    $0x4,%al
801025d4:	89 f2                	mov    %esi,%edx
801025d6:	ee                   	out    %al,(%dx)
801025d7:	89 da                	mov    %ebx,%edx
801025d9:	ec                   	in     (%dx),%al
801025da:	0f b6 c0             	movzbl %al,%eax
801025dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
801025e0:	b0 07                	mov    $0x7,%al
801025e2:	89 f2                	mov    %esi,%edx
801025e4:	ee                   	out    %al,(%dx)
801025e5:	89 da                	mov    %ebx,%edx
801025e7:	ec                   	in     (%dx),%al
801025e8:	0f b6 c0             	movzbl %al,%eax
801025eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801025ee:	b0 08                	mov    $0x8,%al
801025f0:	89 f2                	mov    %esi,%edx
801025f2:	ee                   	out    %al,(%dx)
801025f3:	89 da                	mov    %ebx,%edx
801025f5:	ec                   	in     (%dx),%al
801025f6:	0f b6 c0             	movzbl %al,%eax
801025f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
801025fc:	b0 09                	mov    $0x9,%al
801025fe:	89 f2                	mov    %esi,%edx
80102600:	ee                   	out    %al,(%dx)
80102601:	89 da                	mov    %ebx,%edx
80102603:	ec                   	in     (%dx),%al
80102604:	0f b6 c0             	movzbl %al,%eax
80102607:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010260a:	50                   	push   %eax
8010260b:	6a 18                	push   $0x18
8010260d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102610:	50                   	push   %eax
80102611:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102614:	50                   	push   %eax
80102615:	e8 1e 19 00 00       	call   80103f38 <memcmp>
8010261a:	83 c4 10             	add    $0x10,%esp
8010261d:	85 c0                	test   %eax,%eax
8010261f:	0f 85 13 ff ff ff    	jne    80102538 <cmostime+0x24>
80102625:	80 7d b2 00          	cmpb   $0x0,-0x4e(%ebp)
80102629:	75 7e                	jne    801026a9 <cmostime+0x195>
8010262b:	8b 55 b8             	mov    -0x48(%ebp),%edx
8010262e:	89 d0                	mov    %edx,%eax
80102630:	c1 e8 04             	shr    $0x4,%eax
80102633:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102636:	01 c0                	add    %eax,%eax
80102638:	83 e2 0f             	and    $0xf,%edx
8010263b:	01 d0                	add    %edx,%eax
8010263d:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102640:	8b 55 bc             	mov    -0x44(%ebp),%edx
80102643:	89 d0                	mov    %edx,%eax
80102645:	c1 e8 04             	shr    $0x4,%eax
80102648:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010264b:	01 c0                	add    %eax,%eax
8010264d:	83 e2 0f             	and    $0xf,%edx
80102650:	01 d0                	add    %edx,%eax
80102652:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102655:	8b 55 c0             	mov    -0x40(%ebp),%edx
80102658:	89 d0                	mov    %edx,%eax
8010265a:	c1 e8 04             	shr    $0x4,%eax
8010265d:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102660:	01 c0                	add    %eax,%eax
80102662:	83 e2 0f             	and    $0xf,%edx
80102665:	01 d0                	add    %edx,%eax
80102667:	89 45 c0             	mov    %eax,-0x40(%ebp)
8010266a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
8010266d:	89 d0                	mov    %edx,%eax
8010266f:	c1 e8 04             	shr    $0x4,%eax
80102672:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102675:	01 c0                	add    %eax,%eax
80102677:	83 e2 0f             	and    $0xf,%edx
8010267a:	01 d0                	add    %edx,%eax
8010267c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010267f:	8b 55 c8             	mov    -0x38(%ebp),%edx
80102682:	89 d0                	mov    %edx,%eax
80102684:	c1 e8 04             	shr    $0x4,%eax
80102687:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010268a:	01 c0                	add    %eax,%eax
8010268c:	83 e2 0f             	and    $0xf,%edx
8010268f:	01 d0                	add    %edx,%eax
80102691:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102694:	8b 55 cc             	mov    -0x34(%ebp),%edx
80102697:	89 d0                	mov    %edx,%eax
80102699:	c1 e8 04             	shr    $0x4,%eax
8010269c:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010269f:	01 c0                	add    %eax,%eax
801026a1:	83 e2 0f             	and    $0xf,%edx
801026a4:	01 d0                	add    %edx,%eax
801026a6:	89 45 cc             	mov    %eax,-0x34(%ebp)
801026a9:	b9 06 00 00 00       	mov    $0x6,%ecx
801026ae:	8b 7d 08             	mov    0x8(%ebp),%edi
801026b1:	8d 75 b8             	lea    -0x48(%ebp),%esi
801026b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801026b6:	8b 45 08             	mov    0x8(%ebp),%eax
801026b9:	81 40 14 d0 07 00 00 	addl   $0x7d0,0x14(%eax)
801026c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801026c3:	5b                   	pop    %ebx
801026c4:	5e                   	pop    %esi
801026c5:	5f                   	pop    %edi
801026c6:	5d                   	pop    %ebp
801026c7:	c3                   	ret    

801026c8 <install_trans>:
801026c8:	8b 0d c8 16 11 80    	mov    0x801116c8,%ecx
801026ce:	85 c9                	test   %ecx,%ecx
801026d0:	7e 7e                	jle    80102750 <install_trans+0x88>
801026d2:	55                   	push   %ebp
801026d3:	89 e5                	mov    %esp,%ebp
801026d5:	57                   	push   %edi
801026d6:	56                   	push   %esi
801026d7:	53                   	push   %ebx
801026d8:	83 ec 0c             	sub    $0xc,%esp
801026db:	31 f6                	xor    %esi,%esi
801026dd:	8d 76 00             	lea    0x0(%esi),%esi
801026e0:	83 ec 08             	sub    $0x8,%esp
801026e3:	a1 b4 16 11 80       	mov    0x801116b4,%eax
801026e8:	01 f0                	add    %esi,%eax
801026ea:	40                   	inc    %eax
801026eb:	50                   	push   %eax
801026ec:	ff 35 c4 16 11 80    	pushl  0x801116c4
801026f2:	e8 bd d9 ff ff       	call   801000b4 <bread>
801026f7:	89 c7                	mov    %eax,%edi
801026f9:	58                   	pop    %eax
801026fa:	5a                   	pop    %edx
801026fb:	ff 34 b5 cc 16 11 80 	pushl  -0x7feee934(,%esi,4)
80102702:	ff 35 c4 16 11 80    	pushl  0x801116c4
80102708:	e8 a7 d9 ff ff       	call   801000b4 <bread>
8010270d:	89 c3                	mov    %eax,%ebx
8010270f:	83 c4 0c             	add    $0xc,%esp
80102712:	68 00 02 00 00       	push   $0x200
80102717:	8d 47 5c             	lea    0x5c(%edi),%eax
8010271a:	50                   	push   %eax
8010271b:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010271e:	50                   	push   %eax
8010271f:	e8 4c 18 00 00       	call   80103f70 <memmove>
80102724:	89 1c 24             	mov    %ebx,(%esp)
80102727:	e8 5c da ff ff       	call   80100188 <bwrite>
8010272c:	89 3c 24             	mov    %edi,(%esp)
8010272f:	e8 8c da ff ff       	call   801001c0 <brelse>
80102734:	89 1c 24             	mov    %ebx,(%esp)
80102737:	e8 84 da ff ff       	call   801001c0 <brelse>
8010273c:	46                   	inc    %esi
8010273d:	83 c4 10             	add    $0x10,%esp
80102740:	39 35 c8 16 11 80    	cmp    %esi,0x801116c8
80102746:	7f 98                	jg     801026e0 <install_trans+0x18>
80102748:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010274b:	5b                   	pop    %ebx
8010274c:	5e                   	pop    %esi
8010274d:	5f                   	pop    %edi
8010274e:	5d                   	pop    %ebp
8010274f:	c3                   	ret    
80102750:	c3                   	ret    
80102751:	8d 76 00             	lea    0x0(%esi),%esi

80102754 <write_head>:
80102754:	55                   	push   %ebp
80102755:	89 e5                	mov    %esp,%ebp
80102757:	53                   	push   %ebx
80102758:	83 ec 0c             	sub    $0xc,%esp
8010275b:	ff 35 b4 16 11 80    	pushl  0x801116b4
80102761:	ff 35 c4 16 11 80    	pushl  0x801116c4
80102767:	e8 48 d9 ff ff       	call   801000b4 <bread>
8010276c:	89 c3                	mov    %eax,%ebx
8010276e:	a1 c8 16 11 80       	mov    0x801116c8,%eax
80102773:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102776:	83 c4 10             	add    $0x10,%esp
80102779:	85 c0                	test   %eax,%eax
8010277b:	7e 13                	jle    80102790 <write_head+0x3c>
8010277d:	31 d2                	xor    %edx,%edx
8010277f:	90                   	nop
80102780:	8b 0c 95 cc 16 11 80 	mov    -0x7feee934(,%edx,4),%ecx
80102787:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
8010278b:	42                   	inc    %edx
8010278c:	39 d0                	cmp    %edx,%eax
8010278e:	75 f0                	jne    80102780 <write_head+0x2c>
80102790:	83 ec 0c             	sub    $0xc,%esp
80102793:	53                   	push   %ebx
80102794:	e8 ef d9 ff ff       	call   80100188 <bwrite>
80102799:	89 1c 24             	mov    %ebx,(%esp)
8010279c:	e8 1f da ff ff       	call   801001c0 <brelse>
801027a1:	83 c4 10             	add    $0x10,%esp
801027a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027a7:	c9                   	leave  
801027a8:	c3                   	ret    
801027a9:	8d 76 00             	lea    0x0(%esi),%esi

801027ac <initlog>:
801027ac:	55                   	push   %ebp
801027ad:	89 e5                	mov    %esp,%ebp
801027af:	53                   	push   %ebx
801027b0:	83 ec 2c             	sub    $0x2c,%esp
801027b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027b6:	68 20 6a 10 80       	push   $0x80106a20
801027bb:	68 80 16 11 80       	push   $0x80111680
801027c0:	e8 07 15 00 00       	call   80103ccc <initlock>
801027c5:	58                   	pop    %eax
801027c6:	5a                   	pop    %edx
801027c7:	8d 45 dc             	lea    -0x24(%ebp),%eax
801027ca:	50                   	push   %eax
801027cb:	53                   	push   %ebx
801027cc:	e8 6f eb ff ff       	call   80101340 <readsb>
801027d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
801027d4:	a3 b4 16 11 80       	mov    %eax,0x801116b4
801027d9:	8b 55 e8             	mov    -0x18(%ebp),%edx
801027dc:	89 15 b8 16 11 80    	mov    %edx,0x801116b8
801027e2:	89 1d c4 16 11 80    	mov    %ebx,0x801116c4
801027e8:	59                   	pop    %ecx
801027e9:	5a                   	pop    %edx
801027ea:	50                   	push   %eax
801027eb:	53                   	push   %ebx
801027ec:	e8 c3 d8 ff ff       	call   801000b4 <bread>
801027f1:	8b 48 5c             	mov    0x5c(%eax),%ecx
801027f4:	89 0d c8 16 11 80    	mov    %ecx,0x801116c8
801027fa:	83 c4 10             	add    $0x10,%esp
801027fd:	85 c9                	test   %ecx,%ecx
801027ff:	7e 13                	jle    80102814 <initlog+0x68>
80102801:	31 d2                	xor    %edx,%edx
80102803:	90                   	nop
80102804:	8b 5c 90 60          	mov    0x60(%eax,%edx,4),%ebx
80102808:	89 1c 95 cc 16 11 80 	mov    %ebx,-0x7feee934(,%edx,4)
8010280f:	42                   	inc    %edx
80102810:	39 d1                	cmp    %edx,%ecx
80102812:	75 f0                	jne    80102804 <initlog+0x58>
80102814:	83 ec 0c             	sub    $0xc,%esp
80102817:	50                   	push   %eax
80102818:	e8 a3 d9 ff ff       	call   801001c0 <brelse>
8010281d:	e8 a6 fe ff ff       	call   801026c8 <install_trans>
80102822:	c7 05 c8 16 11 80 00 	movl   $0x0,0x801116c8
80102829:	00 00 00 
8010282c:	e8 23 ff ff ff       	call   80102754 <write_head>
80102831:	83 c4 10             	add    $0x10,%esp
80102834:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102837:	c9                   	leave  
80102838:	c3                   	ret    
80102839:	8d 76 00             	lea    0x0(%esi),%esi

8010283c <begin_op>:
8010283c:	55                   	push   %ebp
8010283d:	89 e5                	mov    %esp,%ebp
8010283f:	83 ec 14             	sub    $0x14,%esp
80102842:	68 80 16 11 80       	push   $0x80111680
80102847:	e8 c0 15 00 00       	call   80103e0c <acquire>
8010284c:	83 c4 10             	add    $0x10,%esp
8010284f:	eb 18                	jmp    80102869 <begin_op+0x2d>
80102851:	8d 76 00             	lea    0x0(%esi),%esi
80102854:	83 ec 08             	sub    $0x8,%esp
80102857:	68 80 16 11 80       	push   $0x80111680
8010285c:	68 80 16 11 80       	push   $0x80111680
80102861:	e8 2e 10 00 00       	call   80103894 <sleep>
80102866:	83 c4 10             	add    $0x10,%esp
80102869:	a1 c0 16 11 80       	mov    0x801116c0,%eax
8010286e:	85 c0                	test   %eax,%eax
80102870:	75 e2                	jne    80102854 <begin_op+0x18>
80102872:	a1 bc 16 11 80       	mov    0x801116bc,%eax
80102877:	8d 50 01             	lea    0x1(%eax),%edx
8010287a:	8d 44 80 05          	lea    0x5(%eax,%eax,4),%eax
8010287e:	01 c0                	add    %eax,%eax
80102880:	03 05 c8 16 11 80    	add    0x801116c8,%eax
80102886:	83 f8 1e             	cmp    $0x1e,%eax
80102889:	7f c9                	jg     80102854 <begin_op+0x18>
8010288b:	89 15 bc 16 11 80    	mov    %edx,0x801116bc
80102891:	83 ec 0c             	sub    $0xc,%esp
80102894:	68 80 16 11 80       	push   $0x80111680
80102899:	e8 06 16 00 00       	call   80103ea4 <release>
8010289e:	83 c4 10             	add    $0x10,%esp
801028a1:	c9                   	leave  
801028a2:	c3                   	ret    
801028a3:	90                   	nop

801028a4 <end_op>:
801028a4:	55                   	push   %ebp
801028a5:	89 e5                	mov    %esp,%ebp
801028a7:	57                   	push   %edi
801028a8:	56                   	push   %esi
801028a9:	53                   	push   %ebx
801028aa:	83 ec 18             	sub    $0x18,%esp
801028ad:	68 80 16 11 80       	push   $0x80111680
801028b2:	e8 55 15 00 00       	call   80103e0c <acquire>
801028b7:	a1 bc 16 11 80       	mov    0x801116bc,%eax
801028bc:	8d 58 ff             	lea    -0x1(%eax),%ebx
801028bf:	89 1d bc 16 11 80    	mov    %ebx,0x801116bc
801028c5:	83 c4 10             	add    $0x10,%esp
801028c8:	8b 35 c0 16 11 80    	mov    0x801116c0,%esi
801028ce:	85 f6                	test   %esi,%esi
801028d0:	0f 85 12 01 00 00    	jne    801029e8 <end_op+0x144>
801028d6:	85 db                	test   %ebx,%ebx
801028d8:	0f 85 e6 00 00 00    	jne    801029c4 <end_op+0x120>
801028de:	c7 05 c0 16 11 80 01 	movl   $0x1,0x801116c0
801028e5:	00 00 00 
801028e8:	83 ec 0c             	sub    $0xc,%esp
801028eb:	68 80 16 11 80       	push   $0x80111680
801028f0:	e8 af 15 00 00       	call   80103ea4 <release>
801028f5:	83 c4 10             	add    $0x10,%esp
801028f8:	8b 0d c8 16 11 80    	mov    0x801116c8,%ecx
801028fe:	85 c9                	test   %ecx,%ecx
80102900:	7f 3a                	jg     8010293c <end_op+0x98>
80102902:	83 ec 0c             	sub    $0xc,%esp
80102905:	68 80 16 11 80       	push   $0x80111680
8010290a:	e8 fd 14 00 00       	call   80103e0c <acquire>
8010290f:	c7 05 c0 16 11 80 00 	movl   $0x0,0x801116c0
80102916:	00 00 00 
80102919:	c7 04 24 80 16 11 80 	movl   $0x80111680,(%esp)
80102920:	e8 1b 11 00 00       	call   80103a40 <wakeup>
80102925:	c7 04 24 80 16 11 80 	movl   $0x80111680,(%esp)
8010292c:	e8 73 15 00 00       	call   80103ea4 <release>
80102931:	83 c4 10             	add    $0x10,%esp
80102934:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102937:	5b                   	pop    %ebx
80102938:	5e                   	pop    %esi
80102939:	5f                   	pop    %edi
8010293a:	5d                   	pop    %ebp
8010293b:	c3                   	ret    
8010293c:	83 ec 08             	sub    $0x8,%esp
8010293f:	a1 b4 16 11 80       	mov    0x801116b4,%eax
80102944:	01 d8                	add    %ebx,%eax
80102946:	40                   	inc    %eax
80102947:	50                   	push   %eax
80102948:	ff 35 c4 16 11 80    	pushl  0x801116c4
8010294e:	e8 61 d7 ff ff       	call   801000b4 <bread>
80102953:	89 c6                	mov    %eax,%esi
80102955:	58                   	pop    %eax
80102956:	5a                   	pop    %edx
80102957:	ff 34 9d cc 16 11 80 	pushl  -0x7feee934(,%ebx,4)
8010295e:	ff 35 c4 16 11 80    	pushl  0x801116c4
80102964:	e8 4b d7 ff ff       	call   801000b4 <bread>
80102969:	89 c7                	mov    %eax,%edi
8010296b:	83 c4 0c             	add    $0xc,%esp
8010296e:	68 00 02 00 00       	push   $0x200
80102973:	8d 40 5c             	lea    0x5c(%eax),%eax
80102976:	50                   	push   %eax
80102977:	8d 46 5c             	lea    0x5c(%esi),%eax
8010297a:	50                   	push   %eax
8010297b:	e8 f0 15 00 00       	call   80103f70 <memmove>
80102980:	89 34 24             	mov    %esi,(%esp)
80102983:	e8 00 d8 ff ff       	call   80100188 <bwrite>
80102988:	89 3c 24             	mov    %edi,(%esp)
8010298b:	e8 30 d8 ff ff       	call   801001c0 <brelse>
80102990:	89 34 24             	mov    %esi,(%esp)
80102993:	e8 28 d8 ff ff       	call   801001c0 <brelse>
80102998:	43                   	inc    %ebx
80102999:	83 c4 10             	add    $0x10,%esp
8010299c:	3b 1d c8 16 11 80    	cmp    0x801116c8,%ebx
801029a2:	7c 98                	jl     8010293c <end_op+0x98>
801029a4:	e8 ab fd ff ff       	call   80102754 <write_head>
801029a9:	e8 1a fd ff ff       	call   801026c8 <install_trans>
801029ae:	c7 05 c8 16 11 80 00 	movl   $0x0,0x801116c8
801029b5:	00 00 00 
801029b8:	e8 97 fd ff ff       	call   80102754 <write_head>
801029bd:	e9 40 ff ff ff       	jmp    80102902 <end_op+0x5e>
801029c2:	66 90                	xchg   %ax,%ax
801029c4:	83 ec 0c             	sub    $0xc,%esp
801029c7:	68 80 16 11 80       	push   $0x80111680
801029cc:	e8 6f 10 00 00       	call   80103a40 <wakeup>
801029d1:	c7 04 24 80 16 11 80 	movl   $0x80111680,(%esp)
801029d8:	e8 c7 14 00 00       	call   80103ea4 <release>
801029dd:	83 c4 10             	add    $0x10,%esp
801029e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029e3:	5b                   	pop    %ebx
801029e4:	5e                   	pop    %esi
801029e5:	5f                   	pop    %edi
801029e6:	5d                   	pop    %ebp
801029e7:	c3                   	ret    
801029e8:	83 ec 0c             	sub    $0xc,%esp
801029eb:	68 24 6a 10 80       	push   $0x80106a24
801029f0:	e8 4b d9 ff ff       	call   80100340 <panic>
801029f5:	8d 76 00             	lea    0x0(%esi),%esi

801029f8 <log_write>:
801029f8:	55                   	push   %ebp
801029f9:	89 e5                	mov    %esp,%ebp
801029fb:	53                   	push   %ebx
801029fc:	52                   	push   %edx
801029fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102a00:	8b 15 c8 16 11 80    	mov    0x801116c8,%edx
80102a06:	83 fa 1d             	cmp    $0x1d,%edx
80102a09:	7f 79                	jg     80102a84 <log_write+0x8c>
80102a0b:	a1 b8 16 11 80       	mov    0x801116b8,%eax
80102a10:	48                   	dec    %eax
80102a11:	39 c2                	cmp    %eax,%edx
80102a13:	7d 6f                	jge    80102a84 <log_write+0x8c>
80102a15:	a1 bc 16 11 80       	mov    0x801116bc,%eax
80102a1a:	85 c0                	test   %eax,%eax
80102a1c:	7e 73                	jle    80102a91 <log_write+0x99>
80102a1e:	83 ec 0c             	sub    $0xc,%esp
80102a21:	68 80 16 11 80       	push   $0x80111680
80102a26:	e8 e1 13 00 00       	call   80103e0c <acquire>
80102a2b:	8b 15 c8 16 11 80    	mov    0x801116c8,%edx
80102a31:	83 c4 10             	add    $0x10,%esp
80102a34:	85 d2                	test   %edx,%edx
80102a36:	7e 40                	jle    80102a78 <log_write+0x80>
80102a38:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102a3b:	31 c0                	xor    %eax,%eax
80102a3d:	eb 06                	jmp    80102a45 <log_write+0x4d>
80102a3f:	90                   	nop
80102a40:	40                   	inc    %eax
80102a41:	39 c2                	cmp    %eax,%edx
80102a43:	74 23                	je     80102a68 <log_write+0x70>
80102a45:	39 0c 85 cc 16 11 80 	cmp    %ecx,-0x7feee934(,%eax,4)
80102a4c:	75 f2                	jne    80102a40 <log_write+0x48>
80102a4e:	89 0c 85 cc 16 11 80 	mov    %ecx,-0x7feee934(,%eax,4)
80102a55:	83 0b 04             	orl    $0x4,(%ebx)
80102a58:	c7 45 08 80 16 11 80 	movl   $0x80111680,0x8(%ebp)
80102a5f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a62:	c9                   	leave  
80102a63:	e9 3c 14 00 00       	jmp    80103ea4 <release>
80102a68:	89 0c 95 cc 16 11 80 	mov    %ecx,-0x7feee934(,%edx,4)
80102a6f:	42                   	inc    %edx
80102a70:	89 15 c8 16 11 80    	mov    %edx,0x801116c8
80102a76:	eb dd                	jmp    80102a55 <log_write+0x5d>
80102a78:	8b 43 08             	mov    0x8(%ebx),%eax
80102a7b:	a3 cc 16 11 80       	mov    %eax,0x801116cc
80102a80:	75 d3                	jne    80102a55 <log_write+0x5d>
80102a82:	eb eb                	jmp    80102a6f <log_write+0x77>
80102a84:	83 ec 0c             	sub    $0xc,%esp
80102a87:	68 33 6a 10 80       	push   $0x80106a33
80102a8c:	e8 af d8 ff ff       	call   80100340 <panic>
80102a91:	83 ec 0c             	sub    $0xc,%esp
80102a94:	68 49 6a 10 80       	push   $0x80106a49
80102a99:	e8 a2 d8 ff ff       	call   80100340 <panic>
80102a9e:	66 90                	xchg   %ax,%ax

80102aa0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102aa0:	55                   	push   %ebp
80102aa1:	89 e5                	mov    %esp,%ebp
80102aa3:	53                   	push   %ebx
80102aa4:	50                   	push   %eax
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102aa5:	e8 82 08 00 00       	call   8010332c <cpuid>
80102aaa:	89 c3                	mov    %eax,%ebx
80102aac:	e8 7b 08 00 00       	call   8010332c <cpuid>
80102ab1:	52                   	push   %edx
80102ab2:	53                   	push   %ebx
80102ab3:	50                   	push   %eax
80102ab4:	68 64 6a 10 80       	push   $0x80106a64
80102ab9:	e8 62 db ff ff       	call   80100620 <cprintf>
  idtinit();       // load idt register
80102abe:	e8 39 24 00 00       	call   80104efc <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102ac3:	e8 00 08 00 00       	call   801032c8 <mycpu>
80102ac8:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102aca:	b8 01 00 00 00       	mov    $0x1,%eax
80102acf:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102ad6:	e8 11 0b 00 00       	call   801035ec <scheduler>
80102adb:	90                   	nop

80102adc <mpenter>:
{
80102adc:	55                   	push   %ebp
80102add:	89 e5                	mov    %esp,%ebp
80102adf:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102ae2:	e8 45 34 00 00       	call   80105f2c <switchkvm>
  seginit();
80102ae7:	e8 bc 33 00 00       	call   80105ea8 <seginit>
  lapicinit();
80102aec:	e8 87 f8 ff ff       	call   80102378 <lapicinit>
  mpmain();
80102af1:	e8 aa ff ff ff       	call   80102aa0 <mpmain>
80102af6:	66 90                	xchg   %ax,%ax

80102af8 <main>:
{
80102af8:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102afc:	83 e4 f0             	and    $0xfffffff0,%esp
80102aff:	ff 71 fc             	pushl  -0x4(%ecx)
80102b02:	55                   	push   %ebp
80102b03:	89 e5                	mov    %esp,%ebp
80102b05:	53                   	push   %ebx
80102b06:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102b07:	83 ec 08             	sub    $0x8,%esp
80102b0a:	68 00 00 40 80       	push   $0x80400000
80102b0f:	68 a8 45 11 80       	push   $0x801145a8
80102b14:	e8 63 f6 ff ff       	call   8010217c <kinit1>
  kvmalloc();      // kernel page table
80102b19:	e8 72 38 00 00       	call   80106390 <kvmalloc>
  mpinit();        // detect other processors
80102b1e:	e8 61 01 00 00       	call   80102c84 <mpinit>
  lapicinit();     // interrupt controller
80102b23:	e8 50 f8 ff ff       	call   80102378 <lapicinit>
  seginit();       // segment descriptors
80102b28:	e8 7b 33 00 00       	call   80105ea8 <seginit>
  picinit();       // disable pic
80102b2d:	e8 f2 02 00 00       	call   80102e24 <picinit>
  ioapicinit();    // another interrupt controller
80102b32:	e8 99 f4 ff ff       	call   80101fd0 <ioapicinit>
  consoleinit();   // console hardware
80102b37:	e8 24 de ff ff       	call   80100960 <consoleinit>
  uartinit();      // serial port
80102b3c:	e8 87 26 00 00       	call   801051c8 <uartinit>
  pinit();         // process table
80102b41:	e8 66 07 00 00       	call   801032ac <pinit>
  tvinit();        // trap vectors
80102b46:	e8 45 23 00 00       	call   80104e90 <tvinit>
  binit();         // buffer cache
80102b4b:	e8 e4 d4 ff ff       	call   80100034 <binit>
  fileinit();      // file table
80102b50:	e8 87 e1 ff ff       	call   80100cdc <fileinit>
  ideinit();       // disk 
80102b55:	e8 9a f2 ff ff       	call   80101df4 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102b5a:	83 c4 0c             	add    $0xc,%esp
80102b5d:	68 8a 00 00 00       	push   $0x8a
80102b62:	68 8c 94 10 80       	push   $0x8010948c
80102b67:	68 00 70 00 80       	push   $0x80007000
80102b6c:	e8 ff 13 00 00       	call   80103f70 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102b71:	8b 15 00 1d 11 80    	mov    0x80111d00,%edx
80102b77:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102b7a:	01 c0                	add    %eax,%eax
80102b7c:	01 d0                	add    %edx,%eax
80102b7e:	c1 e0 04             	shl    $0x4,%eax
80102b81:	05 80 17 11 80       	add    $0x80111780,%eax
80102b86:	83 c4 10             	add    $0x10,%esp
80102b89:	3d 80 17 11 80       	cmp    $0x80111780,%eax
80102b8e:	76 74                	jbe    80102c04 <main+0x10c>
80102b90:	bb 80 17 11 80       	mov    $0x80111780,%ebx
80102b95:	eb 20                	jmp    80102bb7 <main+0xbf>
80102b97:	90                   	nop
80102b98:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102b9e:	8b 15 00 1d 11 80    	mov    0x80111d00,%edx
80102ba4:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102ba7:	01 c0                	add    %eax,%eax
80102ba9:	01 d0                	add    %edx,%eax
80102bab:	c1 e0 04             	shl    $0x4,%eax
80102bae:	05 80 17 11 80       	add    $0x80111780,%eax
80102bb3:	39 c3                	cmp    %eax,%ebx
80102bb5:	73 4d                	jae    80102c04 <main+0x10c>
    if(c == mycpu())  // We've started already.
80102bb7:	e8 0c 07 00 00       	call   801032c8 <mycpu>
80102bbc:	39 c3                	cmp    %eax,%ebx
80102bbe:	74 d8                	je     80102b98 <main+0xa0>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102bc0:	e8 6f f6 ff ff       	call   80102234 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102bc5:	05 00 10 00 00       	add    $0x1000,%eax
80102bca:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
80102bcf:	c7 05 f8 6f 00 80 dc 	movl   $0x80102adc,0x80006ff8
80102bd6:	2a 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102bd9:	c7 05 f4 6f 00 80 00 	movl   $0x108000,0x80006ff4
80102be0:	80 10 00 

    lapicstartap(c->apicid, V2P(code));
80102be3:	83 ec 08             	sub    $0x8,%esp
80102be6:	68 00 70 00 00       	push   $0x7000
80102beb:	0f b6 03             	movzbl (%ebx),%eax
80102bee:	50                   	push   %eax
80102bef:	e8 98 f8 ff ff       	call   8010248c <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102bf4:	83 c4 10             	add    $0x10,%esp
80102bf7:	90                   	nop
80102bf8:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102bfe:	85 c0                	test   %eax,%eax
80102c00:	74 f6                	je     80102bf8 <main+0x100>
80102c02:	eb 94                	jmp    80102b98 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102c04:	83 ec 08             	sub    $0x8,%esp
80102c07:	68 00 00 00 8e       	push   $0x8e000000
80102c0c:	68 00 00 40 80       	push   $0x80400000
80102c11:	e8 ca f5 ff ff       	call   801021e0 <kinit2>
  userinit();      // first user process
80102c16:	e8 69 07 00 00       	call   80103384 <userinit>
  mpmain();        // finish this processor's setup
80102c1b:	e8 80 fe ff ff       	call   80102aa0 <mpmain>

80102c20 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
80102c29:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
  e = addr+len;
80102c2f:	8d 9c 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%ebx
  for(p = addr; p < e; p += sizeof(struct mp))
80102c36:	39 de                	cmp    %ebx,%esi
80102c38:	72 0b                	jb     80102c45 <mpsearch1+0x25>
80102c3a:	eb 3c                	jmp    80102c78 <mpsearch1+0x58>
80102c3c:	8d 7e 10             	lea    0x10(%esi),%edi
80102c3f:	89 fe                	mov    %edi,%esi
80102c41:	39 fb                	cmp    %edi,%ebx
80102c43:	76 33                	jbe    80102c78 <mpsearch1+0x58>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102c45:	50                   	push   %eax
80102c46:	6a 04                	push   $0x4
80102c48:	68 78 6a 10 80       	push   $0x80106a78
80102c4d:	56                   	push   %esi
80102c4e:	e8 e5 12 00 00       	call   80103f38 <memcmp>
80102c53:	83 c4 10             	add    $0x10,%esp
80102c56:	85 c0                	test   %eax,%eax
80102c58:	75 e2                	jne    80102c3c <mpsearch1+0x1c>
80102c5a:	89 f2                	mov    %esi,%edx
80102c5c:	8d 7e 10             	lea    0x10(%esi),%edi
80102c5f:	90                   	nop
    sum += addr[i];
80102c60:	0f b6 0a             	movzbl (%edx),%ecx
80102c63:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
80102c65:	42                   	inc    %edx
80102c66:	39 fa                	cmp    %edi,%edx
80102c68:	75 f6                	jne    80102c60 <mpsearch1+0x40>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102c6a:	84 c0                	test   %al,%al
80102c6c:	75 d1                	jne    80102c3f <mpsearch1+0x1f>
      return (struct mp*)p;
  return 0;
}
80102c6e:	89 f0                	mov    %esi,%eax
80102c70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c73:	5b                   	pop    %ebx
80102c74:	5e                   	pop    %esi
80102c75:	5f                   	pop    %edi
80102c76:	5d                   	pop    %ebp
80102c77:	c3                   	ret    
  return 0;
80102c78:	31 f6                	xor    %esi,%esi
}
80102c7a:	89 f0                	mov    %esi,%eax
80102c7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c7f:	5b                   	pop    %ebx
80102c80:	5e                   	pop    %esi
80102c81:	5f                   	pop    %edi
80102c82:	5d                   	pop    %ebp
80102c83:	c3                   	ret    

80102c84 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102c84:	55                   	push   %ebp
80102c85:	89 e5                	mov    %esp,%ebp
80102c87:	57                   	push   %edi
80102c88:	56                   	push   %esi
80102c89:	53                   	push   %ebx
80102c8a:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102c8d:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102c94:	c1 e0 08             	shl    $0x8,%eax
80102c97:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102c9e:	09 d0                	or     %edx,%eax
80102ca0:	c1 e0 04             	shl    $0x4,%eax
80102ca3:	75 1b                	jne    80102cc0 <mpinit+0x3c>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80102ca5:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102cac:	c1 e0 08             	shl    $0x8,%eax
80102caf:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102cb6:	09 d0                	or     %edx,%eax
80102cb8:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80102cbb:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
80102cc0:	ba 00 04 00 00       	mov    $0x400,%edx
80102cc5:	e8 56 ff ff ff       	call   80102c20 <mpsearch1>
80102cca:	89 c3                	mov    %eax,%ebx
80102ccc:	85 c0                	test   %eax,%eax
80102cce:	0f 84 18 01 00 00    	je     80102dec <mpinit+0x168>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80102cd4:	8b 73 04             	mov    0x4(%ebx),%esi
80102cd7:	85 f6                	test   %esi,%esi
80102cd9:	0f 84 29 01 00 00    	je     80102e08 <mpinit+0x184>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80102cdf:	8d be 00 00 00 80    	lea    -0x80000000(%esi),%edi
  if(memcmp(conf, "PCMP", 4) != 0)
80102ce5:	50                   	push   %eax
80102ce6:	6a 04                	push   $0x4
80102ce8:	68 7d 6a 10 80       	push   $0x80106a7d
80102ced:	57                   	push   %edi
80102cee:	e8 45 12 00 00       	call   80103f38 <memcmp>
80102cf3:	83 c4 10             	add    $0x10,%esp
80102cf6:	85 c0                	test   %eax,%eax
80102cf8:	0f 85 0a 01 00 00    	jne    80102e08 <mpinit+0x184>
  if(conf->version != 1 && conf->version != 4)
80102cfe:	8a 86 06 00 00 80    	mov    -0x7ffffffa(%esi),%al
80102d04:	3c 01                	cmp    $0x1,%al
80102d06:	74 08                	je     80102d10 <mpinit+0x8c>
80102d08:	3c 04                	cmp    $0x4,%al
80102d0a:	0f 85 f8 00 00 00    	jne    80102e08 <mpinit+0x184>
  if(sum((uchar*)conf, conf->length) != 0)
80102d10:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
  for(i=0; i<len; i++)
80102d17:	66 85 d2             	test   %dx,%dx
80102d1a:	74 1f                	je     80102d3b <mpinit+0xb7>
80102d1c:	89 f8                	mov    %edi,%eax
80102d1e:	8d 0c 17             	lea    (%edi,%edx,1),%ecx
80102d21:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  sum = 0;
80102d24:	31 d2                	xor    %edx,%edx
80102d26:	66 90                	xchg   %ax,%ax
    sum += addr[i];
80102d28:	0f b6 08             	movzbl (%eax),%ecx
80102d2b:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80102d2d:	40                   	inc    %eax
80102d2e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
80102d31:	75 f5                	jne    80102d28 <mpinit+0xa4>
  if(sum((uchar*)conf, conf->length) != 0)
80102d33:	84 d2                	test   %dl,%dl
80102d35:	0f 85 cd 00 00 00    	jne    80102e08 <mpinit+0x184>
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80102d3b:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
80102d41:	a3 7c 16 11 80       	mov    %eax,0x8011167c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102d46:	8d 96 2c 00 00 80    	lea    -0x7fffffd4(%esi),%edx
80102d4c:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
80102d53:	01 c7                	add    %eax,%edi
  ismp = 1;
80102d55:	b9 01 00 00 00       	mov    $0x1,%ecx
80102d5a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80102d5d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102d60:	39 d7                	cmp    %edx,%edi
80102d62:	76 13                	jbe    80102d77 <mpinit+0xf3>
    switch(*p){
80102d64:	8a 02                	mov    (%edx),%al
80102d66:	3c 02                	cmp    $0x2,%al
80102d68:	74 46                	je     80102db0 <mpinit+0x12c>
80102d6a:	77 38                	ja     80102da4 <mpinit+0x120>
80102d6c:	84 c0                	test   %al,%al
80102d6e:	74 50                	je     80102dc0 <mpinit+0x13c>
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80102d70:	83 c2 08             	add    $0x8,%edx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80102d73:	39 d7                	cmp    %edx,%edi
80102d75:	77 ed                	ja     80102d64 <mpinit+0xe0>
80102d77:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80102d7a:	85 c9                	test   %ecx,%ecx
80102d7c:	0f 84 93 00 00 00    	je     80102e15 <mpinit+0x191>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
80102d82:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
80102d86:	74 12                	je     80102d9a <mpinit+0x116>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102d88:	b0 70                	mov    $0x70,%al
80102d8a:	ba 22 00 00 00       	mov    $0x22,%edx
80102d8f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102d90:	ba 23 00 00 00       	mov    $0x23,%edx
80102d95:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80102d96:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102d99:	ee                   	out    %al,(%dx)
  }
}
80102d9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d9d:	5b                   	pop    %ebx
80102d9e:	5e                   	pop    %esi
80102d9f:	5f                   	pop    %edi
80102da0:	5d                   	pop    %ebp
80102da1:	c3                   	ret    
80102da2:	66 90                	xchg   %ax,%ax
    switch(*p){
80102da4:	83 e8 03             	sub    $0x3,%eax
80102da7:	3c 01                	cmp    $0x1,%al
80102da9:	76 c5                	jbe    80102d70 <mpinit+0xec>
80102dab:	31 c9                	xor    %ecx,%ecx
80102dad:	eb b1                	jmp    80102d60 <mpinit+0xdc>
80102daf:	90                   	nop
      ioapicid = ioapic->apicno;
80102db0:	8a 42 01             	mov    0x1(%edx),%al
80102db3:	a2 60 17 11 80       	mov    %al,0x80111760
      p += sizeof(struct mpioapic);
80102db8:	83 c2 08             	add    $0x8,%edx
      continue;
80102dbb:	eb a3                	jmp    80102d60 <mpinit+0xdc>
80102dbd:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80102dc0:	a1 00 1d 11 80       	mov    0x80111d00,%eax
80102dc5:	83 f8 07             	cmp    $0x7,%eax
80102dc8:	7f 19                	jg     80102de3 <mpinit+0x15f>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80102dca:	8d 34 80             	lea    (%eax,%eax,4),%esi
80102dcd:	01 f6                	add    %esi,%esi
80102dcf:	01 c6                	add    %eax,%esi
80102dd1:	c1 e6 04             	shl    $0x4,%esi
80102dd4:	8a 5a 01             	mov    0x1(%edx),%bl
80102dd7:	88 9e 80 17 11 80    	mov    %bl,-0x7feee880(%esi)
        ncpu++;
80102ddd:	40                   	inc    %eax
80102dde:	a3 00 1d 11 80       	mov    %eax,0x80111d00
      p += sizeof(struct mpproc);
80102de3:	83 c2 14             	add    $0x14,%edx
      continue;
80102de6:	e9 75 ff ff ff       	jmp    80102d60 <mpinit+0xdc>
80102deb:	90                   	nop
  return mpsearch1(0xF0000, 0x10000);
80102dec:	ba 00 00 01 00       	mov    $0x10000,%edx
80102df1:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80102df6:	e8 25 fe ff ff       	call   80102c20 <mpsearch1>
80102dfb:	89 c3                	mov    %eax,%ebx
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80102dfd:	85 c0                	test   %eax,%eax
80102dff:	0f 85 cf fe ff ff    	jne    80102cd4 <mpinit+0x50>
80102e05:	8d 76 00             	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
80102e08:	83 ec 0c             	sub    $0xc,%esp
80102e0b:	68 82 6a 10 80       	push   $0x80106a82
80102e10:	e8 2b d5 ff ff       	call   80100340 <panic>
    panic("Didn't find a suitable machine");
80102e15:	83 ec 0c             	sub    $0xc,%esp
80102e18:	68 9c 6a 10 80       	push   $0x80106a9c
80102e1d:	e8 1e d5 ff ff       	call   80100340 <panic>
80102e22:	66 90                	xchg   %ax,%ax

80102e24 <picinit>:
80102e24:	b0 ff                	mov    $0xff,%al
80102e26:	ba 21 00 00 00       	mov    $0x21,%edx
80102e2b:	ee                   	out    %al,(%dx)
80102e2c:	ba a1 00 00 00       	mov    $0xa1,%edx
80102e31:	ee                   	out    %al,(%dx)
80102e32:	c3                   	ret    
80102e33:	90                   	nop

80102e34 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80102e34:	55                   	push   %ebp
80102e35:	89 e5                	mov    %esp,%ebp
80102e37:	57                   	push   %edi
80102e38:	56                   	push   %esi
80102e39:	53                   	push   %ebx
80102e3a:	83 ec 0c             	sub    $0xc,%esp
80102e3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e40:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
80102e43:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102e49:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
80102e4f:	e8 a4 de ff ff       	call   80100cf8 <filealloc>
80102e54:	89 03                	mov    %eax,(%ebx)
80102e56:	85 c0                	test   %eax,%eax
80102e58:	0f 84 a8 00 00 00    	je     80102f06 <pipealloc+0xd2>
80102e5e:	e8 95 de ff ff       	call   80100cf8 <filealloc>
80102e63:	89 06                	mov    %eax,(%esi)
80102e65:	85 c0                	test   %eax,%eax
80102e67:	0f 84 87 00 00 00    	je     80102ef4 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80102e6d:	e8 c2 f3 ff ff       	call   80102234 <kalloc>
80102e72:	89 c7                	mov    %eax,%edi
80102e74:	85 c0                	test   %eax,%eax
80102e76:	0f 84 ac 00 00 00    	je     80102f28 <pipealloc+0xf4>
    goto bad;
  p->readopen = 1;
80102e7c:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80102e83:	00 00 00 
  p->writeopen = 1;
80102e86:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80102e8d:	00 00 00 
  p->nwrite = 0;
80102e90:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80102e97:	00 00 00 
  p->nread = 0;
80102e9a:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80102ea1:	00 00 00 
  initlock(&p->lock, "pipe");
80102ea4:	83 ec 08             	sub    $0x8,%esp
80102ea7:	68 bb 6a 10 80       	push   $0x80106abb
80102eac:	50                   	push   %eax
80102ead:	e8 1a 0e 00 00       	call   80103ccc <initlock>
  (*f0)->type = FD_PIPE;
80102eb2:	8b 03                	mov    (%ebx),%eax
80102eb4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80102eba:	8b 03                	mov    (%ebx),%eax
80102ebc:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80102ec0:	8b 03                	mov    (%ebx),%eax
80102ec2:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80102ec6:	8b 03                	mov    (%ebx),%eax
80102ec8:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80102ecb:	8b 06                	mov    (%esi),%eax
80102ecd:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80102ed3:	8b 06                	mov    (%esi),%eax
80102ed5:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80102ed9:	8b 06                	mov    (%esi),%eax
80102edb:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80102edf:	8b 06                	mov    (%esi),%eax
80102ee1:	89 78 0c             	mov    %edi,0xc(%eax)
  return 0;
80102ee4:	83 c4 10             	add    $0x10,%esp
80102ee7:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80102ee9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102eec:	5b                   	pop    %ebx
80102eed:	5e                   	pop    %esi
80102eee:	5f                   	pop    %edi
80102eef:	5d                   	pop    %ebp
80102ef0:	c3                   	ret    
80102ef1:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
80102ef4:	8b 03                	mov    (%ebx),%eax
80102ef6:	85 c0                	test   %eax,%eax
80102ef8:	74 1e                	je     80102f18 <pipealloc+0xe4>
    fileclose(*f0);
80102efa:	83 ec 0c             	sub    $0xc,%esp
80102efd:	50                   	push   %eax
80102efe:	e8 99 de ff ff       	call   80100d9c <fileclose>
80102f03:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80102f06:	8b 06                	mov    (%esi),%eax
80102f08:	85 c0                	test   %eax,%eax
80102f0a:	74 0c                	je     80102f18 <pipealloc+0xe4>
    fileclose(*f1);
80102f0c:	83 ec 0c             	sub    $0xc,%esp
80102f0f:	50                   	push   %eax
80102f10:	e8 87 de ff ff       	call   80100d9c <fileclose>
80102f15:	83 c4 10             	add    $0x10,%esp
  return -1;
80102f18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102f1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f20:	5b                   	pop    %ebx
80102f21:	5e                   	pop    %esi
80102f22:	5f                   	pop    %edi
80102f23:	5d                   	pop    %ebp
80102f24:	c3                   	ret    
80102f25:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
80102f28:	8b 03                	mov    (%ebx),%eax
80102f2a:	85 c0                	test   %eax,%eax
80102f2c:	75 cc                	jne    80102efa <pipealloc+0xc6>
80102f2e:	eb d6                	jmp    80102f06 <pipealloc+0xd2>

80102f30 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80102f30:	55                   	push   %ebp
80102f31:	89 e5                	mov    %esp,%ebp
80102f33:	56                   	push   %esi
80102f34:	53                   	push   %ebx
80102f35:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f38:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
80102f3b:	83 ec 0c             	sub    $0xc,%esp
80102f3e:	53                   	push   %ebx
80102f3f:	e8 c8 0e 00 00       	call   80103e0c <acquire>
  if(writable){
80102f44:	83 c4 10             	add    $0x10,%esp
80102f47:	85 f6                	test   %esi,%esi
80102f49:	74 41                	je     80102f8c <pipeclose+0x5c>
    p->writeopen = 0;
80102f4b:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80102f52:	00 00 00 
    wakeup(&p->nread);
80102f55:	83 ec 0c             	sub    $0xc,%esp
80102f58:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102f5e:	50                   	push   %eax
80102f5f:	e8 dc 0a 00 00       	call   80103a40 <wakeup>
80102f64:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80102f67:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80102f6d:	85 d2                	test   %edx,%edx
80102f6f:	75 0a                	jne    80102f7b <pipeclose+0x4b>
80102f71:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80102f77:	85 c0                	test   %eax,%eax
80102f79:	74 31                	je     80102fac <pipeclose+0x7c>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80102f7b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80102f7e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102f81:	5b                   	pop    %ebx
80102f82:	5e                   	pop    %esi
80102f83:	5d                   	pop    %ebp
    release(&p->lock);
80102f84:	e9 1b 0f 00 00       	jmp    80103ea4 <release>
80102f89:	8d 76 00             	lea    0x0(%esi),%esi
    p->readopen = 0;
80102f8c:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80102f93:	00 00 00 
    wakeup(&p->nwrite);
80102f96:	83 ec 0c             	sub    $0xc,%esp
80102f99:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102f9f:	50                   	push   %eax
80102fa0:	e8 9b 0a 00 00       	call   80103a40 <wakeup>
80102fa5:	83 c4 10             	add    $0x10,%esp
80102fa8:	eb bd                	jmp    80102f67 <pipeclose+0x37>
80102faa:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80102fac:	83 ec 0c             	sub    $0xc,%esp
80102faf:	53                   	push   %ebx
80102fb0:	e8 ef 0e 00 00       	call   80103ea4 <release>
    kfree((char*)p);
80102fb5:	83 c4 10             	add    $0x10,%esp
80102fb8:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80102fbb:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102fbe:	5b                   	pop    %ebx
80102fbf:	5e                   	pop    %esi
80102fc0:	5d                   	pop    %ebp
    kfree((char*)p);
80102fc1:	e9 de f0 ff ff       	jmp    801020a4 <kfree>
80102fc6:	66 90                	xchg   %ax,%ax

80102fc8 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80102fc8:	55                   	push   %ebp
80102fc9:	89 e5                	mov    %esp,%ebp
80102fcb:	57                   	push   %edi
80102fcc:	56                   	push   %esi
80102fcd:	53                   	push   %ebx
80102fce:	83 ec 28             	sub    $0x28,%esp
80102fd1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
80102fd4:	53                   	push   %ebx
80102fd5:	e8 32 0e 00 00       	call   80103e0c <acquire>
  for(i = 0; i < n; i++){
80102fda:	83 c4 10             	add    $0x10,%esp
80102fdd:	8b 45 10             	mov    0x10(%ebp),%eax
80102fe0:	85 c0                	test   %eax,%eax
80102fe2:	0f 8e b1 00 00 00    	jle    80103099 <pipewrite+0xd1>
80102fe8:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80102fee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102ff1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102ff4:	03 4d 10             	add    0x10(%ebp),%ecx
80102ff7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80102ffa:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103000:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80103006:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010300c:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103012:	39 d0                	cmp    %edx,%eax
80103014:	74 38                	je     8010304e <pipewrite+0x86>
80103016:	eb 59                	jmp    80103071 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
80103018:	e8 43 03 00 00       	call   80103360 <myproc>
8010301d:	8b 48 28             	mov    0x28(%eax),%ecx
80103020:	85 c9                	test   %ecx,%ecx
80103022:	75 34                	jne    80103058 <pipewrite+0x90>
      wakeup(&p->nread);
80103024:	83 ec 0c             	sub    $0xc,%esp
80103027:	57                   	push   %edi
80103028:	e8 13 0a 00 00       	call   80103a40 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010302d:	58                   	pop    %eax
8010302e:	5a                   	pop    %edx
8010302f:	53                   	push   %ebx
80103030:	56                   	push   %esi
80103031:	e8 5e 08 00 00       	call   80103894 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103036:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010303c:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103042:	05 00 02 00 00       	add    $0x200,%eax
80103047:	83 c4 10             	add    $0x10,%esp
8010304a:	39 c2                	cmp    %eax,%edx
8010304c:	75 26                	jne    80103074 <pipewrite+0xac>
      if(p->readopen == 0 || myproc()->killed){
8010304e:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103054:	85 c0                	test   %eax,%eax
80103056:	75 c0                	jne    80103018 <pipewrite+0x50>
        release(&p->lock);
80103058:	83 ec 0c             	sub    $0xc,%esp
8010305b:	53                   	push   %ebx
8010305c:	e8 43 0e 00 00       	call   80103ea4 <release>
        return -1;
80103061:	83 c4 10             	add    $0x10,%esp
80103064:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103069:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010306c:	5b                   	pop    %ebx
8010306d:	5e                   	pop    %esi
8010306e:	5f                   	pop    %edi
8010306f:	5d                   	pop    %ebp
80103070:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103071:	89 c2                	mov    %eax,%edx
80103073:	90                   	nop
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103074:	8d 42 01             	lea    0x1(%edx),%eax
80103077:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
8010307d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103080:	8a 0e                	mov    (%esi),%cl
80103082:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103088:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
8010308c:	46                   	inc    %esi
8010308d:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80103090:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80103093:	0f 85 67 ff ff ff    	jne    80103000 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103099:	83 ec 0c             	sub    $0xc,%esp
8010309c:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801030a2:	50                   	push   %eax
801030a3:	e8 98 09 00 00       	call   80103a40 <wakeup>
  release(&p->lock);
801030a8:	89 1c 24             	mov    %ebx,(%esp)
801030ab:	e8 f4 0d 00 00       	call   80103ea4 <release>
  return n;
801030b0:	83 c4 10             	add    $0x10,%esp
801030b3:	8b 45 10             	mov    0x10(%ebp),%eax
801030b6:	eb b1                	jmp    80103069 <pipewrite+0xa1>

801030b8 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801030b8:	55                   	push   %ebp
801030b9:	89 e5                	mov    %esp,%ebp
801030bb:	57                   	push   %edi
801030bc:	56                   	push   %esi
801030bd:	53                   	push   %ebx
801030be:	83 ec 18             	sub    $0x18,%esp
801030c1:	8b 75 08             	mov    0x8(%ebp),%esi
801030c4:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801030c7:	56                   	push   %esi
801030c8:	e8 3f 0d 00 00       	call   80103e0c <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801030cd:	83 c4 10             	add    $0x10,%esp
801030d0:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801030d6:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801030dc:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
801030e2:	74 2f                	je     80103113 <piperead+0x5b>
801030e4:	eb 37                	jmp    8010311d <piperead+0x65>
801030e6:	66 90                	xchg   %ax,%ax
    if(myproc()->killed){
801030e8:	e8 73 02 00 00       	call   80103360 <myproc>
801030ed:	8b 48 28             	mov    0x28(%eax),%ecx
801030f0:	85 c9                	test   %ecx,%ecx
801030f2:	0f 85 80 00 00 00    	jne    80103178 <piperead+0xc0>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801030f8:	83 ec 08             	sub    $0x8,%esp
801030fb:	56                   	push   %esi
801030fc:	53                   	push   %ebx
801030fd:	e8 92 07 00 00       	call   80103894 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103102:	83 c4 10             	add    $0x10,%esp
80103105:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
8010310b:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
80103111:	75 0a                	jne    8010311d <piperead+0x65>
80103113:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
80103119:	85 c0                	test   %eax,%eax
8010311b:	75 cb                	jne    801030e8 <piperead+0x30>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010311d:	31 db                	xor    %ebx,%ebx
8010311f:	8b 55 10             	mov    0x10(%ebp),%edx
80103122:	85 d2                	test   %edx,%edx
80103124:	7f 1d                	jg     80103143 <piperead+0x8b>
80103126:	eb 29                	jmp    80103151 <piperead+0x99>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103128:	8d 48 01             	lea    0x1(%eax),%ecx
8010312b:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
80103131:	25 ff 01 00 00       	and    $0x1ff,%eax
80103136:	8a 44 06 34          	mov    0x34(%esi,%eax,1),%al
8010313a:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010313d:	43                   	inc    %ebx
8010313e:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80103141:	74 0e                	je     80103151 <piperead+0x99>
    if(p->nread == p->nwrite)
80103143:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103149:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010314f:	75 d7                	jne    80103128 <piperead+0x70>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103151:	83 ec 0c             	sub    $0xc,%esp
80103154:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
8010315a:	50                   	push   %eax
8010315b:	e8 e0 08 00 00       	call   80103a40 <wakeup>
  release(&p->lock);
80103160:	89 34 24             	mov    %esi,(%esp)
80103163:	e8 3c 0d 00 00       	call   80103ea4 <release>
  return i;
80103168:	83 c4 10             	add    $0x10,%esp
}
8010316b:	89 d8                	mov    %ebx,%eax
8010316d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103170:	5b                   	pop    %ebx
80103171:	5e                   	pop    %esi
80103172:	5f                   	pop    %edi
80103173:	5d                   	pop    %ebp
80103174:	c3                   	ret    
80103175:	8d 76 00             	lea    0x0(%esi),%esi
      release(&p->lock);
80103178:	83 ec 0c             	sub    $0xc,%esp
8010317b:	56                   	push   %esi
8010317c:	e8 23 0d 00 00       	call   80103ea4 <release>
      return -1;
80103181:	83 c4 10             	add    $0x10,%esp
80103184:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80103189:	89 d8                	mov    %ebx,%eax
8010318b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010318e:	5b                   	pop    %ebx
8010318f:	5e                   	pop    %esi
80103190:	5f                   	pop    %edi
80103191:	5d                   	pop    %ebp
80103192:	c3                   	ret    
80103193:	90                   	nop

80103194 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103194:	55                   	push   %ebp
80103195:	89 e5                	mov    %esp,%ebp
80103197:	53                   	push   %ebx
80103198:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010319b:	68 20 1d 11 80       	push   $0x80111d20
801031a0:	e8 67 0c 00 00       	call   80103e0c <acquire>
801031a5:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801031a8:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801031ad:	eb 0c                	jmp    801031bb <allocproc+0x27>
801031af:	90                   	nop
801031b0:	83 eb 80             	sub    $0xffffff80,%ebx
801031b3:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801031b9:	74 7d                	je     80103238 <allocproc+0xa4>
    if(p->state == UNUSED)
801031bb:	8b 4b 0c             	mov    0xc(%ebx),%ecx
801031be:	85 c9                	test   %ecx,%ecx
801031c0:	75 ee                	jne    801031b0 <allocproc+0x1c>

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801031c2:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
801031c9:	a1 04 90 10 80       	mov    0x80109004,%eax
801031ce:	8d 50 01             	lea    0x1(%eax),%edx
801031d1:	89 15 04 90 10 80    	mov    %edx,0x80109004
801031d7:	89 43 10             	mov    %eax,0x10(%ebx)
  p->readcount = 0;
801031da:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)

  release(&ptable.lock);
801031e1:	83 ec 0c             	sub    $0xc,%esp
801031e4:	68 20 1d 11 80       	push   $0x80111d20
801031e9:	e8 b6 0c 00 00       	call   80103ea4 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801031ee:	e8 41 f0 ff ff       	call   80102234 <kalloc>
801031f3:	89 43 08             	mov    %eax,0x8(%ebx)
801031f6:	83 c4 10             	add    $0x10,%esp
801031f9:	85 c0                	test   %eax,%eax
801031fb:	74 54                	je     80103251 <allocproc+0xbd>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801031fd:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
80103203:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103206:	c7 80 b0 0f 00 00 85 	movl   $0x80104e85,0xfb0(%eax)
8010320d:	4e 10 80 

  sp -= sizeof *p->context;
80103210:	05 9c 0f 00 00       	add    $0xf9c,%eax
  p->context = (struct context*)sp;
80103215:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103218:	52                   	push   %edx
80103219:	6a 14                	push   $0x14
8010321b:	6a 00                	push   $0x0
8010321d:	50                   	push   %eax
8010321e:	e8 c9 0c 00 00       	call   80103eec <memset>
  p->context->eip = (uint)forkret;
80103223:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103226:	c7 40 10 64 32 10 80 	movl   $0x80103264,0x10(%eax)

  return p;
8010322d:	83 c4 10             	add    $0x10,%esp
}
80103230:	89 d8                	mov    %ebx,%eax
80103232:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103235:	c9                   	leave  
80103236:	c3                   	ret    
80103237:	90                   	nop
  release(&ptable.lock);
80103238:	83 ec 0c             	sub    $0xc,%esp
8010323b:	68 20 1d 11 80       	push   $0x80111d20
80103240:	e8 5f 0c 00 00       	call   80103ea4 <release>
  return 0;
80103245:	83 c4 10             	add    $0x10,%esp
80103248:	31 db                	xor    %ebx,%ebx
}
8010324a:	89 d8                	mov    %ebx,%eax
8010324c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010324f:	c9                   	leave  
80103250:	c3                   	ret    
    p->state = UNUSED;
80103251:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103258:	31 db                	xor    %ebx,%ebx
}
8010325a:	89 d8                	mov    %ebx,%eax
8010325c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010325f:	c9                   	leave  
80103260:	c3                   	ret    
80103261:	8d 76 00             	lea    0x0(%esi),%esi

80103264 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103264:	55                   	push   %ebp
80103265:	89 e5                	mov    %esp,%ebp
80103267:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
8010326a:	68 20 1d 11 80       	push   $0x80111d20
8010326f:	e8 30 0c 00 00       	call   80103ea4 <release>

  if (first) {
80103274:	83 c4 10             	add    $0x10,%esp
80103277:	a1 00 90 10 80       	mov    0x80109000,%eax
8010327c:	85 c0                	test   %eax,%eax
8010327e:	75 04                	jne    80103284 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103280:	c9                   	leave  
80103281:	c3                   	ret    
80103282:	66 90                	xchg   %ax,%ax
    first = 0;
80103284:	c7 05 00 90 10 80 00 	movl   $0x0,0x80109000
8010328b:	00 00 00 
    iinit(ROOTDEV);
8010328e:	83 ec 0c             	sub    $0xc,%esp
80103291:	6a 01                	push   $0x1
80103293:	e8 e0 e0 ff ff       	call   80101378 <iinit>
    initlog(ROOTDEV);
80103298:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010329f:	e8 08 f5 ff ff       	call   801027ac <initlog>
}
801032a4:	83 c4 10             	add    $0x10,%esp
801032a7:	c9                   	leave  
801032a8:	c3                   	ret    
801032a9:	8d 76 00             	lea    0x0(%esi),%esi

801032ac <pinit>:
{
801032ac:	55                   	push   %ebp
801032ad:	89 e5                	mov    %esp,%ebp
801032af:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801032b2:	68 c0 6a 10 80       	push   $0x80106ac0
801032b7:	68 20 1d 11 80       	push   $0x80111d20
801032bc:	e8 0b 0a 00 00       	call   80103ccc <initlock>
}
801032c1:	83 c4 10             	add    $0x10,%esp
801032c4:	c9                   	leave  
801032c5:	c3                   	ret    
801032c6:	66 90                	xchg   %ax,%ax

801032c8 <mycpu>:
{
801032c8:	55                   	push   %ebp
801032c9:	89 e5                	mov    %esp,%ebp
801032cb:	56                   	push   %esi
801032cc:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801032cd:	9c                   	pushf  
801032ce:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801032cf:	f6 c4 02             	test   $0x2,%ah
801032d2:	75 48                	jne    8010331c <mycpu+0x54>
  apicid = lapicid();
801032d4:	e8 83 f1 ff ff       	call   8010245c <lapicid>
  for (i = 0; i < ncpu; ++i) {
801032d9:	8b 1d 00 1d 11 80    	mov    0x80111d00,%ebx
801032df:	85 db                	test   %ebx,%ebx
801032e1:	7e 2c                	jle    8010330f <mycpu+0x47>
801032e3:	31 c9                	xor    %ecx,%ecx
801032e5:	eb 06                	jmp    801032ed <mycpu+0x25>
801032e7:	90                   	nop
801032e8:	41                   	inc    %ecx
801032e9:	39 d9                	cmp    %ebx,%ecx
801032eb:	74 22                	je     8010330f <mycpu+0x47>
    if (cpus[i].apicid == apicid)
801032ed:	8d 14 89             	lea    (%ecx,%ecx,4),%edx
801032f0:	01 d2                	add    %edx,%edx
801032f2:	01 ca                	add    %ecx,%edx
801032f4:	c1 e2 04             	shl    $0x4,%edx
801032f7:	0f b6 b2 80 17 11 80 	movzbl -0x7feee880(%edx),%esi
801032fe:	39 c6                	cmp    %eax,%esi
80103300:	75 e6                	jne    801032e8 <mycpu+0x20>
      return &cpus[i];
80103302:	8d 82 80 17 11 80    	lea    -0x7feee880(%edx),%eax
}
80103308:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010330b:	5b                   	pop    %ebx
8010330c:	5e                   	pop    %esi
8010330d:	5d                   	pop    %ebp
8010330e:	c3                   	ret    
  panic("unknown apicid\n");
8010330f:	83 ec 0c             	sub    $0xc,%esp
80103312:	68 c7 6a 10 80       	push   $0x80106ac7
80103317:	e8 24 d0 ff ff       	call   80100340 <panic>
    panic("mycpu called with interrupts enabled\n");
8010331c:	83 ec 0c             	sub    $0xc,%esp
8010331f:	68 a4 6b 10 80       	push   $0x80106ba4
80103324:	e8 17 d0 ff ff       	call   80100340 <panic>
80103329:	8d 76 00             	lea    0x0(%esi),%esi

8010332c <cpuid>:
cpuid() {
8010332c:	55                   	push   %ebp
8010332d:	89 e5                	mov    %esp,%ebp
8010332f:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103332:	e8 91 ff ff ff       	call   801032c8 <mycpu>
80103337:	2d 80 17 11 80       	sub    $0x80111780,%eax
8010333c:	c1 f8 04             	sar    $0x4,%eax
8010333f:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
80103342:	89 ca                	mov    %ecx,%edx
80103344:	c1 e2 05             	shl    $0x5,%edx
80103347:	29 ca                	sub    %ecx,%edx
80103349:	8d 14 90             	lea    (%eax,%edx,4),%edx
8010334c:	8d 0c d0             	lea    (%eax,%edx,8),%ecx
8010334f:	89 ca                	mov    %ecx,%edx
80103351:	c1 e2 0f             	shl    $0xf,%edx
80103354:	29 ca                	sub    %ecx,%edx
80103356:	8d 04 90             	lea    (%eax,%edx,4),%eax
80103359:	f7 d8                	neg    %eax
}
8010335b:	c9                   	leave  
8010335c:	c3                   	ret    
8010335d:	8d 76 00             	lea    0x0(%esi),%esi

80103360 <myproc>:
myproc(void) {
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	83 ec 18             	sub    $0x18,%esp
  pushcli();
80103366:	e8 c5 09 00 00       	call   80103d30 <pushcli>
  c = mycpu();
8010336b:	e8 58 ff ff ff       	call   801032c8 <mycpu>
  p = c->proc;
80103370:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80103376:	89 45 f4             	mov    %eax,-0xc(%ebp)
  popcli();
80103379:	e8 fa 09 00 00       	call   80103d78 <popcli>
}
8010337e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103381:	c9                   	leave  
80103382:	c3                   	ret    
80103383:	90                   	nop

80103384 <userinit>:
{
80103384:	55                   	push   %ebp
80103385:	89 e5                	mov    %esp,%ebp
80103387:	53                   	push   %ebx
80103388:	51                   	push   %ecx
  p = allocproc();
80103389:	e8 06 fe ff ff       	call   80103194 <allocproc>
8010338e:	89 c3                	mov    %eax,%ebx
  initproc = p;
80103390:	a3 b8 95 10 80       	mov    %eax,0x801095b8
  if((p->pgdir = setupkvm()) == 0)
80103395:	e8 82 2f 00 00       	call   8010631c <setupkvm>
8010339a:	89 43 04             	mov    %eax,0x4(%ebx)
8010339d:	85 c0                	test   %eax,%eax
8010339f:	0f 84 b3 00 00 00    	je     80103458 <userinit+0xd4>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801033a5:	52                   	push   %edx
801033a6:	68 2c 00 00 00       	push   $0x2c
801033ab:	68 60 94 10 80       	push   $0x80109460
801033b0:	50                   	push   %eax
801033b1:	e8 82 2c 00 00       	call   80106038 <inituvm>
  p->sz = PGSIZE;
801033b6:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801033bc:	83 c4 0c             	add    $0xc,%esp
801033bf:	6a 4c                	push   $0x4c
801033c1:	6a 00                	push   $0x0
801033c3:	ff 73 18             	pushl  0x18(%ebx)
801033c6:	e8 21 0b 00 00       	call   80103eec <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801033cb:	8b 43 18             	mov    0x18(%ebx),%eax
801033ce:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801033d4:	8b 43 18             	mov    0x18(%ebx),%eax
801033d7:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
  p->tf->es = p->tf->ds;
801033dd:	8b 43 18             	mov    0x18(%ebx),%eax
801033e0:	8b 50 2c             	mov    0x2c(%eax),%edx
801033e3:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801033e7:	8b 43 18             	mov    0x18(%ebx),%eax
801033ea:	8b 50 2c             	mov    0x2c(%eax),%edx
801033ed:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801033f1:	8b 43 18             	mov    0x18(%ebx),%eax
801033f4:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801033fb:	8b 43 18             	mov    0x18(%ebx),%eax
801033fe:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103405:	8b 43 18             	mov    0x18(%ebx),%eax
80103408:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010340f:	83 c4 0c             	add    $0xc,%esp
80103412:	6a 10                	push   $0x10
80103414:	68 f0 6a 10 80       	push   $0x80106af0
80103419:	8d 43 70             	lea    0x70(%ebx),%eax
8010341c:	50                   	push   %eax
8010341d:	e8 1e 0c 00 00       	call   80104040 <safestrcpy>
  p->cwd = namei("/");
80103422:	c7 04 24 f9 6a 10 80 	movl   $0x80106af9,(%esp)
80103429:	e8 e2 e8 ff ff       	call   80101d10 <namei>
8010342e:	89 43 6c             	mov    %eax,0x6c(%ebx)
  acquire(&ptable.lock);
80103431:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103438:	e8 cf 09 00 00       	call   80103e0c <acquire>
  p->state = RUNNABLE;
8010343d:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103444:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010344b:	e8 54 0a 00 00       	call   80103ea4 <release>
}
80103450:	83 c4 10             	add    $0x10,%esp
80103453:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103456:	c9                   	leave  
80103457:	c3                   	ret    
    panic("userinit: out of memory?");
80103458:	83 ec 0c             	sub    $0xc,%esp
8010345b:	68 d7 6a 10 80       	push   $0x80106ad7
80103460:	e8 db ce ff ff       	call   80100340 <panic>
80103465:	8d 76 00             	lea    0x0(%esi),%esi

80103468 <growproc>:
{
80103468:	55                   	push   %ebp
80103469:	89 e5                	mov    %esp,%ebp
8010346b:	56                   	push   %esi
8010346c:	53                   	push   %ebx
8010346d:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103470:	e8 bb 08 00 00       	call   80103d30 <pushcli>
  c = mycpu();
80103475:	e8 4e fe ff ff       	call   801032c8 <mycpu>
  p = c->proc;
8010347a:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103480:	e8 f3 08 00 00       	call   80103d78 <popcli>
  sz = curproc->sz;
80103485:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103487:	85 f6                	test   %esi,%esi
80103489:	7f 19                	jg     801034a4 <growproc+0x3c>
  } else if(n < 0){
8010348b:	75 33                	jne    801034c0 <growproc+0x58>
  curproc->sz = sz;
8010348d:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
8010348f:	83 ec 0c             	sub    $0xc,%esp
80103492:	53                   	push   %ebx
80103493:	e8 a4 2a 00 00       	call   80105f3c <switchuvm>
  return 0;
80103498:	83 c4 10             	add    $0x10,%esp
8010349b:	31 c0                	xor    %eax,%eax
}
8010349d:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034a0:	5b                   	pop    %ebx
801034a1:	5e                   	pop    %esi
801034a2:	5d                   	pop    %ebp
801034a3:	c3                   	ret    
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801034a4:	51                   	push   %ecx
801034a5:	01 c6                	add    %eax,%esi
801034a7:	56                   	push   %esi
801034a8:	50                   	push   %eax
801034a9:	ff 73 04             	pushl  0x4(%ebx)
801034ac:	e8 b7 2c 00 00       	call   80106168 <allocuvm>
801034b1:	83 c4 10             	add    $0x10,%esp
801034b4:	85 c0                	test   %eax,%eax
801034b6:	75 d5                	jne    8010348d <growproc+0x25>
      return -1;
801034b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801034bd:	eb de                	jmp    8010349d <growproc+0x35>
801034bf:	90                   	nop
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801034c0:	52                   	push   %edx
801034c1:	01 c6                	add    %eax,%esi
801034c3:	56                   	push   %esi
801034c4:	50                   	push   %eax
801034c5:	ff 73 04             	pushl  0x4(%ebx)
801034c8:	e8 c3 2d 00 00       	call   80106290 <deallocuvm>
801034cd:	83 c4 10             	add    $0x10,%esp
801034d0:	85 c0                	test   %eax,%eax
801034d2:	75 b9                	jne    8010348d <growproc+0x25>
801034d4:	eb e2                	jmp    801034b8 <growproc+0x50>
801034d6:	66 90                	xchg   %ax,%ax

801034d8 <fork>:
{
801034d8:	55                   	push   %ebp
801034d9:	89 e5                	mov    %esp,%ebp
801034db:	57                   	push   %edi
801034dc:	56                   	push   %esi
801034dd:	53                   	push   %ebx
801034de:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
801034e1:	e8 4a 08 00 00       	call   80103d30 <pushcli>
  c = mycpu();
801034e6:	e8 dd fd ff ff       	call   801032c8 <mycpu>
  p = c->proc;
801034eb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801034f1:	e8 82 08 00 00       	call   80103d78 <popcli>
  if((np = allocproc()) == 0){
801034f6:	e8 99 fc ff ff       	call   80103194 <allocproc>
801034fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801034fe:	85 c0                	test   %eax,%eax
80103500:	0f 84 b9 00 00 00    	je     801035bf <fork+0xe7>
80103506:	89 c7                	mov    %eax,%edi
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103508:	83 ec 08             	sub    $0x8,%esp
8010350b:	ff 33                	pushl  (%ebx)
8010350d:	ff 73 04             	pushl  0x4(%ebx)
80103510:	e8 c3 2e 00 00       	call   801063d8 <copyuvm>
80103515:	89 47 04             	mov    %eax,0x4(%edi)
80103518:	83 c4 10             	add    $0x10,%esp
8010351b:	85 c0                	test   %eax,%eax
8010351d:	0f 84 a3 00 00 00    	je     801035c6 <fork+0xee>
  np->sz = curproc->sz;
80103523:	8b 03                	mov    (%ebx),%eax
80103525:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103528:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
8010352a:	89 c8                	mov    %ecx,%eax
8010352c:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
8010352f:	8b 73 18             	mov    0x18(%ebx),%esi
80103532:	8b 79 18             	mov    0x18(%ecx),%edi
80103535:	b9 13 00 00 00       	mov    $0x13,%ecx
8010353a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eax = 0;
8010353c:	8b 40 18             	mov    0x18(%eax),%eax
8010353f:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  for(i = 0; i < NOFILE; i++)
80103546:	31 f6                	xor    %esi,%esi
    if(curproc->ofile[i])
80103548:	8b 44 b3 2c          	mov    0x2c(%ebx,%esi,4),%eax
8010354c:	85 c0                	test   %eax,%eax
8010354e:	74 13                	je     80103563 <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103550:	83 ec 0c             	sub    $0xc,%esp
80103553:	50                   	push   %eax
80103554:	e8 ff d7 ff ff       	call   80100d58 <filedup>
80103559:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010355c:	89 44 b2 2c          	mov    %eax,0x2c(%edx,%esi,4)
80103560:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NOFILE; i++)
80103563:	46                   	inc    %esi
80103564:	83 fe 10             	cmp    $0x10,%esi
80103567:	75 df                	jne    80103548 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103569:	83 ec 0c             	sub    $0xc,%esp
8010356c:	ff 73 6c             	pushl  0x6c(%ebx)
8010356f:	e8 bc df ff ff       	call   80101530 <idup>
80103574:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103577:	89 47 6c             	mov    %eax,0x6c(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010357a:	83 c4 0c             	add    $0xc,%esp
8010357d:	6a 10                	push   $0x10
8010357f:	83 c3 70             	add    $0x70,%ebx
80103582:	53                   	push   %ebx
80103583:	8d 47 70             	lea    0x70(%edi),%eax
80103586:	50                   	push   %eax
80103587:	e8 b4 0a 00 00       	call   80104040 <safestrcpy>
  pid = np->pid;
8010358c:	8b 47 10             	mov    0x10(%edi),%eax
8010358f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  acquire(&ptable.lock);
80103592:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103599:	e8 6e 08 00 00       	call   80103e0c <acquire>
  np->state = RUNNABLE;
8010359e:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
801035a5:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801035ac:	e8 f3 08 00 00       	call   80103ea4 <release>
  return pid;
801035b1:	83 c4 10             	add    $0x10,%esp
801035b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801035b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035ba:	5b                   	pop    %ebx
801035bb:	5e                   	pop    %esi
801035bc:	5f                   	pop    %edi
801035bd:	5d                   	pop    %ebp
801035be:	c3                   	ret    
    return -1;
801035bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035c4:	eb f1                	jmp    801035b7 <fork+0xdf>
    kfree(np->kstack);
801035c6:	83 ec 0c             	sub    $0xc,%esp
801035c9:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801035cc:	ff 73 08             	pushl  0x8(%ebx)
801035cf:	e8 d0 ea ff ff       	call   801020a4 <kfree>
    np->kstack = 0;
801035d4:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
801035db:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
801035e2:	83 c4 10             	add    $0x10,%esp
801035e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035ea:	eb cb                	jmp    801035b7 <fork+0xdf>

801035ec <scheduler>:
{
801035ec:	55                   	push   %ebp
801035ed:	89 e5                	mov    %esp,%ebp
801035ef:	57                   	push   %edi
801035f0:	56                   	push   %esi
801035f1:	53                   	push   %ebx
801035f2:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
801035f5:	e8 ce fc ff ff       	call   801032c8 <mycpu>
801035fa:	89 c6                	mov    %eax,%esi
  c->proc = 0;
801035fc:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103603:	00 00 00 
80103606:	8d 78 04             	lea    0x4(%eax),%edi
80103609:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
8010360c:	fb                   	sti    
    acquire(&ptable.lock);
8010360d:	83 ec 0c             	sub    $0xc,%esp
80103610:	68 20 1d 11 80       	push   $0x80111d20
80103615:	e8 f2 07 00 00       	call   80103e0c <acquire>
8010361a:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010361d:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103622:	66 90                	xchg   %ax,%ax
      if(p->state != RUNNABLE)
80103624:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103628:	75 33                	jne    8010365d <scheduler+0x71>
      c->proc = p;
8010362a:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103630:	83 ec 0c             	sub    $0xc,%esp
80103633:	53                   	push   %ebx
80103634:	e8 03 29 00 00       	call   80105f3c <switchuvm>
      p->state = RUNNING;
80103639:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103640:	58                   	pop    %eax
80103641:	5a                   	pop    %edx
80103642:	ff 73 1c             	pushl  0x1c(%ebx)
80103645:	57                   	push   %edi
80103646:	e8 42 0a 00 00       	call   8010408d <swtch>
      switchkvm();
8010364b:	e8 dc 28 00 00       	call   80105f2c <switchkvm>
      c->proc = 0;
80103650:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103657:	00 00 00 
8010365a:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010365d:	83 eb 80             	sub    $0xffffff80,%ebx
80103660:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103666:	75 bc                	jne    80103624 <scheduler+0x38>
    release(&ptable.lock);
80103668:	83 ec 0c             	sub    $0xc,%esp
8010366b:	68 20 1d 11 80       	push   $0x80111d20
80103670:	e8 2f 08 00 00       	call   80103ea4 <release>
    sti();
80103675:	83 c4 10             	add    $0x10,%esp
80103678:	eb 92                	jmp    8010360c <scheduler+0x20>
8010367a:	66 90                	xchg   %ax,%ax

8010367c <sched>:
{
8010367c:	55                   	push   %ebp
8010367d:	89 e5                	mov    %esp,%ebp
8010367f:	56                   	push   %esi
80103680:	53                   	push   %ebx
  pushcli();
80103681:	e8 aa 06 00 00       	call   80103d30 <pushcli>
  c = mycpu();
80103686:	e8 3d fc ff ff       	call   801032c8 <mycpu>
  p = c->proc;
8010368b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103691:	e8 e2 06 00 00       	call   80103d78 <popcli>
  if(!holding(&ptable.lock))
80103696:	83 ec 0c             	sub    $0xc,%esp
80103699:	68 20 1d 11 80       	push   $0x80111d20
8010369e:	e8 2d 07 00 00       	call   80103dd0 <holding>
801036a3:	83 c4 10             	add    $0x10,%esp
801036a6:	85 c0                	test   %eax,%eax
801036a8:	74 4f                	je     801036f9 <sched+0x7d>
  if(mycpu()->ncli != 1)
801036aa:	e8 19 fc ff ff       	call   801032c8 <mycpu>
801036af:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
801036b6:	75 68                	jne    80103720 <sched+0xa4>
  if(p->state == RUNNING)
801036b8:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
801036bc:	74 55                	je     80103713 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801036be:	9c                   	pushf  
801036bf:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801036c0:	f6 c4 02             	test   $0x2,%ah
801036c3:	75 41                	jne    80103706 <sched+0x8a>
  intena = mycpu()->intena;
801036c5:	e8 fe fb ff ff       	call   801032c8 <mycpu>
801036ca:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
801036d0:	e8 f3 fb ff ff       	call   801032c8 <mycpu>
801036d5:	83 ec 08             	sub    $0x8,%esp
801036d8:	ff 70 04             	pushl  0x4(%eax)
801036db:	83 c3 1c             	add    $0x1c,%ebx
801036de:	53                   	push   %ebx
801036df:	e8 a9 09 00 00       	call   8010408d <swtch>
  mycpu()->intena = intena;
801036e4:	e8 df fb ff ff       	call   801032c8 <mycpu>
801036e9:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
801036ef:	83 c4 10             	add    $0x10,%esp
801036f2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801036f5:	5b                   	pop    %ebx
801036f6:	5e                   	pop    %esi
801036f7:	5d                   	pop    %ebp
801036f8:	c3                   	ret    
    panic("sched ptable.lock");
801036f9:	83 ec 0c             	sub    $0xc,%esp
801036fc:	68 fb 6a 10 80       	push   $0x80106afb
80103701:	e8 3a cc ff ff       	call   80100340 <panic>
    panic("sched interruptible");
80103706:	83 ec 0c             	sub    $0xc,%esp
80103709:	68 27 6b 10 80       	push   $0x80106b27
8010370e:	e8 2d cc ff ff       	call   80100340 <panic>
    panic("sched running");
80103713:	83 ec 0c             	sub    $0xc,%esp
80103716:	68 19 6b 10 80       	push   $0x80106b19
8010371b:	e8 20 cc ff ff       	call   80100340 <panic>
    panic("sched locks");
80103720:	83 ec 0c             	sub    $0xc,%esp
80103723:	68 0d 6b 10 80       	push   $0x80106b0d
80103728:	e8 13 cc ff ff       	call   80100340 <panic>
8010372d:	8d 76 00             	lea    0x0(%esi),%esi

80103730 <exit>:
{
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	57                   	push   %edi
80103734:	56                   	push   %esi
80103735:	53                   	push   %ebx
80103736:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103739:	e8 f2 05 00 00       	call   80103d30 <pushcli>
  c = mycpu();
8010373e:	e8 85 fb ff ff       	call   801032c8 <mycpu>
  p = c->proc;
80103743:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103749:	e8 2a 06 00 00       	call   80103d78 <popcli>
  if(curproc == initproc)
8010374e:	39 35 b8 95 10 80    	cmp    %esi,0x801095b8
80103754:	0f 84 e5 00 00 00    	je     8010383f <exit+0x10f>
8010375a:	8d 5e 2c             	lea    0x2c(%esi),%ebx
8010375d:	8d 7e 6c             	lea    0x6c(%esi),%edi
    if(curproc->ofile[fd]){
80103760:	8b 03                	mov    (%ebx),%eax
80103762:	85 c0                	test   %eax,%eax
80103764:	74 12                	je     80103778 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103766:	83 ec 0c             	sub    $0xc,%esp
80103769:	50                   	push   %eax
8010376a:	e8 2d d6 ff ff       	call   80100d9c <fileclose>
      curproc->ofile[fd] = 0;
8010376f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103775:	83 c4 10             	add    $0x10,%esp
  for(fd = 0; fd < NOFILE; fd++){
80103778:	83 c3 04             	add    $0x4,%ebx
8010377b:	39 df                	cmp    %ebx,%edi
8010377d:	75 e1                	jne    80103760 <exit+0x30>
  begin_op();
8010377f:	e8 b8 f0 ff ff       	call   8010283c <begin_op>
  iput(curproc->cwd);
80103784:	83 ec 0c             	sub    $0xc,%esp
80103787:	ff 76 6c             	pushl  0x6c(%esi)
8010378a:	e8 d9 de ff ff       	call   80101668 <iput>
  end_op();
8010378f:	e8 10 f1 ff ff       	call   801028a4 <end_op>
  curproc->cwd = 0;
80103794:	c7 46 6c 00 00 00 00 	movl   $0x0,0x6c(%esi)
  acquire(&ptable.lock);
8010379b:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801037a2:	e8 65 06 00 00       	call   80103e0c <acquire>
  wakeup1(curproc->parent);
801037a7:	8b 56 14             	mov    0x14(%esi),%edx
801037aa:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037ad:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801037b2:	eb 0a                	jmp    801037be <exit+0x8e>
801037b4:	83 e8 80             	sub    $0xffffff80,%eax
801037b7:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801037bc:	74 1c                	je     801037da <exit+0xaa>
    if(p->state == SLEEPING && p->chan == chan)
801037be:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801037c2:	75 f0                	jne    801037b4 <exit+0x84>
801037c4:	3b 50 20             	cmp    0x20(%eax),%edx
801037c7:	75 eb                	jne    801037b4 <exit+0x84>
      p->state = RUNNABLE;
801037c9:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037d0:	83 e8 80             	sub    $0xffffff80,%eax
801037d3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801037d8:	75 e4                	jne    801037be <exit+0x8e>
      p->parent = initproc;
801037da:	8b 0d b8 95 10 80    	mov    0x801095b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801037e0:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
801037e5:	eb 0c                	jmp    801037f3 <exit+0xc3>
801037e7:	90                   	nop
801037e8:	83 ea 80             	sub    $0xffffff80,%edx
801037eb:	81 fa 54 3d 11 80    	cmp    $0x80113d54,%edx
801037f1:	74 33                	je     80103826 <exit+0xf6>
    if(p->parent == curproc){
801037f3:	39 72 14             	cmp    %esi,0x14(%edx)
801037f6:	75 f0                	jne    801037e8 <exit+0xb8>
      p->parent = initproc;
801037f8:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
801037fb:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
801037ff:	75 e7                	jne    801037e8 <exit+0xb8>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103801:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103806:	eb 0a                	jmp    80103812 <exit+0xe2>
80103808:	83 e8 80             	sub    $0xffffff80,%eax
8010380b:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103810:	74 d6                	je     801037e8 <exit+0xb8>
    if(p->state == SLEEPING && p->chan == chan)
80103812:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103816:	75 f0                	jne    80103808 <exit+0xd8>
80103818:	3b 48 20             	cmp    0x20(%eax),%ecx
8010381b:	75 eb                	jne    80103808 <exit+0xd8>
      p->state = RUNNABLE;
8010381d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103824:	eb e2                	jmp    80103808 <exit+0xd8>
  curproc->state = ZOMBIE;
80103826:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
8010382d:	e8 4a fe ff ff       	call   8010367c <sched>
  panic("zombie exit");
80103832:	83 ec 0c             	sub    $0xc,%esp
80103835:	68 48 6b 10 80       	push   $0x80106b48
8010383a:	e8 01 cb ff ff       	call   80100340 <panic>
    panic("init exiting");
8010383f:	83 ec 0c             	sub    $0xc,%esp
80103842:	68 3b 6b 10 80       	push   $0x80106b3b
80103847:	e8 f4 ca ff ff       	call   80100340 <panic>

8010384c <yield>:
{
8010384c:	55                   	push   %ebp
8010384d:	89 e5                	mov    %esp,%ebp
8010384f:	53                   	push   %ebx
80103850:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103853:	68 20 1d 11 80       	push   $0x80111d20
80103858:	e8 af 05 00 00       	call   80103e0c <acquire>
  pushcli();
8010385d:	e8 ce 04 00 00       	call   80103d30 <pushcli>
  c = mycpu();
80103862:	e8 61 fa ff ff       	call   801032c8 <mycpu>
  p = c->proc;
80103867:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010386d:	e8 06 05 00 00       	call   80103d78 <popcli>
  myproc()->state = RUNNABLE;
80103872:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103879:	e8 fe fd ff ff       	call   8010367c <sched>
  release(&ptable.lock);
8010387e:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103885:	e8 1a 06 00 00       	call   80103ea4 <release>
}
8010388a:	83 c4 10             	add    $0x10,%esp
8010388d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103890:	c9                   	leave  
80103891:	c3                   	ret    
80103892:	66 90                	xchg   %ax,%ax

80103894 <sleep>:
{
80103894:	55                   	push   %ebp
80103895:	89 e5                	mov    %esp,%ebp
80103897:	57                   	push   %edi
80103898:	56                   	push   %esi
80103899:	53                   	push   %ebx
8010389a:	83 ec 0c             	sub    $0xc,%esp
8010389d:	8b 7d 08             	mov    0x8(%ebp),%edi
801038a0:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
801038a3:	e8 88 04 00 00       	call   80103d30 <pushcli>
  c = mycpu();
801038a8:	e8 1b fa ff ff       	call   801032c8 <mycpu>
  p = c->proc;
801038ad:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b3:	e8 c0 04 00 00       	call   80103d78 <popcli>
  if(p == 0)
801038b8:	85 db                	test   %ebx,%ebx
801038ba:	0f 84 83 00 00 00    	je     80103943 <sleep+0xaf>
  if(lk == 0)
801038c0:	85 f6                	test   %esi,%esi
801038c2:	74 72                	je     80103936 <sleep+0xa2>
  if(lk != &ptable.lock){  //DOC: sleeplock0
801038c4:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
801038ca:	74 4c                	je     80103918 <sleep+0x84>
    acquire(&ptable.lock);  //DOC: sleeplock1
801038cc:	83 ec 0c             	sub    $0xc,%esp
801038cf:	68 20 1d 11 80       	push   $0x80111d20
801038d4:	e8 33 05 00 00       	call   80103e0c <acquire>
    release(lk);
801038d9:	89 34 24             	mov    %esi,(%esp)
801038dc:	e8 c3 05 00 00       	call   80103ea4 <release>
  p->chan = chan;
801038e1:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
801038e4:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
801038eb:	e8 8c fd ff ff       	call   8010367c <sched>
  p->chan = 0;
801038f0:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
801038f7:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801038fe:	e8 a1 05 00 00       	call   80103ea4 <release>
    acquire(lk);
80103903:	83 c4 10             	add    $0x10,%esp
80103906:	89 75 08             	mov    %esi,0x8(%ebp)
}
80103909:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010390c:	5b                   	pop    %ebx
8010390d:	5e                   	pop    %esi
8010390e:	5f                   	pop    %edi
8010390f:	5d                   	pop    %ebp
    acquire(lk);
80103910:	e9 f7 04 00 00       	jmp    80103e0c <acquire>
80103915:	8d 76 00             	lea    0x0(%esi),%esi
  p->chan = chan;
80103918:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
8010391b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103922:	e8 55 fd ff ff       	call   8010367c <sched>
  p->chan = 0;
80103927:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
8010392e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103931:	5b                   	pop    %ebx
80103932:	5e                   	pop    %esi
80103933:	5f                   	pop    %edi
80103934:	5d                   	pop    %ebp
80103935:	c3                   	ret    
    panic("sleep without lk");
80103936:	83 ec 0c             	sub    $0xc,%esp
80103939:	68 5a 6b 10 80       	push   $0x80106b5a
8010393e:	e8 fd c9 ff ff       	call   80100340 <panic>
    panic("sleep");
80103943:	83 ec 0c             	sub    $0xc,%esp
80103946:	68 54 6b 10 80       	push   $0x80106b54
8010394b:	e8 f0 c9 ff ff       	call   80100340 <panic>

80103950 <wait>:
{
80103950:	55                   	push   %ebp
80103951:	89 e5                	mov    %esp,%ebp
80103953:	56                   	push   %esi
80103954:	53                   	push   %ebx
80103955:	83 ec 10             	sub    $0x10,%esp
  pushcli();
80103958:	e8 d3 03 00 00       	call   80103d30 <pushcli>
  c = mycpu();
8010395d:	e8 66 f9 ff ff       	call   801032c8 <mycpu>
  p = c->proc;
80103962:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103968:	e8 0b 04 00 00       	call   80103d78 <popcli>
  acquire(&ptable.lock);
8010396d:	83 ec 0c             	sub    $0xc,%esp
80103970:	68 20 1d 11 80       	push   $0x80111d20
80103975:	e8 92 04 00 00       	call   80103e0c <acquire>
8010397a:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010397d:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010397f:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103984:	eb 0d                	jmp    80103993 <wait+0x43>
80103986:	66 90                	xchg   %ax,%ax
80103988:	83 eb 80             	sub    $0xffffff80,%ebx
8010398b:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103991:	74 1b                	je     801039ae <wait+0x5e>
      if(p->parent != curproc)
80103993:	39 73 14             	cmp    %esi,0x14(%ebx)
80103996:	75 f0                	jne    80103988 <wait+0x38>
      if(p->state == ZOMBIE){
80103998:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010399c:	74 2e                	je     801039cc <wait+0x7c>
      havekids = 1;
8010399e:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801039a3:	83 eb 80             	sub    $0xffffff80,%ebx
801039a6:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801039ac:	75 e5                	jne    80103993 <wait+0x43>
    if(!havekids || curproc->killed){
801039ae:	85 c0                	test   %eax,%eax
801039b0:	74 74                	je     80103a26 <wait+0xd6>
801039b2:	8b 46 28             	mov    0x28(%esi),%eax
801039b5:	85 c0                	test   %eax,%eax
801039b7:	75 6d                	jne    80103a26 <wait+0xd6>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
801039b9:	83 ec 08             	sub    $0x8,%esp
801039bc:	68 20 1d 11 80       	push   $0x80111d20
801039c1:	56                   	push   %esi
801039c2:	e8 cd fe ff ff       	call   80103894 <sleep>
    havekids = 0;
801039c7:	83 c4 10             	add    $0x10,%esp
801039ca:	eb b1                	jmp    8010397d <wait+0x2d>
        pid = p->pid;
801039cc:	8b 43 10             	mov    0x10(%ebx),%eax
801039cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        kfree(p->kstack);
801039d2:	83 ec 0c             	sub    $0xc,%esp
801039d5:	ff 73 08             	pushl  0x8(%ebx)
801039d8:	e8 c7 e6 ff ff       	call   801020a4 <kfree>
        p->kstack = 0;
801039dd:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801039e4:	5a                   	pop    %edx
801039e5:	ff 73 04             	pushl  0x4(%ebx)
801039e8:	e8 bf 28 00 00       	call   801062ac <freevm>
        p->pid = 0;
801039ed:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801039f4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801039fb:	c6 43 70 00          	movb   $0x0,0x70(%ebx)
        p->killed = 0;
801039ff:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        p->state = UNUSED;
80103a06:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103a0d:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103a14:	e8 8b 04 00 00       	call   80103ea4 <release>
        return pid;
80103a19:	83 c4 10             	add    $0x10,%esp
80103a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80103a1f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a22:	5b                   	pop    %ebx
80103a23:	5e                   	pop    %esi
80103a24:	5d                   	pop    %ebp
80103a25:	c3                   	ret    
      release(&ptable.lock);
80103a26:	83 ec 0c             	sub    $0xc,%esp
80103a29:	68 20 1d 11 80       	push   $0x80111d20
80103a2e:	e8 71 04 00 00       	call   80103ea4 <release>
      return -1;
80103a33:	83 c4 10             	add    $0x10,%esp
80103a36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a3b:	eb e2                	jmp    80103a1f <wait+0xcf>
80103a3d:	8d 76 00             	lea    0x0(%esi),%esi

80103a40 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	53                   	push   %ebx
80103a44:	83 ec 10             	sub    $0x10,%esp
80103a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103a4a:	68 20 1d 11 80       	push   $0x80111d20
80103a4f:	e8 b8 03 00 00       	call   80103e0c <acquire>
80103a54:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103a57:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103a5c:	eb 0c                	jmp    80103a6a <wakeup+0x2a>
80103a5e:	66 90                	xchg   %ax,%ax
80103a60:	83 e8 80             	sub    $0xffffff80,%eax
80103a63:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103a68:	74 1c                	je     80103a86 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103a6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103a6e:	75 f0                	jne    80103a60 <wakeup+0x20>
80103a70:	3b 58 20             	cmp    0x20(%eax),%ebx
80103a73:	75 eb                	jne    80103a60 <wakeup+0x20>
      p->state = RUNNABLE;
80103a75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103a7c:	83 e8 80             	sub    $0xffffff80,%eax
80103a7f:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103a84:	75 e4                	jne    80103a6a <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
80103a86:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
}
80103a8d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a90:	c9                   	leave  
  release(&ptable.lock);
80103a91:	e9 0e 04 00 00       	jmp    80103ea4 <release>
80103a96:	66 90                	xchg   %ax,%ax

80103a98 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103a98:	55                   	push   %ebp
80103a99:	89 e5                	mov    %esp,%ebp
80103a9b:	53                   	push   %ebx
80103a9c:	83 ec 10             	sub    $0x10,%esp
80103a9f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103aa2:	68 20 1d 11 80       	push   $0x80111d20
80103aa7:	e8 60 03 00 00       	call   80103e0c <acquire>
80103aac:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aaf:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103ab4:	eb 0c                	jmp    80103ac2 <kill+0x2a>
80103ab6:	66 90                	xchg   %ax,%ax
80103ab8:	83 e8 80             	sub    $0xffffff80,%eax
80103abb:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103ac0:	74 32                	je     80103af4 <kill+0x5c>
    if(p->pid == pid){
80103ac2:	39 58 10             	cmp    %ebx,0x10(%eax)
80103ac5:	75 f1                	jne    80103ab8 <kill+0x20>
      p->killed = 1;
80103ac7:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103ace:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ad2:	75 07                	jne    80103adb <kill+0x43>
        p->state = RUNNABLE;
80103ad4:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80103adb:	83 ec 0c             	sub    $0xc,%esp
80103ade:	68 20 1d 11 80       	push   $0x80111d20
80103ae3:	e8 bc 03 00 00       	call   80103ea4 <release>
      return 0;
80103ae8:	83 c4 10             	add    $0x10,%esp
80103aeb:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103aed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103af0:	c9                   	leave  
80103af1:	c3                   	ret    
80103af2:	66 90                	xchg   %ax,%ax
  release(&ptable.lock);
80103af4:	83 ec 0c             	sub    $0xc,%esp
80103af7:	68 20 1d 11 80       	push   $0x80111d20
80103afc:	e8 a3 03 00 00       	call   80103ea4 <release>
  return -1;
80103b01:	83 c4 10             	add    $0x10,%esp
80103b04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103b09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b0c:	c9                   	leave  
80103b0d:	c3                   	ret    
80103b0e:	66 90                	xchg   %ax,%ax

80103b10 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	57                   	push   %edi
80103b14:	56                   	push   %esi
80103b15:	53                   	push   %ebx
80103b16:	83 ec 3c             	sub    $0x3c,%esp
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b19:	bb c4 1d 11 80       	mov    $0x80111dc4,%ebx
80103b1e:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103b21:	eb 3f                	jmp    80103b62 <procdump+0x52>
80103b23:	90                   	nop
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103b24:	8b 04 85 cc 6b 10 80 	mov    -0x7fef9434(,%eax,4),%eax
80103b2b:	85 c0                	test   %eax,%eax
80103b2d:	74 3f                	je     80103b6e <procdump+0x5e>
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
80103b2f:	53                   	push   %ebx
80103b30:	50                   	push   %eax
80103b31:	ff 73 a0             	pushl  -0x60(%ebx)
80103b34:	68 6f 6b 10 80       	push   $0x80106b6f
80103b39:	e8 e2 ca ff ff       	call   80100620 <cprintf>
    if(p->state == SLEEPING){
80103b3e:	83 c4 10             	add    $0x10,%esp
80103b41:	83 7b 9c 02          	cmpl   $0x2,-0x64(%ebx)
80103b45:	74 31                	je     80103b78 <procdump+0x68>
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103b47:	83 ec 0c             	sub    $0xc,%esp
80103b4a:	68 db 6e 10 80       	push   $0x80106edb
80103b4f:	e8 cc ca ff ff       	call   80100620 <cprintf>
80103b54:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b57:	83 eb 80             	sub    $0xffffff80,%ebx
80103b5a:	81 fb c4 3d 11 80    	cmp    $0x80113dc4,%ebx
80103b60:	74 52                	je     80103bb4 <procdump+0xa4>
    if(p->state == UNUSED)
80103b62:	8b 43 9c             	mov    -0x64(%ebx),%eax
80103b65:	85 c0                	test   %eax,%eax
80103b67:	74 ee                	je     80103b57 <procdump+0x47>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103b69:	83 f8 05             	cmp    $0x5,%eax
80103b6c:	76 b6                	jbe    80103b24 <procdump+0x14>
      state = "???";
80103b6e:	b8 6b 6b 10 80       	mov    $0x80106b6b,%eax
80103b73:	eb ba                	jmp    80103b2f <procdump+0x1f>
80103b75:	8d 76 00             	lea    0x0(%esi),%esi
      getcallerpcs((uint*)p->context->ebp+2, pc);
80103b78:	83 ec 08             	sub    $0x8,%esp
80103b7b:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103b7e:	50                   	push   %eax
80103b7f:	8b 43 ac             	mov    -0x54(%ebx),%eax
80103b82:	8b 40 0c             	mov    0xc(%eax),%eax
80103b85:	83 c0 08             	add    $0x8,%eax
80103b88:	50                   	push   %eax
80103b89:	e8 5a 01 00 00       	call   80103ce8 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
80103b8e:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103b91:	83 c4 10             	add    $0x10,%esp
80103b94:	8b 17                	mov    (%edi),%edx
80103b96:	85 d2                	test   %edx,%edx
80103b98:	74 ad                	je     80103b47 <procdump+0x37>
        cprintf(" %p", pc[i]);
80103b9a:	83 ec 08             	sub    $0x8,%esp
80103b9d:	52                   	push   %edx
80103b9e:	68 c1 65 10 80       	push   $0x801065c1
80103ba3:	e8 78 ca ff ff       	call   80100620 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80103ba8:	83 c7 04             	add    $0x4,%edi
80103bab:	83 c4 10             	add    $0x10,%esp
80103bae:	39 fe                	cmp    %edi,%esi
80103bb0:	75 e2                	jne    80103b94 <procdump+0x84>
80103bb2:	eb 93                	jmp    80103b47 <procdump+0x37>
  }
}
80103bb4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bb7:	5b                   	pop    %ebx
80103bb8:	5e                   	pop    %esi
80103bb9:	5f                   	pop    %edi
80103bba:	5d                   	pop    %ebp
80103bbb:	c3                   	ret    

80103bbc <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80103bbc:	55                   	push   %ebp
80103bbd:	89 e5                	mov    %esp,%ebp
80103bbf:	53                   	push   %ebx
80103bc0:	83 ec 0c             	sub    $0xc,%esp
80103bc3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
80103bc6:	68 e4 6b 10 80       	push   $0x80106be4
80103bcb:	8d 43 04             	lea    0x4(%ebx),%eax
80103bce:	50                   	push   %eax
80103bcf:	e8 f8 00 00 00       	call   80103ccc <initlock>
  lk->name = name;
80103bd4:	8b 45 0c             	mov    0xc(%ebp),%eax
80103bd7:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
80103bda:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103be0:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
}
80103be7:	83 c4 10             	add    $0x10,%esp
80103bea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103bed:	c9                   	leave  
80103bee:	c3                   	ret    
80103bef:	90                   	nop

80103bf0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80103bf0:	55                   	push   %ebp
80103bf1:	89 e5                	mov    %esp,%ebp
80103bf3:	56                   	push   %esi
80103bf4:	53                   	push   %ebx
80103bf5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103bf8:	8d 73 04             	lea    0x4(%ebx),%esi
80103bfb:	83 ec 0c             	sub    $0xc,%esp
80103bfe:	56                   	push   %esi
80103bff:	e8 08 02 00 00       	call   80103e0c <acquire>
  while (lk->locked) {
80103c04:	83 c4 10             	add    $0x10,%esp
80103c07:	8b 13                	mov    (%ebx),%edx
80103c09:	85 d2                	test   %edx,%edx
80103c0b:	74 16                	je     80103c23 <acquiresleep+0x33>
80103c0d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80103c10:	83 ec 08             	sub    $0x8,%esp
80103c13:	56                   	push   %esi
80103c14:	53                   	push   %ebx
80103c15:	e8 7a fc ff ff       	call   80103894 <sleep>
  while (lk->locked) {
80103c1a:	83 c4 10             	add    $0x10,%esp
80103c1d:	8b 03                	mov    (%ebx),%eax
80103c1f:	85 c0                	test   %eax,%eax
80103c21:	75 ed                	jne    80103c10 <acquiresleep+0x20>
  }
  lk->locked = 1;
80103c23:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80103c29:	e8 32 f7 ff ff       	call   80103360 <myproc>
80103c2e:	8b 40 10             	mov    0x10(%eax),%eax
80103c31:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80103c34:	89 75 08             	mov    %esi,0x8(%ebp)
}
80103c37:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c3a:	5b                   	pop    %ebx
80103c3b:	5e                   	pop    %esi
80103c3c:	5d                   	pop    %ebp
  release(&lk->lk);
80103c3d:	e9 62 02 00 00       	jmp    80103ea4 <release>
80103c42:	66 90                	xchg   %ax,%ax

80103c44 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80103c44:	55                   	push   %ebp
80103c45:	89 e5                	mov    %esp,%ebp
80103c47:	56                   	push   %esi
80103c48:	53                   	push   %ebx
80103c49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103c4c:	8d 73 04             	lea    0x4(%ebx),%esi
80103c4f:	83 ec 0c             	sub    $0xc,%esp
80103c52:	56                   	push   %esi
80103c53:	e8 b4 01 00 00       	call   80103e0c <acquire>
  lk->locked = 0;
80103c58:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103c5e:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80103c65:	89 1c 24             	mov    %ebx,(%esp)
80103c68:	e8 d3 fd ff ff       	call   80103a40 <wakeup>
  release(&lk->lk);
80103c6d:	83 c4 10             	add    $0x10,%esp
80103c70:	89 75 08             	mov    %esi,0x8(%ebp)
}
80103c73:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c76:	5b                   	pop    %ebx
80103c77:	5e                   	pop    %esi
80103c78:	5d                   	pop    %ebp
  release(&lk->lk);
80103c79:	e9 26 02 00 00       	jmp    80103ea4 <release>
80103c7e:	66 90                	xchg   %ax,%ax

80103c80 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	56                   	push   %esi
80103c84:	53                   	push   %ebx
80103c85:	83 ec 1c             	sub    $0x1c,%esp
80103c88:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
80103c8b:	8d 73 04             	lea    0x4(%ebx),%esi
80103c8e:	56                   	push   %esi
80103c8f:	e8 78 01 00 00       	call   80103e0c <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80103c94:	83 c4 10             	add    $0x10,%esp
80103c97:	8b 03                	mov    (%ebx),%eax
80103c99:	85 c0                	test   %eax,%eax
80103c9b:	75 1b                	jne    80103cb8 <holdingsleep+0x38>
80103c9d:	31 c0                	xor    %eax,%eax
80103c9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&lk->lk);
80103ca2:	83 ec 0c             	sub    $0xc,%esp
80103ca5:	56                   	push   %esi
80103ca6:	e8 f9 01 00 00       	call   80103ea4 <release>
  return r;
}
80103cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103cae:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103cb1:	5b                   	pop    %ebx
80103cb2:	5e                   	pop    %esi
80103cb3:	5d                   	pop    %ebp
80103cb4:	c3                   	ret    
80103cb5:	8d 76 00             	lea    0x0(%esi),%esi
  r = lk->locked && (lk->pid == myproc()->pid);
80103cb8:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103cbb:	e8 a0 f6 ff ff       	call   80103360 <myproc>
80103cc0:	39 58 10             	cmp    %ebx,0x10(%eax)
80103cc3:	0f 94 c0             	sete   %al
80103cc6:	0f b6 c0             	movzbl %al,%eax
80103cc9:	eb d4                	jmp    80103c9f <holdingsleep+0x1f>
80103ccb:	90                   	nop

80103ccc <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80103ccc:	55                   	push   %ebp
80103ccd:	89 e5                	mov    %esp,%ebp
80103ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80103cd2:	8b 55 0c             	mov    0xc(%ebp),%edx
80103cd5:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80103cd8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80103cde:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80103ce5:	5d                   	pop    %ebp
80103ce6:	c3                   	ret    
80103ce7:	90                   	nop

80103ce8 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80103ce8:	55                   	push   %ebp
80103ce9:	89 e5                	mov    %esp,%ebp
80103ceb:	53                   	push   %ebx
80103cec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80103cef:	8b 45 08             	mov    0x8(%ebp),%eax
80103cf2:	83 e8 08             	sub    $0x8,%eax
  for(i = 0; i < 10; i++){
80103cf5:	31 d2                	xor    %edx,%edx
80103cf7:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80103cf8:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80103cfe:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103d04:	77 12                	ja     80103d18 <getcallerpcs+0x30>
      break;
    pcs[i] = ebp[1];     // saved %eip
80103d06:	8b 58 04             	mov    0x4(%eax),%ebx
80103d09:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
    ebp = (uint*)ebp[0]; // saved %ebp
80103d0c:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80103d0e:	42                   	inc    %edx
80103d0f:	83 fa 0a             	cmp    $0xa,%edx
80103d12:	75 e4                	jne    80103cf8 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
80103d14:	5b                   	pop    %ebx
80103d15:	5d                   	pop    %ebp
80103d16:	c3                   	ret    
80103d17:	90                   	nop
  for(; i < 10; i++)
80103d18:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80103d1b:	8d 51 28             	lea    0x28(%ecx),%edx
80103d1e:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80103d20:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80103d26:	83 c0 04             	add    $0x4,%eax
80103d29:	39 d0                	cmp    %edx,%eax
80103d2b:	75 f3                	jne    80103d20 <getcallerpcs+0x38>
}
80103d2d:	5b                   	pop    %ebx
80103d2e:	5d                   	pop    %ebp
80103d2f:	c3                   	ret    

80103d30 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	53                   	push   %ebx
80103d34:	52                   	push   %edx
80103d35:	9c                   	pushf  
80103d36:	5b                   	pop    %ebx
  asm volatile("cli");
80103d37:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
80103d38:	e8 8b f5 ff ff       	call   801032c8 <mycpu>
80103d3d:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80103d43:	85 c9                	test   %ecx,%ecx
80103d45:	74 11                	je     80103d58 <pushcli+0x28>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
80103d47:	e8 7c f5 ff ff       	call   801032c8 <mycpu>
80103d4c:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
}
80103d52:	58                   	pop    %eax
80103d53:	5b                   	pop    %ebx
80103d54:	5d                   	pop    %ebp
80103d55:	c3                   	ret    
80103d56:	66 90                	xchg   %ax,%ax
    mycpu()->intena = eflags & FL_IF;
80103d58:	e8 6b f5 ff ff       	call   801032c8 <mycpu>
80103d5d:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103d63:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
80103d69:	e8 5a f5 ff ff       	call   801032c8 <mycpu>
80103d6e:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
}
80103d74:	58                   	pop    %eax
80103d75:	5b                   	pop    %ebx
80103d76:	5d                   	pop    %ebp
80103d77:	c3                   	ret    

80103d78 <popcli>:

void
popcli(void)
{
80103d78:	55                   	push   %ebp
80103d79:	89 e5                	mov    %esp,%ebp
80103d7b:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d7e:	9c                   	pushf  
80103d7f:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103d80:	f6 c4 02             	test   $0x2,%ah
80103d83:	75 31                	jne    80103db6 <popcli+0x3e>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
80103d85:	e8 3e f5 ff ff       	call   801032c8 <mycpu>
80103d8a:	ff 88 a4 00 00 00    	decl   0xa4(%eax)
80103d90:	78 31                	js     80103dc3 <popcli+0x4b>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103d92:	e8 31 f5 ff ff       	call   801032c8 <mycpu>
80103d97:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80103d9d:	85 d2                	test   %edx,%edx
80103d9f:	74 03                	je     80103da4 <popcli+0x2c>
    sti();
}
80103da1:	c9                   	leave  
80103da2:	c3                   	ret    
80103da3:	90                   	nop
  if(mycpu()->ncli == 0 && mycpu()->intena)
80103da4:	e8 1f f5 ff ff       	call   801032c8 <mycpu>
80103da9:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80103daf:	85 c0                	test   %eax,%eax
80103db1:	74 ee                	je     80103da1 <popcli+0x29>
  asm volatile("sti");
80103db3:	fb                   	sti    
}
80103db4:	c9                   	leave  
80103db5:	c3                   	ret    
    panic("popcli - interruptible");
80103db6:	83 ec 0c             	sub    $0xc,%esp
80103db9:	68 ef 6b 10 80       	push   $0x80106bef
80103dbe:	e8 7d c5 ff ff       	call   80100340 <panic>
    panic("popcli");
80103dc3:	83 ec 0c             	sub    $0xc,%esp
80103dc6:	68 06 6c 10 80       	push   $0x80106c06
80103dcb:	e8 70 c5 ff ff       	call   80100340 <panic>

80103dd0 <holding>:
{
80103dd0:	55                   	push   %ebp
80103dd1:	89 e5                	mov    %esp,%ebp
80103dd3:	53                   	push   %ebx
80103dd4:	83 ec 14             	sub    $0x14,%esp
80103dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80103dda:	e8 51 ff ff ff       	call   80103d30 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80103ddf:	8b 03                	mov    (%ebx),%eax
80103de1:	85 c0                	test   %eax,%eax
80103de3:	75 13                	jne    80103df8 <holding+0x28>
80103de5:	31 c0                	xor    %eax,%eax
80103de7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  popcli();
80103dea:	e8 89 ff ff ff       	call   80103d78 <popcli>
}
80103def:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103df2:	83 c4 14             	add    $0x14,%esp
80103df5:	5b                   	pop    %ebx
80103df6:	5d                   	pop    %ebp
80103df7:	c3                   	ret    
  r = lock->locked && lock->cpu == mycpu();
80103df8:	8b 5b 08             	mov    0x8(%ebx),%ebx
80103dfb:	e8 c8 f4 ff ff       	call   801032c8 <mycpu>
80103e00:	39 c3                	cmp    %eax,%ebx
80103e02:	0f 94 c0             	sete   %al
80103e05:	0f b6 c0             	movzbl %al,%eax
80103e08:	eb dd                	jmp    80103de7 <holding+0x17>
80103e0a:	66 90                	xchg   %ax,%ax

80103e0c <acquire>:
{
80103e0c:	55                   	push   %ebp
80103e0d:	89 e5                	mov    %esp,%ebp
80103e0f:	56                   	push   %esi
80103e10:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80103e11:	e8 1a ff ff ff       	call   80103d30 <pushcli>
  if(holding(lk))
80103e16:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e19:	83 ec 0c             	sub    $0xc,%esp
80103e1c:	53                   	push   %ebx
80103e1d:	e8 ae ff ff ff       	call   80103dd0 <holding>
80103e22:	83 c4 10             	add    $0x10,%esp
80103e25:	85 c0                	test   %eax,%eax
80103e27:	75 6b                	jne    80103e94 <acquire+0x88>
80103e29:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
80103e2b:	ba 01 00 00 00       	mov    $0x1,%edx
80103e30:	eb 05                	jmp    80103e37 <acquire+0x2b>
80103e32:	66 90                	xchg   %ax,%ax
80103e34:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e37:	89 d0                	mov    %edx,%eax
80103e39:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80103e3c:	85 c0                	test   %eax,%eax
80103e3e:	75 f4                	jne    80103e34 <acquire+0x28>
  __sync_synchronize();
80103e40:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80103e45:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e48:	e8 7b f4 ff ff       	call   801032c8 <mycpu>
80103e4d:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
80103e50:	89 e8                	mov    %ebp,%eax
80103e52:	66 90                	xchg   %ax,%ax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80103e54:	8d 90 00 00 00 80    	lea    -0x80000000(%eax),%edx
80103e5a:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
80103e60:	77 16                	ja     80103e78 <acquire+0x6c>
    pcs[i] = ebp[1];     // saved %eip
80103e62:	8b 50 04             	mov    0x4(%eax),%edx
80103e65:	89 54 b3 0c          	mov    %edx,0xc(%ebx,%esi,4)
    ebp = (uint*)ebp[0]; // saved %ebp
80103e69:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80103e6b:	46                   	inc    %esi
80103e6c:	83 fe 0a             	cmp    $0xa,%esi
80103e6f:	75 e3                	jne    80103e54 <acquire+0x48>
}
80103e71:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e74:	5b                   	pop    %ebx
80103e75:	5e                   	pop    %esi
80103e76:	5d                   	pop    %ebp
80103e77:	c3                   	ret    
  for(; i < 10; i++)
80103e78:	8d 44 b3 0c          	lea    0xc(%ebx,%esi,4),%eax
80103e7c:	83 c3 34             	add    $0x34,%ebx
80103e7f:	90                   	nop
    pcs[i] = 0;
80103e80:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80103e86:	83 c0 04             	add    $0x4,%eax
80103e89:	39 d8                	cmp    %ebx,%eax
80103e8b:	75 f3                	jne    80103e80 <acquire+0x74>
}
80103e8d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e90:	5b                   	pop    %ebx
80103e91:	5e                   	pop    %esi
80103e92:	5d                   	pop    %ebp
80103e93:	c3                   	ret    
    panic("acquire");
80103e94:	83 ec 0c             	sub    $0xc,%esp
80103e97:	68 0d 6c 10 80       	push   $0x80106c0d
80103e9c:	e8 9f c4 ff ff       	call   80100340 <panic>
80103ea1:	8d 76 00             	lea    0x0(%esi),%esi

80103ea4 <release>:
{
80103ea4:	55                   	push   %ebp
80103ea5:	89 e5                	mov    %esp,%ebp
80103ea7:	53                   	push   %ebx
80103ea8:	83 ec 10             	sub    $0x10,%esp
80103eab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
80103eae:	53                   	push   %ebx
80103eaf:	e8 1c ff ff ff       	call   80103dd0 <holding>
80103eb4:	83 c4 10             	add    $0x10,%esp
80103eb7:	85 c0                	test   %eax,%eax
80103eb9:	74 22                	je     80103edd <release+0x39>
  lk->pcs[0] = 0;
80103ebb:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80103ec2:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80103ec9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80103ece:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80103ed4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ed7:	c9                   	leave  
  popcli();
80103ed8:	e9 9b fe ff ff       	jmp    80103d78 <popcli>
    panic("release");
80103edd:	83 ec 0c             	sub    $0xc,%esp
80103ee0:	68 15 6c 10 80       	push   $0x80106c15
80103ee5:	e8 56 c4 ff ff       	call   80100340 <panic>
80103eea:	66 90                	xchg   %ax,%ax

80103eec <memset>:
80103eec:	55                   	push   %ebp
80103eed:	89 e5                	mov    %esp,%ebp
80103eef:	57                   	push   %edi
80103ef0:	53                   	push   %ebx
80103ef1:	8b 55 08             	mov    0x8(%ebp),%edx
80103ef4:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103ef7:	89 d0                	mov    %edx,%eax
80103ef9:	09 c8                	or     %ecx,%eax
80103efb:	a8 03                	test   $0x3,%al
80103efd:	75 29                	jne    80103f28 <memset+0x3c>
80103eff:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
80103f03:	c1 e9 02             	shr    $0x2,%ecx
80103f06:	8b 45 0c             	mov    0xc(%ebp),%eax
80103f09:	c1 e0 18             	shl    $0x18,%eax
80103f0c:	89 fb                	mov    %edi,%ebx
80103f0e:	c1 e3 10             	shl    $0x10,%ebx
80103f11:	09 d8                	or     %ebx,%eax
80103f13:	09 f8                	or     %edi,%eax
80103f15:	c1 e7 08             	shl    $0x8,%edi
80103f18:	09 f8                	or     %edi,%eax
80103f1a:	89 d7                	mov    %edx,%edi
80103f1c:	fc                   	cld    
80103f1d:	f3 ab                	rep stos %eax,%es:(%edi)
80103f1f:	89 d0                	mov    %edx,%eax
80103f21:	5b                   	pop    %ebx
80103f22:	5f                   	pop    %edi
80103f23:	5d                   	pop    %ebp
80103f24:	c3                   	ret    
80103f25:	8d 76 00             	lea    0x0(%esi),%esi
80103f28:	89 d7                	mov    %edx,%edi
80103f2a:	8b 45 0c             	mov    0xc(%ebp),%eax
80103f2d:	fc                   	cld    
80103f2e:	f3 aa                	rep stos %al,%es:(%edi)
80103f30:	89 d0                	mov    %edx,%eax
80103f32:	5b                   	pop    %ebx
80103f33:	5f                   	pop    %edi
80103f34:	5d                   	pop    %ebp
80103f35:	c3                   	ret    
80103f36:	66 90                	xchg   %ax,%ax

80103f38 <memcmp>:
80103f38:	55                   	push   %ebp
80103f39:	89 e5                	mov    %esp,%ebp
80103f3b:	56                   	push   %esi
80103f3c:	53                   	push   %ebx
80103f3d:	8b 55 08             	mov    0x8(%ebp),%edx
80103f40:	8b 45 0c             	mov    0xc(%ebp),%eax
80103f43:	8b 75 10             	mov    0x10(%ebp),%esi
80103f46:	85 f6                	test   %esi,%esi
80103f48:	74 1e                	je     80103f68 <memcmp+0x30>
80103f4a:	01 c6                	add    %eax,%esi
80103f4c:	eb 08                	jmp    80103f56 <memcmp+0x1e>
80103f4e:	66 90                	xchg   %ax,%ax
80103f50:	42                   	inc    %edx
80103f51:	40                   	inc    %eax
80103f52:	39 f0                	cmp    %esi,%eax
80103f54:	74 12                	je     80103f68 <memcmp+0x30>
80103f56:	8a 0a                	mov    (%edx),%cl
80103f58:	0f b6 18             	movzbl (%eax),%ebx
80103f5b:	38 d9                	cmp    %bl,%cl
80103f5d:	74 f1                	je     80103f50 <memcmp+0x18>
80103f5f:	0f b6 c1             	movzbl %cl,%eax
80103f62:	29 d8                	sub    %ebx,%eax
80103f64:	5b                   	pop    %ebx
80103f65:	5e                   	pop    %esi
80103f66:	5d                   	pop    %ebp
80103f67:	c3                   	ret    
80103f68:	31 c0                	xor    %eax,%eax
80103f6a:	5b                   	pop    %ebx
80103f6b:	5e                   	pop    %esi
80103f6c:	5d                   	pop    %ebp
80103f6d:	c3                   	ret    
80103f6e:	66 90                	xchg   %ax,%ax

80103f70 <memmove>:
80103f70:	55                   	push   %ebp
80103f71:	89 e5                	mov    %esp,%ebp
80103f73:	57                   	push   %edi
80103f74:	56                   	push   %esi
80103f75:	8b 55 08             	mov    0x8(%ebp),%edx
80103f78:	8b 75 0c             	mov    0xc(%ebp),%esi
80103f7b:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103f7e:	39 d6                	cmp    %edx,%esi
80103f80:	73 07                	jae    80103f89 <memmove+0x19>
80103f82:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80103f85:	39 fa                	cmp    %edi,%edx
80103f87:	72 17                	jb     80103fa0 <memmove+0x30>
80103f89:	85 c9                	test   %ecx,%ecx
80103f8b:	74 0c                	je     80103f99 <memmove+0x29>
80103f8d:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
80103f90:	89 d7                	mov    %edx,%edi
80103f92:	66 90                	xchg   %ax,%ax
80103f94:	a4                   	movsb  %ds:(%esi),%es:(%edi)
80103f95:	39 f0                	cmp    %esi,%eax
80103f97:	75 fb                	jne    80103f94 <memmove+0x24>
80103f99:	89 d0                	mov    %edx,%eax
80103f9b:	5e                   	pop    %esi
80103f9c:	5f                   	pop    %edi
80103f9d:	5d                   	pop    %ebp
80103f9e:	c3                   	ret    
80103f9f:	90                   	nop
80103fa0:	8d 41 ff             	lea    -0x1(%ecx),%eax
80103fa3:	85 c9                	test   %ecx,%ecx
80103fa5:	74 f2                	je     80103f99 <memmove+0x29>
80103fa7:	90                   	nop
80103fa8:	8a 0c 06             	mov    (%esi,%eax,1),%cl
80103fab:	88 0c 02             	mov    %cl,(%edx,%eax,1)
80103fae:	48                   	dec    %eax
80103faf:	83 f8 ff             	cmp    $0xffffffff,%eax
80103fb2:	75 f4                	jne    80103fa8 <memmove+0x38>
80103fb4:	89 d0                	mov    %edx,%eax
80103fb6:	5e                   	pop    %esi
80103fb7:	5f                   	pop    %edi
80103fb8:	5d                   	pop    %ebp
80103fb9:	c3                   	ret    
80103fba:	66 90                	xchg   %ax,%ax

80103fbc <memcpy>:
80103fbc:	eb b2                	jmp    80103f70 <memmove>
80103fbe:	66 90                	xchg   %ax,%ax

80103fc0 <strncmp>:
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
80103fc3:	56                   	push   %esi
80103fc4:	53                   	push   %ebx
80103fc5:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103fc8:	8b 45 0c             	mov    0xc(%ebp),%eax
80103fcb:	8b 75 10             	mov    0x10(%ebp),%esi
80103fce:	85 f6                	test   %esi,%esi
80103fd0:	74 22                	je     80103ff4 <strncmp+0x34>
80103fd2:	01 c6                	add    %eax,%esi
80103fd4:	eb 0c                	jmp    80103fe2 <strncmp+0x22>
80103fd6:	66 90                	xchg   %ax,%ax
80103fd8:	38 ca                	cmp    %cl,%dl
80103fda:	75 0f                	jne    80103feb <strncmp+0x2b>
80103fdc:	43                   	inc    %ebx
80103fdd:	40                   	inc    %eax
80103fde:	39 f0                	cmp    %esi,%eax
80103fe0:	74 12                	je     80103ff4 <strncmp+0x34>
80103fe2:	8a 13                	mov    (%ebx),%dl
80103fe4:	0f b6 08             	movzbl (%eax),%ecx
80103fe7:	84 d2                	test   %dl,%dl
80103fe9:	75 ed                	jne    80103fd8 <strncmp+0x18>
80103feb:	0f b6 c2             	movzbl %dl,%eax
80103fee:	29 c8                	sub    %ecx,%eax
80103ff0:	5b                   	pop    %ebx
80103ff1:	5e                   	pop    %esi
80103ff2:	5d                   	pop    %ebp
80103ff3:	c3                   	ret    
80103ff4:	31 c0                	xor    %eax,%eax
80103ff6:	5b                   	pop    %ebx
80103ff7:	5e                   	pop    %esi
80103ff8:	5d                   	pop    %ebp
80103ff9:	c3                   	ret    
80103ffa:	66 90                	xchg   %ax,%ax

80103ffc <strncpy>:
80103ffc:	55                   	push   %ebp
80103ffd:	89 e5                	mov    %esp,%ebp
80103fff:	56                   	push   %esi
80104000:	53                   	push   %ebx
80104001:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104004:	8b 55 10             	mov    0x10(%ebp),%edx
80104007:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010400a:	eb 0c                	jmp    80104018 <strncpy+0x1c>
8010400c:	43                   	inc    %ebx
8010400d:	41                   	inc    %ecx
8010400e:	8a 43 ff             	mov    -0x1(%ebx),%al
80104011:	88 41 ff             	mov    %al,-0x1(%ecx)
80104014:	84 c0                	test   %al,%al
80104016:	74 07                	je     8010401f <strncpy+0x23>
80104018:	89 d6                	mov    %edx,%esi
8010401a:	4a                   	dec    %edx
8010401b:	85 f6                	test   %esi,%esi
8010401d:	7f ed                	jg     8010400c <strncpy+0x10>
8010401f:	89 cb                	mov    %ecx,%ebx
80104021:	85 d2                	test   %edx,%edx
80104023:	7e 14                	jle    80104039 <strncpy+0x3d>
80104025:	8d 76 00             	lea    0x0(%esi),%esi
80104028:	43                   	inc    %ebx
80104029:	c6 43 ff 00          	movb   $0x0,-0x1(%ebx)
8010402d:	89 da                	mov    %ebx,%edx
8010402f:	f7 d2                	not    %edx
80104031:	01 ca                	add    %ecx,%edx
80104033:	01 f2                	add    %esi,%edx
80104035:	85 d2                	test   %edx,%edx
80104037:	7f ef                	jg     80104028 <strncpy+0x2c>
80104039:	8b 45 08             	mov    0x8(%ebp),%eax
8010403c:	5b                   	pop    %ebx
8010403d:	5e                   	pop    %esi
8010403e:	5d                   	pop    %ebp
8010403f:	c3                   	ret    

80104040 <safestrcpy>:
80104040:	55                   	push   %ebp
80104041:	89 e5                	mov    %esp,%ebp
80104043:	56                   	push   %esi
80104044:	53                   	push   %ebx
80104045:	8b 45 08             	mov    0x8(%ebp),%eax
80104048:	8b 55 0c             	mov    0xc(%ebp),%edx
8010404b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010404e:	85 c9                	test   %ecx,%ecx
80104050:	7e 1d                	jle    8010406f <safestrcpy+0x2f>
80104052:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104056:	89 c1                	mov    %eax,%ecx
80104058:	eb 0e                	jmp    80104068 <safestrcpy+0x28>
8010405a:	66 90                	xchg   %ax,%ax
8010405c:	42                   	inc    %edx
8010405d:	41                   	inc    %ecx
8010405e:	8a 5a ff             	mov    -0x1(%edx),%bl
80104061:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104064:	84 db                	test   %bl,%bl
80104066:	74 04                	je     8010406c <safestrcpy+0x2c>
80104068:	39 f2                	cmp    %esi,%edx
8010406a:	75 f0                	jne    8010405c <safestrcpy+0x1c>
8010406c:	c6 01 00             	movb   $0x0,(%ecx)
8010406f:	5b                   	pop    %ebx
80104070:	5e                   	pop    %esi
80104071:	5d                   	pop    %ebp
80104072:	c3                   	ret    
80104073:	90                   	nop

80104074 <strlen>:
80104074:	55                   	push   %ebp
80104075:	89 e5                	mov    %esp,%ebp
80104077:	8b 55 08             	mov    0x8(%ebp),%edx
8010407a:	31 c0                	xor    %eax,%eax
8010407c:	80 3a 00             	cmpb   $0x0,(%edx)
8010407f:	74 0a                	je     8010408b <strlen+0x17>
80104081:	8d 76 00             	lea    0x0(%esi),%esi
80104084:	40                   	inc    %eax
80104085:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104089:	75 f9                	jne    80104084 <strlen+0x10>
8010408b:	5d                   	pop    %ebp
8010408c:	c3                   	ret    

8010408d <swtch>:
8010408d:	8b 44 24 04          	mov    0x4(%esp),%eax
80104091:	8b 54 24 08          	mov    0x8(%esp),%edx
80104095:	55                   	push   %ebp
80104096:	53                   	push   %ebx
80104097:	56                   	push   %esi
80104098:	57                   	push   %edi
80104099:	89 20                	mov    %esp,(%eax)
8010409b:	89 d4                	mov    %edx,%esp
8010409d:	5f                   	pop    %edi
8010409e:	5e                   	pop    %esi
8010409f:	5b                   	pop    %ebx
801040a0:	5d                   	pop    %ebp
801040a1:	c3                   	ret    
801040a2:	66 90                	xchg   %ax,%ax

801040a4 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801040a4:	55                   	push   %ebp
801040a5:	89 e5                	mov    %esp,%ebp
801040a7:	53                   	push   %ebx
801040a8:	51                   	push   %ecx
801040a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801040ac:	e8 af f2 ff ff       	call   80103360 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801040b1:	8b 00                	mov    (%eax),%eax
801040b3:	39 d8                	cmp    %ebx,%eax
801040b5:	76 15                	jbe    801040cc <fetchint+0x28>
801040b7:	8d 53 04             	lea    0x4(%ebx),%edx
801040ba:	39 d0                	cmp    %edx,%eax
801040bc:	72 0e                	jb     801040cc <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
801040be:	8b 13                	mov    (%ebx),%edx
801040c0:	8b 45 0c             	mov    0xc(%ebp),%eax
801040c3:	89 10                	mov    %edx,(%eax)
  return 0;
801040c5:	31 c0                	xor    %eax,%eax
}
801040c7:	5a                   	pop    %edx
801040c8:	5b                   	pop    %ebx
801040c9:	5d                   	pop    %ebp
801040ca:	c3                   	ret    
801040cb:	90                   	nop
    return -1;
801040cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040d1:	eb f4                	jmp    801040c7 <fetchint+0x23>
801040d3:	90                   	nop

801040d4 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801040d4:	55                   	push   %ebp
801040d5:	89 e5                	mov    %esp,%ebp
801040d7:	53                   	push   %ebx
801040d8:	51                   	push   %ecx
801040d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801040dc:	e8 7f f2 ff ff       	call   80103360 <myproc>

  if(addr >= curproc->sz)
801040e1:	39 18                	cmp    %ebx,(%eax)
801040e3:	76 1f                	jbe    80104104 <fetchstr+0x30>
    return -1;
  *pp = (char*)addr;
801040e5:	8b 55 0c             	mov    0xc(%ebp),%edx
801040e8:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
801040ea:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
801040ec:	39 d3                	cmp    %edx,%ebx
801040ee:	73 14                	jae    80104104 <fetchstr+0x30>
801040f0:	89 d8                	mov    %ebx,%eax
801040f2:	eb 05                	jmp    801040f9 <fetchstr+0x25>
801040f4:	40                   	inc    %eax
801040f5:	39 c2                	cmp    %eax,%edx
801040f7:	76 0b                	jbe    80104104 <fetchstr+0x30>
    if(*s == 0)
801040f9:	80 38 00             	cmpb   $0x0,(%eax)
801040fc:	75 f6                	jne    801040f4 <fetchstr+0x20>
      return s - *pp;
801040fe:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104100:	5a                   	pop    %edx
80104101:	5b                   	pop    %ebx
80104102:	5d                   	pop    %ebp
80104103:	c3                   	ret    
    return -1;
80104104:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104109:	5a                   	pop    %edx
8010410a:	5b                   	pop    %ebx
8010410b:	5d                   	pop    %ebp
8010410c:	c3                   	ret    
8010410d:	8d 76 00             	lea    0x0(%esi),%esi

80104110 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	56                   	push   %esi
80104114:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104115:	e8 46 f2 ff ff       	call   80103360 <myproc>
8010411a:	8b 40 18             	mov    0x18(%eax),%eax
8010411d:	8b 40 44             	mov    0x44(%eax),%eax
80104120:	8b 55 08             	mov    0x8(%ebp),%edx
80104123:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104126:	8d 73 04             	lea    0x4(%ebx),%esi
  struct proc *curproc = myproc();
80104129:	e8 32 f2 ff ff       	call   80103360 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010412e:	8b 00                	mov    (%eax),%eax
80104130:	39 c6                	cmp    %eax,%esi
80104132:	73 18                	jae    8010414c <argint+0x3c>
80104134:	8d 53 08             	lea    0x8(%ebx),%edx
80104137:	39 d0                	cmp    %edx,%eax
80104139:	72 11                	jb     8010414c <argint+0x3c>
  *ip = *(int*)(addr);
8010413b:	8b 53 04             	mov    0x4(%ebx),%edx
8010413e:	8b 45 0c             	mov    0xc(%ebp),%eax
80104141:	89 10                	mov    %edx,(%eax)
  return 0;
80104143:	31 c0                	xor    %eax,%eax
}
80104145:	5b                   	pop    %ebx
80104146:	5e                   	pop    %esi
80104147:	5d                   	pop    %ebp
80104148:	c3                   	ret    
80104149:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
8010414c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104151:	eb f2                	jmp    80104145 <argint+0x35>
80104153:	90                   	nop

80104154 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104154:	55                   	push   %ebp
80104155:	89 e5                	mov    %esp,%ebp
80104157:	56                   	push   %esi
80104158:	53                   	push   %ebx
80104159:	83 ec 10             	sub    $0x10,%esp
8010415c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010415f:	e8 fc f1 ff ff       	call   80103360 <myproc>
80104164:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104166:	83 ec 08             	sub    $0x8,%esp
80104169:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010416c:	50                   	push   %eax
8010416d:	ff 75 08             	pushl  0x8(%ebp)
80104170:	e8 9b ff ff ff       	call   80104110 <argint>
80104175:	83 c4 10             	add    $0x10,%esp
80104178:	85 c0                	test   %eax,%eax
8010417a:	78 24                	js     801041a0 <argptr+0x4c>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
8010417c:	85 db                	test   %ebx,%ebx
8010417e:	78 20                	js     801041a0 <argptr+0x4c>
80104180:	8b 16                	mov    (%esi),%edx
80104182:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104185:	39 c2                	cmp    %eax,%edx
80104187:	76 17                	jbe    801041a0 <argptr+0x4c>
80104189:	01 c3                	add    %eax,%ebx
8010418b:	39 da                	cmp    %ebx,%edx
8010418d:	72 11                	jb     801041a0 <argptr+0x4c>
    return -1;
  *pp = (char*)i;
8010418f:	8b 55 0c             	mov    0xc(%ebp),%edx
80104192:	89 02                	mov    %eax,(%edx)
  return 0;
80104194:	31 c0                	xor    %eax,%eax
}
80104196:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104199:	5b                   	pop    %ebx
8010419a:	5e                   	pop    %esi
8010419b:	5d                   	pop    %ebp
8010419c:	c3                   	ret    
8010419d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
801041a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801041a5:	eb ef                	jmp    80104196 <argptr+0x42>
801041a7:	90                   	nop

801041a8 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801041a8:	55                   	push   %ebp
801041a9:	89 e5                	mov    %esp,%ebp
801041ab:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
801041ae:	8d 45 f4             	lea    -0xc(%ebp),%eax
801041b1:	50                   	push   %eax
801041b2:	ff 75 08             	pushl  0x8(%ebp)
801041b5:	e8 56 ff ff ff       	call   80104110 <argint>
801041ba:	83 c4 10             	add    $0x10,%esp
801041bd:	85 c0                	test   %eax,%eax
801041bf:	78 13                	js     801041d4 <argstr+0x2c>
    return -1;
  return fetchstr(addr, pp);
801041c1:	83 ec 08             	sub    $0x8,%esp
801041c4:	ff 75 0c             	pushl  0xc(%ebp)
801041c7:	ff 75 f4             	pushl  -0xc(%ebp)
801041ca:	e8 05 ff ff ff       	call   801040d4 <fetchstr>
801041cf:	83 c4 10             	add    $0x10,%esp
}
801041d2:	c9                   	leave  
801041d3:	c3                   	ret    
    return -1;
801041d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041d9:	c9                   	leave  
801041da:	c3                   	ret    
801041db:	90                   	nop

801041dc <syscall>:
[SYS_getreadcount] sys_getreadcount,
};

void
syscall(void)
{
801041dc:	55                   	push   %ebp
801041dd:	89 e5                	mov    %esp,%ebp
801041df:	53                   	push   %ebx
801041e0:	50                   	push   %eax
  int num;
  struct proc *curproc = myproc();
801041e1:	e8 7a f1 ff ff       	call   80103360 <myproc>
801041e6:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
801041e8:	8b 40 18             	mov    0x18(%eax),%eax
801041eb:	8b 40 1c             	mov    0x1c(%eax),%eax
  if (num == SYS_read)
801041ee:	83 f8 05             	cmp    $0x5,%eax
801041f1:	74 45                	je     80104238 <syscall+0x5c>
  {
      curproc->readcount = curproc->readcount + 1;
  }
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801041f3:	8d 50 ff             	lea    -0x1(%eax),%edx
801041f6:	83 fa 15             	cmp    $0x15,%edx
801041f9:	76 25                	jbe    80104220 <syscall+0x44>
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801041fb:	50                   	push   %eax
            curproc->pid, curproc->name, num);
801041fc:	8d 43 70             	lea    0x70(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
801041ff:	50                   	push   %eax
80104200:	ff 73 10             	pushl  0x10(%ebx)
80104203:	68 1d 6c 10 80       	push   $0x80106c1d
80104208:	e8 13 c4 ff ff       	call   80100620 <cprintf>
    curproc->tf->eax = -1;
8010420d:	8b 43 18             	mov    0x18(%ebx),%eax
80104210:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104217:	83 c4 10             	add    $0x10,%esp
  }
}
8010421a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010421d:	c9                   	leave  
8010421e:	c3                   	ret    
8010421f:	90                   	nop
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104220:	8b 14 85 40 6c 10 80 	mov    -0x7fef93c0(,%eax,4),%edx
80104227:	85 d2                	test   %edx,%edx
80104229:	74 d0                	je     801041fb <syscall+0x1f>
    curproc->tf->eax = syscalls[num]();
8010422b:	ff d2                	call   *%edx
8010422d:	8b 53 18             	mov    0x18(%ebx),%edx
80104230:	89 42 1c             	mov    %eax,0x1c(%edx)
}
80104233:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104236:	c9                   	leave  
80104237:	c3                   	ret    
      curproc->readcount = curproc->readcount + 1;
80104238:	ff 43 24             	incl   0x24(%ebx)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
8010423b:	ba 68 44 10 80       	mov    $0x80104468,%edx
    curproc->tf->eax = syscalls[num]();
80104240:	ff d2                	call   *%edx
80104242:	8b 53 18             	mov    0x18(%ebx),%edx
80104245:	89 42 1c             	mov    %eax,0x1c(%edx)
80104248:	eb e9                	jmp    80104233 <syscall+0x57>
8010424a:	66 90                	xchg   %ax,%ax

8010424c <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
8010424c:	55                   	push   %ebp
8010424d:	89 e5                	mov    %esp,%ebp
8010424f:	57                   	push   %edi
80104250:	56                   	push   %esi
80104251:	53                   	push   %ebx
80104252:	83 ec 34             	sub    $0x34,%esp
80104255:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104258:	89 4d d0             	mov    %ecx,-0x30(%ebp)
8010425b:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010425e:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104261:	8d 7d da             	lea    -0x26(%ebp),%edi
80104264:	57                   	push   %edi
80104265:	50                   	push   %eax
80104266:	e8 bd da ff ff       	call   80101d28 <nameiparent>
8010426b:	83 c4 10             	add    $0x10,%esp
8010426e:	85 c0                	test   %eax,%eax
80104270:	0f 84 22 01 00 00    	je     80104398 <create+0x14c>
80104276:	89 c3                	mov    %eax,%ebx
    return 0;
  ilock(dp);
80104278:	83 ec 0c             	sub    $0xc,%esp
8010427b:	50                   	push   %eax
8010427c:	e8 db d2 ff ff       	call   8010155c <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104281:	83 c4 0c             	add    $0xc,%esp
80104284:	6a 00                	push   $0x0
80104286:	57                   	push   %edi
80104287:	53                   	push   %ebx
80104288:	e8 a3 d7 ff ff       	call   80101a30 <dirlookup>
8010428d:	89 c6                	mov    %eax,%esi
8010428f:	83 c4 10             	add    $0x10,%esp
80104292:	85 c0                	test   %eax,%eax
80104294:	74 46                	je     801042dc <create+0x90>
    iunlockput(dp);
80104296:	83 ec 0c             	sub    $0xc,%esp
80104299:	53                   	push   %ebx
8010429a:	e8 15 d5 ff ff       	call   801017b4 <iunlockput>
    ilock(ip);
8010429f:	89 34 24             	mov    %esi,(%esp)
801042a2:	e8 b5 d2 ff ff       	call   8010155c <ilock>
    if(type == T_FILE && ip->type == T_FILE)
801042a7:	83 c4 10             	add    $0x10,%esp
801042aa:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
801042af:	75 13                	jne    801042c4 <create+0x78>
801042b1:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
801042b6:	75 0c                	jne    801042c4 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
801042b8:	89 f0                	mov    %esi,%eax
801042ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042bd:	5b                   	pop    %ebx
801042be:	5e                   	pop    %esi
801042bf:	5f                   	pop    %edi
801042c0:	5d                   	pop    %ebp
801042c1:	c3                   	ret    
801042c2:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
801042c4:	83 ec 0c             	sub    $0xc,%esp
801042c7:	56                   	push   %esi
801042c8:	e8 e7 d4 ff ff       	call   801017b4 <iunlockput>
    return 0;
801042cd:	83 c4 10             	add    $0x10,%esp
801042d0:	31 f6                	xor    %esi,%esi
}
801042d2:	89 f0                	mov    %esi,%eax
801042d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042d7:	5b                   	pop    %ebx
801042d8:	5e                   	pop    %esi
801042d9:	5f                   	pop    %edi
801042da:	5d                   	pop    %ebp
801042db:	c3                   	ret    
  if((ip = ialloc(dp->dev, type)) == 0)
801042dc:	83 ec 08             	sub    $0x8,%esp
801042df:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
801042e3:	50                   	push   %eax
801042e4:	ff 33                	pushl  (%ebx)
801042e6:	e8 19 d1 ff ff       	call   80101404 <ialloc>
801042eb:	89 c6                	mov    %eax,%esi
801042ed:	83 c4 10             	add    $0x10,%esp
801042f0:	85 c0                	test   %eax,%eax
801042f2:	0f 84 b9 00 00 00    	je     801043b1 <create+0x165>
  ilock(ip);
801042f8:	83 ec 0c             	sub    $0xc,%esp
801042fb:	50                   	push   %eax
801042fc:	e8 5b d2 ff ff       	call   8010155c <ilock>
  ip->major = major;
80104301:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104304:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
80104308:	8b 45 cc             	mov    -0x34(%ebp),%eax
8010430b:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
8010430f:	66 c7 46 56 01 00    	movw   $0x1,0x56(%esi)
  iupdate(ip);
80104315:	89 34 24             	mov    %esi,(%esp)
80104318:	e8 97 d1 ff ff       	call   801014b4 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
8010431d:	83 c4 10             	add    $0x10,%esp
80104320:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104325:	74 29                	je     80104350 <create+0x104>
  if(dirlink(dp, name, ip->inum) < 0)
80104327:	50                   	push   %eax
80104328:	ff 76 04             	pushl  0x4(%esi)
8010432b:	57                   	push   %edi
8010432c:	53                   	push   %ebx
8010432d:	e8 2e d9 ff ff       	call   80101c60 <dirlink>
80104332:	83 c4 10             	add    $0x10,%esp
80104335:	85 c0                	test   %eax,%eax
80104337:	78 6b                	js     801043a4 <create+0x158>
  iunlockput(dp);
80104339:	83 ec 0c             	sub    $0xc,%esp
8010433c:	53                   	push   %ebx
8010433d:	e8 72 d4 ff ff       	call   801017b4 <iunlockput>
  return ip;
80104342:	83 c4 10             	add    $0x10,%esp
}
80104345:	89 f0                	mov    %esi,%eax
80104347:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010434a:	5b                   	pop    %ebx
8010434b:	5e                   	pop    %esi
8010434c:	5f                   	pop    %edi
8010434d:	5d                   	pop    %ebp
8010434e:	c3                   	ret    
8010434f:	90                   	nop
    dp->nlink++;  // for ".."
80104350:	66 ff 43 56          	incw   0x56(%ebx)
    iupdate(dp);
80104354:	83 ec 0c             	sub    $0xc,%esp
80104357:	53                   	push   %ebx
80104358:	e8 57 d1 ff ff       	call   801014b4 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010435d:	83 c4 0c             	add    $0xc,%esp
80104360:	ff 76 04             	pushl  0x4(%esi)
80104363:	68 b8 6c 10 80       	push   $0x80106cb8
80104368:	56                   	push   %esi
80104369:	e8 f2 d8 ff ff       	call   80101c60 <dirlink>
8010436e:	83 c4 10             	add    $0x10,%esp
80104371:	85 c0                	test   %eax,%eax
80104373:	78 16                	js     8010438b <create+0x13f>
80104375:	52                   	push   %edx
80104376:	ff 73 04             	pushl  0x4(%ebx)
80104379:	68 b7 6c 10 80       	push   $0x80106cb7
8010437e:	56                   	push   %esi
8010437f:	e8 dc d8 ff ff       	call   80101c60 <dirlink>
80104384:	83 c4 10             	add    $0x10,%esp
80104387:	85 c0                	test   %eax,%eax
80104389:	79 9c                	jns    80104327 <create+0xdb>
      panic("create dots");
8010438b:	83 ec 0c             	sub    $0xc,%esp
8010438e:	68 ab 6c 10 80       	push   $0x80106cab
80104393:	e8 a8 bf ff ff       	call   80100340 <panic>
    return 0;
80104398:	31 f6                	xor    %esi,%esi
}
8010439a:	89 f0                	mov    %esi,%eax
8010439c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010439f:	5b                   	pop    %ebx
801043a0:	5e                   	pop    %esi
801043a1:	5f                   	pop    %edi
801043a2:	5d                   	pop    %ebp
801043a3:	c3                   	ret    
    panic("create: dirlink");
801043a4:	83 ec 0c             	sub    $0xc,%esp
801043a7:	68 ba 6c 10 80       	push   $0x80106cba
801043ac:	e8 8f bf ff ff       	call   80100340 <panic>
    panic("create: ialloc");
801043b1:	83 ec 0c             	sub    $0xc,%esp
801043b4:	68 9c 6c 10 80       	push   $0x80106c9c
801043b9:	e8 82 bf ff ff       	call   80100340 <panic>
801043be:	66 90                	xchg   %ax,%ax

801043c0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
801043c5:	83 ec 18             	sub    $0x18,%esp
801043c8:	89 c3                	mov    %eax,%ebx
801043ca:	89 d6                	mov    %edx,%esi
  if(argint(n, &fd) < 0)
801043cc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801043cf:	50                   	push   %eax
801043d0:	6a 00                	push   $0x0
801043d2:	e8 39 fd ff ff       	call   80104110 <argint>
801043d7:	83 c4 10             	add    $0x10,%esp
801043da:	85 c0                	test   %eax,%eax
801043dc:	78 2a                	js     80104408 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
801043de:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801043e2:	77 24                	ja     80104408 <argfd.constprop.0+0x48>
801043e4:	e8 77 ef ff ff       	call   80103360 <myproc>
801043e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801043ec:	8b 44 90 2c          	mov    0x2c(%eax,%edx,4),%eax
801043f0:	85 c0                	test   %eax,%eax
801043f2:	74 14                	je     80104408 <argfd.constprop.0+0x48>
  if(pfd)
801043f4:	85 db                	test   %ebx,%ebx
801043f6:	74 02                	je     801043fa <argfd.constprop.0+0x3a>
    *pfd = fd;
801043f8:	89 13                	mov    %edx,(%ebx)
    *pf = f;
801043fa:	89 06                	mov    %eax,(%esi)
  return 0;
801043fc:	31 c0                	xor    %eax,%eax
}
801043fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104401:	5b                   	pop    %ebx
80104402:	5e                   	pop    %esi
80104403:	5d                   	pop    %ebp
80104404:	c3                   	ret    
80104405:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104408:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010440d:	eb ef                	jmp    801043fe <argfd.constprop.0+0x3e>
8010440f:	90                   	nop

80104410 <sys_dup>:
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	56                   	push   %esi
80104414:	53                   	push   %ebx
80104415:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104418:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010441b:	31 c0                	xor    %eax,%eax
8010441d:	e8 9e ff ff ff       	call   801043c0 <argfd.constprop.0>
80104422:	85 c0                	test   %eax,%eax
80104424:	78 18                	js     8010443e <sys_dup+0x2e>
  if((fd=fdalloc(f)) < 0)
80104426:	8b 75 f4             	mov    -0xc(%ebp),%esi
  struct proc *curproc = myproc();
80104429:	e8 32 ef ff ff       	call   80103360 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010442e:	31 db                	xor    %ebx,%ebx
    if(curproc->ofile[fd] == 0){
80104430:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80104434:	85 d2                	test   %edx,%edx
80104436:	74 14                	je     8010444c <sys_dup+0x3c>
  for(fd = 0; fd < NOFILE; fd++){
80104438:	43                   	inc    %ebx
80104439:	83 fb 10             	cmp    $0x10,%ebx
8010443c:	75 f2                	jne    80104430 <sys_dup+0x20>
    return -1;
8010443e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104443:	89 d8                	mov    %ebx,%eax
80104445:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104448:	5b                   	pop    %ebx
80104449:	5e                   	pop    %esi
8010444a:	5d                   	pop    %ebp
8010444b:	c3                   	ret    
      curproc->ofile[fd] = f;
8010444c:	89 74 98 2c          	mov    %esi,0x2c(%eax,%ebx,4)
  filedup(f);
80104450:	83 ec 0c             	sub    $0xc,%esp
80104453:	ff 75 f4             	pushl  -0xc(%ebp)
80104456:	e8 fd c8 ff ff       	call   80100d58 <filedup>
  return fd;
8010445b:	83 c4 10             	add    $0x10,%esp
}
8010445e:	89 d8                	mov    %ebx,%eax
80104460:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104463:	5b                   	pop    %ebx
80104464:	5e                   	pop    %esi
80104465:	5d                   	pop    %ebp
80104466:	c3                   	ret    
80104467:	90                   	nop

80104468 <sys_read>:
{
80104468:	55                   	push   %ebp
80104469:	89 e5                	mov    %esp,%ebp
8010446b:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
8010446e:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104471:	31 c0                	xor    %eax,%eax
80104473:	e8 48 ff ff ff       	call   801043c0 <argfd.constprop.0>
80104478:	85 c0                	test   %eax,%eax
8010447a:	78 40                	js     801044bc <sys_read+0x54>
8010447c:	83 ec 08             	sub    $0x8,%esp
8010447f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104482:	50                   	push   %eax
80104483:	6a 02                	push   $0x2
80104485:	e8 86 fc ff ff       	call   80104110 <argint>
8010448a:	83 c4 10             	add    $0x10,%esp
8010448d:	85 c0                	test   %eax,%eax
8010448f:	78 2b                	js     801044bc <sys_read+0x54>
80104491:	52                   	push   %edx
80104492:	ff 75 f0             	pushl  -0x10(%ebp)
80104495:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104498:	50                   	push   %eax
80104499:	6a 01                	push   $0x1
8010449b:	e8 b4 fc ff ff       	call   80104154 <argptr>
801044a0:	83 c4 10             	add    $0x10,%esp
801044a3:	85 c0                	test   %eax,%eax
801044a5:	78 15                	js     801044bc <sys_read+0x54>
  return fileread(f, p, n);
801044a7:	50                   	push   %eax
801044a8:	ff 75 f0             	pushl  -0x10(%ebp)
801044ab:	ff 75 f4             	pushl  -0xc(%ebp)
801044ae:	ff 75 ec             	pushl  -0x14(%ebp)
801044b1:	e8 ea c9 ff ff       	call   80100ea0 <fileread>
801044b6:	83 c4 10             	add    $0x10,%esp
}
801044b9:	c9                   	leave  
801044ba:	c3                   	ret    
801044bb:	90                   	nop
    return -1;
801044bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801044c1:	c9                   	leave  
801044c2:	c3                   	ret    
801044c3:	90                   	nop

801044c4 <sys_write>:
{
801044c4:	55                   	push   %ebp
801044c5:	89 e5                	mov    %esp,%ebp
801044c7:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801044ca:	8d 55 ec             	lea    -0x14(%ebp),%edx
801044cd:	31 c0                	xor    %eax,%eax
801044cf:	e8 ec fe ff ff       	call   801043c0 <argfd.constprop.0>
801044d4:	85 c0                	test   %eax,%eax
801044d6:	78 40                	js     80104518 <sys_write+0x54>
801044d8:	83 ec 08             	sub    $0x8,%esp
801044db:	8d 45 f0             	lea    -0x10(%ebp),%eax
801044de:	50                   	push   %eax
801044df:	6a 02                	push   $0x2
801044e1:	e8 2a fc ff ff       	call   80104110 <argint>
801044e6:	83 c4 10             	add    $0x10,%esp
801044e9:	85 c0                	test   %eax,%eax
801044eb:	78 2b                	js     80104518 <sys_write+0x54>
801044ed:	52                   	push   %edx
801044ee:	ff 75 f0             	pushl  -0x10(%ebp)
801044f1:	8d 45 f4             	lea    -0xc(%ebp),%eax
801044f4:	50                   	push   %eax
801044f5:	6a 01                	push   $0x1
801044f7:	e8 58 fc ff ff       	call   80104154 <argptr>
801044fc:	83 c4 10             	add    $0x10,%esp
801044ff:	85 c0                	test   %eax,%eax
80104501:	78 15                	js     80104518 <sys_write+0x54>
  return filewrite(f, p, n);
80104503:	50                   	push   %eax
80104504:	ff 75 f0             	pushl  -0x10(%ebp)
80104507:	ff 75 f4             	pushl  -0xc(%ebp)
8010450a:	ff 75 ec             	pushl  -0x14(%ebp)
8010450d:	e8 1a ca ff ff       	call   80100f2c <filewrite>
80104512:	83 c4 10             	add    $0x10,%esp
}
80104515:	c9                   	leave  
80104516:	c3                   	ret    
80104517:	90                   	nop
    return -1;
80104518:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010451d:	c9                   	leave  
8010451e:	c3                   	ret    
8010451f:	90                   	nop

80104520 <sys_close>:
{
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104526:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104529:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010452c:	e8 8f fe ff ff       	call   801043c0 <argfd.constprop.0>
80104531:	85 c0                	test   %eax,%eax
80104533:	78 23                	js     80104558 <sys_close+0x38>
  myproc()->ofile[fd] = 0;
80104535:	e8 26 ee ff ff       	call   80103360 <myproc>
8010453a:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010453d:	c7 44 90 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edx,4)
80104544:	00 
  fileclose(f);
80104545:	83 ec 0c             	sub    $0xc,%esp
80104548:	ff 75 f4             	pushl  -0xc(%ebp)
8010454b:	e8 4c c8 ff ff       	call   80100d9c <fileclose>
  return 0;
80104550:	83 c4 10             	add    $0x10,%esp
80104553:	31 c0                	xor    %eax,%eax
}
80104555:	c9                   	leave  
80104556:	c3                   	ret    
80104557:	90                   	nop
    return -1;
80104558:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010455d:	c9                   	leave  
8010455e:	c3                   	ret    
8010455f:	90                   	nop

80104560 <sys_fstat>:
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104566:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104569:	31 c0                	xor    %eax,%eax
8010456b:	e8 50 fe ff ff       	call   801043c0 <argfd.constprop.0>
80104570:	85 c0                	test   %eax,%eax
80104572:	78 28                	js     8010459c <sys_fstat+0x3c>
80104574:	50                   	push   %eax
80104575:	6a 14                	push   $0x14
80104577:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010457a:	50                   	push   %eax
8010457b:	6a 01                	push   $0x1
8010457d:	e8 d2 fb ff ff       	call   80104154 <argptr>
80104582:	83 c4 10             	add    $0x10,%esp
80104585:	85 c0                	test   %eax,%eax
80104587:	78 13                	js     8010459c <sys_fstat+0x3c>
  return filestat(f, st);
80104589:	83 ec 08             	sub    $0x8,%esp
8010458c:	ff 75 f4             	pushl  -0xc(%ebp)
8010458f:	ff 75 f0             	pushl  -0x10(%ebp)
80104592:	e8 c5 c8 ff ff       	call   80100e5c <filestat>
80104597:	83 c4 10             	add    $0x10,%esp
}
8010459a:	c9                   	leave  
8010459b:	c3                   	ret    
    return -1;
8010459c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801045a1:	c9                   	leave  
801045a2:	c3                   	ret    
801045a3:	90                   	nop

801045a4 <sys_link>:
{
801045a4:	55                   	push   %ebp
801045a5:	89 e5                	mov    %esp,%ebp
801045a7:	57                   	push   %edi
801045a8:	56                   	push   %esi
801045a9:	53                   	push   %ebx
801045aa:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801045ad:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801045b0:	50                   	push   %eax
801045b1:	6a 00                	push   $0x0
801045b3:	e8 f0 fb ff ff       	call   801041a8 <argstr>
801045b8:	83 c4 10             	add    $0x10,%esp
801045bb:	85 c0                	test   %eax,%eax
801045bd:	0f 88 f2 00 00 00    	js     801046b5 <sys_link+0x111>
801045c3:	83 ec 08             	sub    $0x8,%esp
801045c6:	8d 45 d0             	lea    -0x30(%ebp),%eax
801045c9:	50                   	push   %eax
801045ca:	6a 01                	push   $0x1
801045cc:	e8 d7 fb ff ff       	call   801041a8 <argstr>
801045d1:	83 c4 10             	add    $0x10,%esp
801045d4:	85 c0                	test   %eax,%eax
801045d6:	0f 88 d9 00 00 00    	js     801046b5 <sys_link+0x111>
  begin_op();
801045dc:	e8 5b e2 ff ff       	call   8010283c <begin_op>
  if((ip = namei(old)) == 0){
801045e1:	83 ec 0c             	sub    $0xc,%esp
801045e4:	ff 75 d4             	pushl  -0x2c(%ebp)
801045e7:	e8 24 d7 ff ff       	call   80101d10 <namei>
801045ec:	89 c3                	mov    %eax,%ebx
801045ee:	83 c4 10             	add    $0x10,%esp
801045f1:	85 c0                	test   %eax,%eax
801045f3:	0f 84 db 00 00 00    	je     801046d4 <sys_link+0x130>
  ilock(ip);
801045f9:	83 ec 0c             	sub    $0xc,%esp
801045fc:	50                   	push   %eax
801045fd:	e8 5a cf ff ff       	call   8010155c <ilock>
  if(ip->type == T_DIR){
80104602:	83 c4 10             	add    $0x10,%esp
80104605:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010460a:	0f 84 ac 00 00 00    	je     801046bc <sys_link+0x118>
  ip->nlink++;
80104610:	66 ff 43 56          	incw   0x56(%ebx)
  iupdate(ip);
80104614:	83 ec 0c             	sub    $0xc,%esp
80104617:	53                   	push   %ebx
80104618:	e8 97 ce ff ff       	call   801014b4 <iupdate>
  iunlock(ip);
8010461d:	89 1c 24             	mov    %ebx,(%esp)
80104620:	e8 ff cf ff ff       	call   80101624 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104625:	5a                   	pop    %edx
80104626:	59                   	pop    %ecx
80104627:	8d 7d da             	lea    -0x26(%ebp),%edi
8010462a:	57                   	push   %edi
8010462b:	ff 75 d0             	pushl  -0x30(%ebp)
8010462e:	e8 f5 d6 ff ff       	call   80101d28 <nameiparent>
80104633:	89 c6                	mov    %eax,%esi
80104635:	83 c4 10             	add    $0x10,%esp
80104638:	85 c0                	test   %eax,%eax
8010463a:	74 54                	je     80104690 <sys_link+0xec>
  ilock(dp);
8010463c:	83 ec 0c             	sub    $0xc,%esp
8010463f:	50                   	push   %eax
80104640:	e8 17 cf ff ff       	call   8010155c <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104645:	83 c4 10             	add    $0x10,%esp
80104648:	8b 03                	mov    (%ebx),%eax
8010464a:	39 06                	cmp    %eax,(%esi)
8010464c:	75 36                	jne    80104684 <sys_link+0xe0>
8010464e:	50                   	push   %eax
8010464f:	ff 73 04             	pushl  0x4(%ebx)
80104652:	57                   	push   %edi
80104653:	56                   	push   %esi
80104654:	e8 07 d6 ff ff       	call   80101c60 <dirlink>
80104659:	83 c4 10             	add    $0x10,%esp
8010465c:	85 c0                	test   %eax,%eax
8010465e:	78 24                	js     80104684 <sys_link+0xe0>
  iunlockput(dp);
80104660:	83 ec 0c             	sub    $0xc,%esp
80104663:	56                   	push   %esi
80104664:	e8 4b d1 ff ff       	call   801017b4 <iunlockput>
  iput(ip);
80104669:	89 1c 24             	mov    %ebx,(%esp)
8010466c:	e8 f7 cf ff ff       	call   80101668 <iput>
  end_op();
80104671:	e8 2e e2 ff ff       	call   801028a4 <end_op>
  return 0;
80104676:	83 c4 10             	add    $0x10,%esp
80104679:	31 c0                	xor    %eax,%eax
}
8010467b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010467e:	5b                   	pop    %ebx
8010467f:	5e                   	pop    %esi
80104680:	5f                   	pop    %edi
80104681:	5d                   	pop    %ebp
80104682:	c3                   	ret    
80104683:	90                   	nop
    iunlockput(dp);
80104684:	83 ec 0c             	sub    $0xc,%esp
80104687:	56                   	push   %esi
80104688:	e8 27 d1 ff ff       	call   801017b4 <iunlockput>
    goto bad;
8010468d:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104690:	83 ec 0c             	sub    $0xc,%esp
80104693:	53                   	push   %ebx
80104694:	e8 c3 ce ff ff       	call   8010155c <ilock>
  ip->nlink--;
80104699:	66 ff 4b 56          	decw   0x56(%ebx)
  iupdate(ip);
8010469d:	89 1c 24             	mov    %ebx,(%esp)
801046a0:	e8 0f ce ff ff       	call   801014b4 <iupdate>
  iunlockput(ip);
801046a5:	89 1c 24             	mov    %ebx,(%esp)
801046a8:	e8 07 d1 ff ff       	call   801017b4 <iunlockput>
  end_op();
801046ad:	e8 f2 e1 ff ff       	call   801028a4 <end_op>
  return -1;
801046b2:	83 c4 10             	add    $0x10,%esp
801046b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046ba:	eb bf                	jmp    8010467b <sys_link+0xd7>
    iunlockput(ip);
801046bc:	83 ec 0c             	sub    $0xc,%esp
801046bf:	53                   	push   %ebx
801046c0:	e8 ef d0 ff ff       	call   801017b4 <iunlockput>
    end_op();
801046c5:	e8 da e1 ff ff       	call   801028a4 <end_op>
    return -1;
801046ca:	83 c4 10             	add    $0x10,%esp
801046cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046d2:	eb a7                	jmp    8010467b <sys_link+0xd7>
    end_op();
801046d4:	e8 cb e1 ff ff       	call   801028a4 <end_op>
    return -1;
801046d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046de:	eb 9b                	jmp    8010467b <sys_link+0xd7>

801046e0 <sys_unlink>:
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	57                   	push   %edi
801046e4:	56                   	push   %esi
801046e5:	53                   	push   %ebx
801046e6:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
801046e9:	8d 45 c0             	lea    -0x40(%ebp),%eax
801046ec:	50                   	push   %eax
801046ed:	6a 00                	push   $0x0
801046ef:	e8 b4 fa ff ff       	call   801041a8 <argstr>
801046f4:	83 c4 10             	add    $0x10,%esp
801046f7:	85 c0                	test   %eax,%eax
801046f9:	0f 88 69 01 00 00    	js     80104868 <sys_unlink+0x188>
  begin_op();
801046ff:	e8 38 e1 ff ff       	call   8010283c <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104704:	83 ec 08             	sub    $0x8,%esp
80104707:	8d 5d ca             	lea    -0x36(%ebp),%ebx
8010470a:	53                   	push   %ebx
8010470b:	ff 75 c0             	pushl  -0x40(%ebp)
8010470e:	e8 15 d6 ff ff       	call   80101d28 <nameiparent>
80104713:	89 c6                	mov    %eax,%esi
80104715:	83 c4 10             	add    $0x10,%esp
80104718:	85 c0                	test   %eax,%eax
8010471a:	0f 84 52 01 00 00    	je     80104872 <sys_unlink+0x192>
  ilock(dp);
80104720:	83 ec 0c             	sub    $0xc,%esp
80104723:	50                   	push   %eax
80104724:	e8 33 ce ff ff       	call   8010155c <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104729:	59                   	pop    %ecx
8010472a:	5f                   	pop    %edi
8010472b:	68 b8 6c 10 80       	push   $0x80106cb8
80104730:	53                   	push   %ebx
80104731:	e8 e2 d2 ff ff       	call   80101a18 <namecmp>
80104736:	83 c4 10             	add    $0x10,%esp
80104739:	85 c0                	test   %eax,%eax
8010473b:	0f 84 f7 00 00 00    	je     80104838 <sys_unlink+0x158>
80104741:	83 ec 08             	sub    $0x8,%esp
80104744:	68 b7 6c 10 80       	push   $0x80106cb7
80104749:	53                   	push   %ebx
8010474a:	e8 c9 d2 ff ff       	call   80101a18 <namecmp>
8010474f:	83 c4 10             	add    $0x10,%esp
80104752:	85 c0                	test   %eax,%eax
80104754:	0f 84 de 00 00 00    	je     80104838 <sys_unlink+0x158>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010475a:	52                   	push   %edx
8010475b:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010475e:	50                   	push   %eax
8010475f:	53                   	push   %ebx
80104760:	56                   	push   %esi
80104761:	e8 ca d2 ff ff       	call   80101a30 <dirlookup>
80104766:	89 c3                	mov    %eax,%ebx
80104768:	83 c4 10             	add    $0x10,%esp
8010476b:	85 c0                	test   %eax,%eax
8010476d:	0f 84 c5 00 00 00    	je     80104838 <sys_unlink+0x158>
  ilock(ip);
80104773:	83 ec 0c             	sub    $0xc,%esp
80104776:	50                   	push   %eax
80104777:	e8 e0 cd ff ff       	call   8010155c <ilock>
  if(ip->nlink < 1)
8010477c:	83 c4 10             	add    $0x10,%esp
8010477f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104784:	0f 8e 11 01 00 00    	jle    8010489b <sys_unlink+0x1bb>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010478a:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010478f:	74 63                	je     801047f4 <sys_unlink+0x114>
80104791:	8d 7d d8             	lea    -0x28(%ebp),%edi
  memset(&de, 0, sizeof(de));
80104794:	50                   	push   %eax
80104795:	6a 10                	push   $0x10
80104797:	6a 00                	push   $0x0
80104799:	57                   	push   %edi
8010479a:	e8 4d f7 ff ff       	call   80103eec <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010479f:	6a 10                	push   $0x10
801047a1:	ff 75 c4             	pushl  -0x3c(%ebp)
801047a4:	57                   	push   %edi
801047a5:	56                   	push   %esi
801047a6:	e8 4d d1 ff ff       	call   801018f8 <writei>
801047ab:	83 c4 20             	add    $0x20,%esp
801047ae:	83 f8 10             	cmp    $0x10,%eax
801047b1:	0f 85 d7 00 00 00    	jne    8010488e <sys_unlink+0x1ae>
  if(ip->type == T_DIR){
801047b7:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801047bc:	0f 84 8e 00 00 00    	je     80104850 <sys_unlink+0x170>
  iunlockput(dp);
801047c2:	83 ec 0c             	sub    $0xc,%esp
801047c5:	56                   	push   %esi
801047c6:	e8 e9 cf ff ff       	call   801017b4 <iunlockput>
  ip->nlink--;
801047cb:	66 ff 4b 56          	decw   0x56(%ebx)
  iupdate(ip);
801047cf:	89 1c 24             	mov    %ebx,(%esp)
801047d2:	e8 dd cc ff ff       	call   801014b4 <iupdate>
  iunlockput(ip);
801047d7:	89 1c 24             	mov    %ebx,(%esp)
801047da:	e8 d5 cf ff ff       	call   801017b4 <iunlockput>
  end_op();
801047df:	e8 c0 e0 ff ff       	call   801028a4 <end_op>
  return 0;
801047e4:	83 c4 10             	add    $0x10,%esp
801047e7:	31 c0                	xor    %eax,%eax
}
801047e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801047ec:	5b                   	pop    %ebx
801047ed:	5e                   	pop    %esi
801047ee:	5f                   	pop    %edi
801047ef:	5d                   	pop    %ebp
801047f0:	c3                   	ret    
801047f1:	8d 76 00             	lea    0x0(%esi),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801047f4:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801047f8:	76 97                	jbe    80104791 <sys_unlink+0xb1>
801047fa:	ba 20 00 00 00       	mov    $0x20,%edx
801047ff:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104802:	eb 08                	jmp    8010480c <sys_unlink+0x12c>
80104804:	83 c2 10             	add    $0x10,%edx
80104807:	39 53 58             	cmp    %edx,0x58(%ebx)
8010480a:	76 88                	jbe    80104794 <sys_unlink+0xb4>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010480c:	6a 10                	push   $0x10
8010480e:	52                   	push   %edx
8010480f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
80104812:	57                   	push   %edi
80104813:	53                   	push   %ebx
80104814:	e8 e7 cf ff ff       	call   80101800 <readi>
80104819:	83 c4 10             	add    $0x10,%esp
8010481c:	83 f8 10             	cmp    $0x10,%eax
8010481f:	8b 55 b4             	mov    -0x4c(%ebp),%edx
80104822:	75 5d                	jne    80104881 <sys_unlink+0x1a1>
    if(de.inum != 0)
80104824:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104829:	74 d9                	je     80104804 <sys_unlink+0x124>
    iunlockput(ip);
8010482b:	83 ec 0c             	sub    $0xc,%esp
8010482e:	53                   	push   %ebx
8010482f:	e8 80 cf ff ff       	call   801017b4 <iunlockput>
    goto bad;
80104834:	83 c4 10             	add    $0x10,%esp
80104837:	90                   	nop
  iunlockput(dp);
80104838:	83 ec 0c             	sub    $0xc,%esp
8010483b:	56                   	push   %esi
8010483c:	e8 73 cf ff ff       	call   801017b4 <iunlockput>
  end_op();
80104841:	e8 5e e0 ff ff       	call   801028a4 <end_op>
  return -1;
80104846:	83 c4 10             	add    $0x10,%esp
80104849:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010484e:	eb 99                	jmp    801047e9 <sys_unlink+0x109>
    dp->nlink--;
80104850:	66 ff 4e 56          	decw   0x56(%esi)
    iupdate(dp);
80104854:	83 ec 0c             	sub    $0xc,%esp
80104857:	56                   	push   %esi
80104858:	e8 57 cc ff ff       	call   801014b4 <iupdate>
8010485d:	83 c4 10             	add    $0x10,%esp
80104860:	e9 5d ff ff ff       	jmp    801047c2 <sys_unlink+0xe2>
80104865:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104868:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010486d:	e9 77 ff ff ff       	jmp    801047e9 <sys_unlink+0x109>
    end_op();
80104872:	e8 2d e0 ff ff       	call   801028a4 <end_op>
    return -1;
80104877:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010487c:	e9 68 ff ff ff       	jmp    801047e9 <sys_unlink+0x109>
      panic("isdirempty: readi");
80104881:	83 ec 0c             	sub    $0xc,%esp
80104884:	68 dc 6c 10 80       	push   $0x80106cdc
80104889:	e8 b2 ba ff ff       	call   80100340 <panic>
    panic("unlink: writei");
8010488e:	83 ec 0c             	sub    $0xc,%esp
80104891:	68 ee 6c 10 80       	push   $0x80106cee
80104896:	e8 a5 ba ff ff       	call   80100340 <panic>
    panic("unlink: nlink < 1");
8010489b:	83 ec 0c             	sub    $0xc,%esp
8010489e:	68 ca 6c 10 80       	push   $0x80106cca
801048a3:	e8 98 ba ff ff       	call   80100340 <panic>

801048a8 <sys_open>:

int
sys_open(void)
{
801048a8:	55                   	push   %ebp
801048a9:	89 e5                	mov    %esp,%ebp
801048ab:	56                   	push   %esi
801048ac:	53                   	push   %ebx
801048ad:	83 ec 28             	sub    $0x28,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801048b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801048b3:	50                   	push   %eax
801048b4:	6a 00                	push   $0x0
801048b6:	e8 ed f8 ff ff       	call   801041a8 <argstr>
801048bb:	83 c4 10             	add    $0x10,%esp
801048be:	85 c0                	test   %eax,%eax
801048c0:	0f 88 8d 00 00 00    	js     80104953 <sys_open+0xab>
801048c6:	83 ec 08             	sub    $0x8,%esp
801048c9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048cc:	50                   	push   %eax
801048cd:	6a 01                	push   $0x1
801048cf:	e8 3c f8 ff ff       	call   80104110 <argint>
801048d4:	83 c4 10             	add    $0x10,%esp
801048d7:	85 c0                	test   %eax,%eax
801048d9:	78 78                	js     80104953 <sys_open+0xab>
    return -1;

  begin_op();
801048db:	e8 5c df ff ff       	call   8010283c <begin_op>

  if(omode & O_CREATE){
801048e0:	f6 45 f5 02          	testb  $0x2,-0xb(%ebp)
801048e4:	75 76                	jne    8010495c <sys_open+0xb4>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801048e6:	83 ec 0c             	sub    $0xc,%esp
801048e9:	ff 75 f0             	pushl  -0x10(%ebp)
801048ec:	e8 1f d4 ff ff       	call   80101d10 <namei>
801048f1:	89 c3                	mov    %eax,%ebx
801048f3:	83 c4 10             	add    $0x10,%esp
801048f6:	85 c0                	test   %eax,%eax
801048f8:	74 7f                	je     80104979 <sys_open+0xd1>
      end_op();
      return -1;
    }
    ilock(ip);
801048fa:	83 ec 0c             	sub    $0xc,%esp
801048fd:	50                   	push   %eax
801048fe:	e8 59 cc ff ff       	call   8010155c <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104903:	83 c4 10             	add    $0x10,%esp
80104906:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010490b:	0f 84 bf 00 00 00    	je     801049d0 <sys_open+0x128>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104911:	e8 e2 c3 ff ff       	call   80100cf8 <filealloc>
80104916:	89 c6                	mov    %eax,%esi
80104918:	85 c0                	test   %eax,%eax
8010491a:	74 26                	je     80104942 <sys_open+0x9a>
  struct proc *curproc = myproc();
8010491c:	e8 3f ea ff ff       	call   80103360 <myproc>
80104921:	89 c2                	mov    %eax,%edx
  for(fd = 0; fd < NOFILE; fd++){
80104923:	31 c0                	xor    %eax,%eax
80104925:	8d 76 00             	lea    0x0(%esi),%esi
    if(curproc->ofile[fd] == 0){
80104928:	8b 4c 82 2c          	mov    0x2c(%edx,%eax,4),%ecx
8010492c:	85 c9                	test   %ecx,%ecx
8010492e:	74 58                	je     80104988 <sys_open+0xe0>
  for(fd = 0; fd < NOFILE; fd++){
80104930:	40                   	inc    %eax
80104931:	83 f8 10             	cmp    $0x10,%eax
80104934:	75 f2                	jne    80104928 <sys_open+0x80>
    if(f)
      fileclose(f);
80104936:	83 ec 0c             	sub    $0xc,%esp
80104939:	56                   	push   %esi
8010493a:	e8 5d c4 ff ff       	call   80100d9c <fileclose>
8010493f:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80104942:	83 ec 0c             	sub    $0xc,%esp
80104945:	53                   	push   %ebx
80104946:	e8 69 ce ff ff       	call   801017b4 <iunlockput>
    end_op();
8010494b:	e8 54 df ff ff       	call   801028a4 <end_op>
    return -1;
80104950:	83 c4 10             	add    $0x10,%esp
80104953:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104958:	eb 6d                	jmp    801049c7 <sys_open+0x11f>
8010495a:	66 90                	xchg   %ax,%ax
    ip = create(path, T_FILE, 0, 0);
8010495c:	83 ec 0c             	sub    $0xc,%esp
8010495f:	6a 00                	push   $0x0
80104961:	31 c9                	xor    %ecx,%ecx
80104963:	ba 02 00 00 00       	mov    $0x2,%edx
80104968:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010496b:	e8 dc f8 ff ff       	call   8010424c <create>
80104970:	89 c3                	mov    %eax,%ebx
    if(ip == 0){
80104972:	83 c4 10             	add    $0x10,%esp
80104975:	85 c0                	test   %eax,%eax
80104977:	75 98                	jne    80104911 <sys_open+0x69>
      end_op();
80104979:	e8 26 df ff ff       	call   801028a4 <end_op>
      return -1;
8010497e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104983:	eb 42                	jmp    801049c7 <sys_open+0x11f>
80104985:	8d 76 00             	lea    0x0(%esi),%esi
      curproc->ofile[fd] = f;
80104988:	89 74 82 2c          	mov    %esi,0x2c(%edx,%eax,4)
8010498c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  }
  iunlock(ip);
8010498f:	83 ec 0c             	sub    $0xc,%esp
80104992:	53                   	push   %ebx
80104993:	e8 8c cc ff ff       	call   80101624 <iunlock>
  end_op();
80104998:	e8 07 df ff ff       	call   801028a4 <end_op>

  f->type = FD_INODE;
8010499d:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
801049a3:	89 5e 10             	mov    %ebx,0x10(%esi)
  f->off = 0;
801049a6:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
801049ad:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801049b0:	89 ca                	mov    %ecx,%edx
801049b2:	f7 d2                	not    %edx
801049b4:	83 e2 01             	and    $0x1,%edx
801049b7:	88 56 08             	mov    %dl,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801049ba:	83 c4 10             	add    $0x10,%esp
801049bd:	83 e1 03             	and    $0x3,%ecx
801049c0:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
801049c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801049c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801049ca:	5b                   	pop    %ebx
801049cb:	5e                   	pop    %esi
801049cc:	5d                   	pop    %ebp
801049cd:	c3                   	ret    
801049ce:	66 90                	xchg   %ax,%ax
    if(ip->type == T_DIR && omode != O_RDONLY){
801049d0:	8b 75 f4             	mov    -0xc(%ebp),%esi
801049d3:	85 f6                	test   %esi,%esi
801049d5:	0f 84 36 ff ff ff    	je     80104911 <sys_open+0x69>
801049db:	e9 62 ff ff ff       	jmp    80104942 <sys_open+0x9a>

801049e0 <sys_mkdir>:

int
sys_mkdir(void)
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801049e6:	e8 51 de ff ff       	call   8010283c <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801049eb:	83 ec 08             	sub    $0x8,%esp
801049ee:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049f1:	50                   	push   %eax
801049f2:	6a 00                	push   $0x0
801049f4:	e8 af f7 ff ff       	call   801041a8 <argstr>
801049f9:	83 c4 10             	add    $0x10,%esp
801049fc:	85 c0                	test   %eax,%eax
801049fe:	78 30                	js     80104a30 <sys_mkdir+0x50>
80104a00:	83 ec 0c             	sub    $0xc,%esp
80104a03:	6a 00                	push   $0x0
80104a05:	31 c9                	xor    %ecx,%ecx
80104a07:	ba 01 00 00 00       	mov    $0x1,%edx
80104a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a0f:	e8 38 f8 ff ff       	call   8010424c <create>
80104a14:	83 c4 10             	add    $0x10,%esp
80104a17:	85 c0                	test   %eax,%eax
80104a19:	74 15                	je     80104a30 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104a1b:	83 ec 0c             	sub    $0xc,%esp
80104a1e:	50                   	push   %eax
80104a1f:	e8 90 cd ff ff       	call   801017b4 <iunlockput>
  end_op();
80104a24:	e8 7b de ff ff       	call   801028a4 <end_op>
  return 0;
80104a29:	83 c4 10             	add    $0x10,%esp
80104a2c:	31 c0                	xor    %eax,%eax
}
80104a2e:	c9                   	leave  
80104a2f:	c3                   	ret    
    end_op();
80104a30:	e8 6f de ff ff       	call   801028a4 <end_op>
    return -1;
80104a35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a3a:	c9                   	leave  
80104a3b:	c3                   	ret    

80104a3c <sys_mknod>:

int
sys_mknod(void)
{
80104a3c:	55                   	push   %ebp
80104a3d:	89 e5                	mov    %esp,%ebp
80104a3f:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80104a42:	e8 f5 dd ff ff       	call   8010283c <begin_op>
  if((argstr(0, &path)) < 0 ||
80104a47:	83 ec 08             	sub    $0x8,%esp
80104a4a:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104a4d:	50                   	push   %eax
80104a4e:	6a 00                	push   $0x0
80104a50:	e8 53 f7 ff ff       	call   801041a8 <argstr>
80104a55:	83 c4 10             	add    $0x10,%esp
80104a58:	85 c0                	test   %eax,%eax
80104a5a:	78 60                	js     80104abc <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80104a5c:	83 ec 08             	sub    $0x8,%esp
80104a5f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a62:	50                   	push   %eax
80104a63:	6a 01                	push   $0x1
80104a65:	e8 a6 f6 ff ff       	call   80104110 <argint>
  if((argstr(0, &path)) < 0 ||
80104a6a:	83 c4 10             	add    $0x10,%esp
80104a6d:	85 c0                	test   %eax,%eax
80104a6f:	78 4b                	js     80104abc <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80104a71:	83 ec 08             	sub    $0x8,%esp
80104a74:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a77:	50                   	push   %eax
80104a78:	6a 02                	push   $0x2
80104a7a:	e8 91 f6 ff ff       	call   80104110 <argint>
     argint(1, &major) < 0 ||
80104a7f:	83 c4 10             	add    $0x10,%esp
80104a82:	85 c0                	test   %eax,%eax
80104a84:	78 36                	js     80104abc <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104a86:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104a8a:	83 ec 0c             	sub    $0xc,%esp
80104a8d:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
80104a91:	50                   	push   %eax
80104a92:	ba 03 00 00 00       	mov    $0x3,%edx
80104a97:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104a9a:	e8 ad f7 ff ff       	call   8010424c <create>
     argint(2, &minor) < 0 ||
80104a9f:	83 c4 10             	add    $0x10,%esp
80104aa2:	85 c0                	test   %eax,%eax
80104aa4:	74 16                	je     80104abc <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104aa6:	83 ec 0c             	sub    $0xc,%esp
80104aa9:	50                   	push   %eax
80104aaa:	e8 05 cd ff ff       	call   801017b4 <iunlockput>
  end_op();
80104aaf:	e8 f0 dd ff ff       	call   801028a4 <end_op>
  return 0;
80104ab4:	83 c4 10             	add    $0x10,%esp
80104ab7:	31 c0                	xor    %eax,%eax
}
80104ab9:	c9                   	leave  
80104aba:	c3                   	ret    
80104abb:	90                   	nop
    end_op();
80104abc:	e8 e3 dd ff ff       	call   801028a4 <end_op>
    return -1;
80104ac1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ac6:	c9                   	leave  
80104ac7:	c3                   	ret    

80104ac8 <sys_chdir>:

int
sys_chdir(void)
{
80104ac8:	55                   	push   %ebp
80104ac9:	89 e5                	mov    %esp,%ebp
80104acb:	56                   	push   %esi
80104acc:	53                   	push   %ebx
80104acd:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80104ad0:	e8 8b e8 ff ff       	call   80103360 <myproc>
80104ad5:	89 c6                	mov    %eax,%esi
  
  begin_op();
80104ad7:	e8 60 dd ff ff       	call   8010283c <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80104adc:	83 ec 08             	sub    $0x8,%esp
80104adf:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ae2:	50                   	push   %eax
80104ae3:	6a 00                	push   $0x0
80104ae5:	e8 be f6 ff ff       	call   801041a8 <argstr>
80104aea:	83 c4 10             	add    $0x10,%esp
80104aed:	85 c0                	test   %eax,%eax
80104aef:	78 67                	js     80104b58 <sys_chdir+0x90>
80104af1:	83 ec 0c             	sub    $0xc,%esp
80104af4:	ff 75 f4             	pushl  -0xc(%ebp)
80104af7:	e8 14 d2 ff ff       	call   80101d10 <namei>
80104afc:	89 c3                	mov    %eax,%ebx
80104afe:	83 c4 10             	add    $0x10,%esp
80104b01:	85 c0                	test   %eax,%eax
80104b03:	74 53                	je     80104b58 <sys_chdir+0x90>
    end_op();
    return -1;
  }
  ilock(ip);
80104b05:	83 ec 0c             	sub    $0xc,%esp
80104b08:	50                   	push   %eax
80104b09:	e8 4e ca ff ff       	call   8010155c <ilock>
  if(ip->type != T_DIR){
80104b0e:	83 c4 10             	add    $0x10,%esp
80104b11:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104b16:	75 28                	jne    80104b40 <sys_chdir+0x78>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104b18:	83 ec 0c             	sub    $0xc,%esp
80104b1b:	53                   	push   %ebx
80104b1c:	e8 03 cb ff ff       	call   80101624 <iunlock>
  iput(curproc->cwd);
80104b21:	58                   	pop    %eax
80104b22:	ff 76 6c             	pushl  0x6c(%esi)
80104b25:	e8 3e cb ff ff       	call   80101668 <iput>
  end_op();
80104b2a:	e8 75 dd ff ff       	call   801028a4 <end_op>
  curproc->cwd = ip;
80104b2f:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  return 0;
80104b32:	83 c4 10             	add    $0x10,%esp
80104b35:	31 c0                	xor    %eax,%eax
}
80104b37:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b3a:	5b                   	pop    %ebx
80104b3b:	5e                   	pop    %esi
80104b3c:	5d                   	pop    %ebp
80104b3d:	c3                   	ret    
80104b3e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104b40:	83 ec 0c             	sub    $0xc,%esp
80104b43:	53                   	push   %ebx
80104b44:	e8 6b cc ff ff       	call   801017b4 <iunlockput>
    end_op();
80104b49:	e8 56 dd ff ff       	call   801028a4 <end_op>
    return -1;
80104b4e:	83 c4 10             	add    $0x10,%esp
80104b51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b56:	eb df                	jmp    80104b37 <sys_chdir+0x6f>
    end_op();
80104b58:	e8 47 dd ff ff       	call   801028a4 <end_op>
    return -1;
80104b5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b62:	eb d3                	jmp    80104b37 <sys_chdir+0x6f>

80104b64 <sys_exec>:

int
sys_exec(void)
{
80104b64:	55                   	push   %ebp
80104b65:	89 e5                	mov    %esp,%ebp
80104b67:	57                   	push   %edi
80104b68:	56                   	push   %esi
80104b69:	53                   	push   %ebx
80104b6a:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80104b70:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80104b76:	50                   	push   %eax
80104b77:	6a 00                	push   $0x0
80104b79:	e8 2a f6 ff ff       	call   801041a8 <argstr>
80104b7e:	83 c4 10             	add    $0x10,%esp
80104b81:	85 c0                	test   %eax,%eax
80104b83:	78 79                	js     80104bfe <sys_exec+0x9a>
80104b85:	83 ec 08             	sub    $0x8,%esp
80104b88:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80104b8e:	50                   	push   %eax
80104b8f:	6a 01                	push   $0x1
80104b91:	e8 7a f5 ff ff       	call   80104110 <argint>
80104b96:	83 c4 10             	add    $0x10,%esp
80104b99:	85 c0                	test   %eax,%eax
80104b9b:	78 61                	js     80104bfe <sys_exec+0x9a>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80104b9d:	50                   	push   %eax
80104b9e:	68 80 00 00 00       	push   $0x80
80104ba3:	6a 00                	push   $0x0
80104ba5:	8d bd 68 ff ff ff    	lea    -0x98(%ebp),%edi
80104bab:	57                   	push   %edi
80104bac:	e8 3b f3 ff ff       	call   80103eec <memset>
80104bb1:	83 c4 10             	add    $0x10,%esp
80104bb4:	31 db                	xor    %ebx,%ebx
  for(i=0;; i++){
80104bb6:	31 f6                	xor    %esi,%esi
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80104bb8:	83 ec 08             	sub    $0x8,%esp
80104bbb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104bc1:	50                   	push   %eax
80104bc2:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80104bc8:	01 d8                	add    %ebx,%eax
80104bca:	50                   	push   %eax
80104bcb:	e8 d4 f4 ff ff       	call   801040a4 <fetchint>
80104bd0:	83 c4 10             	add    $0x10,%esp
80104bd3:	85 c0                	test   %eax,%eax
80104bd5:	78 27                	js     80104bfe <sys_exec+0x9a>
      return -1;
    if(uarg == 0){
80104bd7:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80104bdd:	85 c0                	test   %eax,%eax
80104bdf:	74 2b                	je     80104c0c <sys_exec+0xa8>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80104be1:	83 ec 08             	sub    $0x8,%esp
80104be4:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
80104be7:	52                   	push   %edx
80104be8:	50                   	push   %eax
80104be9:	e8 e6 f4 ff ff       	call   801040d4 <fetchstr>
80104bee:	83 c4 10             	add    $0x10,%esp
80104bf1:	85 c0                	test   %eax,%eax
80104bf3:	78 09                	js     80104bfe <sys_exec+0x9a>
  for(i=0;; i++){
80104bf5:	46                   	inc    %esi
    if(i >= NELEM(argv))
80104bf6:	83 c3 04             	add    $0x4,%ebx
80104bf9:	83 fe 20             	cmp    $0x20,%esi
80104bfc:	75 ba                	jne    80104bb8 <sys_exec+0x54>
    return -1;
80104bfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  return exec(path, argv);
}
80104c03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c06:	5b                   	pop    %ebx
80104c07:	5e                   	pop    %esi
80104c08:	5f                   	pop    %edi
80104c09:	5d                   	pop    %ebp
80104c0a:	c3                   	ret    
80104c0b:	90                   	nop
      argv[i] = 0;
80104c0c:	c7 84 b5 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%esi,4)
80104c13:	00 00 00 00 
  return exec(path, argv);
80104c17:	83 ec 08             	sub    $0x8,%esp
80104c1a:	57                   	push   %edi
80104c1b:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
80104c21:	e8 7e bd ff ff       	call   801009a4 <exec>
80104c26:	83 c4 10             	add    $0x10,%esp
}
80104c29:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c2c:	5b                   	pop    %ebx
80104c2d:	5e                   	pop    %esi
80104c2e:	5f                   	pop    %edi
80104c2f:	5d                   	pop    %ebp
80104c30:	c3                   	ret    
80104c31:	8d 76 00             	lea    0x0(%esi),%esi

80104c34 <sys_pipe>:

int
sys_pipe(void)
{
80104c34:	55                   	push   %ebp
80104c35:	89 e5                	mov    %esp,%ebp
80104c37:	57                   	push   %edi
80104c38:	56                   	push   %esi
80104c39:	53                   	push   %ebx
80104c3a:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80104c3d:	6a 08                	push   $0x8
80104c3f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104c42:	50                   	push   %eax
80104c43:	6a 00                	push   $0x0
80104c45:	e8 0a f5 ff ff       	call   80104154 <argptr>
80104c4a:	83 c4 10             	add    $0x10,%esp
80104c4d:	85 c0                	test   %eax,%eax
80104c4f:	78 48                	js     80104c99 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80104c51:	83 ec 08             	sub    $0x8,%esp
80104c54:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104c57:	50                   	push   %eax
80104c58:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104c5b:	50                   	push   %eax
80104c5c:	e8 d3 e1 ff ff       	call   80102e34 <pipealloc>
80104c61:	83 c4 10             	add    $0x10,%esp
80104c64:	85 c0                	test   %eax,%eax
80104c66:	78 31                	js     80104c99 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80104c68:	8b 7d e0             	mov    -0x20(%ebp),%edi
  struct proc *curproc = myproc();
80104c6b:	e8 f0 e6 ff ff       	call   80103360 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80104c70:	31 db                	xor    %ebx,%ebx
80104c72:	66 90                	xchg   %ax,%ax
    if(curproc->ofile[fd] == 0){
80104c74:	8b 74 98 2c          	mov    0x2c(%eax,%ebx,4),%esi
80104c78:	85 f6                	test   %esi,%esi
80104c7a:	74 24                	je     80104ca0 <sys_pipe+0x6c>
  for(fd = 0; fd < NOFILE; fd++){
80104c7c:	43                   	inc    %ebx
80104c7d:	83 fb 10             	cmp    $0x10,%ebx
80104c80:	75 f2                	jne    80104c74 <sys_pipe+0x40>
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80104c82:	83 ec 0c             	sub    $0xc,%esp
80104c85:	ff 75 e0             	pushl  -0x20(%ebp)
80104c88:	e8 0f c1 ff ff       	call   80100d9c <fileclose>
    fileclose(wf);
80104c8d:	58                   	pop    %eax
80104c8e:	ff 75 e4             	pushl  -0x1c(%ebp)
80104c91:	e8 06 c1 ff ff       	call   80100d9c <fileclose>
    return -1;
80104c96:	83 c4 10             	add    $0x10,%esp
80104c99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c9e:	eb 45                	jmp    80104ce5 <sys_pipe+0xb1>
      curproc->ofile[fd] = f;
80104ca0:	8d 73 08             	lea    0x8(%ebx),%esi
80104ca3:	89 7c b0 0c          	mov    %edi,0xc(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80104ca7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
80104caa:	e8 b1 e6 ff ff       	call   80103360 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80104caf:	31 d2                	xor    %edx,%edx
80104cb1:	8d 76 00             	lea    0x0(%esi),%esi
    if(curproc->ofile[fd] == 0){
80104cb4:	8b 4c 90 2c          	mov    0x2c(%eax,%edx,4),%ecx
80104cb8:	85 c9                	test   %ecx,%ecx
80104cba:	74 18                	je     80104cd4 <sys_pipe+0xa0>
  for(fd = 0; fd < NOFILE; fd++){
80104cbc:	42                   	inc    %edx
80104cbd:	83 fa 10             	cmp    $0x10,%edx
80104cc0:	75 f2                	jne    80104cb4 <sys_pipe+0x80>
      myproc()->ofile[fd0] = 0;
80104cc2:	e8 99 e6 ff ff       	call   80103360 <myproc>
80104cc7:	c7 44 b0 0c 00 00 00 	movl   $0x0,0xc(%eax,%esi,4)
80104cce:	00 
80104ccf:	eb b1                	jmp    80104c82 <sys_pipe+0x4e>
80104cd1:	8d 76 00             	lea    0x0(%esi),%esi
      curproc->ofile[fd] = f;
80104cd4:	89 7c 90 2c          	mov    %edi,0x2c(%eax,%edx,4)
  }
  fd[0] = fd0;
80104cd8:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104cdb:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80104cdd:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104ce0:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
80104ce3:	31 c0                	xor    %eax,%eax
}
80104ce5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ce8:	5b                   	pop    %ebx
80104ce9:	5e                   	pop    %esi
80104cea:	5f                   	pop    %edi
80104ceb:	5d                   	pop    %ebp
80104cec:	c3                   	ret    
80104ced:	66 90                	xchg   %ax,%ax
80104cef:	90                   	nop

80104cf0 <sys_fork>:
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80104cf0:	e9 e3 e7 ff ff       	jmp    801034d8 <fork>
80104cf5:	8d 76 00             	lea    0x0(%esi),%esi

80104cf8 <sys_exit>:
}

int
sys_exit(void)
{
80104cf8:	55                   	push   %ebp
80104cf9:	89 e5                	mov    %esp,%ebp
80104cfb:	83 ec 08             	sub    $0x8,%esp
  exit();
80104cfe:	e8 2d ea ff ff       	call   80103730 <exit>
  return 0;  // not reached
}
80104d03:	31 c0                	xor    %eax,%eax
80104d05:	c9                   	leave  
80104d06:	c3                   	ret    
80104d07:	90                   	nop

80104d08 <sys_wait>:

int
sys_wait(void)
{
  return wait();
80104d08:	e9 43 ec ff ff       	jmp    80103950 <wait>
80104d0d:	8d 76 00             	lea    0x0(%esi),%esi

80104d10 <sys_kill>:
}

int
sys_kill(void)
{
80104d10:	55                   	push   %ebp
80104d11:	89 e5                	mov    %esp,%ebp
80104d13:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80104d16:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d19:	50                   	push   %eax
80104d1a:	6a 00                	push   $0x0
80104d1c:	e8 ef f3 ff ff       	call   80104110 <argint>
80104d21:	83 c4 10             	add    $0x10,%esp
80104d24:	85 c0                	test   %eax,%eax
80104d26:	78 10                	js     80104d38 <sys_kill+0x28>
    return -1;
  return kill(pid);
80104d28:	83 ec 0c             	sub    $0xc,%esp
80104d2b:	ff 75 f4             	pushl  -0xc(%ebp)
80104d2e:	e8 65 ed ff ff       	call   80103a98 <kill>
80104d33:	83 c4 10             	add    $0x10,%esp
}
80104d36:	c9                   	leave  
80104d37:	c3                   	ret    
    return -1;
80104d38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d3d:	c9                   	leave  
80104d3e:	c3                   	ret    
80104d3f:	90                   	nop

80104d40 <sys_getreadcount>:

int
sys_getreadcount(void)
{
80104d40:	55                   	push   %ebp
80104d41:	89 e5                	mov    %esp,%ebp
80104d43:	83 ec 08             	sub    $0x8,%esp
    return myproc()->readcount;
80104d46:	e8 15 e6 ff ff       	call   80103360 <myproc>
80104d4b:	8b 40 24             	mov    0x24(%eax),%eax
}
80104d4e:	c9                   	leave  
80104d4f:	c3                   	ret    

80104d50 <sys_getpid>:

int
sys_getpid(void)
{
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80104d56:	e8 05 e6 ff ff       	call   80103360 <myproc>
80104d5b:	8b 40 10             	mov    0x10(%eax),%eax
}
80104d5e:	c9                   	leave  
80104d5f:	c3                   	ret    

80104d60 <sys_sbrk>:

int
sys_sbrk(void)
{
80104d60:	55                   	push   %ebp
80104d61:	89 e5                	mov    %esp,%ebp
80104d63:	53                   	push   %ebx
80104d64:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80104d67:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d6a:	50                   	push   %eax
80104d6b:	6a 00                	push   $0x0
80104d6d:	e8 9e f3 ff ff       	call   80104110 <argint>
80104d72:	83 c4 10             	add    $0x10,%esp
80104d75:	85 c0                	test   %eax,%eax
80104d77:	78 23                	js     80104d9c <sys_sbrk+0x3c>
    return -1;
  addr = myproc()->sz;
80104d79:	e8 e2 e5 ff ff       	call   80103360 <myproc>
80104d7e:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80104d80:	83 ec 0c             	sub    $0xc,%esp
80104d83:	ff 75 f4             	pushl  -0xc(%ebp)
80104d86:	e8 dd e6 ff ff       	call   80103468 <growproc>
80104d8b:	83 c4 10             	add    $0x10,%esp
80104d8e:	85 c0                	test   %eax,%eax
80104d90:	78 0a                	js     80104d9c <sys_sbrk+0x3c>
    return -1;
  return addr;
}
80104d92:	89 d8                	mov    %ebx,%eax
80104d94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d97:	c9                   	leave  
80104d98:	c3                   	ret    
80104d99:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104d9c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104da1:	eb ef                	jmp    80104d92 <sys_sbrk+0x32>
80104da3:	90                   	nop

80104da4 <sys_sleep>:

int
sys_sleep(void)
{
80104da4:	55                   	push   %ebp
80104da5:	89 e5                	mov    %esp,%ebp
80104da7:	53                   	push   %ebx
80104da8:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80104dab:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104dae:	50                   	push   %eax
80104daf:	6a 00                	push   $0x0
80104db1:	e8 5a f3 ff ff       	call   80104110 <argint>
80104db6:	83 c4 10             	add    $0x10,%esp
80104db9:	85 c0                	test   %eax,%eax
80104dbb:	78 7e                	js     80104e3b <sys_sleep+0x97>
    return -1;
  acquire(&tickslock);
80104dbd:	83 ec 0c             	sub    $0xc,%esp
80104dc0:	68 60 3d 11 80       	push   $0x80113d60
80104dc5:	e8 42 f0 ff ff       	call   80103e0c <acquire>
  ticks0 = ticks;
80104dca:	8b 1d a0 45 11 80    	mov    0x801145a0,%ebx
  while(ticks - ticks0 < n){
80104dd0:	83 c4 10             	add    $0x10,%esp
80104dd3:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104dd6:	85 d2                	test   %edx,%edx
80104dd8:	75 23                	jne    80104dfd <sys_sleep+0x59>
80104dda:	eb 48                	jmp    80104e24 <sys_sleep+0x80>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80104ddc:	83 ec 08             	sub    $0x8,%esp
80104ddf:	68 60 3d 11 80       	push   $0x80113d60
80104de4:	68 a0 45 11 80       	push   $0x801145a0
80104de9:	e8 a6 ea ff ff       	call   80103894 <sleep>
  while(ticks - ticks0 < n){
80104dee:	a1 a0 45 11 80       	mov    0x801145a0,%eax
80104df3:	29 d8                	sub    %ebx,%eax
80104df5:	83 c4 10             	add    $0x10,%esp
80104df8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104dfb:	73 27                	jae    80104e24 <sys_sleep+0x80>
    if(myproc()->killed){
80104dfd:	e8 5e e5 ff ff       	call   80103360 <myproc>
80104e02:	8b 40 28             	mov    0x28(%eax),%eax
80104e05:	85 c0                	test   %eax,%eax
80104e07:	74 d3                	je     80104ddc <sys_sleep+0x38>
      release(&tickslock);
80104e09:	83 ec 0c             	sub    $0xc,%esp
80104e0c:	68 60 3d 11 80       	push   $0x80113d60
80104e11:	e8 8e f0 ff ff       	call   80103ea4 <release>
      return -1;
80104e16:	83 c4 10             	add    $0x10,%esp
80104e19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80104e1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e21:	c9                   	leave  
80104e22:	c3                   	ret    
80104e23:	90                   	nop
  release(&tickslock);
80104e24:	83 ec 0c             	sub    $0xc,%esp
80104e27:	68 60 3d 11 80       	push   $0x80113d60
80104e2c:	e8 73 f0 ff ff       	call   80103ea4 <release>
  return 0;
80104e31:	83 c4 10             	add    $0x10,%esp
80104e34:	31 c0                	xor    %eax,%eax
}
80104e36:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104e39:	c9                   	leave  
80104e3a:	c3                   	ret    
    return -1;
80104e3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e40:	eb f4                	jmp    80104e36 <sys_sleep+0x92>
80104e42:	66 90                	xchg   %ax,%ax

80104e44 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80104e44:	55                   	push   %ebp
80104e45:	89 e5                	mov    %esp,%ebp
80104e47:	83 ec 24             	sub    $0x24,%esp
  uint xticks;

  acquire(&tickslock);
80104e4a:	68 60 3d 11 80       	push   $0x80113d60
80104e4f:	e8 b8 ef ff ff       	call   80103e0c <acquire>
  xticks = ticks;
80104e54:	a1 a0 45 11 80       	mov    0x801145a0,%eax
80104e59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&tickslock);
80104e5c:	c7 04 24 60 3d 11 80 	movl   $0x80113d60,(%esp)
80104e63:	e8 3c f0 ff ff       	call   80103ea4 <release>
  return xticks;
}
80104e68:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104e6b:	c9                   	leave  
80104e6c:	c3                   	ret    

80104e6d <alltraps>:
80104e6d:	1e                   	push   %ds
80104e6e:	06                   	push   %es
80104e6f:	0f a0                	push   %fs
80104e71:	0f a8                	push   %gs
80104e73:	60                   	pusha  
80104e74:	66 b8 10 00          	mov    $0x10,%ax
80104e78:	8e d8                	mov    %eax,%ds
80104e7a:	8e c0                	mov    %eax,%es
80104e7c:	54                   	push   %esp
80104e7d:	e8 9e 00 00 00       	call   80104f20 <trap>
80104e82:	83 c4 04             	add    $0x4,%esp

80104e85 <trapret>:
80104e85:	61                   	popa   
80104e86:	0f a9                	pop    %gs
80104e88:	0f a1                	pop    %fs
80104e8a:	07                   	pop    %es
80104e8b:	1f                   	pop    %ds
80104e8c:	83 c4 08             	add    $0x8,%esp
80104e8f:	cf                   	iret   

80104e90 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80104e90:	55                   	push   %ebp
80104e91:	89 e5                	mov    %esp,%ebp
80104e93:	83 ec 08             	sub    $0x8,%esp
  int i;

  for(i = 0; i < 256; i++)
80104e96:	31 c0                	xor    %eax,%eax
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80104e98:	8b 14 85 08 90 10 80 	mov    -0x7fef6ff8(,%eax,4),%edx
80104e9f:	66 89 14 c5 a0 3d 11 	mov    %dx,-0x7feec260(,%eax,8)
80104ea6:	80 
80104ea7:	c7 04 c5 a2 3d 11 80 	movl   $0x8e000008,-0x7feec25e(,%eax,8)
80104eae:	08 00 00 8e 
80104eb2:	c1 ea 10             	shr    $0x10,%edx
80104eb5:	66 89 14 c5 a6 3d 11 	mov    %dx,-0x7feec25a(,%eax,8)
80104ebc:	80 
  for(i = 0; i < 256; i++)
80104ebd:	40                   	inc    %eax
80104ebe:	3d 00 01 00 00       	cmp    $0x100,%eax
80104ec3:	75 d3                	jne    80104e98 <tvinit+0x8>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80104ec5:	a1 08 91 10 80       	mov    0x80109108,%eax
80104eca:	66 a3 a0 3f 11 80    	mov    %ax,0x80113fa0
80104ed0:	c7 05 a2 3f 11 80 08 	movl   $0xef000008,0x80113fa2
80104ed7:	00 00 ef 
80104eda:	c1 e8 10             	shr    $0x10,%eax
80104edd:	66 a3 a6 3f 11 80    	mov    %ax,0x80113fa6

  initlock(&tickslock, "time");
80104ee3:	83 ec 08             	sub    $0x8,%esp
80104ee6:	68 fd 6c 10 80       	push   $0x80106cfd
80104eeb:	68 60 3d 11 80       	push   $0x80113d60
80104ef0:	e8 d7 ed ff ff       	call   80103ccc <initlock>
}
80104ef5:	83 c4 10             	add    $0x10,%esp
80104ef8:	c9                   	leave  
80104ef9:	c3                   	ret    
80104efa:	66 90                	xchg   %ax,%ax

80104efc <idtinit>:

void
idtinit(void)
{
80104efc:	55                   	push   %ebp
80104efd:	89 e5                	mov    %esp,%ebp
80104eff:	83 ec 10             	sub    $0x10,%esp
  pd[0] = size-1;
80104f02:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
80104f08:	b8 a0 3d 11 80       	mov    $0x80113da0,%eax
80104f0d:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80104f11:	c1 e8 10             	shr    $0x10,%eax
80104f14:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80104f18:	8d 45 fa             	lea    -0x6(%ebp),%eax
80104f1b:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80104f1e:	c9                   	leave  
80104f1f:	c3                   	ret    

80104f20 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	57                   	push   %edi
80104f24:	56                   	push   %esi
80104f25:	53                   	push   %ebx
80104f26:	83 ec 1c             	sub    $0x1c,%esp
80104f29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80104f2c:	8b 43 30             	mov    0x30(%ebx),%eax
80104f2f:	83 f8 40             	cmp    $0x40,%eax
80104f32:	0f 84 b4 01 00 00    	je     801050ec <trap+0x1cc>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80104f38:	83 e8 20             	sub    $0x20,%eax
80104f3b:	83 f8 1f             	cmp    $0x1f,%eax
80104f3e:	77 07                	ja     80104f47 <trap+0x27>
80104f40:	ff 24 85 a4 6d 10 80 	jmp    *-0x7fef925c(,%eax,4)
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80104f47:	e8 14 e4 ff ff       	call   80103360 <myproc>
80104f4c:	8b 7b 38             	mov    0x38(%ebx),%edi
80104f4f:	85 c0                	test   %eax,%eax
80104f51:	0f 84 e0 01 00 00    	je     80105137 <trap+0x217>
80104f57:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80104f5b:	0f 84 d6 01 00 00    	je     80105137 <trap+0x217>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80104f61:	0f 20 d1             	mov    %cr2,%ecx
80104f64:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80104f67:	e8 c0 e3 ff ff       	call   8010332c <cpuid>
80104f6c:	89 45 dc             	mov    %eax,-0x24(%ebp)
80104f6f:	8b 43 34             	mov    0x34(%ebx),%eax
80104f72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104f75:	8b 73 30             	mov    0x30(%ebx),%esi
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80104f78:	e8 e3 e3 ff ff       	call   80103360 <myproc>
80104f7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80104f80:	e8 db e3 ff ff       	call   80103360 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80104f85:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80104f88:	51                   	push   %ecx
80104f89:	57                   	push   %edi
80104f8a:	8b 55 dc             	mov    -0x24(%ebp),%edx
80104f8d:	52                   	push   %edx
80104f8e:	ff 75 e4             	pushl  -0x1c(%ebp)
80104f91:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80104f92:	8b 75 e0             	mov    -0x20(%ebp),%esi
80104f95:	83 c6 70             	add    $0x70,%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80104f98:	56                   	push   %esi
80104f99:	ff 70 10             	pushl  0x10(%eax)
80104f9c:	68 60 6d 10 80       	push   $0x80106d60
80104fa1:	e8 7a b6 ff ff       	call   80100620 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80104fa6:	83 c4 20             	add    $0x20,%esp
80104fa9:	e8 b2 e3 ff ff       	call   80103360 <myproc>
80104fae:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80104fb5:	e8 a6 e3 ff ff       	call   80103360 <myproc>
80104fba:	85 c0                	test   %eax,%eax
80104fbc:	74 1c                	je     80104fda <trap+0xba>
80104fbe:	e8 9d e3 ff ff       	call   80103360 <myproc>
80104fc3:	8b 50 28             	mov    0x28(%eax),%edx
80104fc6:	85 d2                	test   %edx,%edx
80104fc8:	74 10                	je     80104fda <trap+0xba>
80104fca:	8b 43 3c             	mov    0x3c(%ebx),%eax
80104fcd:	83 e0 03             	and    $0x3,%eax
80104fd0:	66 83 f8 03          	cmp    $0x3,%ax
80104fd4:	0f 84 4a 01 00 00    	je     80105124 <trap+0x204>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80104fda:	e8 81 e3 ff ff       	call   80103360 <myproc>
80104fdf:	85 c0                	test   %eax,%eax
80104fe1:	74 0f                	je     80104ff2 <trap+0xd2>
80104fe3:	e8 78 e3 ff ff       	call   80103360 <myproc>
80104fe8:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80104fec:	0f 84 e6 00 00 00    	je     801050d8 <trap+0x1b8>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80104ff2:	e8 69 e3 ff ff       	call   80103360 <myproc>
80104ff7:	85 c0                	test   %eax,%eax
80104ff9:	74 1c                	je     80105017 <trap+0xf7>
80104ffb:	e8 60 e3 ff ff       	call   80103360 <myproc>
80105000:	8b 40 28             	mov    0x28(%eax),%eax
80105003:	85 c0                	test   %eax,%eax
80105005:	74 10                	je     80105017 <trap+0xf7>
80105007:	8b 43 3c             	mov    0x3c(%ebx),%eax
8010500a:	83 e0 03             	and    $0x3,%eax
8010500d:	66 83 f8 03          	cmp    $0x3,%ax
80105011:	0f 84 fe 00 00 00    	je     80105115 <trap+0x1f5>
    exit();
}
80105017:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010501a:	5b                   	pop    %ebx
8010501b:	5e                   	pop    %esi
8010501c:	5f                   	pop    %edi
8010501d:	5d                   	pop    %ebp
8010501e:	c3                   	ret    
    ideintr();
8010501f:	e8 38 ce ff ff       	call   80101e5c <ideintr>
    lapiceoi();
80105024:	e8 47 d4 ff ff       	call   80102470 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105029:	e8 32 e3 ff ff       	call   80103360 <myproc>
8010502e:	85 c0                	test   %eax,%eax
80105030:	75 8c                	jne    80104fbe <trap+0x9e>
80105032:	eb a6                	jmp    80104fda <trap+0xba>
    if(cpuid() == 0){
80105034:	e8 f3 e2 ff ff       	call   8010332c <cpuid>
80105039:	85 c0                	test   %eax,%eax
8010503b:	75 e7                	jne    80105024 <trap+0x104>
      acquire(&tickslock);
8010503d:	83 ec 0c             	sub    $0xc,%esp
80105040:	68 60 3d 11 80       	push   $0x80113d60
80105045:	e8 c2 ed ff ff       	call   80103e0c <acquire>
      ticks++;
8010504a:	ff 05 a0 45 11 80    	incl   0x801145a0
      wakeup(&ticks);
80105050:	c7 04 24 a0 45 11 80 	movl   $0x801145a0,(%esp)
80105057:	e8 e4 e9 ff ff       	call   80103a40 <wakeup>
      release(&tickslock);
8010505c:	c7 04 24 60 3d 11 80 	movl   $0x80113d60,(%esp)
80105063:	e8 3c ee ff ff       	call   80103ea4 <release>
80105068:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
8010506b:	eb b7                	jmp    80105024 <trap+0x104>
    kbdintr();
8010506d:	e8 ee d2 ff ff       	call   80102360 <kbdintr>
    lapiceoi();
80105072:	e8 f9 d3 ff ff       	call   80102470 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105077:	e8 e4 e2 ff ff       	call   80103360 <myproc>
8010507c:	85 c0                	test   %eax,%eax
8010507e:	0f 85 3a ff ff ff    	jne    80104fbe <trap+0x9e>
80105084:	e9 51 ff ff ff       	jmp    80104fda <trap+0xba>
    uartintr();
80105089:	e8 fa 01 00 00       	call   80105288 <uartintr>
    lapiceoi();
8010508e:	e8 dd d3 ff ff       	call   80102470 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105093:	e8 c8 e2 ff ff       	call   80103360 <myproc>
80105098:	85 c0                	test   %eax,%eax
8010509a:	0f 85 1e ff ff ff    	jne    80104fbe <trap+0x9e>
801050a0:	e9 35 ff ff ff       	jmp    80104fda <trap+0xba>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801050a5:	8b 7b 38             	mov    0x38(%ebx),%edi
801050a8:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801050ac:	e8 7b e2 ff ff       	call   8010332c <cpuid>
801050b1:	57                   	push   %edi
801050b2:	56                   	push   %esi
801050b3:	50                   	push   %eax
801050b4:	68 08 6d 10 80       	push   $0x80106d08
801050b9:	e8 62 b5 ff ff       	call   80100620 <cprintf>
    lapiceoi();
801050be:	e8 ad d3 ff ff       	call   80102470 <lapiceoi>
    break;
801050c3:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801050c6:	e8 95 e2 ff ff       	call   80103360 <myproc>
801050cb:	85 c0                	test   %eax,%eax
801050cd:	0f 85 eb fe ff ff    	jne    80104fbe <trap+0x9e>
801050d3:	e9 02 ff ff ff       	jmp    80104fda <trap+0xba>
  if(myproc() && myproc()->state == RUNNING &&
801050d8:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801050dc:	0f 85 10 ff ff ff    	jne    80104ff2 <trap+0xd2>
    yield();
801050e2:	e8 65 e7 ff ff       	call   8010384c <yield>
801050e7:	e9 06 ff ff ff       	jmp    80104ff2 <trap+0xd2>
    if(myproc()->killed)
801050ec:	e8 6f e2 ff ff       	call   80103360 <myproc>
801050f1:	8b 70 28             	mov    0x28(%eax),%esi
801050f4:	85 f6                	test   %esi,%esi
801050f6:	75 38                	jne    80105130 <trap+0x210>
    myproc()->tf = tf;
801050f8:	e8 63 e2 ff ff       	call   80103360 <myproc>
801050fd:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105100:	e8 d7 f0 ff ff       	call   801041dc <syscall>
    if(myproc()->killed)
80105105:	e8 56 e2 ff ff       	call   80103360 <myproc>
8010510a:	8b 48 28             	mov    0x28(%eax),%ecx
8010510d:	85 c9                	test   %ecx,%ecx
8010510f:	0f 84 02 ff ff ff    	je     80105017 <trap+0xf7>
}
80105115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105118:	5b                   	pop    %ebx
80105119:	5e                   	pop    %esi
8010511a:	5f                   	pop    %edi
8010511b:	5d                   	pop    %ebp
      exit();
8010511c:	e9 0f e6 ff ff       	jmp    80103730 <exit>
80105121:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
80105124:	e8 07 e6 ff ff       	call   80103730 <exit>
80105129:	e9 ac fe ff ff       	jmp    80104fda <trap+0xba>
8010512e:	66 90                	xchg   %ax,%ax
      exit();
80105130:	e8 fb e5 ff ff       	call   80103730 <exit>
80105135:	eb c1                	jmp    801050f8 <trap+0x1d8>
80105137:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010513a:	e8 ed e1 ff ff       	call   8010332c <cpuid>
8010513f:	83 ec 0c             	sub    $0xc,%esp
80105142:	56                   	push   %esi
80105143:	57                   	push   %edi
80105144:	50                   	push   %eax
80105145:	ff 73 30             	pushl  0x30(%ebx)
80105148:	68 2c 6d 10 80       	push   $0x80106d2c
8010514d:	e8 ce b4 ff ff       	call   80100620 <cprintf>
      panic("trap");
80105152:	83 c4 14             	add    $0x14,%esp
80105155:	68 02 6d 10 80       	push   $0x80106d02
8010515a:	e8 e1 b1 ff ff       	call   80100340 <panic>
8010515f:	90                   	nop

80105160 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105160:	a1 bc 95 10 80       	mov    0x801095bc,%eax
80105165:	85 c0                	test   %eax,%eax
80105167:	74 17                	je     80105180 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105169:	ba fd 03 00 00       	mov    $0x3fd,%edx
8010516e:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
8010516f:	a8 01                	test   $0x1,%al
80105171:	74 0d                	je     80105180 <uartgetc+0x20>
80105173:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105178:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105179:	0f b6 c0             	movzbl %al,%eax
8010517c:	c3                   	ret    
8010517d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105180:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105185:	c3                   	ret    
80105186:	66 90                	xchg   %ax,%ax

80105188 <uartputc.part.0>:
uartputc(int c)
80105188:	55                   	push   %ebp
80105189:	89 e5                	mov    %esp,%ebp
8010518b:	57                   	push   %edi
8010518c:	56                   	push   %esi
8010518d:	53                   	push   %ebx
8010518e:	83 ec 0c             	sub    $0xc,%esp
80105191:	89 c7                	mov    %eax,%edi
80105193:	bb 80 00 00 00       	mov    $0x80,%ebx
80105198:	be fd 03 00 00       	mov    $0x3fd,%esi
8010519d:	eb 11                	jmp    801051b0 <uartputc.part.0+0x28>
8010519f:	90                   	nop
    microdelay(10);
801051a0:	83 ec 0c             	sub    $0xc,%esp
801051a3:	6a 0a                	push   $0xa
801051a5:	e8 de d2 ff ff       	call   80102488 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801051aa:	83 c4 10             	add    $0x10,%esp
801051ad:	4b                   	dec    %ebx
801051ae:	74 07                	je     801051b7 <uartputc.part.0+0x2f>
801051b0:	89 f2                	mov    %esi,%edx
801051b2:	ec                   	in     (%dx),%al
801051b3:	a8 20                	test   $0x20,%al
801051b5:	74 e9                	je     801051a0 <uartputc.part.0+0x18>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801051b7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801051bc:	89 f8                	mov    %edi,%eax
801051be:	ee                   	out    %al,(%dx)
}
801051bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051c2:	5b                   	pop    %ebx
801051c3:	5e                   	pop    %esi
801051c4:	5f                   	pop    %edi
801051c5:	5d                   	pop    %ebp
801051c6:	c3                   	ret    
801051c7:	90                   	nop

801051c8 <uartinit>:
{
801051c8:	55                   	push   %ebp
801051c9:	89 e5                	mov    %esp,%ebp
801051cb:	57                   	push   %edi
801051cc:	56                   	push   %esi
801051cd:	53                   	push   %ebx
801051ce:	83 ec 1c             	sub    $0x1c,%esp
801051d1:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801051d6:	31 c0                	xor    %eax,%eax
801051d8:	89 da                	mov    %ebx,%edx
801051da:	ee                   	out    %al,(%dx)
801051db:	bf fb 03 00 00       	mov    $0x3fb,%edi
801051e0:	b0 80                	mov    $0x80,%al
801051e2:	89 fa                	mov    %edi,%edx
801051e4:	ee                   	out    %al,(%dx)
801051e5:	b9 f8 03 00 00       	mov    $0x3f8,%ecx
801051ea:	b0 0c                	mov    $0xc,%al
801051ec:	89 ca                	mov    %ecx,%edx
801051ee:	ee                   	out    %al,(%dx)
801051ef:	be f9 03 00 00       	mov    $0x3f9,%esi
801051f4:	31 c0                	xor    %eax,%eax
801051f6:	89 f2                	mov    %esi,%edx
801051f8:	ee                   	out    %al,(%dx)
801051f9:	b0 03                	mov    $0x3,%al
801051fb:	89 fa                	mov    %edi,%edx
801051fd:	ee                   	out    %al,(%dx)
801051fe:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105203:	31 c0                	xor    %eax,%eax
80105205:	ee                   	out    %al,(%dx)
80105206:	b0 01                	mov    $0x1,%al
80105208:	89 f2                	mov    %esi,%edx
8010520a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010520b:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105210:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105211:	fe c0                	inc    %al
80105213:	74 4f                	je     80105264 <uartinit+0x9c>
  uart = 1;
80105215:	c7 05 bc 95 10 80 01 	movl   $0x1,0x801095bc
8010521c:	00 00 00 
8010521f:	89 da                	mov    %ebx,%edx
80105221:	ec                   	in     (%dx),%al
80105222:	89 ca                	mov    %ecx,%edx
80105224:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105225:	83 ec 08             	sub    $0x8,%esp
80105228:	6a 00                	push   $0x0
8010522a:	6a 04                	push   $0x4
8010522c:	e8 3f ce ff ff       	call   80102070 <ioapicenable>
80105231:	83 c4 10             	add    $0x10,%esp
80105234:	b2 76                	mov    $0x76,%dl
  for(p="xv6...\n"; *p; p++)
80105236:	bb 24 6e 10 80       	mov    $0x80106e24,%ebx
8010523b:	b8 78 00 00 00       	mov    $0x78,%eax
80105240:	eb 08                	jmp    8010524a <uartinit+0x82>
80105242:	66 90                	xchg   %ax,%ax
80105244:	0f be c2             	movsbl %dl,%eax
80105247:	8a 53 01             	mov    0x1(%ebx),%dl
  if(!uart)
8010524a:	8b 0d bc 95 10 80    	mov    0x801095bc,%ecx
80105250:	85 c9                	test   %ecx,%ecx
80105252:	74 0b                	je     8010525f <uartinit+0x97>
80105254:	88 55 e7             	mov    %dl,-0x19(%ebp)
80105257:	e8 2c ff ff ff       	call   80105188 <uartputc.part.0>
8010525c:	8a 55 e7             	mov    -0x19(%ebp),%dl
  for(p="xv6...\n"; *p; p++)
8010525f:	43                   	inc    %ebx
80105260:	84 d2                	test   %dl,%dl
80105262:	75 e0                	jne    80105244 <uartinit+0x7c>
}
80105264:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105267:	5b                   	pop    %ebx
80105268:	5e                   	pop    %esi
80105269:	5f                   	pop    %edi
8010526a:	5d                   	pop    %ebp
8010526b:	c3                   	ret    

8010526c <uartputc>:
{
8010526c:	55                   	push   %ebp
8010526d:	89 e5                	mov    %esp,%ebp
8010526f:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105272:	8b 15 bc 95 10 80    	mov    0x801095bc,%edx
80105278:	85 d2                	test   %edx,%edx
8010527a:	74 08                	je     80105284 <uartputc+0x18>
}
8010527c:	5d                   	pop    %ebp
8010527d:	e9 06 ff ff ff       	jmp    80105188 <uartputc.part.0>
80105282:	66 90                	xchg   %ax,%ax
80105284:	5d                   	pop    %ebp
80105285:	c3                   	ret    
80105286:	66 90                	xchg   %ax,%ax

80105288 <uartintr>:

void
uartintr(void)
{
80105288:	55                   	push   %ebp
80105289:	89 e5                	mov    %esp,%ebp
8010528b:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
8010528e:	68 60 51 10 80       	push   $0x80105160
80105293:	e8 10 b5 ff ff       	call   801007a8 <consoleintr>
}
80105298:	83 c4 10             	add    $0x10,%esp
8010529b:	c9                   	leave  
8010529c:	c3                   	ret    

8010529d <vector0>:
8010529d:	6a 00                	push   $0x0
8010529f:	6a 00                	push   $0x0
801052a1:	e9 c7 fb ff ff       	jmp    80104e6d <alltraps>

801052a6 <vector1>:
801052a6:	6a 00                	push   $0x0
801052a8:	6a 01                	push   $0x1
801052aa:	e9 be fb ff ff       	jmp    80104e6d <alltraps>

801052af <vector2>:
801052af:	6a 00                	push   $0x0
801052b1:	6a 02                	push   $0x2
801052b3:	e9 b5 fb ff ff       	jmp    80104e6d <alltraps>

801052b8 <vector3>:
801052b8:	6a 00                	push   $0x0
801052ba:	6a 03                	push   $0x3
801052bc:	e9 ac fb ff ff       	jmp    80104e6d <alltraps>

801052c1 <vector4>:
801052c1:	6a 00                	push   $0x0
801052c3:	6a 04                	push   $0x4
801052c5:	e9 a3 fb ff ff       	jmp    80104e6d <alltraps>

801052ca <vector5>:
801052ca:	6a 00                	push   $0x0
801052cc:	6a 05                	push   $0x5
801052ce:	e9 9a fb ff ff       	jmp    80104e6d <alltraps>

801052d3 <vector6>:
801052d3:	6a 00                	push   $0x0
801052d5:	6a 06                	push   $0x6
801052d7:	e9 91 fb ff ff       	jmp    80104e6d <alltraps>

801052dc <vector7>:
801052dc:	6a 00                	push   $0x0
801052de:	6a 07                	push   $0x7
801052e0:	e9 88 fb ff ff       	jmp    80104e6d <alltraps>

801052e5 <vector8>:
801052e5:	6a 08                	push   $0x8
801052e7:	e9 81 fb ff ff       	jmp    80104e6d <alltraps>

801052ec <vector9>:
801052ec:	6a 00                	push   $0x0
801052ee:	6a 09                	push   $0x9
801052f0:	e9 78 fb ff ff       	jmp    80104e6d <alltraps>

801052f5 <vector10>:
801052f5:	6a 0a                	push   $0xa
801052f7:	e9 71 fb ff ff       	jmp    80104e6d <alltraps>

801052fc <vector11>:
801052fc:	6a 0b                	push   $0xb
801052fe:	e9 6a fb ff ff       	jmp    80104e6d <alltraps>

80105303 <vector12>:
80105303:	6a 0c                	push   $0xc
80105305:	e9 63 fb ff ff       	jmp    80104e6d <alltraps>

8010530a <vector13>:
8010530a:	6a 0d                	push   $0xd
8010530c:	e9 5c fb ff ff       	jmp    80104e6d <alltraps>

80105311 <vector14>:
80105311:	6a 0e                	push   $0xe
80105313:	e9 55 fb ff ff       	jmp    80104e6d <alltraps>

80105318 <vector15>:
80105318:	6a 00                	push   $0x0
8010531a:	6a 0f                	push   $0xf
8010531c:	e9 4c fb ff ff       	jmp    80104e6d <alltraps>

80105321 <vector16>:
80105321:	6a 00                	push   $0x0
80105323:	6a 10                	push   $0x10
80105325:	e9 43 fb ff ff       	jmp    80104e6d <alltraps>

8010532a <vector17>:
8010532a:	6a 11                	push   $0x11
8010532c:	e9 3c fb ff ff       	jmp    80104e6d <alltraps>

80105331 <vector18>:
80105331:	6a 00                	push   $0x0
80105333:	6a 12                	push   $0x12
80105335:	e9 33 fb ff ff       	jmp    80104e6d <alltraps>

8010533a <vector19>:
8010533a:	6a 00                	push   $0x0
8010533c:	6a 13                	push   $0x13
8010533e:	e9 2a fb ff ff       	jmp    80104e6d <alltraps>

80105343 <vector20>:
80105343:	6a 00                	push   $0x0
80105345:	6a 14                	push   $0x14
80105347:	e9 21 fb ff ff       	jmp    80104e6d <alltraps>

8010534c <vector21>:
8010534c:	6a 00                	push   $0x0
8010534e:	6a 15                	push   $0x15
80105350:	e9 18 fb ff ff       	jmp    80104e6d <alltraps>

80105355 <vector22>:
80105355:	6a 00                	push   $0x0
80105357:	6a 16                	push   $0x16
80105359:	e9 0f fb ff ff       	jmp    80104e6d <alltraps>

8010535e <vector23>:
8010535e:	6a 00                	push   $0x0
80105360:	6a 17                	push   $0x17
80105362:	e9 06 fb ff ff       	jmp    80104e6d <alltraps>

80105367 <vector24>:
80105367:	6a 00                	push   $0x0
80105369:	6a 18                	push   $0x18
8010536b:	e9 fd fa ff ff       	jmp    80104e6d <alltraps>

80105370 <vector25>:
80105370:	6a 00                	push   $0x0
80105372:	6a 19                	push   $0x19
80105374:	e9 f4 fa ff ff       	jmp    80104e6d <alltraps>

80105379 <vector26>:
80105379:	6a 00                	push   $0x0
8010537b:	6a 1a                	push   $0x1a
8010537d:	e9 eb fa ff ff       	jmp    80104e6d <alltraps>

80105382 <vector27>:
80105382:	6a 00                	push   $0x0
80105384:	6a 1b                	push   $0x1b
80105386:	e9 e2 fa ff ff       	jmp    80104e6d <alltraps>

8010538b <vector28>:
8010538b:	6a 00                	push   $0x0
8010538d:	6a 1c                	push   $0x1c
8010538f:	e9 d9 fa ff ff       	jmp    80104e6d <alltraps>

80105394 <vector29>:
80105394:	6a 00                	push   $0x0
80105396:	6a 1d                	push   $0x1d
80105398:	e9 d0 fa ff ff       	jmp    80104e6d <alltraps>

8010539d <vector30>:
8010539d:	6a 00                	push   $0x0
8010539f:	6a 1e                	push   $0x1e
801053a1:	e9 c7 fa ff ff       	jmp    80104e6d <alltraps>

801053a6 <vector31>:
801053a6:	6a 00                	push   $0x0
801053a8:	6a 1f                	push   $0x1f
801053aa:	e9 be fa ff ff       	jmp    80104e6d <alltraps>

801053af <vector32>:
801053af:	6a 00                	push   $0x0
801053b1:	6a 20                	push   $0x20
801053b3:	e9 b5 fa ff ff       	jmp    80104e6d <alltraps>

801053b8 <vector33>:
801053b8:	6a 00                	push   $0x0
801053ba:	6a 21                	push   $0x21
801053bc:	e9 ac fa ff ff       	jmp    80104e6d <alltraps>

801053c1 <vector34>:
801053c1:	6a 00                	push   $0x0
801053c3:	6a 22                	push   $0x22
801053c5:	e9 a3 fa ff ff       	jmp    80104e6d <alltraps>

801053ca <vector35>:
801053ca:	6a 00                	push   $0x0
801053cc:	6a 23                	push   $0x23
801053ce:	e9 9a fa ff ff       	jmp    80104e6d <alltraps>

801053d3 <vector36>:
801053d3:	6a 00                	push   $0x0
801053d5:	6a 24                	push   $0x24
801053d7:	e9 91 fa ff ff       	jmp    80104e6d <alltraps>

801053dc <vector37>:
801053dc:	6a 00                	push   $0x0
801053de:	6a 25                	push   $0x25
801053e0:	e9 88 fa ff ff       	jmp    80104e6d <alltraps>

801053e5 <vector38>:
801053e5:	6a 00                	push   $0x0
801053e7:	6a 26                	push   $0x26
801053e9:	e9 7f fa ff ff       	jmp    80104e6d <alltraps>

801053ee <vector39>:
801053ee:	6a 00                	push   $0x0
801053f0:	6a 27                	push   $0x27
801053f2:	e9 76 fa ff ff       	jmp    80104e6d <alltraps>

801053f7 <vector40>:
801053f7:	6a 00                	push   $0x0
801053f9:	6a 28                	push   $0x28
801053fb:	e9 6d fa ff ff       	jmp    80104e6d <alltraps>

80105400 <vector41>:
80105400:	6a 00                	push   $0x0
80105402:	6a 29                	push   $0x29
80105404:	e9 64 fa ff ff       	jmp    80104e6d <alltraps>

80105409 <vector42>:
80105409:	6a 00                	push   $0x0
8010540b:	6a 2a                	push   $0x2a
8010540d:	e9 5b fa ff ff       	jmp    80104e6d <alltraps>

80105412 <vector43>:
80105412:	6a 00                	push   $0x0
80105414:	6a 2b                	push   $0x2b
80105416:	e9 52 fa ff ff       	jmp    80104e6d <alltraps>

8010541b <vector44>:
8010541b:	6a 00                	push   $0x0
8010541d:	6a 2c                	push   $0x2c
8010541f:	e9 49 fa ff ff       	jmp    80104e6d <alltraps>

80105424 <vector45>:
80105424:	6a 00                	push   $0x0
80105426:	6a 2d                	push   $0x2d
80105428:	e9 40 fa ff ff       	jmp    80104e6d <alltraps>

8010542d <vector46>:
8010542d:	6a 00                	push   $0x0
8010542f:	6a 2e                	push   $0x2e
80105431:	e9 37 fa ff ff       	jmp    80104e6d <alltraps>

80105436 <vector47>:
80105436:	6a 00                	push   $0x0
80105438:	6a 2f                	push   $0x2f
8010543a:	e9 2e fa ff ff       	jmp    80104e6d <alltraps>

8010543f <vector48>:
8010543f:	6a 00                	push   $0x0
80105441:	6a 30                	push   $0x30
80105443:	e9 25 fa ff ff       	jmp    80104e6d <alltraps>

80105448 <vector49>:
80105448:	6a 00                	push   $0x0
8010544a:	6a 31                	push   $0x31
8010544c:	e9 1c fa ff ff       	jmp    80104e6d <alltraps>

80105451 <vector50>:
80105451:	6a 00                	push   $0x0
80105453:	6a 32                	push   $0x32
80105455:	e9 13 fa ff ff       	jmp    80104e6d <alltraps>

8010545a <vector51>:
8010545a:	6a 00                	push   $0x0
8010545c:	6a 33                	push   $0x33
8010545e:	e9 0a fa ff ff       	jmp    80104e6d <alltraps>

80105463 <vector52>:
80105463:	6a 00                	push   $0x0
80105465:	6a 34                	push   $0x34
80105467:	e9 01 fa ff ff       	jmp    80104e6d <alltraps>

8010546c <vector53>:
8010546c:	6a 00                	push   $0x0
8010546e:	6a 35                	push   $0x35
80105470:	e9 f8 f9 ff ff       	jmp    80104e6d <alltraps>

80105475 <vector54>:
80105475:	6a 00                	push   $0x0
80105477:	6a 36                	push   $0x36
80105479:	e9 ef f9 ff ff       	jmp    80104e6d <alltraps>

8010547e <vector55>:
8010547e:	6a 00                	push   $0x0
80105480:	6a 37                	push   $0x37
80105482:	e9 e6 f9 ff ff       	jmp    80104e6d <alltraps>

80105487 <vector56>:
80105487:	6a 00                	push   $0x0
80105489:	6a 38                	push   $0x38
8010548b:	e9 dd f9 ff ff       	jmp    80104e6d <alltraps>

80105490 <vector57>:
80105490:	6a 00                	push   $0x0
80105492:	6a 39                	push   $0x39
80105494:	e9 d4 f9 ff ff       	jmp    80104e6d <alltraps>

80105499 <vector58>:
80105499:	6a 00                	push   $0x0
8010549b:	6a 3a                	push   $0x3a
8010549d:	e9 cb f9 ff ff       	jmp    80104e6d <alltraps>

801054a2 <vector59>:
801054a2:	6a 00                	push   $0x0
801054a4:	6a 3b                	push   $0x3b
801054a6:	e9 c2 f9 ff ff       	jmp    80104e6d <alltraps>

801054ab <vector60>:
801054ab:	6a 00                	push   $0x0
801054ad:	6a 3c                	push   $0x3c
801054af:	e9 b9 f9 ff ff       	jmp    80104e6d <alltraps>

801054b4 <vector61>:
801054b4:	6a 00                	push   $0x0
801054b6:	6a 3d                	push   $0x3d
801054b8:	e9 b0 f9 ff ff       	jmp    80104e6d <alltraps>

801054bd <vector62>:
801054bd:	6a 00                	push   $0x0
801054bf:	6a 3e                	push   $0x3e
801054c1:	e9 a7 f9 ff ff       	jmp    80104e6d <alltraps>

801054c6 <vector63>:
801054c6:	6a 00                	push   $0x0
801054c8:	6a 3f                	push   $0x3f
801054ca:	e9 9e f9 ff ff       	jmp    80104e6d <alltraps>

801054cf <vector64>:
801054cf:	6a 00                	push   $0x0
801054d1:	6a 40                	push   $0x40
801054d3:	e9 95 f9 ff ff       	jmp    80104e6d <alltraps>

801054d8 <vector65>:
801054d8:	6a 00                	push   $0x0
801054da:	6a 41                	push   $0x41
801054dc:	e9 8c f9 ff ff       	jmp    80104e6d <alltraps>

801054e1 <vector66>:
801054e1:	6a 00                	push   $0x0
801054e3:	6a 42                	push   $0x42
801054e5:	e9 83 f9 ff ff       	jmp    80104e6d <alltraps>

801054ea <vector67>:
801054ea:	6a 00                	push   $0x0
801054ec:	6a 43                	push   $0x43
801054ee:	e9 7a f9 ff ff       	jmp    80104e6d <alltraps>

801054f3 <vector68>:
801054f3:	6a 00                	push   $0x0
801054f5:	6a 44                	push   $0x44
801054f7:	e9 71 f9 ff ff       	jmp    80104e6d <alltraps>

801054fc <vector69>:
801054fc:	6a 00                	push   $0x0
801054fe:	6a 45                	push   $0x45
80105500:	e9 68 f9 ff ff       	jmp    80104e6d <alltraps>

80105505 <vector70>:
80105505:	6a 00                	push   $0x0
80105507:	6a 46                	push   $0x46
80105509:	e9 5f f9 ff ff       	jmp    80104e6d <alltraps>

8010550e <vector71>:
8010550e:	6a 00                	push   $0x0
80105510:	6a 47                	push   $0x47
80105512:	e9 56 f9 ff ff       	jmp    80104e6d <alltraps>

80105517 <vector72>:
80105517:	6a 00                	push   $0x0
80105519:	6a 48                	push   $0x48
8010551b:	e9 4d f9 ff ff       	jmp    80104e6d <alltraps>

80105520 <vector73>:
80105520:	6a 00                	push   $0x0
80105522:	6a 49                	push   $0x49
80105524:	e9 44 f9 ff ff       	jmp    80104e6d <alltraps>

80105529 <vector74>:
80105529:	6a 00                	push   $0x0
8010552b:	6a 4a                	push   $0x4a
8010552d:	e9 3b f9 ff ff       	jmp    80104e6d <alltraps>

80105532 <vector75>:
80105532:	6a 00                	push   $0x0
80105534:	6a 4b                	push   $0x4b
80105536:	e9 32 f9 ff ff       	jmp    80104e6d <alltraps>

8010553b <vector76>:
8010553b:	6a 00                	push   $0x0
8010553d:	6a 4c                	push   $0x4c
8010553f:	e9 29 f9 ff ff       	jmp    80104e6d <alltraps>

80105544 <vector77>:
80105544:	6a 00                	push   $0x0
80105546:	6a 4d                	push   $0x4d
80105548:	e9 20 f9 ff ff       	jmp    80104e6d <alltraps>

8010554d <vector78>:
8010554d:	6a 00                	push   $0x0
8010554f:	6a 4e                	push   $0x4e
80105551:	e9 17 f9 ff ff       	jmp    80104e6d <alltraps>

80105556 <vector79>:
80105556:	6a 00                	push   $0x0
80105558:	6a 4f                	push   $0x4f
8010555a:	e9 0e f9 ff ff       	jmp    80104e6d <alltraps>

8010555f <vector80>:
8010555f:	6a 00                	push   $0x0
80105561:	6a 50                	push   $0x50
80105563:	e9 05 f9 ff ff       	jmp    80104e6d <alltraps>

80105568 <vector81>:
80105568:	6a 00                	push   $0x0
8010556a:	6a 51                	push   $0x51
8010556c:	e9 fc f8 ff ff       	jmp    80104e6d <alltraps>

80105571 <vector82>:
80105571:	6a 00                	push   $0x0
80105573:	6a 52                	push   $0x52
80105575:	e9 f3 f8 ff ff       	jmp    80104e6d <alltraps>

8010557a <vector83>:
8010557a:	6a 00                	push   $0x0
8010557c:	6a 53                	push   $0x53
8010557e:	e9 ea f8 ff ff       	jmp    80104e6d <alltraps>

80105583 <vector84>:
80105583:	6a 00                	push   $0x0
80105585:	6a 54                	push   $0x54
80105587:	e9 e1 f8 ff ff       	jmp    80104e6d <alltraps>

8010558c <vector85>:
8010558c:	6a 00                	push   $0x0
8010558e:	6a 55                	push   $0x55
80105590:	e9 d8 f8 ff ff       	jmp    80104e6d <alltraps>

80105595 <vector86>:
80105595:	6a 00                	push   $0x0
80105597:	6a 56                	push   $0x56
80105599:	e9 cf f8 ff ff       	jmp    80104e6d <alltraps>

8010559e <vector87>:
8010559e:	6a 00                	push   $0x0
801055a0:	6a 57                	push   $0x57
801055a2:	e9 c6 f8 ff ff       	jmp    80104e6d <alltraps>

801055a7 <vector88>:
801055a7:	6a 00                	push   $0x0
801055a9:	6a 58                	push   $0x58
801055ab:	e9 bd f8 ff ff       	jmp    80104e6d <alltraps>

801055b0 <vector89>:
801055b0:	6a 00                	push   $0x0
801055b2:	6a 59                	push   $0x59
801055b4:	e9 b4 f8 ff ff       	jmp    80104e6d <alltraps>

801055b9 <vector90>:
801055b9:	6a 00                	push   $0x0
801055bb:	6a 5a                	push   $0x5a
801055bd:	e9 ab f8 ff ff       	jmp    80104e6d <alltraps>

801055c2 <vector91>:
801055c2:	6a 00                	push   $0x0
801055c4:	6a 5b                	push   $0x5b
801055c6:	e9 a2 f8 ff ff       	jmp    80104e6d <alltraps>

801055cb <vector92>:
801055cb:	6a 00                	push   $0x0
801055cd:	6a 5c                	push   $0x5c
801055cf:	e9 99 f8 ff ff       	jmp    80104e6d <alltraps>

801055d4 <vector93>:
801055d4:	6a 00                	push   $0x0
801055d6:	6a 5d                	push   $0x5d
801055d8:	e9 90 f8 ff ff       	jmp    80104e6d <alltraps>

801055dd <vector94>:
801055dd:	6a 00                	push   $0x0
801055df:	6a 5e                	push   $0x5e
801055e1:	e9 87 f8 ff ff       	jmp    80104e6d <alltraps>

801055e6 <vector95>:
801055e6:	6a 00                	push   $0x0
801055e8:	6a 5f                	push   $0x5f
801055ea:	e9 7e f8 ff ff       	jmp    80104e6d <alltraps>

801055ef <vector96>:
801055ef:	6a 00                	push   $0x0
801055f1:	6a 60                	push   $0x60
801055f3:	e9 75 f8 ff ff       	jmp    80104e6d <alltraps>

801055f8 <vector97>:
801055f8:	6a 00                	push   $0x0
801055fa:	6a 61                	push   $0x61
801055fc:	e9 6c f8 ff ff       	jmp    80104e6d <alltraps>

80105601 <vector98>:
80105601:	6a 00                	push   $0x0
80105603:	6a 62                	push   $0x62
80105605:	e9 63 f8 ff ff       	jmp    80104e6d <alltraps>

8010560a <vector99>:
8010560a:	6a 00                	push   $0x0
8010560c:	6a 63                	push   $0x63
8010560e:	e9 5a f8 ff ff       	jmp    80104e6d <alltraps>

80105613 <vector100>:
80105613:	6a 00                	push   $0x0
80105615:	6a 64                	push   $0x64
80105617:	e9 51 f8 ff ff       	jmp    80104e6d <alltraps>

8010561c <vector101>:
8010561c:	6a 00                	push   $0x0
8010561e:	6a 65                	push   $0x65
80105620:	e9 48 f8 ff ff       	jmp    80104e6d <alltraps>

80105625 <vector102>:
80105625:	6a 00                	push   $0x0
80105627:	6a 66                	push   $0x66
80105629:	e9 3f f8 ff ff       	jmp    80104e6d <alltraps>

8010562e <vector103>:
8010562e:	6a 00                	push   $0x0
80105630:	6a 67                	push   $0x67
80105632:	e9 36 f8 ff ff       	jmp    80104e6d <alltraps>

80105637 <vector104>:
80105637:	6a 00                	push   $0x0
80105639:	6a 68                	push   $0x68
8010563b:	e9 2d f8 ff ff       	jmp    80104e6d <alltraps>

80105640 <vector105>:
80105640:	6a 00                	push   $0x0
80105642:	6a 69                	push   $0x69
80105644:	e9 24 f8 ff ff       	jmp    80104e6d <alltraps>

80105649 <vector106>:
80105649:	6a 00                	push   $0x0
8010564b:	6a 6a                	push   $0x6a
8010564d:	e9 1b f8 ff ff       	jmp    80104e6d <alltraps>

80105652 <vector107>:
80105652:	6a 00                	push   $0x0
80105654:	6a 6b                	push   $0x6b
80105656:	e9 12 f8 ff ff       	jmp    80104e6d <alltraps>

8010565b <vector108>:
8010565b:	6a 00                	push   $0x0
8010565d:	6a 6c                	push   $0x6c
8010565f:	e9 09 f8 ff ff       	jmp    80104e6d <alltraps>

80105664 <vector109>:
80105664:	6a 00                	push   $0x0
80105666:	6a 6d                	push   $0x6d
80105668:	e9 00 f8 ff ff       	jmp    80104e6d <alltraps>

8010566d <vector110>:
8010566d:	6a 00                	push   $0x0
8010566f:	6a 6e                	push   $0x6e
80105671:	e9 f7 f7 ff ff       	jmp    80104e6d <alltraps>

80105676 <vector111>:
80105676:	6a 00                	push   $0x0
80105678:	6a 6f                	push   $0x6f
8010567a:	e9 ee f7 ff ff       	jmp    80104e6d <alltraps>

8010567f <vector112>:
8010567f:	6a 00                	push   $0x0
80105681:	6a 70                	push   $0x70
80105683:	e9 e5 f7 ff ff       	jmp    80104e6d <alltraps>

80105688 <vector113>:
80105688:	6a 00                	push   $0x0
8010568a:	6a 71                	push   $0x71
8010568c:	e9 dc f7 ff ff       	jmp    80104e6d <alltraps>

80105691 <vector114>:
80105691:	6a 00                	push   $0x0
80105693:	6a 72                	push   $0x72
80105695:	e9 d3 f7 ff ff       	jmp    80104e6d <alltraps>

8010569a <vector115>:
8010569a:	6a 00                	push   $0x0
8010569c:	6a 73                	push   $0x73
8010569e:	e9 ca f7 ff ff       	jmp    80104e6d <alltraps>

801056a3 <vector116>:
801056a3:	6a 00                	push   $0x0
801056a5:	6a 74                	push   $0x74
801056a7:	e9 c1 f7 ff ff       	jmp    80104e6d <alltraps>

801056ac <vector117>:
801056ac:	6a 00                	push   $0x0
801056ae:	6a 75                	push   $0x75
801056b0:	e9 b8 f7 ff ff       	jmp    80104e6d <alltraps>

801056b5 <vector118>:
801056b5:	6a 00                	push   $0x0
801056b7:	6a 76                	push   $0x76
801056b9:	e9 af f7 ff ff       	jmp    80104e6d <alltraps>

801056be <vector119>:
801056be:	6a 00                	push   $0x0
801056c0:	6a 77                	push   $0x77
801056c2:	e9 a6 f7 ff ff       	jmp    80104e6d <alltraps>

801056c7 <vector120>:
801056c7:	6a 00                	push   $0x0
801056c9:	6a 78                	push   $0x78
801056cb:	e9 9d f7 ff ff       	jmp    80104e6d <alltraps>

801056d0 <vector121>:
801056d0:	6a 00                	push   $0x0
801056d2:	6a 79                	push   $0x79
801056d4:	e9 94 f7 ff ff       	jmp    80104e6d <alltraps>

801056d9 <vector122>:
801056d9:	6a 00                	push   $0x0
801056db:	6a 7a                	push   $0x7a
801056dd:	e9 8b f7 ff ff       	jmp    80104e6d <alltraps>

801056e2 <vector123>:
801056e2:	6a 00                	push   $0x0
801056e4:	6a 7b                	push   $0x7b
801056e6:	e9 82 f7 ff ff       	jmp    80104e6d <alltraps>

801056eb <vector124>:
801056eb:	6a 00                	push   $0x0
801056ed:	6a 7c                	push   $0x7c
801056ef:	e9 79 f7 ff ff       	jmp    80104e6d <alltraps>

801056f4 <vector125>:
801056f4:	6a 00                	push   $0x0
801056f6:	6a 7d                	push   $0x7d
801056f8:	e9 70 f7 ff ff       	jmp    80104e6d <alltraps>

801056fd <vector126>:
801056fd:	6a 00                	push   $0x0
801056ff:	6a 7e                	push   $0x7e
80105701:	e9 67 f7 ff ff       	jmp    80104e6d <alltraps>

80105706 <vector127>:
80105706:	6a 00                	push   $0x0
80105708:	6a 7f                	push   $0x7f
8010570a:	e9 5e f7 ff ff       	jmp    80104e6d <alltraps>

8010570f <vector128>:
8010570f:	6a 00                	push   $0x0
80105711:	68 80 00 00 00       	push   $0x80
80105716:	e9 52 f7 ff ff       	jmp    80104e6d <alltraps>

8010571b <vector129>:
8010571b:	6a 00                	push   $0x0
8010571d:	68 81 00 00 00       	push   $0x81
80105722:	e9 46 f7 ff ff       	jmp    80104e6d <alltraps>

80105727 <vector130>:
80105727:	6a 00                	push   $0x0
80105729:	68 82 00 00 00       	push   $0x82
8010572e:	e9 3a f7 ff ff       	jmp    80104e6d <alltraps>

80105733 <vector131>:
80105733:	6a 00                	push   $0x0
80105735:	68 83 00 00 00       	push   $0x83
8010573a:	e9 2e f7 ff ff       	jmp    80104e6d <alltraps>

8010573f <vector132>:
8010573f:	6a 00                	push   $0x0
80105741:	68 84 00 00 00       	push   $0x84
80105746:	e9 22 f7 ff ff       	jmp    80104e6d <alltraps>

8010574b <vector133>:
8010574b:	6a 00                	push   $0x0
8010574d:	68 85 00 00 00       	push   $0x85
80105752:	e9 16 f7 ff ff       	jmp    80104e6d <alltraps>

80105757 <vector134>:
80105757:	6a 00                	push   $0x0
80105759:	68 86 00 00 00       	push   $0x86
8010575e:	e9 0a f7 ff ff       	jmp    80104e6d <alltraps>

80105763 <vector135>:
80105763:	6a 00                	push   $0x0
80105765:	68 87 00 00 00       	push   $0x87
8010576a:	e9 fe f6 ff ff       	jmp    80104e6d <alltraps>

8010576f <vector136>:
8010576f:	6a 00                	push   $0x0
80105771:	68 88 00 00 00       	push   $0x88
80105776:	e9 f2 f6 ff ff       	jmp    80104e6d <alltraps>

8010577b <vector137>:
8010577b:	6a 00                	push   $0x0
8010577d:	68 89 00 00 00       	push   $0x89
80105782:	e9 e6 f6 ff ff       	jmp    80104e6d <alltraps>

80105787 <vector138>:
80105787:	6a 00                	push   $0x0
80105789:	68 8a 00 00 00       	push   $0x8a
8010578e:	e9 da f6 ff ff       	jmp    80104e6d <alltraps>

80105793 <vector139>:
80105793:	6a 00                	push   $0x0
80105795:	68 8b 00 00 00       	push   $0x8b
8010579a:	e9 ce f6 ff ff       	jmp    80104e6d <alltraps>

8010579f <vector140>:
8010579f:	6a 00                	push   $0x0
801057a1:	68 8c 00 00 00       	push   $0x8c
801057a6:	e9 c2 f6 ff ff       	jmp    80104e6d <alltraps>

801057ab <vector141>:
801057ab:	6a 00                	push   $0x0
801057ad:	68 8d 00 00 00       	push   $0x8d
801057b2:	e9 b6 f6 ff ff       	jmp    80104e6d <alltraps>

801057b7 <vector142>:
801057b7:	6a 00                	push   $0x0
801057b9:	68 8e 00 00 00       	push   $0x8e
801057be:	e9 aa f6 ff ff       	jmp    80104e6d <alltraps>

801057c3 <vector143>:
801057c3:	6a 00                	push   $0x0
801057c5:	68 8f 00 00 00       	push   $0x8f
801057ca:	e9 9e f6 ff ff       	jmp    80104e6d <alltraps>

801057cf <vector144>:
801057cf:	6a 00                	push   $0x0
801057d1:	68 90 00 00 00       	push   $0x90
801057d6:	e9 92 f6 ff ff       	jmp    80104e6d <alltraps>

801057db <vector145>:
801057db:	6a 00                	push   $0x0
801057dd:	68 91 00 00 00       	push   $0x91
801057e2:	e9 86 f6 ff ff       	jmp    80104e6d <alltraps>

801057e7 <vector146>:
801057e7:	6a 00                	push   $0x0
801057e9:	68 92 00 00 00       	push   $0x92
801057ee:	e9 7a f6 ff ff       	jmp    80104e6d <alltraps>

801057f3 <vector147>:
801057f3:	6a 00                	push   $0x0
801057f5:	68 93 00 00 00       	push   $0x93
801057fa:	e9 6e f6 ff ff       	jmp    80104e6d <alltraps>

801057ff <vector148>:
801057ff:	6a 00                	push   $0x0
80105801:	68 94 00 00 00       	push   $0x94
80105806:	e9 62 f6 ff ff       	jmp    80104e6d <alltraps>

8010580b <vector149>:
8010580b:	6a 00                	push   $0x0
8010580d:	68 95 00 00 00       	push   $0x95
80105812:	e9 56 f6 ff ff       	jmp    80104e6d <alltraps>

80105817 <vector150>:
80105817:	6a 00                	push   $0x0
80105819:	68 96 00 00 00       	push   $0x96
8010581e:	e9 4a f6 ff ff       	jmp    80104e6d <alltraps>

80105823 <vector151>:
80105823:	6a 00                	push   $0x0
80105825:	68 97 00 00 00       	push   $0x97
8010582a:	e9 3e f6 ff ff       	jmp    80104e6d <alltraps>

8010582f <vector152>:
8010582f:	6a 00                	push   $0x0
80105831:	68 98 00 00 00       	push   $0x98
80105836:	e9 32 f6 ff ff       	jmp    80104e6d <alltraps>

8010583b <vector153>:
8010583b:	6a 00                	push   $0x0
8010583d:	68 99 00 00 00       	push   $0x99
80105842:	e9 26 f6 ff ff       	jmp    80104e6d <alltraps>

80105847 <vector154>:
80105847:	6a 00                	push   $0x0
80105849:	68 9a 00 00 00       	push   $0x9a
8010584e:	e9 1a f6 ff ff       	jmp    80104e6d <alltraps>

80105853 <vector155>:
80105853:	6a 00                	push   $0x0
80105855:	68 9b 00 00 00       	push   $0x9b
8010585a:	e9 0e f6 ff ff       	jmp    80104e6d <alltraps>

8010585f <vector156>:
8010585f:	6a 00                	push   $0x0
80105861:	68 9c 00 00 00       	push   $0x9c
80105866:	e9 02 f6 ff ff       	jmp    80104e6d <alltraps>

8010586b <vector157>:
8010586b:	6a 00                	push   $0x0
8010586d:	68 9d 00 00 00       	push   $0x9d
80105872:	e9 f6 f5 ff ff       	jmp    80104e6d <alltraps>

80105877 <vector158>:
80105877:	6a 00                	push   $0x0
80105879:	68 9e 00 00 00       	push   $0x9e
8010587e:	e9 ea f5 ff ff       	jmp    80104e6d <alltraps>

80105883 <vector159>:
80105883:	6a 00                	push   $0x0
80105885:	68 9f 00 00 00       	push   $0x9f
8010588a:	e9 de f5 ff ff       	jmp    80104e6d <alltraps>

8010588f <vector160>:
8010588f:	6a 00                	push   $0x0
80105891:	68 a0 00 00 00       	push   $0xa0
80105896:	e9 d2 f5 ff ff       	jmp    80104e6d <alltraps>

8010589b <vector161>:
8010589b:	6a 00                	push   $0x0
8010589d:	68 a1 00 00 00       	push   $0xa1
801058a2:	e9 c6 f5 ff ff       	jmp    80104e6d <alltraps>

801058a7 <vector162>:
801058a7:	6a 00                	push   $0x0
801058a9:	68 a2 00 00 00       	push   $0xa2
801058ae:	e9 ba f5 ff ff       	jmp    80104e6d <alltraps>

801058b3 <vector163>:
801058b3:	6a 00                	push   $0x0
801058b5:	68 a3 00 00 00       	push   $0xa3
801058ba:	e9 ae f5 ff ff       	jmp    80104e6d <alltraps>

801058bf <vector164>:
801058bf:	6a 00                	push   $0x0
801058c1:	68 a4 00 00 00       	push   $0xa4
801058c6:	e9 a2 f5 ff ff       	jmp    80104e6d <alltraps>

801058cb <vector165>:
801058cb:	6a 00                	push   $0x0
801058cd:	68 a5 00 00 00       	push   $0xa5
801058d2:	e9 96 f5 ff ff       	jmp    80104e6d <alltraps>

801058d7 <vector166>:
801058d7:	6a 00                	push   $0x0
801058d9:	68 a6 00 00 00       	push   $0xa6
801058de:	e9 8a f5 ff ff       	jmp    80104e6d <alltraps>

801058e3 <vector167>:
801058e3:	6a 00                	push   $0x0
801058e5:	68 a7 00 00 00       	push   $0xa7
801058ea:	e9 7e f5 ff ff       	jmp    80104e6d <alltraps>

801058ef <vector168>:
801058ef:	6a 00                	push   $0x0
801058f1:	68 a8 00 00 00       	push   $0xa8
801058f6:	e9 72 f5 ff ff       	jmp    80104e6d <alltraps>

801058fb <vector169>:
801058fb:	6a 00                	push   $0x0
801058fd:	68 a9 00 00 00       	push   $0xa9
80105902:	e9 66 f5 ff ff       	jmp    80104e6d <alltraps>

80105907 <vector170>:
80105907:	6a 00                	push   $0x0
80105909:	68 aa 00 00 00       	push   $0xaa
8010590e:	e9 5a f5 ff ff       	jmp    80104e6d <alltraps>

80105913 <vector171>:
80105913:	6a 00                	push   $0x0
80105915:	68 ab 00 00 00       	push   $0xab
8010591a:	e9 4e f5 ff ff       	jmp    80104e6d <alltraps>

8010591f <vector172>:
8010591f:	6a 00                	push   $0x0
80105921:	68 ac 00 00 00       	push   $0xac
80105926:	e9 42 f5 ff ff       	jmp    80104e6d <alltraps>

8010592b <vector173>:
8010592b:	6a 00                	push   $0x0
8010592d:	68 ad 00 00 00       	push   $0xad
80105932:	e9 36 f5 ff ff       	jmp    80104e6d <alltraps>

80105937 <vector174>:
80105937:	6a 00                	push   $0x0
80105939:	68 ae 00 00 00       	push   $0xae
8010593e:	e9 2a f5 ff ff       	jmp    80104e6d <alltraps>

80105943 <vector175>:
80105943:	6a 00                	push   $0x0
80105945:	68 af 00 00 00       	push   $0xaf
8010594a:	e9 1e f5 ff ff       	jmp    80104e6d <alltraps>

8010594f <vector176>:
8010594f:	6a 00                	push   $0x0
80105951:	68 b0 00 00 00       	push   $0xb0
80105956:	e9 12 f5 ff ff       	jmp    80104e6d <alltraps>

8010595b <vector177>:
8010595b:	6a 00                	push   $0x0
8010595d:	68 b1 00 00 00       	push   $0xb1
80105962:	e9 06 f5 ff ff       	jmp    80104e6d <alltraps>

80105967 <vector178>:
80105967:	6a 00                	push   $0x0
80105969:	68 b2 00 00 00       	push   $0xb2
8010596e:	e9 fa f4 ff ff       	jmp    80104e6d <alltraps>

80105973 <vector179>:
80105973:	6a 00                	push   $0x0
80105975:	68 b3 00 00 00       	push   $0xb3
8010597a:	e9 ee f4 ff ff       	jmp    80104e6d <alltraps>

8010597f <vector180>:
8010597f:	6a 00                	push   $0x0
80105981:	68 b4 00 00 00       	push   $0xb4
80105986:	e9 e2 f4 ff ff       	jmp    80104e6d <alltraps>

8010598b <vector181>:
8010598b:	6a 00                	push   $0x0
8010598d:	68 b5 00 00 00       	push   $0xb5
80105992:	e9 d6 f4 ff ff       	jmp    80104e6d <alltraps>

80105997 <vector182>:
80105997:	6a 00                	push   $0x0
80105999:	68 b6 00 00 00       	push   $0xb6
8010599e:	e9 ca f4 ff ff       	jmp    80104e6d <alltraps>

801059a3 <vector183>:
801059a3:	6a 00                	push   $0x0
801059a5:	68 b7 00 00 00       	push   $0xb7
801059aa:	e9 be f4 ff ff       	jmp    80104e6d <alltraps>

801059af <vector184>:
801059af:	6a 00                	push   $0x0
801059b1:	68 b8 00 00 00       	push   $0xb8
801059b6:	e9 b2 f4 ff ff       	jmp    80104e6d <alltraps>

801059bb <vector185>:
801059bb:	6a 00                	push   $0x0
801059bd:	68 b9 00 00 00       	push   $0xb9
801059c2:	e9 a6 f4 ff ff       	jmp    80104e6d <alltraps>

801059c7 <vector186>:
801059c7:	6a 00                	push   $0x0
801059c9:	68 ba 00 00 00       	push   $0xba
801059ce:	e9 9a f4 ff ff       	jmp    80104e6d <alltraps>

801059d3 <vector187>:
801059d3:	6a 00                	push   $0x0
801059d5:	68 bb 00 00 00       	push   $0xbb
801059da:	e9 8e f4 ff ff       	jmp    80104e6d <alltraps>

801059df <vector188>:
801059df:	6a 00                	push   $0x0
801059e1:	68 bc 00 00 00       	push   $0xbc
801059e6:	e9 82 f4 ff ff       	jmp    80104e6d <alltraps>

801059eb <vector189>:
801059eb:	6a 00                	push   $0x0
801059ed:	68 bd 00 00 00       	push   $0xbd
801059f2:	e9 76 f4 ff ff       	jmp    80104e6d <alltraps>

801059f7 <vector190>:
801059f7:	6a 00                	push   $0x0
801059f9:	68 be 00 00 00       	push   $0xbe
801059fe:	e9 6a f4 ff ff       	jmp    80104e6d <alltraps>

80105a03 <vector191>:
80105a03:	6a 00                	push   $0x0
80105a05:	68 bf 00 00 00       	push   $0xbf
80105a0a:	e9 5e f4 ff ff       	jmp    80104e6d <alltraps>

80105a0f <vector192>:
80105a0f:	6a 00                	push   $0x0
80105a11:	68 c0 00 00 00       	push   $0xc0
80105a16:	e9 52 f4 ff ff       	jmp    80104e6d <alltraps>

80105a1b <vector193>:
80105a1b:	6a 00                	push   $0x0
80105a1d:	68 c1 00 00 00       	push   $0xc1
80105a22:	e9 46 f4 ff ff       	jmp    80104e6d <alltraps>

80105a27 <vector194>:
80105a27:	6a 00                	push   $0x0
80105a29:	68 c2 00 00 00       	push   $0xc2
80105a2e:	e9 3a f4 ff ff       	jmp    80104e6d <alltraps>

80105a33 <vector195>:
80105a33:	6a 00                	push   $0x0
80105a35:	68 c3 00 00 00       	push   $0xc3
80105a3a:	e9 2e f4 ff ff       	jmp    80104e6d <alltraps>

80105a3f <vector196>:
80105a3f:	6a 00                	push   $0x0
80105a41:	68 c4 00 00 00       	push   $0xc4
80105a46:	e9 22 f4 ff ff       	jmp    80104e6d <alltraps>

80105a4b <vector197>:
80105a4b:	6a 00                	push   $0x0
80105a4d:	68 c5 00 00 00       	push   $0xc5
80105a52:	e9 16 f4 ff ff       	jmp    80104e6d <alltraps>

80105a57 <vector198>:
80105a57:	6a 00                	push   $0x0
80105a59:	68 c6 00 00 00       	push   $0xc6
80105a5e:	e9 0a f4 ff ff       	jmp    80104e6d <alltraps>

80105a63 <vector199>:
80105a63:	6a 00                	push   $0x0
80105a65:	68 c7 00 00 00       	push   $0xc7
80105a6a:	e9 fe f3 ff ff       	jmp    80104e6d <alltraps>

80105a6f <vector200>:
80105a6f:	6a 00                	push   $0x0
80105a71:	68 c8 00 00 00       	push   $0xc8
80105a76:	e9 f2 f3 ff ff       	jmp    80104e6d <alltraps>

80105a7b <vector201>:
80105a7b:	6a 00                	push   $0x0
80105a7d:	68 c9 00 00 00       	push   $0xc9
80105a82:	e9 e6 f3 ff ff       	jmp    80104e6d <alltraps>

80105a87 <vector202>:
80105a87:	6a 00                	push   $0x0
80105a89:	68 ca 00 00 00       	push   $0xca
80105a8e:	e9 da f3 ff ff       	jmp    80104e6d <alltraps>

80105a93 <vector203>:
80105a93:	6a 00                	push   $0x0
80105a95:	68 cb 00 00 00       	push   $0xcb
80105a9a:	e9 ce f3 ff ff       	jmp    80104e6d <alltraps>

80105a9f <vector204>:
80105a9f:	6a 00                	push   $0x0
80105aa1:	68 cc 00 00 00       	push   $0xcc
80105aa6:	e9 c2 f3 ff ff       	jmp    80104e6d <alltraps>

80105aab <vector205>:
80105aab:	6a 00                	push   $0x0
80105aad:	68 cd 00 00 00       	push   $0xcd
80105ab2:	e9 b6 f3 ff ff       	jmp    80104e6d <alltraps>

80105ab7 <vector206>:
80105ab7:	6a 00                	push   $0x0
80105ab9:	68 ce 00 00 00       	push   $0xce
80105abe:	e9 aa f3 ff ff       	jmp    80104e6d <alltraps>

80105ac3 <vector207>:
80105ac3:	6a 00                	push   $0x0
80105ac5:	68 cf 00 00 00       	push   $0xcf
80105aca:	e9 9e f3 ff ff       	jmp    80104e6d <alltraps>

80105acf <vector208>:
80105acf:	6a 00                	push   $0x0
80105ad1:	68 d0 00 00 00       	push   $0xd0
80105ad6:	e9 92 f3 ff ff       	jmp    80104e6d <alltraps>

80105adb <vector209>:
80105adb:	6a 00                	push   $0x0
80105add:	68 d1 00 00 00       	push   $0xd1
80105ae2:	e9 86 f3 ff ff       	jmp    80104e6d <alltraps>

80105ae7 <vector210>:
80105ae7:	6a 00                	push   $0x0
80105ae9:	68 d2 00 00 00       	push   $0xd2
80105aee:	e9 7a f3 ff ff       	jmp    80104e6d <alltraps>

80105af3 <vector211>:
80105af3:	6a 00                	push   $0x0
80105af5:	68 d3 00 00 00       	push   $0xd3
80105afa:	e9 6e f3 ff ff       	jmp    80104e6d <alltraps>

80105aff <vector212>:
80105aff:	6a 00                	push   $0x0
80105b01:	68 d4 00 00 00       	push   $0xd4
80105b06:	e9 62 f3 ff ff       	jmp    80104e6d <alltraps>

80105b0b <vector213>:
80105b0b:	6a 00                	push   $0x0
80105b0d:	68 d5 00 00 00       	push   $0xd5
80105b12:	e9 56 f3 ff ff       	jmp    80104e6d <alltraps>

80105b17 <vector214>:
80105b17:	6a 00                	push   $0x0
80105b19:	68 d6 00 00 00       	push   $0xd6
80105b1e:	e9 4a f3 ff ff       	jmp    80104e6d <alltraps>

80105b23 <vector215>:
80105b23:	6a 00                	push   $0x0
80105b25:	68 d7 00 00 00       	push   $0xd7
80105b2a:	e9 3e f3 ff ff       	jmp    80104e6d <alltraps>

80105b2f <vector216>:
80105b2f:	6a 00                	push   $0x0
80105b31:	68 d8 00 00 00       	push   $0xd8
80105b36:	e9 32 f3 ff ff       	jmp    80104e6d <alltraps>

80105b3b <vector217>:
80105b3b:	6a 00                	push   $0x0
80105b3d:	68 d9 00 00 00       	push   $0xd9
80105b42:	e9 26 f3 ff ff       	jmp    80104e6d <alltraps>

80105b47 <vector218>:
80105b47:	6a 00                	push   $0x0
80105b49:	68 da 00 00 00       	push   $0xda
80105b4e:	e9 1a f3 ff ff       	jmp    80104e6d <alltraps>

80105b53 <vector219>:
80105b53:	6a 00                	push   $0x0
80105b55:	68 db 00 00 00       	push   $0xdb
80105b5a:	e9 0e f3 ff ff       	jmp    80104e6d <alltraps>

80105b5f <vector220>:
80105b5f:	6a 00                	push   $0x0
80105b61:	68 dc 00 00 00       	push   $0xdc
80105b66:	e9 02 f3 ff ff       	jmp    80104e6d <alltraps>

80105b6b <vector221>:
80105b6b:	6a 00                	push   $0x0
80105b6d:	68 dd 00 00 00       	push   $0xdd
80105b72:	e9 f6 f2 ff ff       	jmp    80104e6d <alltraps>

80105b77 <vector222>:
80105b77:	6a 00                	push   $0x0
80105b79:	68 de 00 00 00       	push   $0xde
80105b7e:	e9 ea f2 ff ff       	jmp    80104e6d <alltraps>

80105b83 <vector223>:
80105b83:	6a 00                	push   $0x0
80105b85:	68 df 00 00 00       	push   $0xdf
80105b8a:	e9 de f2 ff ff       	jmp    80104e6d <alltraps>

80105b8f <vector224>:
80105b8f:	6a 00                	push   $0x0
80105b91:	68 e0 00 00 00       	push   $0xe0
80105b96:	e9 d2 f2 ff ff       	jmp    80104e6d <alltraps>

80105b9b <vector225>:
80105b9b:	6a 00                	push   $0x0
80105b9d:	68 e1 00 00 00       	push   $0xe1
80105ba2:	e9 c6 f2 ff ff       	jmp    80104e6d <alltraps>

80105ba7 <vector226>:
80105ba7:	6a 00                	push   $0x0
80105ba9:	68 e2 00 00 00       	push   $0xe2
80105bae:	e9 ba f2 ff ff       	jmp    80104e6d <alltraps>

80105bb3 <vector227>:
80105bb3:	6a 00                	push   $0x0
80105bb5:	68 e3 00 00 00       	push   $0xe3
80105bba:	e9 ae f2 ff ff       	jmp    80104e6d <alltraps>

80105bbf <vector228>:
80105bbf:	6a 00                	push   $0x0
80105bc1:	68 e4 00 00 00       	push   $0xe4
80105bc6:	e9 a2 f2 ff ff       	jmp    80104e6d <alltraps>

80105bcb <vector229>:
80105bcb:	6a 00                	push   $0x0
80105bcd:	68 e5 00 00 00       	push   $0xe5
80105bd2:	e9 96 f2 ff ff       	jmp    80104e6d <alltraps>

80105bd7 <vector230>:
80105bd7:	6a 00                	push   $0x0
80105bd9:	68 e6 00 00 00       	push   $0xe6
80105bde:	e9 8a f2 ff ff       	jmp    80104e6d <alltraps>

80105be3 <vector231>:
80105be3:	6a 00                	push   $0x0
80105be5:	68 e7 00 00 00       	push   $0xe7
80105bea:	e9 7e f2 ff ff       	jmp    80104e6d <alltraps>

80105bef <vector232>:
80105bef:	6a 00                	push   $0x0
80105bf1:	68 e8 00 00 00       	push   $0xe8
80105bf6:	e9 72 f2 ff ff       	jmp    80104e6d <alltraps>

80105bfb <vector233>:
80105bfb:	6a 00                	push   $0x0
80105bfd:	68 e9 00 00 00       	push   $0xe9
80105c02:	e9 66 f2 ff ff       	jmp    80104e6d <alltraps>

80105c07 <vector234>:
80105c07:	6a 00                	push   $0x0
80105c09:	68 ea 00 00 00       	push   $0xea
80105c0e:	e9 5a f2 ff ff       	jmp    80104e6d <alltraps>

80105c13 <vector235>:
80105c13:	6a 00                	push   $0x0
80105c15:	68 eb 00 00 00       	push   $0xeb
80105c1a:	e9 4e f2 ff ff       	jmp    80104e6d <alltraps>

80105c1f <vector236>:
80105c1f:	6a 00                	push   $0x0
80105c21:	68 ec 00 00 00       	push   $0xec
80105c26:	e9 42 f2 ff ff       	jmp    80104e6d <alltraps>

80105c2b <vector237>:
80105c2b:	6a 00                	push   $0x0
80105c2d:	68 ed 00 00 00       	push   $0xed
80105c32:	e9 36 f2 ff ff       	jmp    80104e6d <alltraps>

80105c37 <vector238>:
80105c37:	6a 00                	push   $0x0
80105c39:	68 ee 00 00 00       	push   $0xee
80105c3e:	e9 2a f2 ff ff       	jmp    80104e6d <alltraps>

80105c43 <vector239>:
80105c43:	6a 00                	push   $0x0
80105c45:	68 ef 00 00 00       	push   $0xef
80105c4a:	e9 1e f2 ff ff       	jmp    80104e6d <alltraps>

80105c4f <vector240>:
80105c4f:	6a 00                	push   $0x0
80105c51:	68 f0 00 00 00       	push   $0xf0
80105c56:	e9 12 f2 ff ff       	jmp    80104e6d <alltraps>

80105c5b <vector241>:
80105c5b:	6a 00                	push   $0x0
80105c5d:	68 f1 00 00 00       	push   $0xf1
80105c62:	e9 06 f2 ff ff       	jmp    80104e6d <alltraps>

80105c67 <vector242>:
80105c67:	6a 00                	push   $0x0
80105c69:	68 f2 00 00 00       	push   $0xf2
80105c6e:	e9 fa f1 ff ff       	jmp    80104e6d <alltraps>

80105c73 <vector243>:
80105c73:	6a 00                	push   $0x0
80105c75:	68 f3 00 00 00       	push   $0xf3
80105c7a:	e9 ee f1 ff ff       	jmp    80104e6d <alltraps>

80105c7f <vector244>:
80105c7f:	6a 00                	push   $0x0
80105c81:	68 f4 00 00 00       	push   $0xf4
80105c86:	e9 e2 f1 ff ff       	jmp    80104e6d <alltraps>

80105c8b <vector245>:
80105c8b:	6a 00                	push   $0x0
80105c8d:	68 f5 00 00 00       	push   $0xf5
80105c92:	e9 d6 f1 ff ff       	jmp    80104e6d <alltraps>

80105c97 <vector246>:
80105c97:	6a 00                	push   $0x0
80105c99:	68 f6 00 00 00       	push   $0xf6
80105c9e:	e9 ca f1 ff ff       	jmp    80104e6d <alltraps>

80105ca3 <vector247>:
80105ca3:	6a 00                	push   $0x0
80105ca5:	68 f7 00 00 00       	push   $0xf7
80105caa:	e9 be f1 ff ff       	jmp    80104e6d <alltraps>

80105caf <vector248>:
80105caf:	6a 00                	push   $0x0
80105cb1:	68 f8 00 00 00       	push   $0xf8
80105cb6:	e9 b2 f1 ff ff       	jmp    80104e6d <alltraps>

80105cbb <vector249>:
80105cbb:	6a 00                	push   $0x0
80105cbd:	68 f9 00 00 00       	push   $0xf9
80105cc2:	e9 a6 f1 ff ff       	jmp    80104e6d <alltraps>

80105cc7 <vector250>:
80105cc7:	6a 00                	push   $0x0
80105cc9:	68 fa 00 00 00       	push   $0xfa
80105cce:	e9 9a f1 ff ff       	jmp    80104e6d <alltraps>

80105cd3 <vector251>:
80105cd3:	6a 00                	push   $0x0
80105cd5:	68 fb 00 00 00       	push   $0xfb
80105cda:	e9 8e f1 ff ff       	jmp    80104e6d <alltraps>

80105cdf <vector252>:
80105cdf:	6a 00                	push   $0x0
80105ce1:	68 fc 00 00 00       	push   $0xfc
80105ce6:	e9 82 f1 ff ff       	jmp    80104e6d <alltraps>

80105ceb <vector253>:
80105ceb:	6a 00                	push   $0x0
80105ced:	68 fd 00 00 00       	push   $0xfd
80105cf2:	e9 76 f1 ff ff       	jmp    80104e6d <alltraps>

80105cf7 <vector254>:
80105cf7:	6a 00                	push   $0x0
80105cf9:	68 fe 00 00 00       	push   $0xfe
80105cfe:	e9 6a f1 ff ff       	jmp    80104e6d <alltraps>

80105d03 <vector255>:
80105d03:	6a 00                	push   $0x0
80105d05:	68 ff 00 00 00       	push   $0xff
80105d0a:	e9 5e f1 ff ff       	jmp    80104e6d <alltraps>
80105d0f:	90                   	nop

80105d10 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80105d10:	55                   	push   %ebp
80105d11:	89 e5                	mov    %esp,%ebp
80105d13:	57                   	push   %edi
80105d14:	56                   	push   %esi
80105d15:	53                   	push   %ebx
80105d16:	83 ec 0c             	sub    $0xc,%esp
80105d19:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80105d1b:	c1 ea 16             	shr    $0x16,%edx
80105d1e:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  if(*pde & PTE_P){
80105d21:	8b 1f                	mov    (%edi),%ebx
80105d23:	f6 c3 01             	test   $0x1,%bl
80105d26:	74 20                	je     80105d48 <walkpgdir+0x38>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80105d28:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105d2e:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80105d34:	89 f0                	mov    %esi,%eax
80105d36:	c1 e8 0a             	shr    $0xa,%eax
80105d39:	25 fc 0f 00 00       	and    $0xffc,%eax
80105d3e:	01 d8                	add    %ebx,%eax
}
80105d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d43:	5b                   	pop    %ebx
80105d44:	5e                   	pop    %esi
80105d45:	5f                   	pop    %edi
80105d46:	5d                   	pop    %ebp
80105d47:	c3                   	ret    
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80105d48:	85 c9                	test   %ecx,%ecx
80105d4a:	74 2c                	je     80105d78 <walkpgdir+0x68>
80105d4c:	e8 e3 c4 ff ff       	call   80102234 <kalloc>
80105d51:	89 c3                	mov    %eax,%ebx
80105d53:	85 c0                	test   %eax,%eax
80105d55:	74 21                	je     80105d78 <walkpgdir+0x68>
    memset(pgtab, 0, PGSIZE);
80105d57:	50                   	push   %eax
80105d58:	68 00 10 00 00       	push   $0x1000
80105d5d:	6a 00                	push   $0x0
80105d5f:	53                   	push   %ebx
80105d60:	e8 87 e1 ff ff       	call   80103eec <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80105d65:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80105d6b:	83 c8 07             	or     $0x7,%eax
80105d6e:	89 07                	mov    %eax,(%edi)
80105d70:	83 c4 10             	add    $0x10,%esp
80105d73:	eb bf                	jmp    80105d34 <walkpgdir+0x24>
80105d75:	8d 76 00             	lea    0x0(%esi),%esi
      return 0;
80105d78:	31 c0                	xor    %eax,%eax
}
80105d7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d7d:	5b                   	pop    %ebx
80105d7e:	5e                   	pop    %esi
80105d7f:	5f                   	pop    %edi
80105d80:	5d                   	pop    %ebp
80105d81:	c3                   	ret    
80105d82:	66 90                	xchg   %ax,%ax

80105d84 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80105d84:	55                   	push   %ebp
80105d85:	89 e5                	mov    %esp,%ebp
80105d87:	57                   	push   %edi
80105d88:	56                   	push   %esi
80105d89:	53                   	push   %ebx
80105d8a:	83 ec 1c             	sub    $0x1c,%esp
80105d8d:	89 c7                	mov    %eax,%edi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80105d8f:	89 d6                	mov    %edx,%esi
80105d91:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80105d97:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80105d9b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80105da0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105da3:	8b 45 08             	mov    0x8(%ebp),%eax
80105da6:	29 f0                	sub    %esi,%eax
80105da8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105dab:	eb 1b                	jmp    80105dc8 <mappages+0x44>
80105dad:	8d 76 00             	lea    0x0(%esi),%esi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80105db0:	f6 00 01             	testb  $0x1,(%eax)
80105db3:	75 45                	jne    80105dfa <mappages+0x76>
      panic("remap");
    *pte = pa | perm | PTE_P;
80105db5:	0b 5d 0c             	or     0xc(%ebp),%ebx
80105db8:	83 cb 01             	or     $0x1,%ebx
80105dbb:	89 18                	mov    %ebx,(%eax)
    if(a == last)
80105dbd:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80105dc0:	74 2e                	je     80105df0 <mappages+0x6c>
      break;
    a += PGSIZE;
80105dc2:	81 c6 00 10 00 00    	add    $0x1000,%esi
  for(;;){
80105dc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105dcb:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105dce:	b9 01 00 00 00       	mov    $0x1,%ecx
80105dd3:	89 f2                	mov    %esi,%edx
80105dd5:	89 f8                	mov    %edi,%eax
80105dd7:	e8 34 ff ff ff       	call   80105d10 <walkpgdir>
80105ddc:	85 c0                	test   %eax,%eax
80105dde:	75 d0                	jne    80105db0 <mappages+0x2c>
      return -1;
80105de0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    pa += PGSIZE;
  }
  return 0;
}
80105de5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105de8:	5b                   	pop    %ebx
80105de9:	5e                   	pop    %esi
80105dea:	5f                   	pop    %edi
80105deb:	5d                   	pop    %ebp
80105dec:	c3                   	ret    
80105ded:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
80105df0:	31 c0                	xor    %eax,%eax
}
80105df2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105df5:	5b                   	pop    %ebx
80105df6:	5e                   	pop    %esi
80105df7:	5f                   	pop    %edi
80105df8:	5d                   	pop    %ebp
80105df9:	c3                   	ret    
      panic("remap");
80105dfa:	83 ec 0c             	sub    $0xc,%esp
80105dfd:	68 2c 6e 10 80       	push   $0x80106e2c
80105e02:	e8 39 a5 ff ff       	call   80100340 <panic>
80105e07:	90                   	nop

80105e08 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80105e08:	55                   	push   %ebp
80105e09:	89 e5                	mov    %esp,%ebp
80105e0b:	57                   	push   %edi
80105e0c:	56                   	push   %esi
80105e0d:	53                   	push   %ebx
80105e0e:	83 ec 1c             	sub    $0x1c,%esp
80105e11:	89 c6                	mov    %eax,%esi
80105e13:	89 d3                	mov    %edx,%ebx
80105e15:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80105e18:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
80105e1e:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; a  < oldsz; a += PGSIZE){
80105e24:	39 da                	cmp    %ebx,%edx
80105e26:	73 53                	jae    80105e7b <deallocuvm.part.0+0x73>
80105e28:	89 d7                	mov    %edx,%edi
80105e2a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80105e2d:	eb 0c                	jmp    80105e3b <deallocuvm.part.0+0x33>
80105e2f:	90                   	nop
80105e30:	81 c7 00 10 00 00    	add    $0x1000,%edi
80105e36:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80105e39:	76 40                	jbe    80105e7b <deallocuvm.part.0+0x73>
    pte = walkpgdir(pgdir, (char*)a, 0);
80105e3b:	31 c9                	xor    %ecx,%ecx
80105e3d:	89 fa                	mov    %edi,%edx
80105e3f:	89 f0                	mov    %esi,%eax
80105e41:	e8 ca fe ff ff       	call   80105d10 <walkpgdir>
80105e46:	89 c3                	mov    %eax,%ebx
    if(!pte)
80105e48:	85 c0                	test   %eax,%eax
80105e4a:	74 3c                	je     80105e88 <deallocuvm.part.0+0x80>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80105e4c:	8b 00                	mov    (%eax),%eax
80105e4e:	a8 01                	test   $0x1,%al
80105e50:	74 de                	je     80105e30 <deallocuvm.part.0+0x28>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80105e52:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80105e57:	74 3f                	je     80105e98 <deallocuvm.part.0+0x90>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80105e59:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80105e5c:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80105e61:	50                   	push   %eax
80105e62:	e8 3d c2 ff ff       	call   801020a4 <kfree>
      *pte = 0;
80105e67:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80105e6d:	81 c7 00 10 00 00    	add    $0x1000,%edi
80105e73:	83 c4 10             	add    $0x10,%esp
  for(; a  < oldsz; a += PGSIZE){
80105e76:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80105e79:	77 c0                	ja     80105e3b <deallocuvm.part.0+0x33>
    }
  }
  return newsz;
}
80105e7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105e7e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e81:	5b                   	pop    %ebx
80105e82:	5e                   	pop    %esi
80105e83:	5f                   	pop    %edi
80105e84:	5d                   	pop    %ebp
80105e85:	c3                   	ret    
80105e86:	66 90                	xchg   %ax,%ax
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80105e88:	89 fa                	mov    %edi,%edx
80105e8a:	81 e2 00 00 c0 ff    	and    $0xffc00000,%edx
80105e90:	8d ba 00 00 40 00    	lea    0x400000(%edx),%edi
80105e96:	eb 9e                	jmp    80105e36 <deallocuvm.part.0+0x2e>
        panic("kfree");
80105e98:	83 ec 0c             	sub    $0xc,%esp
80105e9b:	68 e6 67 10 80       	push   $0x801067e6
80105ea0:	e8 9b a4 ff ff       	call   80100340 <panic>
80105ea5:	8d 76 00             	lea    0x0(%esi),%esi

80105ea8 <seginit>:
{
80105ea8:	55                   	push   %ebp
80105ea9:	89 e5                	mov    %esp,%ebp
80105eab:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80105eae:	e8 79 d4 ff ff       	call   8010332c <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80105eb3:	8d 14 80             	lea    (%eax,%eax,4),%edx
80105eb6:	01 d2                	add    %edx,%edx
80105eb8:	01 d0                	add    %edx,%eax
80105eba:	c1 e0 04             	shl    $0x4,%eax
80105ebd:	c7 80 f8 17 11 80 ff 	movl   $0xffff,-0x7feee808(%eax)
80105ec4:	ff 00 00 
80105ec7:	c7 80 fc 17 11 80 00 	movl   $0xcf9a00,-0x7feee804(%eax)
80105ece:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80105ed1:	c7 80 00 18 11 80 ff 	movl   $0xffff,-0x7feee800(%eax)
80105ed8:	ff 00 00 
80105edb:	c7 80 04 18 11 80 00 	movl   $0xcf9200,-0x7feee7fc(%eax)
80105ee2:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80105ee5:	c7 80 08 18 11 80 ff 	movl   $0xffff,-0x7feee7f8(%eax)
80105eec:	ff 00 00 
80105eef:	c7 80 0c 18 11 80 00 	movl   $0xcffa00,-0x7feee7f4(%eax)
80105ef6:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80105ef9:	c7 80 10 18 11 80 ff 	movl   $0xffff,-0x7feee7f0(%eax)
80105f00:	ff 00 00 
80105f03:	c7 80 14 18 11 80 00 	movl   $0xcff200,-0x7feee7ec(%eax)
80105f0a:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80105f0d:	05 f0 17 11 80       	add    $0x801117f0,%eax
  pd[0] = size-1;
80105f12:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
  pd[1] = (uint)p;
80105f18:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80105f1c:	c1 e8 10             	shr    $0x10,%eax
80105f1f:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80105f23:	8d 45 f2             	lea    -0xe(%ebp),%eax
80105f26:	0f 01 10             	lgdtl  (%eax)
}
80105f29:	c9                   	leave  
80105f2a:	c3                   	ret    
80105f2b:	90                   	nop

80105f2c <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80105f2c:	a1 a4 45 11 80       	mov    0x801145a4,%eax
80105f31:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80105f36:	0f 22 d8             	mov    %eax,%cr3
}
80105f39:	c3                   	ret    
80105f3a:	66 90                	xchg   %ax,%ax

80105f3c <switchuvm>:
{
80105f3c:	55                   	push   %ebp
80105f3d:	89 e5                	mov    %esp,%ebp
80105f3f:	57                   	push   %edi
80105f40:	56                   	push   %esi
80105f41:	53                   	push   %ebx
80105f42:	83 ec 1c             	sub    $0x1c,%esp
80105f45:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80105f48:	85 f6                	test   %esi,%esi
80105f4a:	0f 84 bf 00 00 00    	je     8010600f <switchuvm+0xd3>
  if(p->kstack == 0)
80105f50:	8b 56 08             	mov    0x8(%esi),%edx
80105f53:	85 d2                	test   %edx,%edx
80105f55:	0f 84 ce 00 00 00    	je     80106029 <switchuvm+0xed>
  if(p->pgdir == 0)
80105f5b:	8b 46 04             	mov    0x4(%esi),%eax
80105f5e:	85 c0                	test   %eax,%eax
80105f60:	0f 84 b6 00 00 00    	je     8010601c <switchuvm+0xe0>
  pushcli();
80105f66:	e8 c5 dd ff ff       	call   80103d30 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80105f6b:	e8 58 d3 ff ff       	call   801032c8 <mycpu>
80105f70:	89 c3                	mov    %eax,%ebx
80105f72:	e8 51 d3 ff ff       	call   801032c8 <mycpu>
80105f77:	89 c7                	mov    %eax,%edi
80105f79:	e8 4a d3 ff ff       	call   801032c8 <mycpu>
80105f7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105f81:	e8 42 d3 ff ff       	call   801032c8 <mycpu>
80105f86:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80105f8d:	67 00 
80105f8f:	83 c7 08             	add    $0x8,%edi
80105f92:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80105f99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105f9c:	83 c1 08             	add    $0x8,%ecx
80105f9f:	c1 e9 10             	shr    $0x10,%ecx
80105fa2:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80105fa8:	66 c7 83 9d 00 00 00 	movw   $0x4099,0x9d(%ebx)
80105faf:	99 40 
80105fb1:	83 c0 08             	add    $0x8,%eax
80105fb4:	c1 e8 18             	shr    $0x18,%eax
80105fb7:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
80105fbd:	e8 06 d3 ff ff       	call   801032c8 <mycpu>
80105fc2:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80105fc9:	e8 fa d2 ff ff       	call   801032c8 <mycpu>
80105fce:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80105fd4:	8b 5e 08             	mov    0x8(%esi),%ebx
80105fd7:	e8 ec d2 ff ff       	call   801032c8 <mycpu>
80105fdc:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80105fe2:	89 58 0c             	mov    %ebx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80105fe5:	e8 de d2 ff ff       	call   801032c8 <mycpu>
80105fea:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80105ff0:	b8 28 00 00 00       	mov    $0x28,%eax
80105ff5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80105ff8:	8b 46 04             	mov    0x4(%esi),%eax
80105ffb:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106000:	0f 22 d8             	mov    %eax,%cr3
}
80106003:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106006:	5b                   	pop    %ebx
80106007:	5e                   	pop    %esi
80106008:	5f                   	pop    %edi
80106009:	5d                   	pop    %ebp
  popcli();
8010600a:	e9 69 dd ff ff       	jmp    80103d78 <popcli>
    panic("switchuvm: no process");
8010600f:	83 ec 0c             	sub    $0xc,%esp
80106012:	68 32 6e 10 80       	push   $0x80106e32
80106017:	e8 24 a3 ff ff       	call   80100340 <panic>
    panic("switchuvm: no pgdir");
8010601c:	83 ec 0c             	sub    $0xc,%esp
8010601f:	68 5d 6e 10 80       	push   $0x80106e5d
80106024:	e8 17 a3 ff ff       	call   80100340 <panic>
    panic("switchuvm: no kstack");
80106029:	83 ec 0c             	sub    $0xc,%esp
8010602c:	68 48 6e 10 80       	push   $0x80106e48
80106031:	e8 0a a3 ff ff       	call   80100340 <panic>
80106036:	66 90                	xchg   %ax,%ax

80106038 <inituvm>:
{
80106038:	55                   	push   %ebp
80106039:	89 e5                	mov    %esp,%ebp
8010603b:	57                   	push   %edi
8010603c:	56                   	push   %esi
8010603d:	53                   	push   %ebx
8010603e:	83 ec 1c             	sub    $0x1c,%esp
80106041:	8b 45 08             	mov    0x8(%ebp),%eax
80106044:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106047:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010604a:	8b 75 10             	mov    0x10(%ebp),%esi
  if(sz >= PGSIZE)
8010604d:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106053:	77 47                	ja     8010609c <inituvm+0x64>
  mem = kalloc();
80106055:	e8 da c1 ff ff       	call   80102234 <kalloc>
8010605a:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
8010605c:	50                   	push   %eax
8010605d:	68 00 10 00 00       	push   $0x1000
80106062:	6a 00                	push   $0x0
80106064:	53                   	push   %ebx
80106065:	e8 82 de ff ff       	call   80103eec <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
8010606a:	5a                   	pop    %edx
8010606b:	59                   	pop    %ecx
8010606c:	6a 06                	push   $0x6
8010606e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106074:	50                   	push   %eax
80106075:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010607a:	31 d2                	xor    %edx,%edx
8010607c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010607f:	e8 00 fd ff ff       	call   80105d84 <mappages>
  memmove(mem, init, sz);
80106084:	83 c4 10             	add    $0x10,%esp
80106087:	89 75 10             	mov    %esi,0x10(%ebp)
8010608a:	89 7d 0c             	mov    %edi,0xc(%ebp)
8010608d:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106090:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106093:	5b                   	pop    %ebx
80106094:	5e                   	pop    %esi
80106095:	5f                   	pop    %edi
80106096:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106097:	e9 d4 de ff ff       	jmp    80103f70 <memmove>
    panic("inituvm: more than a page");
8010609c:	83 ec 0c             	sub    $0xc,%esp
8010609f:	68 71 6e 10 80       	push   $0x80106e71
801060a4:	e8 97 a2 ff ff       	call   80100340 <panic>
801060a9:	8d 76 00             	lea    0x0(%esi),%esi

801060ac <loaduvm>:
{
801060ac:	55                   	push   %ebp
801060ad:	89 e5                	mov    %esp,%ebp
801060af:	57                   	push   %edi
801060b0:	56                   	push   %esi
801060b1:	53                   	push   %ebx
801060b2:	83 ec 1c             	sub    $0x1c,%esp
801060b5:	8b 45 0c             	mov    0xc(%ebp),%eax
801060b8:	8b 75 18             	mov    0x18(%ebp),%esi
  if((uint) addr % PGSIZE != 0)
801060bb:	a9 ff 0f 00 00       	test   $0xfff,%eax
801060c0:	0f 85 94 00 00 00    	jne    8010615a <loaduvm+0xae>
  for(i = 0; i < sz; i += PGSIZE){
801060c6:	85 f6                	test   %esi,%esi
801060c8:	74 6a                	je     80106134 <loaduvm+0x88>
801060ca:	89 f3                	mov    %esi,%ebx
801060cc:	01 f0                	add    %esi,%eax
801060ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(readi(ip, P2V(pa), offset+i, n) != n)
801060d1:	8b 45 14             	mov    0x14(%ebp),%eax
801060d4:	01 f0                	add    %esi,%eax
801060d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801060d9:	eb 2d                	jmp    80106108 <loaduvm+0x5c>
801060db:	90                   	nop
    if(sz - i < PGSIZE)
801060dc:	89 df                	mov    %ebx,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
801060de:	57                   	push   %edi
801060df:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801060e2:	29 d9                	sub    %ebx,%ecx
801060e4:	51                   	push   %ecx
801060e5:	05 00 00 00 80       	add    $0x80000000,%eax
801060ea:	50                   	push   %eax
801060eb:	ff 75 10             	pushl  0x10(%ebp)
801060ee:	e8 0d b7 ff ff       	call   80101800 <readi>
801060f3:	83 c4 10             	add    $0x10,%esp
801060f6:	39 f8                	cmp    %edi,%eax
801060f8:	75 46                	jne    80106140 <loaduvm+0x94>
  for(i = 0; i < sz; i += PGSIZE){
801060fa:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106100:	89 f0                	mov    %esi,%eax
80106102:	29 d8                	sub    %ebx,%eax
80106104:	39 c6                	cmp    %eax,%esi
80106106:	76 2c                	jbe    80106134 <loaduvm+0x88>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106108:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010610b:	29 da                	sub    %ebx,%edx
8010610d:	31 c9                	xor    %ecx,%ecx
8010610f:	8b 45 08             	mov    0x8(%ebp),%eax
80106112:	e8 f9 fb ff ff       	call   80105d10 <walkpgdir>
80106117:	85 c0                	test   %eax,%eax
80106119:	74 32                	je     8010614d <loaduvm+0xa1>
    pa = PTE_ADDR(*pte);
8010611b:	8b 00                	mov    (%eax),%eax
8010611d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106122:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106128:	76 b2                	jbe    801060dc <loaduvm+0x30>
      n = PGSIZE;
8010612a:	bf 00 10 00 00       	mov    $0x1000,%edi
8010612f:	eb ad                	jmp    801060de <loaduvm+0x32>
80106131:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
80106134:	31 c0                	xor    %eax,%eax
}
80106136:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106139:	5b                   	pop    %ebx
8010613a:	5e                   	pop    %esi
8010613b:	5f                   	pop    %edi
8010613c:	5d                   	pop    %ebp
8010613d:	c3                   	ret    
8010613e:	66 90                	xchg   %ax,%ax
      return -1;
80106140:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106145:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106148:	5b                   	pop    %ebx
80106149:	5e                   	pop    %esi
8010614a:	5f                   	pop    %edi
8010614b:	5d                   	pop    %ebp
8010614c:	c3                   	ret    
      panic("loaduvm: address should exist");
8010614d:	83 ec 0c             	sub    $0xc,%esp
80106150:	68 8b 6e 10 80       	push   $0x80106e8b
80106155:	e8 e6 a1 ff ff       	call   80100340 <panic>
    panic("loaduvm: addr must be page aligned");
8010615a:	83 ec 0c             	sub    $0xc,%esp
8010615d:	68 2c 6f 10 80       	push   $0x80106f2c
80106162:	e8 d9 a1 ff ff       	call   80100340 <panic>
80106167:	90                   	nop

80106168 <allocuvm>:
{
80106168:	55                   	push   %ebp
80106169:	89 e5                	mov    %esp,%ebp
8010616b:	57                   	push   %edi
8010616c:	56                   	push   %esi
8010616d:	53                   	push   %ebx
8010616e:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106171:	8b 7d 10             	mov    0x10(%ebp),%edi
80106174:	85 ff                	test   %edi,%edi
80106176:	0f 88 b8 00 00 00    	js     80106234 <allocuvm+0xcc>
  if(newsz < oldsz)
8010617c:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010617f:	0f 82 9f 00 00 00    	jb     80106224 <allocuvm+0xbc>
  a = PGROUNDUP(oldsz);
80106185:	8b 45 0c             	mov    0xc(%ebp),%eax
80106188:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
8010618e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80106194:	39 75 10             	cmp    %esi,0x10(%ebp)
80106197:	0f 86 8a 00 00 00    	jbe    80106227 <allocuvm+0xbf>
8010619d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801061a0:	8b 7d 10             	mov    0x10(%ebp),%edi
801061a3:	eb 40                	jmp    801061e5 <allocuvm+0x7d>
801061a5:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
801061a8:	50                   	push   %eax
801061a9:	68 00 10 00 00       	push   $0x1000
801061ae:	6a 00                	push   $0x0
801061b0:	53                   	push   %ebx
801061b1:	e8 36 dd ff ff       	call   80103eec <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
801061b6:	5a                   	pop    %edx
801061b7:	59                   	pop    %ecx
801061b8:	6a 06                	push   $0x6
801061ba:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801061c0:	50                   	push   %eax
801061c1:	b9 00 10 00 00       	mov    $0x1000,%ecx
801061c6:	89 f2                	mov    %esi,%edx
801061c8:	8b 45 08             	mov    0x8(%ebp),%eax
801061cb:	e8 b4 fb ff ff       	call   80105d84 <mappages>
801061d0:	83 c4 10             	add    $0x10,%esp
801061d3:	85 c0                	test   %eax,%eax
801061d5:	78 69                	js     80106240 <allocuvm+0xd8>
  for(; a < newsz; a += PGSIZE){
801061d7:	81 c6 00 10 00 00    	add    $0x1000,%esi
801061dd:	39 f7                	cmp    %esi,%edi
801061df:	0f 86 9b 00 00 00    	jbe    80106280 <allocuvm+0x118>
    mem = kalloc();
801061e5:	e8 4a c0 ff ff       	call   80102234 <kalloc>
801061ea:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
801061ec:	85 c0                	test   %eax,%eax
801061ee:	75 b8                	jne    801061a8 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
801061f0:	83 ec 0c             	sub    $0xc,%esp
801061f3:	68 a9 6e 10 80       	push   $0x80106ea9
801061f8:	e8 23 a4 ff ff       	call   80100620 <cprintf>
  if(newsz >= oldsz)
801061fd:	83 c4 10             	add    $0x10,%esp
80106200:	8b 45 0c             	mov    0xc(%ebp),%eax
80106203:	39 45 10             	cmp    %eax,0x10(%ebp)
80106206:	74 2c                	je     80106234 <allocuvm+0xcc>
80106208:	89 c1                	mov    %eax,%ecx
8010620a:	8b 55 10             	mov    0x10(%ebp),%edx
8010620d:	8b 45 08             	mov    0x8(%ebp),%eax
80106210:	e8 f3 fb ff ff       	call   80105e08 <deallocuvm.part.0>
      return 0;
80106215:	31 ff                	xor    %edi,%edi
}
80106217:	89 f8                	mov    %edi,%eax
80106219:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010621c:	5b                   	pop    %ebx
8010621d:	5e                   	pop    %esi
8010621e:	5f                   	pop    %edi
8010621f:	5d                   	pop    %ebp
80106220:	c3                   	ret    
80106221:	8d 76 00             	lea    0x0(%esi),%esi
    return oldsz;
80106224:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106227:	89 f8                	mov    %edi,%eax
80106229:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010622c:	5b                   	pop    %ebx
8010622d:	5e                   	pop    %esi
8010622e:	5f                   	pop    %edi
8010622f:	5d                   	pop    %ebp
80106230:	c3                   	ret    
80106231:	8d 76 00             	lea    0x0(%esi),%esi
    return 0;
80106234:	31 ff                	xor    %edi,%edi
}
80106236:	89 f8                	mov    %edi,%eax
80106238:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010623b:	5b                   	pop    %ebx
8010623c:	5e                   	pop    %esi
8010623d:	5f                   	pop    %edi
8010623e:	5d                   	pop    %ebp
8010623f:	c3                   	ret    
      cprintf("allocuvm out of memory (2)\n");
80106240:	83 ec 0c             	sub    $0xc,%esp
80106243:	68 c1 6e 10 80       	push   $0x80106ec1
80106248:	e8 d3 a3 ff ff       	call   80100620 <cprintf>
  if(newsz >= oldsz)
8010624d:	83 c4 10             	add    $0x10,%esp
80106250:	8b 45 0c             	mov    0xc(%ebp),%eax
80106253:	39 45 10             	cmp    %eax,0x10(%ebp)
80106256:	74 0d                	je     80106265 <allocuvm+0xfd>
80106258:	89 c1                	mov    %eax,%ecx
8010625a:	8b 55 10             	mov    0x10(%ebp),%edx
8010625d:	8b 45 08             	mov    0x8(%ebp),%eax
80106260:	e8 a3 fb ff ff       	call   80105e08 <deallocuvm.part.0>
      kfree(mem);
80106265:	83 ec 0c             	sub    $0xc,%esp
80106268:	53                   	push   %ebx
80106269:	e8 36 be ff ff       	call   801020a4 <kfree>
      return 0;
8010626e:	83 c4 10             	add    $0x10,%esp
80106271:	31 ff                	xor    %edi,%edi
}
80106273:	89 f8                	mov    %edi,%eax
80106275:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106278:	5b                   	pop    %ebx
80106279:	5e                   	pop    %esi
8010627a:	5f                   	pop    %edi
8010627b:	5d                   	pop    %ebp
8010627c:	c3                   	ret    
8010627d:	8d 76 00             	lea    0x0(%esi),%esi
80106280:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106283:	89 f8                	mov    %edi,%eax
80106285:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106288:	5b                   	pop    %ebx
80106289:	5e                   	pop    %esi
8010628a:	5f                   	pop    %edi
8010628b:	5d                   	pop    %ebp
8010628c:	c3                   	ret    
8010628d:	8d 76 00             	lea    0x0(%esi),%esi

80106290 <deallocuvm>:
{
80106290:	55                   	push   %ebp
80106291:	89 e5                	mov    %esp,%ebp
80106293:	8b 45 08             	mov    0x8(%ebp),%eax
80106296:	8b 55 0c             	mov    0xc(%ebp),%edx
80106299:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if(newsz >= oldsz)
8010629c:	39 d1                	cmp    %edx,%ecx
8010629e:	73 08                	jae    801062a8 <deallocuvm+0x18>
}
801062a0:	5d                   	pop    %ebp
801062a1:	e9 62 fb ff ff       	jmp    80105e08 <deallocuvm.part.0>
801062a6:	66 90                	xchg   %ax,%ax
801062a8:	89 d0                	mov    %edx,%eax
801062aa:	5d                   	pop    %ebp
801062ab:	c3                   	ret    

801062ac <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801062ac:	55                   	push   %ebp
801062ad:	89 e5                	mov    %esp,%ebp
801062af:	57                   	push   %edi
801062b0:	56                   	push   %esi
801062b1:	53                   	push   %ebx
801062b2:	83 ec 0c             	sub    $0xc,%esp
801062b5:	8b 7d 08             	mov    0x8(%ebp),%edi
  uint i;

  if(pgdir == 0)
801062b8:	85 ff                	test   %edi,%edi
801062ba:	74 51                	je     8010630d <freevm+0x61>
  if(newsz >= oldsz)
801062bc:	31 c9                	xor    %ecx,%ecx
801062be:	ba 00 00 00 80       	mov    $0x80000000,%edx
801062c3:	89 f8                	mov    %edi,%eax
801062c5:	e8 3e fb ff ff       	call   80105e08 <deallocuvm.part.0>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801062ca:	89 fb                	mov    %edi,%ebx
801062cc:	8d b7 00 10 00 00    	lea    0x1000(%edi),%esi
801062d2:	eb 07                	jmp    801062db <freevm+0x2f>
801062d4:	83 c3 04             	add    $0x4,%ebx
801062d7:	39 de                	cmp    %ebx,%esi
801062d9:	74 23                	je     801062fe <freevm+0x52>
    if(pgdir[i] & PTE_P){
801062db:	8b 03                	mov    (%ebx),%eax
801062dd:	a8 01                	test   $0x1,%al
801062df:	74 f3                	je     801062d4 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
801062e1:	83 ec 0c             	sub    $0xc,%esp
      char * v = P2V(PTE_ADDR(pgdir[i]));
801062e4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801062e9:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801062ee:	50                   	push   %eax
801062ef:	e8 b0 bd ff ff       	call   801020a4 <kfree>
801062f4:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
801062f7:	83 c3 04             	add    $0x4,%ebx
801062fa:	39 de                	cmp    %ebx,%esi
801062fc:	75 dd                	jne    801062db <freevm+0x2f>
    }
  }
  kfree((char*)pgdir);
801062fe:	89 7d 08             	mov    %edi,0x8(%ebp)
}
80106301:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106304:	5b                   	pop    %ebx
80106305:	5e                   	pop    %esi
80106306:	5f                   	pop    %edi
80106307:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106308:	e9 97 bd ff ff       	jmp    801020a4 <kfree>
    panic("freevm: no pgdir");
8010630d:	83 ec 0c             	sub    $0xc,%esp
80106310:	68 dd 6e 10 80       	push   $0x80106edd
80106315:	e8 26 a0 ff ff       	call   80100340 <panic>
8010631a:	66 90                	xchg   %ax,%ax

8010631c <setupkvm>:
{
8010631c:	55                   	push   %ebp
8010631d:	89 e5                	mov    %esp,%ebp
8010631f:	56                   	push   %esi
80106320:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106321:	e8 0e bf ff ff       	call   80102234 <kalloc>
80106326:	89 c6                	mov    %eax,%esi
80106328:	85 c0                	test   %eax,%eax
8010632a:	74 40                	je     8010636c <setupkvm+0x50>
  memset(pgdir, 0, PGSIZE);
8010632c:	50                   	push   %eax
8010632d:	68 00 10 00 00       	push   $0x1000
80106332:	6a 00                	push   $0x0
80106334:	56                   	push   %esi
80106335:	e8 b2 db ff ff       	call   80103eec <memset>
8010633a:	83 c4 10             	add    $0x10,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010633d:	bb 20 94 10 80       	mov    $0x80109420,%ebx
                (uint)k->phys_start, k->perm) < 0) {
80106342:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106345:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106348:	29 c1                	sub    %eax,%ecx
8010634a:	83 ec 08             	sub    $0x8,%esp
8010634d:	ff 73 0c             	pushl  0xc(%ebx)
80106350:	50                   	push   %eax
80106351:	8b 13                	mov    (%ebx),%edx
80106353:	89 f0                	mov    %esi,%eax
80106355:	e8 2a fa ff ff       	call   80105d84 <mappages>
8010635a:	83 c4 10             	add    $0x10,%esp
8010635d:	85 c0                	test   %eax,%eax
8010635f:	78 17                	js     80106378 <setupkvm+0x5c>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106361:	83 c3 10             	add    $0x10,%ebx
80106364:	81 fb 60 94 10 80    	cmp    $0x80109460,%ebx
8010636a:	75 d6                	jne    80106342 <setupkvm+0x26>
}
8010636c:	89 f0                	mov    %esi,%eax
8010636e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106371:	5b                   	pop    %ebx
80106372:	5e                   	pop    %esi
80106373:	5d                   	pop    %ebp
80106374:	c3                   	ret    
80106375:	8d 76 00             	lea    0x0(%esi),%esi
      freevm(pgdir);
80106378:	83 ec 0c             	sub    $0xc,%esp
8010637b:	56                   	push   %esi
8010637c:	e8 2b ff ff ff       	call   801062ac <freevm>
      return 0;
80106381:	83 c4 10             	add    $0x10,%esp
80106384:	31 f6                	xor    %esi,%esi
}
80106386:	89 f0                	mov    %esi,%eax
80106388:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010638b:	5b                   	pop    %ebx
8010638c:	5e                   	pop    %esi
8010638d:	5d                   	pop    %ebp
8010638e:	c3                   	ret    
8010638f:	90                   	nop

80106390 <kvmalloc>:
{
80106390:	55                   	push   %ebp
80106391:	89 e5                	mov    %esp,%ebp
80106393:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106396:	e8 81 ff ff ff       	call   8010631c <setupkvm>
8010639b:	a3 a4 45 11 80       	mov    %eax,0x801145a4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801063a0:	05 00 00 00 80       	add    $0x80000000,%eax
801063a5:	0f 22 d8             	mov    %eax,%cr3
}
801063a8:	c9                   	leave  
801063a9:	c3                   	ret    
801063aa:	66 90                	xchg   %ax,%ax

801063ac <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801063ac:	55                   	push   %ebp
801063ad:	89 e5                	mov    %esp,%ebp
801063af:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801063b2:	31 c9                	xor    %ecx,%ecx
801063b4:	8b 55 0c             	mov    0xc(%ebp),%edx
801063b7:	8b 45 08             	mov    0x8(%ebp),%eax
801063ba:	e8 51 f9 ff ff       	call   80105d10 <walkpgdir>
  if(pte == 0)
801063bf:	85 c0                	test   %eax,%eax
801063c1:	74 05                	je     801063c8 <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801063c3:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801063c6:	c9                   	leave  
801063c7:	c3                   	ret    
    panic("clearpteu");
801063c8:	83 ec 0c             	sub    $0xc,%esp
801063cb:	68 ee 6e 10 80       	push   $0x80106eee
801063d0:	e8 6b 9f ff ff       	call   80100340 <panic>
801063d5:	8d 76 00             	lea    0x0(%esi),%esi

801063d8 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801063d8:	55                   	push   %ebp
801063d9:	89 e5                	mov    %esp,%ebp
801063db:	57                   	push   %edi
801063dc:	56                   	push   %esi
801063dd:	53                   	push   %ebx
801063de:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801063e1:	e8 36 ff ff ff       	call   8010631c <setupkvm>
801063e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801063e9:	85 c0                	test   %eax,%eax
801063eb:	0f 84 96 00 00 00    	je     80106487 <copyuvm+0xaf>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801063f1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801063f4:	85 db                	test   %ebx,%ebx
801063f6:	0f 84 8b 00 00 00    	je     80106487 <copyuvm+0xaf>
801063fc:	31 ff                	xor    %edi,%edi
801063fe:	eb 40                	jmp    80106440 <copyuvm+0x68>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106400:	50                   	push   %eax
80106401:	68 00 10 00 00       	push   $0x1000
80106406:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106409:	05 00 00 00 80       	add    $0x80000000,%eax
8010640e:	50                   	push   %eax
8010640f:	56                   	push   %esi
80106410:	e8 5b db ff ff       	call   80103f70 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106415:	5a                   	pop    %edx
80106416:	59                   	pop    %ecx
80106417:	53                   	push   %ebx
80106418:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010641e:	50                   	push   %eax
8010641f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106424:	89 fa                	mov    %edi,%edx
80106426:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106429:	e8 56 f9 ff ff       	call   80105d84 <mappages>
8010642e:	83 c4 10             	add    $0x10,%esp
80106431:	85 c0                	test   %eax,%eax
80106433:	78 5f                	js     80106494 <copyuvm+0xbc>
  for(i = 0; i < sz; i += PGSIZE){
80106435:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010643b:	39 7d 0c             	cmp    %edi,0xc(%ebp)
8010643e:	76 47                	jbe    80106487 <copyuvm+0xaf>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106440:	31 c9                	xor    %ecx,%ecx
80106442:	89 fa                	mov    %edi,%edx
80106444:	8b 45 08             	mov    0x8(%ebp),%eax
80106447:	e8 c4 f8 ff ff       	call   80105d10 <walkpgdir>
8010644c:	85 c0                	test   %eax,%eax
8010644e:	74 5f                	je     801064af <copyuvm+0xd7>
    if(!(*pte & PTE_P))
80106450:	8b 18                	mov    (%eax),%ebx
80106452:	f6 c3 01             	test   $0x1,%bl
80106455:	74 4b                	je     801064a2 <copyuvm+0xca>
    pa = PTE_ADDR(*pte);
80106457:	89 d8                	mov    %ebx,%eax
80106459:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010645e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    flags = PTE_FLAGS(*pte);
80106461:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    if((mem = kalloc()) == 0)
80106467:	e8 c8 bd ff ff       	call   80102234 <kalloc>
8010646c:	89 c6                	mov    %eax,%esi
8010646e:	85 c0                	test   %eax,%eax
80106470:	75 8e                	jne    80106400 <copyuvm+0x28>
    }
  }
  return d;

bad:
  freevm(d);
80106472:	83 ec 0c             	sub    $0xc,%esp
80106475:	ff 75 e0             	pushl  -0x20(%ebp)
80106478:	e8 2f fe ff ff       	call   801062ac <freevm>
  return 0;
8010647d:	83 c4 10             	add    $0x10,%esp
80106480:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106487:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010648a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010648d:	5b                   	pop    %ebx
8010648e:	5e                   	pop    %esi
8010648f:	5f                   	pop    %edi
80106490:	5d                   	pop    %ebp
80106491:	c3                   	ret    
80106492:	66 90                	xchg   %ax,%ax
      kfree(mem);
80106494:	83 ec 0c             	sub    $0xc,%esp
80106497:	56                   	push   %esi
80106498:	e8 07 bc ff ff       	call   801020a4 <kfree>
      goto bad;
8010649d:	83 c4 10             	add    $0x10,%esp
801064a0:	eb d0                	jmp    80106472 <copyuvm+0x9a>
      panic("copyuvm: page not present");
801064a2:	83 ec 0c             	sub    $0xc,%esp
801064a5:	68 12 6f 10 80       	push   $0x80106f12
801064aa:	e8 91 9e ff ff       	call   80100340 <panic>
      panic("copyuvm: pte should exist");
801064af:	83 ec 0c             	sub    $0xc,%esp
801064b2:	68 f8 6e 10 80       	push   $0x80106ef8
801064b7:	e8 84 9e ff ff       	call   80100340 <panic>

801064bc <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801064bc:	55                   	push   %ebp
801064bd:	89 e5                	mov    %esp,%ebp
801064bf:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801064c2:	31 c9                	xor    %ecx,%ecx
801064c4:	8b 55 0c             	mov    0xc(%ebp),%edx
801064c7:	8b 45 08             	mov    0x8(%ebp),%eax
801064ca:	e8 41 f8 ff ff       	call   80105d10 <walkpgdir>
  if((*pte & PTE_P) == 0)
801064cf:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
801064d1:	89 c2                	mov    %eax,%edx
801064d3:	83 e2 05             	and    $0x5,%edx
801064d6:	83 fa 05             	cmp    $0x5,%edx
801064d9:	75 0d                	jne    801064e8 <uva2ka+0x2c>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801064db:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801064e0:	05 00 00 00 80       	add    $0x80000000,%eax
}
801064e5:	c9                   	leave  
801064e6:	c3                   	ret    
801064e7:	90                   	nop
    return 0;
801064e8:	31 c0                	xor    %eax,%eax
}
801064ea:	c9                   	leave  
801064eb:	c3                   	ret    

801064ec <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801064ec:	55                   	push   %ebp
801064ed:	89 e5                	mov    %esp,%ebp
801064ef:	57                   	push   %edi
801064f0:	56                   	push   %esi
801064f1:	53                   	push   %ebx
801064f2:	83 ec 0c             	sub    $0xc,%esp
801064f5:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801064f8:	8b 4d 14             	mov    0x14(%ebp),%ecx
801064fb:	85 c9                	test   %ecx,%ecx
801064fd:	74 65                	je     80106564 <copyout+0x78>
801064ff:	89 fb                	mov    %edi,%ebx
80106501:	eb 37                	jmp    8010653a <copyout+0x4e>
80106503:	90                   	nop
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106504:	89 f2                	mov    %esi,%edx
80106506:	2b 55 0c             	sub    0xc(%ebp),%edx
    if(n > len)
80106509:	8d ba 00 10 00 00    	lea    0x1000(%edx),%edi
8010650f:	3b 7d 14             	cmp    0x14(%ebp),%edi
80106512:	76 03                	jbe    80106517 <copyout+0x2b>
80106514:	8b 7d 14             	mov    0x14(%ebp),%edi
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106517:	52                   	push   %edx
80106518:	57                   	push   %edi
80106519:	53                   	push   %ebx
8010651a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010651d:	29 f1                	sub    %esi,%ecx
8010651f:	01 c8                	add    %ecx,%eax
80106521:	50                   	push   %eax
80106522:	e8 49 da ff ff       	call   80103f70 <memmove>
    len -= n;
    buf += n;
80106527:	01 fb                	add    %edi,%ebx
    va = va0 + PGSIZE;
80106529:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
8010652f:	89 45 0c             	mov    %eax,0xc(%ebp)
  while(len > 0){
80106532:	83 c4 10             	add    $0x10,%esp
80106535:	29 7d 14             	sub    %edi,0x14(%ebp)
80106538:	74 2a                	je     80106564 <copyout+0x78>
    va0 = (uint)PGROUNDDOWN(va);
8010653a:	8b 75 0c             	mov    0xc(%ebp),%esi
8010653d:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106543:	83 ec 08             	sub    $0x8,%esp
80106546:	56                   	push   %esi
80106547:	ff 75 08             	pushl  0x8(%ebp)
8010654a:	e8 6d ff ff ff       	call   801064bc <uva2ka>
    if(pa0 == 0)
8010654f:	83 c4 10             	add    $0x10,%esp
80106552:	85 c0                	test   %eax,%eax
80106554:	75 ae                	jne    80106504 <copyout+0x18>
      return -1;
80106556:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
8010655b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010655e:	5b                   	pop    %ebx
8010655f:	5e                   	pop    %esi
80106560:	5f                   	pop    %edi
80106561:	5d                   	pop    %ebp
80106562:	c3                   	ret    
80106563:	90                   	nop
  return 0;
80106564:	31 c0                	xor    %eax,%eax
}
80106566:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106569:	5b                   	pop    %ebx
8010656a:	5e                   	pop    %esi
8010656b:	5f                   	pop    %edi
8010656c:	5d                   	pop    %ebp
8010656d:	c3                   	ret    
