import 'package:flutter/material.dart';

class RouletteDialog extends StatelessWidget {
  const RouletteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ルーレット結果の詳細'),
      content: Text('ルーレット結果の詳細'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
