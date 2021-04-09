import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertest/window_sized_box.dart';
import 'package:fluttertest/sided_row.dart';

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
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(
        child: StartBox(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const TextStyle titleFont = TextStyle(
  fontSize: 78,
  color: Color.fromRGBO(29, 29, 64, 1),
  fontWeight: FontWeight.w900,
  letterSpacing: 2.4,
  height: 1.05,
);

const TextStyle messageFont = TextStyle(
  fontSize: 21,
  color: Color.fromRGBO(140, 140, 140, 1),
  fontWeight: FontWeight.w900,
  letterSpacing: 0.8,
);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class StartBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WindowSizedBox(
      child: Column(
        children: [
          SidedRow(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 70, 0, 40),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Jhonatan Avalos", style: titleFont),
                    TextSpan(text: "\nSoftware developer. Mainly mobile stuff", style: messageFont),
                  ],
                ),
                minFontSize: 10,
              ),
            ),
          ),
          SidedRow(
            alignment: Alignment.bottomRight,
            child: OverflowBox(
              alignment: Alignment.topLeft,
              maxHeight: double.infinity,
              child: Image(
                image: AssetImage(
                  'assets/iphone11_cam.jpg'
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
