// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DailyRecord {
  final DateTime date;
  final int stepsTarget;
  final double waterTargetLitres;
  final int sleepTargetHours;
  final int caloriesTarget;
  final int stepCovered;
  final double waterCoveredLitres;
  final int sleepCoveredHours;
  final int caloriesCovered;

  DailyRecord({
    required this.date,
    required this.stepsTarget,
    required this.waterTargetLitres,
    required this.sleepTargetHours,
    required this.caloriesTarget,
    this.stepCovered=0,
    this.waterCoveredLitres=0,
    this.sleepCoveredHours=0,
    this.caloriesCovered=0,
  });

  DailyRecord copyWith({
    DateTime? date,
    int? stepsTarget,
    double? waterTargetLitres,
    int? sleepTargetHours,
    int? caloriesTarget,
    int? stepCovered,
    double? waterCoveredLitres,
    int? sleepCoveredHours,
    int? caloriesCovered,
  }) {
    return DailyRecord(
      date: date ?? this.date,
      stepsTarget: stepsTarget ?? this.stepsTarget,
      waterTargetLitres: waterTargetLitres ?? this.waterTargetLitres,
      sleepTargetHours: sleepTargetHours ?? this.sleepTargetHours,
      caloriesTarget: caloriesTarget ?? this.caloriesTarget,
      stepCovered: stepCovered ?? this.stepCovered,
      waterCoveredLitres: waterCoveredLitres ?? this.waterCoveredLitres,
      sleepCoveredHours: sleepCoveredHours ?? this.sleepCoveredHours,
      caloriesCovered: caloriesCovered ?? this.caloriesCovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'stepsTarget': stepsTarget,
      'waterTargetLitres': waterTargetLitres,
      'sleepTargetHours': sleepTargetHours,
      'caloriesTarget': caloriesTarget,
      'stepCovered': stepCovered,
      'waterCoveredLitres': waterCoveredLitres,
      'sleepCoveredHours': sleepCoveredHours,
      'caloriesCovered': caloriesCovered,
    };
  }

  factory DailyRecord.fromMap(Map<String, dynamic> map) {
    return DailyRecord(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      stepsTarget: map['stepsTarget'] as int,
      waterTargetLitres: map['waterTargetLitres'] as double,
      sleepTargetHours: map['sleepTargetHours'] as int,
      caloriesTarget: map['caloriesTarget'] as int,
      stepCovered: map['stepCovered'] as int,
      waterCoveredLitres: map['waterCoveredLitres'] as double,
      sleepCoveredHours: map['sleepCoveredHours'] as int,
      caloriesCovered: map['caloriesCovered'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyRecord.fromJson(String source) => DailyRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DailyRecord(date: $date, stepsTarget: $stepsTarget, waterTargetLitres: $waterTargetLitres, sleepTargetHours: $sleepTargetHours, caloriesTarget: $caloriesTarget, stepCovered: $stepCovered, waterCoveredLitres: $waterCoveredLitres, sleepCoveredHours: $sleepCoveredHours, caloriesCovered: $caloriesCovered)';
  }

  @override
  bool operator ==(covariant DailyRecord other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.stepsTarget == stepsTarget &&
      other.waterTargetLitres == waterTargetLitres &&
      other.sleepTargetHours == sleepTargetHours &&
      other.caloriesTarget == caloriesTarget &&
      other.stepCovered == stepCovered &&
      other.waterCoveredLitres == waterCoveredLitres &&
      other.sleepCoveredHours == sleepCoveredHours &&
      other.caloriesCovered == caloriesCovered;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      stepsTarget.hashCode ^
      waterTargetLitres.hashCode ^
      sleepTargetHours.hashCode ^
      caloriesTarget.hashCode ^
      stepCovered.hashCode ^
      waterCoveredLitres.hashCode ^
      sleepCoveredHours.hashCode ^
      caloriesCovered.hashCode;
  }
}
