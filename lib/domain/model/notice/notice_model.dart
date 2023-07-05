import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/notice/image/notice_image_model.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel extends Equatable {
  final String title;
  final String content;
  final String createTime;
  final List<NoticeImageModel> images;

  NoticeModel({
    required this.title,
    required this.content,
    required this.createTime,
    required this.images,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);

  @override
  List<Object> get props => [title, content, createTime, images];
}
