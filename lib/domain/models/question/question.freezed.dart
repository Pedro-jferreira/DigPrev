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
  String get id => throw _privateConstructorUsedError;
  int get counter => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get placeholder => throw _privateConstructorUsedError;
  String get supportingText => throw _privateConstructorUsedError;
  String get tooltipText => throw _privateConstructorUsedError;
  InputType get inputType => throw _privateConstructorUsedError;
  List<ExplanatoryTexts>? get explanatoryTexts =>
      throw _privateConstructorUsedError;
  List<Option> get optionsQuestions => throw _privateConstructorUsedError;
  List<String>? get disableQuestions => throw _privateConstructorUsedError;
  bool? get exclusiveLastItem => throw _privateConstructorUsedError;

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
    String id,
    int counter,
    String question,
    String placeholder,
    String supportingText,
    String tooltipText,
    InputType inputType,
    List<ExplanatoryTexts>? explanatoryTexts,
    List<Option> optionsQuestions,
    List<String>? disableQuestions,
    bool? exclusiveLastItem,
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
    Object? id = null,
    Object? counter = null,
    Object? question = null,
    Object? placeholder = null,
    Object? supportingText = null,
    Object? tooltipText = null,
    Object? inputType = null,
    Object? explanatoryTexts = freezed,
    Object? optionsQuestions = null,
    Object? disableQuestions = freezed,
    Object? exclusiveLastItem = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            counter:
                null == counter
                    ? _value.counter
                    : counter // ignore: cast_nullable_to_non_nullable
                        as int,
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
                        as List<ExplanatoryTexts>?,
            optionsQuestions:
                null == optionsQuestions
                    ? _value.optionsQuestions
                    : optionsQuestions // ignore: cast_nullable_to_non_nullable
                        as List<Option>,
            disableQuestions:
                freezed == disableQuestions
                    ? _value.disableQuestions
                    : disableQuestions // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            exclusiveLastItem:
                freezed == exclusiveLastItem
                    ? _value.exclusiveLastItem
                    : exclusiveLastItem // ignore: cast_nullable_to_non_nullable
                        as bool?,
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
    String id,
    int counter,
    String question,
    String placeholder,
    String supportingText,
    String tooltipText,
    InputType inputType,
    List<ExplanatoryTexts>? explanatoryTexts,
    List<Option> optionsQuestions,
    List<String>? disableQuestions,
    bool? exclusiveLastItem,
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
    Object? id = null,
    Object? counter = null,
    Object? question = null,
    Object? placeholder = null,
    Object? supportingText = null,
    Object? tooltipText = null,
    Object? inputType = null,
    Object? explanatoryTexts = freezed,
    Object? optionsQuestions = null,
    Object? disableQuestions = freezed,
    Object? exclusiveLastItem = freezed,
  }) {
    return _then(
      _$QuestionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        counter:
            null == counter
                ? _value.counter
                : counter // ignore: cast_nullable_to_non_nullable
                    as int,
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
                    as List<ExplanatoryTexts>?,
        optionsQuestions:
            null == optionsQuestions
                ? _value._optionsQuestions
                : optionsQuestions // ignore: cast_nullable_to_non_nullable
                    as List<Option>,
        disableQuestions:
            freezed == disableQuestions
                ? _value._disableQuestions
                : disableQuestions // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        exclusiveLastItem:
            freezed == exclusiveLastItem
                ? _value.exclusiveLastItem
                : exclusiveLastItem // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl({
    required this.id,
    required this.counter,
    required this.question,
    required this.placeholder,
    required this.supportingText,
    required this.tooltipText,
    required this.inputType,
    required final List<ExplanatoryTexts>? explanatoryTexts,
    required final List<Option> optionsQuestions,
    required final List<String>? disableQuestions,
    required this.exclusiveLastItem,
  }) : _explanatoryTexts = explanatoryTexts,
       _optionsQuestions = optionsQuestions,
       _disableQuestions = disableQuestions;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String id;
  @override
  final int counter;
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
  final List<ExplanatoryTexts>? _explanatoryTexts;
  @override
  List<ExplanatoryTexts>? get explanatoryTexts {
    final value = _explanatoryTexts;
    if (value == null) return null;
    if (_explanatoryTexts is EqualUnmodifiableListView)
      return _explanatoryTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Option> _optionsQuestions;
  @override
  List<Option> get optionsQuestions {
    if (_optionsQuestions is EqualUnmodifiableListView)
      return _optionsQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionsQuestions);
  }

  final List<String>? _disableQuestions;
  @override
  List<String>? get disableQuestions {
    final value = _disableQuestions;
    if (value == null) return null;
    if (_disableQuestions is EqualUnmodifiableListView)
      return _disableQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? exclusiveLastItem;

  @override
  String toString() {
    return 'Question(id: $id, counter: $counter, question: $question, placeholder: $placeholder, supportingText: $supportingText, tooltipText: $tooltipText, inputType: $inputType, explanatoryTexts: $explanatoryTexts, optionsQuestions: $optionsQuestions, disableQuestions: $disableQuestions, exclusiveLastItem: $exclusiveLastItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.counter, counter) || other.counter == counter) &&
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
            const DeepCollectionEquality().equals(
              other._optionsQuestions,
              _optionsQuestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._disableQuestions,
              _disableQuestions,
            ) &&
            (identical(other.exclusiveLastItem, exclusiveLastItem) ||
                other.exclusiveLastItem == exclusiveLastItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    counter,
    question,
    placeholder,
    supportingText,
    tooltipText,
    inputType,
    const DeepCollectionEquality().hash(_explanatoryTexts),
    const DeepCollectionEquality().hash(_optionsQuestions),
    const DeepCollectionEquality().hash(_disableQuestions),
    exclusiveLastItem,
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
    required final String id,
    required final int counter,
    required final String question,
    required final String placeholder,
    required final String supportingText,
    required final String tooltipText,
    required final InputType inputType,
    required final List<ExplanatoryTexts>? explanatoryTexts,
    required final List<Option> optionsQuestions,
    required final List<String>? disableQuestions,
    required final bool? exclusiveLastItem,
  }) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get id;
  @override
  int get counter;
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
  List<ExplanatoryTexts>? get explanatoryTexts;
  @override
  List<Option> get optionsQuestions;
  @override
  List<String>? get disableQuestions;
  @override
  bool? get exclusiveLastItem;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
