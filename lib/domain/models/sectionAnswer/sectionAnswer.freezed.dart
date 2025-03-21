// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sectionAnswer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SectionAnswer _$SectionAnswerFromJson(Map<String, dynamic> json) {
  return _SectionAnswer.fromJson(json);
}

/// @nodoc
mixin _$SectionAnswer {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get sectionRef => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  List<SectionAnswer>? get subSectionsAnswers =>
      throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  bool get isCalculated => throw _privateConstructorUsedError;
  bool get hasChart => throw _privateConstructorUsedError;

  /// Serializes this SectionAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SectionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionAnswerCopyWith<SectionAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionAnswerCopyWith<$Res> {
  factory $SectionAnswerCopyWith(
    SectionAnswer value,
    $Res Function(SectionAnswer) then,
  ) = _$SectionAnswerCopyWithImpl<$Res, SectionAnswer>;
  @useResult
  $Res call({
    String id,
    String title,
    double sectionRef,
    List<Answer> answers,
    List<SectionAnswer>? subSectionsAnswers,
    double score,
    bool isCalculated,
    bool hasChart,
  });
}

/// @nodoc
class _$SectionAnswerCopyWithImpl<$Res, $Val extends SectionAnswer>
    implements $SectionAnswerCopyWith<$Res> {
  _$SectionAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SectionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sectionRef = null,
    Object? answers = null,
    Object? subSectionsAnswers = freezed,
    Object? score = null,
    Object? isCalculated = null,
    Object? hasChart = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            sectionRef:
                null == sectionRef
                    ? _value.sectionRef
                    : sectionRef // ignore: cast_nullable_to_non_nullable
                        as double,
            answers:
                null == answers
                    ? _value.answers
                    : answers // ignore: cast_nullable_to_non_nullable
                        as List<Answer>,
            subSectionsAnswers:
                freezed == subSectionsAnswers
                    ? _value.subSectionsAnswers
                    : subSectionsAnswers // ignore: cast_nullable_to_non_nullable
                        as List<SectionAnswer>?,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as double,
            isCalculated:
                null == isCalculated
                    ? _value.isCalculated
                    : isCalculated // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$SectionAnswerImplCopyWith<$Res>
    implements $SectionAnswerCopyWith<$Res> {
  factory _$$SectionAnswerImplCopyWith(
    _$SectionAnswerImpl value,
    $Res Function(_$SectionAnswerImpl) then,
  ) = __$$SectionAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    double sectionRef,
    List<Answer> answers,
    List<SectionAnswer>? subSectionsAnswers,
    double score,
    bool isCalculated,
    bool hasChart,
  });
}

/// @nodoc
class __$$SectionAnswerImplCopyWithImpl<$Res>
    extends _$SectionAnswerCopyWithImpl<$Res, _$SectionAnswerImpl>
    implements _$$SectionAnswerImplCopyWith<$Res> {
  __$$SectionAnswerImplCopyWithImpl(
    _$SectionAnswerImpl _value,
    $Res Function(_$SectionAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SectionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sectionRef = null,
    Object? answers = null,
    Object? subSectionsAnswers = freezed,
    Object? score = null,
    Object? isCalculated = null,
    Object? hasChart = null,
  }) {
    return _then(
      _$SectionAnswerImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        sectionRef:
            null == sectionRef
                ? _value.sectionRef
                : sectionRef // ignore: cast_nullable_to_non_nullable
                    as double,
        answers:
            null == answers
                ? _value._answers
                : answers // ignore: cast_nullable_to_non_nullable
                    as List<Answer>,
        subSectionsAnswers:
            freezed == subSectionsAnswers
                ? _value._subSectionsAnswers
                : subSectionsAnswers // ignore: cast_nullable_to_non_nullable
                    as List<SectionAnswer>?,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as double,
        isCalculated:
            null == isCalculated
                ? _value.isCalculated
                : isCalculated // ignore: cast_nullable_to_non_nullable
                    as bool,
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
class _$SectionAnswerImpl implements _SectionAnswer {
  const _$SectionAnswerImpl({
    required this.id,
    required this.title,
    required this.sectionRef,
    required final List<Answer> answers,
    required final List<SectionAnswer>? subSectionsAnswers,
    required this.score,
    required this.isCalculated,
    required this.hasChart,
  }) : _answers = answers,
       _subSectionsAnswers = subSectionsAnswers;

  factory _$SectionAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionAnswerImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double sectionRef;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<SectionAnswer>? _subSectionsAnswers;
  @override
  List<SectionAnswer>? get subSectionsAnswers {
    final value = _subSectionsAnswers;
    if (value == null) return null;
    if (_subSectionsAnswers is EqualUnmodifiableListView)
      return _subSectionsAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double score;
  @override
  final bool isCalculated;
  @override
  final bool hasChart;

  @override
  String toString() {
    return 'SectionAnswer(id: $id, title: $title, sectionRef: $sectionRef, answers: $answers, subSectionsAnswers: $subSectionsAnswers, score: $score, isCalculated: $isCalculated, hasChart: $hasChart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sectionRef, sectionRef) ||
                other.sectionRef == sectionRef) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(
              other._subSectionsAnswers,
              _subSectionsAnswers,
            ) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.isCalculated, isCalculated) ||
                other.isCalculated == isCalculated) &&
            (identical(other.hasChart, hasChart) ||
                other.hasChart == hasChart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    sectionRef,
    const DeepCollectionEquality().hash(_answers),
    const DeepCollectionEquality().hash(_subSectionsAnswers),
    score,
    isCalculated,
    hasChart,
  );

  /// Create a copy of SectionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionAnswerImplCopyWith<_$SectionAnswerImpl> get copyWith =>
      __$$SectionAnswerImplCopyWithImpl<_$SectionAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionAnswerImplToJson(this);
  }
}

abstract class _SectionAnswer implements SectionAnswer {
  const factory _SectionAnswer({
    required final String id,
    required final String title,
    required final double sectionRef,
    required final List<Answer> answers,
    required final List<SectionAnswer>? subSectionsAnswers,
    required final double score,
    required final bool isCalculated,
    required final bool hasChart,
  }) = _$SectionAnswerImpl;

  factory _SectionAnswer.fromJson(Map<String, dynamic> json) =
      _$SectionAnswerImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get sectionRef;
  @override
  List<Answer> get answers;
  @override
  List<SectionAnswer>? get subSectionsAnswers;
  @override
  double get score;
  @override
  bool get isCalculated;
  @override
  bool get hasChart;

  /// Create a copy of SectionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionAnswerImplCopyWith<_$SectionAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
