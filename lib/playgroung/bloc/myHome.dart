import 'package:first_app/playgroung/constants/enums.dart';
import 'package:first_app/playgroung/cubit/counter_cubit.dart';
import 'package:first_app/playgroung/cubit/internet_state.dart';
// import 'package:first_app/playgroung/cubit/counter_cubit.dart';

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
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            ConnectionType.Mobile == state.connectionType) {
          BlocProvider.of<CounterCubit>(context).decrement();
        } else if (state is InternetConnected &&
            ConnectionType.Wifi == state.connectionType) {
          BlocProvider.of<CounterCubit>(context).increment();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) {
                  final counterState = context.watch<CounterCubit>().state;
                  final internetState = context.watch<InternetCubit>().state;
                  if (internetState is InternetConnected &&
                      internetState.connectionType == ConnectionType.Wifi &&
                      counterState.counterValue > 0) {
                    return Text('state no 1: wifi + positive');
                  }
                   if (internetState is InternetConnected &&
                      internetState.connectionType == ConnectionType.Wifi &&
                      counterState.counterValue < 0) {
                    return Text('state no 2: wifi + Negative');
                  }
                   if (internetState is InternetConnected &&
                      internetState.connectionType == ConnectionType.Mobile &&
                      counterState.counterValue < 0) {
                    return Text('state no 3: Mobile + Negative');
                  }
                   if (internetState is InternetConnected &&
                      internetState.connectionType == ConnectionType.Mobile &&
                      counterState.counterValue > 0) {
                    return Text('state no 3: Mobile + positive');
                  }

                  return Text('state default');
                },
              ),
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('WIFI');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile');
                } else if (state is InternetDisconnected) {
                  return Text("Disconnected");
                }
                return CircularProgressIndicator();
              }),
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                  builder: (context, state) {
                print("build ran");
                return Text(
                  'count is :' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                );
              }, 
              listener: (context, state) {
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
              IconButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(MyStaelessScreen.routeName);
                    Navigator.of(context).pushNamed("./statelessScreenOne");
                  },
                  icon: Icon(Icons.one_k))
            ],
          ),
        ),
      ),
    );
  }
}
