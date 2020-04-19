section .data

integerRead db "%d", 0
integerWrite db "Output: %d", 10, 0
realRead db "%lf", 0
realWrite db "Output: %lf", 10, 0
integerarrayWrite db "%d ", 0
realarrayWrite db "%d ", 0
beginArrPrint db "Output: ", 0
endArrPrint db 10, 0
intMessage db "Enter an integer", 10, 0
realMessage db "Enter an real:", 10, 0
boolMessage db "Enter a boolean (1 or 0 only):", 10, 0
intArrMessage db "Enter integer array for range %d to %d:", 10, 0
realArrMessage db "Enter real array for range %d to %d:", 10, 0
boolArrMessage db "Enter boolean array for range %d to %d (1 or 0 only):", 10, 0
trueMessage db "True", 10, 0
falseMessage db "False", 10,  0
runTimeError db "Run-time error: Bound values error", 10, 0


section .text
extern printf
extern scanf
global main

_error: 
	MOV RDI, runTimeError
	MOV AL, 0
	CALL printf
	MOV RAX, 60
	MOV RDI, 0
	SYSCALL


main: 
	PUSH RBP
	MOV RBP, RSP
	SUB RSP, 96
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label0
	SUB RSP, 8
	MOV R8, 1
label0: 
	LEA RDI, [intMessage]
	MOV AL, 0
	CALL printf
	LEA RDI, [integerRead]
	LEA RSI, [RBP - 16 - 56]
	MOV AL, 0
	CALL scanf
	CMP R8D, 1
	JNE label1
	ADD RSP, 8
label1: 
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label2
	SUB RSP, 8
	MOV R8, 1
label2: 
	LEA RDI, [intMessage]
	MOV AL, 0
	CALL printf
	LEA RDI, [integerRead]
	LEA RSI, [RBP - 16 - 64]
	MOV AL, 0
	CALL scanf
	CMP R8D, 1
	JNE label3
	ADD RSP, 8
label3: 
	MOV R13, 0
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label4
	MOV R13, 1
label4: 
	MOV [RBP - 16 - 72], RSP
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8, R9
	JG _error
	PUSH R8
	PUSH R9
	MOV RSI, R8
	MOV RDX, R9
	LEA RDI, [intArrMessage]
	MOV AL, 0
	CALL printf
	POP R9
	POP R8
	MOV R10, 0
label6: 
	CMP R8D, R9D
	JG label7
	MOV RSI, RSP
	PUSH R8
	PUSH R9
	PUSH R10
	CMP R13, 1
	JE label8
	PUSH R11
label8: 
	LEA RDI, [integerRead]
	MOV AL, 0
	CALL scanf
	CMP R13, 1
	JE label9
	POP R11
label9: 
	XOR R13, 1
	POP R10
	POP R9
	POP R8
	SUB RSP, 8
	INC R8D
	INC R10D
	JMP label6
label7: 
	CMP R13, 1
	JE label5
	POP R11
label5: 
	POP R10
	POP R9
	POP R8
	MOV R13, 0
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label10
	MOV R13, 1
label10: 
	MOV [RBP - 16 - 80], RSP
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8, R9
	JG _error
	PUSH R8
	PUSH R9
	MOV RSI, R8
	MOV RDX, R9
	LEA RDI, [intArrMessage]
	MOV AL, 0
	CALL printf
	POP R9
	POP R8
	MOV R10, 0
label12: 
	CMP R8D, R9D
	JG label13
	MOV RSI, RSP
	PUSH R8
	PUSH R9
	PUSH R10
	CMP R13, 1
	JE label14
	PUSH R11
label14: 
	LEA RDI, [integerRead]
	MOV AL, 0
	CALL scanf
	CMP R13, 1
	JE label15
	POP R11
label15: 
	XOR R13, 1
	POP R10
	POP R9
	POP R8
	SUB RSP, 8
	INC R8D
	INC R10D
	JMP label12
label13: 
	CMP R13, 1
	JE label11
	POP R11
label11: 
	POP R10
	POP R9
	POP R8
	SUB RSP, 8
	MOV QWORD [RBP - 16 - 96], 7
	MOV RAX, QWORD [RBP - 16 - 96]
	MOV QWORD [RBP - 16 - 16], RAX
	MOV R15, 1
