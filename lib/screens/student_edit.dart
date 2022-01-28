// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_initializing_formals, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student? selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent!);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  var formKey = GlobalKey<FormState>();
  Student? selectedStudent;
  _StudentEditState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ogrenciyi Guncelle'),
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
      initialValue: selectedStudent!.firtName,
      decoration:
          const InputDecoration(labelText: 'Ogrencinin Adi', hintText: 'Enes'),
      onSaved: (String? value) {
        selectedStudent!.firtName = value;
      },
      validator: validateFirstName,
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent!.lastName,
      decoration: const InputDecoration(
          labelText: 'Ogrencinin Soyadi', hintText: 'Yurtsever'),
      onSaved: (String? value) {
        selectedStudent!.lastName = value;
      },
      validator: validateLastName,
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      initialValue: selectedStudent!.grade.toString(),
      decoration: const InputDecoration(
          labelText: 'Ogrencinin Aldigi Not', hintText: '40'),
      onSaved: (String? value) {
        selectedStudent!.grade = int.parse(value!);
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
            Navigator.pop(context);
          }
        });
  }
}
