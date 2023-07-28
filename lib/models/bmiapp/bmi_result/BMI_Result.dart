import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
   int age;
     bool isMale;
   int weight;
   int height;
  BmiResult({
    required this.age,
    required this.isMale,
    required this.weight,
    required this.height,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'BMI Result'
        ),
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Gender
            Text(
              'Gender :${isMale ? 'Male': 'Famale'}',
              style: TextStyle(
                fontSize: 40.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
              ),

            ),
            // height
            Text(
              'Height:${height}',
              style: TextStyle(
                fontSize: 40.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
              ),

            ),
            //Age
            Text(
              'Age : ${age}',
              style: TextStyle(
                fontSize: 40.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
              ),

            ),
          //  Weight
            Text(
              'Weight:${weight}',
              style: TextStyle(
                fontSize: 40.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
