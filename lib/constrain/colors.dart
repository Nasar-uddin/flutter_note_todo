import 'package:flutter/material.dart';
class ColorName{
    static final String RED = 'red';
    static final String WHITE = 'white';
    static final String GERY = 'gery';
    static final String ORANGE = 'orange';
    static final String CYAN = 'cyan';
    static final String BLUE = 'blue';
    static final String YELLOW = 'yellow';
}
Map<String,Color> noteColors = {
    ColorName.RED:Colors.red[200],
    ColorName.WHITE: Colors.white,
    ColorName.GERY: Colors.grey[200],
    ColorName.ORANGE: Colors.orange[200],
    ColorName.CYAN: Colors.cyan[200],
    ColorName.BLUE: Colors.blue[200],
    ColorName.YELLOW: Colors.yellowAccent[200]
};