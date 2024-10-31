import 'package:equatable/equatable.dart';

abstract class CounterEventAsif extends Equatable {
  const CounterEventAsif();

  @override
  List<Object?> get props => [];
}

class IncreamentCounterAsif extends CounterEventAsif {}

class DecreamentCounterAsif extends CounterEventAsif {}
