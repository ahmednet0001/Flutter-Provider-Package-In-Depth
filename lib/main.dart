import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/providers/setting_provider.dart';
import 'package:provider_cahnge_notifire/screens/employeeService.dart';
import 'package:provider_cahnge_notifire/screens/home.dart';
import 'package:provider_cahnge_notifire/services/firestore_serves.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FireStoreService _db=FireStoreService();
    final EmployeeService _ems=EmployeeService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>SettingProvider(),),
        StreamProvider(create:(BuildContext context)=>_db.getReports() ,),
        FutureProvider(create: (BuildContext context)=>_ems.fetchEmployees(),catchError: (context,err){
          print(err.toString());
        },)
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