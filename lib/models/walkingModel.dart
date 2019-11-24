import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WalkingModel with ChangeNotifier {
  bool isTimerAllive = false;
  double duration = 0;
  incrementDuration() {
    duration++;
    notifyListeners();
  }

  finishTimer() {
    isTimerAllive = false;
    notifyListeners();
  }

  getIsTimerAllive() {
    return isTimerAllive;
  }

  resetTimer() {
    isTimerAllive = true;
    duration = 0.0;
    notifyListeners();
  }

  startTimer() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.isTimerAllive) {
        incrementDuration();
      } else {
        timer.cancel();
      }
    });
  }
}
