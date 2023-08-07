// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isAutoLogin) setIsAutoLogin,
    required TResult Function(bool isEnablePush) setIsEnablePush,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isAutoLogin)? setIsAutoLogin,
    TResult? Function(bool isEnablePush)? setIsEnablePush,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isAutoLogin)? setIsAutoLogin,
    TResult Function(bool isEnablePush)? setIsEnablePush,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(UserInfoIsEnablePushEvent value) setIsEnablePush,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoEventCopyWith<$Res> {
  factory $UserInfoEventCopyWith(
          UserInfoEvent value, $Res Function(UserInfoEvent) then) =
      _$UserInfoEventCopyWithImpl<$Res, UserInfoEvent>;
}

/// @nodoc
class _$UserInfoEventCopyWithImpl<$Res, $Val extends UserInfoEvent>
    implements $UserInfoEventCopyWith<$Res> {
  _$UserInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserInfoInitEventCopyWith<$Res> {
  factory _$$UserInfoInitEventCopyWith(
          _$UserInfoInitEvent value, $Res Function(_$UserInfoInitEvent) then) =
      __$$UserInfoInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInfoInitEventCopyWithImpl<$Res>
    extends _$UserInfoEventCopyWithImpl<$Res, _$UserInfoInitEvent>
    implements _$$UserInfoInitEventCopyWith<$Res> {
  __$$UserInfoInitEventCopyWithImpl(
      _$UserInfoInitEvent _value, $Res Function(_$UserInfoInitEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserInfoInitEvent implements UserInfoInitEvent {
  const _$UserInfoInitEvent();

  @override
  String toString() {
    return 'UserInfoEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInfoInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isAutoLogin) setIsAutoLogin,
    required TResult Function(bool isEnablePush) setIsEnablePush,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isAutoLogin)? setIsAutoLogin,
    TResult? Function(bool isEnablePush)? setIsEnablePush,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isAutoLogin)? setIsAutoLogin,
    TResult Function(bool isEnablePush)? setIsEnablePush,
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
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(UserInfoIsEnablePushEvent value) setIsEnablePush,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class UserInfoInitEvent implements UserInfoEvent {
  const factory UserInfoInitEvent() = _$UserInfoInitEvent;
}

/// @nodoc
abstract class _$$UserInfoIsAutoLoginEventCopyWith<$Res> {
  factory _$$UserInfoIsAutoLoginEventCopyWith(_$UserInfoIsAutoLoginEvent value,
          $Res Function(_$UserInfoIsAutoLoginEvent) then) =
      __$$UserInfoIsAutoLoginEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAutoLogin});
}

/// @nodoc
class __$$UserInfoIsAutoLoginEventCopyWithImpl<$Res>
    extends _$UserInfoEventCopyWithImpl<$Res, _$UserInfoIsAutoLoginEvent>
    implements _$$UserInfoIsAutoLoginEventCopyWith<$Res> {
  __$$UserInfoIsAutoLoginEventCopyWithImpl(_$UserInfoIsAutoLoginEvent _value,
      $Res Function(_$UserInfoIsAutoLoginEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
  }) {
    return _then(_$UserInfoIsAutoLoginEvent(
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserInfoIsAutoLoginEvent implements UserInfoIsAutoLoginEvent {
  const _$UserInfoIsAutoLoginEvent({required this.isAutoLogin});

  @override
  final bool isAutoLogin;

  @override
  String toString() {
    return 'UserInfoEvent.setIsAutoLogin(isAutoLogin: $isAutoLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoIsAutoLoginEvent &&
            (identical(other.isAutoLogin, isAutoLogin) ||
                other.isAutoLogin == isAutoLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAutoLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoIsAutoLoginEventCopyWith<_$UserInfoIsAutoLoginEvent>
      get copyWith =>
          __$$UserInfoIsAutoLoginEventCopyWithImpl<_$UserInfoIsAutoLoginEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isAutoLogin) setIsAutoLogin,
    required TResult Function(bool isEnablePush) setIsEnablePush,
  }) {
    return setIsAutoLogin(isAutoLogin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isAutoLogin)? setIsAutoLogin,
    TResult? Function(bool isEnablePush)? setIsEnablePush,
  }) {
    return setIsAutoLogin?.call(isAutoLogin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isAutoLogin)? setIsAutoLogin,
    TResult Function(bool isEnablePush)? setIsEnablePush,
    required TResult orElse(),
  }) {
    if (setIsAutoLogin != null) {
      return setIsAutoLogin(isAutoLogin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(UserInfoIsEnablePushEvent value) setIsEnablePush,
  }) {
    return setIsAutoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
  }) {
    return setIsAutoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
    required TResult orElse(),
  }) {
    if (setIsAutoLogin != null) {
      return setIsAutoLogin(this);
    }
    return orElse();
  }
}

abstract class UserInfoIsAutoLoginEvent implements UserInfoEvent {
  const factory UserInfoIsAutoLoginEvent({required final bool isAutoLogin}) =
      _$UserInfoIsAutoLoginEvent;

  bool get isAutoLogin;
  @JsonKey(ignore: true)
  _$$UserInfoIsAutoLoginEventCopyWith<_$UserInfoIsAutoLoginEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserInfoIsEnablePushEventCopyWith<$Res> {
  factory _$$UserInfoIsEnablePushEventCopyWith(
          _$UserInfoIsEnablePushEvent value,
          $Res Function(_$UserInfoIsEnablePushEvent) then) =
      __$$UserInfoIsEnablePushEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEnablePush});
}

/// @nodoc
class __$$UserInfoIsEnablePushEventCopyWithImpl<$Res>
    extends _$UserInfoEventCopyWithImpl<$Res, _$UserInfoIsEnablePushEvent>
    implements _$$UserInfoIsEnablePushEventCopyWith<$Res> {
  __$$UserInfoIsEnablePushEventCopyWithImpl(_$UserInfoIsEnablePushEvent _value,
      $Res Function(_$UserInfoIsEnablePushEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnablePush = null,
  }) {
    return _then(_$UserInfoIsEnablePushEvent(
      isEnablePush: null == isEnablePush
          ? _value.isEnablePush
          : isEnablePush // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserInfoIsEnablePushEvent implements UserInfoIsEnablePushEvent {
  const _$UserInfoIsEnablePushEvent({required this.isEnablePush});

  @override
  final bool isEnablePush;

  @override
  String toString() {
    return 'UserInfoEvent.setIsEnablePush(isEnablePush: $isEnablePush)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoIsEnablePushEvent &&
            (identical(other.isEnablePush, isEnablePush) ||
                other.isEnablePush == isEnablePush));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnablePush);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoIsEnablePushEventCopyWith<_$UserInfoIsEnablePushEvent>
      get copyWith => __$$UserInfoIsEnablePushEventCopyWithImpl<
          _$UserInfoIsEnablePushEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isAutoLogin) setIsAutoLogin,
    required TResult Function(bool isEnablePush) setIsEnablePush,
  }) {
    return setIsEnablePush(isEnablePush);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isAutoLogin)? setIsAutoLogin,
    TResult? Function(bool isEnablePush)? setIsEnablePush,
  }) {
    return setIsEnablePush?.call(isEnablePush);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isAutoLogin)? setIsAutoLogin,
    TResult Function(bool isEnablePush)? setIsEnablePush,
    required TResult orElse(),
  }) {
    if (setIsEnablePush != null) {
      return setIsEnablePush(isEnablePush);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(UserInfoIsEnablePushEvent value) setIsEnablePush,
  }) {
    return setIsEnablePush(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
  }) {
    return setIsEnablePush?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(UserInfoIsEnablePushEvent value)? setIsEnablePush,
    required TResult orElse(),
  }) {
    if (setIsEnablePush != null) {
      return setIsEnablePush(this);
    }
    return orElse();
  }
}

