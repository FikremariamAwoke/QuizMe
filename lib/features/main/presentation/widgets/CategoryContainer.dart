///
///
/// CategoryContainer.dart
///
///

import 'package:flutter/material.dart';

// routes
import '../../../core/Route/Routes.dart';

// constants
import '../../core/constants.dart';

class CategoryContainer extends StatelessWidget {
  final index;
  final VoidCallback callback;
  const CategoryContainer({
    @required this.index,
    @required this.callback,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
        Navigator.of(context).pushNamed(Routes.QUESTIONS,
            arguments: CATEGORYLIST[index]['title']);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            top: 60,
            bottom: 10),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: CATEGORYLIST[index]['icon'],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              CATEGORYLIST[index]['title'],
              style: TextStyle(fontSize: 20),
            )
          ],
        )),
      ),
    );
  }
}
