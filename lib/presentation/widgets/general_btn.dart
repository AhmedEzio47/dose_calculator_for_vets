import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';

class GeneralBtn extends StatelessWidget {
  const GeneralBtn({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 55,
    this.width = double.infinity,
    this.fontSize = 22,
  }) : super(key: key);
  final Function onPressed;
  final double height;
  final double width;
  final double fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
            primary: AppColors.primaryColor, minimumSize: Size(width, height)),
        child: Text(
          text,
          style: TextStyles.medium
              .copyWith(fontSize: fontSize, color: AppColors.lightText),
        ));
  }
}
