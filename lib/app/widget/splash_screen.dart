import 'package:flutter/material.dart';
import 'package:graphql_example/generated/assets.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.assetsIconsSvgLogo,
        width: 100,
        height: 100,
      ),
    );
  }
}
