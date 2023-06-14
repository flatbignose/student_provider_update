import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/data/model/data_model.dart';

import '../data/functions/db_functions.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    // final studentprovider =
    //     Provider.of<StudentListProvider>(context, listen: false);
    return Consumer<StudentListProvider>(
      builder: (context, providerModel, _) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Add A New Student'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: [
                    (providerModel.filePhoto == null)
                        ? const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage('assets/images/portfolio.png')),
                          )
                        : FittedBox(
                            fit: BoxFit.contain,
                            child: CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(
                                    File(providerModel.filePhoto!.path))),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                          onPressed: () {
                            providerModel.getPhoto();
                          },
                          child: const Text('Add Image')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: providerModel.nameController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Full Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: providerModel.ageController,
                      decoration:
                          const InputDecoration(hintText: 'Enter Your Age'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: providerModel.domainController,
                      decoration:
                          const InputDecoration(hintText: 'Enter Your Domain'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: providerModel.phoneController,
                      maxLength: 10,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Phone Number'),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        addStudentClick(
                          context,
                          providerModel.nameController,
                          providerModel.ageController,
                          providerModel.domainController,
                          providerModel.phoneController,
                        );
                        Navigator.of(context).pop();
                        providerModel.nameController.clear();
                        providerModel.ageController.clear();
                        providerModel.domainController.clear();
                        providerModel.phoneController.clear();
                        providerModel.filePhoto = null;
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Student'),
                    )
                  ],
                ),
              ),

              //Lst Student Set
            ));
      },
    );
  }

  addStudentClick(
    context,
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController domainController,
    TextEditingController phoneController,
  ) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final domain = domainController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        domain.isEmpty ||
        phone.isEmpty ||
        Provider.of<StudentListProvider>(context, listen: false)
            .filePhoto!
            .path
            .isEmpty) {
      return;
    }
    final student = StudentModel(
      name: name,
      age: age,
      domain: domain,
      phone: phone,
      photo: Provider.of<StudentListProvider>(context, listen: false)
          .filePhoto!
          .path,
    );

    Provider.of<StudentListProvider>(context, listen: false)
        .addStudent(student);
  }
}
