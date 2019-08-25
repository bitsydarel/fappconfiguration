import "package:meta/meta.dart" show literal, immutable;
import "package:flutter/widgets.dart" show Widget;

/// Dynamic widget request.
///
/// Represent the request to dynamically provide a widget.
@immutable
class DynamicWidgetRequest {

  /// Construct a [DynamicWidgetRequest] with the [routeName].
  ///
  /// [arguments] are optional.
  @literal
  const DynamicWidgetRequest(this.routeName, {this.arguments});

  /// Unique route name to this widget.
  final String routeName;

  /// argument required for this widget the be provided.
  final dynamic arguments;
}

/// Provide a widget based on [DynamicWidgetRequest].
typedef DynamicWidgetProvider = Widget Function(DynamicWidgetRequest settings);
