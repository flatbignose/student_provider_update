import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/functions/db_functions.dart';
import '../data/model/data_model.dart';

class EditStudent extends StatelessWidget {
  final String name;
  final String age;
  final String domain;
  final String phone;
  final String photo;
  final int index;
  const EditStudent(
      {super.key,
      required this.name,
      required this.age,
      required this.domain,
      required this.phone,
      required this.photo,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(builder: (context, providerModel, _) {
      providerModel.editName = TextEditingController(text: name);
      providerModel.editAge = TextEditingController(text: age);
      providerModel.editDomain = TextEditingController(text: domain);
      providerModel.editPhone = TextEditingController(text: phone);
      return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Student'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  (providerModel.filePhoto?.path == null)
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(File(photo))),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              FileImage(File(providerModel.filePhoto!.path))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                        onPressed: () {
                          providerModel.getPhoto();
                        },
                        child: const Text('Change Image')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.editName,
                    decoration: const InputDecoration(hintText: 'Edit Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.editAge,
                    decoration: const InputDecoration(hintText: 'Edit Age'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.editDomain,
                    decoration:
                        const InputDecoration(hintText: 'Change Domain'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.editPhone,
                    decoration:
                        const InputDecoration(hintText: 'Change Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      editStudentClick(context,
                          name: providerModel.editName,
                          age: providerModel.editAge,
                          domain: providerModel.editDomain,
                          index: index,
                          phone: providerModel.editPhone,
                          photo: providerModel.filePhoto?.path ?? photo);
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text('Update Details'),
                  )
                ],
              ),
            ),

            //Lst Student Set
          ));
    });
  }

  editStudentClick(
    ctx, {
    required index,
    required TextEditingController name,
    required TextEditingController age,
    required TextEditingController domain,
    required TextEditingController phone,
    required photo,
  }) async {
    final student = StudentModel(
        name: name.text,
        age: age.text,
        domain: domain.text,
        phone: phone.text,
        photo: photo);
    Provider.of<StudentListProvider>(ctx, listen: false)
        .editStudent(index, student);
  }
}
