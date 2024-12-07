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
    Line():Point(int x1,int y1,int x2, int y2),p1(x1,y1),p2(x2,y2){
        cout << "[Line] Constructor" << endl;
    }
    draw(){
        cout << "first point x-coordinate: " << p1.getX() << endl;
        cout << "first point y-coordinate: " << p1.gety() << endl;
        cout << "second point x-coordinate: " << p2.getX() << endl;
        cout << "second point y-coordinate: " << p2.gety() << endl;
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
    Rectangle(Point p1,Point p2)ul(p1),lr(p2){
        cout << "[Rectangle] Constructor" << endl;
    }
    draw(){
        cout << "Upper Left Point : x-coordinate: " << ul.getX() << endl;
        cout << "Upper Left Point : y-coordinate: " << ul.gety() << endl;
        cout << "Lower Right Point: x-coordinate: " << lr.getx() << endl;
        cout << "Lower Right Point: y-coordinate: " << lr.gety() << endl;
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
    Circle(Point p,int r):p1(p),radius(r){
        cout << "[Circle] Constractor" << endl;
    }
    draw(){
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
    setLine(int lc,Line * l){
        lineCount = lc;
        L = l;
    }
    setCircle(int cc,Line * c){
        circleCount = cc;
        C = c;
    }
    setRectangle(int rc,Line * r){
        rectangleCount = rc;
        R = r;
    }

    paint(){
        int i=0;
        cout << "Number of lines: " << lineCount << endl;
        for(i=0;i<lineCount;i++){
                cout << "ID: " << i << endl;
                cout << "x1-coordinate: " << L.p1.getX()[i] << endl;
                cout << "y1-coordinate: " << L.p1.getY()[i] << endl;
                cout << "x2-coordinate: " << L.p2.getX()[i] << endl;
                cout << "y2-coordinate: " << L.p2.getY()[i] << endl;
        }
        i=0;
        cout << "Number of rectangles: " << rectangleCount << endl;
        for(i=0;i<rectangleCount;i++){
                cout << "ID: " << i << endl;
                cout << "x1-coordinate: " << R.lr.getX() << endl;
                cout << "y1-coordinate: " << R.lr.getY() << endl;
                cout << "x2-coordinate: " << R.ul.getX() << endl;
                cout << "y2-coordinate: " << R.ul.getY() << endl;
        }
        i=0;
        cout << "Number of circles: " << circleCount << endl;
        for(i=0;i<circleCount;i++){
                cout << "ID: " << i << endl;
                cout << "x1-coordinate: " << C.p1.getX() << endl;
                cout << "y1-coordinate: " << C.p1.getY() << endl;
                cout << "raduis: " << C.radius << endl;
        }
    }

    ~Picture(){
        cout << "[PICTURE] Destructor" << endl;
    }
};

int main()
{
    Point p;
    Line        line(2,3,4,5);
    Circle      cir(p);
    Rectangle   rec();
    Picture pic(1,1,1,&line,&cir,&rec);






    return 0;
}
