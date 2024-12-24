import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/new_archived/new_archived_screeen.dart';
import 'package:untitled/modules/new_done/new_done_screeen.dart';
import 'package:untitled/modules/new_tasks/new_tasks_screeen.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget>screen =[
    NewTasksScreeen(),
    NewDoneScreeen(),
    NewArchivedScreeen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Todo App'),

      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex=index;
          });
          },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: 'Done'),
          BottomNavigationBarItem (
              icon: Icon(Icons.archive),
              label: 'Archive'),
      ],
      ),
    );
  }
}
