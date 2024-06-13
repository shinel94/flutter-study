import 'package:uuid/uuid.dart';

class ScheduleItem {
  final int id;
  final String uuid;
  final int courtId;
  final String courtName;
  final String courtImagePath;
  final int gameType;
  final int gameStartHour;
  final int gameDurationMin;
  final int requiredTotalCount;
  final int requiredManCount;
  final int requiredWomanCount;
  final int totalCount;
  final int manCount;
  final int womanCount;

  const ScheduleItem({
    required this.id,
    required this.uuid,
    required this.courtId,
    required this.courtName,
    required this.courtImagePath,
    required this.gameType,
    required this.gameStartHour,
    required this.gameDurationMin,
    required this.requiredTotalCount,
    required this.requiredManCount,
    required this.requiredWomanCount,
    required this.totalCount,
    required this.manCount,
    required this.womanCount,
  });

  static ScheduleItem fromResponse(Map<int, dynamic> response) {
    return ScheduleItem(
      id: response['id'],
      uuid: response['uuid'],
      courtId: response['court_id'],
      courtName: response['court_name'],
      courtImagePath: response['court_image_path'],
      gameType: response['game_type'],
      gameStartHour: response['game_start_hour'],
      gameDurationMin: response['game_duration_min'],
      requiredTotalCount: 4,
      requiredManCount: 2,
      requiredWomanCount: 2,
      totalCount: 1,
      manCount: 1,
      womanCount: 0,
    );
  }

  static List<ScheduleItem> getDummyData(int count) {
    List<ScheduleItem> result = [];
    for (int i = 0; i < count; i++) {
      result.add(ScheduleItem(
        id: i + 1,
        uuid: Uuid().toString(),
        courtId: i + 10,
        courtName: 'Court $i',
        courtImagePath: "",
        gameType: i % 3,
        gameStartHour: 10,
        gameDurationMin: 120,
        requiredTotalCount: 4,
        requiredManCount: 2,
        requiredWomanCount: 2,
        totalCount: 1,
        manCount: 1,
        womanCount: 0,
      ));
    }
    return result;
  }
}
