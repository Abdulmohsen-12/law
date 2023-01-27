 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract class Utility{
  static show_Dialog(
      BuildContext context, String errorTitle, String errorContent) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: errorTitle.length > 0
                ? Text(errorTitle)
                : Container(
              height: 0,
            ),
            content: Text(errorContent),
            actions: [
              new TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }
  static textform(
      BuildContext context, String errorTitle, String errorContent) async {
    return TextField(


    );
  }
  static showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(
            onWillPop: () {
              return Future<bool>.value(false);
            },
            child: alert);
      },
    );
  }



}
