import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Workaround: Current implementation of CupertinoButton lacks mouse related implementations
// Because of this, it doesn't show the right cursor when built for web
class WebCupertinoButton extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final String tooltipMessage;

  WebCupertinoButton({
    Key? key,
    required this.child,
    this.padding,
    required this.tooltipMessage,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltipMessage,
        child: CupertinoButton(
          child: child,
          padding: padding,
          onPressed: onPressed,
        ),
      ),
    );
}