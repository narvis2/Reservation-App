// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_fifth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationFifthEvent {
  ReservationCreateRequestModel get request =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReservationCreateRequestModel request)
        requestCreateReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReservationCreateRequestModel request)?
        requestCreateReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReservationCreateRequestModel request)?
        requestCreateReservation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthRequestCreateReservation value)
        requestCreateReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthRequestCreateReservation value)?
        requestCreateReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthRequestCreateReservation value)?
        requestCreateReservation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationFifthEventCopyWith<ReservationFifthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFifthEventCopyWith<$Res> {
  factory $ReservationFifthEventCopyWith(ReservationFifthEvent value,
          $Res Function(ReservationFifthEvent) then) =
      _$ReservationFifthEventCopyWithImpl<$Res, ReservationFifthEvent>;
  @useResult
  $Res call({ReservationCreateRequestModel request});
}

/// @nodoc
class _$ReservationFifthEventCopyWithImpl<$Res,
        $Val extends ReservationFifthEvent>
    implements $ReservationFifthEventCopyWith<$Res> {
  _$ReservationFifthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ReservationCreateRequestModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationFifthRequestCreateReservationCopyWith<$Res>
    implements $ReservationFifthEventCopyWith<$Res> {
  factory _$$ReservationFifthRequestCreateReservationCopyWith(
          _$ReservationFifthRequestCreateReservation value,
          $Res Function(_$ReservationFifthRequestCreateReservation) then) =
      __$$ReservationFifthRequestCreateReservationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReservationCreateRequestModel request});
}

/// @nodoc
class __$$ReservationFifthRequestCreateReservationCopyWithImpl<$Res>
    extends _$ReservationFifthEventCopyWithImpl<$Res,
        _$ReservationFifthRequestCreateReservation>
    implements _$$ReservationFifthRequestCreateReservationCopyWith<$Res> {
  __$$ReservationFifthRequestCreateReservationCopyWithImpl(
      _$ReservationFifthRequestCreateReservation _value,
      $Res Function(_$ReservationFifthRequestCreateReservation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$ReservationFifthRequestCreateReservation(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ReservationCreateRequestModel,
    ));
  }
}

/// @nodoc

class _$ReservationFifthRequestCreateReservation
    with DiagnosticableTreeMixin
    implements ReservationFifthRequestCreateReservation {
  const _$ReservationFifthRequestCreateReservation({required this.request});

  @override
  final ReservationCreateRequestModel request;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationFifthEvent.requestCreateReservation(request: $request)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ReservationFifthEvent.requestCreateReservation'))
      ..add(DiagnosticsProperty('request', request));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFifthRequestCreateReservation &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationFifthRequestCreateReservationCopyWith<
          _$ReservationFifthRequestCreateReservation>
      get copyWith => __$$ReservationFifthRequestCreateReservationCopyWithImpl<
          _$ReservationFifthRequestCreateReservation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReservationCreateRequestModel request)
        requestCreateReservation,
  }) {
    return requestCreateReservation(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReservationCreateRequestModel request)?
        requestCreateReservation,
  }) {
    return requestCreateReservation?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReservationCreateRequestModel request)?
        requestCreateReservation,
    required TResult orElse(),
  }) {
    if (requestCreateReservation != null) {
      return requestCreateReservation(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthRequestCreateReservation value)
        requestCreateReservation,
  }) {
    return requestCreateReservation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthRequestCreateReservation value)?
        requestCreateReservation,
  }) {
    return requestCreateReservation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthRequestCreateReservation value)?
        requestCreateReservation,
    required TResult orElse(),
  }) {
    if (requestCreateReservation != null) {
      return requestCreateReservation(this);
    }
    return orElse();
  }
}

