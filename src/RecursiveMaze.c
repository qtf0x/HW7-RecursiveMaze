/*
    RecursiveMaze.c

    Recursive implementation for depth first search algorithm.

    @author: Vincent Marias
*/

#include <stdio.h>

int STACK[sizeof(int) * 200];

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
    if (xMax <= 0 || yMax <= 0)
        return;

    // include current cell in route
    addValueToStack(stackLen, *(grid + (curX + (curY * xMax))));
    stackLen++;

    // base case 2 (if the last cell is reached)
    if (curX == xMax - 1 && curY == yMax - 1) {
        printStack(stackLen);
        return;
    }

    // move down
    if (curY + 1 < yMax)
        printPaths(grid, xMax, yMax, curX, curY + 1, stackLen);

    // move right
    if (curX + 1 < xMax)
        printPaths(grid, xMax, yMax, curX + 1, curY, stackLen);

    // move diagonally
    if (curX + 1 < xMax && curY + 1 < yMax)
        printPaths(grid, xMax, yMax, curX + 1, curY + 1, stackLen);
}

int main() {
    char arrayNumberPrompt[] = "Enter a number to add to the array: ";
    char xPrompt[] = "X size: ";
    char yPrompt[] = "Y size: ";

    int grid[sizeof(int) * 200];
    int nextInput = 0;
    int endIndex = 0;
    int xMax = 0;
    int yMax = 0;

    printf("%s", arrayNumberPrompt);
    scanf("%d", &nextInput);
    while (nextInput != 0) {
        *(grid + endIndex) = nextInput;

        printf("%s", arrayNumberPrompt);
        scanf("%d", &nextInput);

        endIndex++;
    }

    printf("%s", xPrompt);
    scanf("%d", &xMax);
    printf("%s", yPrompt);
    scanf("%d", &yMax);

    printPaths(grid, xMax, yMax, 0, 0, 0);

    return 0;
}
