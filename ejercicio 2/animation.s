.globl animation1
animation1:
    mov x27,x30     //direccion de retorno
    mov x26,1       //cuantos pixeles va a avanzar por frame    
    mov x18,0       //lo que se le sumara eventualmente para que baje la arena
    mov x16,10       //a partir de cuantos frame se empieza a mover la parte fija de arena
    mov x17,0       //lo que se le sumara eventualmente para que baje la arena fija

oceano:
    mov x1, 247
    mov x2, x7
    bl getPixel

    mov x1, 33
    ldr w10, [sp, 66]
    bl Rcielo           // oceano profundo

    mov x1, 280
    mov x2, x7
    bl getPixel

    mov x1, 120
    ldr w10, [sp, 4]
    bl Rcielo           // oceano claro -- oceano basico hasta aca

    mov x1, 275
    mov x2, 300
    bl getPixel

    mov x2, 100
    bl Reflejo          //reflejo claro derecha

    mov x1, 277
    mov x2, x7
    bl getPixel
    
    mov x2, 130
    bl Reflejo          // reflejo claro izquierda

    mov x1, 280
    mov x2, 150
    bl getPixel

    mov x2, 150
    ldr w10, [sp,66]
    bl Reflejo          //  reflejo oscuro medio

    mov x1, 283
    mov x2, 270
    bl getPixel

    mov x2, 70
    bl Reflejo          // reflejo oscuro derecha

arena:
    ldr x10,[sp,28]            //hago parte fija de arena
    sub x16,x16,1
    cmp x16,xzr
    b.gt salto          //me fijo si la parte de arena fija empieza a moverse
    mov x1, 346
    add x17,x17,1
    add x1,x1,x17           //la voy bajando un pixel y restando en uno el alto
    mov x2,36
    bl getPixel
    mov x1, 54
    sub x1,x1,x17
    mov x2, 411
    bl Rectangulo
    b posalto

salto:
    mov x1, 346
    mov x2,36
    bl getPixel
    mov x1, 54
    mov x2, 411
    bl Rectangulo

posalto:
    ldr x10, [sp,78]              //parte de espuma ascendente
    mov x1,336
    add x1,x1,x18               //se le ira sumando para que empiece de mas abajo en cada frame
    mov x2,300
    bl getPixel                   //se repite el mismo proceso para cada parte
    mov x1,90
    bl variation19
    bl circulo_descendente
    
    mov x1,336                  //parte de espuma descendente
    add x1,x1,x18
    mov x2,182
    bl getPixel
    mov x1,90
    bl variation19
    bl circulo_ascendente

    ldr x10,[sp,70]             //parte de espuma ascendente
    mov x1,344
    add x1,x1,x18
    mov x2,300
    bl getPixel
    mov x1,90
    bl variation19
    bl circulo_descendente
    
    mov x1,344                  //parte de espuma descendente
    mov x2,182
    add x1,x1,x18
    bl getPixel
    mov x1,90
    bl variation19
    bl circulo_ascendente
                                //parte de arena descendente
    ldr x10,[sp,28]             
    mov x1,346
    add x1,x1,x18

    mov x2,300
    bl getPixel
    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_descendente
    
    mov x1,346          //parte ascendente de la arena
    add x1,x1,x18
    mov x2,182
    str x1,[sp,40]
    bl getPixel
    mov x1,90
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_ascendente

    add x18,x18,x26
    mov x3,398
    ldr x1,[sp,40]
    bl fdelay
    cmp x1,x3
    b.ge done3
    b oceano

done3:
                                    //ahora se ira aplanando el agua para que deje de tener forma de escalera
mov x17, 0

