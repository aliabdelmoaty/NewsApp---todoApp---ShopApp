import 'package:flutter/material.dart';
import 'package:flutter2/models/shopapp/cateogries/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopapp/cubit/cubit.dart';
import '../../../layout/shopapp/cubit/states.dart';
import '../../../shared/components/components.dart';

class CotegoriesScreen extends StatelessWidget {
  const CotegoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, HomeShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(
                SearchCubit.get(context).categories!.data!.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: SearchCubit.get(context).categories!.data!.data.length);
      },
    );
  }

  Widget buildCatItem(DataModel dataModel) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage('${dataModel.image}'),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${dataModel.name}',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
}
