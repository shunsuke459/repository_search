// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepositoryListState {
  int get totalCount => throw _privateConstructorUsedError;
  List<Repository> get repositoryList =>
      throw _privateConstructorUsedError; // 追加分をロードする際にTextFormFieldのテキストが変わっている可能性があるのでここで保持する
  String get query => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoadingAddition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositoryListStateCopyWith<RepositoryListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryListStateCopyWith<$Res> {
  factory $RepositoryListStateCopyWith(
          RepositoryListState value, $Res Function(RepositoryListState) then) =
      _$RepositoryListStateCopyWithImpl<$Res, RepositoryListState>;
  @useResult
  $Res call(
      {int totalCount,
      List<Repository> repositoryList,
      String query,
      int page,
      bool isLoadingAddition});
}

/// @nodoc
class _$RepositoryListStateCopyWithImpl<$Res, $Val extends RepositoryListState>
    implements $RepositoryListStateCopyWith<$Res> {
  _$RepositoryListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? repositoryList = null,
    Object? query = null,
    Object? page = null,
    Object? isLoadingAddition = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      repositoryList: null == repositoryList
          ? _value.repositoryList
          : repositoryList // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingAddition: null == isLoadingAddition
          ? _value.isLoadingAddition
          : isLoadingAddition // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoryListStateImplCopyWith<$Res>
    implements $RepositoryListStateCopyWith<$Res> {
  factory _$$RepositoryListStateImplCopyWith(_$RepositoryListStateImpl value,
          $Res Function(_$RepositoryListStateImpl) then) =
      __$$RepositoryListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCount,
      List<Repository> repositoryList,
      String query,
      int page,
      bool isLoadingAddition});
}

/// @nodoc
class __$$RepositoryListStateImplCopyWithImpl<$Res>
    extends _$RepositoryListStateCopyWithImpl<$Res, _$RepositoryListStateImpl>
    implements _$$RepositoryListStateImplCopyWith<$Res> {
  __$$RepositoryListStateImplCopyWithImpl(_$RepositoryListStateImpl _value,
      $Res Function(_$RepositoryListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? repositoryList = null,
    Object? query = null,
    Object? page = null,
    Object? isLoadingAddition = null,
  }) {
    return _then(_$RepositoryListStateImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      repositoryList: null == repositoryList
          ? _value._repositoryList
          : repositoryList // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingAddition: null == isLoadingAddition
          ? _value.isLoadingAddition
          : isLoadingAddition // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RepositoryListStateImpl implements _RepositoryListState {
  const _$RepositoryListStateImpl(
      {required this.totalCount,
      required final List<Repository> repositoryList,
      required this.query,
      required this.page,
      required this.isLoadingAddition})
      : _repositoryList = repositoryList;

  @override
  final int totalCount;
  final List<Repository> _repositoryList;
  @override
  List<Repository> get repositoryList {
    if (_repositoryList is EqualUnmodifiableListView) return _repositoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositoryList);
  }

// 追加分をロードする際にTextFormFieldのテキストが変わっている可能性があるのでここで保持する
  @override
  final String query;
  @override
  final int page;
  @override
  final bool isLoadingAddition;

  @override
  String toString() {
    return 'RepositoryListState(totalCount: $totalCount, repositoryList: $repositoryList, query: $query, page: $page, isLoadingAddition: $isLoadingAddition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryListStateImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality()
                .equals(other._repositoryList, _repositoryList) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoadingAddition, isLoadingAddition) ||
                other.isLoadingAddition == isLoadingAddition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCount,
      const DeepCollectionEquality().hash(_repositoryList),
      query,
      page,
      isLoadingAddition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryListStateImplCopyWith<_$RepositoryListStateImpl> get copyWith =>
      __$$RepositoryListStateImplCopyWithImpl<_$RepositoryListStateImpl>(
          this, _$identity);
}

abstract class _RepositoryListState implements RepositoryListState {
  const factory _RepositoryListState(
      {required final int totalCount,
      required final List<Repository> repositoryList,
      required final String query,
      required final int page,
      required final bool isLoadingAddition}) = _$RepositoryListStateImpl;

  @override
  int get totalCount;
  @override
  List<Repository> get repositoryList;
  @override // 追加分をロードする際にTextFormFieldのテキストが変わっている可能性があるのでここで保持する
  String get query;
  @override
  int get page;
  @override
  bool get isLoadingAddition;
  @override
  @JsonKey(ignore: true)
  _$$RepositoryListStateImplCopyWith<_$RepositoryListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
