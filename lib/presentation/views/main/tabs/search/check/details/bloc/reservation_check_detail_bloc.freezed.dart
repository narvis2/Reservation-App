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
    required TResult Function(int? id, String? certificationNumber) requestInit,
    required TResult Function(int id, bool isApproval) requestCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
    TResult? Function(int? id, String? certificationNumber)? requestInit,
    TResult? Function(int id, bool isApproval)? requestCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    TResult Function(int? id, String? certificationNumber)? requestInit,
    TResult Function(int id, bool isApproval)? requestCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationRequestCheckDetailEvent value)
        requestDetails,
    required TResult Function(ReservationRequestCheckDetailByUserEvent value)
        requestDetailsByUser,
    required TResult Function(ReservationRequestCheckDetailInitDataEvent value)
        requestInit,
    required TResult Function(ReservationCheckDetailCheckEvent value)
        requestCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult? Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult? Function(ReservationCheckDetailCheckEvent value)? requestCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult Function(ReservationCheckDetailCheckEvent value)? requestCheck,
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
    required TResult Function(int? id, String? certificationNumber) requestInit,
    required TResult Function(int id, bool isApproval) requestCheck,
  }) {
    return requestDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
    TResult? Function(int? id, String? certificationNumber)? requestInit,
    TResult? Function(int id, bool isApproval)? requestCheck,
  }) {
    return requestDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    TResult Function(int? id, String? certificationNumber)? requestInit,
    TResult Function(int id, bool isApproval)? requestCheck,
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
    required TResult Function(ReservationRequestCheckDetailInitDataEvent value)
        requestInit,
    required TResult Function(ReservationCheckDetailCheckEvent value)
        requestCheck,
  }) {
    return requestDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult? Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult? Function(ReservationCheckDetailCheckEvent value)? requestCheck,
  }) {
    return requestDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult Function(ReservationCheckDetailCheckEvent value)? requestCheck,
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
    required TResult Function(int? id, String? certificationNumber) requestInit,
    required TResult Function(int id, bool isApproval) requestCheck,
  }) {
    return requestDetailsByUser(certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
    TResult? Function(int? id, String? certificationNumber)? requestInit,
    TResult? Function(int id, bool isApproval)? requestCheck,
  }) {
    return requestDetailsByUser?.call(certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    TResult Function(int? id, String? certificationNumber)? requestInit,
    TResult Function(int id, bool isApproval)? requestCheck,
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
    required TResult Function(ReservationRequestCheckDetailInitDataEvent value)
        requestInit,
    required TResult Function(ReservationCheckDetailCheckEvent value)
        requestCheck,
  }) {
    return requestDetailsByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult? Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult? Function(ReservationCheckDetailCheckEvent value)? requestCheck,
  }) {
    return requestDetailsByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult Function(ReservationCheckDetailCheckEvent value)? requestCheck,
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
abstract class _$$ReservationRequestCheckDetailInitDataEventCopyWith<$Res> {
  factory _$$ReservationRequestCheckDetailInitDataEventCopyWith(
          _$ReservationRequestCheckDetailInitDataEvent value,
          $Res Function(_$ReservationRequestCheckDetailInitDataEvent) then) =
      __$$ReservationRequestCheckDetailInitDataEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? certificationNumber});
}

