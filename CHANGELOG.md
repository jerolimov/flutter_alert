## [0.4.0]

-   Breaking change: Remove attribute `useCupertino` in showAlert method.
    It no uses now just `Platform.isIOS` to decide if it renders a Cupertino
    or Material UI alert dialog.
    But this library provides now two new separate methods to force a
    platform specific alert dialog:

    -   `showCupertinoAlert`
    -   `showMaterialAlert` 

## [0.3.0]

- Structure changes to fix unit tests / CI.

## [0.2.0]

- Add documentation for all public fields.
- Fix an issue that barrierDismissable should be never null.
- Use showCupertinoDialog to improve the UI (background/shadow) of the alert dialog on iOS.

## [0.1.0]

- Initial release

