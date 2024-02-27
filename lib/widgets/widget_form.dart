// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.suffixWidget,
    this.labelWidget,
    this.obsecu,
    this.validateFunc,
    this.textEditingController,
    this.textInputType,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixWidget;
  final Widget? labelWidget;
  final bool? obsecu;
  final String? Function(String?)? validateFunc;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(keyboardType: textInputType,
        controller: textEditingController,
        validator: validateFunc,
        obscureText: obsecu ?? false,
        decoration: InputDecoration(
          label: labelWidget,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.3),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffixWidget,
        ),
      ),
    );
  }
}
