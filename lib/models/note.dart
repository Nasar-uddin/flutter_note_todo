import 'package:flutter/foundation.dart';

class Note{
    final String title;
    final String body;
    final String colorName;
//    final String date;
    Note({
        @required this.title,
        @required this.body,
        this.colorName = 'yellow'
    });
}