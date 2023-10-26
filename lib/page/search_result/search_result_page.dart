import 'package:flutter/material.dart';
import 'package:repository_search/page/search/presenter/repository.dart';
import 'package:repository_search/page/search_result/widget/landscape_list_tile_item.dart';
import 'package:repository_search/page/search_result/widget/portrait_list_tile_item.dart';
import 'package:repository_search/page/widget/primary_app_bar.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: AppThemeColor.white.color,
      appBar: PrimaryAppBar(title: repository.name ?? '', context: context),
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? _PortraitBody(repository: repository)
            : _LandscapeBody(repository: repository),
      ),
    );
  }
}

class _PortraitBody extends StatelessWidget {
  const _PortraitBody({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            PortraitListTileItem(
              title: 'リポジトリ名',
              subtitle: repository.name ?? '',
            ),
            PortraitListTileItem(
              title: 'プロジェクト言語',
              subtitle: repository.language ?? '',
            ),
            PortraitListTileItem(
              title: 'Star数',
              subtitle: (repository.starCount ?? '').toString(),
            ),
            PortraitListTileItem(
              title: 'Watcher数',
              subtitle: (repository.watchersCount ?? '').toString(),
            ),
            PortraitListTileItem(
              title: 'Fork数',
              subtitle: (repository.forksCount ?? '').toString(),
            ),
            PortraitListTileItem(
              title: 'Issue数',
              subtitle: (repository.openIssueCount ?? '').toString(),
            ),
            PortraitListTileItem(
              title: 'URL',
              subtitle: (repository.htmlUrl ?? '').toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandscapeBody extends StatelessWidget {
  const _LandscapeBody({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 32),
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
          const SizedBox(width: 16),
          Flexible(
            child: SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LandscapeListTileItem(
                      title: 'リポジトリ名',
                      subtitle: repository.name ?? '',
                    ),
                    LandscapeListTileItem(
                      title: 'プロジェクト言語',
                      subtitle: repository.language ?? '',
                    ),
                    LandscapeListTileItem(
                      title: 'Star数',
                      subtitle: (repository.starCount ?? '').toString(),
                    ),
                    LandscapeListTileItem(
                      title: 'Watcher数',
                      subtitle: (repository.watchersCount ?? '').toString(),
                    ),
                    LandscapeListTileItem(
                      title: 'Fork数',
                      subtitle: (repository.forksCount ?? '').toString(),
                    ),
                    LandscapeListTileItem(
                      title: 'Issue数',
                      subtitle: (repository.openIssueCount ?? '').toString(),
                    ),
                    LandscapeListTileItem(
                      title: 'URL',
                      subtitle: (repository.htmlUrl ?? '').toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
