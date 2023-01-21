import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';

import '../helpers.dart';

class BookingScreen extends StatelessWidget {
  static Route route(spaceData) => MaterialPageRoute(
        builder: (context) => BookingScreen(
          spaceData: spaceData,
        ),
      );

  const BookingScreen({super.key, required this.spaceData});

  final SpaceData spaceData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            spaceData.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true,
        ),
        body: const SpaceDetailsBody());
  }
}

class SpaceDetailsBody extends StatelessWidget {
  const SpaceDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Helpers.randomPictureUrl()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Comodidades inclusas", style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 8,),
              const Text("50 cadeiras",),
              const Text("10 mesas"),
              const Text("Serviços de limpeza"),
              const Text("Buffet"),
              Divider()
            ],
          ),
        )
      ],
    );
  }
}
