import 'package:court_reservation/features/court_reservation/domain/court.dart';
import 'package:flutter/material.dart';

class CourtSelector extends StatefulWidget {
  const CourtSelector({
    super.key,
    required this.callback,
  });

  final void Function(Court) callback;

  @override
  State<CourtSelector> createState() => _CourtSelectorState();
}

class _CourtSelectorState extends State<CourtSelector> {
  Court? selectedClub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var court in Court.values)
          ChoiceChip(
            label: Text(court.name),
            onSelected: (_) {
              setState(() {
                selectedClub = court;
              });
              widget.callback(court);
            },
            selected: court == selectedClub,
          ),
      ],
    );
  }
}
