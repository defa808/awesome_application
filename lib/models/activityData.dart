import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'activityData.g.dart';

@JsonSerializable()
class ActivityData with ChangeNotifier {
  String urlService = "http://192.168.0.108:61600";
  int stepsCount = 0;
  int metersCount = 0;
  bool _isFetching = false;
  bool isSynchronized = false;

  ActivityData() : super() {}
  int getKCal() {
    return (stepsCount / 17).floor();
  }

  incrementSteps() {
    stepsCount += 3;
    metersCount += 2;
    notifyListeners();
    synchronize();
  }

  synchronize(){
      isSynchronized = false;
    http
        .post(Uri.encodeFull(urlService + '/api/values'),headers:{"Content-type": "application/json"},body: json.encode(this.toJson()))
        .then((http.Response res) async {
      if (res.statusCode == 200) {
        isSynchronized = true;
        notifyListeners();
      }
    });
  }

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    http.Response response = await http.get(
        Uri.encodeFull(urlService + '/api/values'));

  Map<String,dynamic> activityDateJSON = jsonDecode(response.body) as Map<String,dynamic>;
    ActivityData date = ActivityData.fromJson(activityDateJSON);
    stepsCount = date.stepsCount;
    metersCount = date.metersCount;
    _isFetching = false;
    notifyListeners();

  }

  resetSteps() {
    stepsCount = 0;
    metersCount = 0;
    notifyListeners();
  }

  factory ActivityData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ActivityDataToJson`.
  Map<String, dynamic> toJson() => _$ActivityDataToJson(this);
}
