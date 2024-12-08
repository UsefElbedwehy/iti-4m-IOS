#include <iostream>

using namespace std;

class GrandParent{

public:
    int x1;
protected:
    int y1;
private:
    int z1;

};
//        |
//        |
//        |
//        V
//        public
//        protected
//        private
//             -will save there status in the inheriting class
class Parent : public GrandParent{

public:
    int x2=x1;
    //x1
protected:
    int y2=y1;
    //y1
private:
    //z1
    int z2;
};
//        |
//        |
//        |
//        V
//        public
//              -will be protected for the next Gen
//        protected
//        private
//              -will save there status in the inheriting class  for the next Gen
class Child : protected Parent{

public:
    int x3=x2;
    //cout << "u can access: " <<endl;
protected:
    int y3=y2;
    //y1
    //x1
    //y2
    //x2
private:
    //z2
    int z3;
};
//        |
//        |
//        |
//        V
//        public
//        protected
//              -will be private for the next Gen
//        private
//              -will save there status in the inheriting class  for the next Gen
class ChildOfChild : private Child {

public:
    int x4=x3;
protected:
    int y4=y3;
private:
    //y1
    //y2
    //x1
    //x2
    //x3
    //z2
    //z3
    int z4;
};
//        |
//        |
//        |
//        V
//        public
//        protected
//        private
//              -will save there status in the inheriting class  for the next Gen
class Baby : public ChildOfChild {

public:
    int x5=x4;
protected:
    int y5=y4;
private:
    int z5;
};


int main()
{
    GrandParent gp;
    Parent p;
    Child c;
    ChildOfChild coc;

    /*Level [1]  -------------- GrandParent --&-- Parent ------------*/
    //RULE--->[1]-----> u can only access public in main
    gp.x1 = 10;
    p.x1 = 9;
    p.x2 = 99;

    /*Level [2]  -------------- Parent --&-- Child ------------*/
//    c.x1 = 90;
//    c.x2 = 90;
    c.x3 = 90;

    /*Level [3] -------------- Child --&-- ChildOfChild ------------*/
//    coc.x1 = 0;
//    coc.x2 = 0;
//    coc.x3 = 0;
    coc.x4 = 0;





    return 0;
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//                GrandParent                Parent                   Child                    ChildOfChild
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//relation
//of                -------                 public                  protected                    private
//inheritance
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//what can            x1                       x2                       x3                          x4
//be accessed       (in public section)      (in public section)      (in public section)          (in public section)
//in main from
//its Class obj
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//what can it        -------------------     (public and protected)    (public and protected)      (public and protected)
//access from the
//inherited
//parent
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//public:               x1                      x1, x2                   x3                             x4
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//protected:            y1                      y1, y2                 y1, y2, x1, x2, y3               y4
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//private:              z1                      z1, z2                      z1, z2, z3                  x1, x2, x3, y1, y2,
//                                                                                                      y3, z1, z2, z3 ,z4
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//











