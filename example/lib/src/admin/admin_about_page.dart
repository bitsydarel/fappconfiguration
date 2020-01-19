import 'package:example/src/configuration/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Green about page for the example application.
class AdminAboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://media.makeameme.org/created/haha-got-you.jpg",
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 16),
          Text(
            "Think of this list as the private posts of all the users",
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center,
          ),
          Consumer<List<UserPost>>(
            builder: (consumerContext, posts, _) {
              if (posts != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (listContext, index) {
                      final post = posts[index];
                      return ListTile(
                        leading: Text("#${post.id}"),
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
