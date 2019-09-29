// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:flutter_testing/MyWidget.dart';

import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/todo_list.dart';

void main() {
  testWidgets("MyWidget has a title and message", (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(
      title: "T",
      message: "M",
    ));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(TodoList());
    // 往输入框中输入 hi
    await tester.enterText(find.byType(TextField), 'hi');
    // 点击 button 来触发事件
    await tester.tap(find.byType(FloatingActionButton));
    // 让 widget 重绘
    await tester.pump();
    // 检测 text 是否添加到 List 中
    expect(find.text('hi'), findsOneWidget);

    // 测试滑动

    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    expect(find.text('hi'), findsNothing);

  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    expect(find.text("Liusilong"), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });
}
