import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';

class SelectInput extends StatelessWidget {
  const SelectInput({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
    required this.list,
  }) : super(key: key);

  final String title;
  final String? value;
  final void Function(String?) onChange;
  final List list;

  @override
  Widget build(BuildContext context) {
    final storeTheme = Modular.get<ThemeController>();

    return Observer(
      builder: (_) => Container(
        margin: const EdgeInsets.all(10),
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            labelText: title,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
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
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: TextStyle(
                color: storeTheme.isDarkMode ? Colors.white : Colors.deepPurple,
              ),
              underline: Container(
                height: 1,
                color: Colors.deepPurpleAccent,
              ),
              items: list.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.id.toString(),
                  child: Text(item.name),
                );
              }).toList(),
              onChanged: onChange,
            ),
          ),
        ),
      ),
    );
  }
}
