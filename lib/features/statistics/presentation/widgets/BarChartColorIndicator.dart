///
///
/// BarChartColorIndicator.dart
///
///

import 'package:flutter/material.dart';

// circular dot
class BarChartColorIndicator extends StatelessWidget {
  final Color color;
  const BarChartColorIndicator({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
    );
  }
}
