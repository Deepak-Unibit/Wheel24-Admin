import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent({
    super.key,
    required this.onClick,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.fontSize = 18,
    this.showBorder = false,
  });

  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      minWidth: 0,
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              color: showBorder
                  ? context.theme.colorScheme.surfaceContainerLow
                  : Colors.transparent),
          gradient: LinearGradient(
            colors: showBorder
                ? [
                    Colors.transparent,
                    Colors.transparent,
                  ]
                : [
                    context.theme.colorScheme.surfaceContainerLow,
                    context.theme.colorScheme.surfaceContainerHigh,
                  ],
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
