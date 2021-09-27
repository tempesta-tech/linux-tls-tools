
bignum_x86-64.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <mpi_cmp_x86_64_4>:
       0:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
       7:	48 8b 47 18          	mov    0x18(%rdi),%rax
       b:	48 2b 46 18          	sub    0x18(%rsi),%rax
       f:	75 1c                	jne    2d <.cmp_4_done>
      11:	48 8b 47 10          	mov    0x10(%rdi),%rax
      15:	48 2b 46 10          	sub    0x10(%rsi),%rax
      19:	75 12                	jne    2d <.cmp_4_done>
      1b:	48 8b 47 08          	mov    0x8(%rdi),%rax
      1f:	48 2b 46 08          	sub    0x8(%rsi),%rax
      23:	75 08                	jne    2d <.cmp_4_done>
      25:	48 8b 07             	mov    (%rdi),%rax
      28:	48 2b 06             	sub    (%rsi),%rax
      2b:	75 00                	jne    2d <.cmp_4_done>

000000000000002d <.cmp_4_done>:
      2d:	48 0f 42 c2          	cmovb  %rdx,%rax
      31:	c3                   	retq   
      32:	66 90                	xchg   %ax,%ax

0000000000000034 <mpi_add_x86_64>:
      34:	49 29 c9             	sub    %rcx,%r9
      37:	49 83 c1 01          	add    $0x1,%r9
      3b:	48 31 c0             	xor    %rax,%rax

000000000000003e <.add_smaller>:
      3e:	4d 8b 14 c0          	mov    (%r8,%rax,8),%r10
      42:	4c 13 14 c2          	adc    (%rdx,%rax,8),%r10
      46:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
      4a:	48 ff c0             	inc    %rax
      4d:	e2 ef                	loop   3e <.add_smaller>
      4f:	4c 89 c9             	mov    %r9,%rcx
      52:	eb 12                	jmp    66 <.add_bigger>

0000000000000054 <.add_bigger_loop>:
      54:	49 c7 c2 00 00 00 00 	mov    $0x0,%r10
      5b:	4d 13 14 c0          	adc    (%r8,%rax,8),%r10
      5f:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
      63:	48 ff c0             	inc    %rax

0000000000000066 <.add_bigger>:
      66:	e2 ec                	loop   54 <.add_bigger_loop>
      68:	73 10                	jae    7a <.add_done>
      6a:	48 39 c6             	cmp    %rax,%rsi
      6d:	7c 0c                	jl     7b <.enospc>
      6f:	48 c7 04 c7 01 00 00 	movq   $0x1,(%rdi,%rax,8)
      76:	00 
      77:	48 ff c0             	inc    %rax

000000000000007a <.add_done>:
      7a:	c3                   	retq   

000000000000007b <.enospc>:
      7b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
      82:	c3                   	retq   
      83:	90                   	nop

0000000000000084 <mpi_add_mod_p256_x86_64>:
      84:	48 8b 06             	mov    (%rsi),%rax
      87:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
      8b:	4c 8b 46 10          	mov    0x10(%rsi),%r8
      8f:	4c 8b 4e 18          	mov    0x18(%rsi),%r9
      93:	49 ba ff ff ff ff 00 	movabs $0xffffffff,%r10
      9a:	00 00 00 
      9d:	49 bb 01 00 00 00 ff 	movabs $0xffffffff00000001,%r11
      a4:	ff ff ff 
      a7:	48 03 02             	add    (%rdx),%rax
      aa:	48 13 4a 08          	adc    0x8(%rdx),%rcx
      ae:	4c 13 42 10          	adc    0x10(%rdx),%r8
      b2:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
      b9:	4c 13 4a 18          	adc    0x18(%rdx),%r9
      bd:	48 83 de 00          	sbb    $0x0,%rsi
      c1:	49 21 f2             	and    %rsi,%r10
      c4:	49 21 f3             	and    %rsi,%r11
      c7:	48 29 f0             	sub    %rsi,%rax
      ca:	4c 19 d1             	sbb    %r10,%rcx
      cd:	48 89 07             	mov    %rax,(%rdi)
      d0:	49 83 d8 00          	sbb    $0x0,%r8
      d4:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
      d8:	4d 19 d9             	sbb    %r11,%r9
      db:	4c 89 47 10          	mov    %r8,0x10(%rdi)
      df:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
      e3:	c3                   	retq   

00000000000000e4 <mpi_sub_x86_64>:
      e4:	49 29 c8             	sub    %rcx,%r8
      e7:	49 83 c0 01          	add    $0x1,%r8
      eb:	53                   	push   %rbx
      ec:	48 89 cb             	mov    %rcx,%rbx
      ef:	48 83 e3 03          	and    $0x3,%rbx
      f3:	48 8b 1c dd 00 00 00 	mov    0x0(,%rbx,8),%rbx
      fa:	00 
			f7: R_X86_64_32S	.rodata
      fb:	48 31 c0             	xor    %rax,%rax
      fe:	48 c1 e9 02          	shr    $0x2,%rcx
     102:	74 4b                	je     14f <.sub_small_b>
     104:	41 54                	push   %r12
     106:	f8                   	clc    

0000000000000107 <.sub_by_4>:
     107:	4c 8b 0c c2          	mov    (%rdx,%rax,8),%r9
     10b:	4c 8b 54 c2 08       	mov    0x8(%rdx,%rax,8),%r10
     110:	4c 8b 5c c2 10       	mov    0x10(%rdx,%rax,8),%r11
     115:	4c 8b 64 c2 18       	mov    0x18(%rdx,%rax,8),%r12
     11a:	4c 1b 0c c6          	sbb    (%rsi,%rax,8),%r9
     11e:	4c 1b 54 c6 08       	sbb    0x8(%rsi,%rax,8),%r10
     123:	4c 1b 5c c6 10       	sbb    0x10(%rsi,%rax,8),%r11
     128:	4c 1b 64 c6 18       	sbb    0x18(%rsi,%rax,8),%r12
     12d:	4c 89 0c c7          	mov    %r9,(%rdi,%rax,8)
     131:	48 ff c0             	inc    %rax
     134:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
     138:	48 ff c0             	inc    %rax
     13b:	4c 89 1c c7          	mov    %r11,(%rdi,%rax,8)
     13f:	48 ff c0             	inc    %rax
     142:	4c 89 24 c7          	mov    %r12,(%rdi,%rax,8)
     146:	48 ff c0             	inc    %rax
     149:	e2 bc                	loop   107 <.sub_by_4>
     14b:	41 5c                	pop    %r12
     14d:	ff e3                	jmpq   *%rbx

000000000000014f <.sub_small_b>:
     14f:	f8                   	clc    
     150:	ff e3                	jmpq   *%rbx

0000000000000152 <.sub_tail3>:
     152:	4c 8b 0c c2          	mov    (%rdx,%rax,8),%r9
     156:	4c 1b 0c c6          	sbb    (%rsi,%rax,8),%r9
     15a:	4c 89 0c c7          	mov    %r9,(%rdi,%rax,8)
     15e:	48 ff c0             	inc    %rax

0000000000000161 <.sub_tail2>:
     161:	4c 8b 14 c2          	mov    (%rdx,%rax,8),%r10
     165:	4c 1b 14 c6          	sbb    (%rsi,%rax,8),%r10
     169:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
     16d:	48 ff c0             	inc    %rax

0000000000000170 <.sub_tail1>:
     170:	4c 8b 1c c2          	mov    (%rdx,%rax,8),%r11
     174:	4c 1b 1c c6          	sbb    (%rsi,%rax,8),%r11
     178:	4c 89 1c c7          	mov    %r11,(%rdi,%rax,8)
     17c:	48 ff c0             	inc    %rax

000000000000017f <.sub_tail0>:
     17f:	5b                   	pop    %rbx
     180:	4c 89 c1             	mov    %r8,%rcx
     183:	73 22                	jae    1a7 <.copy_msb>
     185:	eb 11                	jmp    198 <.propagate_borrow>

0000000000000187 <.propagate_borrow_loop>:
     187:	4c 8b 14 c2          	mov    (%rdx,%rax,8),%r10
     18b:	49 83 da 00          	sbb    $0x0,%r10
     18f:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
     193:	48 ff c0             	inc    %rax
     196:	73 12                	jae    1aa <.need_copy>

0000000000000198 <.propagate_borrow>:
     198:	e2 ed                	loop   187 <.propagate_borrow_loop>
     19a:	0f 0b                	ud2    

000000000000019c <.copy_msb_loop>:
     19c:	4c 8b 14 c2          	mov    (%rdx,%rax,8),%r10
     1a0:	4c 89 14 c7          	mov    %r10,(%rdi,%rax,8)
     1a4:	48 ff c0             	inc    %rax

00000000000001a7 <.copy_msb>:
     1a7:	e2 f3                	loop   19c <.copy_msb_loop>
     1a9:	c3                   	retq   

00000000000001aa <.need_copy>:
     1aa:	48 39 d7             	cmp    %rdx,%rdi
     1ad:	75 f8                	jne    1a7 <.copy_msb>
     1af:	c3                   	retq   

00000000000001b0 <mpi_sub_x86_64_5_4>:
     1b0:	4c 8b 02             	mov    (%rdx),%r8
     1b3:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
     1b7:	4c 8b 52 10          	mov    0x10(%rdx),%r10
     1bb:	4c 8b 5a 18          	mov    0x18(%rdx),%r11
     1bf:	4c 2b 06             	sub    (%rsi),%r8
     1c2:	4c 1b 4e 08          	sbb    0x8(%rsi),%r9
     1c6:	4c 1b 56 10          	sbb    0x10(%rsi),%r10
     1ca:	4c 1b 5e 18          	sbb    0x18(%rsi),%r11
     1ce:	4c 89 07             	mov    %r8,(%rdi)
     1d1:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     1d5:	4c 89 57 10          	mov    %r10,0x10(%rdi)
     1d9:	4c 89 5f 18          	mov    %r11,0x18(%rdi)
     1dd:	4c 8b 42 20          	mov    0x20(%rdx),%r8
     1e1:	49 83 d8 00          	sbb    $0x0,%r8
     1e5:	4c 89 47 20          	mov    %r8,0x20(%rdi)
     1e9:	c3                   	retq   
     1ea:	66 90                	xchg   %ax,%ax

00000000000001ec <mpi_sub_x86_64_4_4>:
     1ec:	4c 8b 02             	mov    (%rdx),%r8
     1ef:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
     1f3:	4c 8b 52 10          	mov    0x10(%rdx),%r10
     1f7:	4c 8b 5a 18          	mov    0x18(%rdx),%r11
     1fb:	4c 2b 06             	sub    (%rsi),%r8
     1fe:	4c 1b 4e 08          	sbb    0x8(%rsi),%r9
     202:	4c 1b 56 10          	sbb    0x10(%rsi),%r10
     206:	4c 1b 5e 18          	sbb    0x18(%rsi),%r11
     20a:	4c 89 07             	mov    %r8,(%rdi)
     20d:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     211:	4c 89 57 10          	mov    %r10,0x10(%rdi)
     215:	4c 89 5f 18          	mov    %r11,0x18(%rdi)
     219:	c3                   	retq   
     21a:	66 90                	xchg   %ax,%ax

000000000000021c <mpi_sub_mod_p256_x86_64>:
     21c:	48 8b 06             	mov    (%rsi),%rax
     21f:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
     223:	4c 8b 46 10          	mov    0x10(%rsi),%r8
     227:	4c 8b 4e 18          	mov    0x18(%rsi),%r9
     22b:	49 ba ff ff ff ff 00 	movabs $0xffffffff,%r10
     232:	00 00 00 
     235:	49 bb 01 00 00 00 ff 	movabs $0xffffffff00000001,%r11
     23c:	ff ff ff 
     23f:	48 2b 02             	sub    (%rdx),%rax
     242:	48 1b 4a 08          	sbb    0x8(%rdx),%rcx
     246:	4c 1b 42 10          	sbb    0x10(%rdx),%r8
     24a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
     251:	4c 1b 4a 18          	sbb    0x18(%rdx),%r9
     255:	48 83 de 00          	sbb    $0x0,%rsi
     259:	49 21 f2             	and    %rsi,%r10
     25c:	49 21 f3             	and    %rsi,%r11
     25f:	48 01 f0             	add    %rsi,%rax
     262:	4c 11 d1             	adc    %r10,%rcx
     265:	48 89 07             	mov    %rax,(%rdi)
     268:	49 83 d0 00          	adc    $0x0,%r8
     26c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
     270:	4d 11 d9             	adc    %r11,%r9
     273:	4c 89 47 10          	mov    %r8,0x10(%rdi)
     277:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
     27b:	c3                   	retq   

000000000000027c <mpi_sub_x86_64_3_3>:
     27c:	4c 8b 02             	mov    (%rdx),%r8
     27f:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
     283:	4c 8b 52 10          	mov    0x10(%rdx),%r10
     287:	4c 2b 06             	sub    (%rsi),%r8
     28a:	4c 1b 4e 08          	sbb    0x8(%rsi),%r9
     28e:	4c 1b 56 10          	sbb    0x10(%rsi),%r10
     292:	4c 89 07             	mov    %r8,(%rdi)
     295:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     299:	4c 89 57 10          	mov    %r10,0x10(%rdi)
     29d:	c3                   	retq   
     29e:	66 90                	xchg   %ax,%ax

00000000000002a0 <mpi_sub_x86_64_2_2>:
     2a0:	4c 8b 02             	mov    (%rdx),%r8
     2a3:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
     2a7:	4c 2b 06             	sub    (%rsi),%r8
     2aa:	4c 1b 4e 08          	sbb    0x8(%rsi),%r9
     2ae:	4c 89 07             	mov    %r8,(%rdi)
     2b1:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     2b5:	c3                   	retq   
     2b6:	66 90                	xchg   %ax,%ax

