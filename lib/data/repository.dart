import 'package:flutter/foundation.dart';

class Repository extends ChangeNotifier {

  Repository._privateConstructor();
  static final Repository _instance = Repository._privateConstructor();
  static Repository get getInstance => _instance;

  int _currentClickCount = 0;

  void incrementCounter() {
    _currentClickCount++;
    notifyListeners();
  }

  int getCurrentClickCount() => _currentClickCount;
}