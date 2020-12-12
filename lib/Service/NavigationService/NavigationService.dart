import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/Service/NavigationService/RoutePath.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Route generateRoute(RouteSettings settings) {
    RoutePath route = RoutePath.values.firstWhere((values) {
      return values.toString() == settings.name;
    }, orElse: () => null);

    if (route != null) {
      return MaterialPageRoute(builder: (context) => route.view);
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );

  }

  Future<dynamic> navigateTo(RoutePath routePath) {
    var a = {'name': 'hello'};
    return navigatorKey.currentState.pushNamed(routePath.toString(), arguments: a);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }

}

