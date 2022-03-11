import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:myapp/modules/done_tasks/done_tasks_screen.dart';
import 'package:myapp/modules/new_tasks/new_tasks_screen.dart';
import 'package:myapp/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    'New tasks',
    'Done tasks',
    'Archived tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print("Database created");
        // When creating the db, create the table
        database
            .execute(
                'Create table tasks(id INTEGER PRIMARY KEY,title TEXT,data TEXT , time TEXT ,status TEXT)')
            .then((value) {
          print("Table created");
        }).catchError((error) {
          print("Error whining creating Table${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print("Database open");
      },
    ).then((value) {
      database = value;
      emit(AppCreatDatabaseState());
    });
  }

  insertToDatabase({
    @required String title,
    @required String time,
    @required String data,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks (title ,data,time,status) VALUES (" $title","$data","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
        print('New Tasks  $newTasks');
        print('Done Tasks  $doneTasks');
        print('Archive Tasks  $archivedTasks');
      }).catchError((error) {
        print('Error when   inserted new record ${error.toString()}');
      });
      return null;
    });
  }

  void getDataFromDatabase(Database database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    database.rawQuery("SELECT * FROM tasks").then((value) {
      for(var element in value) {
        if (element["status"] == 'new') {
          newTasks.add(element);
        }
        else if (element["status"] == 'done') {
          doneTasks.add(element);
        }
        else
          archivedTasks.add(element);
      }
      emit(AppGetDatabaseState());
      print('New Tasks  $newTasks');
      print('Done Tasks  $doneTasks');
      print('Archive Tasks  $archivedTasks');
    }
    );

    }


  void updateData({@required status, @required id,}){
    database.rawUpdate('UPDATE tasks SET status = "$status" WHERE id = $id ')
        .then((value) {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    });
  }
  void deleteData({ @required id,}){
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
