import 'package:flutter/material.dart';

import '../theme.dart';

class SettingItemScreen extends StatelessWidget {
  static Route route(String itemTitle, String hint) => MaterialPageRoute(
        builder: (context) => SettingItemScreen(
          settingItemTitle: itemTitle,
          hintText: hint,
        ),
      );

  const SettingItemScreen({
    super.key,
    required this.settingItemTitle,
    required this.hintText,
  });

  final String settingItemTitle;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: Theme.of(context).iconTheme,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ),
        body: SettingItemBody(
          settingItemTitle: settingItemTitle,
          hintText: hintText,
        ));
  }
}

class SettingItemBody extends StatelessWidget {
  const SettingItemBody({
    Key? key,
    required this.settingItemTitle,
    required this.hintText,
  }) : super(key: key);

  final String settingItemTitle;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // "Digite seu novo endereço de email"
            settingItemTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(hintText),
          const SizedBox(
            height: 16,
          ),
          const TextField(autofocus: true)
        ],
      ),
    ));
  }
}
