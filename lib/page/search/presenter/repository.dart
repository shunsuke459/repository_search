import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    int? id,
    String? name,
    String? language,
    String? avatarUrl,
    @JsonKey(name: 'stargazers_count') int? starCount,
    @JsonKey(name: 'watchers_count') int? watchersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    @JsonKey(name: 'open_issues_count') int? openIssueCount,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Repository;

  factory Repository.fromJson(Map<String, Object?> json) =>
      _$RepositoryFromJson(json);
}
