import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:my_app/theme.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  final List<Widget> cards = const [
    ExpandableCard(
      wasOpened: false,
    ),
    ExpandableCard(
      wasOpened: false,
    ),
    ExpandableCard(
      wasOpened: true,
    ),
    ExpandableCard(
      wasOpened: true,
    ),
    ExpandableCard(
      wasOpened: true,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: cards[index],
            );
          }),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.wasOpened});

  final bool wasOpened;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Administração - há 2 dias",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Corte de de água",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                _getOpeneddBadge()
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Prezados condôminos, conforme discutido na ultima asembléia do condomínio, a água será cortada nesta quinta (dia 5) para a manutenção da caixa de água.",
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Ver mais >",
              style: TextStyle(color: Colors.blue, fontSize: 12),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }

  Container _getOpeneddBadge() {
    if (!wasOpened) {
      return Container(
        // width: 18,
        height: 22,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 252, 239, 124),
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Center(
            child: Text(
              'Não aberto',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textDark,
              ),
            ),
          ),
        ),
      );
    } 
    return Container();
  }

  Color _getInfoColor(BuildContext context) {
    if (wasOpened) {
      return const Color.fromARGB(255, 90, 117, 91);
    } else {
      return const Color.fromARGB(255, 218, 196, 3);
    }
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
              const SizedBox(
                height: 4,
              ),
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
  const ExpandableCard({super.key, required this.wasOpened});

  final bool wasOpened;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWell(
          child: InfoCard(
            wasOpened: wasOpened,
          ),
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
