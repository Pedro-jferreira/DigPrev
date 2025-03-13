// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explanatoryTexts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExplanatoryTexts _$ExplanatoryTextsFromJson(Map<String, dynamic> json) {
  return _ExplanatoryTexts.fromJson(json);
}

/// @nodoc
mixin _$ExplanatoryTexts {
  String? get explanatoryText => throw _privateConstructorUsedError;

  /// Serializes this ExplanatoryTexts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExplanatoryTexts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExplanatoryTextsCopyWith<ExplanatoryTexts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExplanatoryTextsCopyWith<$Res> {
  factory $ExplanatoryTextsCopyWith(
    ExplanatoryTexts value,
    $Res Function(ExplanatoryTexts) then,
  ) = _$ExplanatoryTextsCopyWithImpl<$Res, ExplanatoryTexts>;
  @useResult
  $Res call({String? explanatoryText});
}

/// @nodoc
class _$ExplanatoryTextsCopyWithImpl<$Res, $Val extends ExplanatoryTexts>
    implements $ExplanatoryTextsCopyWith<$Res> {
  _$ExplanatoryTextsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExplanatoryTexts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? explanatoryText = freezed}) {
    return _then(
      _value.copyWith(
            explanatoryText:
                freezed == explanatoryText
                    ? _value.explanatoryText
                    : explanatoryText // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExplanatoryTextsImplCopyWith<$Res>
    implements $ExplanatoryTextsCopyWith<$Res> {
  factory _$$ExplanatoryTextsImplCopyWith(
    _$ExplanatoryTextsImpl value,
    $Res Function(_$ExplanatoryTextsImpl) then,
  ) = __$$ExplanatoryTextsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? explanatoryText});
}

/// @nodoc
class __$$ExplanatoryTextsImplCopyWithImpl<$Res>
    extends _$ExplanatoryTextsCopyWithImpl<$Res, _$ExplanatoryTextsImpl>
    implements _$$ExplanatoryTextsImplCopyWith<$Res> {
  __$$ExplanatoryTextsImplCopyWithImpl(
    _$ExplanatoryTextsImpl _value,
    $Res Function(_$ExplanatoryTextsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExplanatoryTexts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? explanatoryText = freezed}) {
    return _then(
      _$ExplanatoryTextsImpl(
        explanatoryText:
            freezed == explanatoryText
                ? _value.explanatoryText
                : explanatoryText // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExplanatoryTextsImpl implements _ExplanatoryTexts {
  const _$ExplanatoryTextsImpl({this.explanatoryText});

  factory _$ExplanatoryTextsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExplanatoryTextsImplFromJson(json);

  @override
  final String? explanatoryText;

  @override
  String toString() {
    return 'ExplanatoryTexts(explanatoryText: $explanatoryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExplanatoryTextsImpl &&
            (identical(other.explanatoryText, explanatoryText) ||
                other.explanatoryText == explanatoryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, explanatoryText);

  /// Create a copy of ExplanatoryTexts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExplanatoryTextsImplCopyWith<_$ExplanatoryTextsImpl> get copyWith =>
      __$$ExplanatoryTextsImplCopyWithImpl<_$ExplanatoryTextsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExplanatoryTextsImplToJson(this);
  }
}

abstract class _ExplanatoryTexts implements ExplanatoryTexts {
  const factory _ExplanatoryTexts({final String? explanatoryText}) =
      _$ExplanatoryTextsImpl;

  factory _ExplanatoryTexts.fromJson(Map<String, dynamic> json) =
      _$ExplanatoryTextsImpl.fromJson;

  @override
  String? get explanatoryText;

  /// Create a copy of ExplanatoryTexts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExplanatoryTextsImplCopyWith<_$ExplanatoryTextsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
