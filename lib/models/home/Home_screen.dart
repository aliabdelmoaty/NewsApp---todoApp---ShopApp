import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text('Frist App'),
        actions: [
          // IconButton(onPressed: onPressed, icon: icon)
          IconButton(
              onPressed: () {
                print('notificaion');
              },
              icon: Icon(Icons.notification_add)),
          IconButton(
            onPressed: () {
              print('scearh');
            },
            icon: Icon(
              Icons.search,
            ),
          )
        ],
        centerTitle: true, // بتخلي النص في نص المكان
        // elevation: 600,
        backgroundColor: Color.fromARGB(255, 91, 61, 225),
      ), // الجزء اللي فوق
      body:Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children:[
            Image(image: NetworkImage('https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg'),
          width: double.infinity,
          height: 100.0,
          fit: BoxFit.cover, ),
            Container(
            width: double.infinity,
            color: Color.fromARGB(255, 165, 184, 165),
            child: Text(
                'photo',
                style: TextStyle(fontSize: 20),) ,
          )
          ,
          ]),
        ],
      ),
      

       
      

    );
  }
}



// notes
// e
