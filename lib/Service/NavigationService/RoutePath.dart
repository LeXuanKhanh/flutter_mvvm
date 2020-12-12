import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

enum RoutePath {
  counter,
  news,
}

extension Route_Screen on RoutePath {

  Widget get view {
    switch (this) {
      case RoutePath.counter:
        // TODO: Handle this case.
        return CounterView();
        break;
      case RoutePath.news:
        // TODO: Handle this case.
        return NewsView();
        break;
      default:
        // never happen, just in case
        return Scaffold(
          body: Center(
            child: Text('No path for ${this}'),
          ),
        );
    }
  }
}