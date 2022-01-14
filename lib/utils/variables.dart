import 'package:flutter/material.dart';

enum MembroOptions { cadastrar, alterar, deletar, listar }
enum ObreiroOptions { cadastrar, alterar, deletar }
enum BasicOptions { dashboard }

Map<String, dynamic> dataOfNewMember = {};
TextEditingController dataNascimento = TextEditingController();
TextEditingController dataBatismo = TextEditingController();
TextEditingController dataAdmissao = TextEditingController();
TextEditingController dataSaida = TextEditingController();
