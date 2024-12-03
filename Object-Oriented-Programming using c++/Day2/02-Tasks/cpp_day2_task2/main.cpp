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
    friend void DisplayStack2(Stack s);
public:
    Stack(int inStackSize):stackSize(inStackSize),top(-1){
        data = new int[stackSize];
        stackCounter++;
        stackID = stackCounter;
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

    ~Stack(){
        delete []data;
    }
};
int Stack::stackCounter=0;

void DisplayStack2(Stack s){
        int i= s.top;
        if(s.top == -1){
            cout << "Stack" << s.stackID << " is empty..." <<endl;
        }else{
            cout << "Stack"<< s.stackID <<": [ ";
            while(i > -1){
                if((i-1) != -1){
                    cout << s.data[i] << ", ";
                }else{
                cout << s.data[i] << " ]" << endl;
                }
                i--;
            }
        }
}
void DisplayStack3(Stack s){
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
    S1.DisplayStack();
    DisplayStack2(S2);
    DisplayStack3(S3);
    S1.displayStackNumber();


    return 0;
}
