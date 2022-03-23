import 'package:flutter/material.dart';

class AnimatedMenuIcon extends StatefulWidget {
  final VoidCallback onPressed;
  const AnimatedMenuIcon({Key? key, required this.onPressed,}) : super(key: key);

  @override
  _AnimatedMenuIconState createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isArrow = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250,),);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(_isArrow){
          _controller.forward();
          _isArrow = false;
        }
        else{
          _controller.reverse();
          _isArrow = true;
        }
        widget.onPressed();
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: _controller,
        semanticLabel: 'Show menu',
      ),
    );
  }
}