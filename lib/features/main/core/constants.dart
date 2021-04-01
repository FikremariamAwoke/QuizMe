///
///
/// constants.dart
///
///

import 'package:flutter/material.dart';

const String ABOUT_DRAWER_ICON_TEXT = 'About';

const List<Map> DRAWERLIST = [
  {'icon': Icons.home, 'title': 'Home'},
  {'icon': Icons.stacked_line_chart, 'title': 'statistics'},
];

const List<Map> CATEGORYLIST = [
  {
    'icon': Image(
        image: AssetImage('assets/icons/riddles.png'), fit: BoxFit.contain),
    'title': 'Tricky & Brain Riddles'
  },
  {
    'icon': Image(
        image: AssetImage('assets/icons/generalKnowledge.png'),
        fit: BoxFit.contain),
    'title': 'General Knowledge'
  },
  {
    'icon': Image(
        image: AssetImage('assets/icons/computerScience.png'),
        fit: BoxFit.contain),
    'title': 'Science: Computers'
  },
  {
    'icon': Image(
        image: AssetImage('assets/icons/geography.png'), fit: BoxFit.contain),
    'title': 'Geography'
  },
  {
    'icon':
        Image(image: AssetImage('assets/icons/art.png'), fit: BoxFit.contain),
    'title': 'Art'
  },
  {
    'icon':
        Image(image: AssetImage('assets/icons/sport.png'), fit: BoxFit.contain),
    'title': 'Sport'
  },
];
