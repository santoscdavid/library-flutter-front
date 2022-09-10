import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.title,
    required this.icon,
    required this.margin,
    this.focus,
    this.changeFocus,
    required this.onSave,
    required this.validator,
    required this.initialValue,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final double margin;
  final FocusNode? focus;
  final FocusNode? changeFocus;
  final void Function(String?) onSave;
  final String? Function(String?) validator;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            suffixIcon: icon,
            suffixIconColor: Colors.deepPurple,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.purple,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.deepPurple,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: title),
        textInputAction: TextInputAction.next,
        focusNode: focus,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(changeFocus);
        },
        onSaved: onSave,
        validator: validator,
      ),
    );
  }
}
