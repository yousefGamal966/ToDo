import 'package:flutter/material.dart';
import 'package:todo/ui/home/settingsTab/SettingsTab.dart';
import 'package:todo/ui/home/tasksList/TasksList.dart';

class HomeScreen extends StatefulWidget {
static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex =0;
List<Widget> tabs = [
  TasksList(),
  SettingsTab(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,

      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            width: 3.5,color: Colors.white
          )
        ),
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });

          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label:'' ),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],
        ),
      ),
        body:tabs[currentIndex] ,
    );
  }
}
