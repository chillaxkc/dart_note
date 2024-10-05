/*
*     同步生成器   sync*    yield
* 递归同步生成器    sync*    yield*
*     异步生成器   async*   yield
*  递归异步生成器   async*   yield*
* */

Iterable<int> getRange(int start, int end) sync* {
  if (start <= end) {
    yield start;
    // 实现递归调用
    // 方式一
    // for (var val in getRange(start+1,end)) {
    //   yield val;
    // }


    // 方式二
    // yield* 相当于上面for循环+yield
    /*
    * yield* 语法用于委托生成器，可以理解为将一个生成器中的所有值依次“委托”给另一个生成器。
    * 具体来说：
    生成器（Generator）：
    生成器是一种特殊的迭代器，可以使用 yield 关键字生成一系列值。
    生成器函数通常定义为带有 yield 的函数。
    yield* 的作用：
    当一个生成器函数中使用 yield* 时，它会将另一个生成器的所有值依次生成出来。
    这相当于将另一个生成器的值嵌入到当前生成器中。
    * yield* 使得当前生成器可以“借用”另一个生成器的所有值，并按顺序生成这些值
    * */
    yield* getRange(start + 1, end);
  }
}

// 同步递归生成器
void syncGenerator() {
  print("start");
  final Iterable<int> s = getRange(1, 5);
  s.forEach((element) {
    print(element);
  });
  print("end");
}

void main() {
  syncGenerator();
}
