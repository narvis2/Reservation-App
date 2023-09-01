// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_calendar_tab_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationCalendarTabEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initData,
    required TResult Function(DateTime startTime, DateTime endTime) sectionList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initData,
    TResult? Function(DateTime startTime, DateTime endTime)? sectionList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initData,
    TResult Function(DateTime startTime, DateTime endTime)? sectionList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCalendarTabInitDataEvent value)
        initData,
    required TResult Function(ReservationCalendarTabSectionListEvent value)
        sectionList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult? Function(ReservationCalendarTabSectionListEvent value)?
        sectionList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult Function(ReservationCalendarTabSectionListEvent value)? sectionList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCalendarTabEventCopyWith<$Res> {
  factory $ReservationCalendarTabEventCopyWith(
          ReservationCalendarTabEvent value,
          $Res Function(ReservationCalendarTabEvent) then) =
      _$ReservationCalendarTabEventCopyWithImpl<$Res,
          ReservationCalendarTabEvent>;
}

/// @nodoc
class _$ReservationCalendarTabEventCopyWithImpl<$Res,
        $Val extends ReservationCalendarTabEvent>
    implements $ReservationCalendarTabEventCopyWith<$Res> {
  _$ReservationCalendarTabEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReservationCalendarTabInitDataEventCopyWith<$Res> {
  factory _$$ReservationCalendarTabInitDataEventCopyWith(
          _$ReservationCalendarTabInitDataEvent value,
          $Res Function(_$ReservationCalendarTabInitDataEvent) then) =
      __$$ReservationCalendarTabInitDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReservationCalendarTabInitDataEventCopyWithImpl<$Res>
    extends _$ReservationCalendarTabEventCopyWithImpl<$Res,
        _$ReservationCalendarTabInitDataEvent>
    implements _$$ReservationCalendarTabInitDataEventCopyWith<$Res> {
  __$$ReservationCalendarTabInitDataEventCopyWithImpl(
      _$ReservationCalendarTabInitDataEvent _value,
      $Res Function(_$ReservationCalendarTabInitDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReservationCalendarTabInitDataEvent
    with DiagnosticableTreeMixin
    implements ReservationCalendarTabInitDataEvent {
  const _$ReservationCalendarTabInitDataEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationCalendarTabEvent.initData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ReservationCalendarTabEvent.initData'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCalendarTabInitDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initData,
    required TResult Function(DateTime startTime, DateTime endTime) sectionList,
  }) {
    return initData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initData,
    TResult? Function(DateTime startTime, DateTime endTime)? sectionList,
  }) {
    return initData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initData,
    TResult Function(DateTime startTime, DateTime endTime)? sectionList,
    required TResult orElse(),
  }) {
    if (initData != null) {
      return initData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCalendarTabInitDataEvent value)
        initData,
    required TResult Function(ReservationCalendarTabSectionListEvent value)
        sectionList,
  }) {
    return initData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult? Function(ReservationCalendarTabSectionListEvent value)?
        sectionList,
  }) {
    return initData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult Function(ReservationCalendarTabSectionListEvent value)? sectionList,
    required TResult orElse(),
  }) {
    if (initData != null) {
      return initData(this);
    }
    return orElse();
  }
}

abstract class ReservationCalendarTabInitDataEvent
    implements ReservationCalendarTabEvent {
  const factory ReservationCalendarTabInitDataEvent() =
      _$ReservationCalendarTabInitDataEvent;
}

/// @nodoc
abstract class _$$ReservationCalendarTabSectionListEventCopyWith<$Res> {
  factory _$$ReservationCalendarTabSectionListEventCopyWith(
          _$ReservationCalendarTabSectionListEvent value,
          $Res Function(_$ReservationCalendarTabSectionListEvent) then) =
      __$$ReservationCalendarTabSectionListEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startTime, DateTime endTime});
}

/// @nodoc
class __$$ReservationCalendarTabSectionListEventCopyWithImpl<$Res>
    extends _$ReservationCalendarTabEventCopyWithImpl<$Res,
        _$ReservationCalendarTabSectionListEvent>
    implements _$$ReservationCalendarTabSectionListEventCopyWith<$Res> {
  __$$ReservationCalendarTabSectionListEventCopyWithImpl(
      _$ReservationCalendarTabSectionListEvent _value,
      $Res Function(_$ReservationCalendarTabSectionListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$ReservationCalendarTabSectionListEvent(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ReservationCalendarTabSectionListEvent
    with DiagnosticableTreeMixin
    implements ReservationCalendarTabSectionListEvent {
  const _$ReservationCalendarTabSectionListEvent(
      {required this.startTime, required this.endTime});

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationCalendarTabEvent.sectionList(startTime: $startTime, endTime: $endTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ReservationCalendarTabEvent.sectionList'))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCalendarTabSectionListEvent &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationCalendarTabSectionListEventCopyWith<
          _$ReservationCalendarTabSectionListEvent>
      get copyWith => __$$ReservationCalendarTabSectionListEventCopyWithImpl<
          _$ReservationCalendarTabSectionListEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initData,
    required TResult Function(DateTime startTime, DateTime endTime) sectionList,
  }) {
    return sectionList(startTime, endTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initData,
    TResult? Function(DateTime startTime, DateTime endTime)? sectionList,
  }) {
    return sectionList?.call(startTime, endTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initData,
    TResult Function(DateTime startTime, DateTime endTime)? sectionList,
    required TResult orElse(),
  }) {
    if (sectionList != null) {
      return sectionList(startTime, endTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReservationCalendarTabInitDataEvent value)
        initData,
    required TResult Function(ReservationCalendarTabSectionListEvent value)
        sectionList,
  }) {
    return sectionList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult? Function(ReservationCalendarTabSectionListEvent value)?
        sectionList,
  }) {
    return sectionList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReservationCalendarTabInitDataEvent value)? initData,
    TResult Function(ReservationCalendarTabSectionListEvent value)? sectionList,
    required TResult orElse(),
  }) {
    if (sectionList != null) {
      return sectionList(this);
    }
    return orElse();
  }
}

