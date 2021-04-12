import 'package:flutter/cupertino.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:site/sided_row.dart';
import 'package:site/window_sized_box.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
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
  fontSize: 68,
  color: Color.fromRGBO(29, 29, 31, 1),
  fontWeight: FontWeight.w600,
  letterSpacing: -0.002,
  height: 1.05,
);

const TextStyle messageFont = TextStyle(
  fontSize: 18,
  color: Color.fromRGBO(134, 134, 139, 1),
  fontWeight: FontWeight.w400,
  letterSpacing: -0.022,
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
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.bottomRight,
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
