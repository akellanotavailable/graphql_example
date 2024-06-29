import 'package:flutter/material.dart';
import 'package:graphql_example/generated/assets.dart';
import 'package:graphql_example/generated/l10n.dart';
import 'package:graphql_example/global/fonts.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsIconsSvgLogo,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(S.of(context).githubDocsReader, style: Fonts.regular15Black),
          ],
        ),
      ),
    );
  }
}
