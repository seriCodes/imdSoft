import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './playgroung/cubit/counter_cubit.dart';
import './playgroung/bloc/myHome.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: MyHomePage(title: 'bloc Demo Home Page'),
        )

        // routes: {
        //   PatientForm.routeName: (ctx) => PatientForm(),
        //   PatientDetails.routeName: (ctx) => PatientDetails(),
        //   ImageInput.routeName: (ctx) => ImageInput(),

        // },
        );
    //
  }
}