abstract class UserInfoIsEnablePushEvent implements UserInfoEvent {
  const factory UserInfoIsEnablePushEvent({required final bool isEnablePush}) =
      _$UserInfoIsEnablePushEvent;

  bool get isEnablePush;
  @JsonKey(ignore: true)
  _$$UserInfoIsEnablePushEventCopyWith<_$UserInfoIsEnablePushEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserInfoState {
  bool get isAutoLogin => throw _privateConstructorUsedError;
  bool get isEnablePush => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoStateCopyWith<UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoStateCopyWith<$Res> {
  factory $UserInfoStateCopyWith(
          UserInfoState value, $Res Function(UserInfoState) then) =
      _$UserInfoStateCopyWithImpl<$Res, UserInfoState>;
  @useResult
  $Res call({bool isAutoLogin, bool isEnablePush});
}

/// @nodoc
class _$UserInfoStateCopyWithImpl<$Res, $Val extends UserInfoState>
    implements $UserInfoStateCopyWith<$Res> {
  _$UserInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
  }) {
    return _then(_value.copyWith(
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnablePush: null == isEnablePush
          ? _value.isEnablePush
          : isEnablePush // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAutoLogin, bool isEnablePush});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$UserInfoStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
  }) {
    return _then(_$Initial(
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnablePush: null == isEnablePush
          ? _value.isEnablePush
          : isEnablePush // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({this.isAutoLogin = false, this.isEnablePush = false});

  @override
  @JsonKey()
  final bool isAutoLogin;
  @override
  @JsonKey()
  final bool isEnablePush;

  @override
  String toString() {
    return 'UserInfoState(isAutoLogin: $isAutoLogin, isEnablePush: $isEnablePush)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.isAutoLogin, isAutoLogin) ||
                other.isAutoLogin == isAutoLogin) &&
            (identical(other.isEnablePush, isEnablePush) ||
                other.isEnablePush == isEnablePush));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAutoLogin, isEnablePush);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements UserInfoState {
  const factory Initial({final bool isAutoLogin, final bool isEnablePush}) =
      _$Initial;

  @override
  bool get isAutoLogin;
  @override
  bool get isEnablePush;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
