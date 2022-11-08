import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  
  final String title ;
  final VoidCallback onPressed ;
  RoundButton({required this.title, required this.onPressed});

  @override 
  Widget build(BuildContext context) {
    return Material(

      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.deepOrange,
        height: 50,
        minWidth: double.infinity,
        child: Text(title, style: TextStyle(color: Colors.white),),
        onPressed: onPressed,
      ),
    );
  }
}