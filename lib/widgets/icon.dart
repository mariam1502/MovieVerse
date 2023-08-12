import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  AddIcon({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon), Text(text)]);
  }
}
