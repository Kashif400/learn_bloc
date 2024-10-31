import 'package:equatable/equatable.dart';

abstract class SwitchEventAsif extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnableOrDisabledNotification extends SwitchEventAsif {}

class SliderEvent extends SwitchEventAsif {
  final double slider;
  SliderEvent({required this.slider});

  @override
  List<Object?> get props => [slider];
}
