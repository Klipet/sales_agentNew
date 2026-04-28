import 'package:equatable/equatable.dart';
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';
import 'package:sales_agent/data/models_db/model_db_assortiment/model_assortiment_db.dart';

abstract class AssortimentState {}

class AssortimentInitial extends AssortimentState {}

class AssortimentLoading extends AssortimentState {}

class AssortimentSuccess extends AssortimentState {
  final List<ModelAssortimentDB> orders;
  AssortimentSuccess(this.orders);
}

class AssortimentFailure extends AssortimentState {
  final String message;
  AssortimentFailure(this.message);
}
class AssortimentFailureNonInternet extends AssortimentState {
  final int error;
  AssortimentFailureNonInternet(this.error);
}