#include <iostream>

using namespace std;

class Complex{
private:
    int real;
    int img;

public:
    Complex(int c1,int c2):real(c1),img(c2){}
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
    void display2(){
     if((real == 0) && (img == 0)){
        cout << "zeroes --- zero real & zero img :(" << endl;
        //cout << "0 + 0i" << endl;
     }else{
        cout << "Complex = " ;
        if(real != 0){
            cout << real << "";
        }
        if(img != 0){
            if(real != 0){
                if(img > 0){
                if(img != 1){
                cout << "+" << img << "i" ;
                }else{
                cout << "+" << "i" ;
                }
            }else{
                if(img != -1){
                cout << "-" << img*(-1) << "i" ;
                }else{
                cout << "-" << "i" ;
                }
            }
            }else{ // for +,- if real is equal to zero
            if(img > 0){
                if(img != 1){
                cout << img << "i" ;
                }else{
                cout << "i" ;
                }
            }else{
                if(img != -1){
                cout << "-" << img*(-1) << "i" ;
                }else{
                cout << "-" << "i" ;
                }
            }
            }
        }
     }

    }
    /*
    void display(){
       if((img != 0) && (real != 0 ))
       {
            if(img > 0){
                if(img == 1){
                        cout << "complex = " << real << " + " << "i" << endl;
                }else{
                    cout << "complex = " << real << " + " << img << "i" << endl;
                }
            }else {
            if(img == 1){
                        cout << "complex = " << real << " - " << "i" << endl;
                }else{
                    cout << "complex = " << real << " - " << img*(-1) << "i" << endl;
                }
            }
       }else if((real == 0)&&(img != 0)){
            if(img > 0){
                if(img == 1){
                    cout << "complex = " << "i" << endl;
                }else{
                cout << "complex = " << img << "i" << endl;
                }
            }else{
                  if(img == -1){
                      cout << "complex = -" << "i" << endl;
                  }else{
                    cout << "complex = -" << img*(-1) << "i" << endl;
                  }
            }
       }else if((img == 0)&&(real != 0)){
       if(real > 0){
                cout << "complex = " << real << endl;
            }else{
                    cout << "complex = -" << real*(-1) << endl;
            }
       }else{
            cout << "Zero real & zero imaginary  :(" << endl;
            cout << "complex equal nothing...    :(" << endl;
       }

    }*/
    void add(Complex * c1,Complex * c2){
    real = c1->real + c2->real;
    img = c1->img + c2->img;
    }
    void subtract(Complex * c1,Complex * c2){
    real = c1->real - c2->real;
    img = c1->img - c2->img;
    }

};


int main()
{
    Complex c1(1,22);
    Complex c2(1,1);
    Complex c3(0,0);

    c3.subtract(&c1,&c2);
    c3.display2();
    return 0;
}
