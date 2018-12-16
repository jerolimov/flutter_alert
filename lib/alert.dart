// Copyright 2018 Christoph Jerolimov
//
// Use of this source code is governed by the MIT License
// that can be found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertAction {
  final String text;
  final bool enabled;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final VoidCallback onPressed;
  final automaticallyPopNavigation;

  const AlertAction({
    @required this.text,
    bool this.enabled = true,
    bool this.isDefaultAction = false,
    bool this.isDestructiveAction = false,
    @required this.onPressed,
    bool this.automaticallyPopNavigation = true,
  });
}

Widget _buildTitle(String title) {
  if (title == null || title.isEmpty) {
    return null;
  }
  return Text(title);
}

Widget _buildBody(String body) {
  if (body == null || body.isEmpty) {
    return null;
  }
  return SingleChildScrollView(child: Text(body));
}

List<Widget> _buildActions(BuildContext context, bool isIOS, List<AlertAction> actions) {
  return actions.map((AlertAction action) {
    VoidCallback onPressed = action.enabled && action.onPressed != null ? () {
      action.onPressed();
      if (action.automaticallyPopNavigation) {
        NavigatorState navigatorState = Navigator.of(context);
        if (navigatorState.canPop()) {
          navigatorState.pop();
        }
      }
    } : null;

    if (isIOS) {
      return CupertinoDialogAction(
        child: Text(
          action.text != null ? action.text : "",
          style: action.isDefaultAction ? TextStyle(fontWeight: FontWeight.bold) : null,
        ),
        isDefaultAction: action.isDefaultAction,
        isDestructiveAction: action.isDestructiveAction,
        onPressed: onPressed,
      );
    } else {
      return FlatButton(
        child: Text(
          action.text != null ? action.text.toUpperCase() : "",
          style: action.isDefaultAction ? TextStyle(fontWeight: FontWeight.bold) : null,
        ),
        textColor: action.isDestructiveAction ? Colors.red.shade600 : null,
        highlightColor: action.isDestructiveAction ? Colors.red.shade50 : null,
        onPressed: onPressed,
      );
    }
  }).toList();
}

showAlert({
  @required BuildContext context,
  String title,
  String body,
  List<AlertAction> actions,
  bool barrierDismissible = false,
}) {
  const isIOS = true; // Platform.isIOS

  if (actions == null || actions.isEmpty) {
    actions = [
      AlertAction(
          text: "OK",
          onPressed: () {}
      )
    ];
  }

  Widget dialogWidget = isIOS ? CupertinoAlertDialog(
    title: _buildTitle(title),
    content: _buildBody(body),
    actions: _buildActions(context, true, actions),
  ) : AlertDialog(
    title: _buildTitle(title),
    content: _buildBody(body),
    actions: _buildActions(context, false, actions),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) => dialogWidget,
  );
}
