#ifndef COMPLEX_H
#define COMPLEX_H

/*
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
        this->real += real;
        this->img  += img;
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
    *//*
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
    ~Complex(){
    cout << "Destructor"<<endl;
    }
};

int Complex::counter=0;*/

#endif // COMPLEX_H
