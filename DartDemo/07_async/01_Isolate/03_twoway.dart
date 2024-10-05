import 'dart:isolate';

void main(){
  print("Hello isolate port");

  multiThread();

}

// void multiThread(){
//   print("multiThreas start");
//
//   print("current thread name: ${Isolate.current.debugName}");
//
//   ReceivePort r1 = ReceivePort();
//   SendPort p1 = r1.sendPort;
//   Isolate.spawn(newThread, p1);
//
//   // 接收新线程发送过来的消息
//   // 1.接收方式一
//   // var msg = r1.first;
//   // print("main线程接收来自新线程的消息 ${msg.toString()}");
//   // 2.接收方式二
//   r1.listen((msg) {
//     print("main线程接收来自新线程的消息 ${msg.toString()}");
//     r1.close(); // 关闭接收端口，否则会一直阻塞
//   });
//
//   print("multiThread end");
// }

void multiThread() async{
  print("multiThreas start");

  print("current thread name: ${Isolate.current.debugName}");

  ReceivePort r1 = ReceivePort();
  SendPort p1 = r1.sendPort;
  Isolate.spawn(newThread, p1);

  // 通过r1.listen后，不能在后面再次 r1.first 两种方式只能用一种

  SendPort p2 = await r1.first;
  // p2.send("来自主线程的消息");

  // await for(var msg in r1){
  //   print("main线程接收来自新线程的消息 ${msg.toString()}");
  //   r1.close(); // 关闭接收端口，否则会一直阻塞
  // }

  var msg = await sendToReceiver(p2, "Hello");
  print("主线程接收到: ${msg}");
  print("multiThread end");
}

void newThread(SendPort p1) async{
  print("current thread name: ${Isolate.current.debugName}");
  print("newThread p1: $p1");

  // 1.发送普通消息给main线程
  // // 发送消息给main线程
  // p1.send('abc');

  // ------双向通信----------//
  // 2.发送端口消息给main线程
  ReceivePort r2 = ReceivePort();
  SendPort p2 = r2.sendPort;
  p1.send(p2);

  // r2.listen((message){
  //   print("newThread message: $message");
  // });

  await for(var msg in r2){
    print("新线程接收到了主线程的消息: $msg");
    var data = msg[0];
    print("新线程接收到了主线程的消息: $data");
    SendPort p = msg[1];
    p.send("新线程回复主线程");
  }
}

Future sendToReceiver(SendPort port,msg) async{
  print("发送消息给新线程${msg}");

  ReceivePort response = ReceivePort();
  port.send([msg,response.sendPort]);
  return response.first;
}