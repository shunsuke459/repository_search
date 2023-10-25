import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/page/search/presenter/repository_list_presenter.dart';
import 'package:repository_search/page/search/widget/repository_list_item.dart';
import 'package:repository_search/page/widget/primary_app_bar.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class SearchRepositoryPage extends ConsumerWidget {
  SearchRepositoryPage({Key? key}) : super(key: key);

  final controller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRepositoryListState = ref.watch(repositoryListPresenterProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: 'Githubリポジトリ検索',
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: AppThemeColor.white.color,
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: controller,
                    onFieldSubmitted: (text) => _onFieldSubmitted(ref, text),
                    validator: (value) => value!.isEmpty ? '入力してください' : null,
                    cursorColor: AppThemeColor.primaryDark.color,
                    decoration: InputDecoration(
                      hintText: 'リポジトリ名を入力してください',
                      prefixIcon: InkWell(
                        onTap: () => _onFieldSubmitted(ref, controller.text),
                        child: const Icon(Icons.search),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppThemeColor.primaryDark.color,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                asyncRepositoryListState.when(
                  data: (repositoryListState) {
                    final repositoryList = repositoryListState?.repositoryList;
                    // repositoryListは初期状態がnullなのでnullチェック
                    if (repositoryList == null) return const SizedBox.shrink();

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: repositoryList.map((repository) {
                              return RepositoryListItem(repository: repository);
                            }).toList(),
                          ),
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
