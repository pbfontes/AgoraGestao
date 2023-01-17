import 'package:flutter/material.dart';

import '../screens/screens.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:ElevatedButton(child: const Text("Nova reserva"), onPressed: () {
      Navigator.of(context).push(BookingScreen.route());
      }
    ,));
  }
}