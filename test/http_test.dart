import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/Utils.dart';
import 'package:http/http.dart' as http;

/// 基础测试
/// json 解析测试
/// 网络请求测试
/// Widget 测试
void main() {
  test("这里是单元测试的描述信息", () {
    print('这里是要测试的内容');
    int a = 7;
    // 检测变量 a 的值是不是 7
    expect(a, 7);
  });

  test("这是一个简单的测试", () {
    int result = sum(3, 5);
    print('result is $result');
    // 检测 result 是不是等于 8
    expect(result, 8);
  });

  test("这又是一个简单的测试", () {
    String lastChar = getLastChar("Flutter");
    // 检测 Flutter 的最后一个字符是不是 r
    expect(lastChar, "r");
  });

  /// skip 为 true 的时候会跳过这个测试
  /// skip 为 其他字符串的时候也会跳过这个测试，并且将 skip 的值输出
  test("Json 解析", () {
    String jsonStr = '''
    [1,2,3,4,5,6]
    ''';
    List<int> list = parseListJson(jsonStr);
    list.forEach((value) => print(value));
    // 检测解析后的 list 的第二个元素是否为 3
    expect(list[2], 3);
  }, skip: "过");

  test("测试网络请求", () async {
    final token = "54321";
    final response = await http.get(
      "https://api.myjson.com/bins/18mjgh",
      headers: {"token": token},
    );
    if (response.statusCode == 200) {
      // 验证请求 header 中的 token
      expect(response.request.headers['token'], token);
      print(response.request.headers['token']);
      print(response.body);
      // 解析返回的 json
      Person person = parsePersonJson(response.body);
      // 验证 person 对象不为空
      expect(person, isNotNull);
      // 检测 person 对象中的属性值是否都正确
      expect(person.name, "Lili");
      expect(person.age, 20);
      expect(person.country, 'China');
    }
  });
}
