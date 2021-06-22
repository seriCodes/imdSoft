import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_app/playgroung/cubit/counter_cubit.dart';

class MyStaelessScreen extends StatelessWidget {
static const routeName = './statelessScreenOne';
  const MyStaelessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("MyStaelessScreen"),),
      body: Center(
        child: Column(children: [
          IconButton(onPressed: (){
BlocProvider.of<CounterCubit>(context).decrement();
          }, icon: Icon(Icons.ac_unit))
          ,
          // BlocListener(listener:               ScaffoldMessengerState scaf = ScaffoldMessenger.of(context);,
          Text('the count is'),
          // BlocBuilder<CounterCubit, CounterState>(
          //   builder: (context, state) {
          //     return Text('the count is'+state.counterValue.toString());
          //   },
          // )



        ],),
      ),
    );

  }
}