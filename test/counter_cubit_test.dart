import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../playground/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';

// ??
// import 'package:first_app/main.dart';
     print("test out");

 void main(){
     print("test counterCubit");

  group('CounterCubit', 
  CounterCubit counterCubit;
  setUp((){
    counterCubit = CounterCubit();
  });
  tearDown((){
    counterCubit.close();
  });
  test('')
  )
}