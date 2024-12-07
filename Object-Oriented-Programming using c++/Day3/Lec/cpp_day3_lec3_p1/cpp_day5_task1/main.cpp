#include <iostream>

using namespace std;

class Point{
private:
    int xCoord;
    int yCoord;

public:
    Point(int x, int y): xCoord(x),yCoord(y){
        cout << "[POINT] Constructor" << endl;
    }
    void setX(int x){
        xCoord = x;
    }
    void setY(int y){
        yCoord = y;
    }
    int getX(){
        return xCoord;
    }
    int getY(){
        return yCoord;
    }
    ~Point(){
    cout << "[POINT] Destructor" << endl;
    }
};

class Line{
private:
    Point p1;
    Point p2;

public:
    Line(int x1,int y1,int x2, int y2):p1(x1,y1),p2(x2,y2){
        cout << "[Line] Constructor" << endl;
    }
    void draw(){
        cout << "first point x-coordinate: " << p1.getX() << endl;
        cout << "first point y-coordinate: " << p1.getY() << endl;
        cout << "second point x-coordinate: " << p2.getX() << endl;
        cout << "second point y-coordinate: " << p2.getY() << endl;
        cout << "p1("<< p1.getX() <<","<< p1.getY() << ")"<< endl;
        cout << "p2("<< p2.getX() <<","<< p2.getY() << ")"<< endl;
        cout << "______________LINE________________" << endl;
    }
    ~Line(){
        cout << "[LINE] Destractor" << endl;
    }

};

class Rectangle{
private:
    Point ul;
    Point lr;

public:
    Rectangle(int x1,int y1,int x2, int y2):ul(x1,y1),lr(x2,y2){
        cout << "[Rectangle] Constructor" << endl;
    }
    void draw(){
        cout << "Upper Left Point : x-coordinate: " << ul.getX() << endl;
        cout << "Upper Left Point : y-coordinate: " << ul.getY() << endl;
        cout << "Lower Right Point: x-coordinate: " << lr.getX() << endl;
        cout << "Lower Right Point: y-coordinate: " << lr.getY() << endl;
        cout << "_________________________" << endl;
        cout << "|                       |" << endl;
        cout << "|       RECTANGLE       |" << endl;
        cout << "|                       |" << endl;
        cout << "_________________________" << endl;
    }
    ~Rectangle(){
        cout << "[Rectangle] Destructor" << endl;
    }
};

class Circle{
private:
    Point p1;
    int radius;

public:
    Circle(int x,int y,int r):p1(x,y),radius(r){
        cout << "[Circle] Constractor" << endl;
    }
    void draw(){
        cout << "x-coordinate: " << p1.getX() << endl;
        cout << "y-coordinate: " << p1.getY() << endl;
        cout << "radius: " << radius << endl;
        cout << "Imagine a circle" << endl;
        cout << "            '   " << endl;
        cout << "           ' '  " << endl;
        cout << "            '   " << endl;
    }

    ~Circle(){
        cout << "[Circle] Destructor" << endl;
    }
};

class Picture{
private:
    int lineCount;
    int rectangleCount;
    int circleCount;
    Line      * L;
    Circle    * C;
    Rectangle * R;

public:
    Picture(int lc, int cc, int rc, Line * l, Circle * c, Rectangle * r):lineCount(lc),circleCount(cc),rectangleCount(rc){
        L = l;
        C = c;
        R = r;
        cout << "[PICTURE] Constructor" << endl;
    }
    void setLine(int lc,Line * l){
        lineCount = lc;
        L = l;
    }
    void setCircle(int cc,Circle * c){
        circleCount = cc;
        C = c;
    }
    void setRectangle(int rc,Rectangle * r){
        rectangleCount = rc;
        R = r;
    }

    void paint(){
        cout << "Paint" << endl;
    }

    ~Picture(){
        cout << "[PICTURE] Destructor" << endl;
    }
};

int main()
{
    //Point p(0,0);
    //point  con
    //point  con
    //line   con
    Line        line(2,3,4,5);
    //point  con
    //circle con
    Circle      cir(1,2,3);
    //point  con
    //point  con
    //rect   con
    Rectangle   rec(1,2,3,4);
    //pic    con
    Picture pic(1,1,1,&line,&cir,&rec);






    return 0;
}
