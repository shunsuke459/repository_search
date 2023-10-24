import 'package:flutter/material.dart';
import 'package:repository_search/page/search/presenter/repository.dart';
import 'package:repository_search/page/search_result/search_result_page.dart';
import 'package:repository_search/theme/app_theme_color.dart';

class RepositoryListItem extends StatelessWidget {
  const RepositoryListItem({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppThemeColor.grayBorder.color,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchResultPage(repository: repository),
          ),
        ),
        child: Text(
          repository.name ?? '',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
