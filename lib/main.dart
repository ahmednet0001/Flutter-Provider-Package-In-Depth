import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/providers/setting_provider.dart';
import 'package:provider_cahnge_notifire/screens/home.dart';
import 'package:provider_cahnge_notifire/services/firestore_serves.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FireStoreService _db=FireStoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>SettingProvider(),),
        StreamProvider(create:(BuildContext context)=>_db.getReports() ,)
      ],
      child: MaterialApp(
        title: 'Wax App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent
        ),
        home: Home(),
      ),
    );
  }
}