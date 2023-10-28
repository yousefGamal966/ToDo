import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/SettingsProvider.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: (){
              settingsProvider.changeTheme(ThemeMode.light);
            },
            child: settingsProvider.isDarkEnabled()?
            getUnselectedItem(
                unselectedThemeName: 'Light'):
            getSelectedItem(selectedThemeName:'Light')),
        SizedBox(
          height: 15,
        ),
        InkWell(
            onTap: (){
              settingsProvider.changeTheme(ThemeMode.dark);
            },
            child:
            settingsProvider.isDarkEnabled()?
            getSelectedItem(selectedThemeName:'Dark'):
            getUnselectedItem(
                unselectedThemeName:'Dark')


        )
      ],
    );
  }

  Widget getSelectedItem({required String selectedThemeName}) {
    var provider = SettingsProvider();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedThemeName,
          style: TextStyle(fontSize: 25, color: Theme.of(context).dividerColor
              ,fontWeight: FontWeight.bold
          ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }

  Widget getUnselectedItem({required String unselectedThemeName}) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Text(unselectedThemeName,
          style: TextStyle(
            fontSize: 25,color:settingsProvider.isDarkEnabled()?Colors.white:Colors.black
          )),
    );
  }
}
