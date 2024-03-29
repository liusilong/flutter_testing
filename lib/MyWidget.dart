import 'package:flutter/material.dart';

/// Date: 2019-09-29 14:09
/// Author: Liusilong
/// Description:
//

class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({Key key, @required this.title, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
