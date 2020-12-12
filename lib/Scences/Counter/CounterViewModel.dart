import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

class CounterViewModel extends BaseViewModel implements ICounterViewModel {

  int _counter = 0;

  @override
  // TODO: implement counter
  int get counter => _counter;

  @override
  void decrement() {
    // TODO: implement decrement
    _counter --;
    notifyListeners();
  }

  @override
  void increment() {
    // TODO: implement increment
    _counter ++;
    notifyListeners();
  }

  @override
  void showComfirmDialog() async {
    // TODO: implement showComfirmDialog
    String result = await dialogService.showComfirmDialog();
    print('print $result');

  }

}