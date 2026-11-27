// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseState<T> {

 bool get isLoading; String? get errMsg; T? get data;
/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseStateCopyWith<T, BaseState<T>> get copyWith => _$BaseStateCopyWithImpl<T, BaseState<T>>(this as BaseState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errMsg, errMsg) || other.errMsg == errMsg)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errMsg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseState<$T>(isLoading: $isLoading, errMsg: $errMsg, data: $data)';
}


}

/// @nodoc
abstract mixin class $BaseStateCopyWith<T,$Res>  {
  factory $BaseStateCopyWith(BaseState<T> value, $Res Function(BaseState<T>) _then) = _$BaseStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errMsg, T? data
});




}
/// @nodoc
class _$BaseStateCopyWithImpl<T,$Res>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._self, this._then);

  final BaseState<T> _self;
  final $Res Function(BaseState<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errMsg = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errMsg: freezed == errMsg ? _self.errMsg : errMsg // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseState].
extension BaseStatePatterns<T> on BaseState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseState<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errMsg,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseState() when $default != null:
return $default(_that.isLoading,_that.errMsg,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errMsg,  T? data)  $default,) {final _that = this;
switch (_that) {
case _BaseState():
return $default(_that.isLoading,_that.errMsg,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errMsg,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _BaseState() when $default != null:
return $default(_that.isLoading,_that.errMsg,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _BaseState<T> implements BaseState<T> {
  const _BaseState({this.isLoading = false, this.errMsg, this.data});
  

@override@JsonKey() final  bool isLoading;
@override final  String? errMsg;
@override final  T? data;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseStateCopyWith<T, _BaseState<T>> get copyWith => __$BaseStateCopyWithImpl<T, _BaseState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errMsg, errMsg) || other.errMsg == errMsg)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errMsg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseState<$T>(isLoading: $isLoading, errMsg: $errMsg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BaseStateCopyWith<T,$Res> implements $BaseStateCopyWith<T, $Res> {
  factory _$BaseStateCopyWith(_BaseState<T> value, $Res Function(_BaseState<T>) _then) = __$BaseStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errMsg, T? data
});




}
/// @nodoc
class __$BaseStateCopyWithImpl<T,$Res>
    implements _$BaseStateCopyWith<T, $Res> {
  __$BaseStateCopyWithImpl(this._self, this._then);

  final _BaseState<T> _self;
  final $Res Function(_BaseState<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errMsg = freezed,Object? data = freezed,}) {
  return _then(_BaseState<T>(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errMsg: freezed == errMsg ? _self.errMsg : errMsg // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
