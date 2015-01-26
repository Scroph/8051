org 000h

mov 30h, #00111111b ;0
mov 31h, #00000110b ;1
mov 32h, #01011011b ;2
mov 33h, #01001111b ;3
mov 34h, #01100110b ;4
mov 35h, #01101101b ;5
mov 36h, #01111101b ;6
mov 37h, #00000111b ;7
mov 38h, #01111111b ;8
mov 39h, #01101111b ;9

;Boucle principale
;Ne fait qu'appeler les autres fonctions de façon successive.
;La fonction read_keypad enregistre le chiffre lu dans le registre r7
;La fonction display lit la valeur à afficher à partir du même registre : r7
main:
	call read_keypad
	call display
	call delay
	sjmp main

;La fonction read_keypad implémente l'algorithme décrit ici :
;http://www.dnatechindia.com/Tutorial/8051-Tutorial/Interfacing-Matrix-Keypad-to-8051.html
;Le chiffre lu est stocké dans le registre R7
read_keypad:
	mov p1, #11111111b
	clr p1.0
	jnb p1.3, ret_1
	jnb p1.4, ret_4
	jnb p1.5, ret_7

	setb p1.0
	clr p1.1
	jnb p1.3, ret_2
	jnb p1.4, ret_5
	jnb p1.5, ret_8
	jnb p1.6, ret_0

	setb p1.1
	clr p1.2
	jnb p1.3, ret_3
	jnb p1.4, ret_6
	jnb p1.5, ret_9	

	ret

ret_1:
	mov r7, #1d
	ret
ret_2:
	mov r7, #2d
	ret
ret_3:
	mov r7, #3d
	ret
ret_4:
	mov r7, #4d
	ret
ret_5:
	mov r7, #5d
	ret
ret_6:
	mov r7, #6d
	ret
ret_7:
	mov r7, #7d
	ret
ret_8:
	mov r7, #8d
	ret
ret_9:
	mov r7, #9d
	ret
ret_0:
	mov r7, #0d
	ret

;Fonction de délai
;Un délai assez court pour que le clavier soit responsif
;Mais aussi assez long pour que le CPU ne soit pas utilisé à 100%
delay:
	push 0
	push 1
	push 2
	mov r0, #127
	mov r1, #127
	mov r2, #1
boucle:
	djnz r0, boucle
	djnz r1, boucle
	djnz r2, boucle
	pop 2
	pop 1
	pop 0
	ret

;Fonction d'affichage
;On passera le nombre à afficher à la fonction display par le biais du registre r7.
;Registre r7 : Le nombre à afficher
;Dans ce qui suit, j'utiliserai le terme "représentation binaire" pour désigner
;quelles diodes allumer dans l'afficheur à 7 segments : a, b, .., g
;La représentation binaire de ce nombre-là est stockée dans l'adresse #30h + @r7
;Exemple : La représentation binaire de 7 est 00000111b
;Elle est stockée dans l'adresse 30h + 7 = 37h
display:
	push a
	push 0
	mov a, #30h
	add a, r7
	mov r0, a
	mov p0, @r0
	pop 0
	pop a
	ret
end