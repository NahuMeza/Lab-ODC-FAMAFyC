    .equ GPIO_BASE,    0x3f200000
    .equ GPIO_GPFSEL0, 0x00
    .equ GPIO_GPLEV0,  0x34
    .equ PRESS_W, 0b10
    .equ PRESS_A, 0b100 
    .equ PRESS_S, 0b1000
    .equ PRESS_D, 0b10000
    .equ PRESS_SPACE, 0b100000

    .globl gpio

gpio:
                                    // Variables en la sección .bss para almacenar el estado anterior y el contador
.section .bss
    .align 3
previous_state:
    .word 0                         // Variable para almacenar el estado anterior

.section .text
                                    // Setear GPIO0-9 como entrada (000)
    ldr x9, =GPIO_BASE
    str wzr, [x9, GPIO_GPFSEL0]     // Configurar GPIO0-9 como entradas

                                    // Inicializar previous_state a 0
    ldr x18, =previous_state
    mov w0, 0
    str w0, [x18]                   // Almacenar 0 en previous_state

    mov x15, 0                      // Inicializar el contador x15 a 0

read_loop:   
                                    // Lee el estado de los GPIO 0 - 31
    ldr w16, [x9, GPIO_GPLEV0]

                                    // Leer el estado anterior
    ldr w11, [x18]                  // Cargar el estado anterior desde previous_state

                                    // Comparar el estado actual con el estado anterior para el GPIO4 (D)
    eor w13, w16, w11               // XOR para encontrar cambios
    and w13, w13, PRESS_D           // Máscara para el bit de GPIO4 (D)

    cbz w13, read_loop              // Si no hay cambio en el bit 4, continuar el bucle

                                    // Si hay un cambio en el bit 4, verificar si está presionado
    and w14, w16, PRESS_D           // Máscara para el bit 4 actual (D)
    cbz w14, update_state           // Si el bit 4 es 0, no está presionado (liberado)

                                    // Aquí se llama a la función cuando GPIO4 (D) está presionado
    cbz x15, first_case             // Verifica si es el primer caso
    cmp x15, 1                      // Si no es el primer caso, compara con 1
    beq second_case                 // Si es igual a 1, va al segundo caso
    cmp x15, 2                      // Compara con 2
    beq third_case                  // Si es igual a 2, va al tercer caso

    b read_loop                     // Si no coincide con ningún caso, vuelve a leer

first_case:
    bl Encender                     // Llama a la función Encender
    add x15, x15, 1                 // Incrementa el contador
    b update_state                  // Actualiza el estado y vuelve al bucle

second_case:
    bl paisaje                      // Llama a la función paisaje
    add x15, x15, 1                 // Incrementa el contador
    b update_state                  // Actualiza el estado y vuelve al bucle

third_case:
    bl black_screen                 // Llama a la función black_screen
    mov x15, 0                      // Reinicia el contador a 0
    b update_state                      // Actualiza el estado y vuelve al bucle

update_state:
                                    // Actualizar el estado anterior
    str w16, [x18]                  // Almacenar el estado actual en previous_state

    b read_loop                     // Volver a leer el estado
  
inf_loop:
    //---------------------------------------------------------------
    // Infinite Loop
    b inf_loop

