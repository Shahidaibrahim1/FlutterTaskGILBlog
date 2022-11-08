import 'package:flutter/material.dart';
import 'package:flutter_blog/home_screen.dart';
import 'package:flutter_blog/round_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 FirebaseAuth _auth = FirebaseAuth.instance ;
  bool showSpinner = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  final _formKey = GlobalKey<FormState>() ; 
  String email = " ", password = " " ;
  
  @override 
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
       child: Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

       child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Log In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
          
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(

                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()
                  ),
                  onChanged: (String value) {
                    email = value ;
                  },
                  validator: (value){
                    return value!.isEmpty ? 'enter email' : null ;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration( 
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()
                  ),
                  onChanged: (String value){
                    password = value;
                  },
                  validator: (value){
                    return value!.isEmpty ? 'enter password' : null ;
                  },
                ),
                ),
                RoundButton(title: 'Login', onPressed: ()async{
                 if(_formKey.currentState!.validate()){
                   
                   setState(() {
                     showSpinner = true;
                   });
                   try{

                    final user = await _auth.signInWithEmailAndPassword(email: email.toString().trim(),
                     password: password.toString().trim()) ;

                    if(user != null)
                    {
                      print("success");
                      toastMessage("User successfully Logged In");

                      setState(() {
                     showSpinner = false;
                   });
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                    }

                   } catch(e){
                     print(e.toString());
                     toastMessage(e.toString());
                     setState(() {
                     showSpinner = false;
                   });
                   }

                 }

                })
              ],
            ),
          ),

          )
        ],
     ),
      ),
      )
    );

  }
  void toastMessage(String message)
  {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}