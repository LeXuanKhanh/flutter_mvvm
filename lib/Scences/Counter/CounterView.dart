import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/CustomWidget/LoadingOverlay/LoadingOverLay.dart';
import 'package:flutter_mvvm_di/Service/BackgroundService/BackgroundServiceExample.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mvvm_di/App/LibraryPackage.dart';

class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  DialogService _dialogService = GetIt.instance<DialogService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BackgroundServiceExample().onReceiveData.listen((data) {
      print('background service value $data');
    });
  }

  void doThings() async {
    print('dialog called');
    String dialogResult = await _dialogService.showComfirmDialog();
    print('result $dialogResult');
    print('dialog closed');
  }

  void doAnotherThings() {
    print('dialog called');
    _dialogService.showComfirmDialog().then((value) {
      print('result $value');
    });
    print('dialog closed');
  }

  void showLoadingOverlay() async {
    LoadingOverlay().show();
    await Future.delayed(Duration(seconds: 3));
    LoadingOverlay().hide();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ICounterViewModel>(
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text("CounterView"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      viewModel.counter.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                    RaisedButton(onPressed: () {
                      GetIt.instance<NavigationService>()
                          .navigateTo(RoutePath.news);
                    }),
                    RaisedButton(
                        child: Text('Pause Background Service'),
                        onPressed: () {
                          BackgroundServiceExample().pause();
                        }),
                    RaisedButton(
                        child: Text('Resume Background Service'),
                        onPressed: () {
                          BackgroundServiceExample().resume();
                        }),
                    RaisedButton(
                        child: Text('Stop Background Service'),
                        onPressed: () {
                          BackgroundServiceExample().stop();
                        }),
                    RaisedButton(
                        child: Text('Show Loading Screen'),
                        onPressed: showLoadingOverlay,
                    )
                  ],
                ),
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      viewModel.increment();
                      //doAnotherThings();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 30),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      viewModel.decrement();
                      //doThings();
                      viewModel.showComfirmDialog();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ));
  }
}
