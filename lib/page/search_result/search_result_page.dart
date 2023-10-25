import 'package:flutter/material.dart';
import 'package:repository_search/page/search/presenter/repository.dart';
import 'package:repository_search/page/search_result/widget/list_tile_item.dart';
import 'package:repository_search/page/widget/primary_app_bar.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: repository.name ?? '', context: context),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.network(
                    repository.avatarUrl ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListTileItem(
                title: 'リポジトリ名',
                subtitle: repository.name ?? '',
              ),
              ListTileItem(
                title: 'プロジェクト言語',
                subtitle: repository.language ?? '',
              ),
              ListTileItem(
                title: 'Star数',
                subtitle: (repository.starCount ?? '').toString(),
              ),
              ListTileItem(
                title: 'Watcher数',
                subtitle: (repository.watchersCount ?? '').toString(),
              ),
              ListTileItem(
                title: 'Fork数',
                subtitle: (repository.forksCount ?? '').toString(),
              ),
              ListTileItem(
                title: 'Issue数',
                subtitle: (repository.openIssueCount ?? '').toString(),
              ),
              ListTileItem(
                title: 'URL',
                subtitle: (repository.htmlUrl ?? '').toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
