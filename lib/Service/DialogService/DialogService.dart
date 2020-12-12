import 'dart:async';
import 'package:flutter_mvvm_di/Service/DialogService/DialogManager.dart';

class DialogService {
  IDialogManager _dialogManager;

  void initialize(IDialogManager dialogManager) {
    _dialogManager = dialogManager;
  }

  Future showAlertDialog({String title = 'alert', String content = ''}) {
    return _dialogManager.showAlertDialog(title: title, content: content);
  }

  Future<String> showComfirmDialog() {
    return _dialogManager.showComfirmDialog();
  }

}