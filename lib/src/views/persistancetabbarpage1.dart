import 'package:countertask/src/views/persistancetabbarpage2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blue),onPressed: () => Navigator.push(context,CupertinoPageRoute(builder: (context) => const Page2())), child: const Text('Next Page',style: TextStyle(color: Colors.black),))),
    );
  }
}
