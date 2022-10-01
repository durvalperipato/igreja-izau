part of '../member_register_page.dart';

class _MemberTitleForm extends StatelessWidget {
  const _MemberTitleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 40,
        child: Text(
          'Ficha de Cadastro',
          style: TextStyle(fontSize: 30, letterSpacing: 5),
        ),
      ),
    );
  }
}
