import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBarcode extends StatelessWidget {
  const LoadingBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.white,
            height: 300,
            width: double.infinity,
          )),
    );
  }
}
