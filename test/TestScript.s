.data
	.align 3
	values:			.space 800	#800 bytes, 200 words
	.align 3
	stack:			.space 800	#800 bytes, 200 words
	arrayNumberPrompt:	.string	"Enter a number to add to the array: "
	xPrompt:		.string "X size: "
	yPrompt:		.string	"Y size: "
	searchPrompt:		.string "What value are you looking for? "
	
.text
	.globl main
	main:
		jal ra, getValues			#Load values in array
		mv s0, a0				#Save num elements
		
		la a0, xPrompt				#String to print
		li a7, 4				#Print string
		ecall
		li a7, 5				#Read int
		ecall
		mv s1, a0				#Save x size
		
		la a0, yPrompt				#String to print
		li a7, 4				#Print string
		ecall
		li a7, 5				#Read int
		ecall
		mv s2, a0				#Save y size
		
		la a2, values				#Set array address
		mv a3, s1				#Set max x size
		mv a4, s2				#Set max y size
		li a5, 0				#Set start x to 0
		li a6, 0				#Set start y to 0
		li a7, 0				#Set cur stack length to 0
		jal ra, printPaths			#Proc call, this is where your code takes over
		
		li a7, 10				#Set syscall to exit program
		ecall					#Exit
	
	#a2: numElements
	.globl printStack
	printStack:
		add t0, zero, zero			#Init loop cntr
		li t1, 200				#Sets max stack size
		la t2, stack
		printNumsLoop:
			slli t3, t0, 2			#Mult index by 4
			add t3, t3, t2			#Add address to index
			
			lw a0, 0(t3)
			li a7, 1
			ecall
			li a0, ' '
			li a7, 11
			ecall
			
			addi t0, t0, 1
			beq t0, t1, printNumsLoopEnd
			bne t0, a2, printNumsLoop
		printNumsLoopEnd:
		li a0, '\n'
		li a7, 11
		ecall
		jalr zero, ra, 0
		
	#a2: numElements
	#a3: value
	.globl addValueToStack
	addValueToStack:
		la t0, stack
		slli a2, a2, 2				#Mult index by 4 (len will be index once added)
		add t0, t0, a2				#Add address to index
		sw a3, 0(t0)				#Store value in address
		jalr zero, ra, 0
	
	#a0: num of elements inputed
	getValues:
		add t0, zero, zero			#Init loop cntr
		li t3, 200				#sets array size
		la t1, values				#Load array address
		getValuesLoop:
			la t4, arrayNumberPrompt
			add a0, zero, t4		#Copies buffer address to a0
 			li a7, 4			#Sets syscall to print null-terminated string
 			ecall
			li a7, 5			#Set syscall argument to 5 (read int from console)
			ecall
			mv t2, a0			#Place syscall rv into the given register
			beqz t2, getValuesLoopEnd	#If input is 0, end
			sw t2, 0(t1)			#Save input
			addi t1, t1, 4			#Increment array address
			addi t0, t0, 1			#Increment loop cntr
			beq t0, t3, getValuesLoopEnd	#If loop cntr=max array size, exit
			j getValuesLoop
		getValuesLoopEnd:
			mv a0, t0			#Set rv
			jalr zero, ra, 0
