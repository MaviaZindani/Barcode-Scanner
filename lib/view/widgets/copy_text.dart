import 'package:barcode_app/controller/barcode_controller.dart';
import 'package:barcode_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyText extends StatelessWidget {
  final HomeProvider homeProvider;
  final BarcodeController val;
  const CopyText({super.key, required this.homeProvider, required this.val});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: val.scanData));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                'Copied to clipboard',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        },
        child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
                text: homeProvider.textData(
                  val.status,
                  val.scanData,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '  \u{1F448} Click To Copy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              )
            )
          );
  }
}
