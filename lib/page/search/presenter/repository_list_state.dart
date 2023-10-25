import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository_search/page/search/presenter/repository.dart';

part 'repository_list_state.freezed.dart';

@freezed
class RepositoryListState with _$RepositoryListState {
  const factory RepositoryListState({
    required int totalCount,
    required List<Repository> repositoryList,
    required int page,
  }) = _RepositoryListState;
}
