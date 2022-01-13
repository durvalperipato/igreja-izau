import 'package:flutter/material.dart';

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
                    const Text('Matrícula: '),
                    SizedBox(width: 80, child: TextFormField())
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Congressão: '),
                    SizedBox(width: 80, child: TextFormField())
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
              child: _fields(context),
            ),
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(border: Border.all()),
                    height: 180,
                    child: Center(
                      child: IconButton(
                        onPressed: () => '',
                        icon: const Icon(Icons.photo_camera),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(border: Border.all()),
                    height: 600,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                          child: Text('OBS.:'),
                        ),
                        SizedBox(
                          height: 568,
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
