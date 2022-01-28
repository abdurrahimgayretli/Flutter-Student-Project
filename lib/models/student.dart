// ignore_for_file: prefer_initializing_formals, unnecessary_this, unused_field

class Student {
  int? id;
  String? firtName;
  String? lastName;
  int? grade;
  String? _status;

  Student.witoutInfo();

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firtName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student(String firstName, String lastName, int grade) {
    this.firtName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus {
    if (this.grade! >= 50) {
      return 'Gecti';
    } else if (this.grade! >= 40) {
      return 'Butunlemeye Kaldi';
    } else {
      return 'Kaldi';
    }
  }
}
