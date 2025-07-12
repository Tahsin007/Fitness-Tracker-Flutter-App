import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUp implements UseCase<User, SignUpParams> {
  final AuthRepository repository;

  SignUp(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUp(params.firsName, params.lastName, params.email, params.password);
  }
}

class SignUpParams extends Equatable {
  final String firsName;
  final String lastName;
  final String email;
  final String password;

  const SignUpParams({required this.firsName, required this.lastName,required this.email, required this.password});

  @override
  List<Object?> get props => [email, password, firsName, lastName];
}