00000000000002b8 <mpi_shift_l_x86_64>:
     2b8:	4d 31 db             	xor    %r11,%r11
     2bb:	4c 8b 44 d6 f8       	mov    -0x8(%rsi,%rdx,8),%r8
     2c0:	4d 0f a5 c3          	shld   %cl,%r8,%r11
     2c4:	4c 89 1c d7          	mov    %r11,(%rdi,%rdx,8)
     2c8:	48 ff ca             	dec    %rdx
     2cb:	74 16                	je     2e3 <.shl_last>

00000000000002cd <.shl_loop>:
     2cd:	4c 8b 44 d6 f8       	mov    -0x8(%rsi,%rdx,8),%r8
     2d2:	4c 8b 1c d6          	mov    (%rsi,%rdx,8),%r11
     2d6:	4d 0f a5 c3          	shld   %cl,%r8,%r11
     2da:	4c 89 1c d7          	mov    %r11,(%rdi,%rdx,8)
     2de:	48 ff ca             	dec    %rdx
     2e1:	75 ea                	jne    2cd <.shl_loop>

00000000000002e3 <.shl_last>:
     2e3:	4c 8b 1e             	mov    (%rsi),%r11
     2e6:	49 d3 e3             	shl    %cl,%r11
     2e9:	4c 89 1f             	mov    %r11,(%rdi)
     2ec:	c3                   	retq   
     2ed:	0f 1f 00             	nopl   (%rax)

00000000000002f0 <mpi_shift_l_x86_64_4>:
     2f0:	48 89 d1             	mov    %rdx,%rcx
     2f3:	4c 8b 5e 18          	mov    0x18(%rsi),%r11
     2f7:	4c 8b 56 10          	mov    0x10(%rsi),%r10
     2fb:	48 31 d2             	xor    %rdx,%rdx
     2fe:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
     302:	4c 8b 06             	mov    (%rsi),%r8
     305:	4c 0f a5 da          	shld   %cl,%r11,%rdx
     309:	4d 0f a5 d3          	shld   %cl,%r10,%r11
     30d:	4d 0f a5 ca          	shld   %cl,%r9,%r10
     311:	48 89 57 20          	mov    %rdx,0x20(%rdi)
     315:	4c 89 5f 18          	mov    %r11,0x18(%rdi)
     319:	4d 0f a5 c1          	shld   %cl,%r8,%r9
     31d:	49 d3 e0             	shl    %cl,%r8
     320:	4c 89 57 10          	mov    %r10,0x10(%rdi)
     324:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     328:	4c 89 07             	mov    %r8,(%rdi)
     32b:	c3                   	retq   

000000000000032c <mpi_shift_l1_mod_p256_x86_64>:
     32c:	48 8b 16             	mov    (%rsi),%rdx
     32f:	48 8b 46 08          	mov    0x8(%rsi),%rax
     333:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
     337:	4c 8b 46 18          	mov    0x18(%rsi),%r8
     33b:	49 b9 ff ff ff ff 00 	movabs $0xffffffff,%r9
     342:	00 00 00 
     345:	49 ba 01 00 00 00 ff 	movabs $0xffffffff00000001,%r10
     34c:	ff ff ff 
     34f:	48 01 d2             	add    %rdx,%rdx
     352:	48 11 c0             	adc    %rax,%rax
     355:	48 11 c9             	adc    %rcx,%rcx
     358:	49 c7 c3 00 00 00 00 	mov    $0x0,%r11
     35f:	4d 11 c0             	adc    %r8,%r8
     362:	49 83 db 00          	sbb    $0x0,%r11
     366:	4d 21 d9             	and    %r11,%r9
     369:	4d 21 da             	and    %r11,%r10
     36c:	4c 29 da             	sub    %r11,%rdx
     36f:	4c 19 c8             	sbb    %r9,%rax
     372:	48 89 17             	mov    %rdx,(%rdi)
     375:	48 83 d9 00          	sbb    $0x0,%rcx
     379:	48 89 47 08          	mov    %rax,0x8(%rdi)
     37d:	4d 19 d0             	sbb    %r10,%r8
     380:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     384:	4c 89 47 18          	mov    %r8,0x18(%rdi)
     388:	c3                   	retq   
     389:	0f 1f 00             	nopl   (%rax)

000000000000038c <mpi_shift_r_x86_64>:
     38c:	48 89 d1             	mov    %rdx,%rcx
     38f:	48 31 c0             	xor    %rax,%rax
     392:	48 ff ce             	dec    %rsi
     395:	74 12                	je     3a9 <.shr_last>

0000000000000397 <.shr_loop>:
     397:	4c 8b 44 c7 08       	mov    0x8(%rdi,%rax,8),%r8
     39c:	4c 0f ad 04 c7       	shrd   %cl,%r8,(%rdi,%rax,8)
     3a1:	48 ff c0             	inc    %rax
     3a4:	48 39 c6             	cmp    %rax,%rsi
     3a7:	7f ee                	jg     397 <.shr_loop>

00000000000003a9 <.shr_last>:
     3a9:	48 d3 2c c7          	shrq   %cl,(%rdi,%rax,8)
     3ad:	c3                   	retq   
     3ae:	66 90                	xchg   %ax,%ax

00000000000003b0 <mpi_shift_r_x86_64_4>:
     3b0:	48 89 f1             	mov    %rsi,%rcx
     3b3:	4c 8b 47 08          	mov    0x8(%rdi),%r8
     3b7:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
     3bb:	4c 8b 57 18          	mov    0x18(%rdi),%r10
     3bf:	4c 0f ad 07          	shrd   %cl,%r8,(%rdi)
     3c3:	4c 0f ad 4f 08       	shrd   %cl,%r9,0x8(%rdi)
     3c8:	4c 0f ad 57 10       	shrd   %cl,%r10,0x10(%rdi)
     3cd:	48 d3 6f 18          	shrq   %cl,0x18(%rdi)
     3d1:	c3                   	retq   
     3d2:	66 90                	xchg   %ax,%ax

00000000000003d4 <mpi_div2_x86_64_4>:
     3d4:	48 8b 16             	mov    (%rsi),%rdx
     3d7:	48 8b 46 08          	mov    0x8(%rsi),%rax
     3db:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
     3df:	4c 8b 46 18          	mov    0x18(%rsi),%r8
     3e3:	49 b9 ff ff ff ff 00 	movabs $0xffffffff,%r9
     3ea:	00 00 00 
     3ed:	49 ba 01 00 00 00 ff 	movabs $0xffffffff00000001,%r10
     3f4:	ff ff ff 
     3f7:	49 89 d3             	mov    %rdx,%r11
     3fa:	49 83 e3 01          	and    $0x1,%r11
     3fe:	49 f7 db             	neg    %r11
     401:	4d 21 d9             	and    %r11,%r9
     404:	4d 21 da             	and    %r11,%r10
     407:	4c 01 da             	add    %r11,%rdx
     40a:	4c 11 c8             	adc    %r9,%rax
     40d:	48 83 d1 00          	adc    $0x0,%rcx
     411:	4d 11 d0             	adc    %r10,%r8
     414:	49 c7 c3 00 00 00 00 	mov    $0x0,%r11
     41b:	49 83 d3 00          	adc    $0x0,%r11
     41f:	48 0f ac c2 01       	shrd   $0x1,%rax,%rdx
     424:	48 0f ac c8 01       	shrd   $0x1,%rcx,%rax
     429:	4c 0f ac c1 01       	shrd   $0x1,%r8,%rcx
     42e:	4d 0f ac d8 01       	shrd   $0x1,%r11,%r8
     433:	48 89 17             	mov    %rdx,(%rdi)
     436:	48 89 47 08          	mov    %rax,0x8(%rdi)
     43a:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     43e:	4c 89 47 18          	mov    %r8,0x18(%rdi)
     442:	c3                   	retq   
     443:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     44a:	00 00 00 00 
     44e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     455:	00 00 00 00 
     459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000460 <mpi_tpl_mod_p256_x86_64>:
     460:	48 8b 16             	mov    (%rsi),%rdx
     463:	48 8b 46 08          	mov    0x8(%rsi),%rax
     467:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
     46b:	4c 8b 46 18          	mov    0x18(%rsi),%r8
     46f:	49 b9 ff ff ff ff 00 	movabs $0xffffffff,%r9
     476:	00 00 00 
     479:	49 ba 01 00 00 00 ff 	movabs $0xffffffff00000001,%r10
     480:	ff ff ff 
     483:	48 01 d2             	add    %rdx,%rdx
     486:	48 11 c0             	adc    %rax,%rax
     489:	48 11 c9             	adc    %rcx,%rcx
     48c:	49 c7 c3 00 00 00 00 	mov    $0x0,%r11
     493:	4d 11 c0             	adc    %r8,%r8
     496:	49 83 db 00          	sbb    $0x0,%r11
     49a:	4d 21 d9             	and    %r11,%r9
     49d:	4d 21 da             	and    %r11,%r10
     4a0:	4c 29 da             	sub    %r11,%rdx
     4a3:	4c 19 c8             	sbb    %r9,%rax
     4a6:	48 83 d9 00          	sbb    $0x0,%rcx
     4aa:	4d 19 d0             	sbb    %r10,%r8
     4ad:	49 b9 ff ff ff ff 00 	movabs $0xffffffff,%r9
     4b4:	00 00 00 
     4b7:	49 ba 01 00 00 00 ff 	movabs $0xffffffff00000001,%r10
     4be:	ff ff ff 
     4c1:	48 03 16             	add    (%rsi),%rdx
     4c4:	48 13 46 08          	adc    0x8(%rsi),%rax
     4c8:	48 13 4e 10          	adc    0x10(%rsi),%rcx
     4cc:	49 c7 c3 00 00 00 00 	mov    $0x0,%r11
     4d3:	4c 13 46 18          	adc    0x18(%rsi),%r8
     4d7:	49 83 db 00          	sbb    $0x0,%r11
     4db:	4d 21 d9             	and    %r11,%r9
     4de:	4d 21 da             	and    %r11,%r10
     4e1:	4c 29 da             	sub    %r11,%rdx
     4e4:	4c 19 c8             	sbb    %r9,%rax
     4e7:	48 89 17             	mov    %rdx,(%rdi)
     4ea:	48 83 d9 00          	sbb    $0x0,%rcx
     4ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
     4f2:	4d 19 d0             	sbb    %r10,%r8
     4f5:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     4f9:	4c 89 47 18          	mov    %r8,0x18(%rdi)
     4fd:	c3                   	retq   
     4fe:	66 90                	xchg   %ax,%ax

