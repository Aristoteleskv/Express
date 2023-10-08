import 'package:flutter/material.dart';

class PinSphere extends StatelessWidget {
  final bool input;

  const PinSphere({Key? key, required this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.8),
      child: Container(
        width: 19,
        height: 19,
        decoration: BoxDecoration(
          color: input
              ? Color.fromARGB(255, 20, 20, 20)
              : Color.fromARGB(255, 175, 175, 175),
          border:
              Border.all(color: Color.fromARGB(255, 175, 175, 175), width: 1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
