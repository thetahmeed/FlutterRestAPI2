import 'package:api_with_flutter/models/post.dart';

// 2. Imported the http package
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Post>?> getPosts() async {}
  // 1. Created the fuction to get all posts
  Future<List<Post>?> getPosts() async {
    // 3. Created the client
    var client = http.Client();

}
