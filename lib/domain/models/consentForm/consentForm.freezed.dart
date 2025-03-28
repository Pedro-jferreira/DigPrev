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
  String get text => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get dataForm => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;

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
    String text,
    @TimestampSerializer() DateTime dataForm,
    String titulo,
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
    Object? text = null,
    Object? dataForm = null,
    Object? titulo = null,
  }) {
    return _then(
      _value.copyWith(
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
    String text,
    @TimestampSerializer() DateTime dataForm,
    String titulo,
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
    Object? text = null,
    Object? dataForm = null,
    Object? titulo = null,
  }) {
    return _then(
      _$ConsentFormModelImpl(
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
    required this.text,
    @TimestampSerializer() required this.dataForm,
    required this.titulo,
  });

  factory _$ConsentFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsentFormModelImplFromJson(json);

  @override
  final String text;
  @override
  @TimestampSerializer()
  final DateTime dataForm;
  @override
  final String titulo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsentFormModel(text: $text, dataForm: $dataForm, titulo: $titulo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsentFormModel'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('dataForm', dataForm))
      ..add(DiagnosticsProperty('titulo', titulo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsentFormModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dataForm, dataForm) ||
                other.dataForm == dataForm) &&
            (identical(other.titulo, titulo) || other.titulo == titulo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, dataForm, titulo);

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
    required final String text,
    @TimestampSerializer() required final DateTime dataForm,
    required final String titulo,
  }) = _$ConsentFormModelImpl;

  factory _ConsentFormModel.fromJson(Map<String, dynamic> json) =
      _$ConsentFormModelImpl.fromJson;

  @override
  String get text;
  @override
  @TimestampSerializer()
  DateTime get dataForm;
  @override
  String get titulo;

  /// Create a copy of ConsentFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsentFormModelImplCopyWith<_$ConsentFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
