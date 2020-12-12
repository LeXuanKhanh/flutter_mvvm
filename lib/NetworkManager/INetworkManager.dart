import 'package:flutter_mvvm_di/NetworkManager/Domain/UseCase/NewsUseCase.dart';

abstract class INetworkManager {
   NewsUseCase get newsUseCase;
}