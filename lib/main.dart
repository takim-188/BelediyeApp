import 'package:belediye_app/pages/adminProfile_page.dart';
import 'package:belediye_app/pages/adminSignIn_page.dart';
import 'package:belediye_app/pages/home_page.dart';
import 'package:belediye_app/pages/userProfile_page.dart';
import 'package:belediye_app/pages/userSignIn_page.dart';
import 'package:belediye_app/pages/userSignUp.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
    supportedLocales: AppConstant.SUPPORTED_LOCALE,
    path: AppConstant.LANG_PATH,
    fallbackLocale: Locale('tr', 'TR'),
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}


