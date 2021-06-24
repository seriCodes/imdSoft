import 'dart:ffi';

import 'package:first_app/models/patient.dart';
import 'package:first_app/playgroung/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import './screens/homePage.dart';
import './screens/image_input.dart';
import './screens/patient_form.dart';
import './screens/patientdetails.dart';
import './animations/bouncyScreenChange.dart';
class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    print("routeSettings print");
    print(routeSettings);

    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
      case Routes.patientDetails:
        return BouncyScreenChange(widget: PatientDetails(), routeSettings:routeSettings 
        );
        break;
      case Routes.patientForm:
        return MaterialPageRoute(
          builder: (_) => PatientForm(),
          settings: routeSettings,
        );
        break;
      case Routes.imageInput:
        return MaterialPageRoute(
          builder: (_) => ImageInput(),
          settings: routeSettings,
        );
        break;
      default:
        return null;
    }
  }
}
