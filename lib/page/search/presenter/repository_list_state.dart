import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository_search/page/search/presenter/repository.dart';

part 'repository_list_state.freezed.dart';

@freezed
class RepositoryListState with _$RepositoryListState {
  const factory RepositoryListState({
    required int totalCount,
    required List<Repository> repositoryList,
    // 追加分をロードする際にTextFormFieldのテキストが変わっている可能性があるのでここで保持する
    required String query,
    required int page,
    required bool isLoadingAddition,
  }) = _RepositoryListState;
}
