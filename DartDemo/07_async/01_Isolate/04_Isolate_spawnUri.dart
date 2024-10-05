import 'dart:isolate';

void main(){
  start();

  // 执行耗时任务
  newIsolate();

  init();
}

start(){
  print("应用启动：" + DateTime.now().microsecondsSinceEpoch.toString());
}

newIsolate() async{
  print("创建新线程");
  ReceivePort r = ReceivePort();
  SendPort p = r.sendPort;
  // 创建新的线程
  Isolate childIsolate = await Isolate.spawnUri(
      Uri(path: "./childIsolate.dart"),
      ['data1','data2','data3'],
      p);

  r.listen((message) {
    print("主线程收到消息：$message");
    if(message[1] == 1){
      print("异步任务正在处理中");
    }else if (message[1] == 2){
      print("异步任务完成");
      r.close(); // 取消监听
      childIsolate.kill(); //
    }
  });
}

init(){
  print("项目初始化");
}
