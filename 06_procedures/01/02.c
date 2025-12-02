#include<stdio.h>

extern int factorial(int n);

void main(){
    int n =  5;
    int res = factorial(n);
    printf("Result : %d \n", res);
}