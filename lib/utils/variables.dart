import 'package:flutter/material.dart';

enum MembroOptions { cadastrar, alterar, deletar, listar }
enum MemberStatus { ativo, inativo }
enum ObreiroOptions { cadastrar, alterar, deletar }
enum BasicOptions { dashboard }

Map<String, dynamic> dataOfNewMember = {};

Map<int, Map<String, String>> codigos = {
  001: {
    "definicao": "Definicao 01",
    "descricao": "uhiasuheda iuhiacuen poiroijrt"
  },
  002: {
    "definicao": "Definicao 02",
    "descricao": "iuwyeruiyweuwuiecnwiuecnwuienuiwyreuiwheuiwer"
  },
  003: {
    "definicao": "Definicao 03",
    "descricao":
        "JSDNNVINSKJDNVKJSDNVKJSNDVKJSDNVKJSNVKJSNDVKJSNDKJVNSKJVNSKJDNERNIJRNIUNCIUERNVIUNERIUVNERIUVNIEUVNIUERNVIUERNVIUERNVOINSIDNVLKSDNKJVNSD,F KJSDVNKJSDBVSDNVKJSDNBVLNSDIGORV JKNEVONEROVNEOIRNV"
  }
};

TextEditingController dataNascimento = TextEditingController();
TextEditingController dataBatismo = TextEditingController();
TextEditingController dataAdmissao = TextEditingController();
TextEditingController dataSaida = TextEditingController();
TextEditingController historicoController = TextEditingController();
