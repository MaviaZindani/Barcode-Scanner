import 'package:barcode/barcode.dart';
import 'package:barcode_app/const/data_const.dart';
import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BarcodeController extends GetxController{
  String _scanData = ScreenStatus.notStart;
  String get scanData => _scanData;

  String _status = ScreenStatus.notStart;
  String get status => _status;

  bool _isScanning = false;
  bool get isScanning => _isScanning;

  String _barcode = '';
  String get barcode => _barcode;


  Future scanBarcode(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      _scanData = ScreenStatus.inProcessText;
      _status = ScreenStatus.inProcess;
      _isScanning = true;
      update();

      Future.delayed(const Duration(seconds: 3), () {
      if(result.type == ResultType.Barcode) {
       _barcode = result.format.value.toString();
       _status = ScreenStatus.done;
       _scanData = result.rawContent;
        update();
      }else if(result.type == ResultType.Cancelled) {
        _scanData = ScreenStatus.cancelledText;
        _status = ScreenStatus.cancelled;
        update();

      }else{
        _scanData = ScreenStatus.errorText;
        _status = ScreenStatus.error;
        update();
      } 
      });
    } catch (e) {
      print("Error scanning barcode: $e");
    }
  }
}



