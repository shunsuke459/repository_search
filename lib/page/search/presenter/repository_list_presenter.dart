import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/gateway/repository/repository_gateway.dart';
import 'package:repository_search/page/search/presenter/repository_list_state.dart';

// Githubリポジトリーの状態管理クラス
class RepositoryListPresenter
    extends StateNotifier<AsyncValue<RepositoryListState?>> {
  final RepositoryGateway gateway;
  RepositoryListPresenter({required this.gateway})
      : super(const AsyncValue.data(null));

  // 初回のリポジトリ取得
  Future<void> fetchRepository(String query) async {
    // 新規の状態を作成する
    state = const AsyncValue.loading();

    try {
      final result = await gateway.fetchRepository(query: query);

      state = AsyncValue.data(
        RepositoryListState(
          repositoryList: result.$1,
          totalCount: result.$2,
          query: query,
          page: 1,
          isLoadingAddition: false,
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // 追加のリポジトリ取得
  Future<void> fetchAdditionalRepository() async {
    if (state.value?.isLoadingAddition ?? true) return;

    try {
      state = AsyncValue.data(
        state.value!.copyWith(
          isLoadingAddition: true,
        ),
      );
      final result = await gateway.fetchRepository(
        query: state.value!.query,
        page: state.value!.page + 1,
      );

      state = AsyncValue.data(
        state.value!.copyWith(
          repositoryList: [
            ...state.value!.repositoryList,
            ...result.$1,
          ],
          page: state.value!.page + 1,
          isLoadingAddition: false,
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final repositoryListPresenterProvider = StateNotifierProvider.autoDispose<
    RepositoryListPresenter, AsyncValue<RepositoryListState?>>(
  (ref) => RepositoryListPresenter(
    gateway: ref.read(repositoryGatewayProvider),
  ),
);