0000000000000500 <mpi_mul_x86_64_4>:
     500:	41 54                	push   %r12
     502:	41 55                	push   %r13
     504:	41 56                	push   %r14
     506:	41 57                	push   %r15
     508:	53                   	push   %rbx
     509:	48 89 d0             	mov    %rdx,%rax
     50c:	48 8b 10             	mov    (%rax),%rdx
     50f:	c4 62 b3 f6 16       	mulx   (%rsi),%r9,%r10
     514:	c4 62 a3 f6 66 10    	mulx   0x10(%rsi),%r11,%r12
     51a:	c4 62 f3 f6 46 08    	mulx   0x8(%rsi),%rcx,%r8
     520:	48 31 db             	xor    %rbx,%rbx
     523:	66 4c 0f 38 f6 d1    	adcx   %rcx,%r10
     529:	48 8b 50 18          	mov    0x18(%rax),%rdx
     52d:	c4 62 93 f6 76 08    	mulx   0x8(%rsi),%r13,%r14
     533:	66 4d 0f 38 f6 d8    	adcx   %r8,%r11
     539:	48 8b 50 08          	mov    0x8(%rax),%rdx
     53d:	c4 62 f3 f6 06       	mulx   (%rsi),%rcx,%r8
     542:	f3 4c 0f 38 f6 d1    	adox   %rcx,%r10
     548:	c4 62 f3 f6 7e 10    	mulx   0x10(%rsi),%rcx,%r15
     54e:	f3 4d 0f 38 f6 d8    	adox   %r8,%r11
     554:	66 4c 0f 38 f6 e1    	adcx   %rcx,%r12
     55a:	48 8b 50 10          	mov    0x10(%rax),%rdx
     55e:	c4 62 f3 f6 46 08    	mulx   0x8(%rsi),%rcx,%r8
     564:	66 4d 0f 38 f6 ef    	adcx   %r15,%r13
     56a:	f3 4c 0f 38 f6 e1    	adox   %rcx,%r12
     570:	66 4c 0f 38 f6 f3    	adcx   %rbx,%r14
     576:	f3 4d 0f 38 f6 e8    	adox   %r8,%r13
     57c:	c4 62 f3 f6 06       	mulx   (%rsi),%rcx,%r8
     581:	f3 4c 0f 38 f6 f3    	adox   %rbx,%r14
     587:	4d 31 ff             	xor    %r15,%r15
     58a:	66 4c 0f 38 f6 d9    	adcx   %rcx,%r11
     590:	48 8b 50 08          	mov    0x8(%rax),%rdx
     594:	c4 e2 eb f6 4e 08    	mulx   0x8(%rsi),%rdx,%rcx
     59a:	66 4d 0f 38 f6 e0    	adcx   %r8,%r12
     5a0:	f3 4c 0f 38 f6 da    	adox   %rdx,%r11
     5a6:	48 8b 50 08          	mov    0x8(%rax),%rdx
     5aa:	f3 4c 0f 38 f6 e1    	adox   %rcx,%r12
     5b0:	c4 62 f3 f6 46 18    	mulx   0x18(%rsi),%rcx,%r8
     5b6:	66 4c 0f 38 f6 e9    	adcx   %rcx,%r13
     5bc:	48 8b 50 10          	mov    0x10(%rax),%rdx
     5c0:	c4 e2 eb f6 4e 10    	mulx   0x10(%rsi),%rdx,%rcx
     5c6:	66 4d 0f 38 f6 f0    	adcx   %r8,%r14
     5cc:	f3 4c 0f 38 f6 ea    	adox   %rdx,%r13
     5d2:	48 8b 50 18          	mov    0x18(%rax),%rdx
     5d6:	f3 4c 0f 38 f6 f1    	adox   %rcx,%r14
     5dc:	c4 62 f3 f6 46 18    	mulx   0x18(%rsi),%rcx,%r8
     5e2:	f3 4c 0f 38 f6 fb    	adox   %rbx,%r15
     5e8:	66 4c 0f 38 f6 f9    	adcx   %rcx,%r15
     5ee:	c4 e2 eb f6 0e       	mulx   (%rsi),%rdx,%rcx
     5f3:	66 49 0f 38 f6 d8    	adcx   %r8,%rbx
     5f9:	4d 31 c0             	xor    %r8,%r8
     5fc:	66 4c 0f 38 f6 e2    	adcx   %rdx,%r12
     602:	48 8b 10             	mov    (%rax),%rdx
     605:	66 4c 0f 38 f6 e9    	adcx   %rcx,%r13
     60b:	c4 e2 eb f6 4e 18    	mulx   0x18(%rsi),%rdx,%rcx
     611:	f3 4c 0f 38 f6 e2    	adox   %rdx,%r12
     617:	f3 4c 0f 38 f6 e9    	adox   %rcx,%r13
     61d:	48 8b 50 18          	mov    0x18(%rax),%rdx
     621:	c4 e2 eb f6 4e 10    	mulx   0x10(%rsi),%rdx,%rcx
     627:	66 4c 0f 38 f6 f2    	adcx   %rdx,%r14
     62d:	48 8b 50 10          	mov    0x10(%rax),%rdx
     631:	66 4c 0f 38 f6 f9    	adcx   %rcx,%r15
     637:	c4 e2 f3 f6 56 18    	mulx   0x18(%rsi),%rcx,%rdx
     63d:	66 49 0f 38 f6 d8    	adcx   %r8,%rbx
     643:	f3 4c 0f 38 f6 f1    	adox   %rcx,%r14
     649:	f3 4c 0f 38 f6 fa    	adox   %rdx,%r15
     64f:	f3 49 0f 38 f6 d8    	adox   %r8,%rbx
     655:	4c 89 0f             	mov    %r9,(%rdi)
     658:	4c 89 57 08          	mov    %r10,0x8(%rdi)
     65c:	4c 89 5f 10          	mov    %r11,0x10(%rdi)
     660:	4c 89 67 18          	mov    %r12,0x18(%rdi)
     664:	4c 89 6f 20          	mov    %r13,0x20(%rdi)
     668:	4c 89 77 28          	mov    %r14,0x28(%rdi)
     66c:	4c 89 7f 30          	mov    %r15,0x30(%rdi)
     670:	48 89 5f 38          	mov    %rbx,0x38(%rdi)
     674:	5b                   	pop    %rbx
     675:	41 5f                	pop    %r15
     677:	41 5e                	pop    %r14
     679:	41 5d                	pop    %r13
     67b:	41 5c                	pop    %r12
     67d:	c3                   	retq   
     67e:	66 90                	xchg   %ax,%ax

0000000000000680 <mpi_sqr_x86_64_4>:
     680:	53                   	push   %rbx
     681:	41 54                	push   %r12
     683:	41 55                	push   %r13
     685:	41 56                	push   %r14
     687:	41 57                	push   %r15
     689:	48 8b 16             	mov    (%rsi),%rdx
     68c:	c4 62 b3 f6 56 08    	mulx   0x8(%rsi),%r9,%r10
     692:	c4 62 a3 f6 66 18    	mulx   0x18(%rsi),%r11,%r12
     698:	48 8b 56 10          	mov    0x10(%rsi),%rdx
     69c:	c4 e2 f3 f6 5e 08    	mulx   0x8(%rsi),%rcx,%rbx
     6a2:	4d 31 ff             	xor    %r15,%r15
     6a5:	f3 4c 0f 38 f6 d9    	adox   %rcx,%r11
     6ab:	c4 62 93 f6 76 18    	mulx   0x18(%rsi),%r13,%r14
     6b1:	f3 4c 0f 38 f6 e3    	adox   %rbx,%r12
     6b7:	c4 e2 f3 f6 1e       	mulx   (%rsi),%rcx,%rbx
     6bc:	f3 4d 0f 38 f6 ef    	adox   %r15,%r13
     6c2:	66 4c 0f 38 f6 d1    	adcx   %rcx,%r10
     6c8:	f3 4d 0f 38 f6 f7    	adox   %r15,%r14
     6ce:	48 8b 56 08          	mov    0x8(%rsi),%rdx
     6d2:	c4 62 fb f6 46 18    	mulx   0x18(%rsi),%rax,%r8
     6d8:	66 4c 0f 38 f6 db    	adcx   %rbx,%r11
     6de:	66 4c 0f 38 f6 e0    	adcx   %rax,%r12
     6e4:	66 4d 0f 38 f6 e8    	adcx   %r8,%r13
     6ea:	66 4d 0f 38 f6 f7    	adcx   %r15,%r14
     6f0:	4d 31 ff             	xor    %r15,%r15
     6f3:	48 8b 16             	mov    (%rsi),%rdx
     6f6:	c4 e2 bb f6 c2       	mulx   %rdx,%r8,%rax
     6fb:	66 4d 0f 38 f6 c9    	adcx   %r9,%r9
     701:	48 8b 56 08          	mov    0x8(%rsi),%rdx
     705:	c4 e2 f3 f6 da       	mulx   %rdx,%rcx,%rbx
     70a:	66 4d 0f 38 f6 d2    	adcx   %r10,%r10
     710:	f3 4c 0f 38 f6 c8    	adox   %rax,%r9
     716:	66 4d 0f 38 f6 db    	adcx   %r11,%r11
     71c:	f3 4c 0f 38 f6 d1    	adox   %rcx,%r10
     722:	48 8b 56 10          	mov    0x10(%rsi),%rdx
     726:	c4 e2 fb f6 ca       	mulx   %rdx,%rax,%rcx
     72b:	66 4d 0f 38 f6 e4    	adcx   %r12,%r12
     731:	f3 4c 0f 38 f6 db    	adox   %rbx,%r11
     737:	66 4d 0f 38 f6 ed    	adcx   %r13,%r13
     73d:	f3 4c 0f 38 f6 e0    	adox   %rax,%r12
     743:	48 8b 56 18          	mov    0x18(%rsi),%rdx
     747:	c4 e2 fb f6 da       	mulx   %rdx,%rax,%rbx
     74c:	66 4d 0f 38 f6 f6    	adcx   %r14,%r14
     752:	f3 4c 0f 38 f6 e9    	adox   %rcx,%r13
     758:	66 4d 0f 38 f6 ff    	adcx   %r15,%r15
     75e:	f3 4c 0f 38 f6 f0    	adox   %rax,%r14
     764:	f3 4c 0f 38 f6 fb    	adox   %rbx,%r15
     76a:	4c 89 07             	mov    %r8,(%rdi)
     76d:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     771:	4c 89 57 10          	mov    %r10,0x10(%rdi)
     775:	4c 89 5f 18          	mov    %r11,0x18(%rdi)
     779:	4c 89 67 20          	mov    %r12,0x20(%rdi)
     77d:	4c 89 6f 28          	mov    %r13,0x28(%rdi)
     781:	4c 89 77 30          	mov    %r14,0x30(%rdi)
     785:	4c 89 7f 38          	mov    %r15,0x38(%rdi)
     789:	41 5f                	pop    %r15
     78b:	41 5e                	pop    %r14
     78d:	41 5d                	pop    %r13
     78f:	41 5c                	pop    %r12
     791:	5b                   	pop    %rbx
     792:	c3                   	retq   
     793:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     79a:	00 00 00 00 
     79e:	66 90                	xchg   %ax,%ax

00000000000007a0 <mpi_sqr_mont_mod_p256_x86_64>:
     7a0:	41 54                	push   %r12
     7a2:	41 55                	push   %r13
     7a4:	41 56                	push   %r14
     7a6:	41 57                	push   %r15
     7a8:	53                   	push   %rbx
     7a9:	48 8b 06             	mov    (%rsi),%rax
     7ac:	48 f7 66 08          	mulq   0x8(%rsi)
     7b0:	49 89 c1             	mov    %rax,%r9
     7b3:	49 89 d2             	mov    %rdx,%r10
     7b6:	48 8b 06             	mov    (%rsi),%rax
     7b9:	48 f7 66 10          	mulq   0x10(%rsi)
     7bd:	4d 31 db             	xor    %r11,%r11
     7c0:	49 01 c2             	add    %rax,%r10
     7c3:	49 11 d3             	adc    %rdx,%r11
     7c6:	48 8b 06             	mov    (%rsi),%rax
     7c9:	48 f7 66 18          	mulq   0x18(%rsi)
     7cd:	4d 31 e4             	xor    %r12,%r12
     7d0:	49 01 c3             	add    %rax,%r11
     7d3:	49 11 d4             	adc    %rdx,%r12
     7d6:	48 8b 46 08          	mov    0x8(%rsi),%rax
     7da:	48 f7 66 10          	mulq   0x10(%rsi)
     7de:	4d 31 ed             	xor    %r13,%r13
     7e1:	49 01 c3             	add    %rax,%r11
     7e4:	49 11 d4             	adc    %rdx,%r12
     7e7:	49 83 d5 00          	adc    $0x0,%r13
     7eb:	48 8b 46 08          	mov    0x8(%rsi),%rax
     7ef:	48 f7 66 18          	mulq   0x18(%rsi)
     7f3:	49 01 c4             	add    %rax,%r12
     7f6:	49 11 d5             	adc    %rdx,%r13
     7f9:	48 8b 46 10          	mov    0x10(%rsi),%rax
     7fd:	48 f7 66 18          	mulq   0x18(%rsi)
     801:	4d 31 f6             	xor    %r14,%r14
     804:	49 01 c5             	add    %rax,%r13
     807:	49 11 d6             	adc    %rdx,%r14
     80a:	4d 31 ff             	xor    %r15,%r15
     80d:	4d 01 c9             	add    %r9,%r9
     810:	4d 11 d2             	adc    %r10,%r10
     813:	4d 11 db             	adc    %r11,%r11
     816:	4d 11 e4             	adc    %r12,%r12
     819:	4d 11 ed             	adc    %r13,%r13
     81c:	4d 11 f6             	adc    %r14,%r14
     81f:	49 83 d7 00          	adc    $0x0,%r15
     823:	48 8b 06             	mov    (%rsi),%rax
     826:	48 f7 e0             	mul    %rax
     829:	48 89 c0             	mov    %rax,%rax
     82c:	48 89 d2             	mov    %rdx,%rdx
     82f:	49 89 c0             	mov    %rax,%r8
     832:	48 89 d3             	mov    %rdx,%rbx
     835:	48 8b 46 08          	mov    0x8(%rsi),%rax
     839:	48 f7 e0             	mul    %rax
     83c:	48 89 c0             	mov    %rax,%rax
     83f:	48 89 d2             	mov    %rdx,%rdx
     842:	49 01 d9             	add    %rbx,%r9
     845:	49 11 c2             	adc    %rax,%r10
     848:	48 83 d2 00          	adc    $0x0,%rdx
     84c:	48 89 d3             	mov    %rdx,%rbx
     84f:	48 8b 46 10          	mov    0x10(%rsi),%rax
     853:	48 f7 e0             	mul    %rax
     856:	48 89 c0             	mov    %rax,%rax
     859:	48 89 d2             	mov    %rdx,%rdx
     85c:	49 01 db             	add    %rbx,%r11
     85f:	49 11 c4             	adc    %rax,%r12
     862:	48 83 d2 00          	adc    $0x0,%rdx
     866:	48 89 d3             	mov    %rdx,%rbx
     869:	48 8b 46 18          	mov    0x18(%rsi),%rax
     86d:	48 f7 e0             	mul    %rax
     870:	48 89 c0             	mov    %rax,%rax
     873:	48 89 d2             	mov    %rdx,%rdx
     876:	49 01 dd             	add    %rbx,%r13
     879:	49 11 c6             	adc    %rax,%r14
     87c:	49 11 d7             	adc    %rdx,%r15
     87f:	4c 89 c0             	mov    %r8,%rax
     882:	4c 89 da             	mov    %r11,%rdx
     885:	4c 01 c2             	add    %r8,%rdx
     888:	4c 89 ce             	mov    %r9,%rsi
     88b:	4c 01 c2             	add    %r8,%rdx
     88e:	4c 89 d3             	mov    %r10,%rbx
     891:	49 c1 e0 20          	shl    $0x20,%r8
     895:	49 0f a4 f2 20       	shld   $0x20,%rsi,%r10
     89a:	49 0f a4 c1 20       	shld   $0x20,%rax,%r9
     89f:	4c 29 c2             	sub    %r8,%rdx
     8a2:	4c 01 c6             	add    %r8,%rsi
     8a5:	4c 11 cb             	adc    %r9,%rbx
     8a8:	4c 11 d2             	adc    %r10,%rdx
     8ab:	4d 31 c0             	xor    %r8,%r8
     8ae:	49 01 c4             	add    %rax,%r12
     8b1:	49 11 f5             	adc    %rsi,%r13
     8b4:	49 11 de             	adc    %rbx,%r14
     8b7:	49 11 d7             	adc    %rdx,%r15
     8ba:	49 83 d8 00          	sbb    $0x0,%r8
     8be:	49 01 c3             	add    %rax,%r11
     8c1:	49 11 f4             	adc    %rsi,%r12
     8c4:	49 11 dd             	adc    %rbx,%r13
     8c7:	49 11 d6             	adc    %rdx,%r14
     8ca:	49 83 d7 00          	adc    $0x0,%r15
     8ce:	49 83 d8 00          	sbb    $0x0,%r8
     8d2:	48 89 d1             	mov    %rdx,%rcx
     8d5:	48 0f a4 da 20       	shld   $0x20,%rbx,%rdx
     8da:	48 0f a4 f3 20       	shld   $0x20,%rsi,%rbx
     8df:	48 0f a4 c6 20       	shld   $0x20,%rax,%rsi
     8e4:	48 c1 e9 20          	shr    $0x20,%rcx
     8e8:	48 c1 e0 20          	shl    $0x20,%rax
     8ec:	49 01 db             	add    %rbx,%r11
     8ef:	49 11 d4             	adc    %rdx,%r12
     8f2:	49 11 cd             	adc    %rcx,%r13
     8f5:	49 83 d6 00          	adc    $0x0,%r14
     8f9:	49 83 d7 00          	adc    $0x0,%r15
     8fd:	49 83 d8 00          	sbb    $0x0,%r8
     901:	49 29 c3             	sub    %rax,%r11
     904:	49 19 f4             	sbb    %rsi,%r12
     907:	49 19 dd             	sbb    %rbx,%r13
     90a:	49 19 d6             	sbb    %rdx,%r14
     90d:	49 19 cf             	sbb    %rcx,%r15
     910:	49 83 d0 00          	adc    $0x0,%r8
     914:	48 b8 ff ff ff ff 00 	movabs $0xffffffff,%rax
     91b:	00 00 00 
     91e:	48 be 01 00 00 00 ff 	movabs $0xffffffff00000001,%rsi
     925:	ff ff ff 
     928:	4c 21 c0             	and    %r8,%rax
     92b:	4c 21 c6             	and    %r8,%rsi
     92e:	4d 29 c4             	sub    %r8,%r12
     931:	49 19 c5             	sbb    %rax,%r13
     934:	49 83 de 00          	sbb    $0x0,%r14
     938:	49 19 f7             	sbb    %rsi,%r15
     93b:	4c 89 27             	mov    %r12,(%rdi)
     93e:	4c 89 6f 08          	mov    %r13,0x8(%rdi)
     942:	4c 89 77 10          	mov    %r14,0x10(%rdi)
     946:	4c 89 7f 18          	mov    %r15,0x18(%rdi)
     94a:	5b                   	pop    %rbx
     94b:	41 5f                	pop    %r15
     94d:	41 5e                	pop    %r14
     94f:	41 5d                	pop    %r13
     951:	41 5c                	pop    %r12
     953:	c3                   	retq   
     954:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     95b:	00 00 00 00 
     95f:	90                   	nop

