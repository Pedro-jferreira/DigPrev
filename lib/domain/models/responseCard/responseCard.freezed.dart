// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responseCard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResponseCard _$ResponseCardFromJson(Map<String, dynamic> json) {
  return _ResponseCard.fromJson(json);
}

/// @nodoc
mixin _$ResponseCard {
  String get id => throw _privateConstructorUsedError;
  String get userRef => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get date => throw _privateConstructorUsedError;
  List<SectionAnswer> get sections => throw _privateConstructorUsedError;
  bool get isCalculated => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this ResponseCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCardCopyWith<ResponseCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCardCopyWith<$Res> {
  factory $ResponseCardCopyWith(
    ResponseCard value,
    $Res Function(ResponseCard) then,
  ) = _$ResponseCardCopyWithImpl<$Res, ResponseCard>;
  @useResult
  $Res call({
    String id,
    String userRef,
    @TimestampSerializer() DateTime date,
    List<SectionAnswer> sections,
    bool isCalculated,
    bool isCompleted,
  });
}

/// @nodoc
class _$ResponseCardCopyWithImpl<$Res, $Val extends ResponseCard>
    implements $ResponseCardCopyWith<$Res> {
  _$ResponseCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRef = null,
    Object? date = null,
    Object? sections = null,
    Object? isCalculated = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            userRef:
                null == userRef
                    ? _value.userRef
                    : userRef // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<SectionAnswer>,
            isCalculated:
                null == isCalculated
                    ? _value.isCalculated
                    : isCalculated // ignore: cast_nullable_to_non_nullable
                        as bool,
            isCompleted:
                null == isCompleted
                    ? _value.isCompleted
                    : isCompleted // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResponseCardImplCopyWith<$Res>
    implements $ResponseCardCopyWith<$Res> {
  factory _$$ResponseCardImplCopyWith(
    _$ResponseCardImpl value,
    $Res Function(_$ResponseCardImpl) then,
  ) = __$$ResponseCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userRef,
    @TimestampSerializer() DateTime date,
    List<SectionAnswer> sections,
    bool isCalculated,
    bool isCompleted,
  });
}

/// @nodoc
class __$$ResponseCardImplCopyWithImpl<$Res>
    extends _$ResponseCardCopyWithImpl<$Res, _$ResponseCardImpl>
    implements _$$ResponseCardImplCopyWith<$Res> {
  __$$ResponseCardImplCopyWithImpl(
    _$ResponseCardImpl _value,
    $Res Function(_$ResponseCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResponseCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userRef = null,
    Object? date = null,
    Object? sections = null,
    Object? isCalculated = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _$ResponseCardImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userRef:
            null == userRef
                ? _value.userRef
                : userRef // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<SectionAnswer>,
        isCalculated:
            null == isCalculated
                ? _value.isCalculated
                : isCalculated // ignore: cast_nullable_to_non_nullable
                    as bool,
        isCompleted:
            null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCardImpl implements _ResponseCard {
  const _$ResponseCardImpl({
    required this.id,
    required this.userRef,
    @TimestampSerializer() required this.date,
    required final List<SectionAnswer> sections,
    required this.isCalculated,
    required this.isCompleted,
  }) : _sections = sections;

  factory _$ResponseCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCardImplFromJson(json);

  @override
  final String id;
  @override
  final String userRef;
  @override
  @TimestampSerializer()
  final DateTime date;
  final List<SectionAnswer> _sections;
  @override
  List<SectionAnswer> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final bool isCalculated;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'ResponseCard(id: $id, userRef: $userRef, date: $date, sections: $sections, isCalculated: $isCalculated, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userRef, userRef) || other.userRef == userRef) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.isCalculated, isCalculated) ||
                other.isCalculated == isCalculated) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userRef,
    date,
    const DeepCollectionEquality().hash(_sections),
    isCalculated,
    isCompleted,
  );

  /// Create a copy of ResponseCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCardImplCopyWith<_$ResponseCardImpl> get copyWith =>
      __$$ResponseCardImplCopyWithImpl<_$ResponseCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCardImplToJson(this);
  }
}

abstract class _ResponseCard implements ResponseCard {
  const factory _ResponseCard({
    required final String id,
    required final String userRef,
    @TimestampSerializer() required final DateTime date,
    required final List<SectionAnswer> sections,
    required final bool isCalculated,
    required final bool isCompleted,
  }) = _$ResponseCardImpl;

  factory _ResponseCard.fromJson(Map<String, dynamic> json) =
      _$ResponseCardImpl.fromJson;

  @override
  String get id;
  @override
  String get userRef;
  @override
  @TimestampSerializer()
  DateTime get date;
  @override
  List<SectionAnswer> get sections;
  @override
  bool get isCalculated;
  @override
  bool get isCompleted;

  /// Create a copy of ResponseCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseCardImplCopyWith<_$ResponseCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
