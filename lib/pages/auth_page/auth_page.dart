import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_example/generated/assets.dart';
import 'package:graphql_example/generated/l10n.dart';
import 'package:graphql_example/global/fonts.dart';
import 'package:graphql_example/main.dart';
import 'package:graphql_example/pages/auth_page/bloc/auth_bloc.dart';
import 'package:graphql_example/pages/home_page/home_page.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = AuthBloc();
  late final StreamSubscription<AuthState> stateSubscription;

  @override
  void initState() {
    super.initState();
    stateSubscription = bloc.stream.listen(onStateChanged);
  }

  Future<void> onStateChanged(AuthState state) async {
    if (state is AuthResult) {
      logger.d('Auth: ${state.isAuthSuccessful}');
      if (state.isAuthSuccessful) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(S.of(context).failedToSignIn),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.assetsIconsSvgLogo,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(S.of(context).githubDocsReader, style: Fonts.regular15Black),
              const SizedBox(height: 150),
              SignInButton(
                Buttons.gitHub,
                onPressed: _onSignInPressed,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    stateSubscription.cancel();
    bloc.close();
  }

  void _onSignInPressed() => bloc.add(const AuthUser());
}
