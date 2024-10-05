import 'dart:async';

// https://www.bilibili.com/video/BV1gN4y1V7pq/?p=6&spm_id_from=pageDriver&vd_source=f77052640b85914f03a73844227a0063

// Dart 单线程的核心包括：主线程、微任务和宏任务
// 微任务队列
// 微任务队列包含微任务，主要通过 scheduleMicrotask 来调度。
// 事件队列
// 事件队列包含外部事件，例如！/O、Timer，绘制事件等
// 微任务优先级高先执行微任务，执行完后，再执行宏任务（也就是事件任务）

void main(){
  print("flow start");

  Timer.run((){
    print("event-A");

    scheduleMicrotask((){
      print("microtask-B in event-A");
    });

    scheduleMicrotask((){
      print("microtask-C in event-A");
    });
  });

  scheduleMicrotask((){
    print("microtask-A");
    Timer.run((){
      print("event-B in microtask-A");
    });
  });

  print("flow end");
}