0000000000000960 <mpi_mul_int_x86_64_4>:
     960:	41 54                	push   %r12
     962:	41 55                	push   %r13
     964:	c4 62 bb f6 0e       	mulx   (%rsi),%r8,%r9
     969:	c4 62 ab f6 5e 08    	mulx   0x8(%rsi),%r10,%r11
     96f:	c4 e2 fb f6 4e 10    	mulx   0x10(%rsi),%rax,%rcx
     975:	4c 89 07             	mov    %r8,(%rdi)
     978:	c4 62 9b f6 6e 18    	mulx   0x18(%rsi),%r12,%r13
     97e:	4d 01 d1             	add    %r10,%r9
     981:	49 11 c3             	adc    %rax,%r11
     984:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
     988:	4c 89 5f 10          	mov    %r11,0x10(%rdi)
     98c:	49 11 cc             	adc    %rcx,%r12
     98f:	49 83 d5 00          	adc    $0x0,%r13
     993:	4c 89 67 18          	mov    %r12,0x18(%rdi)
     997:	4c 89 6f 20          	mov    %r13,0x20(%rdi)
     99b:	41 5d                	pop    %r13
     99d:	41 5c                	pop    %r12
     99f:	c3                   	retq   

00000000000009a0 <mpi_from_mont_p256_x86_64>:
     9a0:	41 55                	push   %r13
     9a2:	41 56                	push   %r14
     9a4:	4d 31 f6             	xor    %r14,%r14
     9a7:	49 c7 c0 04 00 00 00 	mov    $0x4,%r8
     9ae:	49 89 fd             	mov    %rdi,%r13

00000000000009b1 <L_mont_loop_4>:
     9b1:	49 8b 75 00          	mov    0x0(%r13),%rsi
     9b5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
     9bc:	49 ba ff ff ff ff 00 	movabs $0xffffffff,%r10
     9c3:	00 00 00 
     9c6:	48 f7 e6             	mul    %rsi
     9c9:	49 8b 4d 00          	mov    0x0(%r13),%rcx
     9cd:	48 01 c1             	add    %rax,%rcx
     9d0:	49 89 d1             	mov    %rdx,%r9
     9d3:	49 89 4d 00          	mov    %rcx,0x0(%r13)
     9d7:	49 83 d1 00          	adc    $0x0,%r9
     9db:	4c 89 d0             	mov    %r10,%rax
     9de:	48 f7 e6             	mul    %rsi
     9e1:	49 c7 c2 00 00 00 00 	mov    $0x0,%r10
     9e8:	49 8b 4d 08          	mov    0x8(%r13),%rcx
     9ec:	4c 01 c8             	add    %r9,%rax
     9ef:	49 89 d3             	mov    %rdx,%r11
     9f2:	49 83 d3 00          	adc    $0x0,%r11
     9f6:	48 01 c1             	add    %rax,%rcx
     9f9:	49 89 4d 08          	mov    %rcx,0x8(%r13)
     9fd:	49 83 d3 00          	adc    $0x0,%r11
     a01:	4c 89 d0             	mov    %r10,%rax
     a04:	48 f7 e6             	mul    %rsi
     a07:	49 ba 01 00 00 00 ff 	movabs $0xffffffff00000001,%r10
     a0e:	ff ff ff 
     a11:	49 8b 4d 10          	mov    0x10(%r13),%rcx
     a15:	4c 01 d8             	add    %r11,%rax
     a18:	49 89 d1             	mov    %rdx,%r9
     a1b:	49 83 d1 00          	adc    $0x0,%r9
     a1f:	48 01 c1             	add    %rax,%rcx
     a22:	49 89 4d 10          	mov    %rcx,0x10(%r13)
     a26:	49 83 d1 00          	adc    $0x0,%r9
     a2a:	4c 89 d0             	mov    %r10,%rax
     a2d:	48 f7 e6             	mul    %rsi
     a30:	49 8b 4d 18          	mov    0x18(%r13),%rcx
     a34:	4c 01 c8             	add    %r9,%rax
     a37:	4c 11 f2             	adc    %r14,%rdx
     a3a:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14
     a41:	49 83 d6 00          	adc    $0x0,%r14
     a45:	48 01 c1             	add    %rax,%rcx
     a48:	49 89 4d 18          	mov    %rcx,0x18(%r13)
     a4c:	49 11 55 20          	adc    %rdx,0x20(%r13)
     a50:	49 83 d6 00          	adc    $0x0,%r14
     a54:	49 83 c5 08          	add    $0x8,%r13
     a58:	49 ff c8             	dec    %r8
     a5b:	0f 85 50 ff ff ff    	jne    9b1 <L_mont_loop_4>
     a61:	48 31 c0             	xor    %rax,%rax
     a64:	48 8b 57 20          	mov    0x20(%rdi),%rdx
     a68:	4c 8b 47 28          	mov    0x28(%rdi),%r8
     a6c:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
     a70:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
     a74:	4c 29 f0             	sub    %r14,%rax
     a77:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
     a7e:	49 bb ff ff ff ff 00 	movabs $0xffffffff,%r11
     a85:	00 00 00 
     a88:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
     a8f:	49 bd 01 00 00 00 ff 	movabs $0xffffffff00000001,%r13
     a96:	ff ff ff 
     a99:	49 21 c2             	and    %rax,%r10
     a9c:	49 21 c3             	and    %rax,%r11
     a9f:	48 21 c6             	and    %rax,%rsi
     aa2:	49 21 c5             	and    %rax,%r13
     aa5:	4c 29 d2             	sub    %r10,%rdx
     aa8:	4d 19 d8             	sbb    %r11,%r8
     aab:	48 19 f1             	sbb    %rsi,%rcx
     aae:	4d 19 e9             	sbb    %r13,%r9
     ab1:	48 89 17             	mov    %rdx,(%rdi)
     ab4:	4c 89 47 08          	mov    %r8,0x8(%rdi)
     ab8:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
     abc:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
     ac0:	41 5e                	pop    %r14
     ac2:	41 5d                	pop    %r13
     ac4:	c3                   	retq   
     ac5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     acc:	00 00 00 00 
     ad0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     ad7:	00 00 00 00 
     adb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ae0 <ecp_mod_p256_x86_64>:
     ae0:	0f 18 0f             	prefetcht0 (%rdi)
     ae3:	0f 18 0d 00 00 00 00 	prefetcht0 0x0(%rip)        # aea <ecp_mod_p256_x86_64+0xa>
			ae6: R_X86_64_PC32	.rodata+0x3c
     aea:	0f 18 0d 00 00 00 00 	prefetcht0 0x0(%rip)        # af1 <ecp_mod_p256_x86_64+0x11>
			aed: R_X86_64_PC32	.rodata+0xbc
     af1:	0f 18 0d 00 00 00 00 	prefetcht0 0x0(%rip)        # af8 <ecp_mod_p256_x86_64+0x18>
			af4: R_X86_64_PC32	.rodata+0x13c
     af8:	53                   	push   %rbx
     af9:	41 54                	push   %r12
     afb:	41 55                	push   %r13
     afd:	41 56                	push   %r14
     aff:	41 57                	push   %r15
     b01:	48 31 c9             	xor    %rcx,%rcx
     b04:	4c 8b 5f 2c          	mov    0x2c(%rdi),%r11
     b08:	48 8b 57 08          	mov    0x8(%rdi),%rdx
     b0c:	4c 8b 47 10          	mov    0x10(%rdi),%r8
     b10:	4c 8b 67 30          	mov    0x30(%rdi),%r12
     b14:	49 c1 e3 20          	shl    $0x20,%r11
     b18:	4c 8b 4f 18          	mov    0x18(%rdi),%r9
     b1c:	4c 8b 57 38          	mov    0x38(%rdi),%r10
     b20:	4c 01 da             	add    %r11,%rdx
     b23:	4d 11 e0             	adc    %r12,%r8
     b26:	4d 11 d1             	adc    %r10,%r9
     b29:	48 83 d1 00          	adc    $0x0,%rcx
     b2d:	4c 01 da             	add    %r11,%rdx
     b30:	4d 11 e0             	adc    %r12,%r8
     b33:	4d 11 d1             	adc    %r10,%r9
     b36:	48 83 d1 00          	adc    $0x0,%rcx
     b3a:	8b 47 3c             	mov    0x3c(%rdi),%eax
     b3d:	4c 8b 6f 30          	mov    0x30(%rdi),%r13
     b41:	48 8b 77 34          	mov    0x34(%rdi),%rsi
     b45:	49 c1 e5 20          	shl    $0x20,%r13
     b49:	4c 01 ea             	add    %r13,%rdx
     b4c:	49 11 f0             	adc    %rsi,%r8
     b4f:	49 11 c1             	adc    %rax,%r9
     b52:	48 83 d1 00          	adc    $0x0,%rcx
     b56:	4c 01 ea             	add    %r13,%rdx
     b59:	49 11 f0             	adc    %rsi,%r8
     b5c:	49 11 c1             	adc    %rax,%r9
     b5f:	48 83 d1 00          	adc    $0x0,%rcx
     b63:	48 8b 1f             	mov    (%rdi),%rbx
     b66:	4c 8b 77 20          	mov    0x20(%rdi),%r14
     b6a:	8b 47 28             	mov    0x28(%rdi),%eax
     b6d:	4c 01 f3             	add    %r14,%rbx
     b70:	48 11 c2             	adc    %rax,%rdx
     b73:	49 83 d0 00          	adc    $0x0,%r8
     b77:	4d 11 d1             	adc    %r10,%r9
     b7a:	48 83 d1 00          	adc    $0x0,%rcx
     b7e:	49 c1 eb 20          	shr    $0x20,%r11
     b82:	48 c1 e6 20          	shl    $0x20,%rsi
     b86:	4c 8b 7f 24          	mov    0x24(%rdi),%r15
     b8a:	49 09 f3             	or     %rsi,%r11
     b8d:	8b 47 20             	mov    0x20(%rdi),%eax
     b90:	48 c1 ee 20          	shr    $0x20,%rsi
     b94:	48 c1 e0 20          	shl    $0x20,%rax
     b98:	48 09 f0             	or     %rsi,%rax
     b9b:	4c 01 fb             	add    %r15,%rbx
     b9e:	4c 11 da             	adc    %r11,%rdx
     ba1:	4d 11 d0             	adc    %r10,%r8
     ba4:	49 11 c1             	adc    %rax,%r9
     ba7:	48 83 d1 00          	adc    $0x0,%rcx
     bab:	4c 8b 6f 28          	mov    0x28(%rdi),%r13
     baf:	48 c1 e8 20          	shr    $0x20,%rax
     bb3:	49 c1 e5 20          	shl    $0x20,%r13
     bb7:	4c 8b 5f 2c          	mov    0x2c(%rdi),%r11
     bbb:	49 09 c5             	or     %rax,%r13
     bbe:	4c 29 db             	sub    %r11,%rbx
     bc1:	48 19 f2             	sbb    %rsi,%rdx
     bc4:	49 83 d8 00          	sbb    $0x0,%r8
     bc8:	4d 19 e9             	sbb    %r13,%r9
     bcb:	48 83 d9 00          	sbb    $0x0,%rcx
     bcf:	8b 47 24             	mov    0x24(%rdi),%eax
     bd2:	49 c1 e3 20          	shl    $0x20,%r11
     bd6:	49 09 c3             	or     %rax,%r11
     bd9:	4c 29 e3             	sub    %r12,%rbx
     bdc:	4c 19 d2             	sbb    %r10,%rdx
     bdf:	49 83 d8 00          	sbb    $0x0,%r8
     be3:	4d 19 d9             	sbb    %r11,%r9
     be6:	48 83 d9 00          	sbb    $0x0,%rcx
     bea:	4c 8b 5f 34          	mov    0x34(%rdi),%r11
     bee:	4d 0f a4 d5 20       	shld   $0x20,%r10,%r13
     bf3:	49 c1 e4 20          	shl    $0x20,%r12
     bf7:	48 c7 c6 fb ff ff ff 	mov    $0xfffffffffffffffb,%rsi
     bfe:	4c 29 db             	sub    %r11,%rbx
     c01:	48 b8 ff ff ff ff 04 	movabs $0x4ffffffff,%rax
     c08:	00 00 00 
     c0b:	4c 19 ea             	sbb    %r13,%rdx
     c0e:	4d 19 f8             	sbb    %r15,%r8
     c11:	4d 19 e1             	sbb    %r12,%r9
     c14:	48 83 d9 00          	sbb    $0x0,%rcx
     c18:	49 bd 05 00 00 00 fb 	movabs $0xfffffffb00000005,%r13
     c1f:	ff ff ff 
     c22:	4c 8b 77 28          	mov    0x28(%rdi),%r14
     c26:	49 c1 e3 20          	shl    $0x20,%r11
     c2a:	49 c1 e7 20          	shl    $0x20,%r15
     c2e:	4c 29 d3             	sub    %r10,%rbx
     c31:	4c 19 fa             	sbb    %r15,%rdx
     c34:	4d 19 f0             	sbb    %r14,%r8
     c37:	4d 19 d9             	sbb    %r11,%r9
     c3a:	48 83 d9 00          	sbb    $0x0,%rcx
     c3e:	49 ba 00 21 43 65 87 	movabs $0xba98765432100,%r10
     c45:	a9 0b 00 
     c48:	48 01 f3             	add    %rsi,%rbx
     c4b:	48 11 c2             	adc    %rax,%rdx
     c4e:	49 83 d0 00          	adc    $0x0,%r8
     c52:	4d 11 e9             	adc    %r13,%r9
     c55:	48 83 d1 04          	adc    $0x4,%rcx
     c59:	48 89 ce             	mov    %rcx,%rsi
     c5c:	48 c1 e1 02          	shl    $0x2,%rcx
     c60:	4c 8d 25 00 00 00 00 	lea    0x0(%rip),%r12        # c67 <ecp_mod_p256_x86_64+0x187>
			c63: R_X86_64_PC32	.rodata+0x3c
     c67:	49 d3 ea             	shr    %cl,%r10
     c6a:	49 2b 5c cc 18       	sub    0x18(%r12,%rcx,8),%rbx
     c6f:	49 1b 54 cc 10       	sbb    0x10(%r12,%rcx,8),%rdx
     c74:	4d 1b 44 cc 08       	sbb    0x8(%r12,%rcx,8),%r8
     c79:	49 83 e2 0f          	and    $0xf,%r10
     c7d:	4d 1b 0c cc          	sbb    (%r12,%rcx,8),%r9
     c81:	4c 19 d6             	sbb    %r10,%rsi
     c84:	49 bd ff ff ff ff 00 	movabs $0xffffffff,%r13
     c8b:	00 00 00 
     c8e:	49 bc 01 00 00 00 ff 	movabs $0xffffffff00000001,%r12
     c95:	ff ff ff 
     c98:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
     c9f:	48 89 1f             	mov    %rbx,(%rdi)
     ca2:	48 89 57 08          	mov    %rdx,0x8(%rdi)
     ca6:	4c 89 47 10          	mov    %r8,0x10(%rdi)
     caa:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
     cae:	4c 29 d3             	sub    %r10,%rbx
     cb1:	4c 19 ea             	sbb    %r13,%rdx
     cb4:	49 83 d8 00          	sbb    $0x0,%r8
     cb8:	4d 19 e1             	sbb    %r12,%r9
     cbb:	48 83 de 00          	sbb    $0x0,%rsi
     cbf:	72 0f                	jb     cd0 <.mod_p256_done>
     cc1:	48 89 1f             	mov    %rbx,(%rdi)
     cc4:	48 89 57 08          	mov    %rdx,0x8(%rdi)
     cc8:	4c 89 47 10          	mov    %r8,0x10(%rdi)
     ccc:	4c 89 4f 18          	mov    %r9,0x18(%rdi)

