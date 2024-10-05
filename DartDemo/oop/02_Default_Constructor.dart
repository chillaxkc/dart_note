
class Point{
  num x = 0,y = 0;
  // 声明普通构造函数
  Point(){
    x = 1;
    y = 2;
    // 当命名指向有歧义时，必须使用this.x  this.y
    print("我是默认构造函数，实例化时，会第一个被调用");
  }

  // 命名构造函数
  Point.origin(){
    x = 11;
    y = 22;
  }
  // 可以创建多个命名构造函数

  // 命名构造函数
  Point.fromJson({x = 0, y = 0} ){
    this.x = x;
    this.y = y;
  }

  // // 命名构造函数
  // Point.fromJson2(Map<String,num> json):this.fromJson(json);
  //
  // // 命名构造函数
  // Point.fromJson3(Map<String,num> json):this();

}

class PointTwo {
  num x = 0,
      y = 0;
  // 普通构造函数简写形式
  PointTwo(this.x,this.y);
}

/*
* •常量构造函数
• 如果类生成的对象不会改变，您可以通过常量构造函数使这些对象成为编译时常量
* 可以提高性能
* */
class ImmutablePoint{
  // 属性必须用final声明
  final num x,y;
  // 常量构造函数必须用const修饰
  const ImmutablePoint(this.x,this.y);
  // 声明常量构造函数不能有函数体
}

void main(){
  var p = Point();
  var p2 = PointTwo(3,4);
  print("${p2.x},${p2.y}");

  // 命名函数可以提高实例化构造函数的清晰度
  var p3 = Point.origin();
  print("${p3.x},${p3.y}");
  var p4 = Point.fromJson(x: 32,y: 42);
  print("${p4.x},${p4.y}");

  // 常量构造函数 可以当做普通构造函数使用 使用new后就相当于普通函数
  var p5 = ImmutablePoint(3,4);
  var p6 = ImmutablePoint(3,4);
  print(p5 == p6);
  // 正确声明常量构造函数，不可以修改[必须通过const修饰]
  var p7 = const ImmutablePoint(3,4);
  var p8 = const ImmutablePoint(3,4);
  print(p7 == p8);
}