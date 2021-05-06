import 'package:flutter/material.dart';
import 'package:ttm/screens/HomePage.dart';
import 'package:ttm/screens/MyInfo.dart';
import 'package:ttm/screens/VoterInfo.dart';
import 'package:ttm/screens/LoginScreen.dart';
import 'package:ttm/provider/uconnect.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginData()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TTM',
          home: LoginScreen(),
          theme: new ThemeData(scaffoldBackgroundColor: HexColor('#FFFFFF')),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            HomePage.routeName: (ctx) => HomePage(),
            MyInfo.routeName: (ctx) => MyInfo(),
            VoterInfo.routeName: (ctx) => VoterInfo(),
          }
      ),
    );

  }
}