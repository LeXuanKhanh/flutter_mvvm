import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<INewsViewModel>(
      create: (_) => GetIt.instance<INewsViewModel>(),
      child: Consumer<INewsViewModel>(
        builder: (context, viewModel, child) {
          viewModel.getTopHeadLine();
          return  Scaffold(
              appBar: AppBar(
                title: Text("NewsView"),
              ),
              body: StreamBuilder<List<NewDataArticle>>(
                  stream: viewModel.streamData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CupertinoActivityIndicator());
                    }
                    return SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      header: CustomHeader(
                        builder: (BuildContext context, RefreshStatus mode) => IOSLoadMoreHeader(mode: mode),
                      ),
                      footer: CustomFooter(
                          builder: (BuildContext context, LoadStatus mode) => IOSLoadMoreFooter(mode: mode)),
                      controller: viewModel.refreshController,
                      onRefresh: viewModel.refresh,
                      onLoading: viewModel.getTopHeadLine,
                      child: ListView.builder(
                        itemCount:
                        snapshot.data != null ?  snapshot.data.length : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCell(
                            data:  snapshot.data[index],
                          );
                        },
                      ),
                    );
                  }
              ));
        }));
  }
}

