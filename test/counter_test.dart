
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/counter.dart';

/// Date: 2019-09-29 10:32
/// Author: Liusilong
/// Description:
/// 也可以使用命令来运行 flutter test test/counter_test.dart

void main() {
  // 单一的测试
  test("Counter value should be incremented", () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  // 使用 group 合并多个测试。用来测试多个有关联的测试
  group("Counter", () {
    test("value should start at 0", () {
      expect(Counter().value, 0);
    });

    test("value should be increment", () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test("value should be decremented", () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
