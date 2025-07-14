import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker/features/home/data/models/daily_record.dart';

abstract class HomeRemoteDatasources {
  Future<void> setTodayTarget(DailyRecord dailyRecord, String uid);
  Future<DailyRecord> getTodayTarget(String uid);
  Future<void> updateTodayTarget(DailyRecord dailyRecord, String uid);
  Future<void> deleteTodayTarget(DailyRecord dailyRecord, String uid);
}

class HomeRemoteDatasourcesImpl implements HomeRemoteDatasources {
  final FirebaseFirestore firebaseFirestore;
  HomeRemoteDatasourcesImpl({required this.firebaseFirestore});

  @override
  Future<DailyRecord> getTodayTarget(String uid) async {
    final today = DateTime.fromMicrosecondsSinceEpoch(
      DateTime.now().microsecondsSinceEpoch,
    );
    return await firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('daily_records')
        .doc(today.toString())
        .get()
        .then((value) => DailyRecord.fromMap(value.data()!));
  }

  @override
  Future<void> setTodayTarget(DailyRecord dailyRecord, String uid) async {
    final today = DateTime.fromMicrosecondsSinceEpoch(
      DateTime.now().microsecondsSinceEpoch,
    );
    await firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('daily_records')
        .doc(today.toString())
        .set(dailyRecord.toMap());
  }

  @override
  Future<void> deleteTodayTarget(DailyRecord dailyRecord, String uid) {
    // TODO: implement deleteTodayTarget
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodayTarget(DailyRecord dailyRecord, String uid) {
    // TODO: implement updateTodayTarget
    throw UnimplementedError();
  }
}
