
// hashCode是dart对象的唯一标识
// hashCode表现为一串数字
// dart中每个对象都有hashCode
// 可以通过hashCode来判断对象是否相同

class Person{
  say(){
    print("person say");
  }
}

class PersonSingleton{
  static final PersonSingleton _instance = PersonSingleton._internal();
  factory PersonSingleton(){
    return _instance;
  }
  PersonSingleton._internal();
}

void main(){
  var p1 = Person();
  // 打印p1的hashCode
  print(p1.hashCode);
  var p2 = Person();
  print(p2.hashCode);

  print(p1 == p2);

  var ps1 = PersonSingleton();
  print(ps1.hashCode);
  var ps2 = PersonSingleton();
  print(ps2.hashCode);
  print(ps1 == ps2);
}