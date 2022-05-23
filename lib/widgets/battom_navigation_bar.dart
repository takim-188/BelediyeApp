import 'package:belediye_app/pages/bildiri_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../pages/helpUs_page.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';
import '../pages/userProfile_page.dart';



class BotNav extends StatefulWidget {
  const BotNav({Key? key}) : super(key: key);

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int selectedPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        SettingsPage(),
        HomePage(),
        BildiriPage(),
        HelpUsPage(),
        ProfilePage(),

      ][selectedPage],


      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Color(0xff3b42bf),
        items: [

          TabItem(icon: Icons.settings, title: "Ayarlar"),
          TabItem(icon: Icons.home, title: "Anasayfa"),
          TabItem(icon: Icons.add, title: "Bildiri"),
          TabItem(icon: Icons.help, title: "Yardım"),
          TabItem(icon: Icons.person, title: "Profil"),
        ],
        initialActiveIndex: 2,
        onTap: (int i){
          setState(() {
            selectedPage = i;
          });
        },
      ),
    );
  }
}