/// @nodoc
class __$$ReservationRequestCheckDetailInitDataEventCopyWithImpl<$Res>
    extends _$ReservationCheckDetailEventCopyWithImpl<$Res,
        _$ReservationRequestCheckDetailInitDataEvent>
    implements _$$ReservationRequestCheckDetailInitDataEventCopyWith<$Res> {
  __$$ReservationRequestCheckDetailInitDataEventCopyWithImpl(
      _$ReservationRequestCheckDetailInitDataEvent _value,
      $Res Function(_$ReservationRequestCheckDetailInitDataEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? certificationNumber = freezed,
  }) {
    return _then(_$ReservationRequestCheckDetailInitDataEvent(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      certificationNumber: freezed == certificationNumber
          ? _value.certificationNumber
          : certificationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReservationRequestCheckDetailInitDataEvent
    implements ReservationRequestCheckDetailInitDataEvent {
  const _$ReservationRequestCheckDetailInitDataEvent(
      {this.id, this.certificationNumber});

  @override
  final int? id;
  @override
  final String? certificationNumber;

  @override
  String toString() {
    return 'ReservationCheckDetailEvent.requestInit(id: $id, certificationNumber: $certificationNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationRequestCheckDetailInitDataEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.certificationNumber, certificationNumber) ||
                other.certificationNumber == certificationNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, certificationNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationRequestCheckDetailInitDataEventCopyWith<
          _$ReservationRequestCheckDetailInitDataEvent>
      get copyWith =>
          __$$ReservationRequestCheckDetailInitDataEventCopyWithImpl<
              _$ReservationRequestCheckDetailInitDataEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) requestDetails,
    required TResult Function(String certificationNumber) requestDetailsByUser,
    required TResult Function(int? id, String? certificationNumber) requestInit,
    required TResult Function(int id, bool isApproval) requestCheck,
  }) {
    return requestInit(id, certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
    TResult? Function(int? id, String? certificationNumber)? requestInit,
    TResult? Function(int id, bool isApproval)? requestCheck,
  }) {
    return requestInit?.call(id, certificationNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    TResult Function(int? id, String? certificationNumber)? requestInit,
    TResult Function(int id, bool isApproval)? requestCheck,
    required TResult orElse(),
  }) {
    if (requestInit != null) {
      return requestInit(id, certificationNumber);
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
    required TResult Function(ReservationRequestCheckDetailInitDataEvent value)
        requestInit,
    required TResult Function(ReservationCheckDetailCheckEvent value)
        requestCheck,
  }) {
    return requestInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult? Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult? Function(ReservationCheckDetailCheckEvent value)? requestCheck,
  }) {
    return requestInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult Function(ReservationCheckDetailCheckEvent value)? requestCheck,
    required TResult orElse(),
  }) {
    if (requestInit != null) {
      return requestInit(this);
    }
    return orElse();
  }
}

abstract class ReservationRequestCheckDetailInitDataEvent
    implements ReservationCheckDetailEvent {
  const factory ReservationRequestCheckDetailInitDataEvent(
          {final int? id, final String? certificationNumber}) =
      _$ReservationRequestCheckDetailInitDataEvent;

  int? get id;
  String? get certificationNumber;
  @JsonKey(ignore: true)
  _$$ReservationRequestCheckDetailInitDataEventCopyWith<
          _$ReservationRequestCheckDetailInitDataEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReservationCheckDetailCheckEventCopyWith<$Res> {
  factory _$$ReservationCheckDetailCheckEventCopyWith(
          _$ReservationCheckDetailCheckEvent value,
          $Res Function(_$ReservationCheckDetailCheckEvent) then) =
      __$$ReservationCheckDetailCheckEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, bool isApproval});
}

