import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider_cahnge_notifire/models/employee.dart';

class EmployeeService{
  Future<List<Employee>> fetchEmployees()async{
    var respone=await http.get('https://jsonplaceholder.typicode.com/users');
    var jsonRespone=convert.jsonDecode(respone.body) as List;
    return jsonRespone.map((empl)=>Employee.fromJson(empl)).toList();

  }

  Future<Employee> singleEmployee(int id)async{
    var respone=await http.get('https://jsonplaceholder.typicode.com/users/$id');
    var jsonRespone=convert.jsonDecode(respone.body) ;
    return Employee.fromJson(jsonRespone);

  }
}