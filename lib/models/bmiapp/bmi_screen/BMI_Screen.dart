import 'package:flutter/material.dart';

import '../bmi_result/BMI_Result.dart';


class BimScreen extends StatefulWidget {

  @override
  State<BimScreen> createState() => _BimScreenState();
}

class _BimScreenState extends State<BimScreen> {

  bool isMale =true;
  double height =80;
  int weight =50;
  int age =18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
         backgroundColor: Colors.black38,
        title: Text(

          'BMI Calculator',

        ),
      ),
      body: Column(
        children: [
          //جزية عمل شكل male and female
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // male
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                         setState(() {
                            isMale =true;
                         });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.blue : Colors.black26,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[

                          Image(
                              image: AssetImage('images/Male.png'),
                              height: 120.0,
                              width: 120.0,

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 40.0,
                               fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  // female
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Image(
                              image: AssetImage('images/Female.png'),
                              height: 120.0,
                              width: 120.0,

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white70
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Colors.blue : Colors.black26,
                        ),
                      ),
                    ),
                  ),
              ],
              ),
            )
          ),
          // height
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,),
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                  'Height',
                   style: TextStyle(
                      fontSize: 40.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                     color: Colors.white24,
                   ),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Colors.white24,
                          ),
                        ),
                      ],
                    ),
                    Slider(value:height ,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value){
                          setState(() {
                            height =value;
                          });
                        },

                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white12,
                ),
              ),
            ),

          ),
          // weight and age
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(9.5),
              child: Row(
              children: [
                //age
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            color: Colors.white24,
                          ),
                        ),
                        Text(
                          '${age}',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age --;
                              });
                            },
                              heroTag: 'age--',
                              mini: true,
                            child :Icon(
                              Icons.remove
                            ),
                              backgroundColor: Colors.white24,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                age ++;
                              });
                            },
                              heroTag: 'age++',
                              mini: true,
                              child :Icon(
                                  Icons.add
                              ),
                              backgroundColor: Colors.white24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // weight
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            color: Colors.white24,
                          ),
                        ),
                        Text(
                          '${weight}',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight --;
                              });
                            },
                              heroTag: 'weight--',
                              mini: true,
                              child :Icon(
                                  Icons.remove
                              ),
                              backgroundColor: Colors.white24,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                weight ++;
                              });
                            },
                              heroTag: 'weight++',
                              mini: true,
                              child :Icon(
                                  Icons.add,
                              ),
                              backgroundColor: Colors.white24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
          //Calculator
          Container(
            width: double.infinity,
            color: Colors.redAccent,
            child: MaterialButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>BmiResult(
                    age : age,
                    isMale :isMale,
                    weight : weight,
                    height : height.round(),
                  ),
              ),
              );
            },
              height: 50.0,
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
