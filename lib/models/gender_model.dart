class GenderModel {
  int? genderId;
  String genderName;

  GenderModel(this.genderId, this.genderName);

  Map<String, dynamic> toMap() {
    return {'idGeneros': genderId, 'nomeGenero': genderName};
  }

  GenderModel.fromMap(Map<String, dynamic> map)
      : genderId = map["idGeneros"],
        genderName = map["nomeGenero"];
}
