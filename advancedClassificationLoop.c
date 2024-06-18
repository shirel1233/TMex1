#include "NumClass.h"


int my_pow(int base, int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++) {
        result *= base;
    }
    return result;
}

int isArmstrong(int num) {
    int sum = 0, temp = num, digits = 0;
    while (temp != 0) {
        temp /= 10;
        digits++;
    }
    temp = num;
    while (temp != 0) {
        int digit = temp % 10;
        sum += my_pow(digit, digits);
        temp /= 10;
    }
    return (sum == num);
}

int isPalindrome(int num) {
    int reversed = 0, temp = num;
    while (temp != 0) {
        reversed = reversed * 10 + (temp % 10);
        temp /= 10;
    }
    return reversed == num;
}
