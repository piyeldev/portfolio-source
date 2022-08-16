import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatefulWidget {
  final Color? normalColor;
  final Color? selectedColor;
  final String? text;
  final String? label;

  final void Function()? onClick;
  final bool? isSelected;
  const NavBarItem({
    Key? key,
    required this.normalColor,
    required this.selectedColor,
    this.text,
    required this.onClick,
    this.isSelected,
    this.label,
  }) : super(key: key);

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  bool hovered = false;

  String? text = '';
  Color? selectedColor;
  Color? normalColor;

  void onHoverEffects(bool isHovered) => setState(() {
        hovered = isHovered;

        if (isHovered) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.text;
    selectedColor = widget.selectedColor;
    normalColor = widget.normalColor;
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 30,
      child: MouseRegion(
          onEnter: (event) => onHoverEffects(true),
          onExit: (event) => onHoverEffects(false),
          child: TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color?>(normalColor),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent)),
              onPressed: widget.onClick,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text.toString(),
                    style: GoogleFonts.nunito(fontSize: 25),
                  ),
                  SizedBox(
                    width: 90,
                    height: 0.8,
                    child: ScaleTransition(
                      scale: _animation,
                      child: Container(color: Colors.white),
                    ),
                  )
                ],
              ))),
    );
  }
}
