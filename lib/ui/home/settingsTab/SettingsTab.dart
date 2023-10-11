import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
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
        )
      ],
    );
  }
}
