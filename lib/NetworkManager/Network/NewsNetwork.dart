import 'package:flutter_mvvm_di/App/GlobalVariable.dart';
import 'package:flutter_mvvm_di/NetworkManager/Network/BaseNetwork.dart';
import 'package:flutter_mvvm_di/NetworkManager/Api/NewsApi/NewsApi.dart';


class NewsNetwork extends BaseNetwork {

  NewsAPI client;

  NewsNetwork() {
    print("News Network init");
    client = NewsAPI(dio);
  }

  Future<String> getExample() {
    return client.getExample();
  }

  Future<String> getTopHeadline(String country, String category, int pageSize, int page) {
    return client.getTopHeadline(country, category, GlobalVariable().apiKey, pageSize, page);
  }
}