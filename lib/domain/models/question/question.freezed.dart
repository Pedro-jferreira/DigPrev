// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get question => throw _privateConstructorUsedError;
  String get placeholder => throw _privateConstructorUsedError;
  String get supportingText => throw _privateConstructorUsedError;
  String get tooltipText => throw _privateConstructorUsedError;
  InputType get inputType => throw _privateConstructorUsedError;
  List<String>? get explanatoryTexts => throw _privateConstructorUsedError;
  List<Option>? get options => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({
    String question,
    String placeholder,
    String supportingText,
    String tooltipText,
    InputType inputType,
    List<String>? explanatoryTexts,
    List<Option>? options,
  });
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? placeholder = null,
    Object? supportingText = null,
    Object? tooltipText = null,
    Object? inputType = null,
    Object? explanatoryTexts = freezed,
    Object? options = freezed,
  }) {
    return _then(
      _value.copyWith(
            question:
                null == question
                    ? _value.question
                    : question // ignore: cast_nullable_to_non_nullable
                        as String,
            placeholder:
                null == placeholder
                    ? _value.placeholder
                    : placeholder // ignore: cast_nullable_to_non_nullable
                        as String,
            supportingText:
                null == supportingText
                    ? _value.supportingText
                    : supportingText // ignore: cast_nullable_to_non_nullable
                        as String,
            tooltipText:
                null == tooltipText
                    ? _value.tooltipText
                    : tooltipText // ignore: cast_nullable_to_non_nullable
                        as String,
            inputType:
                null == inputType
                    ? _value.inputType
                    : inputType // ignore: cast_nullable_to_non_nullable
                        as InputType,
            explanatoryTexts:
                freezed == explanatoryTexts
                    ? _value.explanatoryTexts
                    : explanatoryTexts // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            options:
                freezed == options
                    ? _value.options
                    : options // ignore: cast_nullable_to_non_nullable
                        as List<Option>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
    _$QuestionImpl value,
    $Res Function(_$QuestionImpl) then,
  ) = __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String question,
    String placeholder,
    String supportingText,
    String tooltipText,
    InputType inputType,
    List<String>? explanatoryTexts,
    List<Option>? options,
  });
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
    _$QuestionImpl _value,
    $Res Function(_$QuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? placeholder = null,
    Object? supportingText = null,
    Object? tooltipText = null,
    Object? inputType = null,
    Object? explanatoryTexts = freezed,
    Object? options = freezed,
  }) {
    return _then(
      _$QuestionImpl(
        question:
            null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                    as String,
        placeholder:
            null == placeholder
                ? _value.placeholder
                : placeholder // ignore: cast_nullable_to_non_nullable
                    as String,
        supportingText:
            null == supportingText
                ? _value.supportingText
                : supportingText // ignore: cast_nullable_to_non_nullable
                    as String,
        tooltipText:
            null == tooltipText
                ? _value.tooltipText
                : tooltipText // ignore: cast_nullable_to_non_nullable
                    as String,
        inputType:
            null == inputType
                ? _value.inputType
                : inputType // ignore: cast_nullable_to_non_nullable
                    as InputType,
        explanatoryTexts:
            freezed == explanatoryTexts
                ? _value._explanatoryTexts
                : explanatoryTexts // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        options:
            freezed == options
                ? _value._options
                : options // ignore: cast_nullable_to_non_nullable
                    as List<Option>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl({
    required this.question,
    required this.placeholder,
    required this.supportingText,
    required this.tooltipText,
    required this.inputType,
    required final List<String>? explanatoryTexts,
    required final List<Option>? options,
  }) : _explanatoryTexts = explanatoryTexts,
       _options = options;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String question;
  @override
  final String placeholder;
  @override
  final String supportingText;
  @override
  final String tooltipText;
  @override
  final InputType inputType;
  final List<String>? _explanatoryTexts;
  @override
  List<String>? get explanatoryTexts {
    final value = _explanatoryTexts;
    if (value == null) return null;
    if (_explanatoryTexts is EqualUnmodifiableListView)
      return _explanatoryTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Option>? _options;
  @override
  List<Option>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Question(question: $question, placeholder: $placeholder, supportingText: $supportingText, tooltipText: $tooltipText, inputType: $inputType, explanatoryTexts: $explanatoryTexts, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.supportingText, supportingText) ||
                other.supportingText == supportingText) &&
            (identical(other.tooltipText, tooltipText) ||
                other.tooltipText == tooltipText) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            const DeepCollectionEquality().equals(
              other._explanatoryTexts,
              _explanatoryTexts,
            ) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    question,
    placeholder,
    supportingText,
    tooltipText,
    inputType,
    const DeepCollectionEquality().hash(_explanatoryTexts),
    const DeepCollectionEquality().hash(_options),
  );

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(this);
  }
}

abstract class _Question implements Question {
  const factory _Question({
    required final String question,
    required final String placeholder,
    required final String supportingText,
    required final String tooltipText,
    required final InputType inputType,
    required final List<String>? explanatoryTexts,
    required final List<Option>? options,
  }) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get question;
  @override
  String get placeholder;
  @override
  String get supportingText;
  @override
  String get tooltipText;
  @override
  InputType get inputType;
  @override
  List<String>? get explanatoryTexts;
  @override
  List<Option>? get options;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
