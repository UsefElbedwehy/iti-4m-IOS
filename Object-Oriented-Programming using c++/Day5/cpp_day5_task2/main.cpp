#include <iostream>

using namespace std;
class Base{
private:
    int x;
    int y;

protected:
    int z;

public:
    Base(){
        cout << "Base Constructor"  << endl;
    }
    void sayHello(){
        cout << "Base says hello!" << endl;
    }
    ~Base(){
        cout << "Base Destructor"  << endl;
    }
};

class ChildOne : public Base{
private:
    int m;
    int n;

protected:
    int v;

public:
    ChildOne(){
        cout << "ChildOne Constructor"  << endl;
    }
    void sayHello(){
        cout << "ChildOne says hello!" << endl;
    }
    ~ChildOne(){
        cout << "ChildOne Destructor"  << endl;
    }
};

class ChildTwo : public ChildOne{
private:
    int a;
    int b;

protected:
    int c;

public:
    ChildTwo(){
        cout << "ChildTwo Constructor"  << endl;
    }
    void sayHello(){
        cout << "ChildTwo says hello!" << endl;
    }
    ~ChildTwo(){
        cout << "ChildTwo Destructor"  << endl;
    }
};



int main()
{
    Base * basePtr1 = new Base;
    basePtr1->sayHello();
    basePtr1->Base::sayHello();
    //basePtr1->ChildOne::sayHello();       // Not-valid   // base ----> base scope only
    //-------------------------------------------------------------------------------------------------------
    cout << "================================================================" << endl;
    Base * basePtr2 = new ChildOne;
    basePtr2->sayHello();
    basePtr2->Base::sayHello();
    //basePtr2->ChildOne::sayHello();
    //-------------------------------------------------------------------------------------------------------
    cout << "================================================================" << endl;

    ChildOne * basePtr3 = new ChildOne;
    basePtr3->sayHello();
    basePtr3->Base::sayHello();
    basePtr3->ChildOne::sayHello();
    //-------------------------------------------------------------------------------------------------------
    cout << "================================================================" << endl;


    delete basePtr1;
    delete basePtr2;
    delete basePtr3;

//    ChildOne * basePtr4 = new Base; // Not-valid
//    basePtr4->sayHello();
//    basePtr4->Base::sayHello();
//    basePtr4->ChildOne::sayHello();


    return 0;
}
