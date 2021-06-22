import 'package:flutter/material.dart';
import './app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import './screens/homePage.dart';
void main() {
  runApp(MyApp(
    appRouter:AppRouter(),
        connectivity: Connectivity(),

  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.appRouter,
    @required this.connectivity,
  }):super(key: key);

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
            onGenerateRoute: appRouter.onGenerateRoute,

    );
    //
  }
}
