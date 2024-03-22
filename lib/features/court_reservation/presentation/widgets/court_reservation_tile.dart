import '../../../../core/domain/datetime_logic.dart';
import 'package:flutter/material.dart';

class CourtReservationTile extends StatelessWidget {
  const CourtReservationTile({
    required this.clubName,
    required this.date,
    required this.deleteCallback,
    super.key,
    required this.reservationNumber,
    required this.userName,
  });
  final String clubName;
  final DateTime date;
  final int reservationNumber;
  final String userName;
  final VoidCallback deleteCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        clubName,
        style: TextStyle(
          color: Colors.blue.shade800,
          fontSize: 28,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            date.formatLegible(),
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            'Number $reservationNumber',
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteCallback,
      ),
    );
  }
}
