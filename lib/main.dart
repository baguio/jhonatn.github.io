import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 255),
      child: HeaderBox(
        child: Container(
          color: Colors.lightBlue,
          child: Text(
            'You have pushed the button this many times',
          ),
        )
      ),
    );
  }
}

class HeaderBox extends StatelessWidget {
  final Widget child;

  const HeaderBox({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 500
            ),
            child: AspectRatio(
              aspectRatio: 21/9,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}