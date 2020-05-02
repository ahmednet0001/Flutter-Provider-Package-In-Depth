import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/models/report.dart';
import 'package:provider_cahnge_notifire/screens/setting.dart';
import 'package:provider_cahnge_notifire/services/firestore_serves.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final FireStoreService _db=FireStoreService();
    var reports=Provider.of<List<Report>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Wax App"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>Setting()
          ));
          },
        )
      ],
      ),
      body: ListView.builder(
        itemCount: reports!=null?reports.length:0,
        itemBuilder: (context,index){
          Report r=reports[index];
          return Container(
            color: r.wax=='Green'?Colors.green:Colors.red,
            child: ListTile(

              leading: Text(r.temp.toString()),

              title: Text(r.line.toString()),
              trailing: Text(formatDate(DateTime.parse(r.timeStamp.toString()), [yyyy, '-', mm, '-', dd])),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          _db.addReport();
        },
      ),
    );
  }

}