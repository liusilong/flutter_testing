import 'dart:async';
import 'dart:convert';
import 'package:flutter_testing/post.dart';
import 'package:http/http.dart' as http;

/// Date: 2019-09-29 11:13
/// Author: Liusilong
/// Description:
//

Future<Post> fetchPost(http.Client client) async {
  final response =
      await client.get("https://jsonplaceholder.typicode.com/posts/1");
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
