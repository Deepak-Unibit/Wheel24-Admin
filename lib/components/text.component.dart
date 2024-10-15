import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    required this.text,
    this.isHeading = false,
    this.width = 160,
  });

  final String text;
  final bool isHeading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isHeading ? context.theme.colorScheme.secondaryFixed : context.theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}