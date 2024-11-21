// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetHomeScreenDataImplCopyWith<$Res> {
  factory _$$GetHomeScreenDataImplCopyWith(_$GetHomeScreenDataImpl value,
          $Res Function(_$GetHomeScreenDataImpl) then) =
      __$$GetHomeScreenDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeScreenDataImpl>
    implements _$$GetHomeScreenDataImplCopyWith<$Res> {
  __$$GetHomeScreenDataImplCopyWithImpl(_$GetHomeScreenDataImpl _value,
      $Res Function(_$GetHomeScreenDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHomeScreenDataImpl implements GetHomeScreenData {
  const _$GetHomeScreenDataImpl();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenDataImpl;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<HotAndNewData> get pastYearMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trenidngNowMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tenseDramaMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southIndianMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingTvList => throw _privateConstructorUsedError;
  bool get isloading => throw _privateConstructorUsedError;
  bool get iserror => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearMovieList,
      List<HotAndNewData> trenidngNowMovieList,
      List<HotAndNewData> tenseDramaMovieList,
      List<HotAndNewData> southIndianMovieList,
      List<HotAndNewData> trendingTvList,
      bool isloading,
      bool iserror});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovieList = null,
    Object? trenidngNowMovieList = null,
    Object? tenseDramaMovieList = null,
    Object? southIndianMovieList = null,
    Object? trendingTvList = null,
    Object? isloading = null,
    Object? iserror = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovieList: null == pastYearMovieList
          ? _value.pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trenidngNowMovieList: null == trenidngNowMovieList
          ? _value.trenidngNowMovieList
          : trenidngNowMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDramaMovieList: null == tenseDramaMovieList
          ? _value.tenseDramaMovieList
          : tenseDramaMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovieList: null == southIndianMovieList
          ? _value.southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value.trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearMovieList,
      List<HotAndNewData> trenidngNowMovieList,
      List<HotAndNewData> tenseDramaMovieList,
      List<HotAndNewData> southIndianMovieList,
      List<HotAndNewData> trendingTvList,
      bool isloading,
      bool iserror});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovieList = null,
    Object? trenidngNowMovieList = null,
    Object? tenseDramaMovieList = null,
    Object? southIndianMovieList = null,
    Object? trendingTvList = null,
    Object? isloading = null,
    Object? iserror = null,
  }) {
    return _then(_$InitialImpl(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovieList: null == pastYearMovieList
          ? _value._pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trenidngNowMovieList: null == trenidngNowMovieList
          ? _value._trenidngNowMovieList
          : trenidngNowMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDramaMovieList: null == tenseDramaMovieList
          ? _value._tenseDramaMovieList
          : tenseDramaMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovieList: null == southIndianMovieList
          ? _value._southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value._trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.stateId,
      required final List<HotAndNewData> pastYearMovieList,
      required final List<HotAndNewData> trenidngNowMovieList,
      required final List<HotAndNewData> tenseDramaMovieList,
      required final List<HotAndNewData> southIndianMovieList,
      required final List<HotAndNewData> trendingTvList,
      required this.isloading,
      required this.iserror})
      : _pastYearMovieList = pastYearMovieList,
        _trenidngNowMovieList = trenidngNowMovieList,
        _tenseDramaMovieList = tenseDramaMovieList,
        _southIndianMovieList = southIndianMovieList,
        _trendingTvList = trendingTvList;

  @override
  final String stateId;
  final List<HotAndNewData> _pastYearMovieList;
  @override
  List<HotAndNewData> get pastYearMovieList {
    if (_pastYearMovieList is EqualUnmodifiableListView)
      return _pastYearMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovieList);
  }

  final List<HotAndNewData> _trenidngNowMovieList;
  @override
  List<HotAndNewData> get trenidngNowMovieList {
    if (_trenidngNowMovieList is EqualUnmodifiableListView)
      return _trenidngNowMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trenidngNowMovieList);
  }

  final List<HotAndNewData> _tenseDramaMovieList;
  @override
  List<HotAndNewData> get tenseDramaMovieList {
    if (_tenseDramaMovieList is EqualUnmodifiableListView)
      return _tenseDramaMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramaMovieList);
  }

  final List<HotAndNewData> _southIndianMovieList;
  @override
  List<HotAndNewData> get southIndianMovieList {
    if (_southIndianMovieList is EqualUnmodifiableListView)
      return _southIndianMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovieList);
  }

  final List<HotAndNewData> _trendingTvList;
  @override
  List<HotAndNewData> get trendingTvList {
    if (_trendingTvList is EqualUnmodifiableListView) return _trendingTvList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvList);
  }

  @override
  final bool isloading;
  @override
  final bool iserror;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, pastYearMovieList: $pastYearMovieList, trenidngNowMovieList: $trenidngNowMovieList, tenseDramaMovieList: $tenseDramaMovieList, southIndianMovieList: $southIndianMovieList, trendingTvList: $trendingTvList, isloading: $isloading, iserror: $iserror)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovieList, _pastYearMovieList) &&
            const DeepCollectionEquality()
                .equals(other._trenidngNowMovieList, _trenidngNowMovieList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramaMovieList, _tenseDramaMovieList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovieList, _southIndianMovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvList, _trendingTvList) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.iserror, iserror) || other.iserror == iserror));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_pastYearMovieList),
      const DeepCollectionEquality().hash(_trenidngNowMovieList),
      const DeepCollectionEquality().hash(_tenseDramaMovieList),
      const DeepCollectionEquality().hash(_southIndianMovieList),
      const DeepCollectionEquality().hash(_trendingTvList),
      isloading,
      iserror);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<HotAndNewData> pastYearMovieList,
      required final List<HotAndNewData> trenidngNowMovieList,
      required final List<HotAndNewData> tenseDramaMovieList,
      required final List<HotAndNewData> southIndianMovieList,
      required final List<HotAndNewData> trendingTvList,
      required final bool isloading,
      required final bool iserror}) = _$InitialImpl;

  @override
  String get stateId;
  @override
  List<HotAndNewData> get pastYearMovieList;
  @override
  List<HotAndNewData> get trenidngNowMovieList;
  @override
  List<HotAndNewData> get tenseDramaMovieList;
  @override
  List<HotAndNewData> get southIndianMovieList;
  @override
  List<HotAndNewData> get trendingTvList;
  @override
  bool get isloading;
  @override
  bool get iserror;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
