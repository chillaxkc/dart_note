
void main(){
  print("start");
  futureAny();

  futureAwait();
}

void futureAny(){
  // any返回第一个完成
  Future.any([
    Future.delayed(Duration(seconds: 2), () => "Future any delayed"),
    Future.delayed(Duration(seconds: 3), () => "Future any delayed2"),
    Future.delayed(Duration(seconds: 4), () => "Future any delayed3"),
  ]).then((value){
    print("Future最快的返回结果:");
    print(value);
  });
  print("end");
}

void futureAwait(){
  Future.wait([
    Future.delayed(Duration(seconds: 2), () => "Future wait delayed"),
    Future.delayed(Duration(seconds: 3), () => "Future wait delayed2"),
    Future.delayed(Duration(seconds: 4), () => "Future wait delayed3"),
  ]).then((value){
    print("Future等待所有返回结果:");
    print(value);
  });
}