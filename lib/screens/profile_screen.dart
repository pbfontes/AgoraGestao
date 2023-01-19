import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';

class ProfileScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Perfil",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: const ProfileList());
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    const profileItems = <Widget>[
      ProfileItem(
        profileTitle: "Alterar senha",
      ),
      ProfileItem(
        profileTitle: "Alterar email",
      ),
      ProfileItem(
        profileTitle: "Alterar telefone",
      ),
    ];
    return ListView(
      padding: const EdgeInsets.all(8),
      children:
          ListTile.divideTiles(context: context, tiles: profileItems).toList(),
    );
  }
}

// Center(child: TextButton(
//           child: const Text('Profile'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),);

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileTitle});

  final String profileTitle;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (profileTitle == "Alterar email") {
          Navigator.of(context).push(ProfileItemScreen.route(
              "Digite seu novo endereço de email",
              "Enviaremos um email de confirmação"));
        } else if (profileTitle == "Alterar telefone") {
          Navigator.of(context).push(ProfileItemScreen.route(
              "Digite seu novo telefone de preferência",
              "Enviaremos um sms de confirmação"));
        }
      },
      child: ListTile(
        title: Text(profileTitle),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
  
}
