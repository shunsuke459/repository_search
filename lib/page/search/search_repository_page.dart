import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
        backgroundColor: AppThemeColor.white.color,
        appBar: PrimaryAppBar(
          title: 'Githubリポジトリ検索',
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Container(
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
                        suffixIcon: InkWell(
                          onTap: () => controller.clear(),
                          child: Icon(
                            Icons.clear,
                            color: AppThemeColor.primaryDark.color,
                          ),
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
                      // repositoryListStateは初期状態がnullなのでnullチェック
                      if (repositoryListState == null) {
                        return const SizedBox.shrink();
                      }

                      // 表示するリポジトリのリスト
                      final repositoryList = repositoryListState.repositoryList;
                      // 検索結果の総数
                      final totalCount = repositoryListState.totalCount;
                      // 現在のページ数
                      final page = repositoryListState.page;
                      // 取得済みのリポジトリ件数
                      final resultNum = min(30 * page, totalCount);
                      final formatter = NumberFormat('#,###');
                      // 追加分をロード中か否か
                      final isLoadingAddition =
                          repositoryListState.isLoadingAddition;

                      return Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, right: 20),
                                child: Text(
                                    '${formatter.format(resultNum)}件 / ${formatter.format(totalCount)}件中'),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ...repositoryList.map((repository) {
                                        return RepositoryListItem(
                                            repository: repository);
                                      }).toList(),
                                      if (resultNum < totalCount)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          child: !isLoadingAddition
                                              ? InkWell(
                                                  onTap: () async {
                                                    final isSuccess = await ref
                                                        .read(
                                                            repositoryListPresenterProvider
                                                                .notifier)
                                                        .fetchAdditionalRepository();

                                                    // エラーが発生したらSnackBarを表示
                                                    if (!isSuccess) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          backgroundColor:
                                                              AppThemeColor
                                                                  .primaryMain
                                                                  .color,
                                                          content: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'エラーが発生しました',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.refresh,
                                                    color: AppThemeColor
                                                        .primaryDark.color,
                                                  ),
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  child: SizedBox(
                                                    width: 16,
                                                    height: 16,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color: AppThemeColor
                                                          .primaryDark.color,
                                                    ),
                                                  ),
                                                ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    error: (_, __) {
                      return Builder(builder: (context) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // エラーが発生したらSnackBarを表示
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppThemeColor.primaryDark.color,
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
