import 'dart:math';

/// Date: 2019-09-29 11:38
/// Author: Liusilong
/// Description:
///
//

class A {

  int calculate(B b) {
    int randomNum = b.getRandomNum();
    return randomNum * 2;
  }
}

class B {
  int getRandomNum() {
    return Random().nextInt(100);
  }
}
