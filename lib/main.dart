import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/providers/setting_provider.dart';
import 'package:provider_cahnge_notifire/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Wax App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent
        ),
        home: Home(),
      ), create: (BuildContext context)=>SettingProvider(),
    );
  }
}