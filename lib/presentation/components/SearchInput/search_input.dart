import 'package:flutter/material.dart';
import 'package:library_flutter/app/utils/sized_config.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key, required this.onChange}) : super(key: key);

  final void Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
      height: SizeConfig().heightSize(context, 6),
      width: SizeConfig().widthSize(context, 50),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          isDense: true,
          suffixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
