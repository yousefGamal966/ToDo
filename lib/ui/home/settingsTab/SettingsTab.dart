import 'package:flutter/material.dart';
import 'package:todo/ui/home/settingsTab/ThemeBottomSheet.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
              child: const Padding(
                padding:  EdgeInsets.all(15),
                child: Text('Light',style:TextStyle(
                  fontSize: 22,

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
