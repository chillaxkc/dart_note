test() {
  return Future.delayed(Duration(seconds: 2), () {
    print(' Future.delayed');
    return 123;
  });
}

void awaitTest() async{
  print('start');
  // 等待test()执行完毕
  await test();

  print('end');
}

getUserInfo(){
  return Future.delayed(Duration(seconds: 2), (){
    print("userinfo");
    return 123;
  });
}
getOrderInfo(int id) async{
  return Future.delayed(Duration(seconds: 2), (){
    print("OrderInfo");
    return 111;
  });
}

void main() async{
  // awaitTest();
  // getOrderInfo();
  var id = await getUserInfo();
  var order = await getOrderInfo(id);
  print(order);
}

