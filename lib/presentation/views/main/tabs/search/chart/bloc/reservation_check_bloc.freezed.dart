// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_check_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationCheckEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNonAuthList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNonAuthList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNonAuthList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckGetNonAuthListEvent value)
        getNonAuthList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckGetNonAuthListEvent value)?
        getNonAuthList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckGetNonAuthListEvent value)? getNonAuthList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCheckEventCopyWith<$Res> {
  factory $ReservationCheckEventCopyWith(ReservationCheckEvent value,
          $Res Function(ReservationCheckEvent) then) =
      _$ReservationCheckEventCopyWithImpl<$Res, ReservationCheckEvent>;
}

/// @nodoc
class _$ReservationCheckEventCopyWithImpl<$Res,
        $Val extends ReservationCheckEvent>
    implements $ReservationCheckEventCopyWith<$Res> {
  _$ReservationCheckEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReservationCheckGetNonAuthListEventCopyWith<$Res> {
  factory _$$ReservationCheckGetNonAuthListEventCopyWith(
          _$ReservationCheckGetNonAuthListEvent value,
          $Res Function(_$ReservationCheckGetNonAuthListEvent) then) =
      __$$ReservationCheckGetNonAuthListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationCheckGetNonAuthListEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckGetNonAuthListEvent>
    implements _$$ReservationCheckGetNonAuthListEventCopyWith<$Res> {
  __$$ReservationCheckGetNonAuthListEventCopyWithImpl(
      _$ReservationCheckGetNonAuthListEvent _value,
      $Res Function(_$ReservationCheckGetNonAuthListEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationCheckGetNonAuthListEvent
    implements ReservationCheckGetNonAuthListEvent {
  const _$ReservationCheckGetNonAuthListEvent();

  @override
  String toString() {
    return 'ReservationCheckEvent.getNonAuthList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckGetNonAuthListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNonAuthList,
  }) {
    return getNonAuthList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNonAuthList,
  }) {
    return getNonAuthList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNonAuthList,
    required TResult orElse(),
  }) {
    if (getNonAuthList != null) {
      return getNonAuthList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckGetNonAuthListEvent value)
        getNonAuthList,
  }) {
    return getNonAuthList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckGetNonAuthListEvent value)?
        getNonAuthList,
  }) {
    return getNonAuthList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckGetNonAuthListEvent value)? getNonAuthList,
    required TResult orElse(),
  }) {
    if (getNonAuthList != null) {
      return getNonAuthList(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckGetNonAuthListEvent
    implements ReservationCheckEvent {
  const factory ReservationCheckGetNonAuthListEvent() =
      _$ReservationCheckGetNonAuthListEvent;
}

/// @nodoc
mixin _$ReservationCheckState {
  ReservationNonAuthListStatus get reservationNonAuthListStatus =>
      throw _privateConstructorUsedError;
  List<ReservationNonAuthModel> get reservationNonAuthList =>
      throw _privateConstructorUsedError;
  String? get nonAuthErrorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationCheckStateCopyWith<ReservationCheckState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCheckStateCopyWith<$Res> {
  factory $ReservationCheckStateCopyWith(ReservationCheckState value,
          $Res Function(ReservationCheckState) then) =
      _$ReservationCheckStateCopyWithImpl<$Res, ReservationCheckState>;
  @useResult
  $Res call(
      {ReservationNonAuthListStatus reservationNonAuthListStatus,
      List<ReservationNonAuthModel> reservationNonAuthList,
      String? nonAuthErrorMsg});
}

/// @nodoc
class _$ReservationCheckStateCopyWithImpl<$Res,
        $Val extends ReservationCheckState>
    implements $ReservationCheckStateCopyWith<$Res> {
  _$ReservationCheckStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationNonAuthListStatus = null,
    Object? reservationNonAuthList = null,
    Object? nonAuthErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      reservationNonAuthListStatus: null == reservationNonAuthListStatus
          ? _value.reservationNonAuthListStatus
          : reservationNonAuthListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationNonAuthListStatus,
      reservationNonAuthList: null == reservationNonAuthList
          ? _value.reservationNonAuthList
          : reservationNonAuthList // ignore: cast_nullable_to_non_nullable
              as List<ReservationNonAuthModel>,
      nonAuthErrorMsg: freezed == nonAuthErrorMsg
          ? _value.nonAuthErrorMsg
          : nonAuthErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $ReservationCheckStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReservationNonAuthListStatus reservationNonAuthListStatus,
      List<ReservationNonAuthModel> reservationNonAuthList,
      String? nonAuthErrorMsg});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ReservationCheckStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationNonAuthListStatus = null,
    Object? reservationNonAuthList = null,
    Object? nonAuthErrorMsg = freezed,
  }) {
    return _then(_$Initial(
      reservationNonAuthListStatus: null == reservationNonAuthListStatus
          ? _value.reservationNonAuthListStatus
          : reservationNonAuthListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationNonAuthListStatus,
      reservationNonAuthList: null == reservationNonAuthList
          ? _value._reservationNonAuthList
          : reservationNonAuthList // ignore: cast_nullable_to_non_nullable
              as List<ReservationNonAuthModel>,
      nonAuthErrorMsg: freezed == nonAuthErrorMsg
          ? _value.nonAuthErrorMsg
          : nonAuthErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.reservationNonAuthListStatus = ReservationNonAuthListStatus.initial,
      final List<ReservationNonAuthModel> reservationNonAuthList = const [],
      this.nonAuthErrorMsg = null})
      : _reservationNonAuthList = reservationNonAuthList;

  @override
  @JsonKey()
  final ReservationNonAuthListStatus reservationNonAuthListStatus;
  final List<ReservationNonAuthModel> _reservationNonAuthList;
  @override
  @JsonKey()
  List<ReservationNonAuthModel> get reservationNonAuthList {
    if (_reservationNonAuthList is EqualUnmodifiableListView)
      return _reservationNonAuthList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationNonAuthList);
  }

  @override
  @JsonKey()
  final String? nonAuthErrorMsg;

  @override
  String toString() {
    return 'ReservationCheckState(reservationNonAuthListStatus: $reservationNonAuthListStatus, reservationNonAuthList: $reservationNonAuthList, nonAuthErrorMsg: $nonAuthErrorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.reservationNonAuthListStatus,
                    reservationNonAuthListStatus) ||
                other.reservationNonAuthListStatus ==
                    reservationNonAuthListStatus) &&
            const DeepCollectionEquality().equals(
                other._reservationNonAuthList, _reservationNonAuthList) &&
            (identical(other.nonAuthErrorMsg, nonAuthErrorMsg) ||
                other.nonAuthErrorMsg == nonAuthErrorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reservationNonAuthListStatus,
      const DeepCollectionEquality().hash(_reservationNonAuthList),
      nonAuthErrorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationCheckState {
  const factory Initial(
      {final ReservationNonAuthListStatus reservationNonAuthListStatus,
      final List<ReservationNonAuthModel> reservationNonAuthList,
      final String? nonAuthErrorMsg}) = _$Initial;

  @override
  ReservationNonAuthListStatus get reservationNonAuthListStatus;
  @override
  List<ReservationNonAuthModel> get reservationNonAuthList;
  @override
  String? get nonAuthErrorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
