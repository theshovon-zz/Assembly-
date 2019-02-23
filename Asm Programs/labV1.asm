	ORG	96
;              Y-0 Z-8 C-16 D-24 L-32 M-40 X-?
	DD	15, 6, -5,   12,  3,   11,  0
	addi	x3, x0, 96	  ; start of globals (static)
	ld	x5, 0(x3)	   ; Y
	ld	x6, 40(x3)	  ; M
	add	x7, x5, x6	  ; Y+M
	ld	x5, 32(x3)	  ; L
	ld	x6, 24(x3)  	; D
	sub	x28, x5, x6	 ; L-D
	sub	x7, x7, x28	 ; (Y+M)-(L-D)
	ld	x5, 8(x3)   	; Z
	ld	x28, 16(x3)	 ; C
	add	x28, x28, x5	; Z+C
	add	x7, x7, x28	 ; (Y+M)-(L-D) + (Z+C)
	sub	x7, x7, x6	  ; (Y+M)-(L-D) + (Z+C) - D
	sd	x7, 48(x3)	  ; save X
	
