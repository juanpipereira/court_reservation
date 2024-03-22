import '../../domain/court_reservation.dart';
import 'package:hive/hive.dart';

class CourtReservationRepository {
  static const boxName = 'courtReservation';

  Future<Box<CourtReservation>> openBox() async {
    return await Hive.openBox<CourtReservation>(boxName);
  }

  Future<void> addData(CourtReservation newData) async {
    final box = await openBox();
    await box.add(newData);
  }

  Future<void> deleteData(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
  }

  List<CourtReservation> getAllData() {
    final box = Hive.box<CourtReservation>(boxName);
    return box.values.toList();
  }
}
