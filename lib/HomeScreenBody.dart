import 'package:flutter/material.dart';
import 'package:portfolio/Animations.dart';
import 'package:rive/rive.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  TextStyle? foregroundTextColor = const TextStyle(color: Colors.white);

  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: const Center(
                  child: TypingTextAnimation(
                duration: Duration(seconds: 3),
                text: 'Hi There!, Scroll down slowly!',
                textStyle: TextStyle(color: Colors.white, fontSize: 80),
              )),
            ))
      ],
    );
  }
}
