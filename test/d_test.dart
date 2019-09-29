import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/mock_d.dart';
import 'package:mockito/mockito.dart';

/// Date: 2019-09-29 11:41
/// Author: Liusilong
/// Description:
///

class MockB extends Mock implements B {}

void main() {
  test("测试使用 mockito 来 mock 依赖", () {
    var b = MockB();
    var a = A();
    // 当调用 b.getRandomNum() 方法的时候返回 10
    when(b.getRandomNum()).thenReturn(10);
    expect(a.calculate(b), 20);

    // 检查 b.getRandomNum(); 是否调用过
    verify(b.getRandomNum());
  });
}
