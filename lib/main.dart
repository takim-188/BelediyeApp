import 'package:belediye_app/provider/theme_provider.dart';
import 'package:belediye_app/widgets/battom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
     builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode:  themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff22e3d7),
        accentColor: Color(0xfff20c60),
        cursorColor:Color(0xfff20c60),
        highlightColor: Color(0xfff20c60),
        scaffoldBackgroundColor: Color(0xffededed)
      ),
      home: BotNav()
    );
  });
}