oceano2:
    mov x1, 247
    mov x2, x7
    bl getPixel

    mov x1, 33
    ldr w10, [sp, 66]
    bl Rcielo           // oceano profundo

    mov x1, 280
    mov x2, x7
    bl getPixel

    mov x1, 120
    ldr w10, [sp, 4]
    bl Rcielo           // oceano claro -- oceano basico hasta aca

    mov x1, 275
    mov x2, 300
    bl getPixel

    mov x2, 100
    bl Reflejo          //reflejo claro derecha

    mov x1, 277
    mov x2, x7
    bl getPixel
    
    mov x2, 130
    bl Reflejo          // reflejo claro izquierda

    mov x1, 280
    mov x2, 150
    bl getPixel

    mov x2, 150
    ldr w10, [sp,66]
    bl Reflejo          //  reflejo oscuro medio

    mov x1, 283
    mov x2, 270
    bl getPixel

    mov x2, 70
    bl Reflejo          // reflejo oscuro derecha

posalto2:
    ldr x10, [sp,78]              //parte de espuma ascendente
    mov x1,336
    add x1,x1,x18
    mov x2,300
    bl getPixel
    mov x1,32
    sub x1,x1,x17           //se le ira restando a la altura del cuadrante del circulo para ir aplanando la zona
    mov x2,265
    mov x3,4                    //se repite lo mismo para cada parte
    mov x4,19
    mov x5,4
    bl circulo_descendente
    
    mov x1,336                  //parte de espuma descendente
    add x1,x1,x18
    mov x2,182
    bl getPixel
    mov x1,32
    sub x1,x1,x17
    bl variation19
    bl circulo_ascendente

    ldr x10,[sp,70]             //parte de espuma ascendente
    mov x1,344
    add x1,x1,x18
    mov x2,300
    bl getPixel
    mov x1,32
    sub x1,x1,x17
    bl variation19
    bl circulo_descendente
    
    mov x1,344                  //parte de espuma descendente
    mov x2,182
    add x1,x1,x18
    bl getPixel
    mov x1,32
    sub x1,x1,x17
    bl variation19
    bl circulo_ascendente
                                //parte de arena descendente
    ldr x10,[sp,28]             
    mov x1,346
    add x1,x1,x18

    mov x2,300
    bl getPixel
    mov x1,32
    sub x1,x1,x17
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_descendente
    
    mov x1,346                  //parte ascendente de la arena
    add x1,x1,x18
    mov x2,182
    str x1,[sp,40]
    bl getPixel
    mov x1,32
    sub x1,x1,x17
    str x1,[sp,40]
    mov x2,265
    mov x3,4
    mov x4,20
    mov x5,4
    bl circulo_ascendente

    add x17,x17,x26
    ldr x3,[sp,40]
    mov x1,1            //nos fijamos si la altura de la arena y espuma ya es casi nula
    bl fdelay
    cmp x3,x1
    b.le done4
    b oceano2

done4:
                        // le dibujamos la ultima franja de agua para quitar toda la espuma
    mov x1, 247
    mov x2, x7
    bl getPixel

    mov x1, 33
    ldr w10, [sp, 66]
    bl Rcielo           // oceano profundo

    mov x1, 280
    mov x2, x7
    bl getPixel

    mov x1, 120
    ldr w10, [sp, 4]
    bl Rcielo           // oceano claro -- oceano basico hasta aca

    mov x1, 275
    mov x2, 300
    bl getPixel

    mov x2, 100
    bl Reflejo          //reflejo claro derecha

    mov x1, 277
    mov x2, x7
    bl getPixel
    
    mov x2, 130
    bl Reflejo          // reflejo claro izquierda

    mov x1, 280
    mov x2, 150
    bl getPixel

    mov x2, 150
    ldr w10, [sp,66]
    bl Reflejo          //  reflejo oscuro medio

    mov x1, 283
    mov x2, 270
    bl getPixel

    mov x2, 70
    bl Reflejo          // reflejo oscuro derecha
    
    ret x27
    
variation19:            //resumimos coordenadas repetidas
    mov x2,265
    mov x3,4
    mov x4,19
    mov x5,4
    
    ret

    
