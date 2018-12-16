# flutter_alert

A Flutter package to simplify alert messages on Android (Material) and iOS (Cupertino).

## Getting Started

Example:

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
