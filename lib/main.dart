import 'package:first_app/playgroung/app_router.dart';
import 'package:first_app/playgroung/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import './playgroung/cubit/counter_cubit.dart';
import './playgroung/bloc/myHome.dart';
import './playgroung/bloc/statelessScreenOne.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
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
        initialRoute: './', //? is it doing something?
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
    //
  }
}
