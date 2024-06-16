import 'package:flutter/material.dart';
import 'package:graphql_example/generated/l10n.dart';
import 'package:graphql_example/global/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).welcomeToGraphqlExample,
              style: Fonts.regular15Black,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Regular button',
                style: Fonts.bold15White,
              ),
            )
          ],
        ),
      ),
    );
  }
}
