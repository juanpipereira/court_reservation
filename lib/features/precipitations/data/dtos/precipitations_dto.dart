class PrecipitationsDTO {
  const PrecipitationsDTO(this.percentage);

  factory PrecipitationsDTO.fromJson({
    required Map<String, dynamic> json,
    required DateTime requestedDate,
  }) {
    final newRequestedDate = DateTime(
      requestedDate.year,
      requestedDate.month,
      requestedDate.day,
    );
    final now = DateTime.now();
    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final dayIndex = newRequestedDate.difference(today).inDays;

    print('--- difference of days $dayIndex');

    int chanceOfPrecipitation =
        json['DailyForecasts'][dayIndex]['Day']['RainProbability'];

    print('--- $chanceOfPrecipitation');
    return PrecipitationsDTO(chanceOfPrecipitation);
  }

  final int? percentage;
}
