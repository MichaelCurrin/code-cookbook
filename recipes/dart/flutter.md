# Flutter

Basic template from CodePen.

Create your own app from https://codepen.io/pen/editor/flutter

- `main.dart`
    ```dart
    import 'package:flutter/material.dart';

    void main() {
      runApp(
        MaterialApp(
          home: MyWidget(),
        ),
      );
    }

    class MyWidget extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text(
              'Build some widgets!',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        );
      }
    }
    ```
