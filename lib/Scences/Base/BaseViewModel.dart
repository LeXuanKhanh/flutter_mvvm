import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';
import 'package:flutter_mvvm_di/Scences/Base/IBaseViewModel.dart';
import 'package:flutter_mvvm_di/Service/DialogService/DialogService.dart';
import 'package:get_it/get_it.dart';

class BaseViewModel extends ChangeNotifier implements IBaseViewModel {
  INetworkManager networkManager;
  DialogService dialogService;

  BaseViewModel () {
    networkManager = GetIt.instance<INetworkManager>();
    dialogService = GetIt.instance<DialogService>();
  }

}