import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:sliver_tools_example/page/news_page.dart';
// import 'package:sliver_tools_example/provider/news_provider.dart';
import './playgroung/Sliver/mysliver.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Sliver Tools';

  @override
  Widget build(BuildContext context) => 
  // ChangeNotifierProvider(
        // create: (context) => NewsProvider(),
          MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.red),
          home: MySliver(),
        //             home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Sliver Tools'),
        // ),
        // body: CustomScrollView(
        //   slivers: [
        //     Center(child: Text("my sliver1"))],
        // )
        // // CustomScrollView(
        // // slivers: buildNews(news: provider.newsSections),
        // // ),
        // ),

        );
        
      // );
}