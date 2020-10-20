import 'package:flutter/material.dart';
class ColorName{
    // ignore: non_constant_identifier_names
    static final String RED = 'red';
    // ignore: non_constant_identifier_names
    static final String WHITE = 'white';
    // ignore: non_constant_identifier_names
    static final String GERY = 'gery';
    // ignore: non_constant_identifier_names
    static final String ORANGE = 'orange';
    // ignore: non_constant_identifier_names
    static final String BLUE = 'blue';
    // ignore: non_constant_identifier_names
    static final String TEAL = 'teal';
    // ignore: non_constant_identifier_names
    static final String YELLOW = 'yellow';
}
Map<String,Color> noteColors = {
    ColorName.WHITE: Colors.white,
    ColorName.GERY: Colors.grey[300],
    ColorName.BLUE: Colors.blue[100],
    ColorName.ORANGE: Colors.orange[100],
    ColorName.RED:Colors.red[100],
};
Map<String,Map<String,Color>> noteColors2 = {
    ColorName.WHITE: {
      'bgc': Colors.white,
      'tpc': Colors.black87,
      'tsc': Colors.black45
    },
    ColorName.GERY: {
      'bgc': Colors.black54,
      'tpc': Colors.white,
      'tsc': Colors.white54
    },
    ColorName.BLUE: {
      'bgc': Colors.blue,
      'tpc': Colors.white,
      'tsc': Colors.white70
    },
    ColorName.ORANGE: {
      'bgc': Colors.orange[800],
      'tpc': Colors.white,
      'tsc': Colors.white54
    },
    ColorName.RED: {
      'bgc': Colors.red[300],
      'tpc': Colors.white,
      'tsc': Colors.white70
    },
    ColorName.TEAL: {
      'bgc': Colors.green[400],
      'tpc': Colors.white,
      'tsc': Colors.white70
    },
    ColorName.YELLOW: {
      'bgc': Colors.yellow,
      'tpc': Colors.black87,
      'tsc': Colors.black38
    }
};