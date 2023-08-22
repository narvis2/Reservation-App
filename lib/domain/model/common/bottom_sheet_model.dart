import 'package:equatable/equatable.dart';

class BottomSheetModel extends Equatable {
  final String title;

  const BottomSheetModel({required this.title});

  @override
  List<Object?> get props => [title];

  @override
  bool? get stringify => false;
}