import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {

  static Route route() => MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );


  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(
          child: const Text('Profile'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),)
    );
  }
}