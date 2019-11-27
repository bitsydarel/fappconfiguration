import 'package:flutter/material.dart';

/// Green about page for the example application.
class GreenAboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About the Me"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://media.makeameme.org/created/haha-got-you.jpg",
                ),
                radius: 72,
              ),
              const SizedBox(height: 16),
              Text(
                "HAHA, GOT YOU!",
                style: Theme.of(context).textTheme.headline,
              ),
              const SizedBox(height: 16),
              Text(
                "Thank you for trying out fappconfiguration",
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "You can contact me at bitsydarel@gmail.com",
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}