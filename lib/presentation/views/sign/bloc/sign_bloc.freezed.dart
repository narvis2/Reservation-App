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
    required TResult Function(int memberId) onSignOutClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
    TResult? Function(int memberId)? onSignOutClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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

class _$SignInitEvent with DiagnosticableTreeMixin implements SignInitEvent {
  const _$SignInitEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignEvent.init'));
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
    required TResult Function(int memberId) onSignOutClick,
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
    TResult? Function(int memberId)? onSignOutClick,
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
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
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
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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

class _$SignIsAutoLoginEvent
    with DiagnosticableTreeMixin
    implements SignIsAutoLoginEvent {
  const _$SignIsAutoLoginEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.setIsAutoLogin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignEvent.setIsAutoLogin'));
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
    required TResult Function(int memberId) onSignOutClick,
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
    TResult? Function(int memberId)? onSignOutClick,
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
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
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
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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

class _$SignIsEnablePushEvent
    with DiagnosticableTreeMixin
    implements SignIsEnablePushEvent {
  const _$SignIsEnablePushEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.setIsEnablePush()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignEvent.setIsEnablePush'));
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
    required TResult Function(int memberId) onSignOutClick,
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
    TResult? Function(int memberId)? onSignOutClick,
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
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
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
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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

class _$SignIsSavedIdEvent
    with DiagnosticableTreeMixin
    implements SignIsSavedIdEvent {
  const _$SignIsSavedIdEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.setIsSavedId()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignEvent.setIsSavedId'));
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
    required TResult Function(int memberId) onSignOutClick,
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
    TResult? Function(int memberId)? onSignOutClick,
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
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
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
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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

class _$SignOnSignInClickEvent
    with DiagnosticableTreeMixin
    implements SignOnSignInClickEvent {
  const _$SignOnSignInClickEvent({required this.id, required this.password});

  @override
  final String id;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.onSignClick(id: $id, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignEvent.onSignClick'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('password', password));
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
    required TResult Function(int memberId) onSignOutClick,
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
    TResult? Function(int memberId)? onSignOutClick,
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
    TResult Function(int memberId)? onSignOutClick,
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
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
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
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
abstract class _$$SignOnSignOutClickEventCopyWith<$Res> {
  factory _$$SignOnSignOutClickEventCopyWith(_$SignOnSignOutClickEvent value,
          $Res Function(_$SignOnSignOutClickEvent) then) =
      __$$SignOnSignOutClickEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int memberId});
}

/// @nodoc
class __$$SignOnSignOutClickEventCopyWithImpl<$Res>
    extends _$SignEventCopyWithImpl<$Res, _$SignOnSignOutClickEvent>
    implements _$$SignOnSignOutClickEventCopyWith<$Res> {
  __$$SignOnSignOutClickEventCopyWithImpl(_$SignOnSignOutClickEvent _value,
      $Res Function(_$SignOnSignOutClickEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
  }) {
    return _then(_$SignOnSignOutClickEvent(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SignOnSignOutClickEvent
    with DiagnosticableTreeMixin
    implements SignOnSignOutClickEvent {
  const _$SignOnSignOutClickEvent({required this.memberId});

  @override
  final int memberId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignEvent.onSignOutClick(memberId: $memberId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignEvent.onSignOutClick'))
      ..add(DiagnosticsProperty('memberId', memberId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOnSignOutClickEvent &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memberId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOnSignOutClickEventCopyWith<_$SignOnSignOutClickEvent> get copyWith =>
      __$$SignOnSignOutClickEventCopyWithImpl<_$SignOnSignOutClickEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() setIsAutoLogin,
    required TResult Function() setIsEnablePush,
    required TResult Function() setIsSavedId,
    required TResult Function(String id, String password) onSignClick,
    required TResult Function(int memberId) onSignOutClick,
  }) {
    return onSignOutClick(memberId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? setIsAutoLogin,
    TResult? Function()? setIsEnablePush,
    TResult? Function()? setIsSavedId,
    TResult? Function(String id, String password)? onSignClick,
    TResult? Function(int memberId)? onSignOutClick,
  }) {
    return onSignOutClick?.call(memberId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? setIsAutoLogin,
    TResult Function()? setIsEnablePush,
    TResult Function()? setIsSavedId,
    TResult Function(String id, String password)? onSignClick,
    TResult Function(int memberId)? onSignOutClick,
    required TResult orElse(),
  }) {
    if (onSignOutClick != null) {
      return onSignOutClick(memberId);
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
    required TResult Function(SignOnSignOutClickEvent value) onSignOutClick,
  }) {
    return onSignOutClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInitEvent value)? init,
    TResult? Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult? Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult? Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult? Function(SignOnSignInClickEvent value)? onSignClick,
    TResult? Function(SignOnSignOutClickEvent value)? onSignOutClick,
  }) {
    return onSignOutClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInitEvent value)? init,
    TResult Function(SignIsAutoLoginEvent value)? setIsAutoLogin,
    TResult Function(SignIsEnablePushEvent value)? setIsEnablePush,
    TResult Function(SignIsSavedIdEvent value)? setIsSavedId,
    TResult Function(SignOnSignInClickEvent value)? onSignClick,
    TResult Function(SignOnSignOutClickEvent value)? onSignOutClick,
    required TResult orElse(),
  }) {
    if (onSignOutClick != null) {
      return onSignOutClick(this);
    }
    return orElse();
  }
}

abstract class SignOnSignOutClickEvent implements SignEvent {
  const factory SignOnSignOutClickEvent({required final int memberId}) =
      _$SignOnSignOutClickEvent;

  int get memberId;
  @JsonKey(ignore: true)
  _$$SignOnSignOutClickEventCopyWith<_$SignOnSignOutClickEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignState {
  SignInStatus get signInStatus => throw _privateConstructorUsedError;
  SignOutState get signOutStatus => throw _privateConstructorUsedError;
  bool get isAutoLogin => throw _privateConstructorUsedError;
  bool get isEnablePush => throw _privateConstructorUsedError;
  bool get isSavedId => throw _privateConstructorUsedError;
  String? get savedEmail => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get signOutErrorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignStateCopyWith<SignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignStateCopyWith<$Res> {
  factory $SignStateCopyWith(SignState value, $Res Function(SignState) then) =
      _$SignStateCopyWithImpl<$Res, SignState>;
  @useResult
  $Res call(
      {SignInStatus signInStatus,
      SignOutState signOutStatus,
      bool isAutoLogin,
      bool isEnablePush,
      bool isSavedId,
      String? savedEmail,
      String? errorMessage,
      String? signOutErrorMsg});
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
    Object? signInStatus = null,
    Object? signOutStatus = null,
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
    Object? isSavedId = null,
    Object? savedEmail = freezed,
    Object? errorMessage = freezed,
    Object? signOutErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      signOutStatus: null == signOutStatus
          ? _value.signOutStatus
          : signOutStatus // ignore: cast_nullable_to_non_nullable
              as SignOutState,
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
      savedEmail: freezed == savedEmail
          ? _value.savedEmail
          : savedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      signOutErrorMsg: freezed == signOutErrorMsg
          ? _value.signOutErrorMsg
          : signOutErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $SignStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignInStatus signInStatus,
      SignOutState signOutStatus,
      bool isAutoLogin,
      bool isEnablePush,
      bool isSavedId,
      String? savedEmail,
      String? errorMessage,
      String? signOutErrorMsg});
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
    Object? signInStatus = null,
    Object? signOutStatus = null,
    Object? isAutoLogin = null,
    Object? isEnablePush = null,
    Object? isSavedId = null,
    Object? savedEmail = freezed,
    Object? errorMessage = freezed,
    Object? signOutErrorMsg = freezed,
  }) {
    return _then(_$Initial(
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      signOutStatus: null == signOutStatus
          ? _value.signOutStatus
          : signOutStatus // ignore: cast_nullable_to_non_nullable
              as SignOutState,
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
      savedEmail: freezed == savedEmail
          ? _value.savedEmail
          : savedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      signOutErrorMsg: freezed == signOutErrorMsg
          ? _value.signOutErrorMsg
          : signOutErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial(
      {this.signInStatus = SignInStatus.initial,
      this.signOutStatus = SignOutState.initial,
      this.isAutoLogin = false,
      this.isEnablePush = false,
      this.isSavedId = false,
      this.savedEmail = null,
      this.errorMessage = null,
      this.signOutErrorMsg = null});

  @override
  @JsonKey()
  final SignInStatus signInStatus;
  @override
  @JsonKey()
  final SignOutState signOutStatus;
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
  @JsonKey()
  final String? savedEmail;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final String? signOutErrorMsg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignState(signInStatus: $signInStatus, signOutStatus: $signOutStatus, isAutoLogin: $isAutoLogin, isEnablePush: $isEnablePush, isSavedId: $isSavedId, savedEmail: $savedEmail, errorMessage: $errorMessage, signOutErrorMsg: $signOutErrorMsg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignState'))
      ..add(DiagnosticsProperty('signInStatus', signInStatus))
      ..add(DiagnosticsProperty('signOutStatus', signOutStatus))
      ..add(DiagnosticsProperty('isAutoLogin', isAutoLogin))
      ..add(DiagnosticsProperty('isEnablePush', isEnablePush))
      ..add(DiagnosticsProperty('isSavedId', isSavedId))
      ..add(DiagnosticsProperty('savedEmail', savedEmail))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('signOutErrorMsg', signOutErrorMsg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.signOutStatus, signOutStatus) ||
                other.signOutStatus == signOutStatus) &&
            (identical(other.isAutoLogin, isAutoLogin) ||
                other.isAutoLogin == isAutoLogin) &&
            (identical(other.isEnablePush, isEnablePush) ||
                other.isEnablePush == isEnablePush) &&
            (identical(other.isSavedId, isSavedId) ||
                other.isSavedId == isSavedId) &&
            (identical(other.savedEmail, savedEmail) ||
                other.savedEmail == savedEmail) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.signOutErrorMsg, signOutErrorMsg) ||
                other.signOutErrorMsg == signOutErrorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      signInStatus,
      signOutStatus,
      isAutoLogin,
      isEnablePush,
      isSavedId,
      savedEmail,
      errorMessage,
      signOutErrorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements SignState {
  const factory Initial(
      {final SignInStatus signInStatus,
      final SignOutState signOutStatus,
      final bool isAutoLogin,
      final bool isEnablePush,
      final bool isSavedId,
      final String? savedEmail,
      final String? errorMessage,
      final String? signOutErrorMsg}) = _$Initial;

  @override
  SignInStatus get signInStatus;
  @override
  SignOutState get signOutStatus;
  @override
  bool get isAutoLogin;
  @override
  bool get isEnablePush;
  @override
  bool get isSavedId;
  @override
  String? get savedEmail;
  @override
  String? get errorMessage;
  @override
  String? get signOutErrorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
