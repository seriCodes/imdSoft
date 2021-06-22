import 'package:first_app/playgroung/cubit/counter_cubit.dart'; //created automaticlly after BlocBuilder<CounterCubit, CounterState>
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class myStatelessWidget extends StatelessWidget {
  const myStatelessWidget({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text('myStatelessWidget: ${state.counterValue.toString()}');
        },
      ),
    );
  }
}