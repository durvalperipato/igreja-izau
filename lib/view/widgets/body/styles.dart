import 'package:flutter/material.dart';
import 'package:igreja_izau/utils/variables.dart';

Padding fieldTextStyle({required String name, bool validate = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
    child: SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(name),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                onSaved: (newValue) => dataOfNewMember[name] = newValue,
                validator: (value) {
                  if (validate) {
                    if (value != null && value.isEmpty) {
                      return '*** Campo obrigatório';
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Padding fieldDataStyle(
        {required String name,
        required BuildContext context,
        bool validate = false,
        TextEditingController? controller}) =>
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 95, child: Text(name)),
            SizedBox(
              width: 120,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controller,
                onSaved: (newValue) => dataOfNewMember[name] = newValue,
                validator: (value) {
                  if (validate) {
                    if (value != null && value.isEmpty) {
                      return '*** Campo obrigatório';
                    }
                  }
                },
              ),
            ),
            Flexible(
              child: IconButton(
                onPressed: () async {
                  final result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050));
                  if (result != null) {
                    String data = result.day.toString() +
                        "-" +
                        result.month.toString() +
                        "-" +
                        result.year.toString();

                    dataOfNewMember[name] = data;
                    String showData = result.day.toString() +
                        "/" +
                        result.month.toString() +
                        "/" +
                        result.year.toString();
                    if (controller != null) {
                      controller.text = showData;
                    }
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ),
          ],
        ),
      ),
    );
