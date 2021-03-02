import 'package:flutter/material.dart';

class StoryProgressView extends StatelessWidget {
  final int position;
  final int currentIndex;
  final AnimationController animationController;

  const StoryProgressView({
    @required this.position,
    @required this.currentIndex,
    @required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animationController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContainer(double width, Color color) => Container(
        height: 3.0,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black26,
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      );
}
