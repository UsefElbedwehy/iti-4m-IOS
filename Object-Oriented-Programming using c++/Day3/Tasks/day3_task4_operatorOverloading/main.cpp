#include <iostream>

using namespace std;

class Complex{
private: // for validation and data hidding
    double real;
    double img;
    static int counter;
public:
    Complex():real(0),img(0){
        counter++;
        //cout << "Default Constructor" << endl;
    }
    Complex(double c1,double c2):real(c1),img(c2){
        //cout << "Double Parameterized Constructor" << endl;
    }
    void realSetter(double r){
        real = r;
    }
    void imgSetter(double i){
        img = i;
    }
    double realGetter(void){
        return real;
    }
    double imgGetter(void){
        return img;
    }
    void setComplex(double real, double img){
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
                cout << real << img <<"i" << endl;
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
    Complex operator--(){
        this->real--;
        this->img--;
        return *this;
    }
    Complex operator--(int inc){
        Complex ctemp;
        ctemp.real = this->real--;
        ctemp.img  = this->img--;
        return ctemp;
    }
    Complex operator+(double real){
        Complex ct;
        ct.real = this->real + real;
        ct.img  = this->img;
        return ct;
    }
    Complex operator-(double real){
        Complex ct;
        ct.real = this->real- real ;
        ct.img  = this->img;
        return ct;
    }
    // c1.operator==(c2)
    char operator==(Complex cc){
        return ((this->real == cc.real) && (this->img == cc.img));
    }
    // c1.operator+=(c2)
    Complex operator+=(Complex cc){
        this->real += cc.real;
        this->img  += cc.img;
        return *this;
    }
    // c1.operator-=(c2)
    Complex operator-=(Complex cc){
        this->real -= cc.real;
        this->img  -= cc.img;
        return *this;
    }
    operator float(){
        return (float)this->real;
    }

    ~Complex(){
    //cout << "Destructor"<<endl;
    }
};

Complex operator+(double addedArg, Complex c){
    Complex ct;
    ct.setComplex((addedArg+c.realGetter()) , c.imgGetter());
    return ct;
}
Complex operator-(double addedArg, Complex c){
    Complex ct;
    ct.setComplex((addedArg-c.realGetter()) , c.imgGetter());
    return ct;
}
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

int main()
{
    Complex c1(56.0,-22.0);
    Complex c2(4.0,-20.0);
    Complex c3(0,0);


    c3 = c1 + c2;
    c3.display();
    c3 = c1 - c2;
    c3.display();
    c3 = c1 + 5;
    c3.display();
    c3 = c1 - 5;
    c3.display();
    c3 = 5 + c1;
    c3.display();
    c3 = 5.5 - c1;
    c3.display();
    //c1=c2;
    (c1 == c2)? (cout << "c1 and c2 are equal!" << endl):(cout << "c1 and c2 are not equal!" << endl) ;
    c1.display();
    c1 += c2;
    c1.display();
    ++c1; //--c1;
    c1.display();
    c1 ++ ; // c1--;
    c1.display();
    (float)c1 ;
    c1.display();

    return 0;
}
