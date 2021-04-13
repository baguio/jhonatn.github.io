import 'package:flutter/cupertino.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:site/on_appear_fadein.dart';
import 'package:site/web_cupertino_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ionicons/ionicons.dart';

import 'package:site/sided_row.dart';
import 'package:site/window_sized_box.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(
        child: OnAppearFadeIn(
          delay: Duration(milliseconds: 150),
          duration: Duration(milliseconds: 550),
          child: StartBox()
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const TextStyle _titleFont = TextStyle(
  fontSize: 58,
  color: Color.fromRGBO(29, 29, 31, 1),
  fontWeight: FontWeight.w600,
  letterSpacing: -0.002,
  height: 1.05,
);

const TextStyle _messageFont = TextStyle(
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
            widthFactor: 0.8,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 70, 0, 40),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Jhonatan Avalos", style: _titleFont),
                    TextSpan(text: "\nSoftware developer. Mainly mobile stuff", style: _messageFont),
                  ],
                ),
                minFontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _linkBar(),
                _emptyFlexSpace(flex: 25),
                _phoneImage(flex: 75),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkBar() {
    final padding = EdgeInsets.all(15);
    return Container(
      padding: EdgeInsets.only(left: 25, bottom: 25),
      height: double.maxFinite,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.end,
        children: [
          WebCupertinoButton(
            child: Icon(Ionicons.logo_linkedin),
            padding: padding,
            tooltipMessage: "Linkedin",
            onPressed: () => launch("https://www.linkedin.com/in/jhonatanavalosg/")
          ),
          WebCupertinoButton(
            child: Icon(Ionicons.logo_github),
            padding: padding,
            tooltipMessage: "Github",
            onPressed: () => launch("https://github.com/baguio/")
          ),
          WebCupertinoButton(
            child: Icon(Ionicons.mail_open),
            padding: padding,
            tooltipMessage: "Email",
            onPressed: () => launch("mailto:me@jhona.tn"),
          ),
          WebCupertinoButton(
            child: Icon(Ionicons.code_slash),
            padding: padding,
            tooltipMessage: "This site's source code",
            onPressed: () => launch("https://github.com/baguio/baguio.github.io/"),
          ),
        ],
      )
    );
  }

  Widget _phoneImage({required int flex}) => Expanded(
    flex: flex,
    child: Container(
      alignment: Alignment.bottomRight,
      child: Image(
        image: AssetImage(
          'assets/iphone11_cam.jpg'
        ),
      ),
    ),
  );

  Widget _emptyFlexSpace({required int flex}) => Expanded(
    flex: flex,
    child: SizedBox.shrink(),
  );
}
