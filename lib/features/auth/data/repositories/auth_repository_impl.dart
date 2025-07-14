import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:fitness_tracker/features/auth/data/models/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final user = await remoteDataSource.signIn(email, password);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String firstname, String lastName, String email, String password) async {
    try {
      final userModel = UserModel(email: email, firstName: firstname, lastName: lastName, uid: '', gender: '', dob: '', weightKg: 0.0, heightCm: 0.0);
      final user = await remoteDataSource.signUp(userModel, password);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, User>> completeProfile(String gender, String dob, double weightKg, double heightCm) async{
    try {
      var user = await remoteDataSource.completeProfile(gender, dob, weightKg, heightCm);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
