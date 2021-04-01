///
///
/// Timer.dart
///
///

import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          LayoutBuilder(
              builder: (context, constraints) => Container(
                    width: constraints.maxWidth * animation.value,
                    height: ((35 * (animation.value * 15)) < 35)
                        ? (35 * (animation.value * 15))
                        : 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                  )),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${(animation.value * 60).round()} sec',
                    style: TextStyle(color: Colors.white)),
                Icon(
                  Icons.timer,
                  color: Colors.white,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
