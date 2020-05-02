import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_cahnge_notifire/models/report.dart';

class FireStoreService {
  Firestore _db = Firestore.instance;
  var random = Random();

  Stream<List<Report>> getReports() {

    return _db
        .collection("reports")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((snapShot) => snapShot.documents
            .map((doc) => Report.fromJson(doc.data))
            .toList());
  }

  Future<void> addReport() {
    var temp=next(-15, 5);
    var line=(temp< -5)?"Swix":"Toko";
    var wax=(temp.isEven)?"Red":"Green";


    var dataMap = Map<String, dynamic>();
    dataMap["temp"]=temp.toString();
    dataMap["line"]=line;
    dataMap["wax"]=wax;
    dataMap["timeStamp"]=DateTime.now().toIso8601String();
    _db.collection("reports").add(dataMap).then((v)=>print(v));
  }
  int next(min,max)=>min+random.nextInt(max-min);
}
