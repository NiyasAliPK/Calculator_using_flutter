import 'package:calculator/app/modules/home/views/widgets/calculator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GetBuilder<HomeController>(builder: (_) {
                        return Text(
                          _homeController.text.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                          ),
                        );
                      }))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('AC', Colors.grey, Colors.black),
                CalculatorButton('+/-', Colors.grey, Colors.black),
                // CalculatorButton('%', Colors.grey, Colors.black),
                SizedBox(width: 25),
                CalculatorButton('/', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('7', Colors.grey[850], Colors.white),
                CalculatorButton('8', Colors.grey[850], Colors.white),
                CalculatorButton('9', Colors.grey[850], Colors.white),
                CalculatorButton('x', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('4', Colors.grey[850], Colors.white),
                CalculatorButton('5', Colors.grey[850], Colors.white),
                CalculatorButton('6', Colors.grey[850], Colors.white),
                CalculatorButton('-', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('1', Colors.grey[850], Colors.white),
                CalculatorButton('2', Colors.grey[850], Colors.white),
                CalculatorButton('3', Colors.grey[850], Colors.white),
                CalculatorButton('+', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //this is button Zero
                ElevatedButton(
                  onPressed: () {
                    _homeController.calculation('0');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    shape: StadiumBorder(),
                    backgroundColor: Colors.grey[850],
                  ),
                  child: CalculatorButton('0', Colors.grey[850], Colors.white),
                ),
                CalculatorButton('.', Colors.grey[850], Colors.white),
                CalculatorButton('=', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
