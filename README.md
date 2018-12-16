# flutter_alert

A Flutter package to simplify alert messages on Android (Material) and iOS (Cupertino).

## Getting Started

Example:

```dart
  void _showDialog() {
    showAlert(
      context: context,
      title: "Delete file?",
      body: "Should we delete the file XYZ?",
      actions: [
        new AlertAction(
          text: "Delete",
          isDestructiveAction: true,
          onPressed: () {
            // TODO
          },
        ),
        new AlertAction(
          text: "Cancel",
          onPressed: () {
            // TODO
          },
        ),
      ],
    );
  }
```
