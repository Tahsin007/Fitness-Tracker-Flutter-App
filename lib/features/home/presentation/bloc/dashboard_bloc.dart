import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_tracker/features/auth/domain/entities/user.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_state.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AuthBloc authBloc;

  DashboardBloc({required this.authBloc}) : super(DashboardInitial()) {
    on<GetUserData>((event, emit) {
      final state = authBloc.state;
      if (state is Authenticated) {
        emit(DashboardLoaded(user: state.user));
      } else {
        emit(const DashboardError(message: 'User not authenticated'));
      }
    });
  }
}