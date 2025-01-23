// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get successAttempts => throw _privateConstructorUsedError;
  int get failedAttempts => throw _privateConstructorUsedError;
  String get filterQuery => throw _privateConstructorUsedError;
  Map<Attempt, Student> get attempts => throw _privateConstructorUsedError;
  List<AttemptItem> get items => throw _privateConstructorUsedError;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListStateCopyWith<ListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) then) =
      _$ListStateCopyWithImpl<$Res, ListState>;
  @useResult
  $Res call(
      {bool isLoading,
      int successAttempts,
      int failedAttempts,
      String filterQuery,
      Map<Attempt, Student> attempts,
      List<AttemptItem> items});
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res, $Val extends ListState>
    implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? successAttempts = null,
    Object? failedAttempts = null,
    Object? filterQuery = null,
    Object? attempts = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      successAttempts: null == successAttempts
          ? _value.successAttempts
          : successAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      failedAttempts: null == failedAttempts
          ? _value.failedAttempts
          : failedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as Map<Attempt, Student>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AttemptItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStateImplCopyWith<$Res>
    implements $ListStateCopyWith<$Res> {
  factory _$$ListStateImplCopyWith(
          _$ListStateImpl value, $Res Function(_$ListStateImpl) then) =
      __$$ListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int successAttempts,
      int failedAttempts,
      String filterQuery,
      Map<Attempt, Student> attempts,
      List<AttemptItem> items});
}

/// @nodoc
class __$$ListStateImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListStateImpl>
    implements _$$ListStateImplCopyWith<$Res> {
  __$$ListStateImplCopyWithImpl(
      _$ListStateImpl _value, $Res Function(_$ListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? successAttempts = null,
    Object? failedAttempts = null,
    Object? filterQuery = null,
    Object? attempts = null,
    Object? items = null,
  }) {
    return _then(_$ListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      successAttempts: null == successAttempts
          ? _value.successAttempts
          : successAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      failedAttempts: null == failedAttempts
          ? _value.failedAttempts
          : failedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as Map<Attempt, Student>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AttemptItem>,
    ));
  }
}

/// @nodoc

class _$ListStateImpl implements _ListState {
  const _$ListStateImpl(
      {this.isLoading = false,
      this.successAttempts = 0,
      this.failedAttempts = 0,
      this.filterQuery = '',
      final Map<Attempt, Student> attempts = const {},
      final List<AttemptItem> items = const []})
      : _attempts = attempts,
        _items = items;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int successAttempts;
  @override
  @JsonKey()
  final int failedAttempts;
  @override
  @JsonKey()
  final String filterQuery;
  final Map<Attempt, Student> _attempts;
  @override
  @JsonKey()
  Map<Attempt, Student> get attempts {
    if (_attempts is EqualUnmodifiableMapView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attempts);
  }

  final List<AttemptItem> _items;
  @override
  @JsonKey()
  List<AttemptItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ListState(isLoading: $isLoading, successAttempts: $successAttempts, failedAttempts: $failedAttempts, filterQuery: $filterQuery, attempts: $attempts, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.successAttempts, successAttempts) ||
                other.successAttempts == successAttempts) &&
            (identical(other.failedAttempts, failedAttempts) ||
                other.failedAttempts == failedAttempts) &&
            (identical(other.filterQuery, filterQuery) ||
                other.filterQuery == filterQuery) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      successAttempts,
      failedAttempts,
      filterQuery,
      const DeepCollectionEquality().hash(_attempts),
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      __$$ListStateImplCopyWithImpl<_$ListStateImpl>(this, _$identity);
}

abstract class _ListState implements ListState {
  const factory _ListState(
      {final bool isLoading,
      final int successAttempts,
      final int failedAttempts,
      final String filterQuery,
      final Map<Attempt, Student> attempts,
      final List<AttemptItem> items}) = _$ListStateImpl;

  @override
  bool get isLoading;
  @override
  int get successAttempts;
  @override
  int get failedAttempts;
  @override
  String get filterQuery;
  @override
  Map<Attempt, Student> get attempts;
  @override
  List<AttemptItem> get items;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
