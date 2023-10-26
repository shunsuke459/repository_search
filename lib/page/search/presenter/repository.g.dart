// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryImpl _$$RepositoryImplFromJson(Map<String, dynamic> json) =>
    _$RepositoryImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      language: json['language'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      starCount: json['stargazers_count'] as int?,
      watchersCount: json['watchers_count'] as int?,
      forksCount: json['forks_count'] as int?,
      openIssueCount: json['open_issues_count'] as int?,
      htmlUrl: json['html_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$RepositoryImplToJson(_$RepositoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'language': instance.language,
      'avatarUrl': instance.avatarUrl,
      'stargazers_count': instance.starCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssueCount,
      'html_url': instance.htmlUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
