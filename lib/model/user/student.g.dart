// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(json['studentId'], json['studentName'], json['studentEmail'],
      json['matricNo'], json['phoneNo']);
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentEmail': instance.studentEmail,
      'matricNo': instance.matricNo,
      'phoneNo': instance.phoneNo
    };
