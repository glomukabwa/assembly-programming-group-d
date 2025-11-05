long factorial(long n) {
    if (n <= 1) {
        return 1;             // base case first
    }
    // Recurse only if n > 1
    long temp = n;
    long result = factorial(n - 1);
    return temp * result;
}
