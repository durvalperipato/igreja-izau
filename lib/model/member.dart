import 'dart:convert';

class Member {
  String congregacao;
  int matriculaID;
  String name;
  String filiacaoPai;
  String filiacaoMae;
  String dataNascimento;
  String nacionalidade;
  String naturalidade;
  String estado;
  String estadoCivil;
  String? profissao;
  String? escolaridade;
  String? tituloEleitor;
  String? tipoCertidao;
  String? numeroCertidao;
  String? dataBatismo;
  String? igrejaBatismo;
  String? dataAdmissao;
  String rg;
  String cpf;
  String? conjuge;
  String? conjugeMatricula;
  String? conjugeCargo;
  bool membroIgreja;
  String? dataSaida;
  String? procedencia;
  String endereco;
  String? imagemURL;
  String? observacao;
  Member({
    required this.congregacao,
    required this.matriculaID,
    required this.name,
    required this.filiacaoPai,
    required this.filiacaoMae,
    required this.dataNascimento,
    required this.nacionalidade,
    required this.naturalidade,
    required this.estado,
    required this.estadoCivil,
    this.profissao,
    this.escolaridade,
    this.tituloEleitor,
    this.tipoCertidao,
    this.numeroCertidao,
    this.dataBatismo,
    this.igrejaBatismo,
    this.dataAdmissao,
    required this.rg,
    required this.cpf,
    this.conjuge,
    this.conjugeMatricula,
    this.conjugeCargo,
    this.membroIgreja = false,
    this.dataSaida,
    this.procedencia,
    required this.endereco,
    this.imagemURL,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'congregacao': congregacao,
      'matriculaID': matriculaID,
      'name': name,
      'filiacaoPai': filiacaoPai,
      'filiacaoMae': filiacaoMae,
      'dataNascimento': dataNascimento,
      'nacionalidade': nacionalidade,
      'naturalidade': naturalidade,
      'estado': estado,
      'estadoCivil': estadoCivil,
      'profissao': profissao,
      'escolaridade': escolaridade,
      'tituloEleitor': tituloEleitor,
      'tipoCertidao': tipoCertidao,
      'numeroCertidao': numeroCertidao,
      'dataBatismo': dataBatismo,
      'igrejaBatismo': igrejaBatismo,
      'dataAdmissao': dataAdmissao,
      'rg': rg,
      'cpf': cpf,
      'conjuge': conjuge,
      'conjugeMatricula': conjugeMatricula,
      'conjugeCargo': conjugeCargo,
      'membroIgreja': membroIgreja,
      'dataSaida': dataSaida,
      'procedencia': procedencia,
      'endereco': endereco,
      'imagemURL': imagemURL,
      'observacao': observacao,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      congregacao: map['congregacao'] ?? '',
      matriculaID: map['matriculaID']?.toInt() ?? 0,
      name: map['name'] ?? '',
      filiacaoPai: map['filiacaoPai'] ?? '',
      filiacaoMae: map['filiacaoMae'] ?? '',
      dataNascimento: map['dataNascimento'] ?? '',
      nacionalidade: map['nacionalidade'] ?? '',
      naturalidade: map['naturalidade'] ?? '',
      estado: map['estado'] ?? '',
      estadoCivil: map['estadoCivil'] ?? '',
      profissao: map['profissao'],
      escolaridade: map['escolaridade'],
      tituloEleitor: map['tituloEleitor'],
      tipoCertidao: map['tipoCertidao'],
      numeroCertidao: map['numeroCertidao'],
      dataBatismo: map['dataBatismo'],
      igrejaBatismo: map['igrejaBatismo'],
      dataAdmissao: map['dataAdmissao'],
      rg: map['rg'] ?? '',
      cpf: map['cpf'] ?? '',
      conjuge: map['conjuge'],
      conjugeMatricula: map['conjugeMatricula'],
      conjugeCargo: map['conjugeCargo'],
      membroIgreja: map['membroIgreja'] ?? false,
      dataSaida: map['dataSaida'],
      procedencia: map['procedencia'],
      endereco: map['endereco'] ?? '',
      imagemURL: map['imagemURL'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) => Member.fromMap(json.decode(source));
}
