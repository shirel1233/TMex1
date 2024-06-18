#include "NumClass.h"

// Helper function for power calculation
int power(int x, int y) {
    if (y == 0) return 1;
    return x * power(x, y - 1);
}

// Helper function to count the number of digits
int numDigits(int num) {
    if (num == 0) return 0;
    return 1 + numDigits(num / 10);
}

// Recursive helper for isArmstrong
int isArmstrongHelper(int num, int n) {
    if (num == 0) return 0;
    return power(num % 10, n) + isArmstrongHelper(num / 10, n);
}

int isArmstrong(int num) {
    int n = numDigits(num);
    return isArmstrongHelper(num, n) == num;
}

// Recursive helper for isPalindrome
int isPalindromeHelper(int num, int *dupNum) {
    if (num == 0) return 1;
    if (isPalindromeHelper(num / 10, dupNum) && (num % 10 == *dupNum % 10)) {
        *dupNum /= 10;
        return 1;
    }
    return 0;
}

int isPalindrome(int num) {
    int dupNum = num;
    return isPalindromeHelper(num, &dupNum);
}
