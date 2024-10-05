
class Person{
  say(){
    print("say something");
  }

  @override
  noSuchMethod(Invocation invocation){
    // 实现noSuchMethod 目的就是为了防止报错
    print("未定义方法");
    return super.noSuchMethod(invocation);
  }
}

void main(){
  dynamic p = Person();
  print(p.say());
  print(p.study());
}