// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsDataFromJson(Map<String, dynamic> json) {
  return NewsData(
    status: json['status'] as String,
    totalResults: json['totalResults'] as int,
    articles: (json['articles'] as List)
        ?.map((e) => e == null
            ? null
            : NewDataArticle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

NewDataArticle _$NewDataArticleFromJson(Map<String, dynamic> json) {
  return NewDataArticle(
    author: json['author'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String,
    publishAt: json['publishAt'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$NewDataArticleToJson(NewDataArticle instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishAt': instance.publishAt,
      'content': instance.content,
    };
