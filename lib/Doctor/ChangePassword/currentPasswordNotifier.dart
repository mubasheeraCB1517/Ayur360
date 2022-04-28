import 'package:flutter/foundation.dart';

class CurrentPassordNotifier extends ChangeNotifier {
  String _errorMsg = "";

  String get errorMsg => _errorMsg;

  void getErrorMsg(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners();
  }
}
