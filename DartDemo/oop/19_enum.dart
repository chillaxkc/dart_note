
enum Color{
  red,
  green,
  blue
}

void main() {
  print("enum test");
  // 获取美剧所有枚举值列表
  print(Color.values);
  print(Color.values[1]);
  // 也可通过index获取值的索引
  print(Color.green.index);

  List<Color> colors = Color.values;
  print(colors[2]);
  colors.forEach((element) {
    print(element);
  });
}
