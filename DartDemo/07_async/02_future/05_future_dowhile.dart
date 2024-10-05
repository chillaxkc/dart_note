void main() {
  // Future doWhile
  // futureDoWhile();

  futureDoWhileAwait();
}

void futureDoWhile(){
  var i = 0;
  Future.doWhile(() {
    i++;
    return Future.delayed(Duration(seconds: 2), () {
      print("future dowhile() $i,当前时间: ${DateTime.now()}");
      return i < 6;
    }).then((value) {
      print("Future.delayed $value");
      // 返回值决定是否继续循环
      return value;
    });
  });
}

void futureDoWhileAwait(){
  var i = 0;
  // 使用递归代替 Future.doWhile
  Future<void> recursiveDoWhile() async {
    while (i < 6) {
      i++;
      await Future.delayed(Duration(seconds: 2));
      print("future dowhile() $i, 当前时间: ${DateTime.now()}");
    }
    print("future.doWhile finished with value: $i");
  }

  recursiveDoWhile();
}
