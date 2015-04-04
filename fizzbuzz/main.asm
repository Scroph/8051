mov a, #0
main:
	mov p0, a
	clr p2.0
	clr p2.1
fizz:
	mov r0, a
	mov r1, #3
	call divisible
	cjne r7, #1, buzz
	setb P2.0
buzz:
	mov r0, a
	mov r1, #5
	call divisible
	cjne r7, #1, backtomain
	setb P2.1
backtomain:
	inc a
	call delay
	sjmp main

delay:
	push 0
	push 1
	push 2
	mov r0, #255d
	mov r1, #255d
	mov r2, #4d

delay_loop:
	dec r0
	cjne r0, #0, delay_loop
	dec r1
	cjne r1, #0, delay_loop
	dec r2
	cjne r2, #0, delay_loop
	pop 2
	pop 1
	pop 0
	ret

;dividend in r0
;divisor in r1
;the result will be stored in r7 : 1 if r0 % r1 == 0, 0 otherwise
divisible:
	push a
	push b
	mov a, r0
	mov b, r1
	div ab
	;for some reason the B register doesn't work with the cjne instruction
	;cjne b, #0, not_divisible
	mov a, b ;we don't really care about the quotient
	cjne a, #0, not_divisible
	mov r7, #1
	sjmp fin
not_divisible:
	mov r7, #0
fin:
	pop b
	pop a
	ret
