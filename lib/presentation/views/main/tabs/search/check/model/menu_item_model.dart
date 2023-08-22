import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';

class MenuItemModel extends Equatable {
  final ReservationFilterType filterType;
  final bool isChecked;

  MenuItemModel({
    required this.filterType,
    required this.isChecked,
  });

  MenuItemModel copyWith({
    ReservationFilterType? filterType,
    bool? isChecked,
  }) {
    return MenuItemModel(
      filterType: filterType ?? this.filterType,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [filterType, isChecked];

  @override
  bool? get stringify => true;
}
