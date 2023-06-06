import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/app_bar_widgets.dart';
import 'package:student_list/data/functions/db_functions.dart';
import 'package:student_list/widgets/add_student.dart';
import 'package:student_list/widgets/list_student.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentListProvider>(context, listen: false).getAllStudents();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddStudent(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                const Appbarwidgets(title: 'BCK80 STUDENTS'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CupertinoSearchTextField(
                    
                    itemColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) =>
                        Provider.of<StudentListProvider>(context, listen: false)
                            .searchResult(value),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
                const ScreenList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
