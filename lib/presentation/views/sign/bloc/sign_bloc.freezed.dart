// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignEventCopyWith<$Res> {
  factory $SignEventCopyWith(SignEvent value, $Res Function(SignEvent) then) =
      _$SignEventCopyWithImpl<$Res, SignEvent>;
}

/// @nodoc
class _$SignEventCopyWithImpl<$Res, $Val extends SignEvent>
    implements $SignEventCopyWith<$Res> {
  _$SignEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInitEventCopyWith<$Res> {
  factory _$$SignInitEventCopyWith(
          _$SignInitEvent value, $Res Function(_$SignInitEvent) then) =
      __$$SignInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInitEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignInitEvent>
    implements _$$SignInitEventCopyWith<$Res> {
  __$$SignInitEventCopyWithImpl(
      _$SignInitEvent _value, $Res Function(_$SignInitEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInitEvent implements SignInitEvent {
  const _$SignInitEvent();

  @override
  String toString() {
    return 'SignEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
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
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SignInitEvent implements SignEvent {
  const factory SignInitEvent() = _$SignInitEvent;
}

/// @nodoc
abstract class _$$SignIsAutoLoginEventCopyWith<$Res> {
  factory _$$SignIsAutoLoginEventCopyWith(_$SignIsAutoLoginEvent value,
          $Res Function(_$SignIsAutoLoginEvent) then) =
      __$$SignIsAutoLoginEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignIsAutoLoginEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignIsAutoLoginEvent>
    implements _$$SignIsAutoLoginEventCopyWith<$Res> {
  __$$SignIsAutoLoginEventCopyWithImpl(_$SignIsAutoLoginEvent _value,
      $Res Function(_$SignIsAutoLoginEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignIsAutoLoginEvent implements SignIsAutoLoginEvent {
  const _$SignIsAutoLoginEvent();

  @override
  String toString() {
    return 'SignEvent.setIsAutoLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignIsAutoLoginEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) {
    return setIsAutoLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) {
    return setIsAutoLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsAutoLogin != null) {
      return setIsAutoLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) {
    return setIsAutoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) {
    return setIsAutoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsAutoLogin != null) {
      return setIsAutoLogin(this);
    }
    return orElse();
  }
}

abstract class SignIsAutoLoginEvent implements SignEvent {
  const factory SignIsAutoLoginEvent() = _$SignIsAutoLoginEvent;
}

/// @nodoc
abstract class _$$SignIsEnablePushEventCopyWith<$Res> {
  factory _$$SignIsEnablePushEventCopyWith(_$SignIsEnablePushEvent value,
          $Res Function(_$SignIsEnablePushEvent) then) =
      __$$SignIsEnablePushEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignIsEnablePushEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignIsEnablePushEvent>
    implements _$$SignIsEnablePushEventCopyWith<$Res> {
  __$$SignIsEnablePushEventCopyWithImpl(_$SignIsEnablePushEvent _value,
      $Res Function(_$SignIsEnablePushEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignIsEnablePushEvent implements SignIsEnablePushEvent {
  const _$SignIsEnablePushEvent();

  @override
  String toString() {
    return 'SignEvent.setIsEnablePush()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignIsEnablePushEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) {
    return setIsEnablePush();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) {
    return setIsEnablePush?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsEnablePush != null) {
      return setIsEnablePush();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) {
    return setIsEnablePush(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) {
    return setIsEnablePush?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsEnablePush != null) {
      return setIsEnablePush(this);
    }
    return orElse();
  }
}

abstract class SignIsEnablePushEvent implements SignEvent {
  const factory SignIsEnablePushEvent() = _$SignIsEnablePushEvent;
}

/// @nodoc
abstract class _$$SignIsSavedIdEventCopyWith<$Res> {
  factory _$$SignIsSavedIdEventCopyWith(_$SignIsSavedIdEvent value,
          $Res Function(_$SignIsSavedIdEvent) then) =
      __$$SignIsSavedIdEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignIsSavedIdEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignIsSavedIdEvent>
    implements _$$SignIsSavedIdEventCopyWith<$Res> {
  __$$SignIsSavedIdEventCopyWithImpl(
      _$SignIsSavedIdEvent _value, $Res Function(_$SignIsSavedIdEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignIsSavedIdEvent implements SignIsSavedIdEvent {
  const _$SignIsSavedIdEvent();

  @override
  String toString() {
    return 'SignEvent.setIsSavedId()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignIsSavedIdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) {
    return setIsSavedId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) {
    return setIsSavedId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsSavedId != null) {
      return setIsSavedId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) {
    return setIsSavedId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) {
    return setIsSavedId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) {
    if (setIsSavedId != null) {
      return setIsSavedId(this);
    }
    return orElse();
  }
}

abstract class SignIsSavedIdEvent implements SignEvent {
  const factory SignIsSavedIdEvent() = _$SignIsSavedIdEvent;
}

/// @nodoc
abstract class _$$SignOnSignInClickEventCopyWith<$Res> {
  factory _$$SignOnSignInClickEventCopyWith(_$SignOnSignInClickEvent value,
          $Res Function(_$SignOnSignInClickEvent) then) =
      __$$SignOnSignInClickEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String password});
}

/// @nodoc
class __$$SignOnSignInClickEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignOnSignInClickEvent>
    implements _$$SignOnSignInClickEventCopyWith<$Res> {
  __$$SignOnSignInClickEventCopyWithImpl(_$SignOnSignInClickEvent _value,
      $Res Function(_$SignOnSignInClickEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? password = null,
  }) {
    return _then(_$SignOnSignInClickEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignOnSignInClickEvent implements SignOnSignInClickEvent {
  const _$SignOnSignInClickEvent({required this.id, required this.password});

  @override
  final String id;
  @override
  final String password;

  @override
  String toString() {
    return 'SignEvent.onSignClick(id: $id, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOnSignInClickEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOnSignInClickEventCopyWith<_$SignOnSignInClickEvent> get copyWith =>
      __$$SignOnSignInClickEventCopyWithImpl<_$SignOnSignInClickEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
  }) {
    return onSignClick(id, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
  }) {
    return onSignClick?.call(id, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    required TResult orElse(),
  }) {
    if (onSignClick != null) {
      return onSignClick(id, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInitEvent value) init,
    required TResult Function(SignIsAutoLoginEvent value) setIsAutoLogin,
    required TResult Function(SignIsEnablePushEvent value) setIsEnablePush,
    required TResult Function(SignIsSavedIdEvent value) setIsSavedId,
    required TResult Function(SignOnSignInClickEvent value) onSignClick,
  }) {
    return onSignClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
  }) {
    return onSignClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    required TResult orElse(),
  }) {
    if (onSignClick != null) {
      return onSignClick(this);
    }
    return orElse();
  }
}

abstract class SignOnSignInClickEvent implements SignEvent {
  const factory SignOnSignInClickEvent(
      {required final String id,
      required final String password}) = _$SignOnSignInClickEvent;

  String get id;
  String get password;
  @JsonKey(ignore: true)
  _$$SignOnSignInClickEventCopyWith<_$SignOnSignInClickEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignState {
  bool get isAutoLogin => throw _privateConstructorUsedError;
  bool get isEnablePush => throw _privateConstructorUsedError;
  bool get isSavedId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignStateCopyWith<SignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignStateCopyWith<$Res> {
  factory $SignStateCopyWith(SignState value, $Res Function(SignState) then) =
      _$SignStateCopyWithImpl<$Res, SignState>;
  @useResult
  $Res call({bool isAutoLogin, bool isEnablePush, bool isSavedId});
}

/// @nodoc
class _$SignStateCopyWithImpl<$Res, $Val extends SignState>
    implements $SignStateCopyWith<$Res> {
  _$SignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
    Object? isSavedId = null,
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
      isSavedId: null == isSavedId
          ? _value.isSavedId
          : isSavedId // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $SignStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAutoLogin, bool isEnablePush, bool isSavedId});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$SignStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
    Object? isSavedId = null,
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
      isSavedId: null == isSavedId
          ? _value.isSavedId
          : isSavedId // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.isAutoLogin = false,
      this.isEnablePush = false,
      this.isSavedId = false});

  @override
  @JsonKey()
  final bool isAutoLogin;
  @override
  @JsonKey()
  final bool isEnablePush;
  @override
  @JsonKey()
  final bool isSavedId;

  @override
  String toString() {
    return 'SignState(isAutoLogin: $isAutoLogin, isEnablePush: $isEnablePush, isSavedId: $isSavedId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.isAutoLogin, isAutoLogin) ||
                other.isAutoLogin == isAutoLogin) &&
            (identical(other.isEnablePush, isEnablePush) ||
                other.isEnablePush == isEnablePush) &&
            (identical(other.isSavedId, isSavedId) ||
                other.isSavedId == isSavedId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isAutoLogin, isEnablePush, isSavedId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements SignState {
  const factory Initial(
      {final bool isAutoLogin,
      final bool isEnablePush,
      final bool isSavedId}) = _$Initial;

  @override
  bool get isAutoLogin;
  @override
  bool get isEnablePush;
  @override
  bool get isSavedId;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
