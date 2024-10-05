
extension StringExtension on String{
  // 将字符串形式的数字转成数字
  parseInt(){
    return int.parse(this);
  }
}

// 扩展自定义类
class Person{
  String name;
  int age;
  Person(this.name,this.age);
}
extension PersonExtension on Person{
  String get info{
    return "name:${this.name},age:${this.age}";
  }
}

void main() {
  print("hello extension");
  String number = "200";
  var num = number.parseInt();
  print(num);

  var p = Person("张三", 20);
  print(p.info);
}