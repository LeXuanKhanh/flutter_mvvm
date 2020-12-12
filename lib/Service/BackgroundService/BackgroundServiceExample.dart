import 'dart:async';
import 'dart:isolate';

///   How to use:
/// - Start background service first:
///     BackgroundServiceExample().start()
/// - After that just listen data come out of isolate:
///     BackgroundServiceExample().onReceiveData.listen((data) {
///       print('background service value $data');
///     });
class BackgroundServiceExample {

  static final BackgroundServiceExample _singleton = BackgroundServiceExample._internal();

  factory BackgroundServiceExample() {
    return _singleton;
  }

  BackgroundServiceExample._internal();

  StreamController<String> _streamControllerReceiver =  StreamController.broadcast();
  Sink<String> get _dataSink => _streamControllerReceiver.sink;

  Isolate _isolate;
  bool _isRunning = false;
  ReceivePort _receivePort;
  Capability _capability = Capability();

  // Listen to this to get data
  Stream<String> get onReceiveData => _streamControllerReceiver.stream;

  //only start once
  void start() async {
    _isRunning = true;
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_checkTimer, _receivePort.sendPort);
    _receivePort.listen(_dataSink.add, onDone:() {
      print("background isolate is killed");
    });
  }

  static void _checkTimer(SendPort sendPort) async {
    var counter = 0;
    Timer.periodic(new Duration(seconds: 1), (Timer t) {
      String msg = '$counter';
      counter++;
      sendPort.send(msg);
    });
  }

  void pause() {
    if (_isRunning) {
      _isolate.pause(_capability);
      _isRunning = false;
    } else {
      print('cant pause the isolate because its being paused or killed');
    }

  } 
  
  void resume() {
    if (!_isRunning) {
      _isolate.resume(_capability);
      _isRunning = true;
    } else {
      print('cant pause the isolate because its running');
    }

  }
  
  void stop() {
    if (_isolate != null) {
      _streamControllerReceiver.close();
      _isRunning = false;
      _receivePort.close();
      _isolate.kill(priority: Isolate.immediate);
      _isolate = null;
    }
  }
}