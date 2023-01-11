import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  ResponsiveButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      child: Text(text,style: TextStyle(fontSize: 18,color: Colors.white),),
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    );
  }
}
