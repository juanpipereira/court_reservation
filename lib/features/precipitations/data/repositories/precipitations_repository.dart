import 'dart:convert';

import 'package:court_reservation/features/precipitations/data/mappers/precipitations_mapper.dart';

import '../../domain/precipitations.dart';
import 'package:http/http.dart' as http;

import '../dtos/precipitations_dto.dart';

class PrecipitationsRepository {
  final String apiKey = 'ViCOttv3ydl8bLLRdzlPWTVRGtcr2lql';

  Future<Precipitations?> getChanceOfPrecipitation(
    String locationKey,
    DateTime requestedDate,
  ) async {
    Precipitations? precipitations;

    try {
      final response = await http.get(
        Uri.parse(
            'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey?apikey=$apiKey&details=true&metric=true'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        final precipitationsDTO = PrecipitationsDTO.fromJson(
          json: data,
          requestedDate: requestedDate,
        );
        precipitations = precipitationsDTO.toModel();
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }

    return precipitations;
  }
}
