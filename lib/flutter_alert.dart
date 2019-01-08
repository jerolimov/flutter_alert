import 'dart:io' show Platform;
import 'dart:ui' show VoidCallback;
import 'package:meta/meta.dart' show required;
import 'package:flutter/widgets.dart' show BuildContext;

import 'package:flutter_alert/flutter_alert_cupertino.dart';
import 'package:flutter_alert/flutter_alert_material.dart';

/// An action configuration object. For each button in an alert dialog
/// one set of options and one callback handles should be defined.
class AlertAction {
  /// The title of the alert button.
  /// Required.
  final String text;

  /// Defines if the button is the default button.
  /// Set this value to true to render the button with a bold text weight.
  /// The default value is false.
  final bool isDefaultAction;

  /// Defines if the button is a destructive or dangerous button.
  /// Set this value to true to render this button with a red text color.
  /// The default value is false.
  final bool isDestructiveAction;

  /// Callback handler when this button was pressed.
  final VoidCallback onPressed;

  /// Defines if the button will automatically close the dialog by
  /// trigger a Navigation pop action or not.
  /// The default value is true.
  final bool automaticallyPopNavigation;

  const AlertAction({
    /// The title of the alert button.
    /// Required.
    @required this.text,

    /// Defines if the button is the default button.
    /// Set this value to true to render the button with a bold text weight.
    /// The default value is false.
    this.isDefaultAction = false,

    /// Defines if the button is a destructive or dangerous button.
    /// Set this value to true to render this button with a red text color.
    /// The default value is false.
    this.isDestructiveAction = false,

    /// Callback handler when this button was pressed.
    @required this.onPressed,

    /// Defines if the button will automatically close the dialog by
    /// trigger a Navigation pop action or not.
    /// The default value is true.
    this.automaticallyPopNavigation = true,
  });
}

/// Shows an alert dialog.
void showAlert({
  /// A build context. Required.
  @required BuildContext context,

  /// The title of the modal dialog.
  String title,

  /// The body (or content) of the modal dialog.
  /// The text was automatically rendered in a ScrollView.
  String body,

  /// A List of actions. For each action there was shown one button.
  /// If there was no action defined, a default action with a
  /// (localized) "OK" button was shown.
  List<AlertAction> actions,

  /// Allow you to define if the alert dialog is closable when
  /// the users taps beside the alert dialog.
  /// Default is only true when cancelable is set to true
  /// and the platform is not iOS.
  bool barrierDismissible,

  /// Automatically adds a (localized) "Cancel" button to the list
  /// of buttons. Currently its not possible to handle the cancel
  /// button.
  /// Only if this option was set to true. The default is false.
  bool cancelable = false,
}) {
  if (Platform.isIOS) {
    showCupertinoAlert(
      context: context,
      title: title,
      body: body,
      actions: actions,
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
    );
  } else {
    showMaterialAlert(
      context: context,
      title: title,
      body: body,
      actions: actions,
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
    );
  }
}
