import 'package:flutter/material.dart';

/// Green white label dynamic widget example.
class AdminIncrementer extends StatelessWidget {
  /// Create a [AdminIncrementer].
  const AdminIncrementer(this._callback);

  final void Function() _callback;

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      icon: const Icon(Icons.add_circle_outline),
      onPressed: _callback,
      label: const Text("Increment"),
    );
  }
}
