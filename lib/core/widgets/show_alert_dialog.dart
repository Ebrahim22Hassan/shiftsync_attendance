import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog(
    BuildContext context, {
      required String title,
      TextStyle? titleStyle,
      required String content,
      String? cancelActionText,
      required String defaultActionText,
      required Function()? onPressedOk,
    }) async {
  if (!Platform.isIOS) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title, style: titleStyle),
            content: Text(content),
            actions: <Widget>[
              if (cancelActionText != null)
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    cancelActionText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextButton(
                onPressed: onPressedOk,
                child: Text(
                  defaultActionText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title, style: titleStyle),
            content: Text(content),
            actions: <Widget>[
              if (cancelActionText != null)
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    cancelActionText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              CupertinoDialogAction(
                onPressed: onPressedOk,
                child: Text(
                  defaultActionText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }
}


Future<dynamic> showCustomAlertDialog(
    BuildContext context, {
      required String title,
      TextStyle? titleStyle,
      required Widget content,
      String? cancelActionText,
      required String defaultActionText,
      required Function()? onPressedOk,
    }) async {
  if (!Platform.isIOS) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title, style: titleStyle),
            content: content,
            actions: <Widget>[
              if (cancelActionText != null)
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    cancelActionText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextButton(
                onPressed: onPressedOk,
                child: Text(
                  defaultActionText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title, style: titleStyle),
            content: content,
            actions: <Widget>[
              if (cancelActionText != null)
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    cancelActionText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              CupertinoDialogAction(
                onPressed: onPressedOk,
                child: Text(
                  defaultActionText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }
}