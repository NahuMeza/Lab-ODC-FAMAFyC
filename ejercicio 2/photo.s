    .equ SCREEN_WIDTH,   640
    .equ SCREEN_HEIGH,   480
    .equ BITS_PER_PIXEL, 32
    .globl photo

photo:

    mov x23, x30
    mov x7, 36                  // punto incial x2 global
    movz x6, 411                // ancho global x2

    mov x1, 111
    mov x2, x7
    bl getPixel
    
    mov x1, 18
    ldr w10,[sp,32]	
    bl Rcielo

    mov x1, 129
    mov x2, x7
    bl getPixel

    mov x1, 14
    ldr w10,[sp,36]
    bl Rcielo

    mov x1, 143
    mov x2, x7
    bl getPixel

    mov x1, 12
    ldr w10,[sp,50]
    bl Rcielo

    mov x1, 155
    mov x2, x7
    bl getPixel

    mov x1, 13
    ldr w10,[sp,54]
    bl Rcielo

    mov x1, 168
    mov x2, x7
    bl getPixel

    mov x1, 12
    ldr w10, [sp,58]
    bl Rcielo

    mov x1, 180
    mov x2, x7
    bl getPixel

    mov x1, 67
    ldr w10, [sp, 62]
    bl Rcielo

oceano:
    mov x1, 247
    mov x2, x7
    bl getPixel

    mov x1, 33
    ldr w10, [sp, 66]
    bl Rcielo

    mov x1, 280
    mov x2, x7
    bl getPixel

    mov x1, 120
    ldr w10, [sp, 4]
    bl Rcielo                   // Termina oceano basico

    mov x1, 275
    mov x2, 300
    bl getPixel

    mov x2, 100
    bl Reflejo                  // Reflejo claro derecha

    mov x1, 277
    mov x2, x7
    bl getPixel
    
    mov x2, 130
    bl Reflejo                  // Reflejo claro izquierda

    mov x1, 280
    mov x2, 150
    bl getPixel

    mov x2, 150
    ldr w10, [sp,66]
    bl Reflejo                  // Reflejo oscuro medio

    mov x1, 283
    mov x2, 270
    bl getPixel

    mov x2, 70
    bl Reflejo                  // Reflejo oscuro derecha

arena:
    ldr x10,[sp,28]             // Hacemos parte fija de arena
    mov x1, 346
    mov x2,36
    bl getPixel

    mov x1, 54
    mov x2, 411
    bl Rectangulo

    ldr x10, [sp, 78]             
    mov x1,335
    mov x2,300
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,19
    mov x5,4
    bl circulo_descendente      // Parte de arena descendente
    
    mov x1,335                  
    mov x2,182
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,19
    mov x5,4
    bl circulo_ascendente       // Parte ascendente de la arena

    ldr x10,[sp,70]             // Parte de espuma ascendente
    mov x1,343
    mov x2,300
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,19
    mov x5,4
    bl circulo_descendente
    
    mov x1,343                  // Parte de espuma descendente
    mov x2,182
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,19
    mov x5,4
    bl circulo_ascendente
                                // Parte de arena descendente
    ldr x10,[sp,28]             
    mov x1,345
    mov x2,300
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_descendente
    
    mov x1,345                  // Parte ascendente de la arena
    mov x2,182
    bl getPixel

    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_ascendente

sun:
    // A la funcion circulo_ascendente/descendente hay que pasarle los siguientes paramentros:
    // x0:pixel inicial,x1:altura,x2:ancho,x3:cada cuantas filas completadas subimos,x4:cuando subimos cuantas columnas avanzamos,
    // y en x5: alguna variacion que le querramos hacer cada vez que sube/baja el ancho (0 no hace nada)
    
    mov x1,246
    mov x2,141
    bl getPixel

    mov x1,40
    mov x2,100
    mov x3,5
    mov x4,3
    mov x5,2
    ldr w10, [sp,74]
    bl circulo_ascendente

    mov x1,246
    mov x2,340
    bl getPixel

    mov x1,40
    mov x2,100
    mov x3,5
    mov x4,3
    mov x5,2
    bl circulo_descendente

    ret x23

