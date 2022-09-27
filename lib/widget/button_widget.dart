import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget( {
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(8),

        ),
        onPressed: onClicked,
        child: buildContent(),
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      );
}
