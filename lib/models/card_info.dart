import 'package:flutter/material.dart';

class CardInfo {
  final String category;
  final String title;
  final Object price;
  final Color color;

  const CardInfo({
    required this.category,
    required this.title,
    required this.price,
    required this.color,
  });
}
