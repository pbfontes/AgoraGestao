import 'package:flutter/material.dart';
import 'package:my_app/helpers.dart';
import 'package:my_app/pages/booking_page.dart';
import 'package:my_app/pages/pages.dart';
import 'package:my_app/screens/screens.dart';
import 'package:my_app/theme.dart';
import 'package:my_app/widgets/widgets.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> title = ValueNotifier("Avisos");
  int currentPageIndex = 0;

  final titles = ["Avisos", "Mensagens", "Reservas"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(titles[currentPageIndex], style: Theme.of(context).textTheme.titleMedium,),
      ),
    
      drawer: const NavDrawer(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            title.value = titles[index];
          });
        },
        selectedIndex: currentPageIndex,
        destinations: _getDestinations,
        backgroundColor: AppColors.cardLight,
      ),
      body: _getPages[currentPageIndex],
    );
  }


  List<Widget> get _getPages {
    return <Widget>[
      const InboxPage(),
      const MessagesPage(),
      const BookingPage()
      ];
  }

  List<Widget> get _getDestinations {
    return const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.upcoming),
          label: 'Avisos',
        ),
        NavigationDestination(
          icon: Icon(Icons.forum_rounded),
          label: 'Mensagens',
        ),
        NavigationDestination(
          icon: Icon(Icons.edit_calendar),
          label: 'Reservas',
        ),
      ];
  }
}


class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            // margin: EdgeInsets.all(0),
            // padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: AppColors.secondary,
                
            ),
            child: Text(
              'Olá, Paulo.',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Perfil'),
            onTap: () => {Navigator.of(context).push(ProfileScreen.route())},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => {Navigator.of(context).push(SettingsScreen.route())},
          ),
          // ListTile(
          //   leading: const Icon(Icons.table_chart),
          //   title: const Text('Quadro de horários'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico'),
            onTap: () => {Navigator.of(context).push(HistoryScreen.route())},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
