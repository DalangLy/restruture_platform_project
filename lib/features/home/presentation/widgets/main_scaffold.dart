import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  final Widget body;
  final Widget drawer;
  final AppBar appBar;
  final Widget endDrawer;
  const MainScaffold({Key? key, required this.body, required this.drawer, required this.appBar, required this.endDrawer,}) : super(key: key);

  static _MainScaffoldState of(BuildContext context){
    return context.findAncestorStateOfType()!;
  }

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250,),);
    _animation = Tween<double>(begin: 1, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn,),);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _openedDrawer = true;

  void toggleDrawer(){
    if(_openedDrawer){
      final TickerFuture f = _controller.forward();
      f.whenComplete(() {
        setState(() {
          _openedDrawer = false;
        });
      });
    }
    else{
      final TickerFuture f = _controller.reverse();
      f.whenComplete(() {
        setState(() {
          _openedDrawer = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: widget.endDrawer,
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  widthFactor: _animation.value,
                  child: SizedBox(
                    width: 300,
                    child: widget.drawer,
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                widget.appBar,
                Expanded(
                  child: widget.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}