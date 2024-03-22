import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 18,
      ),
    );
  }
}
