#include <iostream>

using namespace std;
extern "C" int CalcSum_(int a, int b, int c);
extern "C" int IntegerMulDiv_(int a, int b, int* prod, int* quo, int* rem);

void integerMulDiv() {
    int a = 21, b = 9;
    int prod = 0, quo = 0, rem = 0;
    int rc;
    rc = IntegerMulDiv_(a , b , &prod , &quo , &rem);
    printf(" Input1 - a : %4d  b : %4d\n" , a , b);
    printf(" Output1 - rc : %4d prod : %4d\n", rc, prod);
    printf(" quo : %4d rem : %4d\n", quo, rem);
}

void calcSum() {
    int a = 17, b = 11, c = 14;
    int sum = CalcSum_(a, b, c);
    printf(" a : %d\n", a);
    printf(" b : %d\n", b);
    printf(" c : %d\n", c);
    printf(" sum : %d\n", sum);
}

int main(int argc, const char* argv[]) {
    integerMulDiv();
    return EXIT_SUCCESS;
}