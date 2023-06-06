import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:student_list/data/functions/db_functions.dart';
import 'package:student_list/widgets/edit_student.dart';
import 'package:student_list/widgets/student_info.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return Consumer<StudentListProvider>(
        builder: (context, providerModel, _) => Container(
          height: 500,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 220, 248, 198),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final data = providerModel.foundUser[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (ctx) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => EditStudent(
                                  name: data.name!,
                                  age: data.age!,
                                  domain: data.domain!,
                                  phone: data.phone!,
                                  photo: data.photo!,
                                  index: index,
                                )));
                      },
                      icon: Icons.edit,
                      backgroundColor: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    SlidableAction(
                      onPressed: (ctx) {
                        Provider.of<StudentListProvider>(context, listen: false)
                            .deleteStudent(index);
                      },
                      icon: Icons.delete,
                      backgroundColor: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => StudentInfo(
                          name: data.name!,
                          age: data.age!,
                          domain: data.domain!,
                          phone: data.phone!,
                          photo: data.photo!,
                        ),
                      ));
                    },
                    leading: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File(data.photo!))),
                    ),
                    title: Text(data.name!),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: providerModel.foundUser.length,
          ),
        ),
      );
    }
  }
}
