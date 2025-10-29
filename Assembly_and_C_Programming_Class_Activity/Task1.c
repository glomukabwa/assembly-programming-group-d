// Write a C program to calculate and display the factorial of a number entered by the user.
#include <stdio.h>

int main() {
    int n;
    unsigned long long fact = 1; // factorials can be large

    printf("Enter a number: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Factorial of a negative number doesn’t exist.\n");
    } else {
        for (int i = 1; i <= n; ++i) {
            fact *= i;
        }
        printf("Factorial of %d = %llu\n", n, fact);
    }

    return 0;
}
