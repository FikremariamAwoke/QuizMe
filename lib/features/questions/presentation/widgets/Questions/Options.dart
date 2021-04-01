///
///
/// Options.dart
///
///

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({
    Key key,
    this.text,
    this.index,
    this.press,
    this.status,
  }) : super(key: key);
  final String text;
  final int index;
  final int status;
  final VoidCallback press;

  getColor() {
    if (status == 0) return Colors.grey;
    if (status == 1) return Colors.green;
    if (status == -1) return Colors.red;
  }

  getIcon() {
    if (status == 1)
      return Icon(
        Icons.done,
        color: Colors.white,
      );
    if (status == -1)
      return Icon(
        Icons.close,
        color: Colors.white,
      );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: getColor()),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${index + 1}) $text",
                overflow: TextOverflow.visible,
                style: TextStyle(fontSize: 16, color: getColor()),
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getColor()),
                  color: (status == 0) ? Colors.white : getColor()),
              child: Center(
                child: getIcon(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
