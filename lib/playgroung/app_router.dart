import 'dart:ffi';

import 'package:first_app/playgroung/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/counter_cubit.dart';
import './bloc/myHome.dart';
import './bloc/statelessScreenOne.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    print("onGenerateRoute print");
    print(routeSettings);
    print("routeSettings.name");
    print(routeSettings.name);


    switch (routeSettings.name) {
      case './':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: MyHomePage(title: 'bloc Demo Home Page'),
          ),
        );

        break;
      // case MyStaelessScreen.routeName:
     case "./statelessScreenOne":
     print("./statelessScreenOne case");
      return  MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: MyStaelessScreen(),
          ),
        );
        break;

      default:
        return null;
    }
  }

  @override
  void dispose() {
    _counterCubit.close();
  }
}
