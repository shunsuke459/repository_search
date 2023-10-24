import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/page/search/presenter/repository_list_presenter.dart';
import 'package:repository_search/page/search_result/search_result_page.dart';

class SearchRepositoryPage extends ConsumerWidget {
  const SearchRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final asyncSearchResultList = ref.watch(repositoryListPresenterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Githubリポジトリ検索'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (text) => _onFieldSubmitted(ref, text),
            decoration: InputDecoration(
              prefixIcon: InkWell(
                onTap: () => _onFieldSubmitted(ref, controller.text),
                child: const Icon(Icons.search),
              ),
            ),
          ),
          asyncSearchResultList.when(
            data: (searchResultList) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: searchResultList.map((searchResult) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchResultPage(
                                title: searchResult.name ?? ''),
                          ),
                        ),
                        child: Text(searchResult.name ?? ''),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
            error: (_, __) => const Text('エラーが発生しました。'), // FIXME: エラー時のデザインをあてる
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  void _onFieldSubmitted(WidgetRef ref, String text) async {
    await ref
        .read(repositoryListPresenterProvider.notifier)
        .fetchRepository(text);
  }
}
