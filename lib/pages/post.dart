import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'json.dart';

Future<Post> createPost(String title) async {
  final response = await http.post(
    Uri.parse('http://localhost/rest.json'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode == 201) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // ignore: prefer_interpolation_to_compose_strings
    throw Exception("this is response ${response.statusCode}");
  }
}

void main() => runApp(const PostApp());

class PostApp extends StatefulWidget {
  const PostApp({super.key});
  @override
  State<PostApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<PostApp> {
  final TextEditingController _controller = TextEditingController();
  Future<Post>? _futurePost;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Json Test'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: (_futurePost == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futurePost = createPost(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder<Post>(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
