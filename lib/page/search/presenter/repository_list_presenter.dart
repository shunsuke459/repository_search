import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/gateway/repository/repository_gateway.dart';
import 'package:repository_search/page/search/presenter/repository.dart';

// Githubリポジトリーの状態管理クラス
class RepositoryListPresenter
    extends StateNotifier<AsyncValue<List<Repository>>> {
  final RepositoryGateway gateway;
  RepositoryListPresenter({required this.gateway})
      : super(const AsyncValue.data([]));

  Future<void> fetchRepository(String query) async {
    // 新規の状態を作成する
    state = const AsyncValue.loading();

    try {
      final result = await gateway.fetchRepository(query);

      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final repositoryListPresenterProvider = StateNotifierProvider(
  (ref) => RepositoryListPresenter(
    gateway: ref.read(repositoryGatewayProvider),
  ),
);
