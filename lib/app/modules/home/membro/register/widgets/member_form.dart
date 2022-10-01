part of '../member_register_page.dart';

typedef Member = Function({
  String? name,
  String? mother,
  String? father,
  String? birthday,
  String? nationatily,
  String? naturality,
  String? state,
  String? maritalStatus,
  String? profession,
  String? admissionDate,
  String? rg,
  String? cpf,
  String? address,
  String? addressNumber,
  String? spouse,
  String? dateBaptism,
  String? churchCityBaptism,
  String? churchName,
  String? dateChurchBaptism,
});

class _MemberForm extends StatefulWidget {
  final MemberController controller;
  final Member onTap;
  const _MemberForm({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<_MemberForm> {
  final _nameEC = TextEditingController();
  final _motherEC = TextEditingController();
  final _fatherEC = TextEditingController();
  final _birthdayEC = TextEditingController();
  final _nationalityEC = TextEditingController();
  final _naturalityEC = TextEditingController();
  final _stateEC = TextEditingController();
  final _maritalStatusEC = TextEditingController();
  final _professionEC = TextEditingController();
  final _admissionDateEC = TextEditingController();
  final _rgEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _addressEC = TextEditingController();
  final _addressNumberEC = TextEditingController();
  final _spouseEC = TextEditingController();
  final _dateBaptismEC = TextEditingController();
  final _churchNameEC = TextEditingController();
  final _churchCityBaptismEC = TextEditingController();
  final _dateChurchBaptismEC = TextEditingController();

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
    _nationalityEC.dispose();
    _naturalityEC.dispose();
    _stateEC.dispose();
    _maritalStatusEC.dispose();
    _professionEC.dispose();
    _admissionDateEC.dispose();
    _rgEC.dispose();
    _cpfEC.dispose();
    _addressEC.dispose();
    _addressNumberEC.dispose();
    _spouseEC.dispose();
    _dateBaptismEC.dispose();
    _dateBaptismEC.dispose();
    _churchNameEC.dispose();
    _churchCityBaptismEC.dispose();
    _dateChurchBaptismEC.dispose();

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
                const Text('Dados Pessoais:', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
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
                            child: FormFieldTemplate(controller: _rgEC, label: 'RG'),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: FormFieldTemplate(controller: _cpfEC, label: 'CPF'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FormFieldTemplate(controller: _addressEC, label: 'Endereço'),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: FormFieldTemplate(controller: _addressNumberEC, label: 'Número'),
                          ),
                        ],
                      ),
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
                            child: BlocSelector<MemberController, MembroState, List<String>>(
                              bloc: widget.controller,
                              selector: (state) => state.cities,
                              builder: (context, cities) => DropFormFieldTemplate(
                                  value: cities.isEmpty ? null : cities.first, items: cities, onChanged: (value) => _naturalityEC.text = value ?? '', label: 'Cidade'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: FormFieldTemplate(controller: _nationalityEC, label: 'Nacionalidade')),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DropFormFieldTemplate(
                              label: 'Estado Civil',
                              onChanged: (value) {
                                if (value != null) {
                                  _maritalStatusEC.text = value;
                                }
                              },
                              items: const ['Solteiro', 'Casado', 'Divorciado', 'União Estável'],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Informações Pessoais:', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                CategoriesFormFieldDecoration(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormFieldTemplate(controller: _motherEC, label: 'Filiação (mãe)'),
                      FormFieldTemplate(controller: _fatherEC, label: 'Filiação (pai)'),
                      FormFieldTemplate(controller: _professionEC, label: 'Profissão'),
                      FormFieldTemplate(controller: _spouseEC, label: 'Cônjuge'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Igreja:', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                CategoriesFormFieldDecoration(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FormFieldTemplate(
                              controller: _dateBaptismEC,
                              label: 'Data do batizado',
                              readOnly: true,
                              suffixIcon: const Icon(Icons.date_range),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: FormFieldTemplate(
                              controller: _admissionDateEC,
                              label: 'Data de admissão',
                              suffixIcon: const Icon(Icons.date_range),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: FormFieldTemplate(
                              controller: _dateChurchBaptismEC,
                              label: 'Data do batismo na igreja',
                              readOnly: true,
                              suffixIcon: const Icon(Icons.date_range),
                            ),
                          ),
                        ],
                      ),
                      FormFieldTemplate(controller: _churchNameEC, label: 'Nome da congregação'),
                      FormFieldTemplate(controller: _churchCityBaptismEC, label: 'Cidade de batismo'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => widget.onTap(
                      father: _fatherEC.text,
                      mother: _motherEC.text,
                      name: _nameEC.text,
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50), maximumSize: const Size(500, 50)),
                    child: const Text('Salvar'),
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
