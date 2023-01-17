import 'package:flutter/material.dart';



class BookingScreen extends StatelessWidget {

  static Route route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );


  const BookingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Detalhes da reserva", style: Theme.of(context).textTheme.titleLarge,),
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
      ),
      body: const Center(child: Text("Realizar reserva"))
    );
  }
}