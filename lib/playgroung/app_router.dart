import 'dart:ffi';

import 'package:first_app/playgroung/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
 
import './cubit/counter_cubit.dart';
import './bloc/myHome.dart';
import './bloc/statelessScreenOne.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    print("onGenerateRoute print");
    // print(routeSettings);
    // print("routeSettings.name");
    // print(routeSettings.name);


    switch (routeSettings.name) {
      case './':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'bloc Demo Home Page'),
        );

        break;
      // case MyStaelessScreen.routeName:
     case "./statelessScreenOne":
    //  print("./statelessScreenOne case");
      return  MaterialPageRoute(
          builder: (_) => MyStaelessScreen(),
        );
        break;

      default:
        return null;
    }
  }

}
