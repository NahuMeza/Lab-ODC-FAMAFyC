.globl Encender
.globl black_screen

Encender:
    mov x23, x30
    bl black_screen

Logo:
    mov x1, 230
    mov x2, 200
    bl getPixel

    mov x1, 42
    mov x2, 88
    ldr w10, [sp, 66]
    bl Rectangulo               // cartel azul

// PRIMERAS CAPAS

    mov x1, 240
    mov x2, 210
    bl getPixel

    mov x1, 24
    mov x2, 19
    ldr w10, [sp, 70]
    bl Rectangulo               // 1era capa de O

    mov x1, 240
    mov x2, 235
    bl getPixel

    mov x1, 24
    mov x2, 14
    bl Rectangulo

    mov x1, 245
    mov x2, 249
    bl getPixel

    mov x1, 14
    mov x2, 4
    bl Rectangulo               // 1era capa de D

    mov x1, 240
    mov x2, 260
    bl getPixel

    mov x1, 24
    mov x2, 19
    bl Rectangulo               // 1era capa de C

// SEGUNDAS CAPAS

    mov x1, 245
    mov x2, 215
    bl getPixel

    mov x1, 14
    mov x2, 9
    ldr w10, [sp, 66]
    bl Rectangulo               // 2da capa de O

    mov x1, 245
    mov x2, 240
    bl getPixel

    mov x1, 14
    mov x2, 9
    bl Rectangulo               // 2da capa de D

    mov x1, 245
    mov x2, 265
    bl getPixel

    mov x1, 14
    mov x2, 9
    bl Rectangulo               // casi 2da capa de C

    mov x1, 250
    mov x2, 274
    bl getPixel

    mov x1, 5
    mov x2, x1
    bl Rectangulo	            // 2da capa de C

    ret x23

black_screen:
    mov x21, x30
    mov x1,111
    mov x2,36
    bl getPixel

	mov x1,289  
	mov x2,411
    ldr x10,[sp, 82]
    bl Rectangulo
    ret x21


