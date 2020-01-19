import 'package:example/src/configuration/user_manager.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

/// Login page.
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _enableLogin = ValueNotifier<bool>(false);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const FlutterLogo(size: 104),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _UsernameAndPasswordForm(
                _loginFormKey,
                _usernameController,
                _passwordController,
                _enableLogin,
              ),
            ),
            Consumer<UserManager>(
              builder: (consumerContext, userManager, _) {
                return ValueListenableBuilder<bool>(
                  valueListenable: _enableLogin,
                  builder: (listenableContext, shouldBeEnabled, __) {
                    final onClick = shouldBeEnabled
                        ? () => _login(listenableContext, userManager)
                        : null;

                    return RaisedButton(
                      onPressed: onClick,
                      child: const Text("Login"),
                    );
                  },
                );
              },
            ),
            const Spacer(),
            OutlineButton(
                onPressed: () => showDialog<void>(
                      context: context,
                      builder: (dialogContext) => SimpleDialog(
                        title: const Text("Supported credentials"),
                        titlePadding: const EdgeInsets.all(8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        children: <Widget>[
                          Text(
                            "* Username: anonymous, password: anonymous\n"
                            "* Username: premium, password: premium\n"
                            "* Username: admin, password: admin\n",
                            textAlign: TextAlign.start,
                            style: Theme.of(dialogContext).textTheme.subtitle,
                          ),
                        ],
                      ),
                    ),
                child: const Text("Hint")),
          ],
        ),
      ),
    );
  }

  void _login(final BuildContext context, final UserManager userManager) {
    if (_loginFormKey.currentState.validate()) {
      final configuration = userManager.authenticate(
        _usernameController.text,
        _passwordController.text,
      );

      print("Configuration: $configuration");

      if (configuration != null) {
        FAppConfigurationApplication.update(context, configuration);
      } else {
        Scaffold.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid credentials")),
        );
      }
    }
  }
}

class _UsernameAndPasswordForm extends StatelessWidget {
  const _UsernameAndPasswordForm(
    this._formStateKey,
    this._usernameController,
    this._passwordController,
    this._enableLogin,
  );

  final GlobalKey<FormState> _formStateKey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final ValueNotifier<bool> _enableLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formStateKey,
      autovalidate: true,
      onChanged: () =>
          _enableLogin.value = _formStateKey.currentState.validate(),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLength: 9,
            decoration: const InputDecoration(
              labelText: "Username",
              hintText: "Enter the username",
              filled: true,
              border: OutlineInputBorder(),
            ),
            validator: (newValue) {
              if (newValue.isEmpty) {
                return "Username can't be empty";
              }
              if (newValue.length < 5) {
                return "Username lenght can't be less than 5";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter the password",
              filled: true,
              border: OutlineInputBorder(),
            ),
            validator: (newValue) {
              if (newValue.isEmpty) {
                return "Password can't be empty";
              }
              if (newValue.length < 5) {
                return "Password lenght can't be less than 5";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
