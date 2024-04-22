import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_registation/components/my_button.dart';
import 'package:firebase_login_registation/helper/helper_function.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  final void Function()? onTap;
  Registration({super.key, this.onTap});

  @override
  State<Registration> createState() => _RegistrationState();
 }


 class _RegistrationState extends State<Registration> {


     final TextEditingController userNameController = TextEditingController();
     final TextEditingController emailController = TextEditingController();
     final TextEditingController passwordController = TextEditingController();
     final TextEditingController confirmPasswordController = TextEditingController();

  // Firebase Register method
  void RegisterUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        }
    );

    // check password match
    if (passwordController.text != confirmPasswordController.text) {
      // pop loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("Password doesn't match!", context);
    }

    // if password match
    else{
      // try create the user
      try {
        // create the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        //show error message to user
        displayMessageToUser(e.code, context);
      }
  }


  }










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // The 1st text field
              TextField(
                 controller: userNameController,
                decoration: InputDecoration(
                   // border: InputBorder.none,
                    hintText: "Username",
                ),
              ),

              // The 2nd text field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: "Email",
                ),
              ),

              // The 3rd text field
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: "Password",
                ),
              ),

              // The 4th text field
              TextField(
                obscureText: true,
                 controller: confirmPasswordController,
                decoration: InputDecoration(
                   // border: InputBorder.none,
                    hintText: "Confirm password",
                ),
              ),
              SizedBox(height: 30,),


              // ElevatedButton(
              //     onPressed: (){},
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              //     child:Center(child: Text("Register"),)
              // ),

              MyButton(
                  text: "Register",
                  onTap: RegisterUser
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already have an Account?"),
                  InkWell(
                    onTap:widget.onTap,
                      child: Text("   Login here")),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
