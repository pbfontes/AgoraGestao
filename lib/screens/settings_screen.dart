import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';

class SettingsScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Configurações",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: const SettingsList());
  }
}

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    const settingItems = <Widget>[
      SettingsItem(
        settingTitle: "Alterar senha",
      ),
      SettingsItem(
        settingTitle: "Alterar email",
      ),
      SettingsItem(
        settingTitle: "Alterar telefone",
      ),
    ];
    return ListView(
      padding: const EdgeInsets.all(8),
      children:
          ListTile.divideTiles(context: context, tiles: settingItems).toList(),
    );
  }
}

// Center(child: TextButton(
//           child: const Text('Settings'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),);

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.settingTitle});

  final String settingTitle;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (settingTitle == "Alterar email") {
          Navigator.of(context).push(SettingItemScreen.route(
              "Digite seu novo endereço de email",
              "Enviaremos um email de confirmação"));
        } else if (settingTitle == "Alterar telefone") {
          Navigator.of(context).push(SettingItemScreen.route(
              "Digite seu novo telefone de preferência",
              "Enviaremos um sms de confirmação"));
        }
      },
      child: ListTile(
        title: Text(settingTitle),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
  
}
