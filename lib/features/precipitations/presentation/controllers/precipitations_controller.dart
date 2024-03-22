import '../../data/repositories/precipitations_repository.dart';
import '../../domain/precipitations.dart';
import 'package:flutter/material.dart';

class PrecipitationsController extends ChangeNotifier {
  /// This is the location key obtained in AccuWeather
  /// for Tandil, Bs. As., Argentina, where the courts
  /// are supposed to be located.
  static const locationKey = '2929';

  final PrecipitationsRepository _weatherRepository =
      PrecipitationsRepository();
  Precipitations? _chanceOfPrecipitation;

  Precipitations? get chanceOfPrecipitation => _chanceOfPrecipitation;

  Future<void> fetchChanceOfPrecipitation(DateTime requestedDate) async {
    _chanceOfPrecipitation = await _weatherRepository.getChanceOfPrecipitation(
      locationKey,
      requestedDate,
    );
    notifyListeners();
  }
}
