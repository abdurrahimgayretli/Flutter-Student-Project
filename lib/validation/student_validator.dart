class StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value!.length < 2) {
      return 'Isim en az iki karekter icermelidir';
    }
  }

  String? validateLastName(String? value) {
    if (value!.length < 2) {
      return 'Soyadi en az iki karekter icermelidir';
    }
  }

  String? validateGrade(String? value) {
    var grade = int.parse(value!);
    if (grade < 0 || grade > 100) {
      return 'Not 0-100 arasinda olmalidir.';
    }
  }
}
