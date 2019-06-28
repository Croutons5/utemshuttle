import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  final studentId;
  final studentName;
  final studentEmail;
  final matricNo;
  final phoneNo;

  Student(this.studentId, this.studentName, this.studentEmail, this.matricNo,
      this.phoneNo);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
