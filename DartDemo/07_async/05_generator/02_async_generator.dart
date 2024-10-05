
//异步生成器 返回的是数据流
Stream<int> asyncCountDown(int n) async*{
  while(n > 0){
    yield n--;
  }
}

void main(){
  print("main start");
  int n = 5;
  final Stream<int> s = asyncCountDown(n);
  s.listen((event) {
    print("event is $event");
  }).onDone((){
    print("done");
  });
  print("main end");
}