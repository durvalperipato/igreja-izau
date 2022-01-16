import 'package:flutter/material.dart';

enum MembroOptions { cadastrar, alterar, deletar, listar }
enum MemberStatus { ativo, inativo }
enum ObreiroOptions { cadastrar, alterar, deletar }
enum BasicOptions { dashboard }

Map<String, dynamic> dataOfNewMember = {};
Map<int, Map<String, String>> codigos = {
  001: {"definicao": "Def01", "descricao": "uhiasuheda iuhiacuen poiroijrt"},
  002: {"definicao": "Def02", "descricao": "uhiasuheda iuhiacuen poiroijrt"}
};

TextEditingController dataNascimento = TextEditingController();
TextEditingController dataBatismo = TextEditingController();
TextEditingController dataAdmissao = TextEditingController();
TextEditingController dataSaida = TextEditingController();
