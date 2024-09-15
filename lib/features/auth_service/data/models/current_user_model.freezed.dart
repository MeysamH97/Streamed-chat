// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) {
  return _CurrentUserModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentUserModel {
  String get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  List<String> get contactsId => throw _privateConstructorUsedError;
  List<String> get blockedUsersId => throw _privateConstructorUsedError;
  List<String> get chatsId => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this CurrentUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentUserModelCopyWith<CurrentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserModelCopyWith<$Res> {
  factory $CurrentUserModelCopyWith(
          CurrentUserModel value, $Res Function(CurrentUserModel) then) =
      _$CurrentUserModelCopyWithImpl<$Res, CurrentUserModel>;
  @useResult
  $Res call(
      {String id,
      String? username,
      String? profilePictureUrl,
      String email,
      String password,
      List<String> contactsId,
      List<String> blockedUsersId,
      List<String> chatsId,
      bool isOnline});
}

/// @nodoc
class _$CurrentUserModelCopyWithImpl<$Res, $Val extends CurrentUserModel>
    implements $CurrentUserModelCopyWith<$Res> {
  _$CurrentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? email = null,
    Object? password = null,
    Object? contactsId = null,
    Object? blockedUsersId = null,
    Object? chatsId = null,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      contactsId: null == contactsId
          ? _value.contactsId
          : contactsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedUsersId: null == blockedUsersId
          ? _value.blockedUsersId
          : blockedUsersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chatsId: null == chatsId
          ? _value.chatsId
          : chatsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentUserModelImplCopyWith<$Res>
    implements $CurrentUserModelCopyWith<$Res> {
  factory _$$CurrentUserModelImplCopyWith(_$CurrentUserModelImpl value,
          $Res Function(_$CurrentUserModelImpl) then) =
      __$$CurrentUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? username,
      String? profilePictureUrl,
      String email,
      String password,
      List<String> contactsId,
      List<String> blockedUsersId,
      List<String> chatsId,
      bool isOnline});
}

/// @nodoc
class __$$CurrentUserModelImplCopyWithImpl<$Res>
    extends _$CurrentUserModelCopyWithImpl<$Res, _$CurrentUserModelImpl>
    implements _$$CurrentUserModelImplCopyWith<$Res> {
  __$$CurrentUserModelImplCopyWithImpl(_$CurrentUserModelImpl _value,
      $Res Function(_$CurrentUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? email = null,
    Object? password = null,
    Object? contactsId = null,
    Object? blockedUsersId = null,
    Object? chatsId = null,
    Object? isOnline = null,
  }) {
    return _then(_$CurrentUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      contactsId: null == contactsId
          ? _value._contactsId
          : contactsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedUsersId: null == blockedUsersId
          ? _value._blockedUsersId
          : blockedUsersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chatsId: null == chatsId
          ? _value._chatsId
          : chatsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentUserModelImpl implements _CurrentUserModel {
  const _$CurrentUserModelImpl(
      {required this.id,
      this.username,
      this.profilePictureUrl,
      required this.email,
      required this.password,
      final List<String> contactsId = const [],
      final List<String> blockedUsersId = const [],
      final List<String> chatsId = const [],
      required this.isOnline})
      : _contactsId = contactsId,
        _blockedUsersId = blockedUsersId,
        _chatsId = chatsId;

  factory _$CurrentUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentUserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? username;
  @override
  final String? profilePictureUrl;
  @override
  final String email;
  @override
  final String password;
  final List<String> _contactsId;
  @override
  @JsonKey()
  List<String> get contactsId {
    if (_contactsId is EqualUnmodifiableListView) return _contactsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contactsId);
  }

  final List<String> _blockedUsersId;
  @override
  @JsonKey()
  List<String> get blockedUsersId {
    if (_blockedUsersId is EqualUnmodifiableListView) return _blockedUsersId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedUsersId);
  }

  final List<String> _chatsId;
  @override
  @JsonKey()
  List<String> get chatsId {
    if (_chatsId is EqualUnmodifiableListView) return _chatsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatsId);
  }

  @override
  final bool isOnline;

  @override
  String toString() {
    return 'CurrentUserModel(id: $id, username: $username, profilePictureUrl: $profilePictureUrl, email: $email, password: $password, contactsId: $contactsId, blockedUsersId: $blockedUsersId, chatsId: $chatsId, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality()
                .equals(other._contactsId, _contactsId) &&
            const DeepCollectionEquality()
                .equals(other._blockedUsersId, _blockedUsersId) &&
            const DeepCollectionEquality().equals(other._chatsId, _chatsId) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      profilePictureUrl,
      email,
      password,
      const DeepCollectionEquality().hash(_contactsId),
      const DeepCollectionEquality().hash(_blockedUsersId),
      const DeepCollectionEquality().hash(_chatsId),
      isOnline);

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentUserModelImplCopyWith<_$CurrentUserModelImpl> get copyWith =>
      __$$CurrentUserModelImplCopyWithImpl<_$CurrentUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentUserModelImplToJson(
      this,
    );
  }
}

abstract class _CurrentUserModel implements CurrentUserModel {
  const factory _CurrentUserModel(
      {required final String id,
      final String? username,
      final String? profilePictureUrl,
      required final String email,
      required final String password,
      final List<String> contactsId,
      final List<String> blockedUsersId,
      final List<String> chatsId,
      required final bool isOnline}) = _$CurrentUserModelImpl;

  factory _CurrentUserModel.fromJson(Map<String, dynamic> json) =
      _$CurrentUserModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get username;
  @override
  String? get profilePictureUrl;
  @override
  String get email;
  @override
  String get password;
  @override
  List<String> get contactsId;
  @override
  List<String> get blockedUsersId;
  @override
  List<String> get chatsId;
  @override
  bool get isOnline;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentUserModelImplCopyWith<_$CurrentUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
