import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isBorder = false,
    this.isIcon = false,
    this.icon,
    this.borderRadius = 100,
    required this.textInputType,
    required this.maxLength,
    this.maxLines = 1,
    this.height = 50,
    this.contentPadding = 15,
    this.borderColor,
    this.textInputAction,
    required this.onSubmitted,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool isBorder;
  final bool isIcon;
  final IconData? icon;
  final double borderRadius;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLines;
  final double height;
  final double contentPadding;
  final Color? borderColor;
  final TextInputAction? textInputAction;
  final Function onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      onSubmitted: (value) {
        onSubmitted();
      },
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: context.theme.colorScheme.surface,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: context.theme.colorScheme.onSurface,
        counterText: "",
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: context.theme.colorScheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            color: isBorder
                ? borderColor ?? context.theme.colorScheme.surfaceBright
                : Colors.transparent,
            width: isBorder ? 1 : 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
