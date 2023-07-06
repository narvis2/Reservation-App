
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice_image_model.g.dart';

@JsonSerializable()
class NoticeImageModel extends Equatable {
  final int id;
  @JsonKey(name: 'uniqueName')
  final String imageUrl;

  NoticeImageModel({
    required this.id,
    required this.imageUrl,
  });

  factory NoticeImageModel.fromJson(Map<String, dynamic> json) => _$NoticeImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeImageModelToJson(this);

  @override
  List<Object?> get props => [id, imageUrl];
}