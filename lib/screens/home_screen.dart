import 'package:flutter/material.dart';
import 'package:my_app/helpers.dart';
import 'package:my_app/pages/pages.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/theme.dart';
import 'package:my_app/widgets/widgets.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final ValueNotifier<int> pageIndex = ValueNotifier(0);
//   final ValueNotifier<String> title = ValueNotifier("Avisos");

//   final titles = ["Avisos", "Portaria"];

//   final pages = const [
//     MessagesPage(),
//     InboxPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _AppBarHomeScreen(title: title),
//       body: ValueListenableBuilder(
//         valueListenable: pageIndex,
//         builder: (context, value, child) {
//           return pages[value];
//         },
//       ),
//       bottomNavigationBar:
//           _BottomNavigationBar(onItemSelected: (_updateNavbarState)),
//     );
//   }

//   _updateNavbarState(index) {
//     pageIndex.value = index;
//     title.value = titles[index];
//   }
// }

class _AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarHomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final ValueNotifier<String> title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const _AppBarTitleHomeScreen(),
        leadingWidth: 54,
        // leading: Align(
        //   alignment: Alignment.centerRight,
        //   child: IconBackground(
        //     icon: Icons.search,
        //     onTap: (() {
        //       print("search");
        //     }),
        //   ),
        // ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Avatar.small(url: Helpers.randomPictureUrl(),),
        )],
      );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

// class _BottomNavigationBar extends StatefulWidget {
//   const _BottomNavigationBar({Key? key, required this.onItemSelected})
//       : super(key: key);

//   final ValueChanged<int> onItemSelected;

//   @override
//   State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<_BottomNavigationBar> {
//   var selectedIndex = 0;

//   void handleItemSelected(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//     widget.onItemSelected(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final brightness = Theme.of(context).brightness;
//     return Card(
//       color: brightness == Brightness.light ? Colors.transparent : null,
//       elevation: 0,
//       margin: const EdgeInsets.all(0),
//       child: SafeArea(
//           top: false,
//           bottom: true,
//           child: Padding(
//             padding: const EdgeInsets.only(top:12, left: 8, right: 8, bottom:12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _NavigationBarItem(
//                   index: 0,
//                   label: "avisos",
//                   icon: Icons.notifications,
//                   onTap: handleItemSelected,
//                   isSelected: selectedIndex == 0,
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GlowingActionButton(color: AppColors.secondary, icon: Icons.add, onPressed: (() {
//                       print("action");
//                     })),
//                   ],
//                 ),
//                 _NavigationBarItem(
//                     index: 1,
//                     label: "portaria",
//                     icon: Icons.home,
//                     onTap: handleItemSelected,
//                     isSelected: selectedIndex == 1),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class _NavigationBarItem extends StatelessWidget {
//   const _NavigationBarItem(
//       {super.key,
//       required this.index,
//       required this.label,
//       required this.icon,
//       this.isSelected = false,
//       required this.onTap});

//   final int index;
//   final String label;
//   final IconData icon;
//   final bool isSelected;
//   final ValueChanged<int> onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         onTap(index);
//       },
//       child: SizedBox(
//         width: 60,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: isSelected ? AppColors.secondary : null,
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Text(label,
//                 style: isSelected
//                     ? const TextStyle(
//                         fontSize: 11,
//                         color: AppColors.secondary,
//                         fontWeight: FontWeight.bold)
//                     : const TextStyle(
//                         fontSize: 11,
//                       ))
//           ],
//         ),
//       ),
//     );
//   }
// }




class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  final ValueNotifier<String> title = ValueNotifier("Avisos");
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarHomeScreen(title: title,),
      drawer: const NavDrawer(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: _getDestinations,
      ),
      body: _getPages[currentPageIndex],
    );
  }

  List<Widget> get _getPages {
    return <Widget>[
      const InboxPage(),
      const MessagesPage(),
      const Center(child: Text("teste"),)
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


class _AppBarTitleHomeScreen extends StatelessWidget {
  const _AppBarTitleHomeScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Condomínio Saint Martin",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 2),
              Text(
                'Bloco 2, 1401',
                style: Theme.of(context).textTheme.bodySmall
                ),
            ],
          ),
        )
      ],
    );
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
            leading: Icon(Icons.verified_user),
            title: Text('Perfil'),
            onTap: () => {Navigator.of(context).push(ProfileScreen.route())},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Quadro de horários'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Histórico'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
