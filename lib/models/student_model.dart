class StudentModel {
  int? studentId;
  String studentName;
  int studentNumber;
  String studentEmail;

  StudentModel(
      this.studentId, this.studentName, this.studentNumber, this.studentEmail);
  Map<String, dynamic> toMap() {
    return {
      'nomeAlunos': studentName,
      'matriculaAlunos': studentNumber,
      'emailAlunos': studentEmail
    };
  }
}
