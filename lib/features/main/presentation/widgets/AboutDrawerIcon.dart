///
///
/// AboutDrawerIcon
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

class AboutDrawerIcon extends StatelessWidget {
  const AboutDrawerIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //hide drawer
        BlocProvider.of<MainBloc>(context).add(DrawerHideEvent());
        // navigate to about page
        Navigator.of(context).pushNamed(Routes.About);
      },
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            ABOUT_DRAWER_ICON_TEXT,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
