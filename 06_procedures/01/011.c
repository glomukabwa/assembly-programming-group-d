long factorial(long n) {
    if (n <= 1) {
        return 1;             // base case
    } else {
        long temp = n;        // store n
        long result = factorial(n - 1);  // recursive call
        return temp * result; // multiply n * factorial(n - 1)
    }
}
