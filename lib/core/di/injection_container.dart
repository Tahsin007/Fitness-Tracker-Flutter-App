import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fitness_tracker/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitness_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitness_tracker/features/auth/domain/usecases/get_current_user.dart';
import 'package:fitness_tracker/features/auth/domain/usecases/signin.dart';
import 'package:fitness_tracker/features/auth/domain/usecases/signout.dart';
import 'package:fitness_tracker/features/auth/domain/usecases/signup.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => AuthBloc(
      signIn: sl(),
      signUp: sl(),
      signOut: sl(),
      getCurrentUser: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignIn(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl()),
  );

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
