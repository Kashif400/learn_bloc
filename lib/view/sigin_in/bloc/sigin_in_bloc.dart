import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_event.dart';
import 'package:learn_bloc/view/sigin_in/bloc/sigin_in_state.dart';

class SiginInBloc extends Bloc<SiginInEvent, SiginInState> {
  SiginInBloc() : super(SiginInitialState()) {
    on<SiginInTextChangedEvent>(
      (event, emit) {
        if (event.emailValue == '' ||
            EmailValidator.validate(event.emailValue) == false) {
          emit(SiginErrorState("Please Enter a valid email address"));
        } else if (event.passwordValue.length < 8) {
          emit(SiginErrorState("Please Enter a valid password"));
        } else {
          emit(SiginValidState());
        }
      },
    );

    on<SiginSubmittedEvent>(
      (event, emit) {
        emit(SiginLoadingState());
      },
    );
  }
}
