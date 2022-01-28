import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/screens/student_add.dart';
import 'package:flutter_application_1/screens/student_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

List<Student> students = [
  Student.withId(1, 'Abdurrahim', 'Gayretli', 90),
  Student.withId(2, 'Erdem', 'Efe', 25),
  Student.withId(3, 'Enes', 'Yurtsever', 45)
];
var selectedStudent = Student.withId(0, '', '', 0);
showMessage(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Islem Sonucu'),
            content: Text(message + ': ' + selectedStudent.firtName!),
          ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ogrenci Takip Sistemi'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.sosyal-destek.com/wp-content/uploads/2018/05/Facebook-profil-resmimi-de%C4%9Fi%C5%9Ftiremiyorum.jpg'),
                      ),
                      title: Text(students[index].firtName! +
                          ' ' +
                          students[index].lastName!),
                      subtitle: Text('Sinavdan Aldigi Not : ' +
                          students[index].grade.toString() +
                          ' [' +
                          students[index].getStatus +
                          ']'),
                      trailing: buildStatusIcon(students[index].grade!),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[index];
                        });
                      },
                    );
                  })),
          Text('Secili Ogrenci : ' +
              selectedStudent.firtName! +
              ' ' +
              selectedStudent.lastName!),
          flexible(context)
        ],
      ),
    );
  }

  Widget flexible(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            child: Row(
              children: const [
                Icon(Icons.add),
                Expanded(child: Text("Yeni Ogrenci")),
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentAdd(students)));
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            child: Row(
              children: const [
                Icon(Icons.update),
                Text("Guncelle"),
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentEdit(selectedStudent)));
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Row(
              children: const [
                Icon(Icons.delete),
                Text("Sil"),
              ],
            ),
            onPressed: () {
              setState(() {
                students.remove(selectedStudent);
                showMessage(context, 'Silindi');
              });
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

Widget buildStatusIcon(int? grade) {
  if (grade! >= 50) {
    return const Icon(Icons.done);
  } else if (grade >= 40) {
    return const Icon(Icons.album);
  } else {
    return const Icon(Icons.clear);
  }
}
