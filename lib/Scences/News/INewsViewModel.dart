import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

abstract class INewsViewModel extends IBaseViewModel {
  Stream<List<NewDataArticle>> get streamData;
  RefreshController refreshController;
  bool get isLoading;

  getTopHeadLine();
  refresh();
}