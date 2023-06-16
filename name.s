
.data
    name06: .asciz "Function"
    name01: .asciz "*****Print Name*****\n"
    name00: .asciz "Team 06\n"
    @name02: .asciz "Derek\n"
    @name03: .asciz "Drushani\n"
    @name04: .asciz "Brian\n"
    name05: .asciz "*****End Print*****\n"
    changeLine: .asciz "\n"
.text
    .global name
    .global name00
    @.global name02
    @.global name03
    @.global name04
    .global name05
    .global changeLine
name:
    stmfd sp!, {r0-r12,lr}
    ldr r0, =name01
    bl printf
    ldr r0, =name00
    bl printf
    ldr r0, =name02
    bl printf
    ldr r0, =name03
    bl printf
    ldr r0, =name04
    bl printf
    ldr r0, =name05
    bl printf
    ldmfd sp!, {r0-r12,lr}
    mov pc,lr
