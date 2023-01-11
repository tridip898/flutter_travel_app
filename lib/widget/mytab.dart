import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String text;
  const MyTab({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
    );
  }
}
