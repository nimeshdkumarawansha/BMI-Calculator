import 'package:bmicalculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 170;
  int weight = 60;
  String gender = "";
  late double bmi = calculateBmi(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: gender == "M"
                              ? Colors.orange
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 150,
                          ),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: gender == "F"
                              ? Colors.orange
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                           Text("Female"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text(
                          "$height",
                          style: kInputLabelColor,
                        ),
                        Row(children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) {
                                  height--;
                                  bmi = calculateBmi(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 250) {
                                  height++;
                                  bmi = calculateBmi(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text(
                          "$weight",
                          style: kInputLabelColor,
                        ),
                        Row(children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 30) {
                                  weight--;
                                  bmi = calculateBmi(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 200) {
                                  weight++;
                                  bmi = calculateBmi(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLabelColor,
                  ),
                  Text(getResult(bmi)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBmi({required int height, required int weight}) {
    return weight / ((height / 100) * (height / 100));
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
