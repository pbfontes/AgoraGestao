import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (context) => const HistoryScreen(),
      );

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Histórico",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: const Center(child: HistoryDay()));
  }
}

class HistoryDay extends StatelessWidget {
  const HistoryDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: historyItems,
    );
  }

  List<Widget> get historyItems {
    return const <Widget>[
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Ontem"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.local_shipping_rounded,
              size: 32,
            )),
        title: Text("Encomenda recebida"),
        subtitle: Text("Paulo Fontes"),
        trailing: Text("21:32"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.people,
              size: 32,
            )),
        title: Text("Convidado liberado: Amanda Pontes"),
        subtitle: Text("Daniel Guedes"),
        trailing: Text("11:43"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.local_shipping_rounded,
              size: 32,
            )),
        title: Text("Encomenda recebida"),
        subtitle: Text("Grabriela Haje"),
        trailing: Text("21:32"),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("06 de janeiro"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.local_shipping_rounded,
              size: 32,
            )),
        title: Text("Encomenda recebida"),
        subtitle: Text("Paulo Fontes"),
        trailing: Text("21:32"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.people,
              size: 32,
            )),
        title: Text("Convidado liberado: Amanda Pontes"),
        subtitle: Text("Daniel Guedes"),
        trailing: Text("11:43"),
      ),
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.local_shipping_rounded,
              size: 32,
            )),
        title: Text("Encomenda recebida"),
        subtitle: Text("Grabriela Haje"),
        trailing: Text("21:32"),
      )
    ];
  }
}
