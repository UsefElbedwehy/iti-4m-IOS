#include <iostream>

using namespace std;
constexpr char EMPTY_FLAG = 1;
constexpr char NOT_EMPTY_FLAG = 0;
constexpr char EMPTY_STACK_TOP_VALUE = -1;
constexpr char FALSE = 0;
constexpr char TRUE = 1;

class Stack {
private:
    int stackSize;
    int top;
    int * data;
    static int stackCounter;
    int stackID;
public:
    Stack(){
        stackCounter++;
        cout << "constructor" << stackCounter << endl;
    }
    Stack(int inStackSize):stackSize(inStackSize),top(-1){
        data = new int[stackSize];
        stackCounter++;
        stackID = stackCounter;
        cout << "constructor" << stackCounter << endl;
    }
    Stack(const Stack &cs){
        stackCounter++;
        cout << "Copy constructor" << stackCounter << endl;
        this->stackSize = cs.stackSize ;
        this->top       = cs.top ;
        this->stackID   = cs.stackID ;
        this->data      = new int[this->stackSize];
        int i=0;
        for(i=0;i < (this->stackSize) ;i++){
            this->data[i] = cs.data[i];
        }
    }
    int sizeGetter(){
        return stackSize;
    }
    int topGetter(){
        return top;
    }
    int idGetter(){
        return stackID;
    }
    int * dataGetter(){
        return data;
    }
    int isEmpty(){
        if(top == EMPTY_STACK_TOP_VALUE){
            return EMPTY_FLAG;
        }else{
            return NOT_EMPTY_FLAG;
        }
    }
    int isFull(){
        if(top == (stackSize-1)){
            return EMPTY_FLAG;
        }else{
            return NOT_EMPTY_FLAG;
        }
    }
    char pop(){
        if(isEmpty()){
            return FALSE;
        }
        int tempData = data[top];
        data[top]=0;
        top--;
        return TRUE;
    }
    char push(int inputData){
        if(isFull()){
            return FALSE;
        }
        top++;
        data[top] = inputData;
        return TRUE;
    }
    void DisplayStack(){
        int i=top;
        if(top == -1){
            cout << "Stack" << stackID << " is empty..." <<endl;
        }else{
            cout << "Stack"<< stackID <<": [ ";
            while(i > -1){
                if((i-1) != -1){
                    cout << data[i] << ", ";
                }else{
                cout << data[i] << " ]" << endl;
                }
                i--;
            }
        }
    }

    void displayStackNumber(){
    cout << "Number of stacks are: " << stackCounter << endl;
    }
    void operator=(Stack s){
        this->stackSize = s.stackSize;
        this->top = s.top;
        this->stackID = s.stackID;
        this->data = new int[this->stackSize];
        int i=0;
        for(i=0;i<(this->stackSize);i++){
            this->data[i] = s.data[i];
        }
    }

    ~Stack(){
        delete []data;
        cout << "destructor" << stackCounter << endl;
        stackCounter--;
    }
};
int Stack::stackCounter=0;


//3- viewContent function once call by value and with copy constructor.
void DisplayStack5(Stack s){
    //cout << "+=============" << endl;
    int top = s.topGetter();
    int i = top;
        if(top == -1){
            cout << "Stack" << s.idGetter() << " is empty..." <<endl;
        }else{
            cout << "Stack"<< s.idGetter() <<": [ ";
            while(i > -1){
                if((i-1) != -1){
                    cout << s.dataGetter()[i] << ", ";
                }else{
                cout << s.dataGetter()[i] << " ]" << endl;
                }
                i--;
            }
        }
}


int main()
{
    Stack S1(5);
    Stack S2(5);
    Stack S3(5);
    S1.push(10);
    S1.push(12);
    S1.push(14);
    S1.push(16);
    S1.push(18);
    S1.push(20);
    S1.pop();
    S1.pop();
    S1.push(200);
    S1.pop();
    S2.push(33);
    S2.push(334);
    S2.push(666);
    DisplayStack5(S1);
    DisplayStack5(S2);
    DisplayStack5(S1);
    DisplayStack5(S2);
    //s2.operator=(s1);
    S2=S1;
    cout << "S2=S1" << endl;
    DisplayStack5(S1);
    DisplayStack5(S2);
    S2.push(644);
    S2.push(652);
    S1.push(802);
    S1.push(992);
    DisplayStack5(S1);
    DisplayStack5(S2);
    S1.displayStackNumber();


    return 0;
}
