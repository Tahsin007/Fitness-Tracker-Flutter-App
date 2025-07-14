import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_tracker/features/auth/domain/entities/user.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_state.dart';
import 'package:fitness_tracker/features/home/domain/use_cases/today_target_params.dart';
import 'package:fitness_tracker/features/home/domain/use_cases/today_target_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AuthBloc authBloc;
  final TodayTargetUsecase todayTargetUsecase;

  DashboardBloc({required this.authBloc, required this.todayTargetUsecase})
    : super(DashboardInitial()) {
    on<GetUserData>((event, emit) {
      final state = authBloc.state;
      if (state is Authenticated) {
        emit(DashboardLoaded(user: state.user));
      } else {
        emit(const DashboardError(message: 'User not authenticated'));
      }
    });

    on<SetTodayTargetEvent>((event, emit) async {
      emit(DashboardLoading());
      var call = await todayTargetUsecase.call(event.todayTargetParams);
      call.fold(
        (l) => emit(DashboardError(message: l.toString())),
        (r) => emit(SetTodayTargetSuccess()),
      );
    });
  }
}
