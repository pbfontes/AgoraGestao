import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:my_app/theme.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  final List<Widget> cards = const [ExpandableCard(), ExpandableCard(), ExpandableCard()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return cards[index];
          }),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Administração - há 2 dias",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "Corte de de água nesta quinta",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Prezados condôminos, conforme discutido na ultima asembléia do condomínio, a água será cortada nesta quinta (dia 5) para a manutenção da caixa de água.",
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}


class ExpandedInfoCard extends StatelessWidget {
  const ExpandedInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Corte de de água nesta quinta",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 4,),
            Text(
              "Administração - há 2 dias",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Prezados condôminos, conforme discutido na ultima asembléia do condomínio, a água será cortada nesta quinta (dia 5) para a manutenção da caixa de água.",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
      ),
      backgroundColor: AppColors.cardLight,
    );

  }
}

// Navigator.of(context).pop();


class ExpandableCard extends StatelessWidget {
  const ExpandableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder:(BuildContext _, VoidCallback openContainer) {
        return InkWell(
          child: const InfoCard(),
          onTap: () {
            openContainer();
          },
        );
      },
      closedElevation: 0,
      openElevation: 0,
      openBuilder: (BuildContext _, VoidCallback __) {
        return const ExpandedInfoCard();
      },
    );
  }
}