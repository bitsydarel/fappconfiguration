import "package:meta/meta.dart" show literal, immutable;
import "package:flutter/widgets.dart" show Widget;

/// Dynamic widget request.
///
/// Represent the request to dynamically provide a widget.
@immutable
class DynamicWidgetRequest {

  /// Construct a [DynamicWidgetRequest] with the [identifier].
  ///
  /// [arguments] are optional.
  @literal
  const DynamicWidgetRequest(this.identifier, {this.arguments});

  /// Unique widget identifier to this widget.
  final String identifier;

  /// argument required for this widget the be provided.
  final dynamic arguments;
}

/// Provide a widget based on [DynamicWidgetRequest].
typedef DynamicWidgetProvider = Widget Function(DynamicWidgetRequest settings);
