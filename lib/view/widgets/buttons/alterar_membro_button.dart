import 'package:flutter/material.dart';

class AlterarMembroButton extends StatelessWidget {
  const AlterarMembroButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 8.0, left: 15, right: 15),
      child: ElevatedButton(
        onPressed: () => '',
        child: const Text('Alterar'),
      ),
    );
  }
}
