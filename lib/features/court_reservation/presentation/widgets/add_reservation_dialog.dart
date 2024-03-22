import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/datetime_logic.dart';
import '../../../precipitations/domain/precipitations.dart';
import '../../../precipitations/presentation/controllers/precipitations_controller.dart';
import '../../domain/court.dart';
import '../../domain/court_reservation.dart';
import '../controllers/court_reservation_controller.dart';
import 'court_selector.dart';
import 'input_title.dart';

class AddReservationDialog extends StatefulWidget {
  const AddReservationDialog({
    required this.controller,
    super.key,
  });

  final CourtReservationController controller;

  @override
  State<AddReservationDialog> createState() => _AddReservationDialogState();
}

class _AddReservationDialogState extends State<AddReservationDialog> {
  Court? court;
  DateTime? date;
  int? possibleCourtIndex;
  String? userName;

  bool get isCourtIndexAvailable => court != null && date != null;

  bool get isButtonActive =>
      court != null &&
      date != null &&
      userName != null &&
      userName!.isNotEmpty &&
      possibleCourtIndex != null;

  @override
  Widget build(BuildContext context) {
    final precipitations = Provider.of<PrecipitationsController>(context);

    if (isCourtIndexAvailable) {
      setState(
        () {
          possibleCourtIndex = widget.controller.getPossibleCourtIndex(
            courtName: court!.name,
            date: date!,
          );
        },
      );
    }

    return Dialog.fullscreen(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Add a reservation',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const InputTitle(title: 'Date'),
                      Row(
                        children: [
                          Text(
                            date?.formatLegible() ?? 'No date',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: () async {
                              final newDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 4),
                                ),
                              );
                              if (newDate != null) {
                                setState(
                                  () {
                                    date = newDate;
                                  },
                                );
                                await precipitations
                                    .fetchChanceOfPrecipitation(date!);
                              }
                            },
                            child: const Text('Pick Date'),
                          ),
                        ],
                      ),
                      const InputTitle(title: 'Court'),
                      CourtSelector(
                        callback: (newCourt) {
                          setState(() {
                            court = newCourt;
                          });
                        },
                      ),
                      const InputTitle(title: 'Name'),
                      SizedBox(
                        height: 75.0,
                        width: 300.0,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            hintText: 'Your name',
                          ),
                          maxLength: 20,
                          onChanged: (value) => setState(
                            () {
                              userName = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset(
                            'assets/rain.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Precipitations chances:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${precipitations.chanceOfPrecipitation?.percentage ?? 'NA'}%',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      if (isCourtIndexAvailable) ...[
                        const InputTitle(title: 'Court number'),
                        Text(
                          possibleCourtIndex != null
                              ? 'The number of court is $possibleCourtIndex'
                              : 'Sorry, there is no court available on that date',
                          style: TextStyle(
                            color: possibleCourtIndex != null
                                ? null
                                : Colors.red.shade600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isButtonActive
                              ? () async {
                                  await widget.controller.addData(
                                    CourtReservation(
                                      courtName: (court ?? Court.a).name,
                                      date: date ?? DateTime.now(),
                                      id: possibleCourtIndex ?? 0,
                                      precipitations: precipitations
                                              .chanceOfPrecipitation ??
                                          const Precipitations(0),
                                      userName: userName ?? '',
                                    ),
                                  );
                                  Future(() => Navigator.pop(context));
                                }
                              : null,
                          child: const Text('Add Reservation'),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
