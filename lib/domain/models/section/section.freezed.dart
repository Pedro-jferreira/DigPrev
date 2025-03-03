// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Section _$SectionFromJson(Map<String, dynamic> json) {
  return _Section.fromJson(json);
}

/// @nodoc
mixin _$Section {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int? get maxValue => throw _privateConstructorUsedError;
  TypeCalculate get typeCalculate => throw _privateConstructorUsedError;
  List<StageLabel>? get textUnderBar => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  /// Serializes this Section to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionCopyWith<Section> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionCopyWith<$Res> {
  factory $SectionCopyWith(Section value, $Res Function(Section) then) =
      _$SectionCopyWithImpl<$Res, Section>;
  @useResult
  $Res call({
    int id,
    String title,
    int? maxValue,
    TypeCalculate typeCalculate,
    List<StageLabel>? textUnderBar,
    List<Question> questions,
  });
}

/// @nodoc
class _$SectionCopyWithImpl<$Res, $Val extends Section>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? maxValue = freezed,
    Object? typeCalculate = null,
    Object? textUnderBar = freezed,
    Object? questions = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            maxValue:
                freezed == maxValue
                    ? _value.maxValue
                    : maxValue // ignore: cast_nullable_to_non_nullable
                        as int?,
            typeCalculate:
                null == typeCalculate
                    ? _value.typeCalculate
                    : typeCalculate // ignore: cast_nullable_to_non_nullable
                        as TypeCalculate,
            textUnderBar:
                freezed == textUnderBar
                    ? _value.textUnderBar
                    : textUnderBar // ignore: cast_nullable_to_non_nullable
                        as List<StageLabel>?,
            questions:
                null == questions
                    ? _value.questions
                    : questions // ignore: cast_nullable_to_non_nullable
                        as List<Question>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SectionImplCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$$SectionImplCopyWith(
    _$SectionImpl value,
    $Res Function(_$SectionImpl) then,
  ) = __$$SectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    int? maxValue,
    TypeCalculate typeCalculate,
    List<StageLabel>? textUnderBar,
    List<Question> questions,
  });
}

/// @nodoc
class __$$SectionImplCopyWithImpl<$Res>
    extends _$SectionCopyWithImpl<$Res, _$SectionImpl>
    implements _$$SectionImplCopyWith<$Res> {
  __$$SectionImplCopyWithImpl(
    _$SectionImpl _value,
    $Res Function(_$SectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? maxValue = freezed,
    Object? typeCalculate = null,
    Object? textUnderBar = freezed,
    Object? questions = null,
  }) {
    return _then(
      _$SectionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        maxValue:
            freezed == maxValue
                ? _value.maxValue
                : maxValue // ignore: cast_nullable_to_non_nullable
                    as int?,
        typeCalculate:
            null == typeCalculate
                ? _value.typeCalculate
                : typeCalculate // ignore: cast_nullable_to_non_nullable
                    as TypeCalculate,
        textUnderBar:
            freezed == textUnderBar
                ? _value._textUnderBar
                : textUnderBar // ignore: cast_nullable_to_non_nullable
                    as List<StageLabel>?,
        questions:
            null == questions
                ? _value._questions
                : questions // ignore: cast_nullable_to_non_nullable
                    as List<Question>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionImpl implements _Section {
  const _$SectionImpl({
    required this.id,
    required this.title,
    required this.maxValue,
    required this.typeCalculate,
    required final List<StageLabel>? textUnderBar,
    required final List<Question> questions,
  }) : _textUnderBar = textUnderBar,
       _questions = questions;

  factory _$SectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int? maxValue;
  @override
  final TypeCalculate typeCalculate;
  final List<StageLabel>? _textUnderBar;
  @override
  List<StageLabel>? get textUnderBar {
    final value = _textUnderBar;
    if (value == null) return null;
    if (_textUnderBar is EqualUnmodifiableListView) return _textUnderBar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'Section(id: $id, title: $title, maxValue: $maxValue, typeCalculate: $typeCalculate, textUnderBar: $textUnderBar, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.typeCalculate, typeCalculate) ||
                other.typeCalculate == typeCalculate) &&
            const DeepCollectionEquality().equals(
              other._textUnderBar,
              _textUnderBar,
            ) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    maxValue,
    typeCalculate,
    const DeepCollectionEquality().hash(_textUnderBar),
    const DeepCollectionEquality().hash(_questions),
  );

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      __$$SectionImplCopyWithImpl<_$SectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionImplToJson(this);
  }
}

abstract class _Section implements Section {
  const factory _Section({
    required final int id,
    required final String title,
    required final int? maxValue,
    required final TypeCalculate typeCalculate,
    required final List<StageLabel>? textUnderBar,
    required final List<Question> questions,
  }) = _$SectionImpl;

  factory _Section.fromJson(Map<String, dynamic> json) = _$SectionImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int? get maxValue;
  @override
  TypeCalculate get typeCalculate;
  @override
  List<StageLabel>? get textUnderBar;
  @override
  List<Question> get questions;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
