import 'package:hive/hive.dart';

import '../../precipitations/domain/precipitations.dart';
part 'court_reservation.g.dart';

@HiveType(typeId: 1)
class CourtReservation implements Comparable {
  const CourtReservation({
    required this.courtName,
    required this.date,
    required this.id,
    required this.precipitations,
    required this.userName,
  });

  @HiveField(0)
  final String courtName;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final Precipitations precipitations;
  @HiveField(4)
  final String userName;

  @override
  int compareTo(other) {
    return (other as CourtReservation).date.compareTo(date);
  }
}
