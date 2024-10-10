import 'dart:async';

import 'package:flutter/cupertino.dart';

class ConfirmTransationLogic with ChangeNotifier {
  String? _otp;

  int remainingSeconds = 120;
  late Timer _timer;

  init() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  changeOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }
}
