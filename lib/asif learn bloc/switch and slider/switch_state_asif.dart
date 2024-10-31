import 'package:equatable/equatable.dart';

class SwitchStateAsif extends Equatable {
  final bool isSwitch;
  final double slider;

  const SwitchStateAsif({this.isSwitch = false, this.slider = 0.0});

  SwitchStateAsif copyWith({bool? isSwitch, double? slider}) {
    return SwitchStateAsif(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}
