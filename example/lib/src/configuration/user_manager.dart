import 'package:example/src/configuration/admin_application_configuration.dart';
import 'package:example/src/configuration/anonymous_application_configuration.dart';
import 'package:example/src/configuration/premium_application_configuration.dart';
import 'package:fappconfiguration/fappconfiguration.dart';

/// User manager.
class UserManager {
  final Map<User, ApplicationConfiguration> _credentials = {
    const User("anonymous", "anonymous"): AnonymousApplicationConfiguration(),
    const User("premium", "premium"): PremiumApplicationConfiguration(),
    const User("admin", "admin"): AdminApplicationConfiguration()
  };

  /// authenticate the user with provided [username] and [password].
  ApplicationConfiguration authenticate(
    final String username,
    final String password,
  ) {
    for (final user in _credentials.keys) {
      if (user.username == username && user.password == password) {
        return _credentials[user];
      }
    }
    return null;
  }
}

/// User representation.
class User {
  /// Create an User with the [username] and [password].
  const User(this.username, this.password);

  /// User's username.
  final String username;

  /// User's password.
  final String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password;

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() => 'User{username: $username, password: $password}';
}

/// User's post representation
class UserPost {
  /// Create post with [userId], [id], [title], [body].
  const UserPost(this.userId, this.id, this.title, this.body);

  /// user's id.
  final int userId;

  /// post's id.
  final int id;

  /// post's title.
  final String title;

  /// post's body.
  final String body;
}
