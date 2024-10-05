void main() {
  Future.delayed(Duration(seconds: 2), () {
    print("hello world");
  }).then((value) {
    print(value);
  }).catchError((err){
    print(err);
  },
  test: (error)=> error.runtimeType == String)
  .whenComplete((){
    print("whenComplete");
  });
}