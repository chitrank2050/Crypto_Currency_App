import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final AsyncSnapshot snapshot;

  ShowError(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
