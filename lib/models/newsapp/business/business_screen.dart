import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/newsapp/Cubit/cubit.dart';
import 'package:flutter2/layout/newsapp/Cubit/states.dart';
import 'package:flutter2/layout/todoapp/cubit/cubit.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).business;
      return articleBuilder(list,context);
      }
    );
  }
}
