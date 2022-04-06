import 'package:flutter/material.dart';
import 'package:projectadvance/service/uploadimage.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  String encoded = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: encoded.isNotEmpty ? Image.memory(decodeImage(encoded)) : null,
      floatingActionButton: FloatingActionButton(onPressed: () async {
        encoded = await pickImage();
        setState(() {});
      }),
    );
  }
}
