///
///
/// HomeScreen.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../presentation/bloc/main_bloc.dart';

// widgets
import './CategoryContainer.dart';

// constants
import '../../core/constants.dart';
import '../../../core/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  ScrollController _controller;
  String title = '';

  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.offset > 220 && !_controller.position.outOfRange) {
        // SliverAppBar is collapsed show title
        setState(() {
          title = QUIZ.APP_NAME;
        });
      }
      if (_controller.offset <= 220 && !_controller.position.outOfRange) {
        setState(() {
          // SliverAppBar is expanded hide title
          title = '';
        });
      }
    });
  }

  showDrawer() {
    setState(() {
      if (isDrawerOpen) {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
      } else {
        xOffset = 230;
        yOffset = MediaQuery.of(context).size.height * 0.15;
        scaleFactor = 0.7;
      }
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        showDrawer();
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular((isDrawerOpen) ? 40 : 0),
        ),
        padding: EdgeInsets.only(top: (isDrawerOpen) ? 30 : 0),
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            Container(
              child: SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                collapsedHeight: MediaQuery.of(context).size.height * 0.09,
                backgroundColor: Colors.white,
                elevation: 1,
                pinned: true,
                leading: IconButton(
                    icon: Icon(
                      (isDrawerOpen) ? Icons.arrow_back_ios : Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (!isDrawerOpen)
                        return BlocProvider.of<MainBloc>(context)
                            .add(DrawerShowEvent());
                      BlocProvider.of<MainBloc>(context).add(DrawerHideEvent());
                    }),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  background: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Image(
                      image: AssetImage('assets/icons/quiz.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return CategoryContainer(
                index: index,
                callback: () {
                  if (isDrawerOpen)
                    BlocProvider.of<MainBloc>(context).add(DrawerHideEvent());
                },
              );
            }, childCount: CATEGORYLIST.length))
          ],
        ),
      ),
    );
  }
}
