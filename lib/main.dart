import 'package:first_app/playgroung/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './playgroung/cubit/counter_cubit.dart';
import './playgroung/bloc/myHome.dart';
import './playgroung/bloc/statelessScreenOne.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter=AppRouter();


@override
void dispose(){
_appRouter.dispose();
  super.dispose();
}


   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // accentColor: Colors.blueAccent,
        // cardColor: Color(0xFFFFFFFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21.5,
          ),
          bodyText2: TextStyle(
            color: Colors.indigo,
            fontSize: 17.5,
          ),
        ),
      ),
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: MyHomePage(title: 'bloc Demo Home Page'),
      // ),
      initialRoute: './',//? is it doing something?
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
    //
  }
}
