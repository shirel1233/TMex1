#include "NumClass.h"
#include "NumClass.h"
#include <math.h>

int isPrime(int num) {
    if (num <= 1) return 0;
    if (num <= 3) return 1;
    if (num % 2 == 0 || num % 3 == 0) return 0;
    for (int i = 5; i * i <= num; i += 6) {
        if (num % i == 0 || num % (i + 2) == 0) return 0;
    }
    return 1;
}


int factorial(int n) {
    if (n == 0 || n == 1) return 1;
    int fact = 1;
    for (int i = 2; i <= n; i++) {
        fact *= i;
    }
    return fact;
}

int isStrong(int num) {
    int sum = 0, temp = num, remainder;
    while (temp > 0) {
        remainder = temp % 10;
        sum += factorial(remainder);
        temp /= 10;
    }
    return sum == num;
}

