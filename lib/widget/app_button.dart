import 'package:flutter/material.dart';

enum AppButtonType {
  normal,
  outline,
}

class AppButton {
  AppButton(
    this.appButtonType,
    this.content,
    this.context,
    this.onPressed,
  );

  String content;
  AppButtonType appButtonType;
  BuildContext context;
  VoidCallback? onPressed;

  switchButton() {
    switch (appButtonType) {
      case AppButtonType.normal:
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14),
                ),
              ],
            ),
          ),
        );
      case AppButtonType.outline:
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style:  TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,fontSize: 14),
                ),
              ],
            ),
          ),
        );
      default:
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                ),
              ],
            ),
          ),
        );
    }
  }
}
