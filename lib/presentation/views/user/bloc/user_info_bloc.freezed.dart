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
    required TResult Function() get,
    required TResult Function() updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? get,
    TResult? Function()? updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? get,
    TResult Function()? updateFcm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoGetEvent value) get,
    required TResult Function(UserInfoUpdateFcmTokenEvent value) updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoGetEvent value)? get,
    TResult? Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoGetEvent value)? get,
    TResult Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
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
    required TResult Function() get,
    required TResult Function() updateFcm,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? get,
    TResult? Function()? updateFcm,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? get,
    TResult Function()? updateFcm,
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
    required TResult Function(UserInfoGetEvent value) get,
    required TResult Function(UserInfoUpdateFcmTokenEvent value) updateFcm,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoGetEvent value)? get,
    TResult? Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoGetEvent value)? get,
    TResult Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
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
abstract class _$$UserInfoGetEventCopyWith<$Res> {
  factory _$$UserInfoGetEventCopyWith(
          _$UserInfoGetEvent value, $Res Function(_$UserInfoGetEvent) then) =
      __$$UserInfoGetEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInfoGetEventCopyWithImpl<$Res>
    extends _$UserInfoEventCopyWithImpl<$Res, _$UserInfoGetEvent>
    implements _$$UserInfoGetEventCopyWith<$Res> {
  __$$UserInfoGetEventCopyWithImpl(
      _$UserInfoGetEvent _value, $Res Function(_$UserInfoGetEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserInfoGetEvent implements UserInfoGetEvent {
  const _$UserInfoGetEvent();

  @override
  String toString() {
    return 'UserInfoEvent.get()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInfoGetEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() get,
    required TResult Function() updateFcm,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? get,
    TResult? Function()? updateFcm,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? get,
    TResult Function()? updateFcm,
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
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoGetEvent value) get,
    required TResult Function(UserInfoUpdateFcmTokenEvent value) updateFcm,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoGetEvent value)? get,
    TResult? Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoGetEvent value)? get,
    TResult Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class UserInfoGetEvent implements UserInfoEvent {
  const factory UserInfoGetEvent() = _$UserInfoGetEvent;
}

/// @nodoc
abstract class _$$UserInfoUpdateFcmTokenEventCopyWith<$Res> {
  factory _$$UserInfoUpdateFcmTokenEventCopyWith(
          _$UserInfoUpdateFcmTokenEvent value,
          $Res Function(_$UserInfoUpdateFcmTokenEvent) then) =
      __$$UserInfoUpdateFcmTokenEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInfoUpdateFcmTokenEventCopyWithImpl<$Res>
    extends _$UserInfoEventCopyWithImpl<$Res, _$UserInfoUpdateFcmTokenEvent>
    implements _$$UserInfoUpdateFcmTokenEventCopyWith<$Res> {
  __$$UserInfoUpdateFcmTokenEventCopyWithImpl(
      _$UserInfoUpdateFcmTokenEvent _value,
      $Res Function(_$UserInfoUpdateFcmTokenEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserInfoUpdateFcmTokenEvent implements UserInfoUpdateFcmTokenEvent {
  const _$UserInfoUpdateFcmTokenEvent();

  @override
  String toString() {
    return 'UserInfoEvent.updateFcm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoUpdateFcmTokenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() get,
    required TResult Function() updateFcm,
  }) {
    return updateFcm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? get,
    TResult? Function()? updateFcm,
  }) {
    return updateFcm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? get,
    TResult Function()? updateFcm,
    required TResult orElse(),
  }) {
    if (updateFcm != null) {
      return updateFcm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInfoInitEvent value) init,
    required TResult Function(UserInfoGetEvent value) get,
    required TResult Function(UserInfoUpdateFcmTokenEvent value) updateFcm,
  }) {
    return updateFcm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInfoInitEvent value)? init,
    TResult? Function(UserInfoGetEvent value)? get,
    TResult? Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
  }) {
    return updateFcm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInfoInitEvent value)? init,
    TResult Function(UserInfoGetEvent value)? get,
    TResult Function(UserInfoUpdateFcmTokenEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (updateFcm != null) {
      return updateFcm(this);
    }
    return orElse();
  }
}

abstract class UserInfoUpdateFcmTokenEvent implements UserInfoEvent {
  const factory UserInfoUpdateFcmTokenEvent() = _$UserInfoUpdateFcmTokenEvent;
}

/// @nodoc
mixin _$UserInfoState {
  UserInfoStatus get userInfoStatus => throw _privateConstructorUsedError;
  MemberModel? get memberModel => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

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
  $Res call(
      {UserInfoStatus userInfoStatus,
      MemberModel? memberModel,
      String? errorMsg});
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
    Object? userInfoStatus = null,
    Object? memberModel = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      userInfoStatus: null == userInfoStatus
          ? _value.userInfoStatus
          : userInfoStatus // ignore: cast_nullable_to_non_nullable
              as UserInfoStatus,
      memberModel: freezed == memberModel
          ? _value.memberModel
          : memberModel // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {UserInfoStatus userInfoStatus,
      MemberModel? memberModel,
      String? errorMsg});
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
    Object? userInfoStatus = null,
    Object? memberModel = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_$Initial(
      userInfoStatus: null == userInfoStatus
          ? _value.userInfoStatus
          : userInfoStatus // ignore: cast_nullable_to_non_nullable
              as UserInfoStatus,
      memberModel: freezed == memberModel
          ? _value.memberModel
          : memberModel // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.userInfoStatus = UserInfoStatus.initial,
      this.memberModel = null,
      this.errorMsg = null});

  @override
  @JsonKey()
  final UserInfoStatus userInfoStatus;
  @override
  @JsonKey()
  final MemberModel? memberModel;
  @override
  @JsonKey()
  final String? errorMsg;

  @override
  String toString() {
    return 'UserInfoState(userInfoStatus: $userInfoStatus, memberModel: $memberModel, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.userInfoStatus, userInfoStatus) ||
                other.userInfoStatus == userInfoStatus) &&
            (identical(other.memberModel, memberModel) ||
                other.memberModel == memberModel) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userInfoStatus, memberModel, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements UserInfoState {
  const factory Initial(
      {final UserInfoStatus userInfoStatus,
      final MemberModel? memberModel,
      final String? errorMsg}) = _$Initial;

  @override
  UserInfoStatus get userInfoStatus;
  @override
  MemberModel? get memberModel;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
