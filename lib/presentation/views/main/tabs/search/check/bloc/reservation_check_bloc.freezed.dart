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
    required TResult Function() init,
    required TResult Function(
            int page, int limit, ReservationFilterType filterType)
        filterList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
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
abstract class _$$ReservationCheckInitEventCopyWith<$Res> {
  factory _$$ReservationCheckInitEventCopyWith(
          _$ReservationCheckInitEvent value,
          $Res Function(_$ReservationCheckInitEvent) then) =
      __$$ReservationCheckInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationCheckInitEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckInitEvent>
    implements _$$ReservationCheckInitEventCopyWith<$Res> {
  __$$ReservationCheckInitEventCopyWithImpl(_$ReservationCheckInitEvent _value,
      $Res Function(_$ReservationCheckInitEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationCheckInitEvent implements ReservationCheckInitEvent {
  const _$ReservationCheckInitEvent();

  @override
  String toString() {
    return 'ReservationCheckEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int page, int limit, ReservationFilterType filterType)
        filterList,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckInitEvent implements ReservationCheckEvent {
  const factory ReservationCheckInitEvent() = _$ReservationCheckInitEvent;
}

/// @nodoc
abstract class _$$ReservationCheckFilterListEventCopyWith<$Res> {
  factory _$$ReservationCheckFilterListEventCopyWith(
          _$ReservationCheckFilterListEvent value,
          $Res Function(_$ReservationCheckFilterListEvent) then) =
      __$$ReservationCheckFilterListEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, ReservationFilterType filterType});
}

/// @nodoc
class __$$ReservationCheckFilterListEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckFilterListEvent>
    implements _$$ReservationCheckFilterListEventCopyWith<$Res> {
  __$$ReservationCheckFilterListEventCopyWithImpl(
      _$ReservationCheckFilterListEvent _value,
      $Res Function(_$ReservationCheckFilterListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? filterType = null,
  }) {
    return _then(_$ReservationCheckFilterListEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as ReservationFilterType,
    ));
  }
}

/// @nodoc

class _$ReservationCheckFilterListEvent
    implements ReservationCheckFilterListEvent {
  const _$ReservationCheckFilterListEvent(
      {required this.page, required this.limit, required this.filterType});

  @override
  final int page;
  @override
  final int limit;
  @override
  final ReservationFilterType filterType;

  @override
  String toString() {
    return 'ReservationCheckEvent.filterList(page: $page, limit: $limit, filterType: $filterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckFilterListEvent &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, filterType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationCheckFilterListEventCopyWith<_$ReservationCheckFilterListEvent>
      get copyWith => __$$ReservationCheckFilterListEventCopyWithImpl<
          _$ReservationCheckFilterListEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int page, int limit, ReservationFilterType filterType)
        filterList,
  }) {
    return filterList(page, limit, filterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
  }) {
    return filterList?.call(page, limit, filterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, int limit, ReservationFilterType filterType)?
        filterList,
    required TResult orElse(),
  }) {
    if (filterList != null) {
      return filterList(page, limit, filterType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
  }) {
    return filterList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
  }) {
    return filterList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    required TResult orElse(),
  }) {
    if (filterList != null) {
      return filterList(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckFilterListEvent
    implements ReservationCheckEvent {
  const factory ReservationCheckFilterListEvent(
          {required final int page,
          required final int limit,
          required final ReservationFilterType filterType}) =
      _$ReservationCheckFilterListEvent;

  int get page;
  int get limit;
  ReservationFilterType get filterType;
  @JsonKey(ignore: true)
  _$$ReservationCheckFilterListEventCopyWith<_$ReservationCheckFilterListEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationCheckState {
  ReservationFilterListStatus get filterListStatus =>
      throw _privateConstructorUsedError;
  ReservationFilterListModel? get reservationFilterListData =>
      throw _privateConstructorUsedError;
  String? get filterListErrorMsg => throw _privateConstructorUsedError;
  ReservationFilterType get reservationFilterType =>
      throw _privateConstructorUsedError;

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
      {ReservationFilterListStatus filterListStatus,
      ReservationFilterListModel? reservationFilterListData,
      String? filterListErrorMsg,
      ReservationFilterType reservationFilterType});

  $ReservationFilterListModelCopyWith<$Res>? get reservationFilterListData;
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
    Object? filterListStatus = null,
    Object? reservationFilterListData = freezed,
    Object? filterListErrorMsg = freezed,
    Object? reservationFilterType = null,
  }) {
    return _then(_value.copyWith(
      filterListStatus: null == filterListStatus
          ? _value.filterListStatus
          : filterListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListStatus,
      reservationFilterListData: freezed == reservationFilterListData
          ? _value.reservationFilterListData
          : reservationFilterListData // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListModel?,
      filterListErrorMsg: freezed == filterListErrorMsg
          ? _value.filterListErrorMsg
          : filterListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationFilterType: null == reservationFilterType
          ? _value.reservationFilterType
          : reservationFilterType // ignore: cast_nullable_to_non_nullable
              as ReservationFilterType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReservationFilterListModelCopyWith<$Res>? get reservationFilterListData {
    if (_value.reservationFilterListData == null) {
      return null;
    }

    return $ReservationFilterListModelCopyWith<$Res>(
        _value.reservationFilterListData!, (value) {
      return _then(_value.copyWith(reservationFilterListData: value) as $Val);
    });
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
      {ReservationFilterListStatus filterListStatus,
      ReservationFilterListModel? reservationFilterListData,
      String? filterListErrorMsg,
      ReservationFilterType reservationFilterType});

  @override
  $ReservationFilterListModelCopyWith<$Res>? get reservationFilterListData;
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
    Object? filterListStatus = null,
    Object? reservationFilterListData = freezed,
    Object? filterListErrorMsg = freezed,
    Object? reservationFilterType = null,
  }) {
    return _then(_$Initial(
      filterListStatus: null == filterListStatus
          ? _value.filterListStatus
          : filterListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListStatus,
      reservationFilterListData: freezed == reservationFilterListData
          ? _value.reservationFilterListData
          : reservationFilterListData // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListModel?,
      filterListErrorMsg: freezed == filterListErrorMsg
          ? _value.filterListErrorMsg
          : filterListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationFilterType: null == reservationFilterType
          ? _value.reservationFilterType
          : reservationFilterType // ignore: cast_nullable_to_non_nullable
              as ReservationFilterType,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.filterListStatus = ReservationFilterListStatus.initial,
      this.reservationFilterListData = null,
      this.filterListErrorMsg = null,
      this.reservationFilterType = ReservationFilterType.all});

  @override
  @JsonKey()
  final ReservationFilterListStatus filterListStatus;
  @override
  @JsonKey()
  final ReservationFilterListModel? reservationFilterListData;
  @override
  @JsonKey()
  final String? filterListErrorMsg;
  @override
  @JsonKey()
  final ReservationFilterType reservationFilterType;

  @override
  String toString() {
    return 'ReservationCheckState(filterListStatus: $filterListStatus, reservationFilterListData: $reservationFilterListData, filterListErrorMsg: $filterListErrorMsg, reservationFilterType: $reservationFilterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.filterListStatus, filterListStatus) ||
                other.filterListStatus == filterListStatus) &&
            (identical(other.reservationFilterListData,
                    reservationFilterListData) ||
                other.reservationFilterListData == reservationFilterListData) &&
            (identical(other.filterListErrorMsg, filterListErrorMsg) ||
                other.filterListErrorMsg == filterListErrorMsg) &&
            (identical(other.reservationFilterType, reservationFilterType) ||
                other.reservationFilterType == reservationFilterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterListStatus,
      reservationFilterListData, filterListErrorMsg, reservationFilterType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationCheckState {
  const factory Initial(
      {final ReservationFilterListStatus filterListStatus,
      final ReservationFilterListModel? reservationFilterListData,
      final String? filterListErrorMsg,
      final ReservationFilterType reservationFilterType}) = _$Initial;

  @override
  ReservationFilterListStatus get filterListStatus;
  @override
  ReservationFilterListModel? get reservationFilterListData;
  @override
  String? get filterListErrorMsg;
  @override
  ReservationFilterType get reservationFilterType;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
