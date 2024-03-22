import 'package:court_reservation/features/court_reservation/data/repositories/court_reservation_repository.dart';

import 'features/court_reservation/domain/court_reservation.dart';
import 'features/court_reservation/presentation/controllers/court_reservation_controller.dart';
import 'features/court_reservation/presentation/pages/reservations_page.dart';
import 'features/precipitations/domain/precipitations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(
    PrecipitationsAdapter(),
  );
  Hive.registerAdapter(
    CourtReservationAdapter(),
  );
  await Hive.openBox<CourtReservation>(
    CourtReservationRepository.boxName,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Court Reservation',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => CourtReservationController(),
        child: const ReservationsPage(),
      ),
    );
  }
}
