import 'package:flutter/material.dart';
import 'package:flutter2/layout/newsapp/Cubit/cubit.dart';
import 'package:flutter2/layout/newsapp/Cubit/states.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  label: 'Search',
                  controller: searchController,
                  type: TextInputType.text,
                  prefix: Icons.search_rounded,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChange: (String value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                  child: articleBuilder(
                list,
                context,
                isSearch: true,
              )),
            ],
          ),
        );
      },
    );
  }
}
