import 'package:flutter/material.dart';

class TestStateless extends StatelessWidget {
  // const TestStateless({Key key}) : super(key: key);
    String id;
  @override
  Widget build(BuildContext context) {
       id = ModalRoute.of(context).settings.arguments;
              print("id from ");

       print(id);
 return Scaffold(
      body: Container(
        child: null,
      ),
    );
  }
}