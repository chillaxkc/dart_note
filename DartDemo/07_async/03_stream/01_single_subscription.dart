import 'dart:async';

/*
* •Stream 是Dart 中的异步数据流，可以连续不断的返回多个数据。
• Future 是异步，但只返回一个值
• Stream 也是异步，可以返回多个值（数据流）
listen进行监听数据
error接收失败状态
done接收结束状态
Single-Subscription 单一订阅
    数据流只能被 listen 一次（listen 多次会报错）
    StreamController).stream
    Stream stream = Stream.fromIterable(data)
Broadcast 广播
    数据流可以被listen多次
    StreamController<int>.broadcast();
    stream.asBroadcastStream()
* */
void main(){
  print("main start");
  // 创建单一订阅流
  final StreamController controller = StreamController();
  // 第一次监听
  controller.stream.listen((event){
    print("data is $event");
  });

  // // 第二次监听会报错
  // controller.stream.listen((event){
  //   print("data is $event");
  // });

  // 给数据流添加数据
  controller.sink.add('abc');
  controller.sink.add('123');
}