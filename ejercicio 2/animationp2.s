.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32
.globl animation2

animation2:
    mov x27,x30
    mov x18,0                   // Altura que se va restando
    mov x26,1                   // Ancho
    mov x1,SCREEN_HEIGH
    str x1,[sp,40]  

chorros:                        // Empizan a caer los chorros de agua desbordandose
    ldr w10, [sp, 4]            // Primer chorro
    mov x1, 400
    mov x2, 402
    bl getPixel
    mov x1, 1
    add x1,x1,x18
    add x18,x18,x26
    mov x2, 45
    bl Rectangulo           

    ldr w10, [sp, 4]            // Segundo chorro
    mov x1, 400
    mov x2, 150
    bl getPixel
    mov x1, 1
    add x1,x1,x18
    add x18,x18,x26
    mov x2, 20
    bl Rectangulo           

    ldr w10, [sp, 4]            // Tercer chorro
    mov x1, 400
    mov x2, 300
    bl getPixel
    mov x1, 1
    add x1,x1,x18
    add x18,x18,x26
    mov x2, 25
    bl Rectangulo           

    mov x1, 400                 // Cuarto chorro
    mov x2, 36
    bl getPixel
    mov x1, 1
    add x1,x1,x18
    str x1,[sp,40]  
    add x18,x18,x26
    mov x2, 45
    bl Rectangulo
               
    ldr x1,[sp,40]  
    mov x2,SCREEN_HEIGH
    bl fdelay
    cmp x1,x2 
    b.le chorros
    ret x27

