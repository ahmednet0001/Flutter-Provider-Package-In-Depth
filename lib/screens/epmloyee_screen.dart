
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/models/employee.dart';
import 'package:provider_cahnge_notifire/screens/SingleEmployeeScreen.dart';
import 'package:provider_cahnge_notifire/screens/employeeService.dart';

class EmployeesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Employee> empModel=Provider.of<List<Employee>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      body: (empModel==null)?CircularProgressIndicator():ListView.builder(
          itemCount: empModel.length,
          itemBuilder: (context,index){
            var emp=empModel[index];
            return ListTile(
              title:Text(emp.name) ,
              subtitle: Text(emp.email),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>SingleEmployeeScreen(id: emp.id,)
                ));
              },
            );
          },
      ),
    );
  }
}
