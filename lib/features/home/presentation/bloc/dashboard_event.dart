part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetUserData extends DashboardEvent {}

class SetTodayTargetEvent extends DashboardEvent {
  final String userId;
  final TodayTargetParams todayTargetParams;
  const SetTodayTargetEvent({required this.userId, required this.todayTargetParams});
}