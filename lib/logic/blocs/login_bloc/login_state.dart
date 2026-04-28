import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable  {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final DateTime lastAcces;
  const LoginSuccess(this.lastAcces);
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}