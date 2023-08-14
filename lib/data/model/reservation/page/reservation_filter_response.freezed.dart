// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_filter_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationFilterResponse _$ReservationFilterResponseFromJson(
    Map<String, dynamic> json) {
  return _ReservationFilterResponse.fromJson(json);
}

/// @nodoc
mixin _$ReservationFilterResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get reservationDateTime => throw _privateConstructorUsedError;
  int get reservationCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeType')
  PartTime get partTime => throw _privateConstructorUsedError;
  String? get certificationNumber => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationFilterResponseCopyWith<ReservationFilterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFilterResponseCopyWith<$Res> {
  factory $ReservationFilterResponseCopyWith(ReservationFilterResponse value,
          $Res Function(ReservationFilterResponse) then) =
      _$ReservationFilterResponseCopyWithImpl<$Res, ReservationFilterResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      String phoneNumber,
      String reservationDateTime,
      int reservationCount,
      @JsonKey(name: 'timeType') PartTime partTime,
      String? certificationNumber,
      String? createdAt});
}

/// @nodoc
class _$ReservationFilterResponseCopyWithImpl<$Res,
        $Val extends ReservationFilterResponse>
    implements $ReservationFilterResponseCopyWith<$Res> {
  _$ReservationFilterResponseCopyWithImpl(this._value, this._then);

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
    Object? reservationDateTime = null,
    Object? reservationCount = null,
    Object? partTime = null,
    Object? certificationNumber = freezed,
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
      reservationDateTime: null == reservationDateTime
          ? _value.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      reservationCount: null == reservationCount
          ? _value.reservationCount
          : reservationCount // ignore: cast_nullable_to_non_nullable
              as int,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      certificationNumber: freezed == certificationNumber
          ? _value.certificationNumber
          : certificationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationFilterResponseCopyWith<$Res>
    implements $ReservationFilterResponseCopyWith<$Res> {
  factory _$$_ReservationFilterResponseCopyWith(
          _$_ReservationFilterResponse value,
          $Res Function(_$_ReservationFilterResponse) then) =
      __$$_ReservationFilterResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String phoneNumber,
      String reservationDateTime,
      int reservationCount,
      @JsonKey(name: 'timeType') PartTime partTime,
      String? certificationNumber,
      String? createdAt});
}

/// @nodoc
class __$$_ReservationFilterResponseCopyWithImpl<$Res>
    extends _$ReservationFilterResponseCopyWithImpl<$Res,
        _$_ReservationFilterResponse>
    implements _$$_ReservationFilterResponseCopyWith<$Res> {
  __$$_ReservationFilterResponseCopyWithImpl(
      _$_ReservationFilterResponse _value,
      $Res Function(_$_ReservationFilterResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? reservationDateTime = null,
    Object? reservationCount = null,
    Object? partTime = null,
    Object? certificationNumber = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ReservationFilterResponse(
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
      reservationDateTime: null == reservationDateTime
          ? _value.reservationDateTime
          : reservationDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      reservationCount: null == reservationCount
          ? _value.reservationCount
          : reservationCount // ignore: cast_nullable_to_non_nullable
              as int,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      certificationNumber: freezed == certificationNumber
          ? _value.certificationNumber
          : certificationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationFilterResponse implements _ReservationFilterResponse {
  _$_ReservationFilterResponse(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.reservationDateTime,
      required this.reservationCount,
      @JsonKey(name: 'timeType') required this.partTime,
      this.certificationNumber,
      this.createdAt});

  factory _$_ReservationFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFilterResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String reservationDateTime;
  @override
  final int reservationCount;
  @override
  @JsonKey(name: 'timeType')
  final PartTime partTime;
  @override
  final String? certificationNumber;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ReservationFilterResponse(id: $id, name: $name, phoneNumber: $phoneNumber, reservationDateTime: $reservationDateTime, reservationCount: $reservationCount, partTime: $partTime, certificationNumber: $certificationNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationFilterResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.reservationDateTime, reservationDateTime) ||
                other.reservationDateTime == reservationDateTime) &&
            (identical(other.reservationCount, reservationCount) ||
                other.reservationCount == reservationCount) &&
            (identical(other.partTime, partTime) ||
                other.partTime == partTime) &&
            (identical(other.certificationNumber, certificationNumber) ||
                other.certificationNumber == certificationNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phoneNumber,
      reservationDateTime,
      reservationCount,
      partTime,
      certificationNumber,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationFilterResponseCopyWith<_$_ReservationFilterResponse>
      get copyWith => __$$_ReservationFilterResponseCopyWithImpl<
          _$_ReservationFilterResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationFilterResponseToJson(
      this,
    );
  }
}

abstract class _ReservationFilterResponse implements ReservationFilterResponse {
  factory _ReservationFilterResponse(
      {required final int id,
      required final String name,
      required final String phoneNumber,
      required final String reservationDateTime,
      required final int reservationCount,
      @JsonKey(name: 'timeType') required final PartTime partTime,
      final String? certificationNumber,
      final String? createdAt}) = _$_ReservationFilterResponse;

  factory _ReservationFilterResponse.fromJson(Map<String, dynamic> json) =
      _$_ReservationFilterResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get reservationDateTime;
  @override
  int get reservationCount;
  @override
  @JsonKey(name: 'timeType')
  PartTime get partTime;
  @override
  String? get certificationNumber;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationFilterResponseCopyWith<_$_ReservationFilterResponse>
      get copyWith => throw _privateConstructorUsedError;
}
