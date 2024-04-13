import 'package:flutter/material.dart';

SizedBox backLeading(BuildContext context) {
  return SizedBox(
    width: 20,
    height: 20,
    child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        )),
  );
}
