import 'package:equatable/equatable.dart';



abstract class LoginEvent {}

class FetchLoginData extends LoginEvent {
  final String login;
  final String password;
  bool save = false;

  FetchLoginData(this.login, this.password, this.save);

}
class CheckSavedLogin extends LoginEvent {}