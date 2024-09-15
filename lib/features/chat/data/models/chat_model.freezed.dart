// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get pictureUrl => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  List<String> get adminsId => throw _privateConstructorUsedError;
  List<String> get membersId => throw _privateConstructorUsedError;
  List<String> get messagesId => throw _privateConstructorUsedError;
  List<String> get isTypingsId => throw _privateConstructorUsedError;
  ChatType get type => throw _privateConstructorUsedError;

  /// Serializes this ChatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? pictureUrl,
      String ownerId,
      List<String> adminsId,
      List<String> membersId,
      List<String> messagesId,
      List<String> isTypingsId,
      ChatType type});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? pictureUrl = freezed,
    Object? ownerId = null,
    Object? adminsId = null,
    Object? membersId = null,
    Object? messagesId = null,
    Object? isTypingsId = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      adminsId: null == adminsId
          ? _value.adminsId
          : adminsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      membersId: null == membersId
          ? _value.membersId
          : membersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messagesId: null == messagesId
          ? _value.messagesId
          : messagesId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTypingsId: null == isTypingsId
          ? _value.isTypingsId
          : isTypingsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? pictureUrl,
      String ownerId,
      List<String> adminsId,
      List<String> membersId,
      List<String> messagesId,
      List<String> isTypingsId,
      ChatType type});
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? pictureUrl = freezed,
    Object? ownerId = null,
    Object? adminsId = null,
    Object? membersId = null,
    Object? messagesId = null,
    Object? isTypingsId = null,
    Object? type = null,
  }) {
    return _then(_$ChatModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      adminsId: null == adminsId
          ? _value._adminsId
          : adminsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      membersId: null == membersId
          ? _value._membersId
          : membersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messagesId: null == messagesId
          ? _value._messagesId
          : messagesId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTypingsId: null == isTypingsId
          ? _value._isTypingsId
          : isTypingsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  const _$ChatModelImpl(
      {required this.id,
      required this.title,
      this.pictureUrl,
      required this.ownerId,
      required final List<String> adminsId,
      required final List<String> membersId,
      final List<String> messagesId = const [],
      final List<String> isTypingsId = const [],
      required this.type})
      : _adminsId = adminsId,
        _membersId = membersId,
        _messagesId = messagesId,
        _isTypingsId = isTypingsId;

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? pictureUrl;
  @override
  final String ownerId;
  final List<String> _adminsId;
  @override
  List<String> get adminsId {
    if (_adminsId is EqualUnmodifiableListView) return _adminsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminsId);
  }

  final List<String> _membersId;
  @override
  List<String> get membersId {
    if (_membersId is EqualUnmodifiableListView) return _membersId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membersId);
  }

  final List<String> _messagesId;
  @override
  @JsonKey()
  List<String> get messagesId {
    if (_messagesId is EqualUnmodifiableListView) return _messagesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messagesId);
  }

  final List<String> _isTypingsId;
  @override
  @JsonKey()
  List<String> get isTypingsId {
    if (_isTypingsId is EqualUnmodifiableListView) return _isTypingsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isTypingsId);
  }

  @override
  final ChatType type;

  @override
  String toString() {
    return 'ChatModel(id: $id, title: $title, pictureUrl: $pictureUrl, ownerId: $ownerId, adminsId: $adminsId, membersId: $membersId, messagesId: $messagesId, isTypingsId: $isTypingsId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality().equals(other._adminsId, _adminsId) &&
            const DeepCollectionEquality()
                .equals(other._membersId, _membersId) &&
            const DeepCollectionEquality()
                .equals(other._messagesId, _messagesId) &&
            const DeepCollectionEquality()
                .equals(other._isTypingsId, _isTypingsId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      pictureUrl,
      ownerId,
      const DeepCollectionEquality().hash(_adminsId),
      const DeepCollectionEquality().hash(_membersId),
      const DeepCollectionEquality().hash(_messagesId),
      const DeepCollectionEquality().hash(_isTypingsId),
      type);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {required final String id,
      required final String title,
      final String? pictureUrl,
      required final String ownerId,
      required final List<String> adminsId,
      required final List<String> membersId,
      final List<String> messagesId,
      final List<String> isTypingsId,
      required final ChatType type}) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get pictureUrl;
  @override
  String get ownerId;
  @override
  List<String> get adminsId;
  @override
  List<String> get membersId;
  @override
  List<String> get messagesId;
  @override
  List<String> get isTypingsId;
  @override
  ChatType get type;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
