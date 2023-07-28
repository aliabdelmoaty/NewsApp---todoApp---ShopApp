// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter2/shared/cubit/states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../../models/archived_tasks/archived_tasks.dart';
// import '../../models/done_tasks/done_tasks.dart';
// import '../../models/tasks/new_tasks_screen.dart';
//
//
// class AppCubit extends Cubit<AppStates>
// {
//
//   AppCubit(): super(AppInitialState());
//   static AppCubit get(context) => BlocProvider.of(context);
//   List<Widget> Screens =[
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchivedTasksScreen(),
//   ];
//   List<Map> newtasks = [];
//   List<Map> donetasks = [];
//   List<Map> archivedtasks = [];
//
//   List<String> titles= [
//     'New Tasks',
//     'Done Tasks',
//     'Archived Tasks'
//   ];
//   int currentIndex =0;
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomNabBarState());
//   }
//    Database? database;
//   // List<Map> tasks =[];
//   void createDatabase() {
//      openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database,version){
// ////////////
//         print('database done');
//         database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT ,state TEXT) ')
//             .then((value){
//           print('table created');
//         }).catchError((error) {
//           // Handle the error
//           print('Error When Creating Table ${error.toString()}');
//         });
//
//       },
//       onOpen: (database) {
//         getDatabase(database);
//       },).then((value){
//
//           database = value;
//           // print(tasks[0]);
//           emit(AppCreateDatabase());
//         });
//         // print('database open');
//   }
//
//    insertDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//       await database!.transaction((txn)async{
//       txn.rawInsert(
//           'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "New")'
//       ).then((value){
//
//         print('$value table insert success');
//         emit(AppInsertDatabaseState());
//
//         getDatabase(database);
//         //     .then((value){
//         //
//         //   tasks = value;
//         //   print(tasks[0]);
//         //   emit(AppGetDatabase());
//         // });
//       }).catchError((error){
//         print('Error When Insert New Record ${error.toString()}');
//       });// return Future<Null>.value(null);
//     });
//   }
// //////////////////////////////////////////////////////////
//   void getDatabase(database) {
//     newtasks = [];
//     donetasks = [];
//     archivedtasks = [];
//
//     emit(AppGetDatabaseLoadingState());
//     database!.rawQuery('SELECT * FROM tasks').then((value) {
//       value.forEach((element) {
//         if (element['status'] == 'New') {
//           newtasks.add(element);
//         } else if (element['status'] == 'done') {
//           donetasks.add(element);
//         } else {
//           archivedtasks.add(element);
//         }
//       });
//
//       print(value);
//
//       emit(AppGetDatabase());
//     });
//   }
//
//   IconData fabIcon = Icons.edit;
//   bool isBottomSheetShown = false;
//
//   void changeBottomSheetState0({
//     required bool isShow,
//     required IconData icon,
//   }) {
//     isBottomSheetShown = isShow;
//     fabIcon = icon;
//     emit(AppChangeBottomSheetState());
//   }
//
//   void updateData({
//     required String status,
//     required int id,
//   }) async {
//     database!.rawUpdate('UPDATE tasks SET status = ?  WHERE id = ?',
//         [status, id]).then((value) {
//       getDatabase(database);
//       emit(AppUpdateDatabaseState());
//     });
//   }
//
//   void deleteData({
//     required int id,
//   }) async {
//     database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//       getDatabase(database);
//       emit(AppDeleteDatabaseState());
//     });
//   }
//   // Future<List<Map>> getDataFromDatabase(database) async {
//   //   return await database.rawQuery('SELECT * FROM tasks');
//   //
//   // }
//   //
//   // bool isBottomSheetShown = false;
//   // IconData fabIcon = Icons.mode_edit_outline;
//   // void changeBottomSheetState({
//   // required bool isShow,
//   // required IconData icon,
//   //   }){
//   //  isBottomSheetShown =isShow;
//   //  fabIcon = icon;
//   //  emit(state);
//   // }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter2/shared/cubit/states.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../models/archived_tasks/archived_tasks.dart';
// import '../../models/done_tasks/done_tasks.dart';
// import '../../models/tasks/new_tasks_screen.dart';
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitialStates());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//
//   List<Widget> screens = [
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchivedTasksScreen(),
//   ];
//
//   List<Map> newtasks = [];
//   List<Map> donetasks = [];
//   List<Map> archivedtasks = [];
//
//   List<String> title = [
//     "New Tasks",
//     "Done Tasks",
//     "Archived Tasks",
//   ];
//   int currentIndex = 0;
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomNavBarState());
//   }
//
//   Database? database;
//   // void createDatabase() {
//   //   openDatabase(
//   //     'todoApp.db',
//   //     version: 1,
//   //     onCreate: (database, version) {
//   //       print('Database Created');
//   //       database
//   //           .execute(
//   //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//   //           .then((value) {
//   //         print('Table created');
//   //       }).catchError((e) {
//   //         print('Error When Creating Table ${e.toString()}');
//   //       });
//   //     },
//   //     onOpen: (database) {
//   //       getDatabase(database);
//   //     },
//   //   ).then((value) {
//   //     database = value;
//   //     emit(AppCreateDatabaseState());
//   //   });
//   // }
//   void createDatabase() {
//     openDatabase(
//       'todoApp.db',
//       version: 1,
//       onCreate: (database, version) {
//         print('Database Created');
//         database.execute(
//             'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) {
//           print('Table created');
//         }).catchError((e) {
//           print('Error When Creating Table ${e.toString()}');
//         });
//       },
//       onOpen: (database) {
//         getDatabase(database);
//       },
//     ).then((value) {
//       database = value;
//       emit(AppCreateDatabaseState());
//     });
//   }
//
//
//   insertDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     await database?.transaction((txn) async {
//       txn
//           .rawInsert(
//           'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "New")')
//           .then((value) {
//         print('$value Table insered seccesfuly');
//         emit(AppInsertDatabaseState());
//         getDatabase(database);
//       }).catchError((e) {
//         print(' Error When Inserting Table ${e.toString()}');
//       });
//     });
//   }
//
//   void getDatabase(database) {
//     newtasks = [];
//     donetasks = [];
//     archivedtasks = [];
//
//     emit(AppGetDatabaseLoadingState());
//     database?.rawQuery('SELECT * FROM tasks').then((value) {
//       value.forEach((element) {
//         if (element['status'] == 'New') {
//           newtasks.add(element);
//         } else if (element['status'] == 'done') {
//           donetasks.add(element);
//         } else
//           archivedtasks.add(element);
//       });
//
//       print(value);
//
//       emit(AppGetDatabaseState());
//     });
//   }
//
//   IconData fabIcon = Icons.edit;
//   bool isBottonSheetShown = false;
//
//   void changeBottomSheetState0({
//     required bool isShow,
//     required IconData icon,
//   }) {
//     isBottonSheetShown = isShow;
//     fabIcon = icon;
//     emit(AppChangeBottomSheetState());
//   }
//
//   void updateData({
//     required String status,
//     required int id,
//   }) async {
//     database!.rawUpdate('UPDATE tasks SET status = ?  WHERE id = ?',
//         ['$status', id]).then((value) {
//       getDatabase(database);
//       emit(AppUpdateDatabaseState());
//     });
//   }
//
//   void deleteData({
//     required int id,
//   }) async {
//     database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//       getDatabase(database);
//       emit(AppDeleteDatabaseState());
//     });
//   }
// }
/////////////////////////
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/todoapp/cubit/states.dart';
import 'package:flutter2/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/todoapp/archived_tasks/archived_tasks.dart';
import '../../../models/todoapp/done_tasks/done_tasks.dart';
import '../../../models/todoapp/tasks/new_tasks_screen.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  int currentIndex =0;
  List<Widget> screens =[
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> titles = [
    'New',
    'Done',
    'archived',
  ];
  void changeIndex(int index){
    currentIndex =index;
    emit(AppChangeBottomNabBarState());
  }
  late Database? database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archiveTasks =[];
  void createDatabase()  {
      openDatabase(
        'todoApp.db',
        onCreate: (database, version) {
          print('data-create');
          database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT, data TEXT , time TEXT , state TEXT)',
          ).then((value) {
            print('table create');
          }).catchError((e) {
            print('error${e.toString()}');
          });
        },
        version: 1,
        onOpen: (database) {
          getDatabase(database);

          },
      ).then((value){
        database =value;
        emit(AppCreateDatabaseState());
      });

  }

   insertDatabase({
    required String title,
    required String data,
    required String time,

  }) async {
      await database?.transaction((txn) async{
       txn
           .rawInsert(
        'INSERT INTO tasks (title, data ,time, state) VALUES("$title","$data","$time","New")',)
           .then((value) {
        print('$value insert success');
        emit(AppInsertDatabaseState());
        getDatabase(database);

      }).catchError((e) {
        print('error when insert new ${e.toString()}');
      });
    });
  }

  void getDatabase(database){
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    emit(AppGetDatabaseLoadingState());
     database?.rawQuery('SELECT * FROM tasks').then((value) {
       value.forEach((element) {
         if (element['state'] == 'New') {
           newTasks.add(element);
         } else if (element['state'] == 'done') {
           doneTasks.add(element);
         } else
           archiveTasks.add(element);
       });
     });

  }
  void updataData({
    required String state,
    required int id,
  })async{
    database?.rawUpdate(
      'UPDATE tasks SET state=? WHERE id =?',
      ['$state',id,],
    ).then((value){
      getDatabase(database);
      emit(AppUpdateDatabaseState());
    });
}
  void deleteData({
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }


  bool isBottomSheetShown =false;
  IconData fabIcon = Icons.add_task_rounded;
  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,

}){
    isBottomSheetShown =isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark =false;
  void changeAppMode({ bool? fromShared}){
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else{
      isDark =!isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }
}

