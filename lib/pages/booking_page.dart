import 'package:flutter/material.dart';
import '../helpers.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  final String festa =
      "https://www.casadevalentina.com.br/wp-content/uploads/2019/11/Sal%C3%A3oDeFestas_CasaDeValentina-6.jpg.optimal.jpg";
  final String churras1 =
      "https://s2.glbimg.com/YY_wqwry9hYdGCr5Lhvhhnvts7k=/smart/e.glbimg.com/og/ed/f/original/2019/09/16/ideias-churrasqueira-06.jpg";
  final String churras2 =
      "https://comprarchurrasqueira.com/wp-content/uploads/2020/03/Churrasqueira-no-quintal.jpg";
  final String jogos =
      "https://pointer.com.br/blog/wp-content/uploads/2018/02/156686-x-itens-que-nao-podem-faltar-ao-montar-uma-sala-de-jogos.jpg";

  @override
  Widget build(BuildContext context) {
    final sampleData = [
      SpaceData(title: "Salão de festas", price: 200, picture: festa, priceTimeReference: "dia"),
      SpaceData(
          title: "Churrasqueira bloco 2", price: 100, picture: churras1, priceTimeReference: "2 horas"),
      SpaceData(
          title: "Churrasqueira bloco 4", price: 250, picture: churras2, priceTimeReference: "dia"),
      SpaceData(title: "Sala de jogos", price: 80, picture: jogos, priceTimeReference: "hora")
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
        Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 24),
          child: SpaceCard(
            spaceData: sampleData[2],
            bookedData: BookedData(
                clientId: 'teste', date: DateTime.now(), spaceId: 'teste'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 0),
          child: ListView(
            children: spaceCards,
          ),
        ),
      ],
    );
  }
}

class SpaceCard extends StatelessWidget {
  const SpaceCard({super.key, required this.spaceData, this.bookedData});

  final SpaceData spaceData;
  final BookedData? bookedData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(BookingScreen.route(spaceData, bookedData));
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
            _getTrailingContent()
          ],
        ),
      ),
    );
  }

  ListTile _getTrailingContent() {
    if (bookedData == null) {
      return ListTile(
        title: Text(spaceData.title),
        trailing: Text("R\$${spaceData.price} / ${spaceData.priceTimeReference}"),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      );
    } else {
      return ListTile(
        title: Text(spaceData.title),
        trailing: Text(
            "${bookedData?.date?.day}/${bookedData?.date?.month}/${bookedData?.date?.year}"),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      );
    }
  }
}
