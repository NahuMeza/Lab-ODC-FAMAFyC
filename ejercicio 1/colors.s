.globl Color
// devuelve x10 = color RGB
// tengo que usar stack pointer
// black_screen			     [sp,82]
// pre espuma				 [sp,78]
// sol						 [sp,74]
// espuma					 [sp,70]
// oceano profundo			 [sp,66]
// rosa pastel				 [sp,62]
// rosa						 [sp,58]
// rosa viejo cielo			 [sp,54]
// magenta cielo 			 [sp,50]
// negro					 [sp,78]
// violeta cielo			 [sp,36]
// azul cielo				 [sp,32]
// color de la playa 		 [sp,28] 
// fondo azul 				 [sp,24]
// camara marco exterior     [sp,20]
// rayita oscura derecha     [sp,16]
// reflejo derecha           [sp,12]
// reflejo oscuro botones 	 [sp,8]
// oceano claro			 	 [sp,4]
// marco negro 	             [sp] 
Color:
	sub sp,sp,82 		//Reservamos

	movz x10, 0x0000, lsl 00
	movk x10, 0x00, lsl 16
	str w10, [sp, 82]

	movz x10, 0xbae0, lsl 00
	movk x10, 0x6c, lsl 16
	str w10, [sp, 78]

	movz x10,0xB236,lsl 00
    movk x10,0xDB,lsl 16
	str w10, [sp, 74]

	movz x10,0xf0fb,lsl 00
    movk x10,0xb0,lsl 16
	str w10, [sp, 70]

	movz x10, 0x32, lsl 16
    movk x10, 0x8bba, lsl 00
	str w10,[sp, 66]

	movz x10, 0xd6, lsl 16
    movk x10, 0x9fa2, lsl 00
	str w10, [sp, 62]

	movz x10, 0xc2, lsl 16
    movk x10, 0x8096, lsl 00
	str w10, [sp, 58]

	movz x10, 0x99, lsl 16
    movk x10, 0x6883, lsl 00
	str w10, [sp, 54]

	movz x10, 0x99, lsl 16
    movk x10, 0x6897, lsl 00
	str w10, [sp, 50]

	movz x10, 0x7b, lsl 16
    movk x10, 0x6799, lsl 00
	str w10,[sp,36]

	movz x10, 0x54, lsl 16
    movk x10, 0x6d8e, lsl 00
	str w10,[sp,32]

	movz x10, 0xC070, lsl 00
	movk x10, 0xD0, lsl 16
	str w10,[sp,28]

	movz x10, 0x6d8e, lsl 00
	movk x10, 0x54, lsl 16
	str w10,[sp,24]

	movz x10, 0xa9a1, lsl 00
	movk x10, 0xab, lsl 16
	str w10,[sp,20]

    movz x10, 0x908c, lsl 00
	movk x10, 0x91, lsl 16
	str w10,[sp,16]

    movz x10, 0xb4b0, lsl 00
	movk x10, 0xb5, lsl 16
	str w10,[sp,12]

    movz x10, 0x8b88, lsl 00
	movk x10, 0x8c, lsl 16
	str w10,[sp,8]

    movz x10, 0xb3fa, lsl 00
	movk x10, 0x38, lsl 16
	str w10,[sp,4]

    movz x10, 0x4646, lsl 00
	movk x10, 0x46, lsl 16
	str w10,[sp]
    ret


