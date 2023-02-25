import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    //processing event handler logic inside constructor
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>(_decrementCounter);
  }

  //Creating seperate methods for logic processing if the logic is larger.
  //Its good practice to create seperate method for logic process as
  //It improves code readability without clutturing constructor
  void _decrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
