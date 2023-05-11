import 'package:flutter/material.dart';

Widget renderSearchBar(controller) {
  return TextField(
    controller: controller,
    autocorrect: false,
    style: const TextStyle(
      fontSize: 16,
    ),
    decoration: const InputDecoration(
        border: OutlineInputBorder(), labelText: 'Search Image'),
  );
}
