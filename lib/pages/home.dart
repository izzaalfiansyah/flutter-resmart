// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resmart/constant.dart';
import 'package:get/get.dart';

class ScreenState extends GetxController {
  RxList items = List.of([
    {
      'icon': Icons.chair_outlined,
      'text': 'Kursi Tamu',
    },
    {
      'icon': Icons.lightbulb_outline,
      'text': 'Lampu Rumah',
    },
    {
      'icon': Icons.bathroom_outlined,
      'text': 'Kran Kamar Mandi',
    },
    {
      'icon': Icons.tv_outlined,
      'text': 'Televisi',
    },
    {
      'icon': Icons.lock_open_outlined,
      'text': 'Kunci Rumah',
    },
    {
      'icon': Icons.window_outlined,
      'text': 'Jendela',
    },
  ]).obs;
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenState state = Get.put(ScreenState());

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Helo ',
                        ),
                        TextSpan(
                          text: 'Alfiansyah',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '!'),
                      ],
                    ),
                  ),
                  Text(
                    'Semoga hari anda menyenangkan',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadowBase,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '20 C',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lorem ipsum dolor'),
                      Text(
                        'cerah agak berawan',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.items.length,
                itemBuilder: ((context, index) {
                  var item = state.items[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.showSnackbar(GetSnackBar(
                              message: 'Anda mengakses ${item['text']}',
                              duration: Duration(seconds: 2),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              boxShadow: shadowBase,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  item['icon'],
                                  color: Colors.pink,
                                  size: 80,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item['text'],
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
