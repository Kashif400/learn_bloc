import 'package:bloc/bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_event_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/counter/counter_state_asif.dart';

class CounterBlocAsif extends Bloc<CounterEventAsif, CounterStateAsif> {
  CounterBlocAsif() : super(const CounterStateAsif()) {
    on<IncreamentCounterAsif>(_increament);
    on<DecreamentCounterAsif>(_decreament);
  }

  void _increament(
      IncreamentCounterAsif event, Emitter<CounterStateAsif> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decreament(
      DecreamentCounterAsif event, Emitter<CounterStateAsif> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
