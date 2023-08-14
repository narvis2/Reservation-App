// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_filter_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationFilterListModel {
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  List<ReservationFilterModel> get reservationList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationFilterListModelCopyWith<ReservationFilterListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFilterListModelCopyWith<$Res> {
  factory $ReservationFilterListModelCopyWith(ReservationFilterListModel value,
          $Res Function(ReservationFilterListModel) then) =
      _$ReservationFilterListModelCopyWithImpl<$Res,
          ReservationFilterListModel>;
  @useResult
  $Res call(
      {int totalCount,
      int totalPages,
      bool hasNext,
      List<ReservationFilterModel> reservationList});
}

/// @nodoc
class _$ReservationFilterListModelCopyWithImpl<$Res,
        $Val extends ReservationFilterListModel>
    implements $ReservationFilterListModelCopyWith<$Res> {
  _$ReservationFilterListModelCopyWithImpl(this._value, this._then);

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
              as List<ReservationFilterModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationFilterListModelCopyWith<$Res>
    implements $ReservationFilterListModelCopyWith<$Res> {
  factory _$$_ReservationFilterListModelCopyWith(
          _$_ReservationFilterListModel value,
          $Res Function(_$_ReservationFilterListModel) then) =
      __$$_ReservationFilterListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCount,
      int totalPages,
      bool hasNext,
      List<ReservationFilterModel> reservationList});
}

/// @nodoc
class __$$_ReservationFilterListModelCopyWithImpl<$Res>
    extends _$ReservationFilterListModelCopyWithImpl<$Res,
        _$_ReservationFilterListModel>
    implements _$$_ReservationFilterListModelCopyWith<$Res> {
  __$$_ReservationFilterListModelCopyWithImpl(
      _$_ReservationFilterListModel _value,
      $Res Function(_$_ReservationFilterListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? reservationList = null,
  }) {
    return _then(_$_ReservationFilterListModel(
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
              as List<ReservationFilterModel>,
    ));
  }
}

/// @nodoc

class _$_ReservationFilterListModel implements _ReservationFilterListModel {
  _$_ReservationFilterListModel(
      {required this.totalCount,
      required this.totalPages,
      required this.hasNext,
      required final List<ReservationFilterModel> reservationList})
      : _reservationList = reservationList;

  @override
  final int totalCount;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  final List<ReservationFilterModel> _reservationList;
  @override
  List<ReservationFilterModel> get reservationList {
    if (_reservationList is EqualUnmodifiableListView) return _reservationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationList);
  }

  @override
  String toString() {
    return 'ReservationFilterListModel(totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, reservationList: $reservationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationFilterListModel &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            const DeepCollectionEquality()
                .equals(other._reservationList, _reservationList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPages, hasNext,
      const DeepCollectionEquality().hash(_reservationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationFilterListModelCopyWith<_$_ReservationFilterListModel>
      get copyWith => __$$_ReservationFilterListModelCopyWithImpl<
          _$_ReservationFilterListModel>(this, _$identity);
}

abstract class _ReservationFilterListModel
    implements ReservationFilterListModel {
  factory _ReservationFilterListModel(
          {required final int totalCount,
          required final int totalPages,
          required final bool hasNext,
          required final List<ReservationFilterModel> reservationList}) =
      _$_ReservationFilterListModel;

  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  bool get hasNext;
  @override
  List<ReservationFilterModel> get reservationList;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationFilterListModelCopyWith<_$_ReservationFilterListModel>
      get copyWith => throw _privateConstructorUsedError;
}
