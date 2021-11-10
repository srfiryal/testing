import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter background Locator'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _getUrlFromTxt(context),
            child: Text('Run Function')
          ),
        )
      ),
    );
  }

  _getUrlFromTxt(BuildContext context) async {
    String text = await DefaultAssetBundle.of(context).loadString('assets/docs.txt');
    List<String> lines = LineSplitter().convert(text);
    for (String line in lines) {
      if(line.contains('baseUrl')) {
        List<String> words = line.split(' ');
        print(words[1]);
      }
    }

    // text = await rootBundle.loadString('assets/docs.txt');
  }

}
