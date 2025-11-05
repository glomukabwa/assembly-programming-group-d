#include <stdio.h>
#include <stdint.h>

extern uint64_t factorial(uint64_t n);

int main(void) {
    uint64_t n = 5;
    uint64_t result = factorial(n);
    printf("Factorial of %lu = %lu\n", n, result);
    return 0;
}