0000000000000cd0 <.mod_p256_done>:
     cd0:	41 5f                	pop    %r15
     cd2:	41 5e                	pop    %r14
     cd4:	41 5d                	pop    %r13
     cd6:	41 5c                	pop    %r12
     cd8:	5b                   	pop    %rbx
     cd9:	c3                   	retq   
     cda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000ce0 <mpi_mul_mont_mod_p256_x86_64>:
     ce0:	41 54                	push   %r12
     ce2:	41 55                	push   %r13
     ce4:	41 56                	push   %r14
     ce6:	41 57                	push   %r15
     ce8:	53                   	push   %rbx
     ce9:	49 89 d0             	mov    %rdx,%r8
     cec:	49 8b 00             	mov    (%r8),%rax
     cef:	48 f7 26             	mulq   (%rsi)
     cf2:	49 89 c1             	mov    %rax,%r9
     cf5:	49 89 d2             	mov    %rdx,%r10
     cf8:	49 8b 40 08          	mov    0x8(%r8),%rax
     cfc:	48 f7 26             	mulq   (%rsi)
     cff:	4d 31 db             	xor    %r11,%r11
     d02:	49 01 c2             	add    %rax,%r10
     d05:	49 11 d3             	adc    %rdx,%r11
     d08:	49 8b 00             	mov    (%r8),%rax
     d0b:	48 f7 66 08          	mulq   0x8(%rsi)
     d0f:	4d 31 e4             	xor    %r12,%r12
     d12:	49 01 c2             	add    %rax,%r10
     d15:	49 11 d3             	adc    %rdx,%r11
     d18:	49 83 d4 00          	adc    $0x0,%r12
     d1c:	49 8b 40 10          	mov    0x10(%r8),%rax
     d20:	48 f7 26             	mulq   (%rsi)
     d23:	49 01 c3             	add    %rax,%r11
     d26:	49 11 d4             	adc    %rdx,%r12
     d29:	49 8b 40 08          	mov    0x8(%r8),%rax
     d2d:	48 f7 66 08          	mulq   0x8(%rsi)
     d31:	4d 31 ed             	xor    %r13,%r13
     d34:	49 01 c3             	add    %rax,%r11
     d37:	49 11 d4             	adc    %rdx,%r12
     d3a:	49 83 d5 00          	adc    $0x0,%r13
     d3e:	49 8b 00             	mov    (%r8),%rax
     d41:	48 f7 66 10          	mulq   0x10(%rsi)
     d45:	49 01 c3             	add    %rax,%r11
     d48:	49 11 d4             	adc    %rdx,%r12
     d4b:	49 83 d5 00          	adc    $0x0,%r13
     d4f:	49 8b 40 18          	mov    0x18(%r8),%rax
     d53:	48 f7 26             	mulq   (%rsi)
     d56:	4d 31 f6             	xor    %r14,%r14
     d59:	49 01 c4             	add    %rax,%r12
     d5c:	49 11 d5             	adc    %rdx,%r13
     d5f:	49 83 d6 00          	adc    $0x0,%r14
     d63:	49 8b 40 10          	mov    0x10(%r8),%rax
     d67:	48 f7 66 08          	mulq   0x8(%rsi)
     d6b:	49 01 c4             	add    %rax,%r12
     d6e:	49 11 d5             	adc    %rdx,%r13
     d71:	49 83 d6 00          	adc    $0x0,%r14
     d75:	49 8b 40 08          	mov    0x8(%r8),%rax
     d79:	48 f7 66 10          	mulq   0x10(%rsi)
     d7d:	49 01 c4             	add    %rax,%r12
     d80:	49 11 d5             	adc    %rdx,%r13
     d83:	49 83 d6 00          	adc    $0x0,%r14
     d87:	49 8b 00             	mov    (%r8),%rax
     d8a:	48 f7 66 18          	mulq   0x18(%rsi)
     d8e:	49 01 c4             	add    %rax,%r12
     d91:	49 11 d5             	adc    %rdx,%r13
     d94:	49 83 d6 00          	adc    $0x0,%r14
     d98:	49 8b 40 18          	mov    0x18(%r8),%rax
     d9c:	48 f7 66 08          	mulq   0x8(%rsi)
     da0:	4d 31 ff             	xor    %r15,%r15
     da3:	49 01 c5             	add    %rax,%r13
     da6:	49 11 d6             	adc    %rdx,%r14
     da9:	49 83 d7 00          	adc    $0x0,%r15
     dad:	49 8b 40 10          	mov    0x10(%r8),%rax
     db1:	48 f7 66 10          	mulq   0x10(%rsi)
     db5:	49 01 c5             	add    %rax,%r13
     db8:	49 11 d6             	adc    %rdx,%r14
     dbb:	49 83 d7 00          	adc    $0x0,%r15
     dbf:	49 8b 40 08          	mov    0x8(%r8),%rax
     dc3:	48 f7 66 18          	mulq   0x18(%rsi)
     dc7:	49 01 c5             	add    %rax,%r13
     dca:	49 11 d6             	adc    %rdx,%r14
     dcd:	49 83 d7 00          	adc    $0x0,%r15
     dd1:	49 8b 40 18          	mov    0x18(%r8),%rax
     dd5:	48 f7 66 10          	mulq   0x10(%rsi)
     dd9:	48 31 db             	xor    %rbx,%rbx
     ddc:	49 01 c6             	add    %rax,%r14
     ddf:	49 11 d7             	adc    %rdx,%r15
     de2:	48 83 d3 00          	adc    $0x0,%rbx
     de6:	49 8b 40 10          	mov    0x10(%r8),%rax
     dea:	48 f7 66 18          	mulq   0x18(%rsi)
     dee:	49 01 c6             	add    %rax,%r14
     df1:	49 11 d7             	adc    %rdx,%r15
     df4:	48 83 d3 00          	adc    $0x0,%rbx
     df8:	49 8b 40 18          	mov    0x18(%r8),%rax
     dfc:	48 f7 66 18          	mulq   0x18(%rsi)
     e00:	49 01 c7             	add    %rax,%r15
     e03:	48 11 d3             	adc    %rdx,%rbx
     e06:	4c 89 c8             	mov    %r9,%rax
     e09:	4c 89 e2             	mov    %r12,%rdx
     e0c:	4c 01 ca             	add    %r9,%rdx
     e0f:	4c 89 d6             	mov    %r10,%rsi
     e12:	4c 01 ca             	add    %r9,%rdx
     e15:	4d 89 d8             	mov    %r11,%r8
     e18:	49 c1 e1 20          	shl    $0x20,%r9
     e1c:	49 0f a4 f3 20       	shld   $0x20,%rsi,%r11
     e21:	49 0f a4 c2 20       	shld   $0x20,%rax,%r10
     e26:	4c 29 ca             	sub    %r9,%rdx
     e29:	4c 01 ce             	add    %r9,%rsi
     e2c:	4d 11 d0             	adc    %r10,%r8
     e2f:	4c 11 da             	adc    %r11,%rdx
     e32:	4d 31 c9             	xor    %r9,%r9
     e35:	49 01 c5             	add    %rax,%r13
     e38:	49 11 f6             	adc    %rsi,%r14
     e3b:	4d 11 c7             	adc    %r8,%r15
     e3e:	48 11 d3             	adc    %rdx,%rbx
     e41:	49 83 d9 00          	sbb    $0x0,%r9
     e45:	49 01 c4             	add    %rax,%r12
     e48:	49 11 f5             	adc    %rsi,%r13
     e4b:	4d 11 c6             	adc    %r8,%r14
     e4e:	49 11 d7             	adc    %rdx,%r15
     e51:	48 83 d3 00          	adc    $0x0,%rbx
     e55:	49 83 d9 00          	sbb    $0x0,%r9
     e59:	48 89 d1             	mov    %rdx,%rcx
     e5c:	4c 0f a4 c2 20       	shld   $0x20,%r8,%rdx
     e61:	49 0f a4 f0 20       	shld   $0x20,%rsi,%r8
     e66:	48 0f a4 c6 20       	shld   $0x20,%rax,%rsi
     e6b:	48 c1 e9 20          	shr    $0x20,%rcx
     e6f:	48 c1 e0 20          	shl    $0x20,%rax
     e73:	4d 01 c4             	add    %r8,%r12
     e76:	49 11 d5             	adc    %rdx,%r13
     e79:	49 11 ce             	adc    %rcx,%r14
     e7c:	49 83 d7 00          	adc    $0x0,%r15
     e80:	48 83 d3 00          	adc    $0x0,%rbx
     e84:	49 83 d9 00          	sbb    $0x0,%r9
     e88:	49 29 c4             	sub    %rax,%r12
     e8b:	49 19 f5             	sbb    %rsi,%r13
     e8e:	4d 19 c6             	sbb    %r8,%r14
     e91:	49 19 d7             	sbb    %rdx,%r15
     e94:	48 19 cb             	sbb    %rcx,%rbx
     e97:	49 83 d1 00          	adc    $0x0,%r9
     e9b:	48 b8 ff ff ff ff 00 	movabs $0xffffffff,%rax
     ea2:	00 00 00 
     ea5:	48 be 01 00 00 00 ff 	movabs $0xffffffff00000001,%rsi
     eac:	ff ff ff 
     eaf:	4c 21 c8             	and    %r9,%rax
     eb2:	4c 21 ce             	and    %r9,%rsi
     eb5:	4d 29 cd             	sub    %r9,%r13
     eb8:	49 19 c6             	sbb    %rax,%r14
     ebb:	49 83 df 00          	sbb    $0x0,%r15
     ebf:	48 19 f3             	sbb    %rsi,%rbx
     ec2:	4c 89 2f             	mov    %r13,(%rdi)
     ec5:	4c 89 77 08          	mov    %r14,0x8(%rdi)
     ec9:	4c 89 7f 10          	mov    %r15,0x10(%rdi)
     ecd:	48 89 5f 18          	mov    %rbx,0x18(%rdi)
     ed1:	5b                   	pop    %rbx
     ed2:	41 5f                	pop    %r15
     ed4:	41 5e                	pop    %r14
     ed6:	41 5d                	pop    %r13
     ed8:	41 5c                	pop    %r12
     eda:	c3                   	retq   
     edb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ee0 <mpi_mul_mod_p256_x86_64_4>:
     ee0:	41 54                	push   %r12
     ee2:	41 55                	push   %r13
     ee4:	41 56                	push   %r14
     ee6:	41 57                	push   %r15
     ee8:	53                   	push   %rbx
     ee9:	48 89 d0             	mov    %rdx,%rax
     eec:	48 8b 10             	mov    (%rax),%rdx
     eef:	c4 62 b3 f6 16       	mulx   (%rsi),%r9,%r10
     ef4:	c4 62 a3 f6 66 10    	mulx   0x10(%rsi),%r11,%r12
     efa:	c4 62 f3 f6 46 08    	mulx   0x8(%rsi),%rcx,%r8
     f00:	48 31 db             	xor    %rbx,%rbx
     f03:	66 4c 0f 38 f6 d1    	adcx   %rcx,%r10
     f09:	48 8b 50 18          	mov    0x18(%rax),%rdx
     f0d:	c4 62 93 f6 76 08    	mulx   0x8(%rsi),%r13,%r14
     f13:	66 4d 0f 38 f6 d8    	adcx   %r8,%r11
     f19:	48 8b 50 08          	mov    0x8(%rax),%rdx
     f1d:	c4 62 f3 f6 06       	mulx   (%rsi),%rcx,%r8
     f22:	f3 4c 0f 38 f6 d1    	adox   %rcx,%r10
     f28:	c4 62 f3 f6 7e 10    	mulx   0x10(%rsi),%rcx,%r15
     f2e:	f3 4d 0f 38 f6 d8    	adox   %r8,%r11
     f34:	66 4c 0f 38 f6 e1    	adcx   %rcx,%r12
     f3a:	48 8b 50 10          	mov    0x10(%rax),%rdx
     f3e:	c4 62 f3 f6 46 08    	mulx   0x8(%rsi),%rcx,%r8
     f44:	66 4d 0f 38 f6 ef    	adcx   %r15,%r13
     f4a:	f3 4c 0f 38 f6 e1    	adox   %rcx,%r12
     f50:	66 4c 0f 38 f6 f3    	adcx   %rbx,%r14
     f56:	f3 4d 0f 38 f6 e8    	adox   %r8,%r13
     f5c:	c4 62 f3 f6 06       	mulx   (%rsi),%rcx,%r8
     f61:	f3 4c 0f 38 f6 f3    	adox   %rbx,%r14
     f67:	4d 31 ff             	xor    %r15,%r15
     f6a:	66 4c 0f 38 f6 d9    	adcx   %rcx,%r11
     f70:	48 8b 50 08          	mov    0x8(%rax),%rdx
     f74:	c4 e2 eb f6 4e 08    	mulx   0x8(%rsi),%rdx,%rcx
     f7a:	66 4d 0f 38 f6 e0    	adcx   %r8,%r12
     f80:	f3 4c 0f 38 f6 da    	adox   %rdx,%r11
     f86:	48 8b 50 08          	mov    0x8(%rax),%rdx
     f8a:	f3 4c 0f 38 f6 e1    	adox   %rcx,%r12
     f90:	c4 62 f3 f6 46 18    	mulx   0x18(%rsi),%rcx,%r8
     f96:	66 4c 0f 38 f6 e9    	adcx   %rcx,%r13
     f9c:	48 8b 50 10          	mov    0x10(%rax),%rdx
     fa0:	c4 e2 eb f6 4e 10    	mulx   0x10(%rsi),%rdx,%rcx
     fa6:	66 4d 0f 38 f6 f0    	adcx   %r8,%r14
     fac:	f3 4c 0f 38 f6 ea    	adox   %rdx,%r13
     fb2:	48 8b 50 18          	mov    0x18(%rax),%rdx
     fb6:	f3 4c 0f 38 f6 f1    	adox   %rcx,%r14
     fbc:	c4 62 f3 f6 46 18    	mulx   0x18(%rsi),%rcx,%r8
     fc2:	f3 4c 0f 38 f6 fb    	adox   %rbx,%r15
     fc8:	66 4c 0f 38 f6 f9    	adcx   %rcx,%r15
     fce:	c4 e2 eb f6 0e       	mulx   (%rsi),%rdx,%rcx
     fd3:	66 49 0f 38 f6 d8    	adcx   %r8,%rbx
     fd9:	4d 31 c0             	xor    %r8,%r8
     fdc:	66 4c 0f 38 f6 e2    	adcx   %rdx,%r12
     fe2:	48 8b 10             	mov    (%rax),%rdx
     fe5:	66 4c 0f 38 f6 e9    	adcx   %rcx,%r13
     feb:	c4 e2 eb f6 4e 18    	mulx   0x18(%rsi),%rdx,%rcx
     ff1:	f3 4c 0f 38 f6 e2    	adox   %rdx,%r12
     ff7:	f3 4c 0f 38 f6 e9    	adox   %rcx,%r13
     ffd:	48 8b 50 18          	mov    0x18(%rax),%rdx
    1001:	c4 e2 eb f6 4e 10    	mulx   0x10(%rsi),%rdx,%rcx
    1007:	66 4c 0f 38 f6 f2    	adcx   %rdx,%r14
    100d:	48 8b 50 10          	mov    0x10(%rax),%rdx
    1011:	66 4c 0f 38 f6 f9    	adcx   %rcx,%r15
    1017:	c4 e2 f3 f6 56 18    	mulx   0x18(%rsi),%rcx,%rdx
    101d:	66 49 0f 38 f6 d8    	adcx   %r8,%rbx
    1023:	f3 4c 0f 38 f6 f1    	adox   %rcx,%r14
    1029:	f3 4c 0f 38 f6 fa    	adox   %rdx,%r15
    102f:	f3 49 0f 38 f6 d8    	adox   %r8,%rbx
    1035:	4c 89 ee             	mov    %r13,%rsi
    1038:	4c 89 0f             	mov    %r9,(%rdi)
    103b:	4c 89 57 08          	mov    %r10,0x8(%rdi)
    103f:	4c 89 5f 10          	mov    %r11,0x10(%rdi)
    1043:	4c 89 67 18          	mov    %r12,0x18(%rdi)
    1047:	4c 89 6f 20          	mov    %r13,0x20(%rdi)
    104b:	4c 89 77 28          	mov    %r14,0x28(%rdi)
    104f:	4c 89 7f 30          	mov    %r15,0x30(%rdi)
    1053:	48 89 5f 38          	mov    %rbx,0x38(%rdi)
    1057:	4c 0f ac f6 20       	shrd   $0x20,%r14,%rsi
    105c:	48 31 c9             	xor    %rcx,%rcx
    105f:	49 c1 ee 20          	shr    $0x20,%r14
    1063:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    1067:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    106b:	4c 8b 67 30          	mov    0x30(%rdi),%r12
    106f:	49 c1 e6 20          	shl    $0x20,%r14
    1073:	4c 8b 4f 18          	mov    0x18(%rdi),%r9
    1077:	4c 8b 57 38          	mov    0x38(%rdi),%r10
    107b:	4c 01 f2             	add    %r14,%rdx
    107e:	4d 11 e0             	adc    %r12,%r8
    1081:	4d 11 d1             	adc    %r10,%r9
    1084:	48 83 d1 00          	adc    $0x0,%rcx
    1088:	4c 01 f2             	add    %r14,%rdx
    108b:	4d 11 e0             	adc    %r12,%r8
    108e:	4d 11 d1             	adc    %r10,%r9
    1091:	48 83 d1 00          	adc    $0x0,%rcx
    1095:	8b 47 3c             	mov    0x3c(%rdi),%eax
    1098:	4c 8b 6f 30          	mov    0x30(%rdi),%r13
    109c:	49 0f ac df 20       	shrd   $0x20,%rbx,%r15
    10a1:	49 c1 e5 20          	shl    $0x20,%r13
    10a5:	4c 01 ea             	add    %r13,%rdx
    10a8:	4d 11 f8             	adc    %r15,%r8
    10ab:	49 11 c1             	adc    %rax,%r9
    10ae:	48 83 d1 00          	adc    $0x0,%rcx
    10b2:	4c 01 ea             	add    %r13,%rdx
    10b5:	4d 11 f8             	adc    %r15,%r8
    10b8:	49 11 c1             	adc    %rax,%r9
    10bb:	48 83 d1 00          	adc    $0x0,%rcx
    10bf:	48 8b 1f             	mov    (%rdi),%rbx
    10c2:	4c 8b 5f 20          	mov    0x20(%rdi),%r11
    10c6:	8b 47 28             	mov    0x28(%rdi),%eax
    10c9:	4c 01 db             	add    %r11,%rbx
    10cc:	48 11 c2             	adc    %rax,%rdx
    10cf:	49 83 d0 00          	adc    $0x0,%r8
    10d3:	4d 11 d1             	adc    %r10,%r9
    10d6:	48 83 d1 00          	adc    $0x0,%rcx
    10da:	49 c1 ee 20          	shr    $0x20,%r14
    10de:	49 c1 e7 20          	shl    $0x20,%r15
    10e2:	4d 09 fe             	or     %r15,%r14
    10e5:	8b 47 20             	mov    0x20(%rdi),%eax
    10e8:	49 c1 ef 20          	shr    $0x20,%r15
    10ec:	48 c1 e0 20          	shl    $0x20,%rax
    10f0:	4c 09 f8             	or     %r15,%rax
    10f3:	48 01 f3             	add    %rsi,%rbx
    10f6:	4c 11 f2             	adc    %r14,%rdx
    10f9:	4d 11 d0             	adc    %r10,%r8
    10fc:	49 11 c1             	adc    %rax,%r9
    10ff:	48 83 d1 00          	adc    $0x0,%rcx
    1103:	4c 8b 6f 28          	mov    0x28(%rdi),%r13
    1107:	48 c1 e8 20          	shr    $0x20,%rax
    110b:	49 c1 e5 20          	shl    $0x20,%r13
    110f:	49 09 c5             	or     %rax,%r13
    1112:	4c 8b 77 2c          	mov    0x2c(%rdi),%r14
    1116:	4c 29 f3             	sub    %r14,%rbx
    1119:	4c 19 fa             	sbb    %r15,%rdx
    111c:	49 83 d8 00          	sbb    $0x0,%r8
    1120:	4d 19 e9             	sbb    %r13,%r9
    1123:	48 83 d9 00          	sbb    $0x0,%rcx
    1127:	8b 47 24             	mov    0x24(%rdi),%eax
    112a:	49 c1 e6 20          	shl    $0x20,%r14
    112e:	49 09 c6             	or     %rax,%r14
    1131:	4c 29 e3             	sub    %r12,%rbx
    1134:	4c 19 d2             	sbb    %r10,%rdx
    1137:	49 83 d8 00          	sbb    $0x0,%r8
    113b:	4d 19 f1             	sbb    %r14,%r9
    113e:	48 83 d9 00          	sbb    $0x0,%rcx
    1142:	4c 8b 77 34          	mov    0x34(%rdi),%r14
    1146:	4d 0f a4 d5 20       	shld   $0x20,%r10,%r13
    114b:	49 c1 e4 20          	shl    $0x20,%r12
    114f:	49 c7 c7 fb ff ff ff 	mov    $0xfffffffffffffffb,%r15
    1156:	4c 29 f3             	sub    %r14,%rbx
    1159:	48 b8 ff ff ff ff 04 	movabs $0x4ffffffff,%rax
    1160:	00 00 00 
    1163:	4c 19 ea             	sbb    %r13,%rdx
    1166:	49 19 f0             	sbb    %rsi,%r8
    1169:	4d 19 e1             	sbb    %r12,%r9
    116c:	48 83 d9 00          	sbb    $0x0,%rcx
    1170:	49 bd 05 00 00 00 fb 	movabs $0xfffffffb00000005,%r13
    1177:	ff ff ff 
    117a:	4c 8b 5f 28          	mov    0x28(%rdi),%r11
    117e:	49 c1 e6 20          	shl    $0x20,%r14
    1182:	48 c1 e6 20          	shl    $0x20,%rsi
    1186:	4c 29 d3             	sub    %r10,%rbx
    1189:	48 19 f2             	sbb    %rsi,%rdx
    118c:	4d 19 d8             	sbb    %r11,%r8
    118f:	4d 19 f1             	sbb    %r14,%r9
    1192:	48 83 d9 00          	sbb    $0x0,%rcx
    1196:	49 ba 00 21 43 65 87 	movabs $0xba98765432100,%r10
    119d:	a9 0b 00 
    11a0:	4c 01 fb             	add    %r15,%rbx
    11a3:	48 11 c2             	adc    %rax,%rdx
    11a6:	49 83 d0 00          	adc    $0x0,%r8
    11aa:	4d 11 e9             	adc    %r13,%r9
    11ad:	48 83 d1 04          	adc    $0x4,%rcx
    11b1:	49 89 cf             	mov    %rcx,%r15
    11b4:	48 c1 e1 02          	shl    $0x2,%rcx
    11b8:	4c 8d 25 00 00 00 00 	lea    0x0(%rip),%r12        # 11bf <mpi_mul_mod_p256_x86_64_4+0x2df>
			11bb: R_X86_64_PC32	.rodata+0x3c
    11bf:	49 d3 ea             	shr    %cl,%r10
    11c2:	49 2b 5c cc 18       	sub    0x18(%r12,%rcx,8),%rbx
    11c7:	49 1b 54 cc 10       	sbb    0x10(%r12,%rcx,8),%rdx
    11cc:	4d 1b 44 cc 08       	sbb    0x8(%r12,%rcx,8),%r8
    11d1:	49 83 e2 0f          	and    $0xf,%r10
    11d5:	4d 1b 0c cc          	sbb    (%r12,%rcx,8),%r9
    11d9:	4d 19 d7             	sbb    %r10,%r15
    11dc:	49 bd ff ff ff ff 00 	movabs $0xffffffff,%r13
    11e3:	00 00 00 
    11e6:	49 bc 01 00 00 00 ff 	movabs $0xffffffff00000001,%r12
    11ed:	ff ff ff 
    11f0:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    11f7:	48 89 1f             	mov    %rbx,(%rdi)
    11fa:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    11fe:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    1202:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
    1206:	4c 29 d3             	sub    %r10,%rbx
    1209:	4c 19 ea             	sbb    %r13,%rdx
    120c:	49 83 d8 00          	sbb    $0x0,%r8
    1210:	4d 19 e1             	sbb    %r12,%r9
    1213:	49 83 df 00          	sbb    $0x0,%r15
    1217:	72 0f                	jb     1228 <.mul_mod_p256_done>
    1219:	48 89 1f             	mov    %rbx,(%rdi)
    121c:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    1220:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    1224:	4c 89 4f 18          	mov    %r9,0x18(%rdi)

