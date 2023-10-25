import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:repository_search/gateway/repository/repository_gateway.dart';
import 'package:repository_search/page/search/presenter/repository.dart';
import 'package:repository_search/page/search/presenter/repository_list_presenter.dart';
import 'package:repository_search/page/search/presenter/repository_list_state.dart';

import 'repository_list_presenter_test.mocks.dart';

@GenerateMocks([RepositoryGateway])
void main() {
  late RepositoryGateway repositoryGateway;

  setUp(() {
    repositoryGateway = MockRepositoryGateway();
  });

  group('fetchRepository', () {
    test(
      '正常系',
      () async {
        const query = 'query';
        final result = [
          const Repository(
            id: 1,
            name: 'name',
            language: 'language',
            avatarUrl: 'avatarUrl',
            starCount: 1,
            watchersCount: 1,
            forksCount: 1,
            openIssueCount: 1,
            htmlUrl: 'htmlUrl',
          ),
        ];

        when(repositoryGateway.fetchRepository(query: query))
            .thenAnswer((realInvocation) async => (result, 1));

        final presenter = RepositoryListPresenter(gateway: repositoryGateway);

        final state =
            RepositoryListState(totalCount: 1, repositoryList: result, page: 1, query: query, isLoadingAddition: false);

        expectLater(
          presenter.stream,
          emitsInOrder(
            [
              const AsyncValue<RepositoryListState?>.loading(),
              AsyncValue<RepositoryListState?>.data(state),
            ],
          ),
        );

        await presenter.fetchRepository(query);

        verify(repositoryGateway.fetchRepository(query: query));
      },
      timeout: const Timeout(Duration(milliseconds: 5000)),
    );
  });
}
