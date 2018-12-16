import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_alert/flutter_alert.dart';

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyTestButton(),
      ),
    );
  }
}

class MyTestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("Show Dialog"),
      onPressed: () => _showDialog(context),
    );
  }

  void _showDialog(BuildContext context) {
    showAlert(
      context: context,
      title: "Alert title",
      body: "Alert body",
      actions: [
        AlertAction(
          text: "Delete",
          isDestructiveAction: true,
          onPressed: () {},
        ),
      ],
      cancelable: true,
    );
  }
}

void main() {
  testWidgets('test widget', (WidgetTester tester) async {
    await tester.pumpWidget(MyTestApp());

    expect(find.text("Show Dialog"), findsOneWidget);
    expect(find.text("Alert title"), findsNothing);
    expect(find.text("Alert body"), findsNothing);

    await tester.tap(find.text("Show Dialog"));
    await tester.pump();

    expect(find.text("Show Dialog"), findsOneWidget);
    expect(find.text("Alert title"), findsOneWidget);
    expect(find.text("Alert body"), findsOneWidget);

    // Material variant
    expect(find.text("DELETE"), findsOneWidget);
    expect(find.text("CANCEL"), findsOneWidget);
  });
}