0000000000001228 <.mul_mod_p256_done>:
    1228:	5b                   	pop    %rbx
    1229:	41 5f                	pop    %r15
    122b:	41 5e                	pop    %r14
    122d:	41 5d                	pop    %r13
    122f:	41 5c                	pop    %r12
    1231:	c3                   	retq   
    1232:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    1239:	00 00 00 00 
    123d:	0f 1f 00             	nopl   (%rax)

0000000000001240 <mpi_sqr_mod_p256_x86_64_4>:
    1240:	53                   	push   %rbx
    1241:	41 54                	push   %r12
    1243:	41 55                	push   %r13
    1245:	41 56                	push   %r14
    1247:	41 57                	push   %r15
    1249:	48 8b 16             	mov    (%rsi),%rdx
    124c:	c4 62 b3 f6 56 08    	mulx   0x8(%rsi),%r9,%r10
    1252:	c4 62 a3 f6 66 18    	mulx   0x18(%rsi),%r11,%r12
    1258:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    125c:	c4 e2 f3 f6 5e 08    	mulx   0x8(%rsi),%rcx,%rbx
    1262:	4d 31 ff             	xor    %r15,%r15
    1265:	f3 4c 0f 38 f6 d9    	adox   %rcx,%r11
    126b:	c4 62 93 f6 76 18    	mulx   0x18(%rsi),%r13,%r14
    1271:	f3 4c 0f 38 f6 e3    	adox   %rbx,%r12
    1277:	c4 e2 f3 f6 1e       	mulx   (%rsi),%rcx,%rbx
    127c:	f3 4d 0f 38 f6 ef    	adox   %r15,%r13
    1282:	66 4c 0f 38 f6 d1    	adcx   %rcx,%r10
    1288:	f3 4d 0f 38 f6 f7    	adox   %r15,%r14
    128e:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    1292:	c4 62 fb f6 46 18    	mulx   0x18(%rsi),%rax,%r8
    1298:	66 4c 0f 38 f6 db    	adcx   %rbx,%r11
    129e:	66 4c 0f 38 f6 e0    	adcx   %rax,%r12
    12a4:	66 4d 0f 38 f6 e8    	adcx   %r8,%r13
    12aa:	66 4d 0f 38 f6 f7    	adcx   %r15,%r14
    12b0:	4d 31 ff             	xor    %r15,%r15
    12b3:	48 8b 16             	mov    (%rsi),%rdx
    12b6:	c4 e2 bb f6 c2       	mulx   %rdx,%r8,%rax
    12bb:	66 4d 0f 38 f6 c9    	adcx   %r9,%r9
    12c1:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    12c5:	c4 e2 f3 f6 da       	mulx   %rdx,%rcx,%rbx
    12ca:	66 4d 0f 38 f6 d2    	adcx   %r10,%r10
    12d0:	f3 4c 0f 38 f6 c8    	adox   %rax,%r9
    12d6:	66 4d 0f 38 f6 db    	adcx   %r11,%r11
    12dc:	f3 4c 0f 38 f6 d1    	adox   %rcx,%r10
    12e2:	48 8b 56 10          	mov    0x10(%rsi),%rdx
    12e6:	c4 e2 fb f6 ca       	mulx   %rdx,%rax,%rcx
    12eb:	66 4d 0f 38 f6 e4    	adcx   %r12,%r12
    12f1:	f3 4c 0f 38 f6 db    	adox   %rbx,%r11
    12f7:	66 4d 0f 38 f6 ed    	adcx   %r13,%r13
    12fd:	f3 4c 0f 38 f6 e0    	adox   %rax,%r12
    1303:	48 8b 56 18          	mov    0x18(%rsi),%rdx
    1307:	c4 e2 fb f6 da       	mulx   %rdx,%rax,%rbx
    130c:	66 4d 0f 38 f6 f6    	adcx   %r14,%r14
    1312:	f3 4c 0f 38 f6 e9    	adox   %rcx,%r13
    1318:	66 4d 0f 38 f6 ff    	adcx   %r15,%r15
    131e:	f3 4c 0f 38 f6 f0    	adox   %rax,%r14
    1324:	f3 4c 0f 38 f6 fb    	adox   %rbx,%r15
    132a:	4c 89 e6             	mov    %r12,%rsi
    132d:	4c 89 07             	mov    %r8,(%rdi)
    1330:	4c 89 4f 08          	mov    %r9,0x8(%rdi)
    1334:	4c 89 57 10          	mov    %r10,0x10(%rdi)
    1338:	4c 89 5f 18          	mov    %r11,0x18(%rdi)
    133c:	4c 89 67 20          	mov    %r12,0x20(%rdi)
    1340:	4c 89 6f 28          	mov    %r13,0x28(%rdi)
    1344:	4c 89 77 30          	mov    %r14,0x30(%rdi)
    1348:	4c 89 7f 38          	mov    %r15,0x38(%rdi)
    134c:	4c 0f ac ee 20       	shrd   $0x20,%r13,%rsi
    1351:	48 31 c9             	xor    %rcx,%rcx
    1354:	49 c1 ed 20          	shr    $0x20,%r13
    1358:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    135c:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    1360:	4c 8b 67 30          	mov    0x30(%rdi),%r12
    1364:	49 c1 e5 20          	shl    $0x20,%r13
    1368:	4c 8b 4f 18          	mov    0x18(%rdi),%r9
    136c:	4c 8b 57 38          	mov    0x38(%rdi),%r10
    1370:	4c 01 ea             	add    %r13,%rdx
    1373:	4d 11 e0             	adc    %r12,%r8
    1376:	4d 11 d1             	adc    %r10,%r9
    1379:	48 83 d1 00          	adc    $0x0,%rcx
    137d:	4c 01 ea             	add    %r13,%rdx
    1380:	4d 11 e0             	adc    %r12,%r8
    1383:	4d 11 d1             	adc    %r10,%r9
    1386:	48 83 d1 00          	adc    $0x0,%rcx
    138a:	4d 0f ac fe 20       	shrd   $0x20,%r15,%r14
    138f:	8b 47 3c             	mov    0x3c(%rdi),%eax
    1392:	4c 8b 5f 30          	mov    0x30(%rdi),%r11
    1396:	49 c1 e3 20          	shl    $0x20,%r11
    139a:	4c 01 da             	add    %r11,%rdx
    139d:	4d 11 f0             	adc    %r14,%r8
    13a0:	49 11 c1             	adc    %rax,%r9
    13a3:	48 83 d1 00          	adc    $0x0,%rcx
    13a7:	4c 01 da             	add    %r11,%rdx
    13aa:	4d 11 f0             	adc    %r14,%r8
    13ad:	49 11 c1             	adc    %rax,%r9
    13b0:	48 83 d1 00          	adc    $0x0,%rcx
    13b4:	48 8b 1f             	mov    (%rdi),%rbx
    13b7:	4c 8b 7f 20          	mov    0x20(%rdi),%r15
    13bb:	8b 47 28             	mov    0x28(%rdi),%eax
    13be:	4c 01 fb             	add    %r15,%rbx
    13c1:	48 11 c2             	adc    %rax,%rdx
    13c4:	49 83 d0 00          	adc    $0x0,%r8
    13c8:	4d 11 d1             	adc    %r10,%r9
    13cb:	48 83 d1 00          	adc    $0x0,%rcx
    13cf:	49 c1 ed 20          	shr    $0x20,%r13
    13d3:	49 c1 e6 20          	shl    $0x20,%r14
    13d7:	4d 09 f5             	or     %r14,%r13
    13da:	8b 47 20             	mov    0x20(%rdi),%eax
    13dd:	49 c1 ee 20          	shr    $0x20,%r14
    13e1:	48 c1 e0 20          	shl    $0x20,%rax
    13e5:	4c 09 f0             	or     %r14,%rax
    13e8:	48 01 f3             	add    %rsi,%rbx
    13eb:	4c 11 ea             	adc    %r13,%rdx
    13ee:	4d 11 d0             	adc    %r10,%r8
    13f1:	49 11 c1             	adc    %rax,%r9
    13f4:	48 83 d1 00          	adc    $0x0,%rcx
    13f8:	4c 8b 5f 28          	mov    0x28(%rdi),%r11
    13fc:	48 c1 e8 20          	shr    $0x20,%rax
    1400:	49 c1 e3 20          	shl    $0x20,%r11
    1404:	4c 8b 6f 2c          	mov    0x2c(%rdi),%r13
    1408:	49 09 c3             	or     %rax,%r11
    140b:	4c 29 eb             	sub    %r13,%rbx
    140e:	4c 19 f2             	sbb    %r14,%rdx
    1411:	49 83 d8 00          	sbb    $0x0,%r8
    1415:	4d 19 d9             	sbb    %r11,%r9
    1418:	48 83 d9 00          	sbb    $0x0,%rcx
    141c:	8b 47 24             	mov    0x24(%rdi),%eax
    141f:	49 c1 e5 20          	shl    $0x20,%r13
    1423:	49 09 c5             	or     %rax,%r13
    1426:	4c 29 e3             	sub    %r12,%rbx
    1429:	4c 19 d2             	sbb    %r10,%rdx
    142c:	49 83 d8 00          	sbb    $0x0,%r8
    1430:	4d 19 e9             	sbb    %r13,%r9
    1433:	48 83 d9 00          	sbb    $0x0,%rcx
    1437:	4c 8b 6f 34          	mov    0x34(%rdi),%r13
    143b:	4d 0f a4 d3 20       	shld   $0x20,%r10,%r11
    1440:	49 c1 e4 20          	shl    $0x20,%r12
    1444:	49 c7 c7 fb ff ff ff 	mov    $0xfffffffffffffffb,%r15
    144b:	4c 29 eb             	sub    %r13,%rbx
    144e:	48 b8 ff ff ff ff 04 	movabs $0x4ffffffff,%rax
    1455:	00 00 00 
    1458:	4c 19 da             	sbb    %r11,%rdx
    145b:	49 19 f0             	sbb    %rsi,%r8
    145e:	4d 19 e1             	sbb    %r12,%r9
    1461:	48 83 d9 00          	sbb    $0x0,%rcx
    1465:	49 bb 05 00 00 00 fb 	movabs $0xfffffffb00000005,%r11
    146c:	ff ff ff 
    146f:	4c 8b 77 28          	mov    0x28(%rdi),%r14
    1473:	49 c1 e5 20          	shl    $0x20,%r13
    1477:	48 c1 e6 20          	shl    $0x20,%rsi
    147b:	4c 29 d3             	sub    %r10,%rbx
    147e:	48 19 f2             	sbb    %rsi,%rdx
    1481:	4d 19 f0             	sbb    %r14,%r8
    1484:	4d 19 e9             	sbb    %r13,%r9
    1487:	48 83 d9 00          	sbb    $0x0,%rcx
    148b:	49 ba 00 21 43 65 87 	movabs $0xba98765432100,%r10
    1492:	a9 0b 00 
    1495:	4c 01 fb             	add    %r15,%rbx
    1498:	48 11 c2             	adc    %rax,%rdx
    149b:	49 83 d0 00          	adc    $0x0,%r8
    149f:	4d 11 d9             	adc    %r11,%r9
    14a2:	48 83 d1 04          	adc    $0x4,%rcx
    14a6:	49 89 cf             	mov    %rcx,%r15
    14a9:	48 c1 e1 02          	shl    $0x2,%rcx
    14ad:	4c 8d 25 00 00 00 00 	lea    0x0(%rip),%r12        # 14b4 <mpi_sqr_mod_p256_x86_64_4+0x274>
			14b0: R_X86_64_PC32	.rodata+0x3c
    14b4:	49 d3 ea             	shr    %cl,%r10
    14b7:	49 2b 5c cc 18       	sub    0x18(%r12,%rcx,8),%rbx
    14bc:	49 1b 54 cc 10       	sbb    0x10(%r12,%rcx,8),%rdx
    14c1:	4d 1b 44 cc 08       	sbb    0x8(%r12,%rcx,8),%r8
    14c6:	49 83 e2 0f          	and    $0xf,%r10
    14ca:	4d 1b 0c cc          	sbb    (%r12,%rcx,8),%r9
    14ce:	4d 19 d7             	sbb    %r10,%r15
    14d1:	49 bb ff ff ff ff 00 	movabs $0xffffffff,%r11
    14d8:	00 00 00 
    14db:	49 bc 01 00 00 00 ff 	movabs $0xffffffff00000001,%r12
    14e2:	ff ff ff 
    14e5:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
    14ec:	48 89 1f             	mov    %rbx,(%rdi)
    14ef:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    14f3:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    14f7:	4c 89 4f 18          	mov    %r9,0x18(%rdi)
    14fb:	4c 29 d3             	sub    %r10,%rbx
    14fe:	4c 19 da             	sbb    %r11,%rdx
    1501:	49 83 d8 00          	sbb    $0x0,%r8
    1505:	4d 19 e1             	sbb    %r12,%r9
    1508:	49 83 df 00          	sbb    $0x0,%r15
    150c:	72 0f                	jb     151d <.sqr_mod_p256_done>
    150e:	48 89 1f             	mov    %rbx,(%rdi)
    1511:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    1515:	4c 89 47 10          	mov    %r8,0x10(%rdi)
    1519:	4c 89 4f 18          	mov    %r9,0x18(%rdi)

