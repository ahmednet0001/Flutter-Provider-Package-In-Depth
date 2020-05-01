import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  bool isLoading=true;
  String _units;
  List<String> _waxLines;

  SettingProvider() {
    loadPreferences();
  }

  String get units => _units;

  List<String> get waxLine => _waxLines;

  void setUnit(String units) {
    _units = units;
    notifyListeners();
    savePreferences();
  }

  void setWaxLine(List<String> iWaxLines) {
    _waxLines = iWaxLines;
    notifyListeners();
  }

  void addWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == false) {
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();

    }
  }

  void removeWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == true) {
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();

    }
  }

  void savePreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("uints", _units);
    pref.setStringList("waxLines", _waxLines);
  }

  void loadPreferences() async {
    print(isLoading);
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading=false;
    print(isLoading);
    String units = pref.getString("uints");
    List<String> waxLines = pref.getStringList("waxLines");

    if (units != null)
      setUnit(units);
    else
      setUnit('Imperial');
    if (waxLines != null)
      setWaxLine(waxLines);
    else
      setWaxLine(['Swix', 'Toko']);



  }

}
