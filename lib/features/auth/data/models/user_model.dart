// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {

  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final double weightKg;
  final double heightCm;

  const UserModel({
    required super.uid,
    required super.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.weightKg,
    required this.heightCm,
  });


  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? dob,
    double? weightKg,
    double? heightCm,
  }) {
    return UserModel(
      uid: uid ,
      email: email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
      'weightKg': weightKg,
      'heightCm': heightCm,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      weightKg: map['weightKg'] as double,
      heightCm: map['heightCm'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, gender: $gender, dob: $dob, weightKg: $weightKg, heightCm: $heightCm)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.gender == gender &&
      other.dob == dob &&
      other.weightKg == weightKg &&
      other.heightCm == heightCm;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      weightKg.hashCode ^
      heightCm.hashCode;
  }
}
