import 'package:json_annotation/json_annotation.dart';
import 'package:scoped_model/scoped_model.dart';

part 'driver.g.dart';

@JsonSerializable()
class Driver extends Model {
  final driverID;
  final driverName;
  final driverEmail;
  final busID;

  Driver(this.driverID, this.driverName, this.driverEmail, this.busID);

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
