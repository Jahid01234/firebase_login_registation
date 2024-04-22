import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void logOut()async{
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              onPressed: logOut,
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Center(
        child: Text("The Firbase Set Up and Authentication Done")
      ),
    );
  }
}
