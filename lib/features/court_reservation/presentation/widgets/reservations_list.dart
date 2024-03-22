import 'package:court_reservation/features/court_reservation/presentation/widgets/court_reservation_tile.dart';

import '../controllers/court_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationsList extends StatefulWidget {
  const ReservationsList({super.key});

  @override
  State<ReservationsList> createState() => _ReservationsListState();
}

class _ReservationsListState extends State<ReservationsList> {
  @override
  void initState() {
    super.initState();
    Future(
      () => Provider.of<CourtReservationController>(
        context,
        listen: false,
      ).fetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourtReservationController>(
      builder: (context, controller, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final reservation = controller.data[index];

              return CourtReservationTile(
                clubName: reservation.courtName,
                date: reservation.date,
                deleteCallback: () async => await controller.deleteData(index),
                reservationNumber: reservation.id,
                userName: reservation.userName,
              );
            },
          ),
        );
      },
    );
  }
}
