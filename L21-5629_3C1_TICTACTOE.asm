[org 0x0100]

jmp start1

menu : db ' WELCOME TO TIC TAC TOE ' , 0
menu1 : db ' PRESS S TO PLAY ' , 0
menu2 : db ' PRESS A TO EXIT ' , 0
bye : db ' BYE SEE YOU SOON ' , 0
bye1 : db ' THANKS FOR PLAYING ' , 0
i1 : db ' PRESS Q TO PLAY WITH KEYBOARD ' , 0
i2 : db ' PRESS W TO PLAY WITH MOUSE ' , 0
msg : db ' TIC TAC TOE ' , 0
msg1 : db ' TURN : ' , 0
Board: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Area: dw 834,860,884,910,934,1500,1524,1550,1574,2140,2164,2190,2214,2780,2804,2830,2850,2872
dr : db ' THE GAME IS TIED ' , 0
t1: db ' PLAYER 1 ' , 0
t2: db ' PLAYER 2 ' , 0
win : db ' WINNER : ' , 0
space : db ' SPACE ALREADY OCCUPIED ' , 0
again : db ' DO YOU WANT TO PLAY AGAIN ? ' , 0


terminator:     ;delay function
push cx
mov cx,0xffff
T:
 sub cx,1
 jnz T
 pop cx
 ret

sound:
push bp
mov bp,sp
pusha
mov     al, 182         ; Prepare the speaker for the
out     43h, al         ;  note.
mov     ax, word[bp+6]    ; Frequency number (in decimal)
                                ;  for middle C.
out     42h, al         ; Output low byte.
mov     al, ah          ; Output high byte.
out     42h, al 
in      al, 61h         ; Turn on note (get value from                        ;  port 61h).
or      al, 00000011b   ; Set bits 1 and 0.
out     61h, al         ; Send new value.
mov     bx, [bp+4]         ; Pause for duration of note.
pause1:
mov     cx, 65535
pause2:
dec     cx
jne     pause2
dec     bx
jne     pause1
in      al, 61h         ; Turn off note (get value from                        ;  port 61h).
and     al, 11111100b   ; Reset bits 1 and 0.
out     61h, al         ; Send new value.
popa
pop bp
ret 4

PlayArea_:
mov ax,0xb800
mov es,ax
mov di,362
mov cx , 16
mov ah , 00110000b
mov al,0x24


	InnerArea_:
                call terminator
		mov di, 362
		mov ah,00110000b
		mov al,20h
		mov cx,16

		display_:
                        call terminator
			add di, 160
			mov bx, 50

			cont_:
				mov [es:di],ax
				add di,2
				dec bx
				jnz cont_
			sub di, 100
			dec cx
			jnz display_

         Border_:
                call terminator
		mov di, 522
		mov ah,01010000b
		mov al,20h
		mov cx, 50

		top_row_:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz top_row_
	
		mov di, 622
		mov cx, 16

                right_col_:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz right_col_
	
		mov di, 522
		mov cx, 16

		left_col_:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz left_col_

		mov di, 3082
		mov cx, 51

		lower_row_:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz lower_row_
Lines_:
		mov di, 546
		mov cx, 16

		col1_:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col1_
		
		mov di , 572
		mov cx , 16

               col2_:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col2_
		
		mov di , 598
		mov cx , 16

               col3_:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col3_
		
		mov di , 1162
		mov cx , 50

		row1_:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row1_
			
		mov di , 1802
		mov cx , 50

		row2_:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row2_
                  
                mov di , 2442
                mov cx , 50

                row3_:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row3_	
           ret

PlayArea:
mov ax,0xb800
mov es,ax
mov di,362
mov cx , 16
mov ah , 00110000b
mov al,0x24


	InnerArea:
                call terminator
		mov di, 362
		mov ah,00110000b
		mov al,20h
		mov cx,16

		display:
                        call terminator
			add di, 160
			mov bx, 50

			cont:
				mov [es:di],ax
				add di,2
				dec bx
				jnz cont
			sub di, 100
			dec cx
			jnz display

         Border:
                call terminator
		mov di, 522
		mov ah,01010000b
		mov al,20h
		mov cx, 50

		top_row:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz top_row
	
		mov di, 622
		mov cx, 16

                right_col:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz right_col
	
		mov di, 522
		mov cx, 16

		left_col:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz left_col

		mov di, 3082
		mov cx, 51

		lower_row:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz lower_row

	Selections:		
		mov di, 704
call terminator
call terminator
		mov word [es:di],0x7031
		mov di, 730
call terminator
call terminator
		mov word [es:di],0x7032
		mov di, 756
