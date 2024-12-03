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
public:
    Stack(int inStackSize):stackSize(inStackSize),top(-1){
        data = new int[stackSize];
        stackCounter++;
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
        cout << "Stack: [ ";
        while(i > -1){
            if((i-1) != -1){
                cout << data[i] << ", ";
            }else{
            cout << data[i] << " ]" << endl;
            }
            i--;
        }
    }

    ~Stack(){
        delete []data;
    }
};
int Stack::stackCounter=0;


int main()
{
    Stack S1(5);
    S1.push(10);
    S1.push(12);
    S1.push(14);
    S1.push(16);
    S1.push(18);
    S1.push(20);
    S1.pop();
    S1.pop();
    S1.push(200);
    S1.DisplayStack();

    return 0;
}
