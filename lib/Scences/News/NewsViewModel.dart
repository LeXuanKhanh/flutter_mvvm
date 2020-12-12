import 'dart:async';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

class NewsViewModel extends BaseViewModel implements INewsViewModel {

  NewsViewModel() {
    print('class created');
  }

  StreamController<List<NewDataArticle>> _streamControllerData = StreamController<List<NewDataArticle>>();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  List<NewDataArticle> _data = List<NewDataArticle>();

  var _isLoading = false;
  bool get isLoading => _isLoading;

  var _canLoadMore = true;
  bool get canLoadMore => _canLoadMore;

  @override
  Stream<List<NewDataArticle>> get streamData => _streamControllerData.stream;

  String country = 'us';
  String category = 'business';
  final int pageSize = 5;
  int page = 1;

  void getTopHeadLine({Function completion}) async {

    _isLoading = true;
    try {
      String rawData = await networkManager.newsUseCase.getTopHeadline(country, category, pageSize, page);
      NewsData newData = NewsData.fromJson(json.decode(rawData));
      _data.addAll(newData.articles);
      _streamControllerData.sink.add(_data);
      page++;

    } catch (error) {
      dialogService.showAlertDialog(title: 'Error', content: error.toString());
    }

    _isLoading = false;
    refreshController.loadComplete();

    if (completion != null) {
      completion();
    }

  }

  void refresh() {
    _data.removeRange(0, _data.length);
    page = 1;
    getTopHeadLine(completion: () => refreshController.refreshCompleted());

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamControllerData.close();
  }

}