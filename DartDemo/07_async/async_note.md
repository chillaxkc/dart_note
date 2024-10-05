##### Isolate 与 Future 如何选择
```dart
/*
* •两者都可以执行异步操作，但逻辑不同
• Isolate 的开销比 Future 要大
• Isolate 需要重新开启线程，Future 是单线程内的异步任务
•异步任务耗时短，推荐使用 Future，耗时长，推荐使用Isolate
• 如果使用Future 来处理耗时长的异步任务，会造成阻塞
• 耗时<100 ms 选 Future；耗时>100毫秒选 Isolate
* */
```

##### Future, Stream, Isolate
```dart
/*
* • Future
•异步返回一个值
• Stream
•异步返回一系列的值（数据流）-->比如下载文件
• Isolate
•通过创建新线程的方式，来实现异步
* */
```

Async / Await
• async：标记函数是一个异步函数，其返回值类型是 Future
•await：等待某个异步方法执行完毕
•用来等待耗时操作的返回结果，这个操作会阻塞到后面的代码
•作用
• await会等待异步任务执行（相当于将异步转成同步）
• async-await简化代码，防止回调地域的产生