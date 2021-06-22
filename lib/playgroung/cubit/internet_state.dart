
library Internet_state;
import 'package:first_app/playgroung/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import '../constants/enums.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


part 'internt_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState{}
class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({@required this.connectionType});
  
}
class InternetDisconnected extends InternetState {}
