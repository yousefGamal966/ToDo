import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/ui/LoginPage/LoginScreen.dart';
import 'package:todo/ui/home/AddTaskSheet.dart';
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
List<String> appBarName = [
  'Tasks','Settings'
];

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('To Do ${appBarName[currentIndex]}',style: Theme.of(context).textTheme.headlineLarge,),
        leading: IconButton(onPressed: (){
          authProvider.logout();
          Navigator.pushReplacementNamed(context,LoginScreen.routeName);
        }, icon: Icon(Icons.logout)),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,

      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            width: 3.5,color: Colors.white
          )
        ),
        onPressed: (){
          showAddTaskBottomSheet();
        },
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
            BottomNavigationBarItem(icon: Icon(Icons.list),label:'' ,

                backgroundColor:Color(0xFF141922) ),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: '',backgroundColor:Color(0xFF141922)),
          ],
        ),
      ),
        body:tabs[currentIndex] ,
    );
  }

  void showAddTaskBottomSheet() {
showModalBottomSheet(context: context, builder:(context) {
  return AddTaskSheet();

},);
  }
}
