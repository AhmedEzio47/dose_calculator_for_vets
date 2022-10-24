import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';

class EditField extends StatefulWidget {
  const EditField({
    Key? key,
    required this.hint,
    this.label,
    this.suffix,
    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.obscured = false,
    this.border = true,
    this.lines = 1,
    this.controller,
    this.borderRadius = 8,
    this.onSubmit,
    this.maxLength,
    this.inputAction,
    this.focusNode,
  }) : super(key: key);

  final String hint;
  final String? label;
  final Widget? suffix;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool obscured;
  final bool border;
  final int lines;
  final int? maxLength;
  final TextEditingController? controller;
  final double borderRadius;
  final Function(String)? onSubmit;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  bool _focused = false;
  late bool _obscured;
  @override
  void initState() {
    super.initState();
    _obscured = widget.obscured;
    border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(widget.borderRadius));
    focusedBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(widget.borderRadius));
  }

  late InputBorder border;
  late InputBorder focusedBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: TextStyles.bold,
              )
            : Container(),
        SizedBox(
          height: widget.label != null ? 4 : 0,
        ),
        FocusScope(
          child: Focus(
            onFocusChange: (focused) => setState(() {
              _focused = focused;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: TextField(
                focusNode: widget.focusNode,
                textInputAction: widget.inputAction,
                style: TextStyles.regular
                    .copyWith(fontSize: 18, color: AppColors.darkText),
                controller: widget.controller,
                minLines: widget.lines,
                maxLines: widget.lines,
                maxLength: widget.maxLength,
                textAlign: _focused ? widget.textAlign : TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: widget.inputType,
                obscureText: _obscured,
                onSubmitted: widget.onSubmit != null
                    ? (query) => widget.onSubmit!(query)
                    : null,
                decoration: InputDecoration(
                  hintText: _focused ? '' : widget.hint,
                  counterText: "",
                  hintStyle: TextStyles.regular.copyWith(color: Colors.grey),
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.all(8),
                  border: border,
                  enabledBorder: widget.border ? null : InputBorder.none,
                  focusedBorder: focusedBorder,
                  suffixIcon: widget.obscured && widget.suffix == null
                      ? InkWell(
                          onTap: () => setState(() {
                                _obscured = !_obscured;
                              }),
                          child: const Center(
                            widthFactor: .1,
                            child: Icon(Icons.remove_red_eye),
                          ))
                      : Center(
                          widthFactor: .1,
                          child: widget.suffix,
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
