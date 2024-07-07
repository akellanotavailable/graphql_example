import 'package:flutter/material.dart';
import 'package:graphql_example/app/bloc/app_bloc.dart';
import 'package:graphql_example/app/widget/splash_screen.dart';
import 'package:graphql_example/pages/auth_page/auth_page.dart';
import 'package:graphql_example/pages/home_page/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final bloc = AppBloc();

  @override
  void initState() {
    super.initState();
    bloc.stream.listen(onStateChanged);
    bloc.add(const CheckAuth());
  }

  Future<void> onStateChanged(AppState state) async {
    if (state is AuthChecked) {
      if (state.isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const LoginPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
