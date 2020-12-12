import 'package:flutter_mvvm_di/NetworkManager/Domain/UseCase/NewsUseCase.dart';
import 'package:flutter_mvvm_di/NetworkManager/INetworkManager.dart';
import 'package:flutter_mvvm_di/NetworkManager/Domain/UseCase/NewsNetUseCase.dart';

class NetworkManager extends INetworkManager {
  @override
  // TODO: implement newsUseCase
  NewsUseCase get newsUseCase => _newsUseCase;
  NewsUseCase _newsUseCase;

  NetworkManager() {
    _newsUseCase = NewsNetUseCase();
  }
}