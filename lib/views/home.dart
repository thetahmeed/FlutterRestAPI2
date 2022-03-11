import 'package:api_with_flutter/models/post.dart';
import 'package:api_with_flutter/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    posts = await ApiServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].id.toString()),
                      Text('Title: ' + posts![index].title.toString()),
                      Text('Body: ' + posts![index].body.toString()),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
