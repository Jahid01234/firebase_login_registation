import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String  text;
  final void Function()?onTap;// create a function , which return onTap

  MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}


class _MyButtonState extends State<MyButton> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            widget.text,style:TextStyle(
              fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ),
      ),
    );
  }
}
