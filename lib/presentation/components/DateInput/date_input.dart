import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String? initialValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            suffixIcon: const Icon(Icons.calendar_today),
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
          child: TextFormField(
            initialValue: initialValue != null
                ? DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse(initialValue.toString()))
                : "",
            readOnly: true,
            onTap: onTap,
          )),
    );
  }
}
