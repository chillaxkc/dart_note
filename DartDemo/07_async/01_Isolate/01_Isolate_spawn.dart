import 'dart:isolate';
/*
* Isolate 多线程
• Isolate 是 Dart 中的线程
• Dart 中的线程是以隔离 （Isolate）的方式存在的
•每个 Isolate 都有自己独立的，私有内存块（多个线程不共享内存）
• 没有共享内存，就不需要竞争资源，就不需要锁（不用担心死锁问题）
•所有的Dart 代码，都运行在Isolate 中
• Isolate 提供了 Dart | Flutter 的运行环境
•微任务队列，事件队列，事件轮询（EventlLoop）都在 Isolate 中进行
• 多线程经常用来解决耗时较长的异步任务
*
* Isolate 多线程一创建
• Future<Isolate> Isolate.spawn(entryPoint, message)
• import 'dart:isolate';
• entryPoint（必须是一个顶层方法或静态方法,外部能够访问到）
• message
• ① Dart 原始数据类型，如 null、bool、int、double、String 等
• ② SendPort 实例 - ReceivePort（）.sendPort
•包含 ① 和②的list和 map，也可以嵌套
• compute()
• import 'package:flutter/foundation.dart':
* */
void main() {
  print("Hello isolate spawn");
  multiThread();
}

void multiThread(){
  print("multiThreas start");

  print("current thread name: ${Isolate.current.debugName}");
  // 创建新线程
  Isolate.spawn(newThread, "Hello1");
  Isolate.spawn(newThread2, "Hello2");
  Isolate.spawn(newThread3, "Hello3");

  print("multiThread end");
}

void newThread(String message) {
  print("current thread name: ${Isolate.current.debugName}");
  print("newThread message: $message");
}
void newThread2(String message) {
  print("current thread name: ${Isolate.current.debugName}");
  print("newThread message: $message");
}
void newThread3(String message) {
  print("current thread name: ${Isolate.current.debugName}");
  print("newThread message: $message");
}