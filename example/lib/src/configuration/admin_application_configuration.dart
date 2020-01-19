import 'dart:convert';

import 'package:example/src/admin/admin_about_page.dart';
import 'package:example/src/admin/admin_dynamic_widget.dart';
import 'package:example/src/configuration/authenticated_user_application_configuration.dart';
import 'package:example/src/configuration/user_manager.dart';
import 'package:example/src/ids.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

/// Admin application configuration.
class AdminApplicationConfiguration
    extends AuthenticatedUserApplicationConfiguration {
  @override
  String id() => "${super.id()}.green";

  @override
  String name() => "Admin";

  @override
  ThemeData theme() {
    final colorScheme = const ColorScheme.light(
      primary: Colors.white,
      primaryVariant: Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: Color(0xff00e676),
      secondaryVariant: Color(0xff00b248),
      onSecondary: Color(0x94000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  ThemeData darkTheme() {
    final colorScheme = const ColorScheme.dark(
      primary: Colors.black,
      primaryVariant: Colors.black,
      onPrimary: Color(0x75ffffff),
      secondary: Color(0xff00e676),
      secondaryVariant: Color(0xff00b248),
      onSecondary: Color(0x94000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  Route<dynamic> routeFactory(RouteSettings settings) {
    switch (settings.name) {
      case "/about":
        return MaterialPageRoute<AdminAboutPage>(
          settings: settings,
          builder: (context) => AdminAboutPage(),
        );
      default:
        return super.routeFactory(settings);
    }
  }

  @override
  Widget widgetProvider(DynamicWidgetRequest request) {
    if (request.identifier == incrementerFeature) {
      return AdminIncrementer(
        request.arguments as void Function(),
      );
    } else {
      return super.widgetProvider(request);
    }
  }

  @override
  List<SingleChildWidget> dependencies() {
    return [
      FutureProvider<List<UserPost>>(
        create: (context) {
          return http
              .get("https://jsonplaceholder.typicode.com/posts")
              .then((response) => response.body)
              .then((jsonBody) => json.decode(jsonBody) as List<dynamic>)
              .then(
                (rawPosts) => rawPosts.map(
                  (dynamic rawPost) => rawPost as Map<String, dynamic>,
                ),
              )
              .then(
                (posts) => posts
                    .map(
                      (post) => UserPost(
                        post["userId"] as int,
                        post["id"] as int,
                        post["title"] as String,
                        post["body"] as String,
                      ),
                    )
                    .toList(),
              );
        },
      ),
      ...?super.dependencies(),
    ];
  }
}
