import 'package:flutter/material.dart';

AppBar appbar(double width) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.blue,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: const Text(
            "Todo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          Icons.edit,
          color: Colors.white,
        )
      ],
    ),
  );
}
