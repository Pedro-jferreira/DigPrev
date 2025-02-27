// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Login_Request _$Login_RequestFromJson(Map<String, dynamic> json) {
  return _Login_Request.fromJson(json);
}

/// @nodoc
mixin _$Login_Request {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this Login_Request to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Login_Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Login_RequestCopyWith<Login_Request> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Login_RequestCopyWith<$Res> {
  factory $Login_RequestCopyWith(
    Login_Request value,
    $Res Function(Login_Request) then,
  ) = _$Login_RequestCopyWithImpl<$Res, Login_Request>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$Login_RequestCopyWithImpl<$Res, $Val extends Login_Request>
    implements $Login_RequestCopyWith<$Res> {
  _$Login_RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Login_Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Login_RequestImplCopyWith<$Res>
    implements $Login_RequestCopyWith<$Res> {
  factory _$$Login_RequestImplCopyWith(
    _$Login_RequestImpl value,
    $Res Function(_$Login_RequestImpl) then,
  ) = __$$Login_RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$Login_RequestImplCopyWithImpl<$Res>
    extends _$Login_RequestCopyWithImpl<$Res, _$Login_RequestImpl>
    implements _$$Login_RequestImplCopyWith<$Res> {
  __$$Login_RequestImplCopyWithImpl(
    _$Login_RequestImpl _value,
    $Res Function(_$Login_RequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Login_Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$Login_RequestImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$Login_RequestImpl implements _Login_Request {
  const _$Login_RequestImpl({required this.email, required this.password});

  factory _$Login_RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$Login_RequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'Login_Request(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Login_RequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of Login_Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Login_RequestImplCopyWith<_$Login_RequestImpl> get copyWith =>
      __$$Login_RequestImplCopyWithImpl<_$Login_RequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Login_RequestImplToJson(this);
  }
}

abstract class _Login_Request implements Login_Request {
  const factory _Login_Request({
    required final String email,
    required final String password,
  }) = _$Login_RequestImpl;

  factory _Login_Request.fromJson(Map<String, dynamic> json) =
      _$Login_RequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of Login_Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Login_RequestImplCopyWith<_$Login_RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
