/// a function requires a String parameter "a"
void test1(String a) {}

/// get_it has a magic function getIt(); can return responding type to the function call
/// GetIt getIt = GetIt.instance;
///
class FakeIt {
  FakeIt();
  T call<T extends Object>() {
    return Object as T; // Object could be any value
  }
}

void main() {
  final FakeIt fakeIt = FakeIt();

  test1(1); // expect to throw type error
  test1("1");
  test1(fakeIt()); // passed type check just likes getIt();
}


/// references
/// https://www.educative.io/answers/what-is-dart-call
/// https://github.com/fluttercommunity/get_it/blob/master/lib/get_it_impl.dart#L426-L433