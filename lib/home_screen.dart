import 'package:flutter/material.dart';
import 'package:flutter_blog/add_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('New Blogs'),
        centerTitle: true,
        actions: [
          InkWell(
            
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddPostScreen()));
            },
            
            child: Icon(Icons.add)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [

      ],
      
      ),
    );
  }
}