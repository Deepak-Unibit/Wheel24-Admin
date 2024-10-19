import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../primaryButton.component.dart';

class ConfirmationDialogComponent {
  static show({required Function onClick}) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: Colors.black.withOpacity(0.25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: context.theme.colorScheme.onSurface.withOpacity(0.25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: MaterialButton(
                    onPressed: () => Get.back(),
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                Text(
                  "Are you sure want to change setting?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButtonComponent(onClick: ()=>Get.back(), text: "Cancel", height: 40, width: 80, fontSize: 16, showBorder: true,),
                    PrimaryButtonComponent(onClick: ()=>onClick(), text: "Confirm", height: 40, width: 80, fontSize: 16,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}