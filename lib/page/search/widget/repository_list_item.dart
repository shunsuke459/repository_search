import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: SizedBox(
                width: 35,
                height: 35,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repository.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    repository.createdAt != null
                        ? DateFormat('yyyy/MM/dd hh:mm').format(repository.createdAt!)
                        : '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
