import 'package:firebase_login_registation/Login.dart';
import 'package:firebase_login_registation/Registration.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}


class _LoginOrRegisterState extends State<LoginOrRegister> {


  // initally, show login page
  bool showLoginPage = true;

  // toggle between login or Register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }




  @override
  Widget build(BuildContext context) {
     if(showLoginPage){
       return Login(onTap: togglePages);
     }else{
       return Registration(onTap: togglePages);
     }

  }
}
