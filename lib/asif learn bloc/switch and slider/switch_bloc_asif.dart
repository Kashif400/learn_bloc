import 'package:bloc/bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_event_asif.dart';
import 'package:learn_bloc/asif%20learn%20bloc/switch%20and%20slider/switch_state_asif.dart';

class SwitchBlocAsif extends Bloc<SwitchEventAsif, SwitchStateAsif> {
  SwitchBlocAsif() : super(const SwitchStateAsif()) {
    on<EnableOrDisabledNotification>(_notification);
    on<SliderEvent>(_slider);
  }

  void _notification(
      EnableOrDisabledNotification event, Emitter<SwitchStateAsif> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchStateAsif> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
