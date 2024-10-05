class CommonClass{
  Set s = new Set<int>();

  void add(int value){
    this.s.add(value);
  }

  void info(){
    print(this.s);
  }
}

// 泛型类
class GenericsClass<T>{
  Set s = new Set<T>();

  void add(T value){
    this.s.add(value);
  }

  void info(){
    print(this.s);
  }
}

void main(){
  CommonClass c = new CommonClass();
  c.add(1);
  c.info();

  GenericsClass g = new GenericsClass<int>();
  g.add(1);
  g.info();

  GenericsClass g2 = new GenericsClass<String>();
  g2.add("generics string");
  g2.info();
}