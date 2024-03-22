import 'package:court_reservation/features/court_reservation/domain/court_reservation.dart';

import '../../data/repositories/court_reservation_repository.dart';
import 'package:flutter/material.dart';

class CourtReservationController extends ChangeNotifier {
  final CourtReservationRepository _repository = CourtReservationRepository();
  late List<CourtReservation> _data = [];

  List<CourtReservation> get data => _data;

  Future<void> fetchData() async {
    final data = _repository.getAllData();
    data.sort();
    _data = data;
    notifyListeners();
  }

  int? getPossibleCourtIndex({
    required String courtName,
    required DateTime date,
  }) {
    int possibleIndex = 1;
    for (var reservation in data) {
      if (reservation.date.difference(date).inDays == 0 &&
          reservation.courtName == courtName) {
        possibleIndex++;
      }
    }

    return possibleIndex <= 3 ? possibleIndex : null;
  }

  Future<void> addData(CourtReservation newData) async {
    await _repository.addData(newData);
    fetchData();
  }

  Future<void> deleteData(int index) async {
    await _repository.deleteData(index);
    fetchData();
  }
}
