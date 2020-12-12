import 'package:flutter/material.dart';

abstract class ICounterViewModel extends ChangeNotifier {
  int get counter;
  void increment();
  void decrement();
  void showComfirmDialog();
}