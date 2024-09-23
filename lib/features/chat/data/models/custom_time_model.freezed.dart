// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomTimeModel _$CustomTimeModelFromJson(Map<String, dynamic> json) {
  return _CustomTimeModel.fromJson(json);
}

/// @nodoc
mixin _$CustomTimeModel {
  int get seconds => throw _privateConstructorUsedError;
  int get nanoseconds => throw _privateConstructorUsedError;

  /// Serializes this CustomTimeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomTimeModelCopyWith<CustomTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTimeModelCopyWith<$Res> {
  factory $CustomTimeModelCopyWith(
          CustomTimeModel value, $Res Function(CustomTimeModel) then) =
      _$CustomTimeModelCopyWithImpl<$Res, CustomTimeModel>;
  @useResult
  $Res call({int seconds, int nanoseconds});
}

/// @nodoc
class _$CustomTimeModelCopyWithImpl<$Res, $Val extends CustomTimeModel>
    implements $CustomTimeModelCopyWith<$Res> {
  _$CustomTimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
    Object? nanoseconds = null,
  }) {
    return _then(_value.copyWith(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      nanoseconds: null == nanoseconds
          ? _value.nanoseconds
          : nanoseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomTimeModelImplCopyWith<$Res>
    implements $CustomTimeModelCopyWith<$Res> {
  factory _$$CustomTimeModelImplCopyWith(_$CustomTimeModelImpl value,
          $Res Function(_$CustomTimeModelImpl) then) =
      __$$CustomTimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int seconds, int nanoseconds});
}

/// @nodoc
class __$$CustomTimeModelImplCopyWithImpl<$Res>
    extends _$CustomTimeModelCopyWithImpl<$Res, _$CustomTimeModelImpl>
    implements _$$CustomTimeModelImplCopyWith<$Res> {
  __$$CustomTimeModelImplCopyWithImpl(
      _$CustomTimeModelImpl _value, $Res Function(_$CustomTimeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
    Object? nanoseconds = null,
  }) {
    return _then(_$CustomTimeModelImpl(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      nanoseconds: null == nanoseconds
          ? _value.nanoseconds
          : nanoseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomTimeModelImpl implements _CustomTimeModel {
  const _$CustomTimeModelImpl(
      {required this.seconds, required this.nanoseconds});

  factory _$CustomTimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomTimeModelImplFromJson(json);

  @override
  final int seconds;
  @override
  final int nanoseconds;

  @override
  String toString() {
    return 'CustomTimeModel(seconds: $seconds, nanoseconds: $nanoseconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomTimeModelImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.nanoseconds, nanoseconds) ||
                other.nanoseconds == nanoseconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seconds, nanoseconds);

  /// Create a copy of CustomTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTimeModelImplCopyWith<_$CustomTimeModelImpl> get copyWith =>
      __$$CustomTimeModelImplCopyWithImpl<_$CustomTimeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomTimeModelImplToJson(
      this,
    );
  }
}

abstract class _CustomTimeModel implements CustomTimeModel {
  const factory _CustomTimeModel(
      {required final int seconds,
      required final int nanoseconds}) = _$CustomTimeModelImpl;

  factory _CustomTimeModel.fromJson(Map<String, dynamic> json) =
      _$CustomTimeModelImpl.fromJson;

  @override
  int get seconds;
  @override
  int get nanoseconds;

  /// Create a copy of CustomTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomTimeModelImplCopyWith<_$CustomTimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
