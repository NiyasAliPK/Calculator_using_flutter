import 'package:calculator/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorButton extends GetView {
  final String btntxt;
  final Color? btncolor;
  final Color? txtcolor;
  final HomeController _homeController = Get.put(HomeController());

  CalculatorButton(this.btntxt, this.btncolor, this.txtcolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_homeController.numOne != null) {
            _homeController.calculation(btntxt);
          }
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
