import 'package:flutter/material.dart';

import '../const/data_const.dart';

class HomeProvider{
  changeThameColor(String status){
    switch (status) {
      case ScreenStatus.notStart:
        return Colors.blue;
      case ScreenStatus.inProcess:
        return Colors.orange;
      case ScreenStatus.done:
       return Colors.green.shade300;
      case ScreenStatus.error:
       return Colors.red;
      case ScreenStatus.cancelled:
      return Colors.red;
      default:
       return Colors.grey;
    }
  }

  textData(String status, String data){
    switch (status) {
      case ScreenStatus.notStart:
        return data;
      case ScreenStatus.inProcess:
        return data;
      case ScreenStatus.done:
       return data;
      case ScreenStatus.error:
       return data;
      case ScreenStatus.cancelled:
       return data;
      default:
       return data;
    }
  }


}