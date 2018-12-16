// Copyright 2018 Christoph Jerolimov
//
// Use of this source code is governed by the MIT License
// that can be found in the LICENSE file.
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertAction {
  final String text;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final VoidCallback onPressed;
  final automaticallyPopNavigation;

  const AlertAction({
    @required this.text,
    bool this.isDefaultAction = false,
    bool this.isDestructiveAction = false,
    @required this.onPressed,
    bool this.automaticallyPopNavigation = true,
  });
}

void showAlert({
  @required BuildContext context,
  String title,
  String body,
  List<AlertAction> actions,
  bool barrierDismissible = false,
  bool useCupertino,
}) {
  if (actions == null || actions.isEmpty) {
    actions = [AlertAction(text: "OK", onPressed: () {})];
  }

  if (useCupertino == null) {
    useCupertino = Platform.isIOS;
  }

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) =>
        _buildDialog(context, title, body, actions, useCupertino),
  );
}

Widget _buildDialog(
  BuildContext context,
  String title,
  String body,
  List<AlertAction> actions,
  bool useCupertino,
) {
  if (useCupertino) {
    return CupertinoAlertDialog(
      title: _buildTitle(title),
      content: _buildBody(body),
      actions: _buildActionButtons(context, actions, useCupertino),
    );
  } else {
    return AlertDialog(
      title: _buildTitle(title),
      content: _buildBody(body),
      actions: _buildActionButtons(context, actions, useCupertino),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
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

List<Widget> _buildActionButtons(
  BuildContext context,
  List<AlertAction> actions,
  bool useCupertino,
) {
  return actions
      .map((AlertAction action) =>
          _buildActionButton(context, action, useCupertino))
      .toList();
}

Widget _buildActionButton(
    BuildContext context, AlertAction action, bool useCupertino) {
  VoidCallback onPressed = () {
    if (action.automaticallyPopNavigation) {
      NavigatorState navigatorState = Navigator.of(context);
      if (navigatorState.canPop()) {
        navigatorState.pop();
      }
    }
    if (action.onPressed != null) {
      action.onPressed();
    }
  };

  if (useCupertino) {
    return CupertinoDialogAction(
      child: Text(
        action.text != null ? action.text : "",
        style: action.isDefaultAction
            ? TextStyle(fontWeight: FontWeight.bold)
            : null,
      ),
      isDefaultAction: action.isDefaultAction,
      isDestructiveAction: action.isDestructiveAction,
      onPressed: onPressed,
    );
  } else {
    return FlatButton(
      child: Text(
        action.text != null ? action.text.toUpperCase() : "",
        style: action.isDefaultAction
            ? TextStyle(fontWeight: FontWeight.bold)
            : null,
      ),
      textColor: action.isDestructiveAction ? Colors.red.shade600 : null,
      highlightColor: action.isDestructiveAction ? Colors.red.shade50 : null,
      onPressed: onPressed,
    );
  }
}
