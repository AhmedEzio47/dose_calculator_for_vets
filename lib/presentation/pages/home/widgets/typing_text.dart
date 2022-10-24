import 'package:dose_calculator_for_vets/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  const TypingText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);
  final String text;
  final Color? textColor;
  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyles.medium.copyWith(fontSize: 22, color: widget.textColor),
    );
  }

  @override
  void initState() {
    super.initState();
    typeText();
  }

  Future typeText() async {
    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(
        const Duration(milliseconds: 100),
        () => setState(() {
          _text += widget.text[i];
        }),
      );
    }
  }
}
