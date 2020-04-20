import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String errorMessage;

  ShowError(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: $errorMessage',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
