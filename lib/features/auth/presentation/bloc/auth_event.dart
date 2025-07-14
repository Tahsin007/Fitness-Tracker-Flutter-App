import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpEvent({required this.email, required this.password, required this.firstName, required this.lastName});

  @override
  List<Object> get props => [email, password, firstName, lastName];
}

class CompleteProfileEvent extends AuthEvent{
  final String gender;
  final String dob;
  final double weightKg;
  final double heightCm;

  const CompleteProfileEvent({required this.gender,required this.dob,required this.weightKg,required this.heightCm});

  @override
  List<Object> get props => [gender,dob,weightKg,heightCm];
}

class SignOutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}
