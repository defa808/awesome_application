// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activityData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) {
  return ActivityData()
    ..stepsCount = json['stepsCount'] as int
    ..metersCount = json['metersCount'] as int;
}

Map<String, dynamic> _$ActivityDataToJson(ActivityData instance) =>
    <String, dynamic>{
      'stepsCount': instance.stepsCount,
      'metersCount': instance.metersCount
    };
