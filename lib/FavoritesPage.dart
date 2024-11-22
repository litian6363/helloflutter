import 'package:flutter/material.dart';
import 'package:helloflutter/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    final theme = Theme.of(context);

    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return ListView(
      children: [
        for (var t in favorites)
          Row(
            children: [
              Card(
                color: theme.colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    t.asSnakeCase,
                    style: style,
                    semanticsLabel: "${t.first} ${t.second}",
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.delete(t);
                },
                label: Icon(Icons.delete),
              ),
            ],
          ),
      ],
    );
  }
}
