#include "NumClass.h"
#include <math.h>

int isArmstrong(int num) {
    int sum = 0, temp = num, remainder, n = 0;
    while (temp != 0) {
        temp /= 10;
        ++n;
    }
    temp = num;
    while (temp != 0) {
        remainder = temp % 10;
        sum += pow(remainder, n);
        temp /= 10;
    }
    return sum == num;
}

int isPalindrome(int num) {
    int reversed = 0, temp = num;
    while (temp != 0) {
        reversed = reversed * 10 + (temp % 10);
        temp /= 10;
    }
    return reversed == num;
}
