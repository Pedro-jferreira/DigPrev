// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consentForm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsentFormModel _$ConsentFormModelFromJson(Map<String, dynamic> json) {
  return _ConsentFormModel.fromJson(json);
}

/// @nodoc
mixin _$ConsentFormModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get dataForm => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  StatusConsentForm get status => throw _privateConstructorUsedError;

  /// Serializes this ConsentFormModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsentFormModelCopyWith<ConsentFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsentFormModelCopyWith<$Res> {
  factory $ConsentFormModelCopyWith(
    ConsentFormModel value,
    $Res Function(ConsentFormModel) then,
  ) = _$ConsentFormModelCopyWithImpl<$Res, ConsentFormModel>;
  @useResult
  $Res call({
    String id,
    String text,
    @TimestampSerializer() DateTime dataForm,
    String titulo,
    StatusConsentForm status,
  });
}

/// @nodoc
class _$ConsentFormModelCopyWithImpl<$Res, $Val extends ConsentFormModel>
    implements $ConsentFormModelCopyWith<$Res> {
  _$ConsentFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? dataForm = null,
    Object? titulo = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            dataForm:
                null == dataForm
                    ? _value.dataForm
                    : dataForm // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            titulo:
                null == titulo
                    ? _value.titulo
                    : titulo // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as StatusConsentForm,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsentFormModelImplCopyWith<$Res>
    implements $ConsentFormModelCopyWith<$Res> {
  factory _$$ConsentFormModelImplCopyWith(
    _$ConsentFormModelImpl value,
    $Res Function(_$ConsentFormModelImpl) then,
  ) = __$$ConsentFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    @TimestampSerializer() DateTime dataForm,
    String titulo,
    StatusConsentForm status,
  });
}

/// @nodoc
class __$$ConsentFormModelImplCopyWithImpl<$Res>
    extends _$ConsentFormModelCopyWithImpl<$Res, _$ConsentFormModelImpl>
    implements _$$ConsentFormModelImplCopyWith<$Res> {
  __$$ConsentFormModelImplCopyWithImpl(
    _$ConsentFormModelImpl _value,
    $Res Function(_$ConsentFormModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? dataForm = null,
    Object? titulo = null,
    Object? status = null,
  }) {
    return _then(
      _$ConsentFormModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        dataForm:
            null == dataForm
                ? _value.dataForm
                : dataForm // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        titulo:
            null == titulo
                ? _value.titulo
                : titulo // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as StatusConsentForm,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsentFormModelImpl
    with DiagnosticableTreeMixin
    implements _ConsentFormModel {
  const _$ConsentFormModelImpl({
    required this.id,
    required this.text,
    @TimestampSerializer() required this.dataForm,
    required this.titulo,
    required this.status,
  });

  factory _$ConsentFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsentFormModelImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @TimestampSerializer()
  final DateTime dataForm;
  @override
  final String titulo;
  @override
  final StatusConsentForm status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsentFormModel(id: $id, text: $text, dataForm: $dataForm, titulo: $titulo, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsentFormModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('dataForm', dataForm))
      ..add(DiagnosticsProperty('titulo', titulo))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsentFormModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dataForm, dataForm) ||
                other.dataForm == dataForm) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, text, dataForm, titulo, status);

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsentFormModelImplCopyWith<_$ConsentFormModelImpl> get copyWith =>
      __$$ConsentFormModelImplCopyWithImpl<_$ConsentFormModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsentFormModelImplToJson(this);
  }
}

abstract class _ConsentFormModel implements ConsentFormModel {
  const factory _ConsentFormModel({
    required final String id,
    required final String text,
    @TimestampSerializer() required final DateTime dataForm,
    required final String titulo,
    required final StatusConsentForm status,
  }) = _$ConsentFormModelImpl;

  factory _ConsentFormModel.fromJson(Map<String, dynamic> json) =
      _$ConsentFormModelImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  @TimestampSerializer()
  DateTime get dataForm;
  @override
  String get titulo;
  @override
  StatusConsentForm get status;

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsentFormModelImplCopyWith<_$ConsentFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
