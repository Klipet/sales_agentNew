import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class FetchLoginData extends LoginEvent {
  final String login;
  final String password;
  bool save = false;

  FetchLoginData(this.login, this.password, this.save);

  @override
  List<Object?> get props => [login, password, save];
}