call terminator
call terminator
		mov word [es:di],0x7033
		mov di, 780
call terminator
call terminator
		mov word [es:di],0x7034
		mov di, 1344
call terminator
call terminator
		mov word [es:di],0x7035
		mov di, 1370
call terminator
call terminator
		mov word [es:di],0x7036
		mov di, 1396
call terminator
call terminator
		mov word [es:di],0x7037
                mov di, 1420
call terminator
call terminator
		mov word [es:di],0x7038
		mov di, 1984
call terminator
call terminator
		mov word [es:di],0x7039
		mov di, 2010
call terminator
call terminator
		mov word [es:di],0x7051
		mov di, 2036
call terminator
call terminator
		mov word [es:di],0x7057
                mov di, 2060
call terminator
call terminator
		mov word [es:di],0x7045
                mov di, 2624
call terminator
call terminator
		mov word [es:di],0x7052
                mov di, 2650
call terminator
call terminator
		mov word [es:di],0x7054
                mov di, 2676
call terminator
call terminator
		mov word [es:di],0x7059
                mov di, 2700
call terminator
call terminator
		mov word [es:di],0x7055

	Lines:
		mov di, 546
		mov cx, 16

		col1:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col1
		
		mov di , 572
		mov cx , 16

               col2:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col2
		
		mov di , 598
		mov cx , 16

               col3:
                        call terminator
			mov [es:di],ax
			add di,160
			dec cx
			jnz col3
		
		mov di , 1162
		mov cx , 50

		row1:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row1
			
		mov di , 1802
		mov cx , 50

		row2:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row2
                  
                mov di , 2442
                mov cx , 50

                row3:
                        call terminator
			mov [es:di],ax
			add di,2
			dec cx
			jnz row3	
           ret

player_1:  
         mov ax, 2
         push ax 
         mov ax, 6
         push ax 
         mov ax, 2
         push ax 
         mov ax, t1
         push ax 
         call printstr 
	 pusha  

move_player_1:
	mov ah,0  
	int 0x16   
	in al, 0x60 
	mov ah, 0

	cmp al, 0x02 
 	je p_1
 	cmp al, 0x03 
 	je p_2
 	cmp al, 0x04 
 	je p_3
 	cmp al, 0x05 
 	je p_4
 	cmp al, 0x06 
 	je p_5
 	cmp al, 0x07 
 	je p_6
 	cmp al, 0x08 
 	je p_7
 	cmp al, 0x09 
 	je p_8
 	cmp al, 0x0A 
 	je p_9
 	cmp al, 0x10 
 	je p_Q
 	cmp al, 0x11 
 	je p_W
 	cmp al, 0x12 
 	je p_E
 	cmp al, 0x13 
 	je p_R
 	cmp al, 0x14 
 	je p_T
 	cmp al, 0x15 
 	je p_Y
        cmp al, 0x16 
 	je p_U

 	jmp move_player_1

p_1:
	mov ax,1
	jmp moves_p1
p_2:
	mov ax,2
	jmp moves_p1
p_3:
	mov ax,3
	jmp moves_p1
p_4:
	mov ax,4
	jmp moves_p1
p_5:
	mov ax,5
	jmp moves_p1
p_6:
	mov ax,6
	jmp moves_p1
p_7:
	mov ax,7
	jmp moves_p1
p_8:
	mov ax,8
	jmp moves_p1
p_9:
	mov ax,9
	jmp moves_p1
p_Q:
	mov ax,10
	jmp moves_p1
p_W:
	mov ax,11
	jmp moves_p1
p_E:
	mov ax,12
	jmp moves_p1
p_R:
	mov ax,13
	jmp moves_p1
p_T:
	mov ax,14
	jmp moves_p1
p_Y:
	mov ax,15
	jmp moves_p1
