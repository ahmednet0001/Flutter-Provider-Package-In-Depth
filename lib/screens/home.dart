import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_cahnge_notifire/screens/setting.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Container(

      ),
    );
  }

}