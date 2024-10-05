
mixin MixinsTest {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class Point with MixinsTest{

}

void main(){
  Point point = Point();
  point.describeCrew();
}

