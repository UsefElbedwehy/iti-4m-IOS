#include <iostream>

using namespace std;

class Complex{
private: // for validation and data hidding
    int real;
    int img;
    static int counter;
public:
    Complex():real(0),img(0){
        counter++;
        cout << "Default Constructor" << endl;
    }
    Complex(int c1,int c2):real(c1),img(c2){
        cout << "Double Parameterized Constructor" << endl;
    }
    void realSetter(int r){
        real = r;
    }
    void imgSetter(int i){
        img = i;
    }
    int realGetter(void){
        return real;
    }
    int imgGetter(void){
        return img;
    }
    void setComplex(int real, int img){
        this->real = real;
        this->img  = img;
    }
    void display(){
        cout << "Complex: ";
        if((real == 0)&&(img == 0)){
            cout << "No data" << endl;
        }else if((real == 0)&&(img > 0)){
            if((img != 1)){
                cout << img << "i" << endl;
            }else{
                cout << "i" << endl;
            }
        }else if((real == 0)&&(img < 0)){
            if((img != -1) ){
                cout << img << "i" << endl;
            }else{
                cout << "-i" << endl;
            }
        }else if((real != 0)){
            if((img == 1)){
                cout << real << "+" << "i" << endl;
            }else if((img == -1)){
                cout << real << "-" << "i" << endl;
            }else if((img > 0)){
                cout << real << "+"<< img <<"i" << endl;
            }else{
                cout << real << "-"<< img <<"i" << endl;
            }
        }
    }
    /*
    void addComplex(Complex c1){
        Complex t1;
        t1.real = this->real + c1.real;
        t1.img  = this->img + c1.img;
        return t1;
    }
    */
    static Complex addComplex(Complex c1,Complex c2){
        Complex t1;
        t1.real = c2.real + c1.real;
        t1.img  = c2.img  + c1.img;
        return t1;
    }
    void subtract(Complex c1,Complex c2){
    real = c1.real - c2.real;
    img = c1.img - c2.img;
    }
    Complex operator+(Complex c){
        Complex c1;
        c1.real = this->real + c.real;
        c1.img  = this->img  + c.img;
        return c1;
    }
    Complex operator-(Complex c){
        Complex c1;
        c1.real = this->real - c.real;
        c1.img  = this->img  - c.img;
        return c1;
    }
    Complex operator++(){
        this->real++;
        this->img++;
        return *this;
    }
    Complex operator++(int inc){
        Complex ctemp;
        ctemp.real = this->real++;
        ctemp.img  = this->img++;
        return ctemp;
    }

    ~Complex(){
    cout << "Destructor"<<endl;
    }
};

Complex operator+(int addedArg, Complex c){
    Complex ct;
    ct.setComplex((addedArg+c.realGetter()) , c.imgGetter());
    return ct;
}
Complex operator-(int addedArg, Complex c){
    Complex ct;
    ct.setComplex((addedArg-c.realGetter()) , c.imgGetter());
    return ct;
}



int Complex::counter=0;
#include "Complex.h"
int main()
{
    Complex c1(56,22);
    Complex c2(4,20);
    Complex c3(0,0);


    return 0;
}
