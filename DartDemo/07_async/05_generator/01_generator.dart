import 'dart:async';

/*
* Generator（生成器）
• 什么是生成器
• 生成器是一种特殊的函数，返回值通过 yield 关键词来指定。
• 生成器的分类
• 同步生成器
( sync + yield)
• 使用 sync*，返回的是 Iterable 对象。
• yield 会返回moveNext 为true，并等待moveNext指令。
• 异步生成器
(async + yield)
• 使用async*，返回的是 Stream对象。
•yield 不用暂停，数据以流的方式一次性推送
• 递归生成器（yield*）
• yield* 是指针，指向递归函数
* */

// yield = return + continue

// 同步生成器返回单个或者多个Interable
Iterable<int> getNumber(int n) sync*{
  int i = 0;
  while(i < n){
    yield i;
    i++;
  }
}

void main(){
  var res = getNumber(5).iterator;
  while(res.moveNext()){
    print(res.current);
  }
}

