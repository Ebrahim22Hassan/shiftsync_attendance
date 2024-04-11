import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppLayout {
  static getSize(context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;

  }
  static getScreenWidth(){
    return Get.width;
  }

  static getHeight (double pixels) {
    return getScreenHeight() * pixels / 100.0;
  }
  static getWidth(double pixels){
    return getScreenWidth() * pixels / 100.0;

  }
}
