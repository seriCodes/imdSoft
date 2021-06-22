import 'dart:ffi';

import 'package:flutter/material.dart';
 
// import './screens/';
import 'playgroung/bloc/statelessScreenOne.dart';

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
