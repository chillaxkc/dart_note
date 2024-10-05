
/*
* Future 执行顺序
1 Future 默认是异步任务，会被丢到事件队列（event queue）中
• Future.sync()
2 同步任务，同步执行（不会被丢到异步队列中）
• Future.microtask()
•微任务，会丟到 microtask queue 中，优先级比事件任务高
3 Future.value(val)
• val 是常量（等同于 microtask）
是异步（按照异步逻辑处理）
* */

void main() {
  print("start");
  Future(()=> print("Future() task")); // event queue

  Future.microtask(() {
    print("microtask");
  });

  Future.sync(() {
    print("sync");
  });
  // 如果value 是常量，会被 microtask 丢到 microtask queue 中
  Future.value("Future.value").then((value) {
    print(value);
  });
  // 如果value 是异步Future，则按照异步的逻辑处理
  Future.value(Future((){
    print("Future.value future task");
  }));

  print("main end");
}