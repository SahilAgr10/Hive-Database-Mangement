import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
        required this.title,
        required this.subtitle,
        required this.startDate,
        required this.endDate,
        required this.isCompleted});

  /// ID
  @HiveField(0)
  final String id;

  /// TITLE
  @HiveField(1)
  String title;

  /// SUBTITLE
  @HiveField(2)
  String subtitle;

  /// CREATED AT TIME
  @HiveField(3)
  DateTime startDate;

  /// CREATED AT DATE
  @HiveField(4)
  DateTime endDate;

  /// IS COMPLETED
  @HiveField(5)
  bool isCompleted;

  /// create new Task
  factory Task.create({
    required String? title,
    required String? subtitle,
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      Task(
        id: const Uuid().v1(),
        title: title ?? "Frankfurt",
        subtitle: subtitle ?? "",
        startDate: startDate?? DateTime.now(),
        endDate:endDate?? DateTime.now(),
        isCompleted: false,
      );
}
