import 'package:flutter/material.dart';

Widget renderSearchBar(controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextField(
      controller: controller,
      autocorrect: false,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Search Image'),
    ),
  );
}
