import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/page/search/presenter/repository_list_presenter.dart';
import 'package:repository_search/page/search_result/search_result_page.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class SearchRepositoryPage extends ConsumerWidget {
  SearchRepositoryPage({Key? key}) : super(key: key);

  final controller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSearchResultList = ref.watch(repositoryListPresenterProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Githubリポジトリ検索'),
        ),
        body: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                onFieldSubmitted: (text) => _onFieldSubmitted(ref, text),
                validator: (value) => value!.isEmpty ? '入力してください' : null,
                decoration: InputDecoration(
                  hintText: 'リポジトリ名を入力してください',
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
                error: (_, __) {
                  return Builder(builder: (context) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // エラーが発生したらSnackBarを表示
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppThemeColor.primaryMain.color,
                          content: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'エラーが発生しました',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });

                    return const SizedBox.shrink();
                  });
                },
                loading: () => Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppThemeColor.primaryMain.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFieldSubmitted(WidgetRef ref, String text) async {
    // バリデーションチェック
    if (!formGlobalKey.currentState!.validate()) return;

    await ref
        .read(repositoryListPresenterProvider.notifier)
        .fetchRepository(text);
  }
}
