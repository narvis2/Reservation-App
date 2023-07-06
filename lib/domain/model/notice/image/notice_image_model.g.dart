// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeImageModel _$NoticeImageModelFromJson(Map<String, dynamic> json) =>
    NoticeImageModel(
      id: json['id'] as int,
      imageUrl: json['uniqueName'] as String,
    );

Map<String, dynamic> _$NoticeImageModelToJson(NoticeImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uniqueName': instance.imageUrl,
    };
