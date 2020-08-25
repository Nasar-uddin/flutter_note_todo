import 'package:flutter/foundation.dart';

class Note{
    final String body;
    final String colorName;
//    final String date;
    Note({
        @required this.body,
        this.colorName = 'white'
    });
}