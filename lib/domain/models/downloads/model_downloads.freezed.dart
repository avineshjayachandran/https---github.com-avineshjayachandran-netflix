// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModelDownloads _$ModelDownloadsFromJson(Map<String, dynamic> json) {
  return _ModelDownloads.fromJson(json);
}

/// @nodoc
mixin _$ModelDownloads {
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this ModelDownloads to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModelDownloads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModelDownloadsCopyWith<ModelDownloads> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelDownloadsCopyWith<$Res> {
  factory $ModelDownloadsCopyWith(
          ModelDownloads value, $Res Function(ModelDownloads) then) =
      _$ModelDownloadsCopyWithImpl<$Res, ModelDownloads>;
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class _$ModelDownloadsCopyWithImpl<$Res, $Val extends ModelDownloads>
    implements $ModelDownloadsCopyWith<$Res> {
  _$ModelDownloadsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModelDownloads
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelDownloadsImplCopyWith<$Res>
    implements $ModelDownloadsCopyWith<$Res> {
  factory _$$ModelDownloadsImplCopyWith(_$ModelDownloadsImpl value,
          $Res Function(_$ModelDownloadsImpl) then) =
      __$$ModelDownloadsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class __$$ModelDownloadsImplCopyWithImpl<$Res>
    extends _$ModelDownloadsCopyWithImpl<$Res, _$ModelDownloadsImpl>
    implements _$$ModelDownloadsImplCopyWith<$Res> {
  __$$ModelDownloadsImplCopyWithImpl(
      _$ModelDownloadsImpl _value, $Res Function(_$ModelDownloadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModelDownloads
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
  }) {
    return _then(_$ModelDownloadsImpl(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelDownloadsImpl implements _ModelDownloads {
  const _$ModelDownloadsImpl(
      {@JsonKey(name: "poster_path") required this.posterPath,
      @JsonKey(name: "title") required this.title});

  factory _$ModelDownloadsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelDownloadsImplFromJson(json);

  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @override
  @JsonKey(name: "title")
  final String? title;

  @override
  String toString() {
    return 'ModelDownloads(posterPath: $posterPath, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelDownloadsImpl &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, posterPath, title);

  /// Create a copy of ModelDownloads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelDownloadsImplCopyWith<_$ModelDownloadsImpl> get copyWith =>
      __$$ModelDownloadsImplCopyWithImpl<_$ModelDownloadsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelDownloadsImplToJson(
      this,
    );
  }
}

abstract class _ModelDownloads implements ModelDownloads {
  const factory _ModelDownloads(
          {@JsonKey(name: "poster_path") required final String? posterPath,
          @JsonKey(name: "title") required final String? title}) =
      _$ModelDownloadsImpl;

  factory _ModelDownloads.fromJson(Map<String, dynamic> json) =
      _$ModelDownloadsImpl.fromJson;

  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(name: "title")
  String? get title;

  /// Create a copy of ModelDownloads
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelDownloadsImplCopyWith<_$ModelDownloadsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
