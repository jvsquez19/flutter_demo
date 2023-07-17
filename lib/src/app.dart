import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/providers/transaction_provider.dart';
import 'package:flutter_demo/src/screens/add_transaction_screen.dart';
import 'package:flutter_demo/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Mobile Flutter Demo Home Page';
    MaterialColor color = Colors.lightGreen;
    if(!kIsWeb){
      title = 'Mobile Flutter Demo Home Page';
      color = Colors.blueGrey;
    }
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Transaction())
    ],
    child: MaterialApp(
      title: 'Web Flutter App',
      theme: ThemeData(
        primarySwatch: color,
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Mis Finanzas'),
              bottom: const TabBar(tabs:
              <Widget>[
                Tab(child: Icon(Icons.home)),
                Tab(child: Icon(Icons.add))
              ]),
            ),
            body: TabBarView(children:
            <Widget>[
              HomeScreen(),
              AddTransactionScreen()
            ]),
          )),
    ),);
  }
}