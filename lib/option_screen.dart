import 'package:flutter/material.dart';
import 'package:flutter_blog/login_screen.dart';
import 'package:flutter_blog/round_button.dart';
import 'package:flutter_blog/signin.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) :super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();

}

class _OptionScreenState extends State<OptionScreen> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Image(image: AssetImage('images/firebase.png')),
          SizedBox(height: 30,),
          RoundButton(title: 'Login', onPressed: (){

             Navigator.push(
              context, MaterialPageRoute(builder:(context) => LoginScreen()));


          }, ),

          SizedBox(height: 30,),
          RoundButton(title: 'Register', onPressed: (){

            Navigator.push(
              context, MaterialPageRoute(builder:(context) => SignIn(),));

          },)
        ],
      ),
    ),
    ), 
    );
  }
}