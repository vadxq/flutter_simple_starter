// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GlobalModel _$GlobalModelFromJson(Map<String, dynamic> json) {
  return _GlobalModel.fromJson(json);
}

/// @nodoc
mixin _$GlobalModel {
  String get token => throw _privateConstructorUsedError;
  String get freshToken => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalModelCopyWith<GlobalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalModelCopyWith<$Res> {
  factory $GlobalModelCopyWith(
          GlobalModel value, $Res Function(GlobalModel) then) =
      _$GlobalModelCopyWithImpl<$Res, GlobalModel>;
  @useResult
  $Res call({String token, String freshToken, String username, int userId});
}

/// @nodoc
class _$GlobalModelCopyWithImpl<$Res, $Val extends GlobalModel>
    implements $GlobalModelCopyWith<$Res> {
  _$GlobalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? freshToken = null,
    Object? username = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      freshToken: null == freshToken
          ? _value.freshToken
          : freshToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalModelCopyWith<$Res>
    implements $GlobalModelCopyWith<$Res> {
  factory _$$_GlobalModelCopyWith(
          _$_GlobalModel value, $Res Function(_$_GlobalModel) then) =
      __$$_GlobalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String freshToken, String username, int userId});
}

/// @nodoc
class __$$_GlobalModelCopyWithImpl<$Res>
    extends _$GlobalModelCopyWithImpl<$Res, _$_GlobalModel>
    implements _$$_GlobalModelCopyWith<$Res> {
  __$$_GlobalModelCopyWithImpl(
      _$_GlobalModel _value, $Res Function(_$_GlobalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? freshToken = null,
    Object? username = null,
    Object? userId = null,
  }) {
    return _then(_$_GlobalModel(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      freshToken: null == freshToken
          ? _value.freshToken
          : freshToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlobalModel implements _GlobalModel {
  const _$_GlobalModel(
      {required this.token,
      required this.freshToken,
      required this.username,
      required this.userId});

  factory _$_GlobalModel.fromJson(Map<String, dynamic> json) =>
      _$$_GlobalModelFromJson(json);

  @override
  final String token;
  @override
  final String freshToken;
  @override
  final String username;
  @override
  final int userId;

  @override
  String toString() {
    return 'GlobalModel(token: $token, freshToken: $freshToken, username: $username, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.freshToken, freshToken) ||
                other.freshToken == freshToken) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, freshToken, username, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalModelCopyWith<_$_GlobalModel> get copyWith =>
      __$$_GlobalModelCopyWithImpl<_$_GlobalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlobalModelToJson(
      this,
    );
  }
}

abstract class _GlobalModel implements GlobalModel {
  const factory _GlobalModel(
      {required final String token,
      required final String freshToken,
      required final String username,
      required final int userId}) = _$_GlobalModel;

  factory _GlobalModel.fromJson(Map<String, dynamic> json) =
      _$_GlobalModel.fromJson;

  @override
  String get token;
  @override
  String get freshToken;
  @override
  String get username;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalModelCopyWith<_$_GlobalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
