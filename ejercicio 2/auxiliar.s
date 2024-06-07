.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32
.globl getPixel
// devuelve pixel x1.
// formato: direccion de inicio + 4 * [x+(y * 640)].
// tendria que recibir un (x,y) => (x11, x12).
.globl Rectangulo 
// Hace un rectangulo.
// Recibe el pixel y las coordenadas para la altura y ancho finales.
.globl Boton
// O cuadrado. Recibe un solo parametro de ancho y altura.
.globl circulo_ascendente
// x0:pixel inicial-x1:altura-x2:ancho-x3:cada cuantas filas completadas cambio el ancho-x4:cuanto cambio el ancho-x5:variacion de ancho.
.globl circulo_descendente
// x0:pixel inicial-x1:altura-x2:ancho-x3:cada cuantas filas completadas cambio el ancho-x4:cuanto cambio el ancho.
.global Rcielo
// Rectangulo especifico reiterativo.
.globl Reflejo
// Rectangulo especifico reiterativo.
.globl no_overlaping
// Funcion importante para animationp3.s, evita sobreescribir con agua ciertas figuras.
.globl scounter_end
// Contador reiterativo para las animaciones.
.globl counter2_end
// Contador reiterativo para las animaciones.
.globl water_pararel
// Hace el lado izquierdo y derecho del agua al costado de los bordes de la camara.
.globl fdelay
// Hace posible la animacion con la resta de un numero enorme.


getPixel:
        mov x8 , SCREEN_WIDTH       // temporal x8 = 640
        mul x0, x1, x8              // px = y * 640
        add x0, x0, x2              // px = x + (y * 640)
        lsl x0, x0, 2               // px = 4 * (x + (y * 640))
        add x0, x20, x0             // px = framebuffer + 4 * (x + (y * 640))
        ret                         // vuelvo a la fn que llamo getPixel


Rectangulo: 
    lsl x25,x8,2
    lsl x24,x2,2
    mov x14, x1

loopr1:
    mov x22, x2         			// X Size

loopr0:
    stur w10,[x0]       			// Colorear el pixel N
    add x0,x0,4         			// Siguiente pixel
    sub x22,x22,1       			// Decrementar contador X
    cbnz x22,loopr0     			// Si no terminó la fila, salto
    add x0,x0,x25       			// avanzamos una fila
    sub x0,x0,x24       			// volvemos a la columna inicial
    sub x14,x14,1         			// Decrementar contador Y
    cbnz x14,loopr1      			// Si no es la última fila, salto
    ret


Boton:
	mov x21, x30
	mov x1, x11
	mov x2, x1
	bl Rectangulo
	ret x21


 circulo_ascendente:
 	lsl x25,x8,2					// Ancho real de una fila
 	lsl x24,x2,2					// Ancho elegido
 	mov x19,x3						// Cada cuantos pixeles cambio el ancho
	lsl x13,x4,2					// Cantidad de posiciones de memoria que avanzo-retrocedo
	lsl x12,x5,2					// Variacion en posiciones

 loopc1:
 	mov x22,x2	

 loopc0:
 	stur w10,[x0]  					// Colorear el pixel N
 	add x0,x0,4    					// Siguiente pixel
 	sub x22,x22,1    				// Decrementar contador X
 	cbnz x22,loopc0  				// Si no terminó la fila, salto
 	sub x19,x19,1					// Cuando termina de pintar la linea le resta 1 para saber cuantas filas va subiendo
  	cbnz x19,resta	
  	mov x19,x3						// Si es 0 es porque avando esa cantidad de filas y quiero resetear la cantidad
	
	add x13,x13,x12					// En x13 estaba nuestra variacion y la vamos cambiando en cada ciclo
	add x4,x4,x5				
  	sub x24,x24,x13					// Ahora le decimos que cuando a x0 le vuelva a su ancho original, sea un par de posiciones adelante
  	sub x2,x2,x4					// Actualizamos el ancho de x2
	cmp x2,xzr
	b.le done1

  resta:
 	sub x0,x0,x25   				// subimos una fila
 	sub x0,x0,x24 					// volvemos al ancho
 	sub x1,x1,1    					// Decrementar contador Y
 	cbnz x1,loopc1  				// Si no es la última fila, salto

