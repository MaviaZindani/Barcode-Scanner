import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeWidget extends StatelessWidget {
  final String data;
  final Barcode code;

  BarcodeWidget({required this.data, required this.code});

  @override
  Widget build(BuildContext context) {
    final String svg = code.toSvg(data, width: 200, height: 300);
    
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: SvgPicture.string(
          svg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}