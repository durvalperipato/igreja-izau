import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/new_member_controller.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'styles.dart';

class CadastrarMembro extends StatelessWidget {
  const CadastrarMembro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: const [Header(), Fields()],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
                  children: [
                    const SizedBox(width: 80, child: Text('Matrícula')),
                    SizedBox(width: 180, child: TextFormField())
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                        width: 80,
                        child: Text(
                          'Congressão',
                        )),
                    SizedBox(width: 180, child: TextFormField())
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
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(border: Border.all()),
                    height: 500,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                          child: Text('OBS.:'),
                        ),
                        SizedBox(
                          height: 468,
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
          fieldTextStyle(name: 'Nome'),
          fieldTextStyle(name: 'Filiação (mãe)'),
          fieldTextStyle(name: 'e de (pai)'),
          Row(
            children: [
              Expanded(
                child: fieldDataStyle(name: 'Nascido em', context: context),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Nacionalidade'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Natural de'),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Estado'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Estado Civil'),
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
                child: fieldDataStyle(name: 'Batizou-se em', context: context),
              ),
              Expanded(
                child: fieldTextStyle(name: 'Igreja/Local'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: fieldDataStyle(name: 'Data Admissão', context: context),
              ),
              Expanded(
                child: fieldTextStyle(name: 'RG'),
              ),
              Expanded(
                child: fieldTextStyle(name: 'CPF'),
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
          Row(
            children: [
              Expanded(
                child: fieldTextStyle(name: 'Já foi membro desta igreja?'),
              ),
              Expanded(
                child: fieldDataStyle(name: 'Data Saída', context: context),
              ),
            ],
          ),
          fieldTextStyle(name: 'Procedência'),
          fieldTextStyle(name: 'Endereço'),
        ],
      );
}
