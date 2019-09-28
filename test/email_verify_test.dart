import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';

void main(){
  test("Email 验证", (){
    var result = EmailVerify.verifyEmail("");
    expect(result, "邮箱不能为空");
  });

  test("Email 验证", (){
    var result = EmailVerify.verifyEmail("test@");
    print('result is $result');
    expect(result, null);
  });
}