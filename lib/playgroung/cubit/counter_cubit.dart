import 'package:bloc/bloc.dart';
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
  CounterCubit() : super(CounterState(counterValue: 0));

void increment ()=> emit (CounterState(counterValue:state.counterValue+1,
wasIncremented: true));
void decrement()=>emit(CounterState(counterValue: state.counterValue-1, wasIncremented: false));
}
