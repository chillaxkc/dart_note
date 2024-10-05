
// call方法
// 在类中可以声明call方法(方法名不能变)
// 当我们将类的实例，用作函数时，会调用call方法
class iOSPhone{
  iOSPhone(){
    print("iOSPhone init");
  }
  call(String num){
    print("phone number is $num");
  }
}

void main() {
  var phone = iOSPhone(); // 实例化对象时，会自动调用构造函数
  phone("911");
  // 简写 iOSPhone()("911")
}
// 当我们调用了一个类的未定义方法，dart会自动调用noSuchMethod
// 使用前提是，类中定义了noSuchMethod,否则调默认的noSuchMethod
// 实例化对象必须用dynamic修饰
// 调用的是未定义方法(p.undefinedMethod())
