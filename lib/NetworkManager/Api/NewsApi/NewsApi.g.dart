// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsAPI implements NewsAPI {
  _NewsAPI(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://newsapi.org/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getExample() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<String> _result = await _dio.request(
        '/top-headlines?country=us&category=business&apiKey=3eb084ad893e42589d98635008b06cd8',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  getTopHeadline(country, category, apiKey, pageSize, page) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(category, 'category');
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    ArgumentError.checkNotNull(pageSize, 'pageSize');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'country': country,
      'category': category,
      'apiKey': apiKey,
      'pageSize': pageSize,
      'page': page
    };
    final _data = <String, dynamic>{};
    final Response<String> _result = await _dio.request('/top-headlines',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }
}
