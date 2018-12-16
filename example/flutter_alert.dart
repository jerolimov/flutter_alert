import 'package:flutter/material.dart';

import 'package:flutter_alert/flutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  int counter = 0;

  void _showDialog(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OK"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the asdsd this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
