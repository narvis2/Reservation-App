// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_filter_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationFilterListResponse _$ReservationFilterListResponseFromJson(
    Map<String, dynamic> json) {
  return _ReservationFilterListResponse.fromJson(json);
}

/// @nodoc
mixin _$ReservationFilterListResponse {
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  List<ReservationFilterResponse> get reservationList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationFilterListResponseCopyWith<ReservationFilterListResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFilterListResponseCopyWith<$Res> {
  factory $ReservationFilterListResponseCopyWith(
          ReservationFilterListResponse value,
          $Res Function(ReservationFilterListResponse) then) =
      _$ReservationFilterListResponseCopyWithImpl<$Res,
          ReservationFilterListResponse>;
  @useResult
  $Res call(
      {int totalCount,
      int totalPages,
      bool hasNext,
      List<ReservationFilterResponse> reservationList});
}

/// @nodoc
class _$ReservationFilterListResponseCopyWithImpl<$Res,
        $Val extends ReservationFilterListResponse>
    implements $ReservationFilterListResponseCopyWith<$Res> {
  _$ReservationFilterListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? reservationList = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationList: null == reservationList
          ? _value.reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationFilterResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationFilterListResponseCopyWith<$Res>
    implements $ReservationFilterListResponseCopyWith<$Res> {
  factory _$$_ReservationFilterListResponseCopyWith(
          _$_ReservationFilterListResponse value,
          $Res Function(_$_ReservationFilterListResponse) then) =
      __$$_ReservationFilterListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCount,
      int totalPages,
      bool hasNext,
      List<ReservationFilterResponse> reservationList});
}

/// @nodoc
class __$$_ReservationFilterListResponseCopyWithImpl<$Res>
    extends _$ReservationFilterListResponseCopyWithImpl<$Res,
        _$_ReservationFilterListResponse>
    implements _$$_ReservationFilterListResponseCopyWith<$Res> {
  __$$_ReservationFilterListResponseCopyWithImpl(
      _$_ReservationFilterListResponse _value,
      $Res Function(_$_ReservationFilterListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? reservationList = null,
  }) {
    return _then(_$_ReservationFilterListResponse(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationList: null == reservationList
          ? _value._reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationFilterResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationFilterListResponse
    implements _ReservationFilterListResponse {
  _$_ReservationFilterListResponse(
      {required this.totalCount,
      required this.totalPages,
      required this.hasNext,
      required final List<ReservationFilterResponse> reservationList})
      : _reservationList = reservationList;

  factory _$_ReservationFilterListResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReservationFilterListResponseFromJson(json);

  @override
  final int totalCount;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  final List<ReservationFilterResponse> _reservationList;
  @override
  List<ReservationFilterResponse> get reservationList {
    if (_reservationList is EqualUnmodifiableListView) return _reservationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationList);
  }

  @override
  String toString() {
    return 'ReservationFilterListResponse(totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, reservationList: $reservationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationFilterListResponse &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            const DeepCollectionEquality()
                .equals(other._reservationList, _reservationList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPages, hasNext,
      const DeepCollectionEquality().hash(_reservationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationFilterListResponseCopyWith<_$_ReservationFilterListResponse>
      get copyWith => __$$_ReservationFilterListResponseCopyWithImpl<
          _$_ReservationFilterListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationFilterListResponseToJson(
      this,
    );
  }
}

abstract class _ReservationFilterListResponse
    implements ReservationFilterListResponse {
  factory _ReservationFilterListResponse(
          {required final int totalCount,
          required final int totalPages,
          required final bool hasNext,
          required final List<ReservationFilterResponse> reservationList}) =
      _$_ReservationFilterListResponse;

  factory _ReservationFilterListResponse.fromJson(Map<String, dynamic> json) =
      _$_ReservationFilterListResponse.fromJson;

  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  bool get hasNext;
  @override
  List<ReservationFilterResponse> get reservationList;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationFilterListResponseCopyWith<_$_ReservationFilterListResponse>
      get copyWith => throw _privateConstructorUsedError;
}
