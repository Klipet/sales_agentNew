import 'package:equatable/equatable.dart';

abstract class ActivationEvent extends Equatable {
  const ActivationEvent();

  @override
  List<Object?> get props => [];
}

class FetchActivationData extends ActivationEvent {
  final String licenseCode;

  const FetchActivationData(this.licenseCode);

  @override
  List<Object?> get props => [licenseCode];
}
