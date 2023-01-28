import 'package:flutter/material.dart';

import '../helpers.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  final String festa =
      "https://www.casadevalentina.com.br/wp-content/uploads/2019/11/Sal%C3%A3oDeFestas_CasaDeValentina-6.jpg.optimal.jpg";
  final String churras1 =
      "https://blog.thony.com.br/wp-content/uploads/2020/09/churrasqueira-de-alvenaria.jpg";
  final String churras2 =
      "https://comprarchurrasqueira.com/wp-content/uploads/2020/03/Churrasqueira-no-quintal.jpg";
  final String jogos =
      "https://pointer.com.br/blog/wp-content/uploads/2018/02/156686-x-itens-que-nao-podem-faltar-ao-montar-uma-sala-de-jogos.jpg";

  @override
  Widget build(BuildContext context) {
    final sampleData = [
      SpaceData(title: "Salão de festas", price: "R\$203", picture: festa),
      SpaceData(
          title: "Churrasqueira bloco 2", price: "R\$100", picture: churras1),
      SpaceData(
          title: "Churrasqueira bloco 4", price: "R\$250", picture: churras2),
      SpaceData(title: "Sala de jogos", price: "R\$80", picture: jogos)
    ];
    final spaceCards = <Widget>[
      SpaceCard(
        spaceData: sampleData[0],
      ),
      SpaceCard(
        spaceData: sampleData[1],
      ),
      SpaceCard(
        spaceData: sampleData[2],
      ),
      SpaceCard(
        spaceData: sampleData[3],
      ),
    ];

    return TabBarView(
      children: <Widget>[
        const Center(
          child: Text("Você ainda não possui reservas"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0, top:16),
          child: ListView(
            children: spaceCards,
          ),
        ),
      ],
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
                  image: NetworkImage(spaceData.picture),
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
