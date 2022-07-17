// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormFieldTemplate extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final Icon? suffixIcon;
  final VoidCallback? onTap;
  const FormFieldTemplate({
    Key? key,
    required this.controller,
    required this.label,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          label: Text(label),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
