import 'package:example/src/configuration/default_application_configuration.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DefaultMaterialApplication(
      DefaultApplicationConfiguration(),
    ),
  );
}
