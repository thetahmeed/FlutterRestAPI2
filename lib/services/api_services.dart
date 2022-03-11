import 'package:api_with_flutter/models/post.dart';

// 2. Imported the http package
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Post>?> getPosts() async {}
  // 1. Created the fuction to get all posts
  Future<List<Post>?> getPosts() async {
    // 3. Created the client
    var client = http.Client();

    // 4. The url
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // 5. Getting the response
    var response = await client.get(url);

    // 6. Getting the response or not
    if (response.statusCode == 200) {
      var json = response.body;

      // 7. Returning the response
      return postFromJson(json);
    } else {
      // Returning null if response is not success
      return null;
    }
  }
}
