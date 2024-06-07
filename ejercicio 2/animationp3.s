.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32


.globl animation3

animation3:
    mov x27, x30
    mov x18, SCREEN_HEIGH   
    mov x26, 1              


tablon1:

    ldr w10, [sp, 86]       //tablon 1
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, SCREEN_WIDTH
    bl Rectangulo
    
    bl no_overlaping        // para no sobrepasar los chorros //
    
    bl scounter_end
    bl fdelay
    cmp x18, 453
    b.ge tablon1


    mov x18, 453            //altura inicial 
    mov x26, 1               //ancho parcial


tablon2:

    ldr w10, [sp, 90]          // tablon 2
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, SCREEN_WIDTH
    bl Rectangulo

    bl no_overlaping            // para no sobrepasar los chorros//


    bl scounter_end
    bl fdelay
    cmp x18, 433
    b.ge tablon2


    mov x18, 433                //altura inicial 
    mov x26, 1                   //ancho parcial


tablon3:
    ldr w10, [sp, 86]           // tablon 3
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 10
    bl Rectangulo
                                //cada lado
    mov x1, x18
    mov x2, 613
    bl getPixel
    mov x1, x26
    mov x2, 27
    bl Rectangulo

    bl scounter_end
    bl fdelay
    cmp x18, 400 
    b.ge tablon3
    
 
    mov x18, 400        //altura inicial 
    mov x26, 1          //ancho parcial


tablon4:
    ldr w10, [sp, 90]           //tablon 4
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 10
    bl Rectangulo
                                //ambos lados
    mov x1, x18
    mov x2, 613
    bl getPixel
    mov x1, x26
    mov x2, 27
    bl Rectangulo

    bl scounter_end
    bl fdelay
    cmp x18, 370 
    b.ge tablon4


    mov x18, 370                //altura inicial 
    mov x26, 1                  //ancho parcial


tablon5:
    ldr w10, [sp, 86]           //tablon 5
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 10
    bl Rectangulo
                                //ambos lados
    mov x1, x18
    mov x2, 613
    bl getPixel
    mov x1, x26
    mov x2, 27
    bl Rectangulo
    
    bl scounter_end
    bl fdelay
    cmp x18, 340 
    b.ge tablon5


    mov x18,340             //altura inicial 
    mov x26,1               //ancho parcial


tablon6:
    ldr w10, [sp, 90]           //tablon 6
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 10
    bl Rectangulo
                                //ambos lados
    mov x1, x18
    mov x2, 613
    bl getPixel
    mov x1, x26
    mov x2, 27
    bl Rectangulo

    bl scounter_end
    bl fdelay
    cmp x18, 310 
    b.ge tablon6

//pared inundada

    mov x17, 245
    mov x21, 1
    mov x18, 310                
    mov x26, 1                  


pared1:
    ldr w10, [sp, 82]           //pared
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 10
    bl Rectangulo

    mov x1, x18
    mov x2, 613
    bl getPixel
    mov x1, x26
    mov x2, 27
    bl Rectangulo

    cmp x18, 210
    b.le can_arena
    b not_paint

can_arena:    
    cmp x17, 322 
    b.le paint_sand
    b not_paint

paint_sand:
    ldr w10, [sp, 28]           //arena
    mov x1, x17
    mov x2, 36
    bl getPixel
    mov x1, x21
    mov x2, 411
    bl Rectangulo

    add x21, x21, 1
    add x17, x17, 1

not_paint:
    bl scounter_end
    bl fdelay
    cmp x18, 133
    b.ge pared1

// cortar chorros

    mov x18, 400                
    mov x17, 133
    mov x21, 1
    mov x26,1                   


chorro1:
    ldr w10, [sp]               //chorro marco negro
    mov x1, x18
    mov x2, 36
    bl getPixel
    mov x1, x26
    mov x2, 411
    bl Rectangulo

agua1:
    bl water_pararel
    
    bl counter2_end
    bl fdelay
    cmp x18, 404
    b.le chorro1
    cmp x17, 124                // sino se pierden 5px de agua
    b.ge agua1


    mov x18, 409                
    mov x17, 124
    mov x21, 1
    mov x26, 1                  


chorro2:
    ldr w10, [sp,20]            //chorro marco exterior
    mov x1, x18
    mov x2, 36
    bl getPixel
    mov x1, x26
    mov x2, 411
    bl Rectangulo

    bl water_pararel

    bl counter2_end
    bl fdelay
    cmp x18, 421
    b.le chorro2


    mov x18, 434                
    mov x17, 112
    mov x21, 1
    mov x26, 1                  


chorro3:
    ldr w10, [sp,90]            //chorro tablon claro
    mov x1, x18
    mov x2, 36
    bl getPixel
    mov x1, x26
    mov x2, 411
    bl Rectangulo

    ldr w10, [sp]               //chorro tripode
    mov x1, x18
    mov x2, 242
    bl getPixel
    mov x1, x26
    mov x2, 122
    bl Rectangulo

    bl water_pararel

    bl counter2_end
    bl fdelay
    cmp x18, 443
    b.le chorro3


    mov x18, 453                
    mov x17, 104
    mov x21, 1
    mov x26, 1                  


chorro4:
    ldr w10, [sp,86]            
    mov x1, x18
    mov x2, 36
    bl getPixel
    mov x1, x26
    mov x2, 411
    bl Rectangulo

    ldr w10, [sp]               
    mov x1, x18
    mov x2, 242
    bl getPixel
    mov x1, x26
    mov x2, 122
    bl Rectangulo
    
agua2:
    bl water_pararel
    
    bl counter2_end
    bl fdelay
    cmp x18, 470
    b.le chorro4
    cmp x17, 80
    b.ge agua2


    mov x18, 79                 
    mov x26,1                   


boton1:
    ldr w10, [sp, 82]           
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 431
    bl Rectangulo

    mov x1, x18
    mov x2, 522
    bl getPixel
    mov x1, x26
    mov x2, 118
    bl Rectangulo

    bl scounter_end
    bl fdelay
    cmp x18, 70
    b.ge boton1


    mov x18, 69                 
    mov x26,1                   


boton2:
    ldr w10, [sp, 82]           
    mov x1, x18
    mov x2, 0
    bl getPixel
    mov x1, x26
    mov x2, 438
    bl Rectangulo

    mov x1, x18
    mov x2, 514
    bl getPixel
    mov x1, x26
    mov x2, 126
    bl Rectangulo

    bl scounter_end
    bl fdelay
    cmp x18, 63
    b.ge boton2

    ret x27

