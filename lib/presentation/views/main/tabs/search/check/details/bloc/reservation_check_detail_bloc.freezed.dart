// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_check_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationCheckDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) requestDetails,
    required TResult Function(String certificationNumber) requestDetailsByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationRequestCheckDetailEvent value)
        requestDetails,
    required TResult Function(ReservationRequestCheckDetailByUserEvent value)
        requestDetailsByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCheckDetailEventCopyWith<$Res> {
  factory $ReservationCheckDetailEventCopyWith(
          ReservationCheckDetailEvent value,
          $Res Function(ReservationCheckDetailEvent) then) =
      _$ReservationCheckDetailEventCopyWithImpl<$Res,
          ReservationCheckDetailEvent>;
}

/// @nodoc
class _$ReservationCheckDetailEventCopyWithImpl<$Res,
        $Val extends ReservationCheckDetailEvent>
    implements $ReservationCheckDetailEventCopyWith<$Res> {
  _$ReservationCheckDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReservationRequestCheckDetailEventCopyWith<$Res> {
  factory _$$ReservationRequestCheckDetailEventCopyWith(
          _$ReservationRequestCheckDetailEvent value,
          $Res Function(_$ReservationRequestCheckDetailEvent) then) =
      __$$ReservationRequestCheckDetailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ReservationRequestCheckDetailEventCopyWithImpl<$Res>
    extends _$ReservationCheckDetailEventCopyWithImpl<$Res,
        _$ReservationRequestCheckDetailEvent>
    implements _$$ReservationRequestCheckDetailEventCopyWith<$Res> {
  __$$ReservationRequestCheckDetailEventCopyWithImpl(
      _$ReservationRequestCheckDetailEvent _value,
      $Res Function(_$ReservationRequestCheckDetailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ReservationRequestCheckDetailEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReservationRequestCheckDetailEvent
    implements ReservationRequestCheckDetailEvent {
  const _$ReservationRequestCheckDetailEvent({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'ReservationCheckDetailEvent.requestDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationRequestCheckDetailEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationRequestCheckDetailEventCopyWith<
          _$ReservationRequestCheckDetailEvent>
      get copyWith => __$$ReservationRequestCheckDetailEventCopyWithImpl<
          _$ReservationRequestCheckDetailEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) requestDetails,
    required TResult Function(String certificationNumber) requestDetailsByUser,
  }) {
    return requestDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
  }) {
    return requestDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    required TResult orElse(),
  }) {
    if (requestDetails != null) {
      return requestDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationRequestCheckDetailEvent value)
        requestDetails,
    required TResult Function(ReservationRequestCheckDetailByUserEvent value)
        requestDetailsByUser,
  }) {
    return requestDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
  }) {
    return requestDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    required TResult orElse(),
  }) {
    if (requestDetails != null) {
      return requestDetails(this);
    }
    return orElse();
  }
}

abstract class ReservationRequestCheckDetailEvent
    implements ReservationCheckDetailEvent {
  const factory ReservationRequestCheckDetailEvent({required final int id}) =
      _$ReservationRequestCheckDetailEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$ReservationRequestCheckDetailEventCopyWith<
          _$ReservationRequestCheckDetailEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservationRequestCheckDetailByUserEventCopyWith<$Res> {
  factory _$$ReservationRequestCheckDetailByUserEventCopyWith(
          _$ReservationRequestCheckDetailByUserEvent value,
          $Res Function(_$ReservationRequestCheckDetailByUserEvent) then) =
      __$$ReservationRequestCheckDetailByUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String certificationNumber});
}

