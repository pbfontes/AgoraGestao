import 'package:flutter/material.dart';

import '../theme.dart';

class ProfileItemScreen extends StatelessWidget {
  static Route route(String itemTitle, String hint) => MaterialPageRoute(
        builder: (context) => ProfileItemScreen(
          profileItemTitle: itemTitle,
          hintText: hint,
        ),
      );

  const ProfileItemScreen({
    super.key,
    required this.profileItemTitle,
    required this.hintText,
  });

  final String profileItemTitle;
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
        body: ProfileItemBody(
          profileItemTitle: profileItemTitle,
          hintText: hintText,
        ));
  }
}

class ProfileItemBody extends StatelessWidget {
  const ProfileItemBody({
    Key? key,
    required this.profileItemTitle,
    required this.hintText,
  }) : super(key: key);

  final String profileItemTitle;
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
            profileItemTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(hintText),
          const SizedBox(
            height: 16,
          ),
          const TextField(autofocus: true),
          const SizedBox(
            height: 42,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.textLigth,
            ),
            height: 48,
            width: double.infinity,
            child: InkWell(
              onTap: (() {}),
              child: const Center(child: Text("Confirmar")),
            ),
          )
        ],
      ),
    ));
  }

}

