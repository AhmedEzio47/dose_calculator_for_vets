import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future show(
      {required BuildContext context,
      required Widget child,
      bool barrierDismissible = true}) async {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (_) => child,
        barrierDismissible: barrierDismissible,
      );
    } else {
      return showDialog(
        context: context,
        builder: (_) => child,
        barrierDismissible: barrierDismissible,
      );
    }
  }
}
