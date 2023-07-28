import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../../shared/components/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

// class AppInsertDatabaseState extends AppStates {
//   final Map<String, dynamic>? applicationData;
//
//   AppInsertDatabaseState({this.applicationData});
//
//   @override
//   List<Object?> get props => [applicationData];
// }
class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dataController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

// @override
// void initState() {
//   super.initState();
//   createDatabase();
// }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
            // ccubit.changeBottomSheetState(
            //     isShow: false,
            //     icon: Icons.add_task_rounded,
            //     applicationData: {
            //     'title': titleController.text,
            //     'data': dataController.text,
            //     'time': timeController.text,
            //     },
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) => cubit.screens[cubit.currentIndex]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDatabase(
                        title: titleController.text,
                        data: dataController.text,
                        time: timeController.text
                        // applicationData:
                        );
                    // insertDatabase(
                    //   time: timeController.text,
                    //   title: titleController.text,
                    //   data: dataController.text,
                    // ).then((value)
                    // {
                    //   getDatabase(database).then((value){
                    //
                    //     // setState(() {
                    //     //   isBottomSheetShown = false;
                    //     //   fabIcon = Icons.add_task_outlined;
                    //     //   tasks =value;
                    //     //   print(tasks);
                    //     // });
                    //   });
                    //
                    // });
                  }
                } else {
                  // cubit.isBottomSheetShown=true;
                  scaffoldKey.currentState!
                      .showBottomSheet((context) => Form(
                            key: formKey,
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                    label: 'task',
                                    controller: titleController,
                                    type: TextInputType.text,
                                    prefix: Icons.title_rounded,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormField(
                                    label: 'Time',
                                    controller: timeController,
                                    type: TextInputType.datetime,
                                    prefix: Icons.watch_later,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'time must not be empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeController.text =
                                            (value?.format(context)).toString();
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultFormField(
                                    label: 'Date',
                                    controller: dataController,
                                    type: TextInputType.datetime,
                                    prefix: Icons.calendar_month_rounded,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'date must not be empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2030-12-31'),
                                      ).then((value) {
                                        dataController.text =
                                            DateFormat.yMd().format(value!);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit_rounded,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add_task_outlined,
                  );
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                // bottom tasks
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                // bottom done
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle),
                  label: 'Done',
                ),
                // bottom archived
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
