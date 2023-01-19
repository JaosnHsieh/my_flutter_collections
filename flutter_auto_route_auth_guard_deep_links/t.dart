import 'dart:math';

class Test {
  String? a;
  Test({this.a});
}

void f(String? a) {
  if (a != null) {
    print(a);
  } else {
    print('null');
  }
}

void main() {
  Test? t;
  if (Random().nextInt(10) > 5) {
    t = Test(a: '123');
  }
  f(t?.a);
}
