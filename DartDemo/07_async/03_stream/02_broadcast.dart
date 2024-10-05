import 'dart:async';

void main(){
  print("main start");
  // 创建广播
  final StreamController controller = StreamController.broadcast();
  // 第一次监听
  controller.stream.listen((event){
    print("data1 is $event");
  });
  // 第一次给数据流添加数据
  controller.sink.add('abc');

  // 第二次监听会报错
  controller.stream.listen((event){
    print("data2 is $event");
  });
  //  第二次给数据流添加数据
  controller.sink.add('123');
}