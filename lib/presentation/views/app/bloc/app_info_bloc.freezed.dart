// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInfoGetEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInfoGetEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInfoGetEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoEventCopyWith<$Res> {
  factory $AppInfoEventCopyWith(
          AppInfoEvent value, $Res Function(AppInfoEvent) then) =
      _$AppInfoEventCopyWithImpl<$Res, AppInfoEvent>;
}

/// @nodoc
class _$AppInfoEventCopyWithImpl<$Res, $Val extends AppInfoEvent>
    implements $AppInfoEventCopyWith<$Res> {
  _$AppInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppInfoGetEventCopyWith<$Res> {
  factory _$$AppInfoGetEventCopyWith(
          _$AppInfoGetEvent value, $Res Function(_$AppInfoGetEvent) then) =
      __$$AppInfoGetEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInfoGetEventCopyWithImpl<$Res>
    extends _$AppInfoEventCopyWithImpl<$Res, _$AppInfoGetEvent>
    implements _$$AppInfoGetEventCopyWith<$Res> {
  __$$AppInfoGetEventCopyWithImpl(
      _$AppInfoGetEvent _value, $Res Function(_$AppInfoGetEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppInfoGetEvent implements AppInfoGetEvent {
  const _$AppInfoGetEvent();

  @override
  String toString() {
    return 'AppInfoEvent.get()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInfoGetEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInfoGetEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInfoGetEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInfoGetEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class AppInfoGetEvent implements AppInfoEvent {
  const factory AppInfoGetEvent() = _$AppInfoGetEvent;
}

/// @nodoc
mixin _$AppInfoState {
  PackageInfo? get appInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppInfoStateCopyWith<AppInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoStateCopyWith<$Res> {
  factory $AppInfoStateCopyWith(
          AppInfoState value, $Res Function(AppInfoState) then) =
      _$AppInfoStateCopyWithImpl<$Res, AppInfoState>;
  @useResult
  $Res call({PackageInfo? appInfo});
}

/// @nodoc
class _$AppInfoStateCopyWithImpl<$Res, $Val extends AppInfoState>
    implements $AppInfoStateCopyWith<$Res> {
  _$AppInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appInfo = freezed,
  }) {
    return _then(_value.copyWith(
      appInfo: freezed == appInfo
          ? _value.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PackageInfo? appInfo});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$AppInfoStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appInfo = freezed,
  }) {
    return _then(_$Initial(
      appInfo: freezed == appInfo
          ? _value.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({this.appInfo = null});

  @override
  @JsonKey()
  final PackageInfo? appInfo;

  @override
  String toString() {
    return 'AppInfoState(appInfo: $appInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements AppInfoState {
  const factory Initial({final PackageInfo? appInfo}) = _$Initial;

  @override
  PackageInfo? get appInfo;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
