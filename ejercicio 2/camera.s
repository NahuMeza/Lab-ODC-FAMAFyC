.globl Camera

Camera:
    mov x23, x30

fondo:
    mov x7, 0               // punto incial x2 global
    mov x6, 640             // ancho global x2
    
    mov x1, x7 			 	
    mov x2, x7
    bl getPixel
	ldr x10,[sp,54]					
    mov x1, 307				
    bl Rcielo

    mov x1, 307             // madera
    mov x2, x7
    bl getPixel
    ldr x10, [sp, 8]
    mov x1, 173
    bl Rcielo

    mov x1, 337
    mov x2, x7
    bl getPixel
    ldr x10, [sp, 12]
    mov x1, 30
    bl Rcielo

    mov x1, 397
    mov x2, x7
    bl getPixel
    mov x1, 30
    bl Rcielo

    mov x1, 457
    mov x2, x7
    bl getPixel
    mov x1, 24
    bl Rcielo               // fin madera

    mov x1, 14
    mov x2, 34
    bl getPixel
    mov x1, 52
    mov x2, 228
    ldr x10, [sp, 20]
    bl Rectangulo

    mov x1, 19
    mov x2, 40
    bl getPixel
    mov x1, 42
    mov x2, 216
    ldr x10, [sp, 70]
    bl Rectangulo

    mov x1, 19
    mov x2, 108
    bl getPixel
    mov x1, 42
    mov x2, 6
    ldr x10, [sp, 20]
    bl Rectangulo

    mov x1, 19
    mov x2, 185
    bl getPixel
    mov x1, 42
    mov x2, 6
    bl Rectangulo           // ventana

borde_camara:    
	mov x1,79               // fila (y)
	mov x2,10               // columna (x)
	bl getPixel
	mov x1,354              // altura
	mov x2,603              // ancho (columna hasta donde llega, menos la columna inicial)
	ldr x10,[sp,20]
	bl Rectangulo
    
    mov x1,103
    mov x2,28
    bl getPixel
	mov x1,306  
	mov x2,455
    ldr x10,[sp]
    bl Rectangulo
    mov x1, 433             // tripode
    mov x2, 242
    bl getPixel
    mov x1, 47
    mov x2, 122
    bl Rectangulo

botones_camara:
    ldr x10,[sp, 16]         // borde GRIS OSCURO //
    mov x11, 36             // cambio tamano del boton
    mov x1, 69  
    mov x2, 431
    bl getPixel
    mov x1, 10
    mov x2, 91
    bl Rectangulo               // boton click oscuro
    
    mov x1, 139
    mov x2, 511
    bl getPixel
    bl Boton                    // boton izq arriba
    
    mov x1, 139
    mov x2, 563
    bl getPixel
    bl Boton                    // boton der arriba
    
    mov x1, 353
    mov x2, 511
    bl getPixel
    bl Boton                    // boton izq abajo
    
    mov x1, 353
    mov x2, 563
    bl getPixel
    bl Boton                    // boton der abajo              
    
    mov x11, 90                 // cambio tamano del boton
    mov x1, 218
    mov x2, 509
    bl getPixel
    bl Boton                    // boton grande
    
    mov x1, 103
    mov x2, 493
    bl getPixel
    mov x1, 307
    mov x2, 3
    bl Rectangulo               // barrita oscura
    
    mov x11, 32                 //cambio tamano del boton
    ldr x10,[sp,20]             // relleno GRIS CLARO //
    mov x1, 63
    mov x2, 438
    bl getPixel
    mov x1, 6
    mov x2, 77
    bl Rectangulo               // click gris claro
    
    mov x1, 141
    mov x2, 513    
    bl getPixel
    bl Boton                    // relleno boton izq arriba
    
    mov x1, 141
    mov x2, 565    
    bl getPixel
    bl Boton                    // relleno boton der arriba

    mov x1, 355
    mov x2, 513
    bl getPixel
    bl Boton

    mov x1, 355
    mov x2, 565    
    bl getPixel
    bl Boton                    // relleno boton der abajo

    mov x1, 248
    mov x2, 538
    bl getPixel
    bl Boton                    // boton del medio
    
ret x23

