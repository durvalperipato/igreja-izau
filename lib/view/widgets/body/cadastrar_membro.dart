import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/new_member_controller.dart';
import 'package:igreja_izau/mock/congregacao_mock.dart';
import 'package:igreja_izau/model/member.dart';
import 'package:igreja_izau/utils/variables.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'styles.dart';

class CadastrarMembro extends StatelessWidget {
  CadastrarMembro({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  _save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Member newMember = Member(
        congregacao: '',
        cpf: dataOfNewMember['CPF'],
        dataNascimento: dataOfNewMember['Nascido em'],
        endereco: dataOfNewMember['Endereco'],
        estado: dataOfNewMember['Estado'],
        estadoCivil: dataOfNewMember['Estado Civil'],
        filiacaoMae: dataOfNewMember['Filiação (mãe)'],
        filiacaoPai: dataOfNewMember['e de (pai)'],
        matriculaID: 0,
        nacionalidade: dataOfNewMember['Nacionalidade'],
        name: dataOfNewMember['Nome'],
        naturalidade: dataOfNewMember['Natural de'],
        rg: dataOfNewMember['RG'],
        conjuge: dataOfNewMember['Cônjuge'],
        conjugeCargo: dataOfNewMember['Cargo'],
        conjugeMatricula: dataOfNewMember['Nº Matr'],
        dataAdmissao: dataOfNewMember['Data Admissão'],
        dataBatismo: dataOfNewMember['Batizou-se em'],
        dataSaida: dataOfNewMember['Data Saída'],
        escolaridade: dataOfNewMember['Escolaridade'],
        igrejaBatismo: dataOfNewMember['Igreja/Local'],
        imagemURL: '',
        membroIgreja: false,
        numeroCertidao: dataOfNewMember['Número'],
        observacao: '',
        procedencia: dataOfNewMember['Procedência'],
        profissao: dataOfNewMember['Profissão'],
        tipoCertidao: dataOfNewMember['Certidão de'],
        tituloEleitor: dataOfNewMember['Tit. Eleitor'],
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('DADOS SALVOS COM SUCESSO'),
        backgroundColor: Colors.green,
      ));
      dataOfNewMember.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(),
            const Divider(),
            const Fields(),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () => _save(context),
                child: const Text('ENVIAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  final NewMemberController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(flex: 1, child: Image.asset('assets/images/logo-empty.png')),
          const Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'IGREJA EVANGÉLICA ASSEMBLÉIA DE DEUS\nFICHA DE CADASTRAMENTO - A.D.P.F',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      width: 90,
                      child: Text('Matrícula'),
                    ),
                    SizedBox(
                      width: 180,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 90,
                        margin: const EdgeInsets.only(right: 10),
                        child: const Text(
                          'Congregação:',
                        )),
                    Obx(
                      () => SizedBox(
                        width: 180,
                        child: DropdownButton<String>(
                            underline: Container(),
                            value: controller.congregacao,
                            onChanged: (value) =>
                                controller.congregacao = value!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            alignment: Alignment.center,
                            items: congregacoes
                                .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      value: value,
                                    ))
                                .toList()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 10, right: 8),
                decoration: BoxDecoration(border: Border.all()),
                child: _fields(context),
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: GetBuilder<NewMemberController>(
                      builder: (controller) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all()),
                        height: 150,
                        child: GestureDetector(
                          child: Center(
                            child: controller.child,
                          ),
                          onTap: () async {
                            Image? result =
                                await ImagePickerWeb.getImageAsWidget();

                            if (result != null) {
                              controller.loadImage(result.image);
                            } else {
                              controller.child = const Placeholder();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(border: Border.all()),
                    height: 680,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                          child: Text('OBS.:'),
                        ),
                        SizedBox(
                          height: 628,
                          child: TextFormField(
                            maxLines: null,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _fields(BuildContext context) => Column(
        children: [
          fieldTextStyle(name: 'Nome', validate: true),
          fieldTextStyle(name: 'Filiação (mãe)', validate: true),
          fieldTextStyle(name: 'e de (pai)', validate: true),
          Row(
            children: [
              Expanded(
                child: fieldDataStyle(
                    name: 'Nascido em',
                    context: context,
                    validate: true,
                    controller: dataNascimento),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Nacionalidade', validate: true),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Natural de', validate: true),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Estado', validate: true),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Estado Civil', validate: true),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Profissão'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Escolaridade'),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Tit. Eleitor'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Certidão de'),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Número'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldDataStyle(
                    name: 'Batizou-se em',
                    context: context,
                    controller: dataBatismo),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Igreja/Local'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldDataStyle(
                    name: 'Data Admissão',
                    context: context,
                    controller: dataAdmissao),
              ),
              Expanded(
                child: fieldTextStyle(name: 'RG', validate: true),
              ),
              Expanded(
                child: fieldTextStyle(name: 'CPF', validate: true),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Cônjuge'),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Nº Matr'),
              ),
            ],
          ),
          fieldTextStyle(name: 'Cargo'),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const Text('Já foi membro desta igreja?'),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GetX<NewMemberController>(
                              builder: (controller) => Row(
                                children: [
                                  Radio<String>(
                                    value: 'S',
                                    groupValue: controller.radio,
                                    onChanged: (value) =>
                                        controller.radio = value!,
                                  ),
                                  const Text('SIM'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Radio<String>(
                                    value: 'N',
                                    groupValue: controller.radio,
                                    onChanged: (value) =>
                                        controller.radio = value!,
                                  ),
                                  const Text('NÃO'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: fieldDataStyle(
                    name: 'Data Saída',
                    context: context,
                    controller: dataSaida),
              ),
            ],
          ),
          fieldTextStyle(name: 'Procedência'),
          fieldTextStyle(name: 'Endereço', validate: true),
        ],
      );
}
