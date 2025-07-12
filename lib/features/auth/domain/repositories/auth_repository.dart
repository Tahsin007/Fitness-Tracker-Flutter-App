import 'package:dartz/dartz.dart';
import 'package:fitness_tracker/features/auth/data/models/user_model.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<Either<Failure, User>> signUp(String firstName, String lastName, String email, String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, User>> completeProfile(String gender, String dob, double weightKg, double heightCm);
}
