// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_subject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OneSubjectResponse {

 String get message;@JsonKey(name: 'category') SubjectModel get category;
/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneSubjectResponseCopyWith<OneSubjectResponse> get copyWith => _$OneSubjectResponseCopyWithImpl<OneSubjectResponse>(this as OneSubjectResponse, _$identity);

  /// Serializes this OneSubjectResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneSubjectResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,category);

@override
String toString() {
  return 'OneSubjectResponse(message: $message, category: $category)';
}


}

/// @nodoc
abstract mixin class $OneSubjectResponseCopyWith<$Res>  {
  factory $OneSubjectResponseCopyWith(OneSubjectResponse value, $Res Function(OneSubjectResponse) _then) = _$OneSubjectResponseCopyWithImpl;
@useResult
$Res call({
 String message,@JsonKey(name: 'category') SubjectModel category
});


$SubjectModelCopyWith<$Res> get category;

}
/// @nodoc
class _$OneSubjectResponseCopyWithImpl<$Res>
    implements $OneSubjectResponseCopyWith<$Res> {
  _$OneSubjectResponseCopyWithImpl(this._self, this._then);

  final OneSubjectResponse _self;
  final $Res Function(OneSubjectResponse) _then;

/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? category = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SubjectModel,
  ));
}
/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectModelCopyWith<$Res> get category {
  
  return $SubjectModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [OneSubjectResponse].
extension OneSubjectResponsePatterns on OneSubjectResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OneSubjectResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OneSubjectResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OneSubjectResponse value)  $default,){
final _that = this;
switch (_that) {
case _OneSubjectResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OneSubjectResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OneSubjectResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'category')  SubjectModel category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OneSubjectResponse() when $default != null:
return $default(_that.message,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'category')  SubjectModel category)  $default,) {final _that = this;
switch (_that) {
case _OneSubjectResponse():
return $default(_that.message,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message, @JsonKey(name: 'category')  SubjectModel category)?  $default,) {final _that = this;
switch (_that) {
case _OneSubjectResponse() when $default != null:
return $default(_that.message,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OneSubjectResponse implements OneSubjectResponse {
  const _OneSubjectResponse({required this.message, @JsonKey(name: 'category') required this.category});
  factory _OneSubjectResponse.fromJson(Map<String, dynamic> json) => _$OneSubjectResponseFromJson(json);

@override final  String message;
@override@JsonKey(name: 'category') final  SubjectModel category;

/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OneSubjectResponseCopyWith<_OneSubjectResponse> get copyWith => __$OneSubjectResponseCopyWithImpl<_OneSubjectResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OneSubjectResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OneSubjectResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,category);

@override
String toString() {
  return 'OneSubjectResponse(message: $message, category: $category)';
}


}

/// @nodoc
abstract mixin class _$OneSubjectResponseCopyWith<$Res> implements $OneSubjectResponseCopyWith<$Res> {
  factory _$OneSubjectResponseCopyWith(_OneSubjectResponse value, $Res Function(_OneSubjectResponse) _then) = __$OneSubjectResponseCopyWithImpl;
@override @useResult
$Res call({
 String message,@JsonKey(name: 'category') SubjectModel category
});


@override $SubjectModelCopyWith<$Res> get category;

}
/// @nodoc
class __$OneSubjectResponseCopyWithImpl<$Res>
    implements _$OneSubjectResponseCopyWith<$Res> {
  __$OneSubjectResponseCopyWithImpl(this._self, this._then);

  final _OneSubjectResponse _self;
  final $Res Function(_OneSubjectResponse) _then;

/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? category = null,}) {
  return _then(_OneSubjectResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SubjectModel,
  ));
}

/// Create a copy of OneSubjectResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectModelCopyWith<$Res> get category {
  
  return $SubjectModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
