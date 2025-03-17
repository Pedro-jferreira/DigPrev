// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get dataNascimento => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get telefone => throw _privateConstructorUsedError;
  List<ConsentFormModel>? get consentForms =>
      throw _privateConstructorUsedError;
  List<String>? get acceptedConsentForms => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String nome,
    String cpf,
    String senha,
    @TimestampSerializer() DateTime dataNascimento,
    String email,
    String telefone,
    List<ConsentFormModel>? consentForms,
    List<String>? acceptedConsentForms,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
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
    Object? telefone = null,
    Object? consentForms = freezed,
    Object? acceptedConsentForms = freezed,
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
            telefone:
                null == telefone
                    ? _value.telefone
                    : telefone // ignore: cast_nullable_to_non_nullable
                        as String,
            consentForms:
                freezed == consentForms
                    ? _value.consentForms
                    : consentForms // ignore: cast_nullable_to_non_nullable
                        as List<ConsentFormModel>?,
            acceptedConsentForms:
                freezed == acceptedConsentForms
                    ? _value.acceptedConsentForms
                    : acceptedConsentForms // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String cpf,
    String senha,
    @TimestampSerializer() DateTime dataNascimento,
    String email,
    String telefone,
    List<ConsentFormModel>? consentForms,
    List<String>? acceptedConsentForms,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
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
    Object? telefone = null,
    Object? consentForms = freezed,
    Object? acceptedConsentForms = freezed,
  }) {
    return _then(
      _$UserModelImpl(
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
        telefone:
            null == telefone
                ? _value.telefone
                : telefone // ignore: cast_nullable_to_non_nullable
                    as String,
        consentForms:
            freezed == consentForms
                ? _value._consentForms
                : consentForms // ignore: cast_nullable_to_non_nullable
                    as List<ConsentFormModel>?,
        acceptedConsentForms:
            freezed == acceptedConsentForms
                ? _value._acceptedConsentForms
                : acceptedConsentForms // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.senha,
    @TimestampSerializer() required this.dataNascimento,
    required this.email,
    required this.telefone,
    final List<ConsentFormModel>? consentForms,
    final List<String>? acceptedConsentForms,
  }) : _consentForms = consentForms,
       _acceptedConsentForms = acceptedConsentForms;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String cpf;
  @override
  final String senha;
  @override
  @TimestampSerializer()
  final DateTime dataNascimento;
  @override
  final String email;
  @override
  final String telefone;
  final List<ConsentFormModel>? _consentForms;
  @override
  List<ConsentFormModel>? get consentForms {
    final value = _consentForms;
    if (value == null) return null;
    if (_consentForms is EqualUnmodifiableListView) return _consentForms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _acceptedConsentForms;
  @override
  List<String>? get acceptedConsentForms {
    final value = _acceptedConsentForms;
    if (value == null) return null;
    if (_acceptedConsentForms is EqualUnmodifiableListView)
      return _acceptedConsentForms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, nome: $nome, cpf: $cpf, senha: $senha, dataNascimento: $dataNascimento, email: $email, telefone: $telefone, consentForms: $consentForms, acceptedConsentForms: $acceptedConsentForms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('cpf', cpf))
      ..add(DiagnosticsProperty('senha', senha))
      ..add(DiagnosticsProperty('dataNascimento', dataNascimento))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('telefone', telefone))
      ..add(DiagnosticsProperty('consentForms', consentForms))
      ..add(DiagnosticsProperty('acceptedConsentForms', acceptedConsentForms));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.dataNascimento, dataNascimento) ||
                other.dataNascimento == dataNascimento) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telefone, telefone) ||
                other.telefone == telefone) &&
            const DeepCollectionEquality().equals(
              other._consentForms,
              _consentForms,
            ) &&
            const DeepCollectionEquality().equals(
              other._acceptedConsentForms,
              _acceptedConsentForms,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    cpf,
    senha,
    dataNascimento,
    email,
    telefone,
    const DeepCollectionEquality().hash(_consentForms),
    const DeepCollectionEquality().hash(_acceptedConsentForms),
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String nome,
    required final String cpf,
    required final String senha,
    @TimestampSerializer() required final DateTime dataNascimento,
    required final String email,
    required final String telefone,
    final List<ConsentFormModel>? consentForms,
    final List<String>? acceptedConsentForms,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get cpf;
  @override
  String get senha;
  @override
  @TimestampSerializer()
  DateTime get dataNascimento;
  @override
  String get email;
  @override
  String get telefone;
  @override
  List<ConsentFormModel>? get consentForms;
  @override
  List<String>? get acceptedConsentForms;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
