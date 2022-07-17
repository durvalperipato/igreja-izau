// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/core/ui/categories_form_field_decoration.dart';
import 'package:igreja_izau/app/core/ui/drop_form_field_template.dart';
import 'package:igreja_izau/app/core/ui/form_field_template.dart';
import 'package:igreja_izau/app/modules/home/membro/controller/membro_controller.dart';

class MemberForm extends StatefulWidget {
  final MemberController controller;
  const MemberForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final _nameEC = TextEditingController();
  final _motherEC = TextEditingController();
  final _fatherEC = TextEditingController();
  final _birthdayEC = TextEditingController();
  final _nacionalityEC = TextEditingController();
  final _naturalityEC = TextEditingController();
  final _stateEC = TextEditingController();
  final _maritalStatusEC = TextEditingController();
  final _professionEC = TextEditingController();
  final _numberOfCertificateEC = TextEditingController();
  final _christeningDateEC = TextEditingController();
  final _churchLocalEC = TextEditingController();
  final _admissionDateEC = TextEditingController();
  final _rgEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _departureDateEC = TextEditingController();
  final _addressEC = TextEditingController();
  final _addressNumberEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _motherEC.dispose();
    _fatherEC.dispose();
    _birthdayEC.dispose();
    _nacionalityEC.dispose();
    _naturalityEC.dispose();
    _stateEC.dispose();
    _maritalStatusEC.dispose();
    _professionEC.dispose();
    _numberOfCertificateEC.dispose();
    _christeningDateEC.dispose();
    _churchLocalEC.dispose();
    _admissionDateEC.dispose();
    _rgEC.dispose();
    _cpfEC.dispose();
    _departureDateEC.dispose();
    _addressEC.dispose();
    _addressNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dados Pessoais:',
                    style:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                CategoriesFormFieldDecoration(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormFieldTemplate(
                          controller: _nameEC,
                          label: 'Nome',
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return 'Campo obrigatório';
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: FormFieldTemplate(
                              controller: _birthdayEC,
                              label: 'Data de Nascimento',
                              readOnly: true,
                              suffixIcon: const Icon(Icons.date_range),
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                );
                                if (date != null) {
                                  _birthdayEC.text = date.toIso8601String();
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: FormFieldTemplate(
                                controller: _rgEC, label: 'RG'),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: FormFieldTemplate(
                                controller: _cpfEC, label: 'CPF'),
                          ),
                        ],
                      ),
                      FormFieldTemplate(
                          controller: _addressEC, label: 'Endereço'),
                      Row(
                        children: [
                          Expanded(
                            child: DropFormFieldTemplate(
                              label: 'Estado',
                              onChanged: (value) {
                                if (value != null) {
                                  _stateEC.text = value;
                                  widget.controller.getCitiesByUF(uF: value);
                                }
                              },
                              items: const [
                                'AC',
                                'AL',
                                'AP',
                                'AM',
                                'BA',
                                'CE',
                                'DF',
                                'ES',
                                'GO',
                                'MA',
                                'MT',
                                'MS',
                                'MG',
                                'PA',
                                'PB',
                                'PR',
                                'PE',
                                'PI',
                                'RJ',
                                'RN',
                                'RS',
                                'RO',
                                'RR',
                                'SC',
                                'SP',
                                'SE',
                                'TO',
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: BlocSelector<MemberController, MembroState,
                                List<String>>(
                              bloc: widget.controller,
                              selector: (state) => state.cities,
                              builder: (context, cities) =>
                                  DropFormFieldTemplate(
                                      value:
                                          cities.isEmpty ? null : cities.first,
                                      items: cities,
                                      onChanged: (value) =>
                                          _naturalityEC.text = value ?? '',
                                      label: 'Cidade'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Informações:',
                    style:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                CategoriesFormFieldDecoration(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormFieldTemplate(
                          controller: _motherEC, label: 'Filiação (mãe)'),
                      FormFieldTemplate(
                          controller: _fatherEC, label: 'Filiação (pai)'),
                      FormFieldTemplate(
                          controller: _nacionalityEC, label: 'Nacionalidade'),
                      DropFormFieldTemplate(
                        label: 'Estado Civil',
                        onChanged: (value) {
                          if (value != null) {
                            _maritalStatusEC.text = value;
                          }
                        },
                        items: const [
                          'Solteiro',
                          'Casado',
                          'Divorciado',
                          'União Estável'
                        ],
                      ),
                      FormFieldTemplate(
                          controller: _professionEC, label: 'Profissão'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Igreja:',
                    style:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                CategoriesFormFieldDecoration(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFieldTemplate(
                        controller: _christeningDateEC,
                        label: 'Data do batizado',
                        readOnly: true,
                        suffixIcon: const Icon(Icons.date_range),
                      ),
                      FormFieldTemplate(
                          controller: _churchLocalEC, label: 'Igreja/Local'),
                      FormFieldTemplate(
                        controller: _admissionDateEC,
                        label: 'Data de admissão',
                        suffixIcon: const Icon(Icons.date_range),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 50),
          child: SizedBox(
            width: 200,
            child: Column(
              children: const [
                SizedBox(
                  height: 200,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: Placeholder(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
