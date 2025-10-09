import 'package:equatable/equatable.dart';

abstract class AssortimentState {}

class AssortimentInitial extends AssortimentState {}

class AssortimentLoading extends AssortimentState {}

class AssortimentSuccess extends AssortimentState {
  final List<dynamic> orders;
  AssortimentSuccess(this.orders);
}

class AssortimentFailure extends AssortimentState {
  final String message;
  AssortimentFailure(this.message);
}