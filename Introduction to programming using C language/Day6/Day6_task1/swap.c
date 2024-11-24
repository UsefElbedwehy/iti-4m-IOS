void swapByRef(int *a,int* b) {
    int temp=0;
    temp = *a;
    *a =*b;
    *b = temp;
}
void swapByRefEq(int *a,int* b)
{
    *a *= *b;
    *b = *a / *b;
    *a /= *b;

}
