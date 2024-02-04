import 'dart:async';

import 'package:covid19/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SpalashScrean extends StatefulWidget {
  const SpalashScrean({super.key});

  @override
  State<SpalashScrean> createState() => _SpalashScreanState();
}

class _SpalashScreanState extends State<SpalashScrean>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    AnimationController.unbounded(vsync: this);
    _controller.dispose();
    const TickerCanceled();
    super.dispose();
    context.mounted;
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  builder: ((context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * pi,
                      child: child,
                    );
                  }),
                  child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        'assets/images/covid19.png',
                        fit: BoxFit.cover,
                      ))),
              //  SizedBox(
              //  height: size.height / 100,
              //   ),
              const Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        )));
  }
}
