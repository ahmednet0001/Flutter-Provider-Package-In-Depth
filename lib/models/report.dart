class Report {
  final String temp;
  final String wax;
  final String line;
  final String timeStamp;

  Report(this.temp, this.wax, this.line, this.timeStamp);

  Report.fromJson(Map<String, dynamic> jsonObject)
      : temp = jsonObject["temp"],
        wax = jsonObject["wax"],
        line = jsonObject["line"],
        timeStamp = jsonObject["timeStamp"]{
   print(jsonObject);
  }
}
