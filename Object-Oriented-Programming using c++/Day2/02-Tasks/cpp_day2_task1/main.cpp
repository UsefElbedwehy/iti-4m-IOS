#include <iostream>

using namespace std;

class Complex{
private:
    int real;
    int img;

public:
    Complex():real(0),img(0){
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
            }else{
                cout << real << "+"<< "i" << endl;
            }
        }
    }
    void add(Complex c1,Complex c2){
    real = c1.real + c2.real;
    img = c1.img + c2.img;
    }
    void subtract(Complex c1,Complex c2){
    real = c1.real - c2.real;
    img = c1.img - c2.img;
    }
    ~Complex(){
    cout << "Destructor"<<endl;
    }
};


int main()
{
    Complex c1(5,22);
    Complex c2(4,23);
    Complex c3(0,0);

    c3.subtract(c1,c2);
    c3.display();
    return 0;
}
