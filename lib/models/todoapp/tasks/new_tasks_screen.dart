 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/todoapp/cubit/cubit.dart';
import '../../../layout/todoapp/cubit/states.dart';
import '../../../shared/components/components.dart';


class NewTasks  extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var tasks =AppCubit.get(context).newTasks;
          return
            tasksBuilder(
              tasks: tasks
          );
    //       ConditionalBuilder(
    //         condition:tasks.length>0 ,
    //         fallback: (context)=>
    //             Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: const [
    //                   Icon(
    //                     Icons.menu_rounded,
    //                     size: 100,
    //                     color: Colors.blueGrey,
    //                   ),
    //                   Text(
    //                       'يعم ضيف شوية مهام ',
    //                     style: TextStyle(
    //                       color:Colors.blueGrey,
    //                       fontSize: 25,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //         builder: (context)=> ListView.separated(
    //         itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
    //         separatorBuilder: (context,index)=> Padding(
    //           padding: const EdgeInsets.only(top:20.0),
    //           child: Container(
    //             width: double.infinity,
    //             height: 1.0,
    //             color: Colors.grey[300],
    //           ),
    //         ),
    //         itemCount: tasks.length
    // ),
    //       );
          },
      );
  }
}
