import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/ui/home/settingsTab/ThemeBottomSheet.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Theme',style: TextStyle(
          fontSize: 18,
          color: settingsProvider.isDarkEnabled()?Colors.white:Colors.black
        ),),
        InkWell(
          onTap: (){
            showThemeBottomSheet();
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2,color:Theme.of(context).dividerColor ),
                borderRadius: BorderRadius.circular(12)
              ),
              child:  Padding(
                padding:  EdgeInsets.all(15),
                child: Text(
                  settingsProvider.isDarkEnabled()?
                      'Dark':'Light'

                  ,style:TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor

                ),),
              ),
            ),
          ),
        )
      ],
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
       return ThemeBottomSheet();


    }, );

  }
}
