// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
      json['driverID'], json['driverName'], json['driverEmail'], json['busID']);
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'driverID': instance.driverID,
      'driverName': instance.driverName,
      'driverEmail': instance.driverEmail,
      'busID': instance.busID
    };
