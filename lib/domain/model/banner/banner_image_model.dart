
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_image_model.g.dart';

@JsonSerializable()
class BannerImageModel extends Equatable {
  final int id;
  final String images;

  BannerImageModel({
    required this.id,
    required this.images
  });

  factory BannerImageModel.fromJson(Map<String, dynamic> json) =>
      _$BannerImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerImageModelToJson(this);

  @override
  List<Object> get props => [id, images];
}