
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation_term_model.g.dart';

@JsonSerializable()
class ReservationTermModel extends Equatable {
  final String title;
  final bool isChecked;

  const ReservationTermModel({
    required this.title,
    required this.isChecked,
  });

  factory ReservationTermModel.fromJson(Map<String, dynamic> json) => _$ReservationTermModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationTermModelToJson(this);

  ReservationTermModel copyWith({
    String? title,
    bool? isChecked,
  }) {
    return ReservationTermModel(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [title, isChecked];

  @override
  bool? get stringify => true;
}