



    in01:         .asciz "%d"
    in02:         .asciz " %c"
    outputNumber: .asciz "%d\n"
    o01:          .asciz "*****Input ID*****\n"
    o02:          .asciz "** Please Enter Member 1 ID:**\n"
    o03:          .asciz "** Please Enter Member 2 ID:**\n"
    o04:          .asciz "** Please Enter Member 3 ID:**\n"
    o05:          .asciz "** Please Enter Command **\n"
    o06:          .asciz "*****Print Team Member ID and ID Summation*****\n"
    o07:          .asciz "ID Summation = "
    .data
    @IDa:  .word 10
    @ID02: .word 10
    @ID03: .word 10
    @IDsum: .word 10
    command:      .word 10
    p:            .word 112


.text
    .global id
    @.global IDa
    @.global ID02
    @.global ID03
    .global o07
    @.global IDsum
    .global .L2



id:
    stmfd sp!, {r0-r12,lr}
    ldr r0, =o01
    bl printf

    ldr r0, =o02
    subs r1, pc, lr
    bl printf

    @ scanf a
    ldr r0, =in01
    ldr r1, =IDa

    bl scanf

    ldr r0, =o03
    bl printf

    @ scanf b
    ldr r0, =in01
    ldr r1, =ID02
    bl __isoc99_scanf

    ldr r0, =o04
    bl printf

    @ scanf c
    ldr r0, =in01

    ldr r1, =ID03
    bl __isoc99_scanf

    bl at

    ldr r0, =o06
    bl printf

    @ printf a
    ldr r0, =outputNumber @ %d position
    ldr r3, =IDa @ a
    ldr r1, [r3, #0]
    bl printf

    @ printf b
    ldr r0, =outputNumber @ %d position
    ldr r3, =ID02 @ a
    ldr r1, [r3, #0]
    bl printf

    @ printf c
    ldr r0, =outputNumber @ %d position
    ldr r3, =ID03 @ a
    ldr r1, [r3, #0]
    bl printf

    ldr r0, =o07
    bl printf

    @ add
    ldr r5, =IDa
    ldr r1, [r5,#0]
    ldr r5, =ID02
    ldr r2, [r5,#0]
    ldr r5, =ID03
    ldr r3, [r5,#0]

    add r3,r3,r2
    add r3,r3,r1
    ldr r4, =IDsum
    str r3, [r4,#0]

    @print summ
    sub r3,r1,r2, lsl #3
    ldr r0, =outputNumber @ %d position
    ldr r3, =IDsum @sum
    ldr r1, [r3, #0]
    bl printf

    ldr r0, =name05
    bl printf
    ldr r0, =changeLine
    bl printf
    ldr r0, =changeLine
    bl printf

    ldmfd sp!, {r0-r12,lr}

    mov pc,lr

at:
    mov r9, lr
aaaa:
    @print
    ldr r0, =o05
    bl printf
    @scanf command
    ldr r0,=in02
    ldr r1, =command
    bl scanf
    @compare
    ldr r4, =command
    ldrb r6, [r4,#0]
    ldr r5, =p
    ldrb r5, [r5,#0]
    cmp r6,r5
    bne aaaa
    mov lr, r9
    mov pc, lr
