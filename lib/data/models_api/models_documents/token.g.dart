// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      deviceUid: json['DeviceUid'] as String,
      uid: json['Uid'] as String,
      validTo: json['ValidTo'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'DeviceUid': instance.deviceUid,
      'Uid': instance.uid,
      'ValidTo': instance.validTo,
    };
