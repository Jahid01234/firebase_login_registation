import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_registation/Registration.dart';
import 'package:firebase_login_registation/components/my_button.dart';
import 'package:firebase_login_registation/helper/helper_function.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
 final void Function()?onTap;
   Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final TextEditingController eamilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase Login method
  void loginUser() async{
    // show loading circle
    showDialog(
        context: context,
        builder: (context){
          return Center(child: CircularProgressIndicator());
        }
    );
    // try sign In
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: eamilController.text, password: passwordController.text);

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      // pop loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser(e.code, context);
    }

  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // The 1st text field
              TextField(
                controller: eamilController,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: "Email"),
              ),

              // The 2nd text field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  hintText: "Password",
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // ElevatedButton(
              //     onPressed: (){},
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.deepOrange),
              //     child: Center(
              //       child: Text("Login"),
              //     )),
              MyButton(
                  text: "Login",
                  onTap: loginUser
              ),

              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't have an Account?"),
                  InkWell(
                      onTap:widget.onTap,
                      child: Text("   Register here")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
