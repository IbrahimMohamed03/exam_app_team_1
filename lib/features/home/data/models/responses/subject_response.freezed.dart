// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubjectResponse {

@JsonKey(name: "message") String get message;@JsonKey(name: "metadata") MetadataModel get metadata;@JsonKey(name: "subjects") List<SubjectModel> get subjects;
/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectResponseCopyWith<SubjectResponse> get copyWith => _$SubjectResponseCopyWithImpl<SubjectResponse>(this as SubjectResponse, _$identity);

  /// Serializes this SubjectResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,metadata,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'SubjectResponse(message: $message, metadata: $metadata, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $SubjectResponseCopyWith<$Res>  {
  factory $SubjectResponseCopyWith(SubjectResponse value, $Res Function(SubjectResponse) _then) = _$SubjectResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "message") String message,@JsonKey(name: "metadata") MetadataModel metadata,@JsonKey(name: "subjects") List<SubjectModel> subjects
});


$MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class _$SubjectResponseCopyWithImpl<$Res>
    implements $SubjectResponseCopyWith<$Res> {
  _$SubjectResponseCopyWithImpl(this._self, this._then);

  final SubjectResponse _self;
  final $Res Function(SubjectResponse) _then;

/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? metadata = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectModel>,
  ));
}
/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubjectResponse].
extension SubjectResponsePatterns on SubjectResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubjectResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "message")  String message, @JsonKey(name: "metadata")  MetadataModel metadata, @JsonKey(name: "subjects")  List<SubjectModel> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectResponse() when $default != null:
return $default(_that.message,_that.metadata,_that.subjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "message")  String message, @JsonKey(name: "metadata")  MetadataModel metadata, @JsonKey(name: "subjects")  List<SubjectModel> subjects)  $default,) {final _that = this;
switch (_that) {
case _SubjectResponse():
return $default(_that.message,_that.metadata,_that.subjects);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "message")  String message, @JsonKey(name: "metadata")  MetadataModel metadata, @JsonKey(name: "subjects")  List<SubjectModel> subjects)?  $default,) {final _that = this;
switch (_that) {
case _SubjectResponse() when $default != null:
return $default(_that.message,_that.metadata,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectResponse implements SubjectResponse {
  const _SubjectResponse({@JsonKey(name: "message") required this.message, @JsonKey(name: "metadata") required this.metadata, @JsonKey(name: "subjects") required this.subjects});
  factory _SubjectResponse.fromJson(Map<String, dynamic> json) => _$SubjectResponseFromJson(json);

@override@JsonKey(name: "message") final  String message;
@override@JsonKey(name: "metadata") final  MetadataModel metadata;
@override@JsonKey(name: "subjects") final  List<SubjectModel> subjects;

/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectResponseCopyWith<_SubjectResponse> get copyWith => __$SubjectResponseCopyWithImpl<_SubjectResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,metadata,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'SubjectResponse(message: $message, metadata: $metadata, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$SubjectResponseCopyWith<$Res> implements $SubjectResponseCopyWith<$Res> {
  factory _$SubjectResponseCopyWith(_SubjectResponse value, $Res Function(_SubjectResponse) _then) = __$SubjectResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "message") String message,@JsonKey(name: "metadata") MetadataModel metadata,@JsonKey(name: "subjects") List<SubjectModel> subjects
});


@override $MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class __$SubjectResponseCopyWithImpl<$Res>
    implements _$SubjectResponseCopyWith<$Res> {
  __$SubjectResponseCopyWithImpl(this._self, this._then);

  final _SubjectResponse _self;
  final $Res Function(_SubjectResponse) _then;

/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? metadata = null,Object? subjects = null,}) {
  return _then(_SubjectResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectModel>,
  ));
}

/// Create a copy of SubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
