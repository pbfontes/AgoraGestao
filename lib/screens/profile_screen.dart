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
      ListTile(
        leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.location_city,
              size: 32,
            )),
        title: Text("Condomínio Saint Martin"),
        subtitle: Text("Bloco 2, 1401"),
      ),
      ProfileItem(
        profileTitle: "Email",
        profileSubtitle: "paulobatfon@gmail.com",
      ),
      ProfileItem(
        profileTitle: "Telefone",
        profileSubtitle: "21 996008803",
      ),
      ProfileItem(
        profileTitle: "Alterar senha",
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
  const ProfileItem({super.key, required this.profileTitle, this.profileSubtitle});

  final String profileTitle;
  final String? profileSubtitle;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (profileTitle == "Email") {
          Navigator.of(context).push(ProfileItemScreen.route(
              "Digite seu novo endereço de email",
              "Enviaremos um email de confirmação"));
        } else if (profileTitle == "Telefone") {
          Navigator.of(context).push(ProfileItemScreen.route(
              "Digite seu novo telefone de preferência",
              "Enviaremos um sms de confirmação"));
        }
      },
      child: ListTile(
        title: Text(profileTitle),
        subtitle: checkSubtitle(profileSubtitle),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }


    Widget? checkSubtitle(value) {
    if (value == null) {
      return null;
    }
    return Text(value);
  }
  
}
