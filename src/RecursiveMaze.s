#    RecursiveMaze.s
#
#
#
#    @author Vincent Marias

.data

.text
    # Arguments
    #     a2: address of the grid
    #     a3: xMax
    #     a4: yMax
    #     a5: current x index
    #     a6: current y index
    #     a7: current stack length
    # Return values
    #     None
    .globl printPaths
    printPaths:
        addi sp, sp, -4    # space for 1 word
        sw ra, 4(sp)       # save return address

        # base case 1
        bge zero, a3, printPaths_done    # return if xMax <= 0
        bge zero, a4, printPaths_done    # return if yMax <= 0

        # include current cell in route

        addi a7, a7, 1                   # stackLen++

        # base case 2 (if the last cell is reached)
        addi t0, a3, -1
        bne a5, t0, recurseDown
        addi t0, a4, -1
        bne a6, t0, recurseDown



        # move down
        recurseDown:
        
        
        # move right
        recurseRight:


        # move diagonally
        recurseDiagonally:



        printPaths_done:
            lw ra, 4(sp)        # restore ra
            addi sp, sp, 4      # pop stack frame

            jalr zero, ra, 0    # return to caller
