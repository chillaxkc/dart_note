
// String getData(String value){
//   return value;
// }

// int getData(int value){
//   return value;
// }

// // 泛型函数
// T getData<T>(T value){
//   return value;
// }

// 只约定参数类型，不约定函数返回值的类型
getData<T>(T value){
  return value;
}

void main(){
    print(getData("123"));
    print(getData<String>("123"));
    print(getData(123456));

}