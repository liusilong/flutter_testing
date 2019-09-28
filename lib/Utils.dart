import 'dart:convert';

import 'package:flutter/material.dart';

/// 加法

int sum(int a, int b) {
  return a + b;
}

/// 获取字符串的最后一个字符
String getLastChar(String str) {
  sum(9, 0);
  return str.substring(str.length - 1);
}

/// 解析一个数组
List<int> parseListJson(String res) {
  var list = json.decode(res);
  return List<int>.from(list);
}

/// 解析对象
Person parsePersonJson(String res) {
  Map<String, dynamic> map = json.decode(res);
  Person person = Person.fromJson(map);
  return person;
}

class Person {
  final String name;
  final int age;
  final String country;

  Person({this.name, this.age, this.country});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'], age: json['age'], country: json['country']);
  }
}
