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
}
Map<String,Color> noteColors = {
    ColorName.WHITE: Colors.white,
    ColorName.GERY: Colors.grey[300],
    ColorName.BLUE: Colors.blue[100],
    ColorName.ORANGE: Colors.orange[100],
    ColorName.RED:Colors.red[100],
};