done1:
    ret


circulo_descendente:
 	lsl x25,x8,2					// Ancho real de una fila
 	lsl x24,x2,2					// Ancho elegido
 	mov x19,x3						// Cada cuantos pixeles cambio el ancho
	lsl x13,x4,2					// Cantidad de posiciones de memoria que avanzo-retrocedo
	lsl x12,x5,2					// Variacion en posiciones

loopc11:
 	mov x22,x2

loopc00:
 	stur w10,[x0]  					// Colorear el pixel N
 	sub x0,x0,4    					// Siguiente pixel
 	sub x22,x22,1    				// Decrementar contador X
 	cbnz x22,loopc00  				// Si no terminó la fila, salto
 	sub x19,x19,1					// Cuando termina de pintar la linea le resta 1 para saber cuantas filas va subiendo
  	cbnz x19,resta2	
  	mov x19,x3						// Si es 0 es porque avando esa cantidad de filas y quiero resetear la cantidad
	
	add x13,x13,x12					// En x13 estaba nuestra variacion y la vamos cambiando en cada ciclo
	add x4,x4,x5			
  	sub x24,x24,x13					// Ahora le decimos que cuando a x0 le vuelva a su ancho original, sea un par de posiciones adelante
  	sub x2,x2,x4					// Actualizamos el ancho de x2
	cmp x2,xzr
	b.le done2

resta2:
 	sub x0,x0,x25   				// Subimos una fila
 	add x0,x0,x24 					// Volvemos al ancho
 	sub x1,x1,1    					// Decrementar contador Y
 	cbnz x1,loopc11  				// Si no es la última fila, salto

done2:
    ret
    

Rcielo:
    mov x21, x30
    mov x2, x6
    bl Rectangulo
    ret x21
    
        
Reflejo:
	mov x21, x30
	mov x1, 5
	bl Rectangulo
	ret x21

	
no_overlaping:
	mov x21, x30
	ldr x10,[sp]
    mov x1, 433        				// Tripode
    mov x2, 242
    bl getPixel
    mov x1, 47
    mov x2, 122
    bl Rectangulo

    ldr w10, [sp, 4]    			// Chorros
    mov x1, 400
    mov x2, 402
    bl getPixel
    mov x1, 100
    mov x2, 45
    bl Rectangulo  

    mov x1, 400
    mov x2, 150
    bl getPixel
    mov x1, 100
    mov x2, 20
    bl Rectangulo

    mov x1, 400
    mov x2, 300
    bl getPixel
    mov x1, 100
    mov x2, 25
    bl Rectangulo

    mov x1, 400
    mov x2, 36
    bl getPixel
    mov x1, 100
    mov x2, 45
    bl Rectangulo
	ret x21


scounter_end:
	sub x18, x18, 1
    add x26, x26, 1
	ret


counter2_end:
	add x18, x18, 1
    add x26, x26, 1
	sub x17, x17, 1
	add x21, x21, 1
	ret

	
water_pararel:
	mov x23, x30
	ldr w10, [sp, 82]          
    mov x1, x17
    mov x2, 0
    bl getPixel
    mov x1, x21
    mov x2, 10
    bl Rectangulo						// Lado izquierdo

    mov x1, x17
    mov x2, 613
    bl getPixel
    mov x1, x21
    mov x2, 27
    bl Rectangulo						// Lado derecho
	ret x23


fdelay:
	mov x23, x30
	movz x16,0xFFF, lsl 00				// Numero enorme
    lsl x16,x16, 13
delayend:
    sub x16,x16,1
    cbnz x16,delayend
	ret x23




