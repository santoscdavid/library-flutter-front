import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.title,
    required this.icon,
    required this.margin,
    required this.onSave,
    required this.validator,
    required this.initialValue,
    this.focus,
    this.changeFocus,
    this.textInputType,
    this.inputFormatter,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final double margin;
  final FocusNode? focus;
  final FocusNode? changeFocus;
  final void Function(String?) onSave;
  final String? Function(String?) validator;
  final String? initialValue;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        keyboardType: textInputType ?? TextInputType.text,
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
          labelText: title,
        ),
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatter,
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
