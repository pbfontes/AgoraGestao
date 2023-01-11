import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';
import 'package:my_app/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme:AppTheme.dark(),
      themeMode: ThemeMode.light,
      home: const NavigationExample()
    );
  }
}