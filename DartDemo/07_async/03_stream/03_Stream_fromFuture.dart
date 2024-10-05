import 'dart:async';

Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "当前时间${DateTime.now()}";
  });
}

void streamFromFuture() {
  Stream.fromFuture(getData()).listen((event) {
    print("stream.fromfuture $event");
  }).onDone(() {
    print("stream.fromfuture onDone");
  });
}

void streamFromFutures() {
  var data = [getData(), getData(), getData()];
  Stream.fromFutures(data).listen((event) {
    print("stream.fromfuture $event");
  }).onDone(() {
    print("stream.fromfuture onDone");
  });
  ;
}

void streamIterabel() {
  // var data = [getData(),getData(),getData()];
  var data = [1, 2, 'Hello', true, null];
  // Stream.fromIterable里面数据最好是普通数据
  Stream.fromIterable(data).listen((event) {
    print("stream.fromfuture $event");
  }).onDone(() {
    print("stream.fromfuture onDone");
  });
}

// 周期性
// 按条件结束 take() takeWhile() where()
// distinct() 去掉与前一个相同的数据(连续重复的值)
// skip() 按条件跳过 skipWhile()
// map() toSet() toList() toString()
// length first last
void streamPeriodic() {
  var stopCount = 5;
  Stream.periodic(Duration(seconds: 1), (index) {
    return index;
  }).take(stopCount).listen((event) {
    print("stream.periodic $event");
  }).onDone(() {
    print("stream.periodic onDone");
  });
}

void streamPeriodicTakeWhile() {
  var stopCount = 5;
  Stream.periodic(Duration(seconds: 1), (index) {
    return index;
  }).takeWhile((element){
    return element < stopCount;
  }).listen((event) {
    print("stream.periodic $event");
  }).onDone(() {
    print("stream.periodic onDone");
  });
}

void main() {
  print("main start");
  // streamFromFuture();
  // streamFromFutures();
  // streamIterabel();
  // streamPeriodic();
  streamPeriodicTakeWhile();
}

