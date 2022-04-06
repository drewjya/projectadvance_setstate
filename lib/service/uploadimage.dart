import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as prosess;
import 'dart:convert';

Future pickImage() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.image,
    allowCompression: true,
  );
  if (result != null) {
    File file = File(result.files.first.path!);
    String extention = result.files.first.extension!;
    final res = prosess.decodeImage(
      file.readAsBytesSync(),
    );

    if (extention.toLowerCase() == "png") {
      return base64Encode(prosess.encodePng(res!));
    } else if (extention.toLowerCase() == "jpg" ||
        extention.toLowerCase() == "jpeg") {
      return base64Encode(prosess.encodeJpg(res!));
    } else if (extention.toLowerCase() == "bmp") {
      return base64Encode(prosess.encodeBmp(res!));
    }
  }
}

decodeImage(String text) {
  final _byteImage = Base64Decoder().convert(text);
  return _byteImage;
}
