import 'package:intl/intl.dart';

class InEntity {
  int id;
  DateTime createdTime;
  int type;
  String inStyle;
  DateTime atInTime;
  String local;
  String remark;

  InEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.inStyle,
    required this.atInTime,
    required this.local,
    required this.remark,
  });

  factory InEntity.fromJson(Map<String, dynamic> json) {
    return InEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      inStyle: json['inStyle'],
      atInTime: DateTime.parse(json['atInTime']),
      local: json['local'],
      remark: json['remark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'inStyle': inStyle,
      'atInTime': atInTime.toIso8601String(),
      'local': local,
      'remark': remark,
    };
  }

  String get atInTimeStr => DateFormat('yyyy-MM-dd HH:mm').format(atInTime);
}