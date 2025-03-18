// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  int get counter => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  double? get valueScore => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({int counter, String? text, double? valueScore, String? intensity});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? text = freezed,
    Object? valueScore = freezed,
    Object? intensity = freezed,
  }) {
    return _then(
      _value.copyWith(
            counter:
                null == counter
                    ? _value.counter
                    : counter // ignore: cast_nullable_to_non_nullable
                        as int,
            text:
                freezed == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String?,
            valueScore:
                freezed == valueScore
                    ? _value.valueScore
                    : valueScore // ignore: cast_nullable_to_non_nullable
                        as double?,
            intensity:
                freezed == intensity
                    ? _value.intensity
                    : intensity // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
    _$OptionImpl value,
    $Res Function(_$OptionImpl) then,
  ) = __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter, String? text, double? valueScore, String? intensity});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
    _$OptionImpl _value,
    $Res Function(_$OptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? text = freezed,
    Object? valueScore = freezed,
    Object? intensity = freezed,
  }) {
    return _then(
      _$OptionImpl(
        counter:
            null == counter
                ? _value.counter
                : counter // ignore: cast_nullable_to_non_nullable
                    as int,
        text:
            freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String?,
        valueScore:
            freezed == valueScore
                ? _value.valueScore
                : valueScore // ignore: cast_nullable_to_non_nullable
                    as double?,
        intensity:
            freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  const _$OptionImpl({
    required this.counter,
    required this.text,
    required this.valueScore,
    required this.intensity,
  });

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  final int counter;
  @override
  final String? text;
  @override
  final double? valueScore;
  @override
  final String? intensity;

  @override
  String toString() {
    return 'Option(counter: $counter, text: $text, valueScore: $valueScore, intensity: $intensity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.valueScore, valueScore) ||
                other.valueScore == valueScore) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, counter, text, valueScore, intensity);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(this);
  }
}

abstract class _Option implements Option {
  const factory _Option({
    required final int counter,
    required final String? text,
    required final double? valueScore,
    required final String? intensity,
  }) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  int get counter;
  @override
  String? get text;
  @override
  double? get valueScore;
  @override
  String? get intensity;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
