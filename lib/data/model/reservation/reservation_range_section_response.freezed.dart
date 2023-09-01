// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_range_section_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationRangeSectionResponse _$ReservationRangeSectionResponseFromJson(
    Map<String, dynamic> json) {
  return _ReservationRangeSectionResponse.fromJson(json);
}

/// @nodoc
mixin _$ReservationRangeSectionResponse {
  String get sectionTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeType')
  PartTime get partTime => throw _privateConstructorUsedError;
  List<ReservationRangeSectionDataResponse> get list =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationRangeSectionResponseCopyWith<ReservationRangeSectionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationRangeSectionResponseCopyWith<$Res> {
  factory $ReservationRangeSectionResponseCopyWith(
          ReservationRangeSectionResponse value,
          $Res Function(ReservationRangeSectionResponse) then) =
      _$ReservationRangeSectionResponseCopyWithImpl<$Res,
          ReservationRangeSectionResponse>;
  @useResult
  $Res call(
      {String sectionTitle,
      @JsonKey(name: 'timeType') PartTime partTime,
      List<ReservationRangeSectionDataResponse> list});
}

/// @nodoc
class _$ReservationRangeSectionResponseCopyWithImpl<$Res,
        $Val extends ReservationRangeSectionResponse>
    implements $ReservationRangeSectionResponseCopyWith<$Res> {
  _$ReservationRangeSectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionTitle = null,
    Object? partTime = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      sectionTitle: null == sectionTitle
          ? _value.sectionTitle
          : sectionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReservationRangeSectionDataResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationRangeSectionResponseCopyWith<$Res>
    implements $ReservationRangeSectionResponseCopyWith<$Res> {
  factory _$$_ReservationRangeSectionResponseCopyWith(
          _$_ReservationRangeSectionResponse value,
          $Res Function(_$_ReservationRangeSectionResponse) then) =
      __$$_ReservationRangeSectionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sectionTitle,
      @JsonKey(name: 'timeType') PartTime partTime,
      List<ReservationRangeSectionDataResponse> list});
}

/// @nodoc
class __$$_ReservationRangeSectionResponseCopyWithImpl<$Res>
    extends _$ReservationRangeSectionResponseCopyWithImpl<$Res,
        _$_ReservationRangeSectionResponse>
    implements _$$_ReservationRangeSectionResponseCopyWith<$Res> {
  __$$_ReservationRangeSectionResponseCopyWithImpl(
      _$_ReservationRangeSectionResponse _value,
      $Res Function(_$_ReservationRangeSectionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionTitle = null,
    Object? partTime = null,
    Object? list = null,
  }) {
    return _then(_$_ReservationRangeSectionResponse(
      sectionTitle: null == sectionTitle
          ? _value.sectionTitle
          : sectionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as PartTime,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReservationRangeSectionDataResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationRangeSectionResponse
    implements _ReservationRangeSectionResponse {
  _$_ReservationRangeSectionResponse(
      {required this.sectionTitle,
      @JsonKey(name: 'timeType') required this.partTime,
      required final List<ReservationRangeSectionDataResponse> list})
      : _list = list;

  factory _$_ReservationRangeSectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReservationRangeSectionResponseFromJson(json);

  @override
  final String sectionTitle;
  @override
  @JsonKey(name: 'timeType')
  final PartTime partTime;
  final List<ReservationRangeSectionDataResponse> _list;
  @override
  List<ReservationRangeSectionDataResponse> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ReservationRangeSectionResponse(sectionTitle: $sectionTitle, partTime: $partTime, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationRangeSectionResponse &&
            (identical(other.sectionTitle, sectionTitle) ||
                other.sectionTitle == sectionTitle) &&
            (identical(other.partTime, partTime) ||
                other.partTime == partTime) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sectionTitle, partTime,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationRangeSectionResponseCopyWith<
          _$_ReservationRangeSectionResponse>
      get copyWith => __$$_ReservationRangeSectionResponseCopyWithImpl<
          _$_ReservationRangeSectionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationRangeSectionResponseToJson(
      this,
    );
  }
}

abstract class _ReservationRangeSectionResponse
    implements ReservationRangeSectionResponse {
  factory _ReservationRangeSectionResponse(
          {required final String sectionTitle,
          @JsonKey(name: 'timeType') required final PartTime partTime,
          required final List<ReservationRangeSectionDataResponse> list}) =
      _$_ReservationRangeSectionResponse;

  factory _ReservationRangeSectionResponse.fromJson(Map<String, dynamic> json) =
      _$_ReservationRangeSectionResponse.fromJson;

  @override
  String get sectionTitle;
  @override
  @JsonKey(name: 'timeType')
  PartTime get partTime;
  @override
  List<ReservationRangeSectionDataResponse> get list;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationRangeSectionResponseCopyWith<
          _$_ReservationRangeSectionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
