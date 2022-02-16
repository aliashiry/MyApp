import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:myapp/modules/done_tasks/done_tasks_screen.dart';
import 'package:myapp/modules/new_tasks/new_tasks_screen.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/components/constans.dart';
import 'package:sqflite/sqflite.dart';

class Home_Layout extends StatefulWidget {
  @override
  _Home_LayoutState createState() => _Home_LayoutState();
}

// 1. create database
// 2. create tables
// 3. open database
// 4. insert into database
// 5. get from database
// 6. update in database
// 7. delete from database
class _Home_LayoutState extends State<Home_Layout> {
  int currentIndex = 0;
  @override
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    'Tasks',
    'Done tasks',
    'Archived tasks',
  ];
  Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dataController = TextEditingController();


  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          title[currentIndex],
        ),
      ),
      body:ConditionalBuilder(
        condition:tasks.length>0,
        builder:(context) =>screens[currentIndex],
        fallback: (context) =>Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShow) {
            if (formKey.currentState.validate()) {
              insertToDatabase(
                title: titleController.text,
                data: dataController.text,
                time: timeController.text,
              ).then((value) {
                getDataFromDatabase(database).then((value)
                {
                  Navigator.pop(context);
                  setState(()
                  {
                    isBottomSheetShow = false;
                    fabIcon = Icons.edit;
                    tasks = value;
                    print('tasks from database $tasks');
                  });
                  });

                }

                );

            }
          } else {
            scaffoldkey.currentState.showBottomSheet(
              (context) => Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultFormFiled(
                        controller: titleController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'title must not be empty';
                          }
                          return null;
                        },
                        label: 'Task title',
                        prefix: Icons.title,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormFiled(
                        controller: timeController,
                        type: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            timeController.text =
                                value.format(context).toString();
                            print(value.format(context));
                          });
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'time must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Time',
                        prefix: Icons.watch_later_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormFiled(
                        controller: dataController,
                        type: TextInputType.datetime,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2022-05-03'),
                          ).then((value) {
                            dataController.text =
                                DateFormat.yMMMMd().format(value);
                          });
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'data must not be empty';
                          }
                          return null;
                        },
                        label: 'Task data',
                        prefix: Icons.calendar_today,
                      ),
                    ],
                  ),
                ),
              ),
              elevation: 20.0,
            );
            isBottomSheetShow = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle_outline,
              ),
              label: 'Don'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive_outlined,
              ),
              label: 'Archived'),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Ali Hassan';
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print("Database created");
        // When creating the db, create the table
        database
            .execute(
                'Create table tasks(Id INTEGER PRIMARY KEY,title TEXT,data TEXT , time TEXT ,status TEXT)')
            .then((value) {
          print("Table created");
        }).catchError((error) {
          print("Error whining creating Table${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value)
        {
          tasks = value;
          print(tasks);
        }
        );
        print("Database open");
      },
    );
  }

  Future insertToDatabase({
    @required String title,
    @required String time,
    @required String data,
  }) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks (title ,data,time,status) VALUES (" $title","$data","$time","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error when   inserted new record ${error.toString()}');
      });
      return null;
    });
  }
   Future<List<Map>>getDataFromDatabase(database) async
  {
    return await database.rawQuery("SELECT * FROM tasks");

  }
}
// Instance of 'Future<String>'
