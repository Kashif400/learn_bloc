abstract class SiginInEvent {}

class SiginInTextChangedEvent extends SiginInEvent {
  final String emailValue, passwordValue;
  SiginInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SiginSubmittedEvent extends SiginInEvent {
  final String email, password;

  SiginSubmittedEvent(this.email, this.password);
}
