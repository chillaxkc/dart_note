
// typedef 定义函数类型目的让程序的可读性更强
// 语法
// typedef MyFunction(String name);
// typedef variable_name = List<int> 【dart2.13之后才能使用】

// 示例
// typedef MyFunction = void Function(String name);

typedef MathOperation(int a,int b);
void test(MathOperation operation){
  print(operation(1,2));
}
add(int a,int b){
  print("加法运算: " + (a+b).toString());
  return a+b;
}

add3(int a,int b,int c){
  print("加法运算: " + (a+b+c).toString());
  return a+b;
}

void main(){
  print(add is MathOperation);
  print(add3 is MathOperation);
}