label16: 
	MOV QWORD [RBP - 16 - 24], R15
	CMP R15, 3
	JG label17
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label18
	SUB RSP, 8
	MOV R8, 1
label18: 
	LEA RDI, [intMessage]
	MOV AL, 0
	CALL printf
	LEA RDI, [integerRead]
	LEA RSI, [RBP - 16 - 0]
	MOV AL, 0
	CALL scanf
	CMP R8D, 1
	JNE label19
	ADD RSP, 8
label19: 
	MOV RAX, RSP
	MOV RDX, 0
	MOV R9, 16
	IDIV R9
	CMP RDX, 0
	JE label20
	SUB RSP, 8
	MOV R8, 1
label20: 
	LEA RDI, [intMessage]
	MOV AL, 0
	CALL printf
	LEA RDI, [integerRead]
	LEA RSI, [RBP - 16 - 8]
	MOV AL, 0
	CALL scanf
	CMP R8D, 1
	JNE label21
	ADD RSP, 8
label21: 
	SUB RSP, 8
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	MOV R10, QWORD [RBP - 16 - 0]
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R11, R10D
	SUB R11, R8
	MOV RAX, R11
	NEG RAX
	MOV R12, QWORD [RBP - 16 - 72]
	MOV R11, QWORD [R12 + RAX]
	MOV R10, QWORD [RBP - 16 - 8]
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R12, R10D
	SUB R12, R8
	MOV RAX, R12
	NEG RAX
	MOV R13, QWORD [RBP - 16 - 80]
	MOV R12, QWORD [R13 + RAX]
	MOV  RAX, R11
	ADD  RAX, R12
	MOV  QWORD [RBP - 16 - 104], RAX
	MOV RAX, QWORD [RBP - 16 - 104]
	MOV QWORD [RBP - 16 - 32], RAX
	SUB RSP, 8
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	MOV R10, QWORD [RBP - 16 - 16]
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R11, R10D
	SUB R11, R8
	MOV RAX, R11
	NEG RAX
	MOV R12, QWORD [RBP - 16 - 72]
	MOV R11, QWORD [R12 + RAX]
	MOV R10, QWORD [RBP - 16 - 8]
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R12, R10D
	SUB R12, R8
	MOV RAX, R12
	NEG RAX
	MOV R13, QWORD [RBP - 16 - 80]
	MOV R12, QWORD [R13 + RAX]
	MOV  RAX, R11
	ADD  RAX, R12
	MOV  QWORD [RBP - 16 - 112], RAX
	MOV RAX, QWORD [RBP - 16 - 112]
	MOV QWORD [RBP - 16 - 40], RAX
	SUB RSP, 8
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	MOV R10, QWORD [RBP - 16 - 0]
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R11, R10D
	SUB R11, R8
	MOV RAX, R11
	NEG RAX
	MOV R12, QWORD [RBP - 16 - 72]
	MOV R11, QWORD [R12 + RAX]
	MOV R10, QWORD [RBP - 16 - 16]
	MOV R8, QWORD [RBP - 16 - 56]
	MOV R9, QWORD [RBP - 16 - 64]
	CMP R8D, R9D
	JG _error
	CMP R8D, R10D
	JG _error
	CMP R9D, R10D
	JL _error
	MOVSX R12, R10D
	SUB R12, R8
	MOV RAX, R12
	NEG RAX
	MOV R13, QWORD [RBP - 16 - 80]
	MOV R12, QWORD [R13 + RAX]
	MOV  RAX, R11
	ADD  RAX, R12
	MOV  QWORD [RBP - 16 - 120], RAX
	MOV RAX, QWORD [RBP - 16 - 120]
	MOV QWORD [RBP - 16 - 48], RAX
	MOV RSI, QWORD [RBP - 16 - 32]
	LEA RDI, [integerWrite]
	MOV AL, 0
	CALL printf
	MOV RSI, QWORD [RBP - 16 - 40]
	LEA RDI, [integerWrite]
	MOV AL, 0
	CALL printf
	MOV RSI, QWORD [RBP - 16 - 48]
	LEA RDI, [integerWrite]
	MOV AL, 0
	CALL printf
	INC R15
	JMP label16
label17: 
	MOV RSP, RBP
	POP RBP
	RET
