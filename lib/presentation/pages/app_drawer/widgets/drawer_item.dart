import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: TextStyles.medium.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
