/*
    RecursiveMaze.c



    @author: Vincent Marias
*/

#include <stdio.h>

void printPaths(int* arrAddr, int xMax, int yMax, int curX, int curY,
                int stackLen) {
    
}

int main() {
    char arrayNumberPrompt[] = "Enter a number to add to the array: ";
    char xPrompt[] = "X size: ";
    char yPrompt[] = "Y size: ";
    
    int arrAddr[sizeof(int) * 200];
    int nextInput = 0;
    int endIndex = 0;
    int xMax = 0;
    int yMax = 0;

    printf("%s", arrayNumberPrompt);
    scanf("%d", &nextInput);
    while (nextInput != 0) {
        *(arrAddr + endIndex) = nextInput;

        printf("%s", arrayNumberPrompt);
        scanf("%d", &nextInput);

        endIndex++;
    }

    printf("%s", xPrompt);
    scanf("%d", &xMax);
    printf("%s", yPrompt);
    scanf("%d", &yMax);

    printPaths(arrAddr, xMax, yMax, 0, 0, 0);

    return 0;
}
