import '../../../precipitations/presentation/controllers/precipitations_controller.dart';
import '../controllers/court_reservation_controller.dart';
import '../widgets/add_reservation_dialog.dart';
import '../widgets/reservations_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationsController =
        Provider.of<CourtReservationController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Reserve your Court',
            style: TextStyle(
              fontSize: 32,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
      body: const ReservationsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ChangeNotifierProvider(
                create: (context) => PrecipitationsController(),
                child: AddReservationDialog(
                  controller: reservationsController,
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
