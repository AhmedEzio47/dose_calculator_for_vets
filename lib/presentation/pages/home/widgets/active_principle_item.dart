import 'package:flutter/material.dart';

class ActivePrincipleItem extends StatelessWidget {
  const ActivePrincipleItem({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).cardColor,
      child: Text(text),
    );
  }
}