/// @nodoc
class __$$ReservationRequestCheckDetailByUserEventCopyWithImpl<$Res>
    extends _$ReservationCheckDetailEventCopyWithImpl<$Res,
        _$ReservationRequestCheckDetailByUserEvent>
    implements _$$ReservationRequestCheckDetailByUserEventCopyWith<$Res> {
  __$$ReservationRequestCheckDetailByUserEventCopyWithImpl(
      _$ReservationRequestCheckDetailByUserEvent _value,
      $Res Function(_$ReservationRequestCheckDetailByUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificationNumber = null,
  }) {
    return _then(_$ReservationRequestCheckDetailByUserEvent(
      certificationNumber: null == certificationNumber
          ? _value.certificationNumber
          : certificationNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReservationRequestCheckDetailByUserEvent
    implements ReservationRequestCheckDetailByUserEvent {
  const _$ReservationRequestCheckDetailByUserEvent(
      {required this.certificationNumber});

  @override
  final String certificationNumber;

  @override
  String toString() {
    return 'ReservationCheckDetailEvent.requestDetailsByUser(certificationNumber: $certificationNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationRequestCheckDetailByUserEvent &&
            (identical(other.certificationNumber, certificationNumber) ||
                other.certificationNumber == certificationNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, certificationNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationRequestCheckDetailByUserEventCopyWith<
          _$ReservationRequestCheckDetailByUserEvent>
      get copyWith => __$$ReservationRequestCheckDetailByUserEventCopyWithImpl<
          _$ReservationRequestCheckDetailByUserEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) requestDetails,
    required TResult Function(String certificationNumber) requestDetailsByUser,
  }) {
    return requestDetailsByUser(certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
  }) {
    return requestDetailsByUser?.call(certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    required TResult orElse(),
  }) {
    if (requestDetailsByUser != null) {
      return requestDetailsByUser(certificationNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationRequestCheckDetailEvent value)
        requestDetails,
    required TResult Function(ReservationRequestCheckDetailByUserEvent value)
        requestDetailsByUser,
  }) {
    return requestDetailsByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
  }) {
    return requestDetailsByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    required TResult orElse(),
  }) {
    if (requestDetailsByUser != null) {
      return requestDetailsByUser(this);
    }
    return orElse();
  }
}

abstract class ReservationRequestCheckDetailByUserEvent
    implements ReservationCheckDetailEvent {
  const factory ReservationRequestCheckDetailByUserEvent(
          {required final String certificationNumber}) =
      _$ReservationRequestCheckDetailByUserEvent;

  String get certificationNumber;
  @JsonKey(ignore: true)
  _$$ReservationRequestCheckDetailByUserEventCopyWith<
          _$ReservationRequestCheckDetailByUserEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationCheckDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReservationDetailModel? reservationDetailModel)
        success,
    required TResult Function(String? errorMsg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult? Function(String? errorMsg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult Function(String? errorMsg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReservationCheckDetailInitial value) initial,
    required TResult Function(_ReservationCheckDetailLoading value) loading,
    required TResult Function(_ReservationCheckDetailSuccess value) success,
    required TResult Function(_ReservationCheckDetailError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReservationCheckDetailInitial value)? initial,
    TResult? Function(_ReservationCheckDetailLoading value)? loading,
    TResult? Function(_ReservationCheckDetailSuccess value)? success,
    TResult? Function(_ReservationCheckDetailError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReservationCheckDetailInitial value)? initial,
    TResult Function(_ReservationCheckDetailLoading value)? loading,
    TResult Function(_ReservationCheckDetailSuccess value)? success,
    TResult Function(_ReservationCheckDetailError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCheckDetailStateCopyWith<$Res> {
  factory $ReservationCheckDetailStateCopyWith(
          ReservationCheckDetailState value,
          $Res Function(ReservationCheckDetailState) then) =
      _$ReservationCheckDetailStateCopyWithImpl<$Res,
          ReservationCheckDetailState>;
}

/// @nodoc
class _$ReservationCheckDetailStateCopyWithImpl<$Res,
        $Val extends ReservationCheckDetailState>
    implements $ReservationCheckDetailStateCopyWith<$Res> {
  _$ReservationCheckDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ReservationCheckDetailInitialCopyWith<$Res> {
  factory _$$_ReservationCheckDetailInitialCopyWith(
          _$_ReservationCheckDetailInitial value,
          $Res Function(_$_ReservationCheckDetailInitial) then) =
      __$$_ReservationCheckDetailInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReservationCheckDetailInitialCopyWithImpl<$Res>
    extends _$ReservationCheckDetailStateCopyWithImpl<$Res,
        _$_ReservationCheckDetailInitial>
    implements _$$_ReservationCheckDetailInitialCopyWith<$Res> {
  __$$_ReservationCheckDetailInitialCopyWithImpl(
      _$_ReservationCheckDetailInitial _value,
      $Res Function(_$_ReservationCheckDetailInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReservationCheckDetailInitial
    implements _ReservationCheckDetailInitial {
  const _$_ReservationCheckDetailInitial();

  @override
  String toString() {
    return 'ReservationCheckDetailState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationCheckDetailInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReservationDetailModel? reservationDetailModel)
        success,
    required TResult Function(String? errorMsg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult? Function(String? errorMsg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult Function(String? errorMsg)? error,
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
    required TResult Function(_ReservationCheckDetailInitial value) initial,
    required TResult Function(_ReservationCheckDetailLoading value) loading,
    required TResult Function(_ReservationCheckDetailSuccess value) success,
    required TResult Function(_ReservationCheckDetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReservationCheckDetailInitial value)? initial,
    TResult? Function(_ReservationCheckDetailLoading value)? loading,
    TResult? Function(_ReservationCheckDetailSuccess value)? success,
    TResult? Function(_ReservationCheckDetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReservationCheckDetailInitial value)? initial,
    TResult Function(_ReservationCheckDetailLoading value)? loading,
    TResult Function(_ReservationCheckDetailSuccess value)? success,
    TResult Function(_ReservationCheckDetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ReservationCheckDetailInitial
    implements ReservationCheckDetailState {
  const factory _ReservationCheckDetailInitial() =
      _$_ReservationCheckDetailInitial;
}

/// @nodoc
abstract class _$$_ReservationCheckDetailLoadingCopyWith<$Res> {
  factory _$$_ReservationCheckDetailLoadingCopyWith(
          _$_ReservationCheckDetailLoading value,
          $Res Function(_$_ReservationCheckDetailLoading) then) =
      __$$_ReservationCheckDetailLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReservationCheckDetailLoadingCopyWithImpl<$Res>
    extends _$ReservationCheckDetailStateCopyWithImpl<$Res,
        _$_ReservationCheckDetailLoading>
    implements _$$_ReservationCheckDetailLoadingCopyWith<$Res> {
  __$$_ReservationCheckDetailLoadingCopyWithImpl(
      _$_ReservationCheckDetailLoading _value,
      $Res Function(_$_ReservationCheckDetailLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReservationCheckDetailLoading
    implements _ReservationCheckDetailLoading {
  const _$_ReservationCheckDetailLoading();

  @override
  String toString() {
    return 'ReservationCheckDetailState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationCheckDetailLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReservationDetailModel? reservationDetailModel)
        success,
    required TResult Function(String? errorMsg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult? Function(String? errorMsg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult Function(String? errorMsg)? error,
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
    required TResult Function(_ReservationCheckDetailInitial value) initial,
    required TResult Function(_ReservationCheckDetailLoading value) loading,
    required TResult Function(_ReservationCheckDetailSuccess value) success,
    required TResult Function(_ReservationCheckDetailError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReservationCheckDetailInitial value)? initial,
    TResult? Function(_ReservationCheckDetailLoading value)? loading,
    TResult? Function(_ReservationCheckDetailSuccess value)? success,
    TResult? Function(_ReservationCheckDetailError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReservationCheckDetailInitial value)? initial,
    TResult Function(_ReservationCheckDetailLoading value)? loading,
    TResult Function(_ReservationCheckDetailSuccess value)? success,
    TResult Function(_ReservationCheckDetailError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ReservationCheckDetailLoading
    implements ReservationCheckDetailState {
  const factory _ReservationCheckDetailLoading() =
      _$_ReservationCheckDetailLoading;
}

/// @nodoc
abstract class _$$_ReservationCheckDetailSuccessCopyWith<$Res> {
  factory _$$_ReservationCheckDetailSuccessCopyWith(
          _$_ReservationCheckDetailSuccess value,
          $Res Function(_$_ReservationCheckDetailSuccess) then) =
      __$$_ReservationCheckDetailSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ReservationDetailModel? reservationDetailModel});
}

/// @nodoc
class __$$_ReservationCheckDetailSuccessCopyWithImpl<$Res>
    extends _$ReservationCheckDetailStateCopyWithImpl<$Res,
        _$_ReservationCheckDetailSuccess>
    implements _$$_ReservationCheckDetailSuccessCopyWith<$Res> {
  __$$_ReservationCheckDetailSuccessCopyWithImpl(
      _$_ReservationCheckDetailSuccess _value,
      $Res Function(_$_ReservationCheckDetailSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationDetailModel = freezed,
  }) {
    return _then(_$_ReservationCheckDetailSuccess(
      reservationDetailModel: freezed == reservationDetailModel
          ? _value.reservationDetailModel
          : reservationDetailModel // ignore: cast_nullable_to_non_nullable
              as ReservationDetailModel?,
    ));
  }
}

/// @nodoc

class _$_ReservationCheckDetailSuccess
    implements _ReservationCheckDetailSuccess {
  const _$_ReservationCheckDetailSuccess({this.reservationDetailModel = null});

  @override
  @JsonKey()
  final ReservationDetailModel? reservationDetailModel;

  @override
  String toString() {
    return 'ReservationCheckDetailState.success(reservationDetailModel: $reservationDetailModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationCheckDetailSuccess &&
            (identical(other.reservationDetailModel, reservationDetailModel) ||
                other.reservationDetailModel == reservationDetailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reservationDetailModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationCheckDetailSuccessCopyWith<_$_ReservationCheckDetailSuccess>
      get copyWith => __$$_ReservationCheckDetailSuccessCopyWithImpl<
          _$_ReservationCheckDetailSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReservationDetailModel? reservationDetailModel)
        success,
    required TResult Function(String? errorMsg) error,
  }) {
    return success(reservationDetailModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult? Function(String? errorMsg)? error,
  }) {
    return success?.call(reservationDetailModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult Function(String? errorMsg)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(reservationDetailModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReservationCheckDetailInitial value) initial,
    required TResult Function(_ReservationCheckDetailLoading value) loading,
    required TResult Function(_ReservationCheckDetailSuccess value) success,
    required TResult Function(_ReservationCheckDetailError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReservationCheckDetailInitial value)? initial,
    TResult? Function(_ReservationCheckDetailLoading value)? loading,
    TResult? Function(_ReservationCheckDetailSuccess value)? success,
    TResult? Function(_ReservationCheckDetailError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReservationCheckDetailInitial value)? initial,
    TResult Function(_ReservationCheckDetailLoading value)? loading,
    TResult Function(_ReservationCheckDetailSuccess value)? success,
    TResult Function(_ReservationCheckDetailError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ReservationCheckDetailSuccess
    implements ReservationCheckDetailState {
  const factory _ReservationCheckDetailSuccess(
          {final ReservationDetailModel? reservationDetailModel}) =
      _$_ReservationCheckDetailSuccess;

  ReservationDetailModel? get reservationDetailModel;
  @JsonKey(ignore: true)
  _$$_ReservationCheckDetailSuccessCopyWith<_$_ReservationCheckDetailSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReservationCheckDetailErrorCopyWith<$Res> {
  factory _$$_ReservationCheckDetailErrorCopyWith(
          _$_ReservationCheckDetailError value,
          $Res Function(_$_ReservationCheckDetailError) then) =
      __$$_ReservationCheckDetailErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg});
}

/// @nodoc
class __$$_ReservationCheckDetailErrorCopyWithImpl<$Res>
    extends _$ReservationCheckDetailStateCopyWithImpl<$Res,
        _$_ReservationCheckDetailError>
    implements _$$_ReservationCheckDetailErrorCopyWith<$Res> {
  __$$_ReservationCheckDetailErrorCopyWithImpl(
      _$_ReservationCheckDetailError _value,
      $Res Function(_$_ReservationCheckDetailError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$_ReservationCheckDetailError(
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReservationCheckDetailError implements _ReservationCheckDetailError {
  const _$_ReservationCheckDetailError({this.errorMsg = null});

  @override
  @JsonKey()
  final String? errorMsg;

  @override
  String toString() {
    return 'ReservationCheckDetailState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationCheckDetailError &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationCheckDetailErrorCopyWith<_$_ReservationCheckDetailError>
      get copyWith => __$$_ReservationCheckDetailErrorCopyWithImpl<
          _$_ReservationCheckDetailError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReservationDetailModel? reservationDetailModel)
        success,
    required TResult Function(String? errorMsg) error,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult? Function(String? errorMsg)? error,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReservationDetailModel? reservationDetailModel)? success,
    TResult Function(String? errorMsg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReservationCheckDetailInitial value) initial,
    required TResult Function(_ReservationCheckDetailLoading value) loading,
    required TResult Function(_ReservationCheckDetailSuccess value) success,
    required TResult Function(_ReservationCheckDetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReservationCheckDetailInitial value)? initial,
    TResult? Function(_ReservationCheckDetailLoading value)? loading,
    TResult? Function(_ReservationCheckDetailSuccess value)? success,
    TResult? Function(_ReservationCheckDetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReservationCheckDetailInitial value)? initial,
    TResult Function(_ReservationCheckDetailLoading value)? loading,
    TResult Function(_ReservationCheckDetailSuccess value)? success,
    TResult Function(_ReservationCheckDetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ReservationCheckDetailError
    implements ReservationCheckDetailState {
  const factory _ReservationCheckDetailError({final String? errorMsg}) =
      _$_ReservationCheckDetailError;

  String? get errorMsg;
  @JsonKey(ignore: true)
  _$$_ReservationCheckDetailErrorCopyWith<_$_ReservationCheckDetailError>
      get copyWith => throw _privateConstructorUsedError;
}
