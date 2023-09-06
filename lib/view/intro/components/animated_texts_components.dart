import 'package:flutter/material.dart';
import '../../../res/constants.dart';

import '../../../viewmodel/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 300})
      : super(key: key);
  final double? width;
  final double? height;

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/me.jpg',
                height: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                        ? MediaQuery.sizeOf(context).width * 0.14
                        : 350,
                width: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                        ? MediaQuery.sizeOf(context).width * 0.14
                        : 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
