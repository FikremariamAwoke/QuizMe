///
///
/// MainScreenLayout.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../presentation/bloc/main_bloc.dart';

// route
import '../../../core/Route/Routes.dart';

// constants
import '../../core/constants.dart';
import '../../../core/constants.dart';

// Widgets
import './AboutDrawerIcon.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerScreen();
  }
}

class _DrawerScreen extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: QUIZ.APP_COLOR,
      padding: EdgeInsets.only(top: 40, left: 20, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            QUIZ.APP_NAME,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var element in DRAWERLIST)
                  InkWell(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context).add(DrawerHideEvent());
                      if (element['title'] == DRAWERLIST[1]['title'])
                        Navigator.of(context).pushNamed(Routes.STATISTICS);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            element['title'],
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
          AboutDrawerIcon()
        ],
      ),
    );
  }
}
