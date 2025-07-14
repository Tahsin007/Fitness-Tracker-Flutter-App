import 'package:dartz/dartz.dart';
import 'package:fitness_tracker/core/error/failure.dart';
import 'package:fitness_tracker/core/usecase.dart';
import 'package:fitness_tracker/features/home/data/models/daily_record.dart';
import 'package:fitness_tracker/features/home/domain/repositories/home_repository.dart';
import 'package:fitness_tracker/features/home/domain/use_cases/today_target_params.dart';

class TodayTargetUsecase implements UseCase<void, TodayTargetParams> {
  final HomeRepository homeRepository;

  TodayTargetUsecase({required this.homeRepository});
  @override
  Future<Either<Failure, void>> call(TodayTargetParams params) {
    final uid = params.userId;
    final dailyRecords = DailyRecord(
      date: DateTime.now().toIso8601String(),
      stepsTarget: params.targetItems[1].value.toInt(),
      waterTargetLitres: params.targetItems[2].value,
      sleepTargetHours: params.targetItems[3].value.toInt(),
      caloriesTarget: params.targetItems[0].value.toInt(),
    );
    return homeRepository.setTodayTarget(dailyRecords, uid);
  }
}