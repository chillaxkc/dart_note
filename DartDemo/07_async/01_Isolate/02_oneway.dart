import 'dart:isolate';

void main(){
  print("Hello isolate port");

  multiThread();

}

void multiThread(){
  print("multiThreas start");

  print("current thread name: ${Isolate.current.debugName}");

  ReceivePort r1 = ReceivePort();
  SendPort p1 = r1.sendPort;
  Isolate.spawn(newThread, p1);

  // 接收新线程发送过来的消息
  // var msg = r1.first;
  // print("main线程接收来自新线程的消息 ${msg.toString()}");
  r1.listen((msg) {
    print("main线程接收来自新线程的消息 ${msg.toString()}");
    r1.close(); // 关闭接收端口，否则会一直阻塞
  });

  print("multiThread end");
}

void newThread(SendPort p1) {
  print("current thread name: ${Isolate.current.debugName}");
  print("newThread p1: $p1");
  // 发送消息给main线程
  p1.send('abc');
}