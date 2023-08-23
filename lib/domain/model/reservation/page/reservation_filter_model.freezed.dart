// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationFilterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get reservationTime => throw _privateConstructorUsedError;
  int get reservationCount => throw _privateConstructorUsedError;
  PartTime get partTime => throw _privateConstructorUsedError;
  bool get isAuthUser => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationFilterModelCopyWith<ReservationFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFilterModelCopyWith<$Res> {
  factory $ReservationFilterModelCopyWith(ReservationFilterModel value,
          $Res Function(ReservationFilterModel) then) =
      _$ReservationFilterModelCopyWithImpl<$Res, ReservationFilterModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String phoneNumber,
      String reservationTime,
      int reservationCount,
      PartTime partTime,
      bool isAuthUser,
      String? createdAt});
}

/// @nodoc
class _$ReservationFilterModelCopyWithImpl<$Res,
        $Val extends ReservationFilterModel>
    implements $ReservationFilterModelCopyWith<$Res> {
  _$ReservationFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? reservationTime = null,
    Object? reservationCount = null,
    Object? partTime = null,
    Object? isAuthUser = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      reservationTime: null == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String,
      reservationCount: null == reservationCount
          ? _value.reservationCount
          : reservationCount // ignore: cast_nullable_to_non_nullable
              as int,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationFilterModelCopyWith<$Res>
    implements $ReservationFilterModelCopyWith<$Res> {
  factory _$$_ReservationFilterModelCopyWith(_$_ReservationFilterModel value,
          $Res Function(_$_ReservationFilterModel) then) =
      __$$_ReservationFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String phoneNumber,
      String reservationTime,
      int reservationCount,
      PartTime partTime,
      bool isAuthUser,
      String? createdAt});
}

/// @nodoc
class __$$_ReservationFilterModelCopyWithImpl<$Res>
    extends _$ReservationFilterModelCopyWithImpl<$Res,
        _$_ReservationFilterModel>
    implements _$$_ReservationFilterModelCopyWith<$Res> {
  __$$_ReservationFilterModelCopyWithImpl(_$_ReservationFilterModel _value,
      $Res Function(_$_ReservationFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? reservationTime = null,
    Object? reservationCount = null,
    Object? partTime = null,
    Object? isAuthUser = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ReservationFilterModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      reservationTime: null == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String,
      reservationCount: null == reservationCount
          ? _value.reservationCount
          : reservationCount // ignore: cast_nullable_to_non_nullable
              as int,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      isAuthUser: null == isAuthUser
          ? _value.isAuthUser
          : isAuthUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReservationFilterModel implements _ReservationFilterModel {
  _$_ReservationFilterModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.reservationTime,
      required this.reservationCount,
      required this.partTime,
      required this.isAuthUser,
      this.createdAt});

  @override
  final int id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String reservationTime;
  @override
  final int reservationCount;
  @override
  final PartTime partTime;
  @override
  final bool isAuthUser;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ReservationFilterModel(id: $id, name: $name, phoneNumber: $phoneNumber, reservationTime: $reservationTime, reservationCount: $reservationCount, partTime: $partTime, isAuthUser: $isAuthUser, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationFilterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.reservationCount, reservationCount) ||
                other.reservationCount == reservationCount) &&
            (identical(other.partTime, partTime) ||
                other.partTime == partTime) &&
            (identical(other.isAuthUser, isAuthUser) ||
                other.isAuthUser == isAuthUser) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, phoneNumber,
      reservationTime, reservationCount, partTime, isAuthUser, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationFilterModelCopyWith<_$_ReservationFilterModel> get copyWith =>
      __$$_ReservationFilterModelCopyWithImpl<_$_ReservationFilterModel>(
          this, _$identity);
}

abstract class _ReservationFilterModel implements ReservationFilterModel {
  factory _ReservationFilterModel(
      {required final int id,
      required final String name,
      required final String phoneNumber,
      required final String reservationTime,
      required final int reservationCount,
      required final PartTime partTime,
      required final bool isAuthUser,
      final String? createdAt}) = _$_ReservationFilterModel;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get reservationTime;
  @override
  int get reservationCount;
  @override
  PartTime get partTime;
  @override
  bool get isAuthUser;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationFilterModelCopyWith<_$_ReservationFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
