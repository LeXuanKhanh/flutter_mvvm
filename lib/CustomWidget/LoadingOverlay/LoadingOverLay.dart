import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ILoadingOverlayWidget {
  show();
  hide();
}

class LoadingOverlay {
  static final LoadingOverlay _singleton = LoadingOverlay._internal();

  factory LoadingOverlay() {
    return _singleton;
  }

  LoadingOverlay._internal();

  bool _isLoading = false;
  ILoadingOverlayWidget _iLoadingOverlayWidget;

  void initialize(ILoadingOverlayWidget iLoadingOverlayWidget) {
    _iLoadingOverlayWidget = iLoadingOverlayWidget;
  }

  void show() {
    if (!_isLoading) {
      _isLoading = true;
      _iLoadingOverlayWidget.show();
    }
  }

  void hide() {
    if (_isLoading) {
      _isLoading = false;
      _iLoadingOverlayWidget.hide();
    }
  }

}

class LoadingOverlayWidget extends StatefulWidget {
  final Widget child;
  LoadingOverlayWidget({Key key, this.child}) : super(key: key);

  @override
  _LoadingOverlayWidgetState createState() => _LoadingOverlayWidgetState();
}

class _LoadingOverlayWidgetState extends State<LoadingOverlayWidget> implements ILoadingOverlayWidget {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadingOverlay().initialize(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void show() {
    Navigator.of(context).push(LoadingOverlayScreen());
  }

  void hide() {
    Navigator.of(context).pop();
  }

}

class LoadingOverlayScreen extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.3);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(radius: 30)
    );
  }

//  @override
//  Widget buildTransitions(
//      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//    // You can add your own animations for the overlay content
//    return FadeTransition(
//      opacity: animation,
//      child: ScaleTransition(
//        scale: animation,
//        child: child,
//      ),
//    );
//  }
}