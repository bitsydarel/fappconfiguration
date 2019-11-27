import 'package:flutter/material.dart';

/// Green white label dynamic widget example.
class GreenDynamicWidget extends StatelessWidget {
  /// Create a [GreenDynamicWidget].
  const GreenDynamicWidget(this._callback);

  final void Function() _callback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).accentColor,
      onPressed: _callback,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(Icons.add_circle_outline),
    );
  }
}
