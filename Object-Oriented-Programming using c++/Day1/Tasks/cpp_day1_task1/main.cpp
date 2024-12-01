#include <iostream>

using namespace std;

class SwapNum{
private:
    int x=10;
    int y=77;

public:
    void swapByVal(){
        int temp=0;
        cout << "Swap By value" << endl;
        cout << "Before swap: a = "<< x << " b = " << y << endl;
        temp = x ;
        x = y;
        y = temp;
        cout << "After swap: a = "<< x << " b = " << y << endl;
    }
    void swapByAdd(int *a, int *b){
        int temp=0;
        cout << "Swap By address" << endl;
        cout << "Before swap: a = " << *a << " b = " << *b << endl;
        temp = *a ;
        *a = *b;
        *b = temp;
        cout << "After swap: a = "<< *a << " b = " << *b << endl;
    }
    void swapByRef(int &a, int &b){
        int temp=0;
        cout << "Swap By reference" << endl;
        cout << "Before swap: a = "<< a << " b = " << b << endl;
        temp = a ;
        a = b;
        b = temp;
        cout << "After swap: a = "<< a << " b = " << b << endl;
    }

};


int main()
{
    int f=33;
    int s=22;
    SwapNum sn;
    sn.swapByVal();
    sn.swapByAdd(&f,&s);
    sn.swapByRef(f,s);
    return 0;
}
