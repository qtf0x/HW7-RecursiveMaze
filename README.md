### CSCI 341 - Computer Organization (Spring 2022)
# Recursive Maze

1) Include YOUR NAME and the names of all people who helped/collaborated as per the syllabus and CS@Mines collaboration policy. [This is an individual assignment]

    Vincent Marias

<br>

2) Pseudocode (in C/Java/Python/etc) for your implementation [yes it should also be recursive].

    ```c
    void addValueToStack(int numElements, int value) {
        *(STACK + numElements) = value;
    }

    void printStack(int numElements) {
        for (int i = 0; i < numElements; ++i) {
            printf("%d ", *(STACK + i));
        }
        printf("\n");
    }

    void printPaths(int* grid, int xMax, int yMax, int curX, int curY,
                    int stackLen) {
        // base case 1
        if (xMax <= 0 || yMax <= 0) { return; }

        // include current cell in route
        addValueToStack(stackLen, *(grid + (curX + curY * xMax)));
        stackLen++;

        // base case 2 (if the last cell is reached)
        if (curX == xMax - 1 && curY == yMax - 1) {
            printStack(stackLen);
            return;
        }

        // move down
        if (curY +1 < yMax) {
            printPaths(grid, xMax, yMax, curX, curY + 1, stackLen);
        }

        // move right
        if (curX + 1 < xMax) {
            printPaths(grid, xMax, yMax, curX + 1, curY, stackLen);
        }

        // move diagonally
        if (curX + 1 < xMax && curY + 1 < yMax) {
            printPaths(grid, xMax, yMax, curX + 1, curY + 1, stackLen);
        }
    }
    ```

<br>

3) Describe the challenges you encountered and how you surmounted them.

- The only real challege I encountered was clearing the stack. I think that's the problem, anyway; it's still doesn't work. The C code works fine, and I've double, triple, and quadruple-checked that the RISC-V instructions do exactly the same thing. But the stack still grows incorrectly when I run the RISC-V. You'll see what I mean when you run it.

- Of course, the other big challenge was my own time-management skills, as this is now being turned in a week late. Sorry.

<br>

4) What did you like about the assignment?

- I liked getting to use a recursive searching algorithm at such a low level. Surprisingly, I understand recursion better now because of this class than I ever have.

<br>

5) How long did you spend working on this assignment?

    ~4 hours

<br>

6) A description of any features you added for extra credit (if any)

    N/A
