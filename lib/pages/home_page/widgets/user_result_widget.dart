import 'package:flutter/material.dart';

class UserResultWidget extends StatefulWidget {
  const UserResultWidget({super.key});

  @override
  State<UserResultWidget> createState() => _UserResultWidgetState();
}

class _UserResultWidgetState extends State<UserResultWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Personal repos'));
  }
}