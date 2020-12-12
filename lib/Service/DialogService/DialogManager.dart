import 'package:flutter/material.dart';
import 'package:flutter_mvvm_di/Service/DialogService/DialogService.dart';
import 'package:get_it/get_it.dart';

abstract class IDialogManager {
  Future showAlertDialog({String title = 'alert', String content = ''});
  Future<String> showComfirmDialog();
}

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> implements IDialogManager {
  DialogService _dialogService = GetIt.instance<DialogService>();


  @override
  void initState() {
    super.initState();
    _dialogService.initialize(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future showAlertDialog({String title = 'alert', String content = ''}) {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> showComfirmDialog() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop("hello");
              },
            ),
          ],
        );
      },
    );
  }

}