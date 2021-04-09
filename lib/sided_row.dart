import 'package:flutter/material.dart';

class SidedRow extends StatelessWidget {
  final Alignment alignment;
  final Widget child;
  const SidedRow({Key? key, required this.alignment, required this.child}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
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
