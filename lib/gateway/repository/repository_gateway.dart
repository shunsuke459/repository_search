import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_search/gateway/dio/dio.dart';
import 'package:repository_search/page/search/presenter/repository.dart';

class RepositoryGateway {
  final Dio dio;
  const RepositoryGateway({required this.dio});

  Future<List<Repository>> fetchRepository(String query) async {
    const apiUrl = 'https://api.github.com/search/repositories';

    try {
      final result = await dio.get('$apiUrl?q=$query');

      final repositoryList = result.data['items'] as List<dynamic>;

      return repositoryList
          .map((repository) => Repository.fromJson(
                {
                  ...repository,
                  'avatarUrl': repository['owner']['avatar_url'],
                },
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}

final repositoryGatewayProvider = Provider(
  (ref) => RepositoryGateway(dio: ref.read(dioProvider)),
);
