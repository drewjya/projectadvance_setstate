import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final bool? enabled;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;

  const TextBox(
      {Key? key,
      this.color,
      this.width,
      required this.title,
      this.enabled,
      this.onTap,
      this.controller,
      this.hintText,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: color != null ? 12.5 : 0,
          ),
          (onTap != null)
              ? InkWell(
                  onTap: onTap,
                  child: TextField(
                    controller: controller,
                    enabled: enabled,
                    decoration: InputDecoration(
                        // fillColor: Colors.grey,
                        // filled: enabled == false,
                        hintText: hintText,
                        focusedBorder: color != null
                            ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  width: width ?? 1.0,
                                  color: color ?? const Color(0xFF000000),
                                ))
                            : null,
                        enabledBorder: color != null
                            ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  width: width ?? 1.0,
                                  color: color ?? const Color(0xFF000000),
                                ))
                            : null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: width ?? 1.0,
                            color: color ?? const Color(0xFF000000),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    cursorHeight: 30,
                    keyboardType: keyboardType,
                  ),
                )
              : TextField(
                  controller: controller,
                  enabled: enabled,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: enabled == false,
                      focusedBorder: color != null
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                width: width ?? 1.0,
                                color: color ?? const Color(0xFF000000),
                              ))
                          : null,
                      enabledBorder: color != null
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                width: width ?? 1.0,
                                color: color ?? const Color(0xFF000000),
                              ))
                          : null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: width ?? 1.0,
                          color: color ?? const Color(0xFF000000),
                        ),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  cursorHeight: 30,
                  keyboardType: keyboardType,
                ),
        ],
      ),
    );
  }
}
