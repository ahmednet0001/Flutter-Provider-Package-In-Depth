import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cahnge_notifire/providers/setting_provider.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: settingProvider.isLoading?Center(child: CircularProgressIndicator()):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Units"),
                DropdownButton<String>(
                  value: settingProvider.units,
                  onChanged: (val) {
                    settingProvider.setUnit(val);
                  },
                  items: ['Imperial', 'Matric']
                      .map<DropdownMenuItem<String>>((str) {
                    return DropdownMenuItem<String>(
                      value: str,
                      child: Text(str),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Wax Lines"),
                Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      FilterChip(
                        label: Text(
                          "Swix",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        selected: settingProvider.waxLine.contains("Swix"),
                        onSelected: (val) {
                          if (val)
                            settingProvider.addWaxLine("Swix");
                          else
                            settingProvider.removeWaxLine("Swix");
                        },
                      ),
                      FilterChip(
                        label: Text(
                          "Toko",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        selected: settingProvider.waxLine.contains("Toko"),
                        onSelected: (val) {
                          if (val)
                            settingProvider.addWaxLine("Toko");
                          else
                            settingProvider.removeWaxLine("Toko");
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
