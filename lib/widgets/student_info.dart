import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_list/core/const.dart';

class StudentInfo extends StatefulWidget {
  final String name;
  final String age;
  final String domain;
  final String phone;
  final String photo;

  const StudentInfo(
      {super.key,
      required this.name,
      required this.age,
      required this.domain,
      required this.phone,
      required this.photo});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  int? index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(' ${widget.name}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: FileImage(
                            File(
                              widget.photo,
                            ),
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 8,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: conColor)),
                  height: size.height / 4 * 1.5,
                  width: size.width / 2 * 1.5,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: conColor,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            width: size.width,
                            height: size.height / 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Name',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                const Text(':',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                Text(widget.name,
                                    style: const TextStyle(
                                        fontSize: 20, color: textColor)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: conColor,
                            ),
                            width: size.width,
                            height: size.height / 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Age',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                const Text(':',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                Text(widget.age,
                                    style: const TextStyle(
                                        fontSize: 20, color: textColor)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: conColor,
                            ),
                            width: size.width,
                            height: size.height / 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Domain',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                const Text(':',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                Text(widget.domain,
                                    style: const TextStyle(
                                        fontSize: 20, color: textColor)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: conColor,
                            ),
                            width: size.width,
                            height: size.height / 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Phone',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                const Text(':',
                                    style: TextStyle(
                                        fontSize: 20, color: textColor)),
                                Text(widget.phone,
                                    style: const TextStyle(
                                        fontSize: 20, color: textColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
