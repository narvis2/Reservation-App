// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_fourth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationFourthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String phoneNumber)
        requestPhoneAuthNumber,
    required TResult Function(String authCode) requestPhoneAuthNumberCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult? Function(String authCode)? requestPhoneAuthNumberCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult Function(String authCode)? requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFourthRequestPhoneAuthNumber value)
        requestPhoneAuthNumber,
    required TResult Function(ReservationFourthRequestPhoneAuthCheck value)
        requestPhoneAuthNumberCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult? Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFourthEventCopyWith<$Res> {
  factory $ReservationFourthEventCopyWith(ReservationFourthEvent value,
          $Res Function(ReservationFourthEvent) then) =
      _$ReservationFourthEventCopyWithImpl<$Res, ReservationFourthEvent>;
}

/// @nodoc
class _$ReservationFourthEventCopyWithImpl<$Res,
        $Val extends ReservationFourthEvent>
    implements $ReservationFourthEventCopyWith<$Res> {
  _$ReservationFourthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReservationFourthRequestPhoneAuthNumberCopyWith<$Res> {
  factory _$$ReservationFourthRequestPhoneAuthNumberCopyWith(
          _$ReservationFourthRequestPhoneAuthNumber value,
          $Res Function(_$ReservationFourthRequestPhoneAuthNumber) then) =
      __$$ReservationFourthRequestPhoneAuthNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class __$$ReservationFourthRequestPhoneAuthNumberCopyWithImpl<$Res>
    extends _$ReservationFourthEventCopyWithImpl<$Res,
        _$ReservationFourthRequestPhoneAuthNumber>
    implements _$$ReservationFourthRequestPhoneAuthNumberCopyWith<$Res> {
  __$$ReservationFourthRequestPhoneAuthNumberCopyWithImpl(
      _$ReservationFourthRequestPhoneAuthNumber _value,
      $Res Function(_$ReservationFourthRequestPhoneAuthNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$ReservationFourthRequestPhoneAuthNumber(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReservationFourthRequestPhoneAuthNumber
    implements ReservationFourthRequestPhoneAuthNumber {
  const _$ReservationFourthRequestPhoneAuthNumber(
      {required this.name, required this.phoneNumber});

  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ReservationFourthEvent.requestPhoneAuthNumber(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFourthRequestPhoneAuthNumber &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationFourthRequestPhoneAuthNumberCopyWith<
          _$ReservationFourthRequestPhoneAuthNumber>
      get copyWith => __$$ReservationFourthRequestPhoneAuthNumberCopyWithImpl<
          _$ReservationFourthRequestPhoneAuthNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String phoneNumber)
        requestPhoneAuthNumber,
    required TResult Function(String authCode) requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumber(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult? Function(String authCode)? requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumber?.call(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult Function(String authCode)? requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) {
    if (requestPhoneAuthNumber != null) {
      return requestPhoneAuthNumber(name, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFourthRequestPhoneAuthNumber value)
        requestPhoneAuthNumber,
    required TResult Function(ReservationFourthRequestPhoneAuthCheck value)
        requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult? Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) {
    if (requestPhoneAuthNumber != null) {
      return requestPhoneAuthNumber(this);
    }
    return orElse();
  }
}

abstract class ReservationFourthRequestPhoneAuthNumber
    implements ReservationFourthEvent {
  const factory ReservationFourthRequestPhoneAuthNumber(
          {required final String name, required final String phoneNumber}) =
      _$ReservationFourthRequestPhoneAuthNumber;

  String get name;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$ReservationFourthRequestPhoneAuthNumberCopyWith<
          _$ReservationFourthRequestPhoneAuthNumber>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservationFourthRequestPhoneAuthCheckCopyWith<$Res> {
  factory _$$ReservationFourthRequestPhoneAuthCheckCopyWith(
          _$ReservationFourthRequestPhoneAuthCheck value,
          $Res Function(_$ReservationFourthRequestPhoneAuthCheck) then) =
      __$$ReservationFourthRequestPhoneAuthCheckCopyWithImpl<$Res>;
  @useResult
  $Res call({String authCode});
}

/// @nodoc
class __$$ReservationFourthRequestPhoneAuthCheckCopyWithImpl<$Res>
    extends _$ReservationFourthEventCopyWithImpl<$Res,
        _$ReservationFourthRequestPhoneAuthCheck>
    implements _$$ReservationFourthRequestPhoneAuthCheckCopyWith<$Res> {
  __$$ReservationFourthRequestPhoneAuthCheckCopyWithImpl(
      _$ReservationFourthRequestPhoneAuthCheck _value,
      $Res Function(_$ReservationFourthRequestPhoneAuthCheck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authCode = null,
  }) {
    return _then(_$ReservationFourthRequestPhoneAuthCheck(
      authCode: null == authCode
          ? _value.authCode
          : authCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReservationFourthRequestPhoneAuthCheck
    implements ReservationFourthRequestPhoneAuthCheck {
  const _$ReservationFourthRequestPhoneAuthCheck({required this.authCode});

  @override
  final String authCode;

  @override
  String toString() {
    return 'ReservationFourthEvent.requestPhoneAuthNumberCheck(authCode: $authCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFourthRequestPhoneAuthCheck &&
            (identical(other.authCode, authCode) ||
                other.authCode == authCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationFourthRequestPhoneAuthCheckCopyWith<
          _$ReservationFourthRequestPhoneAuthCheck>
      get copyWith => __$$ReservationFourthRequestPhoneAuthCheckCopyWithImpl<
          _$ReservationFourthRequestPhoneAuthCheck>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String phoneNumber)
        requestPhoneAuthNumber,
    required TResult Function(String authCode) requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumberCheck(authCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult? Function(String authCode)? requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumberCheck?.call(authCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String phoneNumber)? requestPhoneAuthNumber,
    TResult Function(String authCode)? requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) {
    if (requestPhoneAuthNumberCheck != null) {
      return requestPhoneAuthNumberCheck(authCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFourthRequestPhoneAuthNumber value)
        requestPhoneAuthNumber,
    required TResult Function(ReservationFourthRequestPhoneAuthCheck value)
        requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumberCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult? Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
  }) {
    return requestPhoneAuthNumberCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFourthRequestPhoneAuthNumber value)?
        requestPhoneAuthNumber,
    TResult Function(ReservationFourthRequestPhoneAuthCheck value)?
        requestPhoneAuthNumberCheck,
    required TResult orElse(),
  }) {
    if (requestPhoneAuthNumberCheck != null) {
      return requestPhoneAuthNumberCheck(this);
    }
    return orElse();
  }
}

abstract class ReservationFourthRequestPhoneAuthCheck
    implements ReservationFourthEvent {
  const factory ReservationFourthRequestPhoneAuthCheck(
          {required final String authCode}) =
      _$ReservationFourthRequestPhoneAuthCheck;

  String get authCode;
  @JsonKey(ignore: true)
  _$$ReservationFourthRequestPhoneAuthCheckCopyWith<
          _$ReservationFourthRequestPhoneAuthCheck>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationFourthState {
  RequestAuthNumberStatus get reqAuthNumberStatus =>
      throw _privateConstructorUsedError;
  CheckAuthNumberStatus get checkAuthNumberStatus =>
      throw _privateConstructorUsedError;
  bool get isRequestSuccess => throw _privateConstructorUsedError;
  bool get isCheckSuccess => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationFourthStateCopyWith<ReservationFourthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFourthStateCopyWith<$Res> {
  factory $ReservationFourthStateCopyWith(ReservationFourthState value,
          $Res Function(ReservationFourthState) then) =
      _$ReservationFourthStateCopyWithImpl<$Res, ReservationFourthState>;
  @useResult
  $Res call(
      {RequestAuthNumberStatus reqAuthNumberStatus,
      CheckAuthNumberStatus checkAuthNumberStatus,
      bool isRequestSuccess,
      bool isCheckSuccess,
      String name,
      String phoneNumber});
}

/// @nodoc
class _$ReservationFourthStateCopyWithImpl<$Res,
        $Val extends ReservationFourthState>
    implements $ReservationFourthStateCopyWith<$Res> {
  _$ReservationFourthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqAuthNumberStatus = null,
    Object? checkAuthNumberStatus = null,
    Object? isRequestSuccess = null,
    Object? isCheckSuccess = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      reqAuthNumberStatus: null == reqAuthNumberStatus
          ? _value.reqAuthNumberStatus
          : reqAuthNumberStatus // ignore: cast_nullable_to_non_nullable
              as RequestAuthNumberStatus,
      checkAuthNumberStatus: null == checkAuthNumberStatus
          ? _value.checkAuthNumberStatus
          : checkAuthNumberStatus // ignore: cast_nullable_to_non_nullable
              as CheckAuthNumberStatus,
      isRequestSuccess: null == isRequestSuccess
          ? _value.isRequestSuccess
          : isRequestSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckSuccess: null == isCheckSuccess
          ? _value.isCheckSuccess
          : isCheckSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $ReservationFourthStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestAuthNumberStatus reqAuthNumberStatus,
      CheckAuthNumberStatus checkAuthNumberStatus,
      bool isRequestSuccess,
      bool isCheckSuccess,
      String name,
      String phoneNumber});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ReservationFourthStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqAuthNumberStatus = null,
    Object? checkAuthNumberStatus = null,
    Object? isRequestSuccess = null,
    Object? isCheckSuccess = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$Initial(
      reqAuthNumberStatus: null == reqAuthNumberStatus
          ? _value.reqAuthNumberStatus
          : reqAuthNumberStatus // ignore: cast_nullable_to_non_nullable
              as RequestAuthNumberStatus,
      checkAuthNumberStatus: null == checkAuthNumberStatus
          ? _value.checkAuthNumberStatus
          : checkAuthNumberStatus // ignore: cast_nullable_to_non_nullable
              as CheckAuthNumberStatus,
      isRequestSuccess: null == isRequestSuccess
          ? _value.isRequestSuccess
          : isRequestSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckSuccess: null == isCheckSuccess
          ? _value.isCheckSuccess
          : isCheckSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.reqAuthNumberStatus = RequestAuthNumberStatus.initial,
      this.checkAuthNumberStatus = CheckAuthNumberStatus.initial,
      this.isRequestSuccess = false,
      this.isCheckSuccess = false,
      this.name = '',
      this.phoneNumber = ''});

  @override
  @JsonKey()
  final RequestAuthNumberStatus reqAuthNumberStatus;
  @override
  @JsonKey()
  final CheckAuthNumberStatus checkAuthNumberStatus;
  @override
  @JsonKey()
  final bool isRequestSuccess;
  @override
  @JsonKey()
  final bool isCheckSuccess;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String phoneNumber;

  @override
  String toString() {
    return 'ReservationFourthState(reqAuthNumberStatus: $reqAuthNumberStatus, checkAuthNumberStatus: $checkAuthNumberStatus, isRequestSuccess: $isRequestSuccess, isCheckSuccess: $isCheckSuccess, name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.reqAuthNumberStatus, reqAuthNumberStatus) ||
                other.reqAuthNumberStatus == reqAuthNumberStatus) &&
            (identical(other.checkAuthNumberStatus, checkAuthNumberStatus) ||
                other.checkAuthNumberStatus == checkAuthNumberStatus) &&
            (identical(other.isRequestSuccess, isRequestSuccess) ||
                other.isRequestSuccess == isRequestSuccess) &&
            (identical(other.isCheckSuccess, isCheckSuccess) ||
                other.isCheckSuccess == isCheckSuccess) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reqAuthNumberStatus,
      checkAuthNumberStatus,
      isRequestSuccess,
      isCheckSuccess,
      name,
      phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationFourthState {
  const factory Initial(
      {final RequestAuthNumberStatus reqAuthNumberStatus,
      final CheckAuthNumberStatus checkAuthNumberStatus,
      final bool isRequestSuccess,
      final bool isCheckSuccess,
      final String name,
      final String phoneNumber}) = _$Initial;

  @override
  RequestAuthNumberStatus get reqAuthNumberStatus;
  @override
  CheckAuthNumberStatus get checkAuthNumberStatus;
  @override
  bool get isRequestSuccess;
  @override
  bool get isCheckSuccess;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
