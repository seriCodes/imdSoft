import 'package:flutter/material.dart';
import './screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 22test',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // accentColor: Colors.blueAccent,
        // cardColor: Color(0xFFFFFFFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
            fontSize: 21.5,
          ),
          bodyText2: TextStyle(
            color: Colors.indigo,
            fontSize: 17.5,
          ),
        ),
      ),
      home: HomePage(),
      // appBar: AppBar(title: Text('Flutter Demo Home Page 4561')),

      // routes: {
      //   ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      //   CartScreen.routeName: (ctx) => CartScreen(),
      //   }),
    );
    //
  }
}
