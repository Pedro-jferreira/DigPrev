// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  DateTime get dataNascimento => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this Users to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call({
    String id,
    String nome,
    String cpf,
    String senha,
    DateTime dataNascimento,
    String email,
  });
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? cpf = null,
    Object? senha = null,
    Object? dataNascimento = null,
    Object? email = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            nome:
                null == nome
                    ? _value.nome
                    : nome // ignore: cast_nullable_to_non_nullable
                        as String,
            cpf:
                null == cpf
                    ? _value.cpf
                    : cpf // ignore: cast_nullable_to_non_nullable
                        as String,
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
                        as String,
            dataNascimento:
                null == dataNascimento
                    ? _value.dataNascimento
                    : dataNascimento // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UsersImplCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$UsersImplCopyWith(
    _$UsersImpl value,
    $Res Function(_$UsersImpl) then,
  ) = __$$UsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String cpf,
    String senha,
    DateTime dataNascimento,
    String email,
  });
}

/// @nodoc
class __$$UsersImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersImpl>
    implements _$$UsersImplCopyWith<$Res> {
  __$$UsersImplCopyWithImpl(
    _$UsersImpl _value,
    $Res Function(_$UsersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? cpf = null,
    Object? senha = null,
    Object? dataNascimento = null,
    Object? email = null,
  }) {
    return _then(
      _$UsersImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        cpf:
            null == cpf
                ? _value.cpf
                : cpf // ignore: cast_nullable_to_non_nullable
                    as String,
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
                    as String,
        dataNascimento:
            null == dataNascimento
                ? _value.dataNascimento
                : dataNascimento // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersImpl with DiagnosticableTreeMixin implements _Users {
  const _$UsersImpl({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.senha,
    required this.dataNascimento,
    required this.email,
  });

  factory _$UsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String cpf;
  @override
  final String senha;
  @override
  final DateTime dataNascimento;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Users(id: $id, nome: $nome, cpf: $cpf, senha: $senha, dataNascimento: $dataNascimento, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Users'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('cpf', cpf))
      ..add(DiagnosticsProperty('senha', senha))
      ..add(DiagnosticsProperty('dataNascimento', dataNascimento))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.dataNascimento, dataNascimento) ||
                other.dataNascimento == dataNascimento) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nome, cpf, senha, dataNascimento, email);

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      __$$UsersImplCopyWithImpl<_$UsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersImplToJson(this);
  }
}

abstract class _Users implements Users {
  const factory _Users({
    required final String id,
    required final String nome,
    required final String cpf,
    required final String senha,
    required final DateTime dataNascimento,
    required final String email,
  }) = _$UsersImpl;

  factory _Users.fromJson(Map<String, dynamic> json) = _$UsersImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get cpf;
  @override
  String get senha;
  @override
  DateTime get dataNascimento;
  @override
  String get email;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
