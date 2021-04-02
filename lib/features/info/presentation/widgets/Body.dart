///
///
/// Body.dart
///
///

import 'package:flutter/material.dart';

// constants
import '../../../core/constants.dart';
import '../../core/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // app name
          Row(
            children: [
              Text(INFO.APP_PREFIX,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text(QUIZ.APP_NAME,
                  style: TextStyle(color: Colors.black, fontSize: 16))
            ],
          ),
          SizedBox(height: 5),

          // app version
          Row(
            children: [
              Text(INFO.VERSION_PREFIX,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text(QUIZ.VERSION,
                  style: TextStyle(color: Colors.black, fontSize: 16))
            ],
          ),
          SizedBox(height: 5),

          // app built with
          Row(
            children: [
              Text(INFO.BUILT_WITH_PREFIX,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text(INFO.BUILT_WITH_DATA,
                  style: TextStyle(color: Colors.black, fontSize: 16))
            ],
          ),
          SizedBox(height: 5),

          // developer
          Row(
            children: [
              Text(INFO.DEVELOPER_PREFIX,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text(INFO.DEVELOPER_Data,
                  style: TextStyle(color: Colors.black, fontSize: 16))
            ],
          ),
          SizedBox(height: 5),

          // developer email
          Row(
            children: [
              Text(INFO.EMAIL_PREFIX,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              Text(INFO.EMAIL_DATA,
                  style: TextStyle(color: Colors.black, fontSize: 16))
            ],
          ),
        ],
      ),
    );
  }
}
