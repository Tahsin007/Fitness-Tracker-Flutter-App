import 'package:bloc/bloc.dart';

import '../../../../core/usecase.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/signin.dart';
import '../../domain/usecases/signout.dart';
import '../../domain/usecases/signup.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    on<CheckAuthEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await getCurrentUser(NoParams());
      result.fold(
        (failure) => emit(Unauthenticated()),
        (user) => emit(Authenticated(user: user)),
      );
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signIn(SignInParams(email: event.email, password: event.password));
      result.fold(
        (failure) => emit(const AuthError(message: 'Invalid credentials')),
        (user) => emit(Authenticated(user: user)),
      );
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signUp(SignUpParams(email: event.email, password: event.password));
      result.fold(
        (failure) => emit(const AuthError(message: 'Failed to sign up')),
        (user) => emit(Authenticated(user: user)),
      );
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signOut(NoParams());
      result.fold(
        (failure) => emit(const AuthError(message: 'Failed to sign out')),
        (_) => emit(Unauthenticated()),
      );
    });
  }
}
