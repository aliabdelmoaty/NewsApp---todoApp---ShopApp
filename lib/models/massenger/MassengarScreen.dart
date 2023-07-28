import 'dart:io';

import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 16,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.5,
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D4D03AQE9NopxJBk4mw/profile-displayphoto-shrink_800_800/0/1671474170857?e=1681344000&v=beta&t=Xn7GuxZ01OuiVC6RZ5u3kPTVnRsAXBD2AFvkFB6SLms'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white30,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 20.0,
                ),
              )),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.white30,
              child: Icon(
                Icons.edit,
                size: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:SingleChildScrollView(

         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Searh'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100.0,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index ) => buildstoryItem(),
                  separatorBuilder: (context ,index) => SizedBox(
                    width: 20.0
                  ),
                  itemCount: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder:(BuildContext , index) =>BuildchatItem(),
                separatorBuilder: (context , index) => SizedBox(
                  height: 20.0,
                ) ,
                itemCount:25 ),


          ],
        )),

      ),
    );
  }
  Widget BuildchatItem() =>  Row(
    children:[
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/D4D03AQE9NopxJBk4mw/profile-displayphoto-shrink_800_800/0/1671474170857?e=1681344000&v=beta&t=Xn7GuxZ01OuiVC6RZ5u3kPTVnRsAXBD2AFvkFB6SLms'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ali Mohamedabdelmoaty',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text('Hallo how are you  ',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 5.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                    '02.00'
                ),
              ],
            ),
          ],
        ),)

    ],
  );
  Widget buildstoryItem() => Container(
    width: 40,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:  [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D4D03AQE9NopxJBk4mw/profile-displayphoto-shrink_800_800/0/1671474170857?e=1681344000&v=beta&t=Xn7GuxZ01OuiVC6RZ5u3kPTVnRsAXBD2AFvkFB6SLms'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Ali mohamed',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],


    ),

  );

}
