import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                MaterialButton(
                  child: Text('Ok'),
                  elevation: 5,
                  onPressed: () => Navigator.pop(context),
                  textColor: Colors.blue,
                )
              ],
            ));
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                CupertinoDialogAction(
                  child: Text('Ok'),
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }
}