/// @nodoc
class __$$ReservationCheckDetailCheckEventCopyWithImpl<$Res>
    extends _$ReservationCheckDetailEventCopyWithImpl<$Res,
        _$ReservationCheckDetailCheckEvent>
    implements _$$ReservationCheckDetailCheckEventCopyWith<$Res> {
  __$$ReservationCheckDetailCheckEventCopyWithImpl(
      _$ReservationCheckDetailCheckEvent _value,
      $Res Function(_$ReservationCheckDetailCheckEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApproval = null,
  }) {
    return _then(_$ReservationCheckDetailCheckEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApproval: null == isApproval
          ? _value.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReservationCheckDetailCheckEvent
    implements ReservationCheckDetailCheckEvent {
  const _$ReservationCheckDetailCheckEvent(
      {required this.id, required this.isApproval});

  @override
  final int id;
  @override
  final bool isApproval;

  @override
  String toString() {
    return 'ReservationCheckDetailEvent.requestCheck(id: $id, isApproval: $isApproval)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCheckDetailCheckEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApproval, isApproval) ||
                other.isApproval == isApproval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isApproval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationCheckDetailCheckEventCopyWith<
          _$ReservationCheckDetailCheckEvent>
      get copyWith => __$$ReservationCheckDetailCheckEventCopyWithImpl<
          _$ReservationCheckDetailCheckEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) requestDetails,
    required TResult Function(String certificationNumber) requestDetailsByUser,
    required TResult Function(int? id, String? certificationNumber) requestInit,
    required TResult Function(int id, bool isApproval) requestCheck,
  }) {
    return requestCheck(id, isApproval);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? requestDetails,
    TResult? Function(String certificationNumber)? requestDetailsByUser,
    TResult? Function(int? id, String? certificationNumber)? requestInit,
    TResult? Function(int id, bool isApproval)? requestCheck,
  }) {
    return requestCheck?.call(id, isApproval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? requestDetails,
    TResult Function(String certificationNumber)? requestDetailsByUser,
    TResult Function(int? id, String? certificationNumber)? requestInit,
    TResult Function(int id, bool isApproval)? requestCheck,
    required TResult orElse(),
  }) {
    if (requestCheck != null) {
      return requestCheck(id, isApproval);
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
    required TResult Function(ReservationRequestCheckDetailInitDataEvent value)
        requestInit,
    required TResult Function(ReservationCheckDetailCheckEvent value)
        requestCheck,
  }) {
    return requestCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult? Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult? Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult? Function(ReservationCheckDetailCheckEvent value)? requestCheck,
  }) {
    return requestCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationRequestCheckDetailEvent value)? requestDetails,
    TResult Function(ReservationRequestCheckDetailByUserEvent value)?
        requestDetailsByUser,
    TResult Function(ReservationRequestCheckDetailInitDataEvent value)?
        requestInit,
    TResult Function(ReservationCheckDetailCheckEvent value)? requestCheck,
    required TResult orElse(),
  }) {
    if (requestCheck != null) {
      return requestCheck(this);
    }
    return orElse();
  }
}

