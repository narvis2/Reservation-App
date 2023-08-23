import 'package:equatable/equatable.dart';

class BottomSheetModel extends Equatable {
  final String title;
  final bool enable;

  const BottomSheetModel({
    required this.title,
    required this.enable,
  });

  @override
  List<Object?> get props => [title, enable];

  @override
  bool? get stringify => true;
}
