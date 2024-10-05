/*
* •工厂构造函数
•通过 factory 声明，工厂函数不会自动生成实例，而是通过代码来决定返回的实例
* */

class Person{
  String name;
  int age;

  // 工厂构造函数
  factory Person.fromJson(Map<String,dynamic> json){
    return Person(json['name'],json['age']);
  }
  // 在工厂构造函数中不能使用this关键字

  Person(this.name,this.age);
}

void main(){
  var p = Person.fromJson({"name":"张三","age":18});
  print(p.name);
}