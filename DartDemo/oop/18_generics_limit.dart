
class SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  String toString() => "Instance of 'Foo<$T>'";
}

// 子类
class Extender extends SomeBaseClass {}

class AnotherClass {}

void main(){
  var someBaseClass = new SomeBaseClass();
  print(someBaseClass);
  var foo = new Foo<SomeBaseClass>();
  print(foo);

  // var f = Foo<AnotherClass>(); //报错 类型不对
  // print(f);

  var extender = Foo<Extender>();
  print(extender);
}