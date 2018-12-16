# flutter_alert

Flutter package which shows a crossplatform alert messages on Android (Material) and iOS (Cupertino).

## Getting Started

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  alert: ^0.0.1
```

You can install packages from the command line:

```
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

## Example

In your Dart code, add this import:

```darf
import 'package:alert/alert.dart';
```

And later show an alert when neccessary:

```dart
  void _showMessageDialog() {
    showAlert(
      context: context,
      title: "Awesome feature enabled.",
    );
  }

  void _showQuestionDialog() {
    showAlert(
      context: context,
      title: "Delete file?",
      body: "Should we delete the file XYZ?",
      actions: [
        AlertAction(
          text: "Delete",
          isDestructiveAction: true,
          onPressed: () {
            // TODO
          },
        ),
      ],
      cancelable: true,
    );
  }
```