p_U: 
        mov ax , 16
        jmp moves_p1


	moves_p1:
	mov bp, Board
	add bp, ax
	
	cmp byte [bp],0
	jne near occupied
	
	mov byte [bp],1
	mov bp, Area  
	shl ax,1

	add bp,ax
	mov di,[bp]
	
	mov ax, 0xb800
	mov es, ax
	mov word [es:di],0111000001011000b   
	
	check_:
		mov bp,Board
		col_1:
			cmp byte [bp],1   
			jne col_2
			cmp byte [bp+4],1
			jne col_2
			cmp byte [bp+8],1
			jne col_2
			cmp byte [bp+12],1
			je near win_player_1
		col_2:
			cmp byte [bp+1],1
			jne col_3
			cmp byte [bp+5],1
			jne col_3
			cmp byte [bp+9],1
			jne col_3
			cmp byte [bp+13],1
			je near win_player_1
		col_3:
			cmp byte [bp+2],1
			jne col_4
			cmp byte [bp+6],1
			jne col_4
			cmp byte [bp+10],1
			jne col_4
			cmp byte [bp+14],1
			je near win_player_1
		col_4:
			cmp byte [bp+3],1
			jne row_1
			cmp byte [bp+7],1
			jne row_1
			cmp byte [bp+11],1
			jne row_1
			cmp byte [bp+15],1
			je near win_player_1
		row_1:
			cmp byte [bp],1
			jne row_2
			cmp byte [bp+1],1
			jne row_2
			cmp byte [bp+2],1
			jne row_2
			cmp byte [bp+3],1
			je near win_player_1
		row_2:
			cmp byte [bp+4],1
			jne row_3
			cmp byte [bp+5],1
			jne row_3
			cmp byte [bp+6],1
			jne row_3
			cmp byte [bp+7],1
			je near win_player_1
		row_3:
			cmp byte [bp+8],1
			jne row_4
			cmp byte [bp+9],1
			jne row_4
			cmp byte [bp+10],1
			jne row_4
			cmp byte [bp+11],1
			je near win_player_1
		row_4:
			cmp byte [bp+12],1
			jne diagnol
			cmp byte [bp+13],1
			jne diagnol
			cmp byte [bp+14],1
			jne diagnol
			cmp byte [bp+15],1
			je near win_player_1
		diagnol:  
			cmp byte [bp],1
			jne diagnol_
			cmp byte [bp+5],1
			jne diagnol_
			cmp byte [bp+10],1
			jne diagnol_
			cmp byte [bp+15],1
			je win_player_1
		diagnol_: 
			cmp byte [bp+3],1
			jne loss_player_1
			cmp byte [bp+6],1
			jne loss_player_1
			cmp byte [bp+9],1
			jne loss_player_1
			cmp byte [bp+12],1
			je win_player_1
			jmp loss_player_1
			
	
	occupied: 
		 mov ax, 25
                 push ax 
                 mov ax, 20
                 push ax 
                 mov ax, 3
                 push ax 
                 mov ax, space
                 push ax 
                 call printstr
 pop ax 
call text

		 jmp move_player_1
	
	loss_player_1:  
		out 0x20, al 
		popa
		ret
		
	win_player_1:  
		out 0x20, al 
		 mov ax, 3
                 push ax 
                 mov ax, 10
                 push ax 
                 mov ax, 2
                 push ax 
                 mov ax, t1
                 push ax 
                 call printstr 
		 jmp end1


player_2:  
         mov ax, 2
         push ax 
         mov ax, 6
         push ax 
         mov ax, 2
         push ax 
         mov ax, t2
         push ax 
         call printstr 
	 pusha  

move_player_2:
	mov ah,0  
	int 0x16   
	in al, 0x60 
	mov ah, 0

	cmp al, 0x02
 	je p_1_
 	cmp al, 0x03 
 	je p_2_
 	cmp al, 0x04 
 	je p_3_
 	cmp al, 0x05 
 	je p_4_
 	cmp al, 0x06
 	je p_5_
 	cmp al, 0x07 
 	je p_6_
 	cmp al, 0x08 
 	je p_7_
 	cmp al, 0x09 
 	je p_8_
 	cmp al, 0x0A 
 	je p_9_
 	cmp al, 0x10 
 	je p_Q_
 	cmp al, 0x11 
 	je p_W_
 	cmp al, 0x12 
 	je p_E_
 	cmp al, 0x13 
 	je p_R_
 	cmp al, 0x14
 	je p_T_
 	cmp al, 0x15 
 	je p_Y_
        cmp al, 0x16 
 	je p_U_

 	jmp move_player_2

p_1_:
	mov ax,1
	jmp moves_p2
p_2_:
	mov ax,2
	jmp moves_p2
p_3_:
	mov ax,3
	jmp moves_p2
p_4_:
	mov ax,4
	jmp moves_p2
p_5_:
	mov ax,5
	jmp moves_p2
p_6_:
	mov ax,6
	jmp moves_p2
p_7_:
	mov ax,7
	jmp moves_p2
p_8_:
	mov ax,8
	jmp moves_p2
p_9_:
	mov ax,9
	jmp moves_p2
p_Q_:
	mov ax,10
	jmp moves_p2
p_W_:
	mov ax,11
	jmp moves_p2
p_E_:
	mov ax,12
	jmp moves_p2
p_R_:
	mov ax,13
	jmp moves_p2
p_T_:
	mov ax,14
	jmp moves_p2
