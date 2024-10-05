import 'dart:async';

/*
* •概念
• Future 是Dart 中的类，我们可以通过 Future 实例，封装一些异步任务
•Future 的含义是未来。未来要执行的一些任务，我们可以放到 Future 中
• Future 有三种状态
• 未完成（Uncompleted）
•已完成，并返回数据
• (Completed with data)
•已完成，但返回报错（Completed with error）
* */

void main() {
  // 创建Future对象
  final f = Future((){
    print("Create the future");
    return 123;
  });
  print(f);
  f.then((value){
    print(value);
  });
  print("main end");
}