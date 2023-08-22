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
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
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
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
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
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
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
  $Res call({int page, ReservationFilterType filterType});
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
    Object? filterType = null,
  }) {
    return _then(_$ReservationCheckFilterListEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
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
      {required this.page, required this.filterType});

  @override
  final int page;
  @override
  final ReservationFilterType filterType;

  @override
  String toString() {
    return 'ReservationCheckEvent.filterList(page: $page, filterType: $filterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckFilterListEvent &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, filterType);

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
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) {
    return filterList(page, filterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) {
    return filterList?.call(page, filterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
    required TResult orElse(),
  }) {
    if (filterList != null) {
      return filterList(page, filterType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) {
    return filterList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) {
    return filterList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
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
          required final ReservationFilterType filterType}) =
      _$ReservationCheckFilterListEvent;

  int get page;
  ReservationFilterType get filterType;
  @JsonKey(ignore: true)
  _$$ReservationCheckFilterListEventCopyWith<_$ReservationCheckFilterListEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservationCheckLoadNextDataEventCopyWith<$Res> {
  factory _$$ReservationCheckLoadNextDataEventCopyWith(
          _$ReservationCheckLoadNextDataEvent value,
          $Res Function(_$ReservationCheckLoadNextDataEvent) then) =
      __$$ReservationCheckLoadNextDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationCheckLoadNextDataEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckLoadNextDataEvent>
    implements _$$ReservationCheckLoadNextDataEventCopyWith<$Res> {
  __$$ReservationCheckLoadNextDataEventCopyWithImpl(
      _$ReservationCheckLoadNextDataEvent _value,
      $Res Function(_$ReservationCheckLoadNextDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationCheckLoadNextDataEvent
    implements ReservationCheckLoadNextDataEvent {
  const _$ReservationCheckLoadNextDataEvent();

  @override
  String toString() {
    return 'ReservationCheckEvent.loadNextData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckLoadNextDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) {
    return loadNextData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) {
    return loadNextData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
    required TResult orElse(),
  }) {
    if (loadNextData != null) {
      return loadNextData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) {
    return loadNextData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) {
    return loadNextData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
    required TResult orElse(),
  }) {
    if (loadNextData != null) {
      return loadNextData(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckLoadNextDataEvent
    implements ReservationCheckEvent {
  const factory ReservationCheckLoadNextDataEvent() =
      _$ReservationCheckLoadNextDataEvent;
}

/// @nodoc
abstract class _$$ReservationCheckChangeFilterEventCopyWith<$Res> {
  factory _$$ReservationCheckChangeFilterEventCopyWith(
          _$ReservationCheckChangeFilterEvent value,
          $Res Function(_$ReservationCheckChangeFilterEvent) then) =
      __$$ReservationCheckChangeFilterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ReservationFilterType filterType});
}

/// @nodoc
class __$$ReservationCheckChangeFilterEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckChangeFilterEvent>
    implements _$$ReservationCheckChangeFilterEventCopyWith<$Res> {
  __$$ReservationCheckChangeFilterEventCopyWithImpl(
      _$ReservationCheckChangeFilterEvent _value,
      $Res Function(_$ReservationCheckChangeFilterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterType = null,
  }) {
    return _then(_$ReservationCheckChangeFilterEvent(
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as ReservationFilterType,
    ));
  }
}

/// @nodoc

class _$ReservationCheckChangeFilterEvent
    implements ReservationCheckChangeFilterEvent {
  const _$ReservationCheckChangeFilterEvent({required this.filterType});

  @override
  final ReservationFilterType filterType;

  @override
  String toString() {
    return 'ReservationCheckEvent.changeFilter(filterType: $filterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckChangeFilterEvent &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationCheckChangeFilterEventCopyWith<
          _$ReservationCheckChangeFilterEvent>
      get copyWith => __$$ReservationCheckChangeFilterEventCopyWithImpl<
          _$ReservationCheckChangeFilterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) {
    return changeFilter(filterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) {
    return changeFilter?.call(filterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(filterType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) {
    return changeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) {
    return changeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckChangeFilterEvent
    implements ReservationCheckEvent {
  const factory ReservationCheckChangeFilterEvent(
          {required final ReservationFilterType filterType}) =
      _$ReservationCheckChangeFilterEvent;

  ReservationFilterType get filterType;
  @JsonKey(ignore: true)
  _$$ReservationCheckChangeFilterEventCopyWith<
          _$ReservationCheckChangeFilterEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservationCheckRefreshEventCopyWith<$Res> {
  factory _$$ReservationCheckRefreshEventCopyWith(
          _$ReservationCheckRefreshEvent value,
          $Res Function(_$ReservationCheckRefreshEvent) then) =
      __$$ReservationCheckRefreshEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationCheckRefreshEventCopyWithImpl<$Res>
    extends _$ReservationCheckEventCopyWithImpl<$Res,
        _$ReservationCheckRefreshEvent>
    implements _$$ReservationCheckRefreshEventCopyWith<$Res> {
  __$$ReservationCheckRefreshEventCopyWithImpl(
      _$ReservationCheckRefreshEvent _value,
      $Res Function(_$ReservationCheckRefreshEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationCheckRefreshEvent implements ReservationCheckRefreshEvent {
  const _$ReservationCheckRefreshEvent();

  @override
  String toString() {
    return 'ReservationCheckEvent.refreshList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckRefreshEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page, ReservationFilterType filterType)
        filterList,
    required TResult Function() loadNextData,
    required TResult Function(ReservationFilterType filterType) changeFilter,
    required TResult Function() refreshList,
  }) {
    return refreshList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page, ReservationFilterType filterType)? filterList,
    TResult? Function()? loadNextData,
    TResult? Function(ReservationFilterType filterType)? changeFilter,
    TResult? Function()? refreshList,
  }) {
    return refreshList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page, ReservationFilterType filterType)? filterList,
    TResult Function()? loadNextData,
    TResult Function(ReservationFilterType filterType)? changeFilter,
    TResult Function()? refreshList,
    required TResult orElse(),
  }) {
    if (refreshList != null) {
      return refreshList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCheckInitEvent value) init,
    required TResult Function(ReservationCheckFilterListEvent value) filterList,
    required TResult Function(ReservationCheckLoadNextDataEvent value)
        loadNextData,
    required TResult Function(ReservationCheckChangeFilterEvent value)
        changeFilter,
    required TResult Function(ReservationCheckRefreshEvent value) refreshList,
  }) {
    return refreshList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCheckInitEvent value)? init,
    TResult? Function(ReservationCheckFilterListEvent value)? filterList,
    TResult? Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult? Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult? Function(ReservationCheckRefreshEvent value)? refreshList,
  }) {
    return refreshList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCheckInitEvent value)? init,
    TResult Function(ReservationCheckFilterListEvent value)? filterList,
    TResult Function(ReservationCheckLoadNextDataEvent value)? loadNextData,
    TResult Function(ReservationCheckChangeFilterEvent value)? changeFilter,
    TResult Function(ReservationCheckRefreshEvent value)? refreshList,
    required TResult orElse(),
  }) {
    if (refreshList != null) {
      return refreshList(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckRefreshEvent implements ReservationCheckEvent {
  const factory ReservationCheckRefreshEvent() = _$ReservationCheckRefreshEvent;
}

/// @nodoc
mixin _$ReservationCheckState {
  ReservationFilterListStatus get filterListStatus =>
      throw _privateConstructorUsedError;
  List<ReservationFilterModel> get reservationList =>
      throw _privateConstructorUsedError;
  String? get filterListErrorMsg => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
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
      List<ReservationFilterModel> reservationList,
      String? filterListErrorMsg,
      bool hasNext,
      int totalCount,
      int offset,
      ReservationFilterType reservationFilterType});
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
    Object? reservationList = null,
    Object? filterListErrorMsg = freezed,
    Object? hasNext = null,
    Object? totalCount = null,
    Object? offset = null,
    Object? reservationFilterType = null,
  }) {
    return _then(_value.copyWith(
      filterListStatus: null == filterListStatus
          ? _value.filterListStatus
          : filterListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListStatus,
      reservationList: null == reservationList
          ? _value.reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationFilterModel>,
      filterListErrorMsg: freezed == filterListErrorMsg
          ? _value.filterListErrorMsg
          : filterListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      reservationFilterType: null == reservationFilterType
          ? _value.reservationFilterType
          : reservationFilterType // ignore: cast_nullable_to_non_nullable
              as ReservationFilterType,
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
      {ReservationFilterListStatus filterListStatus,
      List<ReservationFilterModel> reservationList,
      String? filterListErrorMsg,
      bool hasNext,
      int totalCount,
      int offset,
      ReservationFilterType reservationFilterType});
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
    Object? reservationList = null,
    Object? filterListErrorMsg = freezed,
    Object? hasNext = null,
    Object? totalCount = null,
    Object? offset = null,
    Object? reservationFilterType = null,
  }) {
    return _then(_$Initial(
      filterListStatus: null == filterListStatus
          ? _value.filterListStatus
          : filterListStatus // ignore: cast_nullable_to_non_nullable
              as ReservationFilterListStatus,
      reservationList: null == reservationList
          ? _value._reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationFilterModel>,
      filterListErrorMsg: freezed == filterListErrorMsg
          ? _value.filterListErrorMsg
          : filterListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
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
      final List<ReservationFilterModel> reservationList = const [],
      this.filterListErrorMsg = null,
      this.hasNext = false,
      this.totalCount = 0,
      this.offset = 0,
      this.reservationFilterType = ReservationFilterType.all})
      : _reservationList = reservationList;

  @override
  @JsonKey()
  final ReservationFilterListStatus filterListStatus;
  final List<ReservationFilterModel> _reservationList;
  @override
  @JsonKey()
  List<ReservationFilterModel> get reservationList {
    if (_reservationList is EqualUnmodifiableListView) return _reservationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationList);
  }

  @override
  @JsonKey()
  final String? filterListErrorMsg;
  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final ReservationFilterType reservationFilterType;

  @override
  String toString() {
    return 'ReservationCheckState(filterListStatus: $filterListStatus, reservationList: $reservationList, filterListErrorMsg: $filterListErrorMsg, hasNext: $hasNext, totalCount: $totalCount, offset: $offset, reservationFilterType: $reservationFilterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.filterListStatus, filterListStatus) ||
                other.filterListStatus == filterListStatus) &&
            const DeepCollectionEquality()
                .equals(other._reservationList, _reservationList) &&
            (identical(other.filterListErrorMsg, filterListErrorMsg) ||
                other.filterListErrorMsg == filterListErrorMsg) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.reservationFilterType, reservationFilterType) ||
                other.reservationFilterType == reservationFilterType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filterListStatus,
      const DeepCollectionEquality().hash(_reservationList),
      filterListErrorMsg,
      hasNext,
      totalCount,
      offset,
      reservationFilterType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationCheckState {
  const factory Initial(
      {final ReservationFilterListStatus filterListStatus,
      final List<ReservationFilterModel> reservationList,
      final String? filterListErrorMsg,
      final bool hasNext,
      final int totalCount,
      final int offset,
      final ReservationFilterType reservationFilterType}) = _$Initial;

  @override
  ReservationFilterListStatus get filterListStatus;
  @override
  List<ReservationFilterModel> get reservationList;
  @override
  String? get filterListErrorMsg;
  @override
  bool get hasNext;
  @override
  int get totalCount;
  @override
  int get offset;
  @override
  ReservationFilterType get reservationFilterType;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
