import 'package:flutter/material.dart';
class ColorName{
    static final String RED = 'red';
    static final String WHITE = 'white';
    static final String GERY = 'gery';
    static final String ORANGE = 'orange';
    static final String BLUE = 'blue';
}
Map<String,Color> noteColors = {
    ColorName.WHITE: Colors.white,
    ColorName.GERY: Colors.grey[300],
    ColorName.BLUE: Colors.blue[200],
    ColorName.ORANGE: Colors.orange[200],
    ColorName.RED:Colors.red[200],
};