p_Y_:
	mov ax,15
	jmp moves_p2
p_U_: 
        mov ax , 16
        jmp moves_p2


	moves_p2:
	mov bp, Board
	add bp, ax
	
	cmp byte [bp],0
	jne near occupied_1
	
	mov byte [bp],2
	mov bp, Area  
	shl ax,1

	add bp,ax
	mov di,[bp]
	
	mov ax, 0xb800
	mov es, ax
	mov word [es:di],0111100001001111b   
	
	check:
		mov bp,Board
		col_1_:
			cmp byte [bp],1   
			jne col_2_
			cmp byte [bp+4],1
			jne col_2_
			cmp byte [bp+8],1
			jne col_2_
			cmp byte [bp+12],1
			je near win_player_2
		col_2_:
			cmp byte [bp+1],1
			jne col_3_
			cmp byte [bp+5],1
			jne col_3_
			cmp byte [bp+9],1
			jne col_3_
			cmp byte [bp+13],1
			je near win_player_2
		col_3_:
			cmp byte [bp+2],1
			jne col_4_
			cmp byte [bp+6],1
			jne col_4_
			cmp byte [bp+10],1
			jne col_4_
			cmp byte [bp+14],1
			je near win_player_2
		col_4_:
			cmp byte [bp+3],1
			jne row_1_
			cmp byte [bp+7],1
			jne row_1_
			cmp byte [bp+11],1
			jne row_1_
			cmp byte [bp+15],1
			je near win_player_2
		row_1_:
			cmp byte [bp],1
			jne row_2_
			cmp byte [bp+1],1
			jne row_2_
			cmp byte [bp+2],1
			jne row_2_
			cmp byte [bp+3],1
			je near win_player_2
		row_2_:
			cmp byte [bp+4],1
			jne row_3_
			cmp byte [bp+5],1
			jne row_3_
			cmp byte [bp+6],1
			jne row_3_
			cmp byte [bp+7],1
			je near win_player_2
		row_3_:
			cmp byte [bp+8],1
			jne row_4_
			cmp byte [bp+9],1
			jne row_4_
			cmp byte [bp+10],1
			jne row_4_
			cmp byte [bp+11],1
			je near win_player_2
		row_4_:
			cmp byte [bp+12],1
			jne diagnol_1_
			cmp byte [bp+13],1
			jne diagnol_1_
			cmp byte [bp+14],1
			jne diagnol_1_
			cmp byte [bp+15],1
			je near win_player_2
		diagnol_1_: 
			cmp byte [bp],1
			jne diagnol_2_
			cmp byte [bp+5],1
			jne diagnol_2_
			cmp byte [bp+10],1
			jne diagnol_2_
			cmp byte [bp+15],1
			je win_player_2
		diagnol_2_:  
			cmp byte [bp+3],1
			jne loss_player_2
			cmp byte [bp+6],1
			jne loss_player_2
			cmp byte [bp+9],1
			jne loss_player_2
			cmp byte [bp+12],1
			je win_player_2
			jmp loss_player_2
			
	
	occupied_1: 
                 mov ax, 25
                 push ax 
                 mov ax, 20
                 push ax 
                 mov ax, 3
                 push ax 
                 mov ax, space
                 push ax 
                 call printstr
                 pop ax
call text
		 jmp move_player_2
	
	loss_player_2:  
		out 0x20, al 
		popa
		ret
		
	win_player_2:  
		 out 0x20, al 
		 mov ax, 3
                 push ax 
                 mov ax, 10
                 push ax 
                 mov ax, 2
                 push ax 
                 mov ax, t2
                 push ax 
                 call printstr 
		 jmp end1 

printstr: 

 push bp
 mov bp, sp
 push es
 push ax
 push cx
 push si
 push di
 push ds
 pop es 
 mov di, [bp+4] 
 mov cx, 0xffff 
 xor al, al 
 repne scasb 
 mov ax, 0xffff
 sub ax, cx 
 dec ax 
 jz exit 
 mov cx, ax 
 mov ax, 0xb800
 mov es, ax 
 mov al, 80 
 mul byte [bp+8] 
 add ax, [bp+10] 
 shl ax, 1 
 mov di,ax
 mov si, [bp+4] 
 mov ah, [bp+6] 
 cld 

nextchar: 
 lodsb 
call terminator
call terminator
 stosw 
 loop nextchar 


exit:
 pop di
 pop si
 pop cx
 pop ax
 pop es
 pop bp
 ret 8

clrscr: 
 push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax 
 xor di, di 
 mov ax, 0x0720 
 mov cx, 2000 
 cld 
 rep stosw 
 pop di 
 pop cx
 pop ax
 pop es
 ret

