// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      member: MemberModel.fromJson(json['member'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => NoticeImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      modifiedAt: json['modifiedAt'] as String,
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'member': instance.member,
      'images': instance.images,
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
    };
