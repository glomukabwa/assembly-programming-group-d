//This code is used by Task 4.asm
#include <stdio.h>

extern int factorial(int n); // Assembly function declaration

int main() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);
    printf("Factorial of %d = %d\n", num, factorial(num));
    return 0;
}
