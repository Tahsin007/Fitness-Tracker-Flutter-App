import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_tracker/core/error/failure.dart';
import 'package:fitness_tracker/core/usecase.dart';
import 'package:fitness_tracker/features/auth/domain/repositories/auth_repository.dart';

class CompleteProfileUseCase implements UseCase<void, CompleteProfileParams>{
  final AuthRepository authRepository;

  CompleteProfileUseCase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(CompleteProfileParams params) async{
    return await authRepository.completeProfile(params.gender,params.dob,params.weightKg,params.heightCm);
  }

}

class CompleteProfileParams extends Equatable {
  final String gender;
  final String dob;
  final double weightKg;
  final double heightCm;

  const CompleteProfileParams({
    required this.gender,
    required this.dob,
    required this.weightKg,
    required this.heightCm,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [gender, dob, weightKg, heightCm];
}