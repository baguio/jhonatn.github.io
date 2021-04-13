import 'package:flutter/cupertino.dart';

class OnAppearFadeIn extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  const OnAppearFadeIn({Key? key, required this.child, this.delay, required this.duration}) : super(key: key);

  @override
  _OnAppearFadeInState createState() => _OnAppearFadeInState(
    child: child,
    delay: delay,
    duration: duration
  );
}

class _OnAppearFadeInState extends State<OnAppearFadeIn> with TickerProviderStateMixin {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  _OnAppearFadeInState({required this.child, required this.delay, required this.duration});

  late final AnimationController _controller = AnimationController(
    duration: duration,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    
    if (delay != null) {
      Future.delayed(delay!, _controller.forward);
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: child,
      ),
    );
  }
}