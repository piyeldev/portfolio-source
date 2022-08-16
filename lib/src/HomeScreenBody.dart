import 'package:flutter/material.dart';
import 'Animations.dart';
import 'package:rive/rive.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  TextStyle? foregroundTextColor = const TextStyle(color: Colors.white);
  ScrollController? scrollController;
  double pixels = 0.0;

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

    scrollController = ScrollController();
    scrollController!.addListener(() {
      setState(() {
        pixels = scrollController!.position.pixels;
        print(pixels);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [],
    );
  }
}
