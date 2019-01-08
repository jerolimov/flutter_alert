# flutter_alert

[![Build Status](https://travis-ci.org/jerolimov/flutter_alert.svg?branch=master)](https://travis-ci.org/jerolimov/flutter_alert)

Flutter package which shows a crossplatform alert messages on Android (Material) and iOS (Cupertino).

## Getting Started

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  flutter_alert: ^0.4.0
```

You can install packages from the command line:

```
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

## Example

In your Dart code, add this import:

```darf
import 'package:flutter_alert/flutter_alert.dart';
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

## Contributors

Thanks goes to these people ([emoji key][emojis]):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| <img src="https://avatars.githubusercontent.com/u/139310?s=100&v=4" width="100px;"/><br /><sub><b>Christoph Jerolimov</b></sub><br />[💻](https://github.com/jerolimov/flutter_alert/commits?author=jerolimov "Code") [📖](https://github.com/jerolimov/flutter_alert/commits?author=jerolimov "Documentation") [⚠️](https://github.com/jerolimov/flutter_alert/commits?author=jerolimov "Tests") | [<img src="https://avatars1.githubusercontent.com/u/7152774?s=100&v=4" width="100px;"/><br /><sub><b>Christian Stahl</b></sub>](https://github.com/thinkmobilede)<br />[💻](https://github.com/jerolimov/flutter_alert/commits?author=thinkmobilede "Code") [🤔](#ideas-thinkmobilede "Ideas, Planning, & Feedback") | [<img src="https://avatars1.githubusercontent.com/u/1096485?s=100&v=4" width="100px;"/><br /><sub><b>Pascal Welsch</b></sub>](https://github.com/passsy)<br />[🤔](#ideas-passsy "Ideas, Planning, & Feedback") |
| :---: | :---: | :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors][all-contributors] specification.
Contributions of any kind welcome!

[emojis]: https://github.com/kentcdodds/all-contributors#emoji-key
[all-contributors]: https://github.com/kentcdodds/all-contributors
