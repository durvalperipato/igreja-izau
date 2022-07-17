import 'package:flutter/material.dart';

class MemberTitle extends StatelessWidget {
  const MemberTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Image.asset('assets/images/logo-empty.png'),
            const Expanded(
              child: Text(
                'IGREJA EVANGÉLICA ASSEMBLÉIA DE DEUS\nFICHA DE CADASTRAMENTO - A.D.P.F',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Matricula'),
                Text('Congregação'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
