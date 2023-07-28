import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_model/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<Usermodel> User =[
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
    Usermodel(
      id: 2200818,
      name: 'Ali abdelmoaty' ,
      Phone: 01018924421 ,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:
        ListView.separated(itemBuilder: (context ,index)=> bulidUserItem(User[index]),
         separatorBuilder: (context ,index) => Padding(
           padding: const EdgeInsetsDirectional.only(
            start: 20.0,
           ),
           child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
                 ),
         ),
         itemCount: User.length),

        );
  }

  Widget bulidUserItem(Usermodel  user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.Phone}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
