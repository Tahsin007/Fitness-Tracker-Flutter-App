import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(UserModel userModel, String password);
  Future<void> signOut();
  Future<UserModel> getCurrentUser();
  Future<void> completeProfile(String gender, String dob, double weightKg, double heightCm);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDataSourceImpl({required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      final userData = await firebaseFirestore.collection('users').doc(user!.uid).get();
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email!, firstName: userData['firstName'], lastName: userData['lastName'], gender: userData['gender'], dob: userData['dob'], weightKg: userData['weightKg'], heightCm: userData['heightCm']);
      } else {
        throw ServerException();
      }
    } on auth.FirebaseAuthException catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );
      final user = userCredential.user;
      await firebaseFirestore.collection('users').doc(user!.uid).set(userModel.toMap());

      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email!,
          firstName: userModel.firstName,
          lastName: userModel.lastName,
          gender: userModel.gender,
          dob: userModel.dob,
          weightKg: userModel.weightKg,
          heightCm: userModel.heightCm,
        );
      } else {
        throw ServerException();
      }
    } on auth.FirebaseAuthException catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    return await firebaseFirestore.collection('users').doc(user!.uid).get().then((value) => UserModel.fromMap(value.data()!));
    // if (user != null) {
    //   return UserModel(uid: user.uid, email: user.email!);
    // } else {
    //   throw CacheException();
    // }
  }
  
  @override
  Future<void> completeProfile(String gender, String dob, double weightKg, double heightCm) async{
    final user = firebaseAuth.currentUser;
    await firebaseFirestore.collection('users').doc(user!.uid).update({'gender': gender, 'dob': dob, 'weightKg': weightKg, 'heightCm': heightCm});
  }
}
