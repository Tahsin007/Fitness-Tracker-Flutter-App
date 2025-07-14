import 'package:fitness_tracker/features/home/presentation/widgets/target_setting.dart';

class TodayTargetParams {
  final String userId;
  final List<TargetItem> targetItems;

  TodayTargetParams({required this.userId, required this.targetItems});
}
