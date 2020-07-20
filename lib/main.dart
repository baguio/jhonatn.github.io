import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(
        child: MyHeaderBox(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const TextStyle titleFont = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 78,
  color: Color.fromRGBO(29, 29, 64, 1),
  fontWeight: FontWeight.w900,
  letterSpacing: 2.4,
  height: 1.05,
);

const TextStyle messageFont = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 21,
  color: Color.fromRGBO(140, 140, 140, 1),
  fontWeight: FontWeight.w900,
  letterSpacing: 0.8,
);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class MyHeaderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderBox(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PartialHeaderBox(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 70, 0, 40),
              child: AutoSizeText.rich(
                TextSpan(
                  style: messageFont,
                  text: "",
                  children: [
                    TextSpan(text: "Jhonatan Avalos", style: titleFont),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Software developer. Mainly mobile stuff"),
                  ],
                ),
                minFontSize: 10,
              ),
            ),
          ),
          PartialHeaderBox(
            alignment: Alignment.bottomRight,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage('iphone11_cam.jpg'),),
            ),
          ),
        ],
      ),
    );
  }
}

class PartialHeaderBox extends StatelessWidget {
  final Alignment alignment;
  final Widget child;
  const PartialHeaderBox({Key key, this.alignment, this.child}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: alignment,
        child: FractionallySizedBox(
          widthFactor: 0.75,
          child: child,
        ),
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
      child: Container(
        width: screenSize(context).width,
        height: screenSize(context).height/* * 0.9*/,
        child: child,
      ),
    );
  }
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}