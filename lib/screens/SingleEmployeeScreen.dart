import 'package:flutter/material.dart';
import 'package:provider_cahnge_notifire/models/employee.dart';
import 'package:provider_cahnge_notifire/screens/employeeService.dart';

class SingleEmployeeScreen extends StatelessWidget{
  final id;
  const SingleEmployeeScreen({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final EmployeeService empSe=EmployeeService();
    Future<Employee> singleEmpSer=empSe.singleEmployee(this.id);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Employee'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: singleEmpSer,
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.done){
                return Text(snapshot.data.name);
              }else{
                return CircularProgressIndicator();
              }
            },
          )
        ),
      ),
    );
  }

}