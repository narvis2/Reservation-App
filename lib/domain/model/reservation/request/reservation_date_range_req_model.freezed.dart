// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_date_range_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationDateRangeReqModel {
  DateTime get searchStartDate => throw _privateConstructorUsedError;
  DateTime get searchEndDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationDateRangeReqModelCopyWith<ReservationDateRangeReqModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationDateRangeReqModelCopyWith<$Res> {
  factory $ReservationDateRangeReqModelCopyWith(
          ReservationDateRangeReqModel value,
          $Res Function(ReservationDateRangeReqModel) then) =
      _$ReservationDateRangeReqModelCopyWithImpl<$Res,
          ReservationDateRangeReqModel>;
  @useResult
  $Res call({DateTime searchStartDate, DateTime searchEndDate});
}

/// @nodoc
class _$ReservationDateRangeReqModelCopyWithImpl<$Res,
        $Val extends ReservationDateRangeReqModel>
    implements $ReservationDateRangeReqModelCopyWith<$Res> {
  _$ReservationDateRangeReqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStartDate = null,
    Object? searchEndDate = null,
  }) {
    return _then(_value.copyWith(
      searchStartDate: null == searchStartDate
          ? _value.searchStartDate
          : searchStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchEndDate: null == searchEndDate
          ? _value.searchEndDate
          : searchEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationDateRangeReqModelCopyWith<$Res>
    implements $ReservationDateRangeReqModelCopyWith<$Res> {
  factory _$$_ReservationDateRangeReqModelCopyWith(
          _$_ReservationDateRangeReqModel value,
          $Res Function(_$_ReservationDateRangeReqModel) then) =
      __$$_ReservationDateRangeReqModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime searchStartDate, DateTime searchEndDate});
}

/// @nodoc
class __$$_ReservationDateRangeReqModelCopyWithImpl<$Res>
    extends _$ReservationDateRangeReqModelCopyWithImpl<$Res,
        _$_ReservationDateRangeReqModel>
    implements _$$_ReservationDateRangeReqModelCopyWith<$Res> {
  __$$_ReservationDateRangeReqModelCopyWithImpl(
      _$_ReservationDateRangeReqModel _value,
      $Res Function(_$_ReservationDateRangeReqModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStartDate = null,
    Object? searchEndDate = null,
  }) {
    return _then(_$_ReservationDateRangeReqModel(
      searchStartDate: null == searchStartDate
          ? _value.searchStartDate
          : searchStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchEndDate: null == searchEndDate
          ? _value.searchEndDate
          : searchEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ReservationDateRangeReqModel implements _ReservationDateRangeReqModel {
  _$_ReservationDateRangeReqModel(
      {required this.searchStartDate, required this.searchEndDate});

  @override
  final DateTime searchStartDate;
  @override
  final DateTime searchEndDate;

  @override
  String toString() {
    return 'ReservationDateRangeReqModel(searchStartDate: $searchStartDate, searchEndDate: $searchEndDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationDateRangeReqModel &&
            (identical(other.searchStartDate, searchStartDate) ||
                other.searchStartDate == searchStartDate) &&
            (identical(other.searchEndDate, searchEndDate) ||
                other.searchEndDate == searchEndDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchStartDate, searchEndDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationDateRangeReqModelCopyWith<_$_ReservationDateRangeReqModel>
      get copyWith => __$$_ReservationDateRangeReqModelCopyWithImpl<
          _$_ReservationDateRangeReqModel>(this, _$identity);
}

abstract class _ReservationDateRangeReqModel
    implements ReservationDateRangeReqModel {
  factory _ReservationDateRangeReqModel(
      {required final DateTime searchStartDate,
      required final DateTime searchEndDate}) = _$_ReservationDateRangeReqModel;

  @override
  DateTime get searchStartDate;
  @override
  DateTime get searchEndDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationDateRangeReqModelCopyWith<_$_ReservationDateRangeReqModel>
      get copyWith => throw _privateConstructorUsedError;
}