text: 
 push es
 push ax
 push cx
 push di
        mov ax, 0xb800
	mov es, ax
	mov di, 3254
	mov cx,25
	mov ah,01110000b
	mov al,20h
 cld 
 rep stosw 
 pop di 
 pop cx
 pop ax
 pop es
 ret

end1:
call terminator
call terminator
   call clrscr
    mov ax, 25
    push ax 
    mov ax, 10
    push ax 
    mov ax, 3
    push ax 
    mov ax, again
    push ax 
    call printstr 

 mov ax, 25
 push ax 
 mov ax, 12
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu1
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 13
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu2
 push ax 
 call printstr 

        mov ah, 0 ; KEYBOARD INTERRUPT
	int 16h
	cmp al, 's'
		je start2
	cmp al, 'a'
		je bye_

start1:
 call clrscr 
 mov ax, 25
 push ax 
 mov ax, 10
 push ax 
 mov ax, 3
 push ax 
 mov ax, menu
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 12
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu1
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 13
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu2
 push ax 
 call printstr 

        mov ah, 0 ; KEYBOARD INTERRUPT
	int 16h
	cmp al, 's'
		je start2
	cmp al, 'a'
		je bye_

bye_:

 call clrscr 
 mov ax, 25
 push ax 
 mov ax, 10
 push ax 
 mov ax, 3
 push ax 
 mov ax, bye
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 11
 push ax 
 mov ax, 3
 push ax 
 mov ax, bye1
 push ax 
 call printstr 
call terminator

mov ax , 0x4c00
int 0x21
  
start2:
 call clrscr
 mov ax, 25
 push ax 
 mov ax, 10
 push ax 
 mov ax, 7
 push ax 
 mov ax, i1
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 11
 push ax 
 mov ax, 7
 push ax 
 mov ax, i2
 push ax 
 call printstr 

        mov ah, 0 ; KEYBOARD INTERRUPT
	int 16h
	cmp al, 'q'
		je start
	cmp al, 'w'
		je start_



start_:
 call clrscr
 mov ax, 25
 push ax 
 mov ax, 1
 push ax 
 mov ax, 3
 push ax 
 mov ax, msg
 push ax 
 call printstr 

 mov ax, 1
 push ax 
 mov ax, 5
 push ax 
 mov ax, 2
 push ax 
 mov ax, msg1
 push ax 
 call printstr 

 mov ax, 1
 push ax 
 mov ax, 9
 push ax 
 mov ax, 2
 push ax 
 mov ax, win
 push ax 
 call printstr 
	call PlayArea_
         mov cx , 16  
	playing_:
		call player_1
		dec cx
		jcxz exit__
		call player_2
		dec cx
		jcxz exit__
		jmp playing_
	exit__:
         call clrscr
	 mov ax, 25
         push ax 
         mov ax, 10
         push ax 
         mov ax, 8
         push ax 
         mov ax, dr
         push ax 
         call printstr 
         call terminator
         call terminator
         call clrscr 
         call e


start:
 call clrscr
 mov ax, 25
 push ax 
 mov ax, 1
 push ax 
 mov ax, 3
 push ax 
 mov ax, msg
 push ax 
 call printstr 

 mov ax, 1
 push ax 
 mov ax, 5
 push ax 
 mov ax, 2
 push ax 
 mov ax, msg1
 push ax 
 call printstr 

 mov ax, 1
 push ax 
 mov ax, 9
 push ax 
 mov ax, 2
 push ax 
 mov ax, win
 push ax 
 call printstr 
	call PlayArea
        mov cx , 16  
	playing:
		call player_1
		dec cx
		jcxz exit_
		call player_2
		dec cx
		jcxz exit_
		jmp playing
	exit_:
         call clrscr
	 mov ax, 25
         push ax 
         mov ax, 10
         push ax 
         mov ax, 8
         push ax 
         mov ax, dr
         push ax 
         call printstr 
         call terminator
         call terminator
          call clrscr 
e:
 mov ax, 25
 push ax 
 mov ax, 10
 push ax 
 mov ax, 3
 push ax 
 mov ax, menu
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 12
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu1
 push ax 
 call printstr 

 mov ax, 25
 push ax 
 mov ax, 13
 push ax 
 mov ax, 2
 push ax 
 mov ax, menu2
 push ax 
 call printstr 

        mov ah, 0 ; KEYBOARD INTERRUPT
	int 16h
	cmp al, 's'
		je start2
	cmp al, 'a'
		je bye_

	
end:
	mov ax, 0x4c00
	int 0x21