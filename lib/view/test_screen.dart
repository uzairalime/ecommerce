import 'dart:developer';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool selected = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Orders",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: Color.fromRGBO(34, 34, 34, 1)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selected
                            ? Color.fromRGBO(34, 34, 34, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                            fontSize: 16,
                            color: selected
                                ? Colors.white
                                : Color.fromRGBO(34, 34, 34, 1)),
                      ),
                    ),
                  ),
                  Text(
                    "Processing",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(34, 34, 34, 1)),
                  ),
                  Text(
                    "Cancelled",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(34, 34, 34, 1)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.9,
                    height: height * 0.26,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text(
                                "Order №1947034",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(34, 34, 34, 1)),
                              ),
                              Text(
                                "05-12-2019",
                                style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(155, 155, 155, 1)),
                              ),
                            ]),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Tracking Number:  ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                            ),
                            Text(
                              "IW3475453455",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(34, 34, 34, 1)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(34, 34, 34, 1)),
                            ),
                            Spacer(),
                            Text(
                              "Total Amount:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "112\$",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(34, 34, 34, 1)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(34, 34, 34, 1)),
                              ),
                            ),
                            Text(
                              "Delivered",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(42, 169, 82, 1)),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
