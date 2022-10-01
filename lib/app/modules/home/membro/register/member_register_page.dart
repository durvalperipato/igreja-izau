// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/modules/home/membro/controller/membro_controller.dart';

import '../../../../core/ui/categories_form_field_decoration.dart';
import '../../../../core/ui/drop_form_field_template.dart';
import '../../../../core/ui/form_field_template.dart';

part 'widgets/member_form.dart';
part 'widgets/member_title.dart';
part 'widgets/member_title_form.dart';

class MemberRegisterPage extends StatelessWidget {
  final MemberController controller;

  const MemberRegisterPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const _MemberTitle(),
        const Divider(
          thickness: 2,
        ),
        const _MemberTitleForm(),
        const Divider(
          thickness: 2,
        ),
        Form(
          key: formKey,
          child: _MemberForm(
            controller: controller,
            onTap: (
                {address,
                addressNumber,
                admissionDate,
                birthday,
                churchCityBaptism,
                churchName,
                cpf,
                dateBaptism,
                dateChurchBaptism,
                father,
                maritalStatus,
                mother,
                name,
                nationatily,
                naturality,
                profession,
                rg,
                spouse,
                state}) async {
              final formValidate = formKey.currentState?.validate() ?? false;
              if (formValidate) {
                await controller.sendData(
                  address: address,
                  addressNumber: addressNumber,
                  admissionDate: admissionDate,
                  birthday: birthday,
                  churchCityBaptism: churchCityBaptism,
                  churchName: churchName,
                  cpf: cpf,
                  dateBaptism: dateBaptism,
                  dateChurchBaptism: dateChurchBaptism,
                  father: father,
                  maritalStatus: maritalStatus,
                  mother: mother,
                  name: name,
                  nationatily: nationatily,
                  naturality: nationatily,
                  profession: profession,
                  rg: rg,
                  spouse: spouse,
                  state: state,
                );
              }
            },
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
