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
  double get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get maxValue => throw _privateConstructorUsedError;
  TypeCalculate get typeCalculate => throw _privateConstructorUsedError;
  String? get textUnderBar => throw _privateConstructorUsedError;
  String get tooltipText => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;
  List<Section>? get subSections => throw _privateConstructorUsedError;
  bool get hasChart => throw _privateConstructorUsedError;

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
    double id,
    String title,
    double maxValue,
    TypeCalculate typeCalculate,
    String? textUnderBar,
    String tooltipText,
    List<Question> questions,
    List<Section>? subSections,
    bool hasChart,
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
    Object? maxValue = null,
    Object? typeCalculate = null,
    Object? textUnderBar = freezed,
    Object? tooltipText = null,
    Object? questions = null,
    Object? subSections = freezed,
    Object? hasChart = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as double,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            maxValue:
                null == maxValue
                    ? _value.maxValue
                    : maxValue // ignore: cast_nullable_to_non_nullable
                        as double,
            typeCalculate:
                null == typeCalculate
                    ? _value.typeCalculate
                    : typeCalculate // ignore: cast_nullable_to_non_nullable
                        as TypeCalculate,
            textUnderBar:
                freezed == textUnderBar
                    ? _value.textUnderBar
                    : textUnderBar // ignore: cast_nullable_to_non_nullable
                        as String?,
            tooltipText:
                null == tooltipText
                    ? _value.tooltipText
                    : tooltipText // ignore: cast_nullable_to_non_nullable
                        as String,
            questions:
                null == questions
                    ? _value.questions
                    : questions // ignore: cast_nullable_to_non_nullable
                        as List<Question>,
            subSections:
                freezed == subSections
                    ? _value.subSections
                    : subSections // ignore: cast_nullable_to_non_nullable
                        as List<Section>?,
            hasChart:
                null == hasChart
                    ? _value.hasChart
                    : hasChart // ignore: cast_nullable_to_non_nullable
                        as bool,
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
    double id,
    String title,
    double maxValue,
    TypeCalculate typeCalculate,
    String? textUnderBar,
    String tooltipText,
    List<Question> questions,
    List<Section>? subSections,
    bool hasChart,
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
    Object? maxValue = null,
    Object? typeCalculate = null,
    Object? textUnderBar = freezed,
    Object? tooltipText = null,
    Object? questions = null,
    Object? subSections = freezed,
    Object? hasChart = null,
  }) {
    return _then(
      _$SectionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as double,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        maxValue:
            null == maxValue
                ? _value.maxValue
                : maxValue // ignore: cast_nullable_to_non_nullable
                    as double,
        typeCalculate:
            null == typeCalculate
                ? _value.typeCalculate
                : typeCalculate // ignore: cast_nullable_to_non_nullable
                    as TypeCalculate,
        textUnderBar:
            freezed == textUnderBar
                ? _value.textUnderBar
                : textUnderBar // ignore: cast_nullable_to_non_nullable
                    as String?,
        tooltipText:
            null == tooltipText
                ? _value.tooltipText
                : tooltipText // ignore: cast_nullable_to_non_nullable
                    as String,
        questions:
            null == questions
                ? _value._questions
                : questions // ignore: cast_nullable_to_non_nullable
                    as List<Question>,
        subSections:
            freezed == subSections
                ? _value._subSections
                : subSections // ignore: cast_nullable_to_non_nullable
                    as List<Section>?,
        hasChart:
            null == hasChart
                ? _value.hasChart
                : hasChart // ignore: cast_nullable_to_non_nullable
                    as bool,
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
    required this.textUnderBar,
    required this.tooltipText,
    required final List<Question> questions,
    required final List<Section>? subSections,
    required this.hasChart,
  }) : _questions = questions,
       _subSections = subSections;

  factory _$SectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionImplFromJson(json);

  @override
  final double id;
  @override
  final String title;
  @override
  final double maxValue;
  @override
  final TypeCalculate typeCalculate;
  @override
  final String? textUnderBar;
  @override
  final String tooltipText;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<Section>? _subSections;
  @override
  List<Section>? get subSections {
    final value = _subSections;
    if (value == null) return null;
    if (_subSections is EqualUnmodifiableListView) return _subSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool hasChart;

  @override
  String toString() {
    return 'Section(id: $id, title: $title, maxValue: $maxValue, typeCalculate: $typeCalculate, textUnderBar: $textUnderBar, tooltipText: $tooltipText, questions: $questions, subSections: $subSections, hasChart: $hasChart)';
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
            (identical(other.textUnderBar, textUnderBar) ||
                other.textUnderBar == textUnderBar) &&
            (identical(other.tooltipText, tooltipText) ||
                other.tooltipText == tooltipText) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            const DeepCollectionEquality().equals(
              other._subSections,
              _subSections,
            ) &&
            (identical(other.hasChart, hasChart) ||
                other.hasChart == hasChart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    maxValue,
    typeCalculate,
    textUnderBar,
    tooltipText,
    const DeepCollectionEquality().hash(_questions),
    const DeepCollectionEquality().hash(_subSections),
    hasChart,
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
    required final double id,
    required final String title,
    required final double maxValue,
    required final TypeCalculate typeCalculate,
    required final String? textUnderBar,
    required final String tooltipText,
    required final List<Question> questions,
    required final List<Section>? subSections,
    required final bool hasChart,
  }) = _$SectionImpl;

  factory _Section.fromJson(Map<String, dynamic> json) = _$SectionImpl.fromJson;

  @override
  double get id;
  @override
  String get title;
  @override
  double get maxValue;
  @override
  TypeCalculate get typeCalculate;
  @override
  String? get textUnderBar;
  @override
  String get tooltipText;
  @override
  List<Question> get questions;
  @override
  List<Section>? get subSections;
  @override
  bool get hasChart;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
