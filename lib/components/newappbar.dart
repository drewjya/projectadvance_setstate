import 'package:flutter/material.dart';

class NewAppBar extends AppBar {
  final String text;
  // ignore: overridden_fields
  final Widget? lead;
  final bool? autoImplyReading;
  NewAppBar({Key? key, required this.text, this.autoImplyReading, this.lead})
      : super(
          key: key,
          leading: lead,
          automaticallyImplyLeading: autoImplyReading == null ? false : true,
          backgroundColor: const Color.fromARGB(255, 22, 98, 160),
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        );
}

  // // final String title;

  // // NewAppBar({required this.title});

  // build() {
  //   return AppBar(
      // automaticallyImplyLeading: false,
      // backgroundColor: const Color.fromARGB(255, 22, 98, 160),
      // title: Text(
      //   title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w800,
      //   ),
      // ),
  //   );