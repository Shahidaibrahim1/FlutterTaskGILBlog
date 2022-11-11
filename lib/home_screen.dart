//@dart=2.9
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/add_post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_blog/models_name.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List<Posts>postsList = [];
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
            initialData: 'Demo Name',
            builder: (BuildContext,  snapshot){
            
            return ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, int index){
                    return ListTile(
                    title: Text(snapshot.data[index].title.toString()),
                    subtitle: Text(snapshot.data[index].body.toString()),

              );
                
             
            });
          }),
        )
      ]),
    );
  }
      /* 
      body: Column(
        children: [
          Expanded(
            
            child: FirebaseAnimatedList(

              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                  
              return Column(
                children: [
                  
                  FadeInImage.assetNetwork(
                    placeholder: 'images/firebase.png',
                     image: ''),
              ],
              );
              },
            ) ,
            )

      ],
      
      ), */
//       body: Column(
//         children: [
//              Expanded(
//             child: FutureBuilder(
//               future: getPostApi(),
//               builder: (context, snapshot) {
//               if(snapshot.hasData){
//                 return Text('Loading...');
          
//               }else {
//                return ListView.builder(
                 
//                  itemCount: postList.length ,
//                  itemBuilder: (context, index) {
                 
//                  return Text(index.toString());
//                }); 
          
//               }
//             },
//             ),
//           )
//         ]
//           )
//     );
//   }
// }
}
class Posts{
    String title, body;

    Posts({this.title, this.body });
  }