import 'package:dartz/dartz.dart';
import 'package:fitness_tracker/core/error/failure.dart';
import 'package:fitness_tracker/features/home/data/models/daily_record.dart';

abstract class HomeRepository {
  Future<Either<Failure, DailyRecord>> getDailyRecord();
  Future<Either<Failure, void>> setTodayTarget(DailyRecord dailyRecord, String uid);
  Future<Either<Failure, DailyRecord>> updateTodayTarget(DailyRecord dailyRecord);
  Future<Either<Failure, void>> deleteTodayTarget(DailyRecord dailyRecord);
}