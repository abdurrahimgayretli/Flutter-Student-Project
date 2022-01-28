// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_initializing_formals, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student>? students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students!);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.witoutInfo();
  var formKey = GlobalKey<FormState>();
  List<Student>? students;
  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Yeni Ogrenci Ekle'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeNameField(),
                  buildSubmitButton(),
                ],
              )),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Ogrencinin Adi', hintText: 'Enes'),
      onSaved: (String? value) {
        student.firtName = value;
      },
      validator: validateFirstName,
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Ogrencinin Soyadi', hintText: 'Yurtsever'),
      onSaved: (String? value) {
        student.lastName = value;
      },
      validator: validateLastName,
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Ogrencinin Aldigi Not', hintText: '40'),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
      validator: validateGrade,
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: const Text('Kaydet'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            students!.add(student);
            Navigator.pop(context);
          }
        });
  }
}
