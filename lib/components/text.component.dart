import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    required this.text,
    required this.isColor,
    this.width = 160,
  });

  final String text;
  final bool isColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      color: false
          ? context.theme.colorScheme.onSurface.withOpacity(0.25)
          : Colors.transparent,
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: context.theme.colorScheme.onSurface,
          height: 1,
        ),
      ),
    );
  }
}