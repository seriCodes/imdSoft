import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_app/playgroung/cubit/counter_cubit.dart';

class MyStaelessScreen extends StatelessWidget {
static const routeName = './statelessScreenOne';
  const MyStaelessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("MyStaelessScreen chec"),),
      body: Center(
        child: Column(children: [
          IconButton(onPressed: (){
BlocProvider.of<CounterCubit>(context).decrement();
          }, icon: Icon(Icons.ac_unit))
          ,
          // Builder(builder: (BuildContext  context){
          // return  Container(
// child:TextButton(
//             onPressed: () {
//               print(Scaffold.of(context).hasAppBar);
//             },
//             child: Text('hasAppBar2'),
//           ), 
/////////////////////
// child:BlocListener(listener:(context,state){
// ScaffoldMessengerState scaf = ScaffoldMessenger.of(context);
// print("lisetner MyStaelessScreen");
/////////////////////////
// scaf.showSnackBar(
//                   SnackBar(
//                     content: Text('inner lisetner'),
//                     duration: Duration(milliseconds: 600)
//                   ));
// }
           
          //  ),

//               child:BlocListener(listener:(context,state){
// ScaffoldMessengerState scaf = ScaffoldMessenger.of(context);
// scaf.showSnackBar(
//                   SnackBar(
//                     content: Text('Incremented!'),
//                     duration: Duration(milliseconds: 300),
                  // );
              // } 
              // )
            
          // ,
          Text('seperate'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text('the count is'+state.counterValue.toString());
            },
          )



        ],),
      ),
    );

  }
}