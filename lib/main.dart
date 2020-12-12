import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/CustomWidget/LoadingOverlay/LoadingOverLay.dart';
import 'package:flutter_mvvm_di/Service/BackgroundService/BackgroundServiceExample.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

//flutter pub run build_runner watch
void main() {
  Provider.debugCheckInvalidValueType = null;

  registerAppInterface();

  BackgroundServiceExample().start();
  runApp(
    MultiProvider(
      providers: resolvedInterfaceProviders(),
      child: MyApp(),
    ),
  );
}

void registerAppInterface() {

  GetIt.instance.registerLazySingleton(() => DialogService());
  GetIt.instance.registerLazySingleton(() => NavigationService());
  GetIt.instance.registerSingleton<INetworkManager>(NetworkManager());

  GetIt.instance.registerFactory<IBaseViewModel>(() => BaseViewModel());
  GetIt.instance.registerFactory<ICounterViewModel>(() => CounterViewModel());
  GetIt.instance.registerFactory<INewsViewModel>(() => NewsViewModel());

}

List<InheritedProvider> resolvedInterfaceProviders() {
  List<InheritedProvider> providers = List<InheritedProvider>();

  final counterProvider = ChangeNotifierProvider(create: (context) =>  GetIt.instance<ICounterViewModel>());
  providers.add(counterProvider);

  return providers;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: LoadingOverlayWidget(child: widget),
          ),
        ),
      ),
      navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
      onGenerateRoute:  GetIt.instance<NavigationService>().generateRoute,
      initialRoute: RoutePath.counter.toString(),
    );
  }
}

