import 'package:flutter_mvvm_di/NetworkManager/Domain/UseCase/NewsUseCase.dart';
import 'package:flutter_mvvm_di/NetworkManager/Network/NewsNetwork.dart';

class NewsNetUseCase extends NewsUseCase {

  final network = NewsNetwork();

  @override
  Future<String> getExample() {
    // TODO: implement getExample
    return network.getExample();
  }

  @override
  Future<String> getTopHeadline(String country, String category, int pageSize, int page) {
    // TODO: implement getTopHeadline
    return network.getTopHeadline(country, category, pageSize, page);
  }

}