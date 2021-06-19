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
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange,
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
