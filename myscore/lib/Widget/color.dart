import 'package:flutter/material.dart';

class ColorUtils {
  static final Map<String, Color> _colorMap = {
    'สายสีเขียว': Colors.green,
    'สายสีเขียวเข้ม': const Color.fromARGB(255, 43, 110, 45),
    'สายสีน้ำเงิน': const Color.fromARGB(255, 0, 94, 255),
    'สายสีม่วง': Colors.purple,
    'สายสีส้ม': Colors.orange,
    'สายสีทอง': Colors.amber,
    'สายสีแดง': Colors.red,
    'สายสีแดงอ่อน': Colors.redAccent,
    'สายสีเหลือง': Colors.yellow,
    'สายสีชมพู': Colors.pink,
  };

  static Color getColorByLine(String line) {
    return _colorMap.putIfAbsent(line, () => Colors.black);
  }
}
