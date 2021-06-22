import 'package:first_app/playgroung/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './anotherWidget.dart';
import './statelessScreenOne.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:' ,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                print("build ran");
              return Text('count is :'+
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              );
            }, listener: (context, state) {
              ScaffoldMessengerState scaf = ScaffoldMessenger.of(context);

              if (state.wasIncremented == true) {
                scaf.showSnackBar(
                  SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else if (state.wasIncremented == false) {
                scaf.showSnackBar(
                  SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            }),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),

              ],
            ),
            myStatelessWidget(),
// IconButton(onPressed: (){
//   Navigator.of(context).pushNamed(MyStaelessScreen.routeName);
// }, icon: Icon(Icons.one_k))
          ],
        ),
      ),
    );
  }
}
