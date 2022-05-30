import 'package:belediye_app/widgets/change_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {

    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          ChangeThemeButtonWidget(),
        ],

      ),
      body: Center(
        child: Text('Hello $text!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),),

      ),
    );
  }
}
