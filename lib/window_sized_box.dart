import 'package:flutter/cupertino.dart';

class WindowSizedBox extends StatelessWidget {
  final Widget child;
  const WindowSizedBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize(context).width,
      height: screenSize(context).height/* * 0.9*/,
      child: child,
    );
  }
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}