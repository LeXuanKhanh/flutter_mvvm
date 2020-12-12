import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IOSLoadMoreFooter extends StatelessWidget {

  final LoadStatus mode;

  IOSLoadMoreFooter({@required this.mode});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget body;
    if (mode == LoadStatus.idle) {
      body = Text("pull up load");
    } else if (mode == LoadStatus.loading) {
      body = CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = Text("release to load more");
    } else {
      body = Text("No more Data");
    }
    return Container(
      height: 55.0,
      child: Center(child: body),
    );
  }
}