000000000000151d <.sqr_mod_p256_done>:
    151d:	41 5f                	pop    %r15
    151f:	41 5e                	pop    %r14
    1521:	41 5d                	pop    %r13
    1523:	41 5c                	pop    %r12
    1525:	5b                   	pop    %rbx
    1526:	c3                   	retq   

Disassembly of section .rodata:

0000000000000000 <.sub_tail_jmp_tbl>:
	...
			0: R_X86_64_64	.text+0x17f
			8: R_X86_64_64	.text+0x170
			10: R_X86_64_64	.text+0x161
			18: R_X86_64_64	.text+0x152

0000000000000040 <__P256x>:
	...
  60:	01 00                	add    %eax,(%rax)
  62:	00 00                	add    %al,(%rax)
  64:	ff                   	(bad)  
  65:	ff                   	(bad)  
  66:	ff                   	(bad)  
  67:	ff 00                	incl   (%rax)
  69:	00 00                	add    %al,(%rax)
  6b:	00 00                	add    %al,(%rax)
  6d:	00 00                	add    %al,(%rax)
  6f:	00 ff                	add    %bh,%bh
  71:	ff                   	(bad)  
  72:	ff                   	(bad)  
  73:	ff 00                	incl   (%rax)
  75:	00 00                	add    %al,(%rax)
  77:	00 ff                	add    %bh,%bh
  79:	ff                   	(bad)  
  7a:	ff                   	(bad)  
  7b:	ff                   	(bad)  
  7c:	ff                   	(bad)  
  7d:	ff                   	(bad)  
  7e:	ff                   	(bad)  
  7f:	ff 02                	incl   (%rdx)
  81:	00 00                	add    %al,(%rax)
  83:	00 fe                	add    %bh,%dh
  85:	ff                   	(bad)  
  86:	ff                   	(bad)  
  87:	ff 00                	incl   (%rax)
  89:	00 00                	add    %al,(%rax)
  8b:	00 00                	add    %al,(%rax)
  8d:	00 00                	add    %al,(%rax)
  8f:	00 ff                	add    %bh,%bh
  91:	ff                   	(bad)  
  92:	ff                   	(bad)  
  93:	ff 01                	incl   (%rcx)
  95:	00 00                	add    %al,(%rax)
  97:	00 fe                	add    %bh,%dh
  99:	ff                   	(bad)  
  9a:	ff                   	(bad)  
  9b:	ff                   	(bad)  
  9c:	ff                   	(bad)  
  9d:	ff                   	(bad)  
  9e:	ff                   	(bad)  
  9f:	ff 03                	incl   (%rbx)
  a1:	00 00                	add    %al,(%rax)
  a3:	00 fd                	add    %bh,%ch
  a5:	ff                   	(bad)  
  a6:	ff                   	(bad)  
  a7:	ff 00                	incl   (%rax)
  a9:	00 00                	add    %al,(%rax)
  ab:	00 00                	add    %al,(%rax)
  ad:	00 00                	add    %al,(%rax)
  af:	00 ff                	add    %bh,%bh
  b1:	ff                   	(bad)  
  b2:	ff                   	(bad)  
  b3:	ff 02                	incl   (%rdx)
  b5:	00 00                	add    %al,(%rax)
  b7:	00 fd                	add    %bh,%ch
  b9:	ff                   	(bad)  
  ba:	ff                   	(bad)  
  bb:	ff                   	(bad)  
  bc:	ff                   	(bad)  
  bd:	ff                   	(bad)  
  be:	ff                   	(bad)  
  bf:	ff 04 00             	incl   (%rax,%rax,1)
  c2:	00 00                	add    %al,(%rax)
  c4:	fc                   	cld    
  c5:	ff                   	(bad)  
  c6:	ff                   	(bad)  
  c7:	ff 00                	incl   (%rax)
  c9:	00 00                	add    %al,(%rax)
  cb:	00 00                	add    %al,(%rax)
  cd:	00 00                	add    %al,(%rax)
  cf:	00 ff                	add    %bh,%bh
  d1:	ff                   	(bad)  
  d2:	ff                   	(bad)  
  d3:	ff 03                	incl   (%rbx)
  d5:	00 00                	add    %al,(%rax)
  d7:	00 fc                	add    %bh,%ah
  d9:	ff                   	(bad)  
  da:	ff                   	(bad)  
  db:	ff                   	(bad)  
  dc:	ff                   	(bad)  
  dd:	ff                   	(bad)  
  de:	ff                   	(bad)  
  df:	ff 05 00 00 00 fb    	incl   -0x5000000(%rip)        # fffffffffb0000e5 <.sqr_mod_p256_done+0xfffffffffaffebc8>
  e5:	ff                   	(bad)  
  e6:	ff                   	(bad)  
  e7:	ff 00                	incl   (%rax)
  e9:	00 00                	add    %al,(%rax)
  eb:	00 00                	add    %al,(%rax)
  ed:	00 00                	add    %al,(%rax)
  ef:	00 ff                	add    %bh,%bh
  f1:	ff                   	(bad)  
  f2:	ff                   	(bad)  
  f3:	ff 04 00             	incl   (%rax,%rax,1)
  f6:	00 00                	add    %al,(%rax)
  f8:	fb                   	sti    
  f9:	ff                   	(bad)  
  fa:	ff                   	(bad)  
  fb:	ff                   	(bad)  
  fc:	ff                   	(bad)  
  fd:	ff                   	(bad)  
  fe:	ff                   	(bad)  
  ff:	ff 06                	incl   (%rsi)
 101:	00 00                	add    %al,(%rax)
 103:	00 fa                	add    %bh,%dl
 105:	ff                   	(bad)  
 106:	ff                   	(bad)  
 107:	ff 00                	incl   (%rax)
 109:	00 00                	add    %al,(%rax)
 10b:	00 00                	add    %al,(%rax)
 10d:	00 00                	add    %al,(%rax)
 10f:	00 ff                	add    %bh,%bh
 111:	ff                   	(bad)  
 112:	ff                   	(bad)  
 113:	ff 05 00 00 00 fa    	incl   -0x6000000(%rip)        # fffffffffa000119 <.sqr_mod_p256_done+0xfffffffff9ffebfc>
 119:	ff                   	(bad)  
 11a:	ff                   	(bad)  
 11b:	ff                   	(bad)  
 11c:	ff                   	(bad)  
 11d:	ff                   	(bad)  
 11e:	ff                   	(bad)  
 11f:	ff 07                	incl   (%rdi)
 121:	00 00                	add    %al,(%rax)
 123:	00 f9                	add    %bh,%cl
 125:	ff                   	(bad)  
 126:	ff                   	(bad)  
 127:	ff 00                	incl   (%rax)
 129:	00 00                	add    %al,(%rax)
 12b:	00 00                	add    %al,(%rax)
 12d:	00 00                	add    %al,(%rax)
 12f:	00 ff                	add    %bh,%bh
 131:	ff                   	(bad)  
 132:	ff                   	(bad)  
 133:	ff 06                	incl   (%rsi)
 135:	00 00                	add    %al,(%rax)
 137:	00 f9                	add    %bh,%cl
 139:	ff                   	(bad)  
 13a:	ff                   	(bad)  
 13b:	ff                   	(bad)  
 13c:	ff                   	(bad)  
 13d:	ff                   	(bad)  
 13e:	ff                   	(bad)  
 13f:	ff 08                	decl   (%rax)
 141:	00 00                	add    %al,(%rax)
 143:	00 f8                	add    %bh,%al
 145:	ff                   	(bad)  
 146:	ff                   	(bad)  
 147:	ff 00                	incl   (%rax)
 149:	00 00                	add    %al,(%rax)
 14b:	00 00                	add    %al,(%rax)
 14d:	00 00                	add    %al,(%rax)
 14f:	00 ff                	add    %bh,%bh
 151:	ff                   	(bad)  
 152:	ff                   	(bad)  
 153:	ff 07                	incl   (%rdi)
 155:	00 00                	add    %al,(%rax)
 157:	00 f8                	add    %bh,%al
 159:	ff                   	(bad)  
 15a:	ff                   	(bad)  
 15b:	ff                   	(bad)  
 15c:	ff                   	(bad)  
 15d:	ff                   	(bad)  
 15e:	ff                   	(bad)  
 15f:	ff 09                	decl   (%rcx)
 161:	00 00                	add    %al,(%rax)
 163:	00 f7                	add    %dh,%bh
 165:	ff                   	(bad)  
 166:	ff                   	(bad)  
 167:	ff 00                	incl   (%rax)
 169:	00 00                	add    %al,(%rax)
 16b:	00 00                	add    %al,(%rax)
 16d:	00 00                	add    %al,(%rax)
 16f:	00 ff                	add    %bh,%bh
 171:	ff                   	(bad)  
 172:	ff                   	(bad)  
 173:	ff 08                	decl   (%rax)
 175:	00 00                	add    %al,(%rax)
 177:	00 f7                	add    %dh,%bh
 179:	ff                   	(bad)  
 17a:	ff                   	(bad)  
 17b:	ff                   	(bad)  
 17c:	ff                   	(bad)  
 17d:	ff                   	(bad)  
 17e:	ff                   	(bad)  
 17f:	ff 0a                	decl   (%rdx)
 181:	00 00                	add    %al,(%rax)
 183:	00 f6                	add    %dh,%dh
 185:	ff                   	(bad)  
 186:	ff                   	(bad)  
 187:	ff 00                	incl   (%rax)
 189:	00 00                	add    %al,(%rax)
 18b:	00 00                	add    %al,(%rax)
 18d:	00 00                	add    %al,(%rax)
 18f:	00 ff                	add    %bh,%bh
 191:	ff                   	(bad)  
 192:	ff                   	(bad)  
 193:	ff 09                	decl   (%rcx)
 195:	00 00                	add    %al,(%rax)
 197:	00 f6                	add    %dh,%dh
 199:	ff                   	(bad)  
 19a:	ff                   	(bad)  
 19b:	ff                   	(bad)  
 19c:	ff                   	(bad)  
 19d:	ff                   	(bad)  
 19e:	ff                   	(bad)  
 19f:	ff 0b                	decl   (%rbx)
 1a1:	00 00                	add    %al,(%rax)
 1a3:	00 f5                	add    %dh,%ch
 1a5:	ff                   	(bad)  
 1a6:	ff                   	(bad)  
 1a7:	ff 00                	incl   (%rax)
 1a9:	00 00                	add    %al,(%rax)
 1ab:	00 00                	add    %al,(%rax)
 1ad:	00 00                	add    %al,(%rax)
 1af:	00 ff                	add    %bh,%bh
 1b1:	ff                   	(bad)  
 1b2:	ff                   	(bad)  
 1b3:	ff 0a                	decl   (%rdx)
 1b5:	00 00                	add    %al,(%rax)
 1b7:	00 f5                	add    %dh,%ch
 1b9:	ff                   	(bad)  
 1ba:	ff                   	(bad)  
 1bb:	ff                   	(bad)  
 1bc:	ff                   	(bad)  
 1bd:	ff                   	(bad)  
 1be:	ff                   	(bad)  
 1bf:	ff 0c 00             	decl   (%rax,%rax,1)
 1c2:	00 00                	add    %al,(%rax)
 1c4:	f4                   	hlt    
 1c5:	ff                   	(bad)  
 1c6:	ff                   	(bad)  
 1c7:	ff 00                	incl   (%rax)
 1c9:	00 00                	add    %al,(%rax)
 1cb:	00 00                	add    %al,(%rax)
 1cd:	00 00                	add    %al,(%rax)
 1cf:	00 ff                	add    %bh,%bh
 1d1:	ff                   	(bad)  
 1d2:	ff                   	(bad)  
 1d3:	ff 0b                	decl   (%rbx)
 1d5:	00 00                	add    %al,(%rax)
 1d7:	00 f4                	add    %dh,%ah
 1d9:	ff                   	(bad)  
 1da:	ff                   	(bad)  
 1db:	ff                   	(bad)  
 1dc:	ff                   	(bad)  
 1dd:	ff                   	(bad)  
 1de:	ff                   	(bad)  
 1df:	ff                   	.byte 0xff
