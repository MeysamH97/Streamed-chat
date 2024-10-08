// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtherUserModel _$OtherUserModelFromJson(Map<String, dynamic> json) {
  return _OtherUserModel.fromJson(json);
}

/// @nodoc
mixin _$OtherUserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this OtherUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherUserModelCopyWith<OtherUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserModelCopyWith<$Res> {
  factory $OtherUserModelCopyWith(
          OtherUserModel value, $Res Function(OtherUserModel) then) =
      _$OtherUserModelCopyWithImpl<$Res, OtherUserModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? username,
      String? profilePictureUrl,
      bool isOnline});
}

/// @nodoc
class _$OtherUserModelCopyWithImpl<$Res, $Val extends OtherUserModel>
    implements $OtherUserModelCopyWith<$Res> {
  _$OtherUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherUserModelImplCopyWith<$Res>
    implements $OtherUserModelCopyWith<$Res> {
  factory _$$OtherUserModelImplCopyWith(_$OtherUserModelImpl value,
          $Res Function(_$OtherUserModelImpl) then) =
      __$$OtherUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? username,
      String? profilePictureUrl,
      bool isOnline});
}

/// @nodoc
class __$$OtherUserModelImplCopyWithImpl<$Res>
    extends _$OtherUserModelCopyWithImpl<$Res, _$OtherUserModelImpl>
    implements _$$OtherUserModelImplCopyWith<$Res> {
  __$$OtherUserModelImplCopyWithImpl(
      _$OtherUserModelImpl _value, $Res Function(_$OtherUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? isOnline = null,
  }) {
    return _then(_$OtherUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherUserModelImpl implements _OtherUserModel {
  const _$OtherUserModelImpl(
      {required this.id,
      required this.email,
      this.username,
      this.profilePictureUrl,
      required this.isOnline});

  factory _$OtherUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? username;
  @override
  final String? profilePictureUrl;
  @override
  final bool isOnline;

  @override
  String toString() {
    return 'OtherUserModel(id: $id, email: $email, username: $username, profilePictureUrl: $profilePictureUrl, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, username, profilePictureUrl, isOnline);

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUserModelImplCopyWith<_$OtherUserModelImpl> get copyWith =>
      __$$OtherUserModelImplCopyWithImpl<_$OtherUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserModelImplToJson(
      this,
    );
  }
}

abstract class _OtherUserModel implements OtherUserModel {
  const factory _OtherUserModel(
      {required final String id,
      required final String email,
      final String? username,
      final String? profilePictureUrl,
      required final bool isOnline}) = _$OtherUserModelImpl;

  factory _OtherUserModel.fromJson(Map<String, dynamic> json) =
      _$OtherUserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get username;
  @override
  String? get profilePictureUrl;
  @override
  bool get isOnline;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherUserModelImplCopyWith<_$OtherUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
