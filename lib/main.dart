// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride; // for desktop embedder

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String helloWorld = "Hello World";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              TextToChange(helloWorld: helloWorld),
              PressToChange(x: (){
                setState(() {
      helloWorld = "hello Heaven";
    });
              })
            ],
          ),
        ),
      ),
    );
  }
}

class PressToChange extends StatelessWidget {
  final VoidCallback x;
  PressToChange({Key key, @required this.x}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => x(),
      child: Text('Change Text'),
    );
  }
}

class TextToChange extends StatelessWidget {
  const TextToChange({
    Key key,
    @required this.helloWorld,
  }) : super(key: key);

  final String helloWorld;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$helloWorld"),
    );
  }
}
