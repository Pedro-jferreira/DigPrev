// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stageLabel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StageLabel _$StageLabelFromJson(Map<String, dynamic> json) {
  return _StageLabel.fromJson(json);
}

/// @nodoc
mixin _$StageLabel {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this StageLabel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StageLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageLabelCopyWith<StageLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageLabelCopyWith<$Res> {
  factory $StageLabelCopyWith(
    StageLabel value,
    $Res Function(StageLabel) then,
  ) = _$StageLabelCopyWithImpl<$Res, StageLabel>;
  @useResult
  $Res call({int min, int max, String label});
}

/// @nodoc
class _$StageLabelCopyWithImpl<$Res, $Val extends StageLabel>
    implements $StageLabelCopyWith<$Res> {
  _$StageLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StageLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = null, Object? max = null, Object? label = null}) {
    return _then(
      _value.copyWith(
            min:
                null == min
                    ? _value.min
                    : min // ignore: cast_nullable_to_non_nullable
                        as int,
            max:
                null == max
                    ? _value.max
                    : max // ignore: cast_nullable_to_non_nullable
                        as int,
            label:
                null == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StageLabelImplCopyWith<$Res>
    implements $StageLabelCopyWith<$Res> {
  factory _$$StageLabelImplCopyWith(
    _$StageLabelImpl value,
    $Res Function(_$StageLabelImpl) then,
  ) = __$$StageLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max, String label});
}

/// @nodoc
class __$$StageLabelImplCopyWithImpl<$Res>
    extends _$StageLabelCopyWithImpl<$Res, _$StageLabelImpl>
    implements _$$StageLabelImplCopyWith<$Res> {
  __$$StageLabelImplCopyWithImpl(
    _$StageLabelImpl _value,
    $Res Function(_$StageLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StageLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = null, Object? max = null, Object? label = null}) {
    return _then(
      _$StageLabelImpl(
        min:
            null == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                    as int,
        max:
            null == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                    as int,
        label:
            null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StageLabelImpl implements _StageLabel {
  const _$StageLabelImpl({
    required this.min,
    required this.max,
    required this.label,
  });

  factory _$StageLabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageLabelImplFromJson(json);

  @override
  final int min;
  @override
  final int max;
  @override
  final String label;

  @override
  String toString() {
    return 'StageLabel(min: $min, max: $max, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageLabelImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max, label);

  /// Create a copy of StageLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageLabelImplCopyWith<_$StageLabelImpl> get copyWith =>
      __$$StageLabelImplCopyWithImpl<_$StageLabelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageLabelImplToJson(this);
  }
}

abstract class _StageLabel implements StageLabel {
  const factory _StageLabel({
    required final int min,
    required final int max,
    required final String label,
  }) = _$StageLabelImpl;

  factory _StageLabel.fromJson(Map<String, dynamic> json) =
      _$StageLabelImpl.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  String get label;

  /// Create a copy of StageLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageLabelImplCopyWith<_$StageLabelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
