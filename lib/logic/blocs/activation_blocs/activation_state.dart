import 'package:equatable/equatable.dart';

abstract class ActivationState extends Equatable  {
  const ActivationState();

  @override
  List<Object?> get props => [];
}

class ActivationInitial extends ActivationState {}

class ActivationLoading extends ActivationState {
}

class ActivationSuccess extends ActivationState {}

class ActivationFailure extends ActivationState {
  final String message;

  const ActivationFailure(this.message);

  @override
  List<Object?> get props => [message];
}