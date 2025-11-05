#include<stdio.h>

int factorial(int n);

void main(){
    int res = factorial(5);
    printf("Result is : %d \n",res);
}

int factorial(int n){
    if (n == 0){
        return 1;
    }
    return n * factorial(n - 1);    
}

