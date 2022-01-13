import 'package:flutter/material.dart';

Padding fieldTextStyle({required String name}) => Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            /* SizedBox(width: 95, child: */ Text(name) /* ) */,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
Padding fieldDataStyle({required String name, required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            SizedBox(width: 95, child: Text(name)),
            IconButton(
              onPressed: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050)),
              icon: const Icon(Icons.calendar_today),
            )
          ],
        ),
      ),
    );