abstract class ReservationFifthRequestCreateReservation
    implements ReservationFifthEvent {
  const factory ReservationFifthRequestCreateReservation(
          {required final ReservationCreateRequestModel request}) =
      _$ReservationFifthRequestCreateReservation;

  @override
  ReservationCreateRequestModel get request;
  @override
  @JsonKey(ignore: true)
  _$$ReservationFifthRequestCreateReservationCopyWith<
          _$ReservationFifthRequestCreateReservation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationFifthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succeed,
    required TResult Function(String? errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succeed,
    TResult? Function(String? errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succeed,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthInitial value) initial,
    required TResult Function(ReservationFifthLoading value) loading,
    required TResult Function(ReservationFifthSucceed value) succeed,
    required TResult Function(ReservationFifthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthInitial value)? initial,
    TResult? Function(ReservationFifthLoading value)? loading,
    TResult? Function(ReservationFifthSucceed value)? succeed,
    TResult? Function(ReservationFifthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthInitial value)? initial,
    TResult Function(ReservationFifthLoading value)? loading,
    TResult Function(ReservationFifthSucceed value)? succeed,
    TResult Function(ReservationFifthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationFifthStateCopyWith<$Res> {
  factory $ReservationFifthStateCopyWith(ReservationFifthState value,
          $Res Function(ReservationFifthState) then) =
      _$ReservationFifthStateCopyWithImpl<$Res, ReservationFifthState>;
}

/// @nodoc
class _$ReservationFifthStateCopyWithImpl<$Res,
        $Val extends ReservationFifthState>
    implements $ReservationFifthStateCopyWith<$Res> {
  _$ReservationFifthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReservationFifthInitialCopyWith<$Res> {
  factory _$$ReservationFifthInitialCopyWith(_$ReservationFifthInitial value,
          $Res Function(_$ReservationFifthInitial) then) =
      __$$ReservationFifthInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationFifthInitialCopyWithImpl<$Res>
    extends _$ReservationFifthStateCopyWithImpl<$Res, _$ReservationFifthInitial>
    implements _$$ReservationFifthInitialCopyWith<$Res> {
  __$$ReservationFifthInitialCopyWithImpl(_$ReservationFifthInitial _value,
      $Res Function(_$ReservationFifthInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationFifthInitial
    with DiagnosticableTreeMixin
    implements ReservationFifthInitial {
  const _$ReservationFifthInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationFifthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ReservationFifthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFifthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succeed,
    required TResult Function(String? errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succeed,
    TResult? Function(String? errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succeed,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthInitial value) initial,
    required TResult Function(ReservationFifthLoading value) loading,
    required TResult Function(ReservationFifthSucceed value) succeed,
    required TResult Function(ReservationFifthError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthInitial value)? initial,
    TResult? Function(ReservationFifthLoading value)? loading,
    TResult? Function(ReservationFifthSucceed value)? succeed,
    TResult? Function(ReservationFifthError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthInitial value)? initial,
    TResult Function(ReservationFifthLoading value)? loading,
    TResult Function(ReservationFifthSucceed value)? succeed,
    TResult Function(ReservationFifthError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReservationFifthInitial implements ReservationFifthState {
  const factory ReservationFifthInitial() = _$ReservationFifthInitial;
}

/// @nodoc
abstract class _$$ReservationFifthLoadingCopyWith<$Res> {
  factory _$$ReservationFifthLoadingCopyWith(_$ReservationFifthLoading value,
          $Res Function(_$ReservationFifthLoading) then) =
      __$$ReservationFifthLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationFifthLoadingCopyWithImpl<$Res>
    extends _$ReservationFifthStateCopyWithImpl<$Res, _$ReservationFifthLoading>
    implements _$$ReservationFifthLoadingCopyWith<$Res> {
  __$$ReservationFifthLoadingCopyWithImpl(_$ReservationFifthLoading _value,
      $Res Function(_$ReservationFifthLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationFifthLoading
    with DiagnosticableTreeMixin
    implements ReservationFifthLoading {
  const _$ReservationFifthLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationFifthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ReservationFifthState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFifthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succeed,
    required TResult Function(String? errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succeed,
    TResult? Function(String? errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succeed,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthInitial value) initial,
    required TResult Function(ReservationFifthLoading value) loading,
    required TResult Function(ReservationFifthSucceed value) succeed,
    required TResult Function(ReservationFifthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthInitial value)? initial,
    TResult? Function(ReservationFifthLoading value)? loading,
    TResult? Function(ReservationFifthSucceed value)? succeed,
    TResult? Function(ReservationFifthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthInitial value)? initial,
    TResult Function(ReservationFifthLoading value)? loading,
    TResult Function(ReservationFifthSucceed value)? succeed,
    TResult Function(ReservationFifthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReservationFifthLoading implements ReservationFifthState {
  const factory ReservationFifthLoading() = _$ReservationFifthLoading;
}

/// @nodoc
abstract class _$$ReservationFifthSucceedCopyWith<$Res> {
  factory _$$ReservationFifthSucceedCopyWith(_$ReservationFifthSucceed value,
          $Res Function(_$ReservationFifthSucceed) then) =
      __$$ReservationFifthSucceedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationFifthSucceedCopyWithImpl<$Res>
    extends _$ReservationFifthStateCopyWithImpl<$Res, _$ReservationFifthSucceed>
    implements _$$ReservationFifthSucceedCopyWith<$Res> {
  __$$ReservationFifthSucceedCopyWithImpl(_$ReservationFifthSucceed _value,
      $Res Function(_$ReservationFifthSucceed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationFifthSucceed
    with DiagnosticableTreeMixin
    implements ReservationFifthSucceed {
  const _$ReservationFifthSucceed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationFifthState.succeed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ReservationFifthState.succeed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFifthSucceed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succeed,
    required TResult Function(String? errorMessage) error,
  }) {
    return succeed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succeed,
    TResult? Function(String? errorMessage)? error,
  }) {
    return succeed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succeed,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (succeed != null) {
      return succeed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthInitial value) initial,
    required TResult Function(ReservationFifthLoading value) loading,
    required TResult Function(ReservationFifthSucceed value) succeed,
    required TResult Function(ReservationFifthError value) error,
  }) {
    return succeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthInitial value)? initial,
    TResult? Function(ReservationFifthLoading value)? loading,
    TResult? Function(ReservationFifthSucceed value)? succeed,
    TResult? Function(ReservationFifthError value)? error,
  }) {
    return succeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthInitial value)? initial,
    TResult Function(ReservationFifthLoading value)? loading,
    TResult Function(ReservationFifthSucceed value)? succeed,
    TResult Function(ReservationFifthError value)? error,
    required TResult orElse(),
  }) {
    if (succeed != null) {
      return succeed(this);
    }
    return orElse();
  }
}

abstract class ReservationFifthSucceed implements ReservationFifthState {
  const factory ReservationFifthSucceed() = _$ReservationFifthSucceed;
}

/// @nodoc
abstract class _$$ReservationFifthErrorCopyWith<$Res> {
  factory _$$ReservationFifthErrorCopyWith(_$ReservationFifthError value,
          $Res Function(_$ReservationFifthError) then) =
      __$$ReservationFifthErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ReservationFifthErrorCopyWithImpl<$Res>
    extends _$ReservationFifthStateCopyWithImpl<$Res, _$ReservationFifthError>
    implements _$$ReservationFifthErrorCopyWith<$Res> {
  __$$ReservationFifthErrorCopyWithImpl(_$ReservationFifthError _value,
      $Res Function(_$ReservationFifthError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ReservationFifthError(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReservationFifthError
    with DiagnosticableTreeMixin
    implements ReservationFifthError {
  const _$ReservationFifthError({this.errorMessage = null});

  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationFifthState.error(errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReservationFifthState.error'))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationFifthError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationFifthErrorCopyWith<_$ReservationFifthError> get copyWith =>
      __$$ReservationFifthErrorCopyWithImpl<_$ReservationFifthError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() succeed,
    required TResult Function(String? errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? succeed,
    TResult? Function(String? errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? succeed,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationFifthInitial value) initial,
    required TResult Function(ReservationFifthLoading value) loading,
    required TResult Function(ReservationFifthSucceed value) succeed,
    required TResult Function(ReservationFifthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationFifthInitial value)? initial,
    TResult? Function(ReservationFifthLoading value)? loading,
    TResult? Function(ReservationFifthSucceed value)? succeed,
    TResult? Function(ReservationFifthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationFifthInitial value)? initial,
    TResult Function(ReservationFifthLoading value)? loading,
    TResult Function(ReservationFifthSucceed value)? succeed,
    TResult Function(ReservationFifthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReservationFifthError implements ReservationFifthState {
  const factory ReservationFifthError({final String? errorMessage}) =
      _$ReservationFifthError;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$ReservationFifthErrorCopyWith<_$ReservationFifthError> get copyWith =>
      throw _privateConstructorUsedError;
}
