import 'package:sales_agent/data/models_api/models_assortiment/assortiment_img_response.dart';

abstract class AssotrimentImgState {}

class ImgInitial extends AssotrimentImgState {}

class ImgLoading extends AssotrimentImgState {}

class ImgSuccess extends AssotrimentImgState {
  final AssortimentImgResponse imgResponse;
  ImgSuccess(this.imgResponse);
}

class ImgFailure extends AssotrimentImgState {
  final String message;
  ImgFailure(this.message);
}