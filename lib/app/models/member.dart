import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MemberModel {
  String? situation;
  int? memberRegistrationNumber;
  String? congregationName;
  String? memberName;
  String? fatherMemberName;
  String? motherMemberName;
  DateTime? dateBirth;
  String? nationality;
  String? cityBirth;
  String? stateBirth;
  String? maritalStatus;
  String? dateBaptism;
  String? churchBaptism;
  String? cityBaptism;
  String? admissionDate;
  String? cpf;
  String? rg;
  String? spouse;
  String? origination;
  String? streetAvenue;
  int? number;
  String? note;
  MemberModel({
    this.situation,
    this.memberRegistrationNumber,
    this.congregationName,
    this.memberName,
    this.fatherMemberName,
    this.motherMemberName,
    this.dateBirth,
    this.nationality,
    this.cityBirth,
    this.stateBirth,
    this.maritalStatus,
    this.dateBaptism,
    this.churchBaptism,
    this.cityBaptism,
    this.admissionDate,
    this.cpf,
    this.rg,
    this.spouse,
    this.origination,
    this.streetAvenue,
    this.number,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'situation': situation,
      'memberRegistrationNumber': memberRegistrationNumber,
      'congregationName': congregationName,
      'memberName': memberName,
      'fatherMemberName': fatherMemberName,
      'motherMemberName': motherMemberName,
      'dateBirth': dateBirth?.millisecondsSinceEpoch,
      'nationality': nationality,
      'cityBirth': cityBirth,
      'stateBirth': stateBirth,
      'maritalStatus': maritalStatus,
      'dateBaptism': dateBaptism,
      'churchBaptism': churchBaptism,
      'cityBaptism': cityBaptism,
      'admissionDate': admissionDate,
      'CPF': cpf,
      'RG': rg,
      'spouse': spouse,
      'origination': origination,
      'streetAvenue': streetAvenue,
      'number': number,
      'note': note,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      situation: map['situation'] != null ? map['situation'] as String : null,
      memberRegistrationNumber: map['memberRegistrationNumber'] != null ? map['memberRegistrationNumber'] as int : null,
      congregationName: map['congregationName'] != null ? map['congregationName'] as String : null,
      memberName: map['memberName'] != null ? map['memberName'] as String : null,
      fatherMemberName: map['fatherMemberName'] != null ? map['fatherMemberName'] as String : null,
      motherMemberName: map['motherMemberName'] != null ? map['motherMemberName'] as String : null,
      dateBirth: map['dateBirth'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateBirth'] as int) : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
      cityBirth: map['cityBirth'] != null ? map['cityBirth'] as String : null,
      stateBirth: map['stateBirth'] != null ? map['stateBirth'] as String : null,
      maritalStatus: map['maritalStatus'] != null ? map['maritalStatus'] as String : null,
      dateBaptism: map['dateBaptism'] != null ? map['dateBaptism'] as String : null,
      churchBaptism: map['churchBaptism'] != null ? map['churchBaptism'] as String : null,
      cityBaptism: map['cityBaptism'] != null ? map['cityBaptism'] as String : null,
      admissionDate: map['admissionDate'] != null ? map['admissionDate'] as String : null,
      cpf: map['CPF'] != null ? map['CPF'] as String : null,
      rg: map['RG'] != null ? map['RG'] as String : null,
      spouse: map['spouse'] != null ? map['spouse'] as String : null,
      origination: map['origination'] != null ? map['origination'] as String : null,
      streetAvenue: map['streetAvenue'] != null ? map['streetAvenue'] as String : null,
      number: map['number'] != null ? map['number'] as int : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) => MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(situation: $situation, memberRegistrationNumber: $memberRegistrationNumber, congregationName: $congregationName, memberName: $memberName, fatherMemberName: $fatherMemberName, motherMemberName: $motherMemberName, dateBirth: $dateBirth, nationality: $nationality, cityBirth: $cityBirth, stateBirth: $stateBirth, maritalStatus: $maritalStatus, dateBaptism: $dateBaptism, churchBaptism: $churchBaptism, cityBaptism: $cityBaptism, admissionDate: $admissionDate, cpf: $cpf, rg: $rg, spouse: $spouse, origination: $origination, streetAvenue: $streetAvenue, number: $number, note: $note)';
  }
}
