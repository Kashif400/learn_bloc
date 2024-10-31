abstract class SiginInState {}

class SiginInitialState extends SiginInState {}

class SiginValidState extends SiginInState {}

class SiginErrorState extends SiginInState {
  final String errorMessage;
  SiginErrorState(this.errorMessage);
}

class SiginLoadingState extends SiginInState {}
