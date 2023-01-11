import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Bar Item Page"),
        ),
      ),
    );
  }
}
