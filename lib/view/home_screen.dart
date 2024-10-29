import 'package:barcode/barcode.dart';
import 'package:barcode_app/const/data_const.dart';
import 'package:barcode_app/controller/barcode_controller.dart';
import 'package:barcode_app/provider/home_provider.dart';
import 'package:barcode_app/view/widgets/copy_text.dart';
import 'package:barcode_app/view/widgets/loading_barcode.dart';
import 'package:barcode_app/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.put(BarcodeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeController>(builder: (val) {
      HomeProvider homeProvider = HomeProvider();
      return Scaffold(
        backgroundColor: homeProvider.changeThameColor(val.status),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: 
                val.status == ScreenStatus.inProcess
                ? const LoadingBarcode()
                :Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: val.barcode.isEmpty && val.status == ScreenStatus.cancelled
                            ? Text(val.scanData)
                            :val.status == ScreenStatus.inProcess
                            ?const Text('')
                            : BarcodeWidget(
                                data: val.barcode,
                                code: Barcode.dataMatrix()))),
              ),
              const SizedBox(
                height: 80,
              ),
              val.status == ScreenStatus.inProcess
              ? const CircularProgressIndicator(
                color: Colors.white,
              )
              :ElevatedButton(
                onPressed: () => val.scanBarcode(context),
                child: const Text("Scan Barcode"),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: SizedBox(
                    width: 350,
                    child: val.status == ScreenStatus.done
                        ? CopyText(homeProvider: homeProvider, val: val)
                        : Text(
                          textAlign: TextAlign.center,
                            homeProvider.textData(val.status, val.scanData),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
              )
            ],
          ),
        ),
      );
    });
  }
}
