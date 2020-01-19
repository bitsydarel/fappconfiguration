import 'package:flutter/material.dart';

/// The about page of the example application
class AboutPage extends StatelessWidget {
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
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/17922775?s=460&v=4",
                ),
                radius: 72,
              ),
              const SizedBox(height: 16),
              Text(
                "Hi, i'm Darel Bitsy",
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(height: 16),
              Text(
                "You can contact me at bitsydarel@gmail.com",
                style: Theme.of(context).textTheme.subtitle,
              ),
              const SizedBox(height: 16),
              Text(
                "Thank you for trying out fappconfiguration",
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
