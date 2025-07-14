import 'package:dartz/dartz.dart';
import 'package:fitness_tracker/core/error/exceptions.dart';
import 'package:fitness_tracker/core/error/failure.dart';
import 'package:fitness_tracker/features/home/data/datasources/home_remote_datasources.dart';
import 'package:fitness_tracker/features/home/data/models/daily_record.dart';
import 'package:fitness_tracker/features/home/domain/repositories/home_repository.dart';

class HomeRepositoriesImpl extends HomeRepository{
  final HomeRemoteDatasources homeRemoteDatasources;
  HomeRepositoriesImpl( this.homeRemoteDatasources);

  @override
  Future<Either<Failure, void>> deleteTodayTarget(DailyRecord dailyRecord) {
    // TODO: implement deleteTodayTarget
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DailyRecord>> getDailyRecord() {
    // TODO: implement getDailyRecord
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setTodayTarget(DailyRecord dailyRecord, String uid) async{
    try{
      final result = await homeRemoteDatasources.setTodayTarget(dailyRecord, uid);
      return Right(result);
    }on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DailyRecord>> updateTodayTarget(DailyRecord dailyRecord) {
    // TODO: implement updateTodayTarget
    throw UnimplementedError();
  }

}