
void main(){
  Future.forEach([1,2,3], (element){
    return Future.delayed(Duration(seconds: 1), (){
      print("当前元素: $element");
      return element.toString() + "_AAA";
    }).then((value){
      print("处理后的结果 $value");
    });
  });
}