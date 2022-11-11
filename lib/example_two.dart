import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  List<Posts> postsList = [];

  Future<List<Posts>> getPosts () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
        for(Map i in data)
        {
          Posts posts = Posts(title: i['title'], body: i['body']);
          postsList.add(posts);
        }
        return postsList;
    }
    else{
      return postsList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getPosts(),
            builder: (context, snapshot){
            
            return ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index){
              return ListTile(
                title: Text("Apis Data"),
              );
            });
          }),
        )
      ]),
    );
  }
  
}
class Posts{
    String title, body;

    Posts({required this.title, required this.body });
  }