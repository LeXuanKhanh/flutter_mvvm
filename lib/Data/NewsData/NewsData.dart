import 'package:json_annotation/json_annotation.dart';

part 'NewsData.g.dart';

@JsonSerializable(nullable: true)
class NewsData {
  String status = "";
  int totalResults = 0;
  List<NewDataArticle> articles = List<NewDataArticle>();

  NewsData({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => _$NewsDataFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDataToJson(this);
}

@JsonSerializable(nullable: true)
class NewDataArticle {
  String author = "";
  String title = "";
  String description = "";
  String url = "";
  String urlToImage = "";
  String publishAt = "";
  String content = "";

  NewDataArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishAt,
    this.content,
  });

  factory NewDataArticle.fromJson(Map<String, dynamic> json) => _$NewDataArticleFromJson(json);
  Map<String, dynamic> toJson() => _$NewDataArticleToJson(this);
}