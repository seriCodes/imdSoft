import './counter.dart';
import 'package:flutter/material.dart';


class CounterPage extends StatefulWidget{
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
int count =0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${count}',
              style: TextStyle(fontSize:80.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              FloatingActionButton(
              onPressed: () {
                setState(() {
                                  count++;

                });
              },
              child: Icon(Icons.add),
              tooltip: 'Increment',
              ),
              SizedBox(width: 20.0),
              FloatingActionButton(
              onPressed: () {
                setState(() {
                                  count--;

                });

              },
              child: Icon(Icons.remove),
              tooltip: 'Decrement',
              ),

              ],)
            ],
          )));
  }
}
