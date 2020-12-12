import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IOSLoadMoreHeader extends StatelessWidget {

  final RefreshStatus mode;

  IOSLoadMoreHeader({@required this.mode});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> body;
    if (mode ==  RefreshStatus.idle) {
      body = [
        const Icon(Icons.arrow_downward, color: Colors.grey),
        Text("Pull down to refresh"),
      ];
    } else if (mode ==  RefreshStatus.refreshing) {
      body = [CupertinoActivityIndicator()];
    } else if (mode ==  RefreshStatus.failed) {
      body = [
        const Icon(Icons.error, color: Colors.grey),
        Text("Refresh Failed!Click retry!")
      ];
    } else if (mode ==  RefreshStatus.canRefresh) {
      body =  [
        const Icon(Icons.arrow_upward, color: Colors.grey),
        Text("release to load more")
      ];
    } else {
      body = [
        const Icon(Icons.done, color: Colors.grey),
        Text("Refresh Completed")
      ];
    }
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        spacing: 8,
        children: body,
      ),
    );
  }
}