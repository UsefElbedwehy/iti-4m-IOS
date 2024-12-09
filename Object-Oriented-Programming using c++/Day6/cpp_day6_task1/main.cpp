#include <iostream>

using namespace std;
class Shape{
private:

protected:
    static int shapeID;
public:
    Shape(){
        shapeID++;
        cout << "[SHAPE]["<< shapeID <<"] Constructor" << endl;
    }

    virtual void draw()=0;
    ~Shape(){
        cout << "[SHAPE]["<< shapeID <<"] Destructor" << endl;
        shapeID--;
    }

};
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

class Line : public Shape{
private:
    Point p1;
    Point p2;

public:
    Line(int x1,int y1,int x2, int y2) : Shape() ,p1(x1,y1),p2(x2,y2){
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

class Rectangle : public Shape{
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

class Circle : public Shape{
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
    Shape ** s;
    int cSize;
    int shapesCounter;
public:
    Picture(int containerSize){
        cSize = containerSize;
        shapesCounter=-1;
        this->s = new Shape*[containerSize];
        cout << "[PICTURE] Constructor" << endl;
    }
    void addShape(Shape * ss){
        if(shapesCounter < cSize){
            shapesCounter++;
            s[shapesCounter] = ss;
        }
    }

    void paint(){
        int i=0;
        for(i=0;i<=shapesCounter;i++){
            s[i]->draw();
        }
    }

    ~Picture(){
        cout << "[PICTURE] Destructor" << endl;
    }
};


int Shape::shapeID=0;
int main()
{
    Picture p(5);
    p.addShape(new Line(1,2,3,4));
    p.addShape(new Rectangle(1,2,3,4));
    p.addShape(new Circle(1,3,4));
    p.addShape(new Line(1,2,3,4));
    p.paint();

    return 0;
}
