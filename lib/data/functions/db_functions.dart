import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../model/data_model.dart';



class StudentListProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController editName = TextEditingController();
  TextEditingController editAge = TextEditingController();
  TextEditingController editDomain = TextEditingController();
  TextEditingController editPhone = TextEditingController();

  File? filePhoto;

  void getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      final photoTemp = File(photo.path);
      filePhoto = photoTemp;
    }
    notifyListeners();
  }

List<StudentModel> studentModel = [];
List<StudentModel> foundUser = [];

  void addStudent(StudentModel value) async {
    final mybox = await Hive.openBox<StudentModel>('myBox');
    // ignore: no_leading_underscores_for_local_identifiers
    await mybox.add(value);
    studentModel.add(value);
    getAllStudents();
    notifyListeners();
  }




  Future<void> getAllStudents() async {
    final myBox = await Hive.openBox<StudentModel>('myBox');
    studentModel.clear();
    studentModel.addAll(myBox.values);
    foundUser = studentModel;
    notifyListeners();
  }

  void deleteStudent(int id) async {
    final mybox = await Hive.openBox<StudentModel>('myBox');
    await mybox.deleteAt(id);
    getAllStudents();
    notifyListeners();
  }

  void editStudent(int index, StudentModel value) async {
    final mybox = await Hive.openBox<StudentModel>('myBox');
    mybox.putAt(index, value);
    getAllStudents();
    notifyListeners();
  }

    Future<void> searchResult(String text) async {
    List<StudentModel> result = [];
    if (text.isEmpty) {
      result = studentModel;
    } else {
      result = studentModel
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    foundUser = result;
    notifyListeners();
  }
}
