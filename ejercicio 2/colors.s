.globl Color
// devuelve x10 = color RGB
// tengo que usar stack pointer
// hay que restarles el espacio para usarlos
// tablon madera claro		 [sp,90]
// tablon madera oscuro		 [sp,86]
// pared pecera				 [sp,82]
// pre espuma				 [sp,78]
// sol						 [sp,74]
// espuma					 [sp,70]
// oceano profundo			 [sp,66]
// rosa pastel				 [sp,62]
// rosa						 [sp,58]
// rosa viejo cielo			 [sp,54]
// magenta cielo 			 [sp,50]
// violeta cielo			 [sp,36]
// azul cielo				 [sp,32]
// arena			 		 [sp,28] 
// fondo azul 				 [sp,24]
// camara marco exterior     [sp,20]
// rayita oscura derecha     [sp,16]
// madera clara	             [sp,12]
// madera				 	 [sp,8]
// oceano claro 	 		 [sp,4]
// marco negro 	             [sp] 
Color:
	sub sp,sp,90

    movz x10, 0x62, lsl 16
    movk x10, 0x9a9e, lsl 00
	str w10, [sp, 90]
	
    movz x10, 0x52, lsl 16
    movk x10, 0x8387, lsl 00
	str w10, [sp,86]

    movz x10, 0x9cbf, lsl 00
	movk x10, 0x7a, lsl 16
	str w10,[sp,82]

	movz x10,0xbae0,lsl 00
    movk x10,0x6c,lsl 16
	str w10, [sp, 78]

	movz x10,0xB236,lsl 00
    movk x10,0xDB,lsl 16
	str w10, [sp, 74]

	movz x10,0xf0fb,lsl 00
    movk x10,0xb0,lsl 16
	str w10, [sp, 70]

	movz x10, 0x32, lsl 16
    movk x10, 0x8bba, lsl 00
	str w10,[sp,66]

	movz x10, 0xd6, lsl 16
    movk x10, 0x9fa2, lsl 00
	str w10, [sp,62]

	movz x10, 0xc2, lsl 16
    movk x10, 0x8096, lsl 00
	str w10, [sp,58]

	movz x10, 0x99, lsl 16
    movk x10, 0x6883, lsl 00
	str w10, [sp,54]

	movz x10, 0x99, lsl 16
    movk x10, 0x6897, lsl 00
	str w10, [sp,50]

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

    movz x10, 0x5b44, lsl 00
	movk x10, 0x75, lsl 16
	str w10,[sp,12]

    movz x10, 0x6c5c, lsl 00
	movk x10, 0x80, lsl 16
	str w10,[sp,8]

    movz x10, 0xb3fa, lsl 00
	movk x10, 0x38, lsl 16
	str w10,[sp,4]

    movz x10, 0x4646, lsl 00
	movk x10, 0x46, lsl 16
	str w10,[sp]

    ret



