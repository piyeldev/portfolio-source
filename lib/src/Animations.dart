import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final String? text;
  final TextStyle? textStyle;
  final Duration? duration;
  const TypingTextAnimation(
      {Key? key, this.text, this.textStyle, this.duration})
      : super(key: key);

  @override
  State<TypingTextAnimation> createState() => _TypingTextAnimationState();
}

class _TypingTextAnimationState extends State<TypingTextAnimation>
    with SingleTickerProviderStateMixin<TypingTextAnimation> {
  String? text;
  TextStyle? textStyle;
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.text;
    textStyle = widget.textStyle;
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = IntTween(begin: 0, end: text!.length).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Text(
            text!.substring(0, animation.value),
            style: textStyle,
          );
        });
  }
}