abstract class ReservationCheckDetailCheckEvent
    implements ReservationCheckDetailEvent {
  const factory ReservationCheckDetailCheckEvent(
      {required final int id,
      required final bool isApproval}) = _$ReservationCheckDetailCheckEvent;

  int get id;
  bool get isApproval;
  @JsonKey(ignore: true)
  _$$ReservationCheckDetailCheckEventCopyWith<
          _$ReservationCheckDetailCheckEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationCheckDetailState {
  ReservationDetailInfoStatus get detailInfoStatus =>
      throw _privateConstructorUsedError;
  ReservationDetailModel? get reservationDetailModel =>
      throw _privateConstructorUsedError;
  String? get detailsInfoErrorMsg => throw _privateConstructorUsedError;
  ReservationCheckStatus get checkStatus => throw _privateConstructorUsedError;
  String? get checkErrorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationCheckDetailStateCopyWith<ReservationCheckDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCheckDetailStateCopyWith<$Res> {
  factory $ReservationCheckDetailStateCopyWith(
          ReservationCheckDetailState value,
          $Res Function(ReservationCheckDetailState) then) =
      _$ReservationCheckDetailStateCopyWithImpl<$Res,
          ReservationCheckDetailState>;
  @useResult
  $Res call(
      {ReservationDetailInfoStatus detailInfoStatus,
      ReservationDetailModel? reservationDetailModel,
      String? detailsInfoErrorMsg,
      ReservationCheckStatus checkStatus,
      String? checkErrorMsg});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailInfoStatus = null,
    Object? reservationDetailModel = freezed,
    Object? detailsInfoErrorMsg = freezed,
    Object? checkStatus = null,
    Object? checkErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      detailInfoStatus: null == detailInfoStatus
          ? _value.detailInfoStatus
          : detailInfoStatus // ignore: cast_nullable_to_non_nullable
              as ReservationDetailInfoStatus,
      reservationDetailModel: freezed == reservationDetailModel
          ? _value.reservationDetailModel
          : reservationDetailModel // ignore: cast_nullable_to_non_nullable
              as ReservationDetailModel?,
      detailsInfoErrorMsg: freezed == detailsInfoErrorMsg
          ? _value.detailsInfoErrorMsg
          : detailsInfoErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      checkStatus: null == checkStatus
          ? _value.checkStatus
          : checkStatus // ignore: cast_nullable_to_non_nullable
              as ReservationCheckStatus,
      checkErrorMsg: freezed == checkErrorMsg
          ? _value.checkErrorMsg
          : checkErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $ReservationCheckDetailStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReservationDetailInfoStatus detailInfoStatus,
      ReservationDetailModel? reservationDetailModel,
      String? detailsInfoErrorMsg,
      ReservationCheckStatus checkStatus,
      String? checkErrorMsg});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ReservationCheckDetailStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailInfoStatus = null,
    Object? reservationDetailModel = freezed,
    Object? detailsInfoErrorMsg = freezed,
    Object? checkStatus = null,
    Object? checkErrorMsg = freezed,
  }) {
    return _then(_$Initial(
      detailInfoStatus: null == detailInfoStatus
          ? _value.detailInfoStatus
          : detailInfoStatus // ignore: cast_nullable_to_non_nullable
              as ReservationDetailInfoStatus,
      reservationDetailModel: freezed == reservationDetailModel
          ? _value.reservationDetailModel
          : reservationDetailModel // ignore: cast_nullable_to_non_nullable
              as ReservationDetailModel?,
      detailsInfoErrorMsg: freezed == detailsInfoErrorMsg
          ? _value.detailsInfoErrorMsg
          : detailsInfoErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      checkStatus: null == checkStatus
          ? _value.checkStatus
          : checkStatus // ignore: cast_nullable_to_non_nullable
              as ReservationCheckStatus,
      checkErrorMsg: freezed == checkErrorMsg
          ? _value.checkErrorMsg
          : checkErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {this.detailInfoStatus = ReservationDetailInfoStatus.initial,
      this.reservationDetailModel = null,
      this.detailsInfoErrorMsg = null,
      this.checkStatus = ReservationCheckStatus.initial,
      this.checkErrorMsg = null});

  @override
  @JsonKey()
  final ReservationDetailInfoStatus detailInfoStatus;
  @override
  @JsonKey()
  final ReservationDetailModel? reservationDetailModel;
  @override
  @JsonKey()
  final String? detailsInfoErrorMsg;
  @override
  @JsonKey()
  final ReservationCheckStatus checkStatus;
  @override
  @JsonKey()
  final String? checkErrorMsg;

  @override
  String toString() {
    return 'ReservationCheckDetailState(detailInfoStatus: $detailInfoStatus, reservationDetailModel: $reservationDetailModel, detailsInfoErrorMsg: $detailsInfoErrorMsg, checkStatus: $checkStatus, checkErrorMsg: $checkErrorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.detailInfoStatus, detailInfoStatus) ||
                other.detailInfoStatus == detailInfoStatus) &&
            (identical(other.reservationDetailModel, reservationDetailModel) ||
                other.reservationDetailModel == reservationDetailModel) &&
            (identical(other.detailsInfoErrorMsg, detailsInfoErrorMsg) ||
                other.detailsInfoErrorMsg == detailsInfoErrorMsg) &&
            (identical(other.checkStatus, checkStatus) ||
                other.checkStatus == checkStatus) &&
            (identical(other.checkErrorMsg, checkErrorMsg) ||
                other.checkErrorMsg == checkErrorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailInfoStatus,
      reservationDetailModel, detailsInfoErrorMsg, checkStatus, checkErrorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationCheckDetailState {
  const factory Initial(
      {final ReservationDetailInfoStatus detailInfoStatus,
      final ReservationDetailModel? reservationDetailModel,
      final String? detailsInfoErrorMsg,
      final ReservationCheckStatus checkStatus,
      final String? checkErrorMsg}) = _$Initial;

  @override
  ReservationDetailInfoStatus get detailInfoStatus;
  @override
  ReservationDetailModel? get reservationDetailModel;
  @override
  String? get detailsInfoErrorMsg;
  @override
  ReservationCheckStatus get checkStatus;
  @override
  String? get checkErrorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
