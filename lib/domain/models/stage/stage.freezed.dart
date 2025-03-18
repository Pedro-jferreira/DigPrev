// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Stage _$StageFromJson(Map<String, dynamic> json) {
  return _Stage.fromJson(json);
}

/// @nodoc
mixin _$Stage {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get creationDate => throw _privateConstructorUsedError;
  List<Section> get sections => throw _privateConstructorUsedError;

  /// Serializes this Stage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageCopyWith<Stage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageCopyWith<$Res> {
  factory $StageCopyWith(Stage value, $Res Function(Stage) then) =
      _$StageCopyWithImpl<$Res, Stage>;
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    @TimestampSerializer() DateTime creationDate,
    List<Section> sections,
  });
}

/// @nodoc
class _$StageCopyWithImpl<$Res, $Val extends Stage>
    implements $StageCopyWith<$Res> {
  _$StageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? creationDate = null,
    Object? sections = null,
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
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            creationDate:
                null == creationDate
                    ? _value.creationDate
                    : creationDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<Section>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StageImplCopyWith<$Res> implements $StageCopyWith<$Res> {
  factory _$$StageImplCopyWith(
    _$StageImpl value,
    $Res Function(_$StageImpl) then,
  ) = __$$StageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    @TimestampSerializer() DateTime creationDate,
    List<Section> sections,
  });
}

/// @nodoc
class __$$StageImplCopyWithImpl<$Res>
    extends _$StageCopyWithImpl<$Res, _$StageImpl>
    implements _$$StageImplCopyWith<$Res> {
  __$$StageImplCopyWithImpl(
    _$StageImpl _value,
    $Res Function(_$StageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? creationDate = null,
    Object? sections = null,
  }) {
    return _then(
      _$StageImpl(
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
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        creationDate:
            null == creationDate
                ? _value.creationDate
                : creationDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<Section>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StageImpl implements _Stage {
  const _$StageImpl({
    required this.id,
    required this.title,
    required this.description,
    @TimestampSerializer() required this.creationDate,
    required final List<Section> sections,
  }) : _sections = sections;

  factory _$StageImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @TimestampSerializer()
  final DateTime creationDate;
  final List<Section> _sections;
  @override
  List<Section> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'Stage(id: $id, title: $title, description: $description, creationDate: $creationDate, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    creationDate,
    const DeepCollectionEquality().hash(_sections),
  );

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageImplCopyWith<_$StageImpl> get copyWith =>
      __$$StageImplCopyWithImpl<_$StageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageImplToJson(this);
  }
}

abstract class _Stage implements Stage {
  const factory _Stage({
    required final int id,
    required final String title,
    required final String description,
    @TimestampSerializer() required final DateTime creationDate,
    required final List<Section> sections,
  }) = _$StageImpl;

  factory _Stage.fromJson(Map<String, dynamic> json) = _$StageImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @TimestampSerializer()
  DateTime get creationDate;
  @override
  List<Section> get sections;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageImplCopyWith<_$StageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
