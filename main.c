#include <stdio.h>
#include "NumClass.h"

int main() {
    int num1, num2;
    printf("Enter two positive integers: ");
    scanf("%d %d", &num1, &num2);
    
    printf("Prime numbers: ");
    for (int i = num1; i <= num2; i++) {
        if (isPrime(i)) printf("%d ", i);
    }
    printf("\n");

    printf("Armstrong numbers: ");
    for (int i = num1; i <= num2; i++) {
        if (isArmstrong(i)) printf("%d ", i);
    }
    printf("\n");

    printf("Strong numbers: ");
    for (int i = num1; i <= num2; i++) {
        if (isStrong(i)) printf("%d ", i);
    }
    printf("\n");

    printf("Palindromes: ");
    for (int i = num1; i <= num2; i++) {
        if (isPalindrome(i)) printf("%d ", i);
    }
    printf("\n");

    return 0;
}
