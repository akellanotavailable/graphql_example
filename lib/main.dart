import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_example/app/app.dart';
import 'package:graphql_example/generated/l10n.dart';
import 'package:graphql_example/global/theme.dart';
import 'package:graphql_example/services/isar_service.dart';
import 'package:logger/logger.dart';

final logger = Logger(printer: SimplePrinter());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await IsarService().initDB();
  runApp(const GitHubDocsApp());
}

class GitHubDocsApp extends StatelessWidget {
  const GitHubDocsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Docs',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const App(),
    );
  }
}
