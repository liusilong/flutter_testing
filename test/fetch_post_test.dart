import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/post.dart';
import 'package:flutter_testing/post_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

/// Date: 2019-09-29 11:16
/// Author: Liusilong
/// Description:
//

class MockClient extends Mock implements http.Client {}

void main() {
  group("fetchPist", () {
    test("returns a Post if the http call completes successfully", () async {
      final client = MockClient();

      // 当调用指定的接口的时候返回指定的数据
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async {
        return http.Response(
            '{"title": "test title", "body": "test body"}', 200);
      });
      var post = await fetchPost(client);
      expect(post.title, "test title");
    });

    test("throws an exception if the http call completes with an error", () {
      final client = MockClient();

      // 当调用这个接口的时候返回 Not Found
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async {
        return http.Response('Not Found', 404);
      });
      expect(fetchPost(client), throwsException);
    });
  });
}
