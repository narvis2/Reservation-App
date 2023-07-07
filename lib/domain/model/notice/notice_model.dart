import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/model/notice/image/notice_image_model.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel extends Equatable {
  final int id;
  final String title;
  final String content;
  final MemberModel member;
  final List<NoticeImageModel> images;
  final String createdAt;
  final String modifiedAt;

  NoticeModel({
    required this.id,
    required this.title,
    required this.content,
    required this.member,
    required this.images,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        member,
        images,
        createdAt,
        modifiedAt,
      ];
}
