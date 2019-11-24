import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings with ChangeNotifier {
  bool showHeartRate = true;
  bool showWeight = true;
  bool showSlept = true;
  
  changeShowHeartRate(bool value){
    showHeartRate = value;
    saveStorage();
    notifyListeners();
  }

  changeShowWeight(bool value){
    showWeight = value;
    saveStorage();
    notifyListeners();
  }

  changeShowSlept(bool value){
    showSlept = value;
    saveStorage();
    notifyListeners();
  }

  saveStorage() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('showHeartRate',showHeartRate);
    prefs.setBool('showWeight',showWeight);
    prefs.setBool('showSlept',showSlept);
  }

  initSettings() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   
    this.changeShowHeartRate(prefs.getBool('showHeartRate'));
    this.changeShowWeight(prefs.getBool('showWeight'));
    this.changeShowSlept(prefs.getBool('showSlept'));
  }


}
