import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/gateway/dio/dio.dart';
import 'package:repository_search/page/search/presenter/repository.dart';

class RepositoryGateway {
  final Dio dio;
  const RepositoryGateway({required this.dio});

  Future<(List<Repository>, int)> fetchRepository({
    required String query,
    int page = 0,
  }) async {
    const apiUrl = 'https://api.github.com/search/repositories';

    try {
      final result = await dio.get('$apiUrl?q=$query&page=$page');

      final totalCount = result.data['total_count'] as int;
      final items = result.data['items'] as List<dynamic>;
      final repositoryList = items
          .map((repository) => Repository.fromJson(
                {
                  ...repository,
                  'avatarUrl': repository['owner']['avatar_url'],
                },
              ))
          .toList();

      return (repositoryList, totalCount);
    } catch (e) {
      rethrow;
    }
  }
}

final repositoryGatewayProvider = Provider(
  (ref) => RepositoryGateway(dio: ref.read(dioProvider)),
);