abstract class ReservationCalendarTabSectionListEvent
    implements ReservationCalendarTabEvent {
  const factory ReservationCalendarTabSectionListEvent(
          {required final DateTime startTime,
          required final DateTime endTime}) =
      _$ReservationCalendarTabSectionListEvent;

  DateTime get startTime;
  DateTime get endTime;
  @JsonKey(ignore: true)
  _$$ReservationCalendarTabSectionListEventCopyWith<
          _$ReservationCalendarTabSectionListEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationCalendarTabState {
  SectionListStatus get sectionListStatus => throw _privateConstructorUsedError;
  List<ReservationRangeSectionModel> get sectionList =>
      throw _privateConstructorUsedError;
  String? get sectionListErrorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationCalendarTabStateCopyWith<ReservationCalendarTabState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCalendarTabStateCopyWith<$Res> {
  factory $ReservationCalendarTabStateCopyWith(
          ReservationCalendarTabState value,
          $Res Function(ReservationCalendarTabState) then) =
      _$ReservationCalendarTabStateCopyWithImpl<$Res,
          ReservationCalendarTabState>;
  @useResult
  $Res call(
      {SectionListStatus sectionListStatus,
      List<ReservationRangeSectionModel> sectionList,
      String? sectionListErrorMsg});
}

/// @nodoc
class _$ReservationCalendarTabStateCopyWithImpl<$Res,
        $Val extends ReservationCalendarTabState>
    implements $ReservationCalendarTabStateCopyWith<$Res> {
  _$ReservationCalendarTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionListStatus = null,
    Object? sectionList = null,
    Object? sectionListErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      sectionListStatus: null == sectionListStatus
          ? _value.sectionListStatus
          : sectionListStatus // ignore: cast_nullable_to_non_nullable
              as SectionListStatus,
      sectionList: null == sectionList
          ? _value.sectionList
          : sectionList // ignore: cast_nullable_to_non_nullable
              as List<ReservationRangeSectionModel>,
      sectionListErrorMsg: freezed == sectionListErrorMsg
          ? _value.sectionListErrorMsg
          : sectionListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $ReservationCalendarTabStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SectionListStatus sectionListStatus,
      List<ReservationRangeSectionModel> sectionList,
      String? sectionListErrorMsg});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ReservationCalendarTabStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionListStatus = null,
    Object? sectionList = null,
    Object? sectionListErrorMsg = freezed,
  }) {
    return _then(_$Initial(
      sectionListStatus: null == sectionListStatus
          ? _value.sectionListStatus
          : sectionListStatus // ignore: cast_nullable_to_non_nullable
              as SectionListStatus,
      sectionList: null == sectionList
          ? _value._sectionList
          : sectionList // ignore: cast_nullable_to_non_nullable
              as List<ReservationRangeSectionModel>,
      sectionListErrorMsg: freezed == sectionListErrorMsg
          ? _value.sectionListErrorMsg
          : sectionListErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial(
      {this.sectionListStatus = SectionListStatus.initial,
      final List<ReservationRangeSectionModel> sectionList = const [],
      this.sectionListErrorMsg = null})
      : _sectionList = sectionList;

  @override
  @JsonKey()
  final SectionListStatus sectionListStatus;
  final List<ReservationRangeSectionModel> _sectionList;
  @override
  @JsonKey()
  List<ReservationRangeSectionModel> get sectionList {
    if (_sectionList is EqualUnmodifiableListView) return _sectionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sectionList);
  }

  @override
  @JsonKey()
  final String? sectionListErrorMsg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReservationCalendarTabState(sectionListStatus: $sectionListStatus, sectionList: $sectionList, sectionListErrorMsg: $sectionListErrorMsg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReservationCalendarTabState'))
      ..add(DiagnosticsProperty('sectionListStatus', sectionListStatus))
      ..add(DiagnosticsProperty('sectionList', sectionList))
      ..add(DiagnosticsProperty('sectionListErrorMsg', sectionListErrorMsg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.sectionListStatus, sectionListStatus) ||
                other.sectionListStatus == sectionListStatus) &&
            const DeepCollectionEquality()
                .equals(other._sectionList, _sectionList) &&
            (identical(other.sectionListErrorMsg, sectionListErrorMsg) ||
                other.sectionListErrorMsg == sectionListErrorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sectionListStatus,
      const DeepCollectionEquality().hash(_sectionList), sectionListErrorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ReservationCalendarTabState {
  const factory Initial(
      {final SectionListStatus sectionListStatus,
      final List<ReservationRangeSectionModel> sectionList,
      final String? sectionListErrorMsg}) = _$Initial;

  @override
  SectionListStatus get sectionListStatus;
  @override
  List<ReservationRangeSectionModel> get sectionList;
  @override
  String? get sectionListErrorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
