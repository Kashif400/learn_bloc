import 'package:equatable/equatable.dart';

class CounterStateAsif extends Equatable {
  final int counter;

  const CounterStateAsif({this.counter = 0});

  CounterStateAsif copyWith({int? counter}) {
    return CounterStateAsif(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
