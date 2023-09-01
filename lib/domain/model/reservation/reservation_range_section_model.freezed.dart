// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_range_section_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationRangeSectionModel {
  String get sectionTitle => throw _privateConstructorUsedError;
  PartTime get partTime => throw _privateConstructorUsedError;
  List<ReservationRangeSectionDataModel> get list =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationRangeSectionModelCopyWith<ReservationRangeSectionModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationRangeSectionModelCopyWith<$Res> {
  factory $ReservationRangeSectionModelCopyWith(
          ReservationRangeSectionModel value,
          $Res Function(ReservationRangeSectionModel) then) =
      _$ReservationRangeSectionModelCopyWithImpl<$Res,
          ReservationRangeSectionModel>;
  @useResult
  $Res call(
      {String sectionTitle,
      PartTime partTime,
      List<ReservationRangeSectionDataModel> list});
}

/// @nodoc
class _$ReservationRangeSectionModelCopyWithImpl<$Res,
        $Val extends ReservationRangeSectionModel>
    implements $ReservationRangeSectionModelCopyWith<$Res> {
  _$ReservationRangeSectionModelCopyWithImpl(this._value, this._then);

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
              as List<ReservationRangeSectionDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationRangeSectionModelCopyWith<$Res>
    implements $ReservationRangeSectionModelCopyWith<$Res> {
  factory _$$_ReservationRangeSectionModelCopyWith(
          _$_ReservationRangeSectionModel value,
          $Res Function(_$_ReservationRangeSectionModel) then) =
      __$$_ReservationRangeSectionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sectionTitle,
      PartTime partTime,
      List<ReservationRangeSectionDataModel> list});
}

/// @nodoc
class __$$_ReservationRangeSectionModelCopyWithImpl<$Res>
    extends _$ReservationRangeSectionModelCopyWithImpl<$Res,
        _$_ReservationRangeSectionModel>
    implements _$$_ReservationRangeSectionModelCopyWith<$Res> {
  __$$_ReservationRangeSectionModelCopyWithImpl(
      _$_ReservationRangeSectionModel _value,
      $Res Function(_$_ReservationRangeSectionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionTitle = null,
    Object? partTime = null,
    Object? list = null,
  }) {
    return _then(_$_ReservationRangeSectionModel(
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
              as List<ReservationRangeSectionDataModel>,
    ));
  }
}

/// @nodoc

class _$_ReservationRangeSectionModel implements _ReservationRangeSectionModel {
  _$_ReservationRangeSectionModel(
      {required this.sectionTitle,
      required this.partTime,
      required final List<ReservationRangeSectionDataModel> list})
      : _list = list;

  @override
  final String sectionTitle;
  @override
  final PartTime partTime;
  final List<ReservationRangeSectionDataModel> _list;
  @override
  List<ReservationRangeSectionDataModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ReservationRangeSectionModel(sectionTitle: $sectionTitle, partTime: $partTime, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationRangeSectionModel &&
            (identical(other.sectionTitle, sectionTitle) ||
                other.sectionTitle == sectionTitle) &&
            (identical(other.partTime, partTime) ||
                other.partTime == partTime) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sectionTitle, partTime,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationRangeSectionModelCopyWith<_$_ReservationRangeSectionModel>
      get copyWith => __$$_ReservationRangeSectionModelCopyWithImpl<
          _$_ReservationRangeSectionModel>(this, _$identity);
}

abstract class _ReservationRangeSectionModel
    implements ReservationRangeSectionModel {
  factory _ReservationRangeSectionModel(
          {required final String sectionTitle,
          required final PartTime partTime,
          required final List<ReservationRangeSectionDataModel> list}) =
      _$_ReservationRangeSectionModel;

  @override
  String get sectionTitle;
  @override
  PartTime get partTime;
  @override
  List<ReservationRangeSectionDataModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationRangeSectionModelCopyWith<_$_ReservationRangeSectionModel>
      get copyWith => throw _privateConstructorUsedError;
}
