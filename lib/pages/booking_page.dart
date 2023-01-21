import 'package:flutter/material.dart';

import '../helpers.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleData = [
      SpaceData(title: "Salão de festas", price: "R\$203"),
      SpaceData(title: "Churrasqueira bloco 2", price: "R\$100"),
      SpaceData(title: "Churrasqueira bloco 4", price: "R\$250"),
      SpaceData(title: "Sala de jogos", price: "R\$80")
    ];
    final spaceCards = <Widget> [
      SpaceCard(spaceData: sampleData[0],),
      SpaceCard(spaceData: sampleData[1],),
      SpaceCard(spaceData: sampleData[2],),
      SpaceCard(spaceData: sampleData[3],),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: ListView(children: spaceCards,),
    );
  }
}


class SpaceCard extends StatelessWidget {
  const SpaceCard({super.key, required this.spaceData});

  final SpaceData spaceData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(BookingScreen.route(spaceData));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(Helpers.randomPictureUrl()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(spaceData.title),
              trailing: Text("${spaceData.price} / dia"),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            )
          ],
        ),
      ),
    );
  }
}
