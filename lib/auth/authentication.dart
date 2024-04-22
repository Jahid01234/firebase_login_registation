import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_registation/HomePage.dart';
import 'package:firebase_login_registation/auth/login_or_register.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder:(context,snapshot){
          // user logged in
          if(snapshot.hasData){
            return HomePage();
          }
          // unser not logged in
          else{
            return LoginOrRegister();
          }


        },
      ),
    );
  }
}
