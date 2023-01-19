import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  static Route route() => MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );


  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(
          child: const Text('Settings'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),)
    );
  }
}