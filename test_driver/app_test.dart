import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:test/test.dart';


/// Date: 2019-09-29 15:42
/// Author: Liusilong
/// Description:
///
//

void main(){
  group('Counter APP', (){
    final counterTextFinder = driver.find.byValueKey('counter');
    final buttonFinder = driver.find.byValueKey('increment');


    driver.FlutterDriver flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect();
    });

//    tearDownAll(()async{
//      if(flutterDriver != null) {
//        flutterDriver.close();
//      }
//    });

    test('start at 0', ()async{
      expect(await flutterDriver.getText(counterTextFinder), '0');
    });

    test("increments the counter", () async {
      await flutterDriver.tap(buttonFinder);
      expect(await flutterDriver.getText(counterTextFinder), "1");
    });

  });
}