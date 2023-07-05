// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      title: json['title'] as String,
      content: json['content'] as String,
      createTime: json['createTime'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => NoticeImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'createTime': instance.createTime,
      'images': instance.images,
    };
