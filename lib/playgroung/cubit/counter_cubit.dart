import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_app/playgroung/constants/enums.dart';
import 'package:first_app/playgroung/cubit/internet_state.dart';
import 'package:meta/meta.dart';
class CounterState{
  int counterValue;
  bool wasIncremented;
  CounterState({
    this.counterValue,
    this.wasIncremented
  });
}



 
  class CounterCubit extends Cubit<CounterState> {
    final InternetCubit internetCubit;
    StreamSubscription internetStreamSubscription;

  CounterCubit({this.internetCubit}) : super(CounterState(counterValue: 0)){
    monitorInternetCubit();

  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription= internetCubit.listen((InternetState) {
    if(InternetState is InternetConnected && InternetState.connectionType==ConnectionType.Wifi){
      increment();
    }else if(InternetState is InternetConnected && InternetState.connectionType==ConnectionType.Mobile){
      decrement();
    }
   });
  }

void increment ()=> emit (CounterState(counterValue:state.counterValue+1,
wasIncremented: true));
void decrement()=>emit(CounterState(counterValue: state.counterValue-1, wasIncremented: false));

@override
Future<void> close(){
  internetStreamSubscription.cancel();
  return super.close();
}
}
