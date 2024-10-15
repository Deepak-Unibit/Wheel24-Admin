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
    this.iconSize = 20,
    this.showIcon = false,
    this.icon,
  });

  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final double iconSize;
  final bool showIcon;
  final IconData? icon;

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
          gradient: LinearGradient(
            colors: [
              context.theme.colorScheme.surfaceContainerLow,
              context.theme.colorScheme.surfaceContainerHigh,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon
                ? Icon(
                    icon,
                    size: iconSize,
                    color: context.theme.colorScheme.onSurface,
                  )
                : const SizedBox.shrink(),
            showIcon ? const SizedBox(width: 5) : const SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
